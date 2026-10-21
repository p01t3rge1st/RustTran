//! Recovered 0x50da40 device decisions, charging PI and high-pressure injection.
//! COM properties are explicit state; setter callbacks and the event dispatcher
//! remain outside this block. Arguments are bound at original 0x51de72–0x51dee5.
use crate::{
    Result,
    controller::{ControllerInputs, InjectionCurve},
    native_globals::NativeGlobals,
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryDeviceControls {
    pub letdown_percent: i16,
    pub letdown_manual: bool,
    /// Original collection 0x56c indices 0/1 (injection) and 2 (charging).
    pub pump_percent: [i16; 3],
    pub pump_manual: [bool; 3],
    /// Original collection 0x4a4 index 0, properties 9 and 8.
    pub auxiliary_percent: i16,
    pub auxiliary_manual: bool,
    /// Original coordinator seeds the PI output scratch from rtcGetErl, ordinal
    /// 605. This is a runtime error-line value, not the simulation/wall clock.
    pub runtime_erl: i32,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryDevicesRequest {
    pub globals: NativeGlobals,
    pub controls: PrimaryDeviceControls,
    pub curve: InjectionCurve,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryDeviceUpdate {
    pub controls: PrimaryDeviceControls,
    pub curve: InjectionCurve,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryDevicesOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    pub controls: PrimaryDeviceControls,
    pub controller_output: f32,
    /// Branch selection only; original log formatting/COM callbacks excluded.
    pub events: BTreeMap<String, bool>,
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if x.is_finite() && v.is_finite() {
        Ok(v)
    } else {
        Err("primary device Single overflow".into())
    }
}
impl NativeGlobals {
    pub fn advance_primary_devices(
        &mut self,
        controls: &PrimaryDeviceControls,
        curve: &InjectionCurve,
    ) -> Result<PrimaryDevicesOutput> {
        let mut c = controls.clone();
        let level = self.single(0x54b4a0)?;
        let minimum = self.single(0x54b1d0)?;
        let pressure = self.single(0x54b494)?;
        let clock = self.single(0x54b40c)?;
        let mut latch_time = self.single(0x54b45c)?;
        let mut flag = self.integer(0x54b4e0)?;
        let wld = self.single(0x54b16c)?;
        let chg = self.single(0x54b170)?;
        let mut previous_error = self.single(0x54ba2c)?;
        let mut controller_output = controls.runtime_erl as f32;
        let mut events = BTreeMap::from([
            ("low_primary_pressure".into(), false),
            ("high_containment_pressure".into(), false),
            ("low_steam_pressure".into(), false),
            ("manual_injection".into(), false),
        ]);
        if level > minimum && c.letdown_percent == 0 && !c.letdown_manual {
            c.letdown_percent = 100;
        }
        // The original calculates flow before this update's command transitions.
        let letdown = single(
            f64::from(c.letdown_percent) * f64::from(wld) / 100.
                + f64::from(self.single(0x54b6b4)?),
        )?;
        let mut selected_cause = false;
        if flag == 0 {
            let cause = if pressure <= self.single(0x54b158)? {
                Some("low_primary_pressure")
            } else if self.single(0x54b544)? >= self.single(0x54b584)? {
                Some("high_containment_pressure")
            } else if self.single(0x54b4fc)? < self.single(0x54b58c)?
                || self.single(0x54b500)? < self.single(0x54b58c)?
            {
                Some("low_steam_pressure")
            } else {
                None
            };
            if let Some(cause) = cause {
                flag = 1;
                selected_cause = true;
                events.insert(cause.into(), true);
            }
        }
        if !selected_cause {
            if flag == 0 && pressure <= self.single(0x54b590)? && level < self.single(0x54b588)? {
                flag = 1;
            } else if latch_time > clock
                && c.pump_percent[0]
                    .checked_add(c.pump_percent[1])
                    .ok_or("native injection command I16 overflow")?
                    == 200
            {
                flag = 1;
                events.insert("manual_injection".into(), true);
            }
        }
        if latch_time > clock && flag == 1 {
            for i in 0..2 {
                if c.pump_percent[i] == 0 && !c.pump_manual[i] {
                    c.pump_percent[i] = 100;
                }
            }
            if c.letdown_percent == 100 && !c.letdown_manual {
                c.letdown_percent = 0;
            }
            if c.pump_percent[2] == 100 && !c.pump_manual[2] {
                c.pump_percent[2] = 0;
            }
            c.letdown_manual = true;
            if c.auxiliary_percent == 100 && !c.auxiliary_manual {
                c.auxiliary_percent = 0;
            }
            latch_time = clock;
        }
        let charging = if flag == 0 && !c.pump_manual[2] {
            if chg == 0. {
                return Err("zero native charging capacity".into());
            }
            let out = ControllerInputs {
                measured: level,
                target: self.single(0x54b6d4)?,
                proportional_band: 1.,
                output: controller_output,
                previous_error,
                gain: -500.,
                integral_time: 30.,
                step: self.single(0x54b414)?,
                lower: single(-f64::from(wld) / f64::from(chg))?,
                upper: 1.,
            }
            .advance()?;
            previous_error = out.previous_error;
            controller_output = out.output;
            let flow = single(f64::from(chg) * f64::from(controller_output) + f64::from(wld))?;
            if flow > 1. && c.pump_percent[2] == 0 {
                c.pump_percent[2] = 100;
            } else if flow < 1. && c.pump_percent[2] == 100 {
                c.pump_percent[2] = 0;
            }
            flow
        } else {
            single(f64::from(c.pump_percent[2]) * f64::from(chg) / 100.)?
        };
        let sum = c.pump_percent[0]
            .checked_add(c.pump_percent[1])
            .ok_or("native injection command I16 overflow")?;
        let injection = single(f64::from(curve.evaluate(pressure)?) * f64::from(sum) / 100.)?;
        let singles = BTreeMap::from([
            ("0x54ba1c".into(), injection),
            ("0x54ba28".into(), charging),
            ("0x54b6b0".into(), letdown),
            ("0x54b45c".into(), latch_time),
            ("0x54ba2c".into(), previous_error),
        ]);
        let integers = BTreeMap::from([("0x54b4e0".into(), i32::from(flag))]);
        self.singles.extend(singles.clone());
        self.integers.extend(integers.clone());
        Ok(PrimaryDevicesOutput {
            singles,
            integers,
            controls: c,
            controller_output,
            events,
        })
    }
}

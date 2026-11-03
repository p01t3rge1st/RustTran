//! Containment spray 0x50252b–0x5032be, with original caller pointers.
//! Explicit COM state; callbacks, text formatting and error UI are excluded.
use crate::{Result, native_globals::NativeGlobals, physics};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentSprayControls {
    /// Collection 0x4a4[0], property9; shared with primary devices.
    pub auxiliary_percent: i16,
    /// Collection 0x4f4[0], properties8/9. Physical identity remains unbound.
    pub isolation_manual: bool,
    pub isolation_percent: i16,
    /// Collection 0x55c[0/1], properties5/4.
    pub pump_percent: [i16; 2],
    pub pump_manual: [bool; 2],
    /// Collection 0x51c property15; shared with the supply producer.
    pub mode: i16,
    /// Collection 0x554[0] property0; shared with containment fans.
    pub exchanger_percent: i16,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentSprayRequest {
    pub globals: NativeGlobals,
    pub controls: ContainmentSprayControls,
}
#[derive(Clone, Debug, Serialize)]
pub struct ContainmentSprayOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    pub controls: ContainmentSprayControls,
    /// Original caller-local EBP-0x34, consumed by the containment balance.
    pub outlet_temperature: f32,
    /// Original caller-local EBP-0x2c; not the whole shared BA24 source sum.
    pub return_flow: f32,
    pub auto_activated: bool,
    pub pump_latched: bool,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("containment spray Single overflow".into())
    }
}
impl NativeGlobals {
    /// Missing sources or arithmetic failures preserve globals and commands.
    pub fn advance_containment_spray(
        &mut self,
        c: &ContainmentSprayControls,
    ) -> Result<ContainmentSprayOutput> {
        let temperature = self.single(0x54b548)?;
        let saturation = physics::saturation_pressure(temperature)?;
        let pressure = self.single(0x54b544)?;
        let threshold = self.single(0x54b294)?;
        let clock = self.single(0x54b40c)?;
        let mut activation_time = self.single(0x54b448)?;
        let mut latch = self.integer(0x54b486)?;
        let mut controls = c.clone();
        let auto_activated = latch == 0 && (pressure >= threshold || clock > activation_time);
        if auto_activated {
            activation_time = clock;
            latch = 1;
            if controls.auxiliary_percent == 100 && !controls.isolation_manual {
                controls.isolation_percent = 0;
            }
            for i in 0..2 {
                if controls.pump_percent[i] == 0 && !controls.pump_manual[i] {
                    controls.pump_percent[i] = 100;
                }
            }
        }
        let sum = controls.pump_percent[1]
            .checked_add(controls.pump_percent[0])
            .ok_or("containment spray I16 sum overflow")?;
        let flow = single(f64::from(sum) * f64::from(self.single(0x54b298)?) / 100.)?;
        let enthalpy = physics::hfld(saturation)?;
        let pump_latched = controls.pump_percent.contains(&100) && latch == 0;
        if pump_latched {
            activation_time = clock;
            latch = 1;
        }
        let cold = self.single(0x54b72c)?;
        let (heat, outlet_temperature, return_flow) = if controls.mode == 1 {
            let ambient = f64::from(self.single(0x54b160)?);
            let denominator = 300. - ambient;
            let flow_denominator = f64::from(flow) + 1.;
            if denominator == 0. || flow_denominator == 0. {
                return Err("singular containment spray cooling denominator".into());
            }
            // Native Double store 0x5031a7: no intermediate Single rounding.
            let heat = (f64::from(sum) * f64::from(self.single(0x54b2c8)?) / 200.)
                * (f64::from(temperature) - ambient)
                / denominator;
            let heat = single(heat * f64::from(controls.exchanger_percent) / 100.)?;
            let outlet = single(f64::from(temperature) - f64::from(heat) / flow_denominator - 32.)?;
            (heat, outlet.max(cold), flow)
        } else {
            (0., cold, 0.)
        };
        let singles = BTreeMap::from([
            ("0x54bb14".into(), flow),
            ("0x54bb1c".into(), enthalpy),
            ("0x54bb20".into(), saturation),
            ("0x54bb24".into(), heat),
            ("0x54b448".into(), activation_time),
        ]);
        let integers = BTreeMap::from([("0x54b486".into(), i32::from(latch))]);
        self.singles.extend(singles.clone());
        self.integers.extend(integers.clone());
        Ok(ContainmentSprayOutput {
            singles,
            integers,
            controls,
            outlet_temperature,
            return_flow,
            auto_activated,
            pump_latched,
        })
    }
}

//! Original 0x510850 supply/injection/recirculation control body.
//! Explicit stateful COM controls; logging, callbacks and error UI excluded.
use crate::{Result, controller::InjectionCurve, native_globals::NativeGlobals};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SupplyControls {
    pub mode: i16,
    pub pump_percent: [i16; 2],
    pub pump_manual: [bool; 2],
    pub exchanger_percent: i16,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SupplyUpdate {
    pub controls: SupplyControls,
    pub curve: InjectionCurve,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SupplyRequest {
    pub globals: NativeGlobals,
    pub controls: SupplyControls,
    pub curve: InjectionCurve,
}
#[derive(Clone, Debug, Serialize)]
pub struct SupplyOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    pub controls: SupplyControls,
    pub return_flow: f32,
    pub level_command: Option<f32>,
    pub activated: bool,
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if x.is_finite() && v.is_finite() {
        Ok(v)
    } else {
        Err("supply-system Single overflow".into())
    }
}
impl NativeGlobals {
    pub fn advance_supply_system(
        &mut self,
        controls: &SupplyControls,
        curve: &InjectionCurve,
    ) -> Result<SupplyOutput> {
        let mut g = self.clone();
        let mut c = controls.clone();
        let p = g.single(0x54b494)?;
        let mut flag = g.integer(0x54b4e8)?;
        let mut event = g.single(0x54b454)?;
        let activated = p <= g.single(0x54b1c4)? && flag == 0 && c.mode == 0;
        if activated {
            flag = 1;
            event = g.single(0x54b40c)?;
            for i in 0..2 {
                if c.pump_percent[i] == 0 && !c.pump_manual[i] {
                    c.pump_percent[i] = 100;
                }
            }
            c.mode = 0;
        }
        let sum = c.pump_percent[0]
            .checked_add(c.pump_percent[1])
            .ok_or("supply pump sum exceeds native I16")?;
        let mut flow = single(f64::from(curve.evaluate(p)?) * f64::from(sum) / 100.)?;
        let mut heat = 0.;
        let mut other_heat = 0.;
        let mut reference_flow = 0.;
        let mut return_flow = 0.;
        let mut level_command = None;
        let mut volume = g.single(0x54ba40)?;
        let mut enthalpy = g.single(0x54b72c)?;
        if c.mode == 2 {
            let threshold = single(f64::from(g.single(0x54b2fc)?) * 30.)?;
            if threshold > p {
                let cold = g.single(0x54b160)?;
                let denominator = 300. - f64::from(cold);
                if denominator == 0. {
                    return Err("zero supply exchanger temperature interval".into());
                }
                let base = single(
                    f64::from(sum) * f64::from(g.single(0x54b578)?) / 100.
                        * (f64::from(g.single(0x54b694)?) - f64::from(cold))
                        / denominator,
                )?;
                heat = single(f64::from(base) * f64::from(c.exchanger_percent) / 100.)?;
                reference_flow = single(f64::from(curve.evaluate(100.)?) * f64::from(sum) / 100.)?;
            }
            flow = 0.;
        } else if c.mode == 1 {
            let cold = g.single(0x54b160)?;
            let hot = g.single(0x54b548)?;
            let denominator = 300. - f64::from(cold);
            if denominator == 0. {
                return Err("zero supply exchanger temperature interval".into());
            }
            let base = single(
                f64::from(sum) * f64::from(g.single(0x54b578)?) / 100.
                    * (f64::from(hot) - f64::from(cold))
                    / denominator,
            )?;
            other_heat = single(f64::from(base) * f64::from(c.exchanger_percent) / 100.)?;
            return_flow = single(f64::from(g.single(0x54ba1c)?) + f64::from(flow))?;
            if f64::from(return_flow) + 1. == 0. {
                return Err("zero supply recirculation enthalpy denominator".into());
            }
            enthalpy = single(
                f64::from(hot) - 32. - f64::from(other_heat) / (f64::from(return_flow) + 1.),
            )?;
            enthalpy = enthalpy.max(single(f64::from(cold) - 32.)?);
        } else {
            c.mode = 0;
            let out = crate::supply_tank::SupplyTankInputs {
                volume,
                injection_flow: flow,
                flow_a: g.single(0x54ba1c)?,
                flow_b: g.single(0x54bb14)?,
                step: g.single(0x54b414)?,
                minimum_volume: g.single(0x54b580)?,
                initial_volume: g.single(0x54b57c)?,
            }
            .deplete()?;
            volume = out.volume;
            if out.recirculation_required {
                c.mode = 1;
                level_command = out.level_command;
            }
        }
        let singles = [
            (0x54ba20, flow),
            (0x54b454, event),
            (0x54b6e0, heat),
            (0x54ba38, other_heat),
            (0x54b2e8, reference_flow),
            (0x54ba40, volume),
            (0x54b72c, enthalpy),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect::<BTreeMap<_, _>>();
        let integers = BTreeMap::from([("0x54b4e8".into(), i32::from(flag))]);
        g.singles.extend(singles.clone());
        g.integers.extend(integers.clone());
        *self = g;
        Ok(SupplyOutput {
            singles,
            integers,
            controls: c,
            return_flow,
            level_command,
            activated,
        })
    }
}

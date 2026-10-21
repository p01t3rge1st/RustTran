//! Saturated vessel mass/energy balance, original numeric body 0x501e60.
//! Pressure is psia, vapor mass fraction dimensionless, volume ft³,
//! flows lb/s, enthalpy Btu/lb and heat Btu/s. No plant dispatcher or UI.
use crate::{Result, physics};
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SaturatedInputs {
    pub pressure: f32,
    pub fraction: f32,
    pub inflow: f32,
    pub inflow_enthalpy: f32,
    pub outflow: f32,
    pub heat: f32,
    pub volume: f32,
    pub pressure_work: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct SaturatedOutput {
    pub fraction_derivative: f32,
    pub pressure_derivative: f32,
    pub trace: SaturatedTrace,
}
#[derive(Clone, Debug, Serialize)]
pub struct SaturatedTrace {
    pub delta: f32,
    pub dhg: f32,
    pub dvg: f32,
    pub dhf: f32,
    pub dvf: f32,
    pub mass: f32,
    pub enthalpy: f32,
    pub a: f32,
    pub b: f32,
    pub c: f32,
    pub d: f32,
    pub e: f32,
    pub f: f32,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("saturated balance Single overflow".into())
    }
}
/// 0x49a3f0. Strict native thresholds: >100 -> 10, >10 -> 2, else P/10.
pub fn pressure_difference_step(pressure: f32) -> Result<f32> {
    if !pressure.is_finite() {
        return Err("non-finite pressure step input".into());
    }
    single(if pressure > 100. {
        10.
    } else if pressure > 10. {
        2.
    } else {
        f64::from(pressure) / 10.
    })
}
impl SaturatedInputs {
    pub fn derivatives(&self) -> Result<SaturatedOutput> {
        let d = |value: f32| f64::from(value);
        if [
            self.pressure,
            self.fraction,
            self.inflow,
            self.inflow_enthalpy,
            self.outflow,
            self.heat,
            self.volume,
            self.pressure_work,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.pressure <= 0.
            || self.volume <= 0.
        {
            return Err("invalid saturated balance input".into());
        }
        let vg = physics::vapor_specific_volume(self.pressure)?;
        let vf = physics::vfld(self.pressure)?;
        let hg = physics::hgas(self.pressure)?;
        let hf = physics::hfld(self.pressure)?;
        let delta = pressure_difference_step(self.pressure)?;
        let lower = single(d(self.pressure) - d(delta))?;
        let upper = single(d(self.pressure) + d(delta))?;
        if delta == 0. || lower <= 0. {
            return Err("invalid saturated finite difference interval".into());
        }
        let dhg = single((d(physics::hgas(upper)?) - d(physics::hgas(lower)?)) / 2. / d(delta))?;
        let dvg = single(
            (d(physics::vapor_specific_volume(upper)?) - d(physics::vapor_specific_volume(lower)?))
                / 2.
                / d(delta),
        )?;
        let dhf = single((d(physics::hfld(upper)?) - d(physics::hfld(lower)?)) / 2. / d(delta))?;
        let dvf = single((d(physics::vfld(upper)?) - d(physics::vfld(lower)?)) / 2. / d(delta))?;
        let x = d(self.fraction);
        let specific = (1. - x) * d(vf) + x * d(vg);
        if specific == 0. {
            return Err("saturated mixture specific volume is zero".into());
        }
        let mass = single(d(self.volume) / specific)?;
        if mass == 0. {
            return Err("saturated mixture mass is zero".into());
        }
        let enthalpy = single((1. - x) * d(hf) + x * d(hg))?;
        let a = single((d(vg) - d(vf)) * d(mass))?;
        let b = single(((1. - x) * d(dvf) + x * d(dvg)) * d(mass))?;
        let c = single((d(self.outflow) - d(self.inflow)) * specific)?;
        let latent = single(d(hg) - d(hf))?;
        let e = single(
            ((d(self.inflow_enthalpy) - d(enthalpy)) * d(self.inflow)
                - (d(hg) - d(enthalpy)) * d(self.outflow)
                + d(self.heat))
                / d(mass),
        )?;
        let f = single((1. - x) * d(dhf) + x * d(dhg) - specific * d(self.pressure_work))?;
        let denominator = d(f) * d(a) - d(latent) * d(b);
        if denominator == 0. {
            return Err("singular saturated balance".into());
        }
        let pressure_derivative = single((d(e) * d(a) - d(latent) * d(c)) / denominator)?;
        let fraction_derivative = single((d(f) * d(c) - d(e) * d(b)) / denominator)?;
        Ok(SaturatedOutput {
            fraction_derivative,
            pressure_derivative,
            trace: SaturatedTrace {
                delta,
                dhg,
                dvg,
                dhf,
                dvf,
                mass,
                enthalpy,
                a,
                b,
                c,
                d: latent,
                e,
                f,
            },
        })
    }
}

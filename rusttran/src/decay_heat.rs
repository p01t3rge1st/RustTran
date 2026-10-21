//! Alternate decay heat: numerical body of 0x52cbc0, ending at 0x52d12e.
//! Eleven exponential groups and the two late-time correction branches.
use crate::Result;
use serde::{Deserialize, Serialize};
const WEIGHTS: [f64; 11] = [
    0.598, 1.65, 3.1, 3.87, 2.33, 1.29, 0.462, 0.328, 0.17, 0.0865, 0.114,
];
const RATES: [f64; 11] = [
    1.772, 0.5774, 0.06743, 0.006214, 0.0004739, 4.81e-5, 5.344e-6, 5.716e-7, 1.036e-7, 2.959e-8,
    7.585e-10,
];
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct DecayHeatInputs {
    pub time: f64,
    pub power: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct DecayHeatOutput {
    pub heat: f64,
}
impl DecayHeatInputs {
    pub fn calculate(&self) -> Result<DecayHeatOutput> {
        if !self.time.is_finite() || self.time < 0. || !self.power.is_finite() {
            return Err("invalid alternate decay-heat operands".into());
        }
        let mut current = 0.;
        let mut irradiated = 0.;
        for (weight, rate) in WEIGHTS.into_iter().zip(RATES) {
            current += (-rate * self.time).exp() * weight;
        }
        for (weight, rate) in WEIGHTS.into_iter().zip(RATES) {
            irradiated += (-rate * (57_600_000. + self.time)).exp() * weight;
        }
        let mut heat = (current * 1.1 - irradiated) * 10.8;
        if self.time > 60_000. {
            heat += (-3.41e-6 * self.time).exp() * 3.304;
        } else if self.time >= 10_000. {
            heat +=
                ((self.time / 10_000. - 1.) * 0.2).sqrt() * 3.304 * (-3.41e-6 * self.time).exp();
        }
        let heat = 0.95 * heat * 1000. * f64::from(self.power) / 2500.;
        if !heat.is_finite() {
            return Err("alternate decay-heat overflow".into());
        }
        Ok(DecayHeatOutput { heat })
    }
}

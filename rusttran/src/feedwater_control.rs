//! Bounded pressure PI and heat partition in SG routine 0x5090ba–0x509213.
//! Upstream capacity/gain and selection of this branch are explicit inputs.
use crate::{Result, controller::ControllerInputs};
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FeedwaterPiInputs {
    pub pressure: f32,
    pub target: f32,
    pub pressure_band: f32,
    pub capacity: f32,
    pub gain: f32,
    pub step: f32,
    pub output: f32,
    pub previous_error: f32,
    pub scale: f32,
    pub ratio: f32,
    pub heat_a: f32,
    pub heat_b: f32,
    pub fault_flag: i16,
    /// Legacy name: original SG selector, A=0/B=1.
    pub phase_flag: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct FeedwaterPiOutput {
    pub output: f32,
    pub previous_error: f32,
    pub heat_partition: f32,
}
impl FeedwaterPiInputs {
    pub fn advance(&self) -> Result<FeedwaterPiOutput> {
        if !self.capacity.is_finite() || self.capacity < 0. {
            return Err("invalid SG control capacity".into());
        }
        let failed = self.fault_flag == -1;
        let heat_partition = if failed {
            0.
        } else {
            if [self.scale, self.ratio, self.heat_a, self.heat_b]
                .iter()
                .any(|v| !v.is_finite())
                || f64::from(self.heat_a) + f64::from(self.heat_b) == 0.
            {
                return Err("invalid SG heat-partition operands".into());
            }
            let heat = if self.phase_flag == 0 {
                self.heat_a
            } else {
                self.heat_b
            };
            let value = (f64::from(self.scale) * f64::from(self.ratio) * f64::from(heat)
                / (f64::from(self.heat_a) + f64::from(self.heat_b))) as f32;
            if !value.is_finite() {
                return Err("SG heat-partition overflow".into());
            }
            value
        };
        let result = ControllerInputs {
            measured: self.pressure,
            target: self.target,
            proportional_band: self.pressure_band,
            output: self.output,
            previous_error: self.previous_error,
            gain: self.gain,
            integral_time: if failed { 60. } else { 20. },
            step: self.step,
            lower: if failed { 0. } else { -self.capacity },
            upper: self.capacity,
        }
        .advance()?;
        Ok(FeedwaterPiOutput {
            output: result.output,
            previous_error: result.previous_error,
            heat_partition,
        })
    }
}

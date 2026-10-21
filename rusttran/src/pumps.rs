//! Recovered RCP flow-update blocks in native routine 0x512520.
//! Portable binary64 intermediates replace x87 extended arithmetic; a Single
//! increment may differ by one ULP near a rounding tie.
//! Pump switching/event timing and database bindings remain outside this API.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PumpFlowInputs {
    pub normalized_flow: f32,
    pub target: f32,
    pub step: f32,
    pub time_constant: f32,
    pub base_flow: f32,
    pub loop_share: f32,
    pub volume_factor: f32,
    pub specific_volume: f32,
    pub void_fraction: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PumpFlowOutput {
    pub normalized_flow: f32,
    pub flow: f32,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("pump Single overflow".into())
    }
}
impl PumpFlowInputs {
    /// Caller must supply the void fraction after the original >=1 -> .9999 cap.
    /// Keep signed flow: the original permits a negative target for one loop.
    pub fn advance(&self) -> Result<PumpFlowOutput> {
        for value in [
            self.normalized_flow,
            self.target,
            self.step,
            self.time_constant,
            self.base_flow,
            self.loop_share,
            self.volume_factor,
            self.specific_volume,
            self.void_fraction,
        ] {
            if !value.is_finite() {
                return Err("non-finite pump input".into());
            }
        }
        if self.step < 0. || self.time_constant <= 0. || self.specific_volume <= 0. {
            return Err("invalid pump step, time constant or specific volume".into());
        }
        let d = |v: f32| f64::from(v);
        let difference = single((d(self.normalized_flow) - d(self.target)) / 100.)?;
        let mut normalized_flow = self.normalized_flow;
        if difference.abs() > 0.01_f32 {
            let change = single(d(difference) * d(self.step) / d(self.time_constant) * 100.)?;
            normalized_flow = single(d(normalized_flow) - d(change))?;
        }
        let flow = single(
            d(normalized_flow) * d(self.base_flow) / 100.
                * d(self.loop_share)
                * d(self.volume_factor)
                / d(self.specific_volume)
                * (1. - d(self.void_fraction)),
        )?;
        Ok(PumpFlowOutput {
            normalized_flow,
            flow,
        })
    }
}
/// Native 2×2 arrays, indexed by A + 2*B, in the RCP trip/restart handler.
/// These are flow targets, not direct pump speed percentages.
pub fn targets(a_running: bool, b_running: bool) -> (f32, f32) {
    let index = usize::from(a_running) + 2 * usize::from(b_running);
    ([4., 120., -10., 100.][index], [4., -10., 120., 100.][index])
}

/// Original normalization and numerical A/B stages, with explicit target/time
/// inputs. Pump A selects a two-second constant when last_change_a >= trip_time;
/// pump B uses the model time constant. UI/event selection remains external.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PumpPairInputs {
    pub flows: [f32; 2],
    pub targets: [f32; 2],
    pub shares: [f32; 2],
    pub step: f32,
    pub time_constant: f32,
    pub base_flow: f32,
    pub volume_factor: f32,
    pub specific_volume: f32,
    pub void_fraction: f32,
    pub last_change_a: f32,
    pub trip_time: f32,
}
#[derive(Debug, Serialize)]
pub struct PumpPairOutput {
    pub loops: [PumpFlowOutput; 2],
    pub void_fraction: f32,
    pub selected_time_constant_a: f32,
}
impl PumpPairInputs {
    pub fn advance(&self) -> Result<PumpPairOutput> {
        if self
            .flows
            .iter()
            .chain(self.targets.iter())
            .chain(self.shares.iter())
            .any(|v| !v.is_finite())
            || [
                self.step,
                self.time_constant,
                self.base_flow,
                self.volume_factor,
                self.specific_volume,
                self.void_fraction,
                self.last_change_a,
                self.trip_time,
            ]
            .iter()
            .any(|v| !v.is_finite())
            || self.base_flow == 0.
            || self.shares.contains(&0.)
            || self.volume_factor == 0.
        {
            return Err("invalid coupled pump operands".into());
        }
        let void_fraction = if self.void_fraction >= 1. {
            0.9999_f32
        } else {
            self.void_fraction
        };
        let time_a = if self.last_change_a >= self.trip_time {
            2.
        } else {
            self.time_constant
        };
        let flow = |side: usize, time_constant: f32| -> Result<PumpFlowOutput> {
            let normalized_flow = single(
                f64::from(self.flows[side])
                    / f64::from(self.base_flow)
                    / f64::from(self.shares[side])
                    * 100.
                    * f64::from(self.specific_volume)
                    / f64::from(self.volume_factor)
                    / (1. - f64::from(void_fraction)),
            )?;
            PumpFlowInputs {
                normalized_flow,
                target: self.targets[side],
                step: self.step,
                time_constant,
                base_flow: self.base_flow,
                loop_share: self.shares[side],
                volume_factor: self.volume_factor,
                specific_volume: self.specific_volume,
                void_fraction,
            }
            .advance()
        };
        Ok(PumpPairOutput {
            loops: [flow(0, time_a)?, flow(1, self.time_constant)?],
            void_fraction,
            selected_time_constant_a: time_a,
        })
    }
}

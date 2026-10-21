//! Original bounded PI update in 0x512290. COM/error reporting is excluded.
//! Called by steam-generator and other control paths; dispatch remains separate.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ControllerInputs {
    pub measured: f32,
    pub target: f32,
    pub proportional_band: f32,
    pub output: f32,
    pub previous_error: f32,
    pub gain: f32,
    pub integral_time: f32,
    pub step: f32,
    pub lower: f32,
    pub upper: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct ControllerOutput {
    pub output: f32,
    pub previous_error: f32,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("controller Single overflow".into())
    }
}
impl ControllerInputs {
    pub fn advance(&self) -> Result<ControllerOutput> {
        let d = |v: f32| f64::from(v);
        if [
            self.measured,
            self.target,
            self.proportional_band,
            self.output,
            self.previous_error,
            self.gain,
            self.integral_time,
            self.step,
            self.lower,
            self.upper,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.proportional_band == 0.
            || self.integral_time == 0.
            || self.step < 0.
            || self.lower > self.upper
        {
            return Err("invalid PI controller input".into());
        }
        let error = single((d(self.measured) - d(self.target)) / d(self.proportional_band))?;
        let mut output = single(
            (d(error) - d(self.previous_error) + d(error) * d(self.step) / d(self.integral_time))
                * d(self.gain)
                + d(self.output),
        )?;
        let previous_error = if output <= self.lower {
            output = self.lower;
            0.
        } else {
            error
        };
        if output > self.upper {
            output = self.upper;
        }
        Ok(ControllerOutput {
            output,
            previous_error,
        })
    }
}

/// Native seven-point flow curve wrapper 0x5124e0. Pressure psia, flow lb/s.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct InjectionCurve {
    pub pressure: [f32; 7],
    pub flow: [f32; 7],
}
impl InjectionCurve {
    pub fn evaluate(&self, pressure: f32) -> Result<f32> {
        crate::physics::interpolate(&self.pressure, &self.flow, pressure)
    }
    /// Connect the authenticated BasicData curve arrays to the evaluator.
    pub fn from_model(model: &crate::bindings::NativeSeed, high_pressure: bool) -> Result<Self> {
        if model.source_table != "BasicData" {
            return Err("injection curves require a BasicData model seed".into());
        }
        let (p, w) = if high_pressure {
            ("PH", "WH")
        } else {
            ("PL", "WL")
        };
        Ok(Self {
            pressure: *model
                .curves
                .get(p)
                .ok_or("missing injection pressure curve")?,
            flow: *model.curves.get(w).ok_or("missing injection flow curve")?,
        })
    }
}

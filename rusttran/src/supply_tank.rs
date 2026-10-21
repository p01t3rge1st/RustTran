//! Supply-source branch in 0x510850, 0x511605–0x51170b. The caller must
//! select supply mode; full injection/recirculation dispatch is not implemented.
use crate::{Result, bindings::NativeSeed};
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SupplyTankInputs {
    pub volume: f32,
    pub injection_flow: f32,
    pub flow_a: f32,
    pub flow_b: f32,
    pub step: f32,
    pub minimum_volume: f32,
    pub initial_volume: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct SupplyTankOutput {
    pub volume: f32,
    pub recirculation_required: bool,
    pub recirculation_flow: f32,
    pub other_recirculation_flow: f32,
    pub level_command: Option<f32>,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("supply-tank Single overflow".into())
    }
}
impl SupplyTankInputs {
    /// Units: volume ft³, flow lb/s, step seconds. Native depletion has no clamp.
    /// At volume strictly below TKMIN, command mode 1 and a level ratio * 0.8.
    pub fn deplete(&self) -> Result<SupplyTankOutput> {
        let d = |v: f32| f64::from(v);
        if [
            self.volume,
            self.injection_flow,
            self.flow_a,
            self.flow_b,
            self.step,
            self.minimum_volume,
            self.initial_volume,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.step < 0.
        {
            return Err("invalid supply-tank input".into());
        }
        let volume = single(
            d(self.volume)
                - (d(self.flow_a) + d(self.injection_flow) + d(self.flow_b)) * d(self.step) / 62.4,
        )?;
        let recirculation_required = volume < self.minimum_volume;
        let level_command = if recirculation_required {
            if self.initial_volume == 0. {
                return Err("supply-tank initial volume is zero".into());
            }
            Some(single(d(volume) / d(self.initial_volume) * 0.8)?)
        } else {
            None
        };
        Ok(SupplyTankOutput {
            volume,
            recirculation_required,
            recirculation_flow: 0.,
            other_recirculation_flow: 0.,
            level_command,
        })
    }
    /// Attach authenticated TANK0/TKMIN conversions to supplied live inputs.
    pub fn with_model_thresholds(mut self, model: &NativeSeed) -> Result<Self> {
        if model.source_table != "BasicData" {
            return Err("supply-tank thresholds require a BasicData model seed".into());
        }
        self.minimum_volume = *model.globals.get("0x54b580").ok_or("missing TKMIN")?;
        self.initial_volume = *model.globals.get("0x54b57c").ok_or("missing TANK0")?;
        Ok(self)
    }
}

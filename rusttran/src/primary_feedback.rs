//! Recovered post-balance control-state refresh; original UI calls excluded.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryFeedbackInputs {
    pub liquid_level: f32,
    pub coolant_temperature: f32,
    pub minimum_temperature: f32,
    pub local_78: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryFeedbackOutput {
    pub exchange_state: f32,
    pub spray_level_percent: f32,
    pub coolant_temperature: f32,
}
impl PrimaryFeedbackInputs {
    pub fn calculate(&self) -> Result<PrimaryFeedbackOutput> {
        if [
            self.liquid_level,
            self.coolant_temperature,
            self.minimum_temperature,
            self.local_78,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite primary feedback operand".into());
        }
        let percent = (f64::from(self.liquid_level) * 100.) as f32;
        if !percent.is_finite() {
            return Err("primary feedback Single overflow".into());
        }
        Ok(PrimaryFeedbackOutput {
            exchange_state: self.local_78,
            spray_level_percent: if percent < 0. { 0. } else { percent },
            coolant_temperature: if self.coolant_temperature <= self.minimum_temperature {
                self.minimum_temperature
            } else {
                self.coolant_temperature
            },
        })
    }
}
impl crate::native_globals::NativeGlobals {
    pub fn prepare_primary_feedback(&mut self, local_78: f32) -> Result<PrimaryFeedbackOutput> {
        let out = PrimaryFeedbackInputs {
            liquid_level: self.single(0x54b4a0)?,
            coolant_temperature: self.single(0x54b498)?,
            minimum_temperature: self.single(0x54b160)?,
            local_78,
        }
        .calculate()?;
        self.singles.insert("0x54b738".into(), out.exchange_state);
        self.singles
            .insert("0x54b6c0".into(), out.spray_level_percent);
        self.singles
            .insert("0x54b498".into(), out.coolant_temperature);
        Ok(out)
    }
}

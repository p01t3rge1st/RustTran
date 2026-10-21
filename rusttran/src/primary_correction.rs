//! Final primary mass/energy correction 0x50cbac–0x50cc88; heat source explicit.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryCorrectionInputs {
    pub g54b6e4: f32,
    pub g54b730: f32,
    pub g54b734: f32,
    pub g54b688: f32,
    pub g54b64c: f32,
    pub g54b650: f32,
    pub g54b6d8: f32,
    pub g54b7f0: f32,
    pub g54b6dc: f32,
    pub local_88: f32,
    pub local_a4: f32,
    pub local_8c: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryCorrectionOutput {
    pub local_6c: f32,
    pub local_88: f32,
    pub local_a4: f32,
}
fn single(v: f64) -> Result<f32> {
    let v = v as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("primary correction Single overflow".into())
    }
}
impl PrimaryCorrectionInputs {
    pub fn calculate(&self) -> Result<PrimaryCorrectionOutput> {
        if [
            self.g54b6e4,
            self.g54b730,
            self.g54b734,
            self.g54b688,
            self.g54b64c,
            self.g54b650,
            self.g54b6d8,
            self.g54b7f0,
            self.g54b6dc,
            self.local_88,
            self.local_a4,
            self.local_8c,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.g54b7f0 == 0.
        {
            return Err("invalid primary correction operands".into());
        }
        let d = f64::from;
        let local_6c = single(d(self.g54b734) - d(self.g54b6e4) * d(self.g54b730) / 2.)?;
        let local_88 = single(
            d(self.local_88)
                - ((1. - d(self.g54b688)) * d(self.g54b64c) + d(self.g54b650) * d(self.g54b688))
                    * d(self.g54b6d8),
        )?;
        let local_a4 = single(
            (d(local_6c) - d(self.local_8c)) * d(self.g54b6d8) / d(self.g54b7f0)
                + d(self.local_a4)
                + d(self.g54b6dc) / d(self.g54b7f0),
        )?;
        Ok(PrimaryCorrectionOutput {
            local_6c,
            local_88,
            local_a4,
        })
    }
}

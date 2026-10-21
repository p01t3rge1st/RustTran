//! Primary inventory and coefficients at 0x50b46b–0x50b5ae, excluding COM cleanup.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryInventoryInputs {
    pub g54b6d8: f32,
    pub g54b6c8: f32,
    pub g54b6a4: f32,
    pub g54b6cc: f32,
    pub g54b6b0: f32,
    pub g54b6c4: f32,
    pub g54b4ac: f32,
    pub g54b414: f32,
    pub g54bb38: f32,
    pub g54b70c: f32,
    pub g54b4a8: f32,
    pub g54b334: f32,
    pub g54b730: f32,
    pub g54b2f8: f32,
    pub g54b1ac: f32,
    pub local_84: f32,
    pub command_percent: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryInventoryOutput {
    pub g54bb38: f32,
    pub local_ac: f32,
    pub local_24: f32,
    pub local_30: f32,
    pub local_3c: f32,
    pub local_48: f32,
}
fn single(v: f64) -> Result<f32> {
    let value = v as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("primary inventory Single overflow".into())
    }
}
impl PrimaryInventoryInputs {
    pub fn advance(&self) -> Result<PrimaryInventoryOutput> {
        if [
            self.g54b6d8,
            self.g54b6c8,
            self.g54b6a4,
            self.g54b6cc,
            self.g54b6b0,
            self.g54b6c4,
            self.g54b4ac,
            self.g54b414,
            self.g54bb38,
            self.g54b70c,
            self.g54b4a8,
            self.g54b334,
            self.g54b730,
            self.g54b2f8,
            self.g54b1ac,
            self.local_84,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.g54b414 < 0.
        {
            return Err("invalid primary inventory operands".into());
        }
        let d = f64::from;
        let local_ac = single(
            (1. - f64::from(self.command_percent) / 100.) * d(self.g54b6d8)
                + (d(self.g54b6c8) + d(self.g54b6a4) + d(self.g54b6cc) + d(self.g54b6b0)),
        )?;
        let g54bb38 = single(
            (d(self.g54b6c4) - d(local_ac) - d(self.g54b4ac)) * d(self.g54b414) + d(self.g54bb38),
        )?;
        Ok(PrimaryInventoryOutput {
            g54bb38,
            local_ac,
            local_24: single(d(self.g54b70c) * d(g54bb38))?,
            local_30: single(d(g54bb38) * d(self.local_84))?,
            local_3c: single(d(self.g54b4a8) * d(self.g54b334))?,
            local_48: single(-d(g54bb38) * d(self.g54b730) - d(self.g54b2f8) * d(self.g54b1ac))?,
        })
    }
}

//! No-phase-change primary branch 0x50bdd9–0x50c587. Upstream locals explicit.
use crate::Result;
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct NormalPrimaryPhaseInputs {
    pub g54b688: f32,
    pub g54b728: f32,
    pub g54b724: f32,
    pub g54b4ac: f32,
    pub g54b73c: f32,
    pub g54b6a8: f32,
    pub g54b7f0: f32,
    pub g54b64c: f32,
    pub g54b650: f32,
    pub g54b788: f32,
    pub g54b334: f32,
    pub g54b494: f32,
    pub g54b49c: f32,
    pub g54b7ec: f32,
    pub g54b4a4: f32,
    pub g54b19c: f32,
    pub local_20: f32,
    pub local_54: f32,
    pub local_b0: f32,
    pub g54b4d6: i16,
    pub g54b4d8: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct NormalPrimaryPhaseTrace {
    pub local_98: f32,
    pub local_88: f32,
    pub local_a4: f32,
    pub local_8c: f32,
    pub local_38: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct NormalPrimaryPhaseOutput {
    #[serde(flatten)]
    pub globals: BTreeMap<String, f32>,
    pub trace: NormalPrimaryPhaseTrace,
}
fn single(v: f64) -> Result<f32> {
    let v = v as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("normal primary phase overflow".into())
    }
}
impl NormalPrimaryPhaseInputs {
    pub fn calculate(&self) -> Result<NormalPrimaryPhaseOutput> {
        if self.g54b4d6 != 0 || self.g54b4d8 != 0 {
            return Err("normal primary phase requires both native phase flags zero".into());
        }
        if [
            self.g54b688,
            self.g54b728,
            self.g54b724,
            self.g54b4ac,
            self.g54b73c,
            self.g54b6a8,
            self.g54b7f0,
            self.g54b64c,
            self.g54b650,
            self.g54b788,
            self.g54b334,
            self.g54b494,
            self.g54b49c,
            self.g54b7ec,
            self.g54b4a4,
            self.g54b19c,
            self.local_20,
            self.local_54,
            self.local_b0,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.g54b7f0 == 0.
            || self.g54b19c == 0.
        {
            return Err("invalid normal primary phase operands".into());
        }
        let d = f64::from;
        let local_8c =
            single((1. - d(self.g54b688)) * d(self.g54b728) + d(self.g54b688) * d(self.g54b724))?;
        let local_38 = single(
            ((d(self.local_20) - d(local_8c)) * d(self.g54b4ac)
                - (d(self.g54b73c) - d(local_8c)) * d(self.g54b6a8))
                / d(self.g54b7f0),
        )?;
        let volume = (1. - d(self.g54b688)) * d(self.g54b64c) + d(self.g54b650) * d(self.g54b688);
        let (local_88, local_a4) = if self.g54b4ac <= 0. {
            (
                single(volume * (d(self.g54b6a8) - d(self.g54b4ac)))?,
                local_38,
            )
        } else {
            (
                single(volume * d(self.g54b6a8) + d(self.g54b788))?,
                single(
                    (d(self.g54b788) * d(self.g54b334) * d(self.g54b494)
                        - (d(self.g54b73c) - d(local_8c)) * d(self.g54b6a8))
                        / d(self.g54b7f0),
                )?,
            )
        };
        let level = single(1. - d(self.g54b7ec) * d(self.g54b4a4) / d(self.g54b19c))?;
        let globals = [
            (0x54b6a4, self.local_54),
            (0x54b498, self.g54b49c),
            (0x54b4a0, level),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect();
        Ok(NormalPrimaryPhaseOutput {
            globals,
            trace: NormalPrimaryPhaseTrace {
                local_98: self.local_b0,
                local_88,
                local_a4,
                local_8c,
                local_38,
            },
        })
    }
}

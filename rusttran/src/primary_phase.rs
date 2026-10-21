//! Four native phase-flag branches at 0x50bdd9–0x50c587.
//! Flags and upstream locals are explicit; preceding flag-transition logic is separate.
use crate::Result;
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryPhaseInputs {
    pub g54b734: f32,
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
    pub g54b690: f32,
    pub g54b72c: f32,
    pub g54b678: f32,
    pub g54b2f8: f32,
    pub g54b1ac: f32,
    pub g54b778: f32,
    pub g54b6c4: f32,
    pub g54b6c8: f32,
    pub g54b6cc: f32,
    pub g54b6b0: f32,
    pub g54b6d8: f32,
    pub g54b668: f32,
    pub g54b3fc: f32,
    pub g54b404: f32,
    pub local_4c: f32,
    pub local_40: f32,
    pub local_58: f32,
    pub local_ac: f32,
    pub local_78: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryPhaseTrace {
    pub local_98: f32,
    pub local_88: f32,
    pub local_a4: f32,
    pub local_8c: f32,
    pub local_38: f32,
    pub local_ac: f32,
    pub local_78: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryPhaseOutput {
    #[serde(flatten)]
    pub globals: BTreeMap<String, f32>,
    pub trace: PrimaryPhaseTrace,
}
fn single(v: f64) -> Result<f32> {
    let v = v as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("primary phase Single overflow".into())
    }
}
impl PrimaryPhaseInputs {
    pub fn calculate(&self) -> Result<PrimaryPhaseOutput> {
        if ![0, 1].contains(&self.g54b4d6) || ![0, 1].contains(&self.g54b4d8) {
            return Err("unsupported primary phase flag; expected zero or one".into());
        }
        if [
            self.g54b734,
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
            self.g54b690,
            self.g54b72c,
            self.g54b678,
            self.g54b2f8,
            self.g54b1ac,
            self.g54b778,
            self.g54b6c4,
            self.g54b6c8,
            self.g54b6cc,
            self.g54b6b0,
            self.g54b6d8,
            self.g54b668,
            self.g54b3fc,
            self.g54b404,
            self.local_4c,
            self.local_40,
            self.local_58,
            self.local_ac,
            self.local_78,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.g54b7f0 == 0.
            || self.g54b19c == 0.
        {
            return Err("invalid primary phase operands".into());
        }
        let d = f64::from;
        let mixture =
            single((1. - d(self.g54b688)) * d(self.g54b728) + d(self.g54b688) * d(self.g54b724))?;
        let transfer_energy = single(
            ((d(self.local_20) - d(mixture)) * d(self.g54b4ac)
                - (d(self.g54b73c) - d(mixture)) * d(self.g54b6a8))
                / d(self.g54b7f0),
        )?;
        let level = single(1. - d(self.g54b7ec) * d(self.g54b4a4) / d(self.g54b19c))?;
        let volume = (1. - d(self.g54b688)) * d(self.g54b64c) + d(self.g54b650) * d(self.g54b688);
        let mut flow = self.local_54;
        let mut local_ac = self.local_ac;
        let mut local_78 = self.local_78;
        let mut temperature = self.g54b49c;
        let mut local_98 = self.local_b0;
        let phase = self.g54b4d8 == 1;
        let sum = |flow: f32, include_extra: bool| {
            single(
                d(self.g54b6c8)
                    + d(flow)
                    + d(self.g54b6cc)
                    + d(self.g54b6b0)
                    + if include_extra { d(self.g54b6d8) } else { 0. },
            )
        };
        match (self.g54b4d6, self.g54b4d8) {
            (0, 0) => {}
            (0, 1) => {
                flow = self.local_4c;
                local_78 = self.local_58;
                local_ac = sum(flow, true)?;
                temperature = self.g54b690;
            }
            (1, 0) => {
                if level > self.g54b404 {
                    flow = self.local_54;
                    local_78 = self.g54b734;
                    local_ac = sum(flow, true)?;
                } else if level > self.g54b3fc {
                    flow = self.local_40;
                    local_78 = self.g54b728;
                    local_ac = sum(flow, false)?;
                } else {
                    flow = self.g54b668;
                    local_78 = self.g54b724;
                    local_ac =
                        single(d(flow) + d(self.g54b6c8) + d(self.g54b6cc) + d(self.g54b6b0))?;
                }
            }
            (1, 1) => {
                if level < self.g54b3fc {
                    flow = self.g54b668;
                    local_78 = self.g54b724;
                    local_ac = single(
                        d(flow)
                            + d(self.g54b6c8)
                            + d(self.g54b6cc)
                            + d(self.g54b6b0)
                            + d(self.g54b6d8),
                    )?;
                } else {
                    flow = self.local_4c;
                    local_78 = self.local_58;
                    local_ac = sum(flow, true)?;
                }
                temperature = self.g54b690;
            }
            _ => unreachable!(),
        }
        let (local_88, local_a4) = if phase {
            local_98 = single(
                d(self.g54b2f8) * d(self.g54b1ac) / d(self.g54b7f0) * d(self.g54b778)
                    + d(self.local_b0),
            )?;
            (
                single(volume * (d(self.g54b6a8) + d(local_ac) - d(self.g54b6c4)))?,
                single(
                    ((d(self.g54b72c) - d(mixture)) * d(self.g54b6c4)
                        - (d(self.g54b73c) - d(mixture)) * d(self.g54b6a8)
                        - (d(local_78) - d(mixture)) * d(local_ac)
                        + d(self.g54b678))
                        / d(self.g54b7f0),
                )?,
            )
        } else if self.g54b4ac <= 0. {
            (
                single(volume * (d(self.g54b6a8) - d(self.g54b4ac)))?,
                transfer_energy,
            )
        } else {
            (
                single(volume * d(self.g54b6a8) + d(self.g54b788))?,
                single(
                    (d(self.g54b788) * d(self.g54b334) * d(self.g54b494)
                        - (d(self.g54b73c) - d(mixture)) * d(self.g54b6a8))
                        / d(self.g54b7f0),
                )?,
            )
        };
        let globals = [
            (0x54b6a4, flow),
            (0x54b498, temperature),
            (0x54b49c, temperature),
            (0x54b4a0, level),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect();
        Ok(PrimaryPhaseOutput {
            globals,
            trace: PrimaryPhaseTrace {
                local_98,
                local_88,
                local_a4,
                local_8c: mixture,
                local_38: transfer_energy,
                local_ac,
                local_78,
            },
        })
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryPhaseLocals {
    pub local_20: f32,
    pub local_54: f32,
    pub local_b0: f32,
    pub local_4c: f32,
    pub local_40: f32,
    pub local_58: f32,
    pub local_ac: f32,
    pub local_78: f32,
}

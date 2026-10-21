//! Original primary flow and pressure-latch block 0x50bae2–0x50bdd9.
//! Inputs come from the preceding phase-state stage; dispatch remains external.
use crate::{Result, physics};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryFlowInputs {
    pub g54b494: f32,
    pub g54b684: f32,
    pub g54b64c: f32,
    pub g54bab0: f32,
    pub g54b544: f32,
    pub g54b2e0: f32,
    pub g54b66c: f32,
    pub g54b670: f32,
    pub g54ba34: f32,
    pub g54b728: f32,
    pub g54b724: f32,
    pub g54b4a4: f32,
    pub g54b688: f32,
    pub g54b650: f32,
    pub g54b4ea: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryFlowTrace {
    pub local_54: f32,
    pub local_40: f32,
    pub local_4c: f32,
    pub local_58: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryFlowOutput {
    #[serde(flatten)]
    pub globals: BTreeMap<String, f32>,
    #[serde(rename = "0x54b4ea")]
    pub g54b4ea: i16,
    pub trace: PrimaryFlowTrace,
}
fn single(v: f64) -> Result<f32> {
    let v = v as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("primary flow Single overflow".into())
    }
}
impl PrimaryFlowInputs {
    pub fn calculate(&self) -> Result<PrimaryFlowOutput> {
        if ![0, 1].contains(&self.g54b4ea) {
            return Err("unsupported primary pressure-latch flag".into());
        }
        if [
            self.g54b494,
            self.g54b684,
            self.g54b64c,
            self.g54bab0,
            self.g54b544,
            self.g54b2e0,
            self.g54b66c,
            self.g54b670,
            self.g54ba34,
            self.g54b728,
            self.g54b724,
            self.g54b4a4,
            self.g54b688,
            self.g54b650,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.g54b64c <= 0.
        {
            return Err("invalid primary flow operands".into());
        }
        let d = f64::from;
        let threshold = single(d(self.g54b684) * 0.81)?;
        let local_54 = if threshold >= self.g54b494 {
            0.
        } else {
            single(
                ((d(self.g54b494) - d(self.g54b684) * 0.81) * (9216. / d(self.g54b64c))).sqrt()
                    * d(self.g54bab0),
            )?
        };
        let local_40 =
            single(d(physics::critical_discharge_flux(self.g54b494, 1)?) * d(self.g54bab0))?;
        let mut gas =
            single(d(physics::critical_discharge_flux(self.g54b494, 2)?) * d(self.g54bab0))?;
        if self.g54b494 < self.g54b544 {
            gas = 0.;
        }
        let mut snapshot_gas = self.g54b66c;
        let mut snapshot_liquid = self.g54b670;
        let mut latch = self.g54b4ea;
        let ramp_threshold = single(d(self.g54b2e0) + d(self.g54b544))?;
        if ramp_threshold > self.g54b494 && latch == 0 {
            snapshot_gas = gas;
            snapshot_liquid = local_40;
            latch = 1;
        } else if latch == 1 {
            if self.g54b494 > self.g54b544 {
                if self.g54b2e0 == 0. {
                    return Err("primary flow ramp denominator is zero".into());
                }
                gas = single(
                    d(snapshot_gas)
                        * ((d(self.g54b494) - d(self.g54b544)) / d(self.g54b2e0)).sqrt(),
                )?;
            } else {
                gas = 0.;
            }
        }
        let liquid_part = (1. - d(self.g54ba34)) * d(local_40);
        let gas_part = d(self.g54ba34) * d(gas);
        let local_4c = single(liquid_part + gas_part)?;
        if liquid_part + gas_part + 1. == 0. {
            return Err("primary mixed enthalpy denominator is zero".into());
        }
        let local_58 = single(
            (liquid_part * d(self.g54b728) + gas_part * d(self.g54b724))
                / (liquid_part + gas_part + 1.),
        )?;
        let mixed = (1. - d(self.g54b688)) * d(self.g54b64c) + d(self.g54b650) * d(self.g54b688);
        if mixed == 0. {
            return Err("primary flow mixture volume is zero".into());
        }
        let mass = single(d(self.g54b4a4) / mixed)?;
        let globals = [
            (0x54b668, gas),
            (0x54b66c, snapshot_gas),
            (0x54b670, snapshot_liquid),
            (0x54b7f0, mass),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect();
        Ok(PrimaryFlowOutput {
            globals,
            g54b4ea: latch,
            trace: PrimaryFlowTrace {
                local_54,
                local_40,
                local_4c,
                local_58,
            },
        })
    }
}

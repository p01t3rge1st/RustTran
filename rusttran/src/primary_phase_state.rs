//! Original primary phase-state preparation 0x50b60f–0x50bae2.
//! Early exits skip flow preparation. No complete plant/event dispatcher.
use crate::Result;
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryPhaseStateInputs {
    pub g54b688: f32,
    pub g54b4a4: f32,
    pub g54b19c: f32,
    pub g54b1a0: f32,
    pub g54b7ec: f32,
    pub g54b4a8: f32,
    pub g54bb38: f32,
    pub g54b7f0: f32,
    pub g54b654: f32,
    pub g54b650: f32,
    pub g54b64c: f32,
    pub g54b4a0: f32,
    pub g54b4ac: f32,
    pub g54b6c4: f32,
    pub g54b6a8: f32,
    pub g54b414: f32,
    pub g54b494: f32,
    pub g54b544: f32,
    pub g54b684: f32,
    pub local_ac: f32,
    pub g54b4d6: i16,
    pub g54b4d8: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryPhaseStateOutput {
    #[serde(flatten)]
    pub globals: BTreeMap<String, f32>,
    #[serde(flatten)]
    pub flags: BTreeMap<String, i16>,
    pub continue_flow_preparation: bool,
}
fn single(v: f64) -> Result<f32> {
    let v = v as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("primary phase-state Single overflow".into())
    }
}
fn fraction(vapor: f32, liquid: f32, gas: f32) -> Result<f32> {
    let vapor_density = f64::from(vapor) / f64::from(gas);
    let density = (1. - f64::from(vapor)) / f64::from(liquid) + vapor_density;
    if density == 0. {
        return Err("primary phase-state mixture density is zero".into());
    }
    single(vapor_density / density)
}
fn mixture_mass(volume: f32, x: f32, liquid: f32, gas: f32) -> Result<f32> {
    let mixed = (1. - f64::from(x)) * f64::from(liquid) + f64::from(gas) * f64::from(x);
    if mixed == 0. {
        return Err("primary phase-state mixture volume is zero".into());
    }
    single(f64::from(volume) / mixed)
}
impl PrimaryPhaseStateInputs {
    pub fn calculate(&self) -> Result<PrimaryPhaseStateOutput> {
        if ![0, 1].contains(&self.g54b4d6) || ![0, 1].contains(&self.g54b4d8) {
            return Err("unsupported primary phase-state flag".into());
        }
        if [
            self.g54b688,
            self.g54b4a4,
            self.g54b19c,
            self.g54b1a0,
            self.g54b7ec,
            self.g54b4a8,
            self.g54bb38,
            self.g54b7f0,
            self.g54b654,
            self.g54b650,
            self.g54b64c,
            self.g54b4a0,
            self.g54b4ac,
            self.g54b6c4,
            self.g54b6a8,
            self.g54b414,
            self.g54b494,
            self.g54b544,
            self.g54b684,
            self.local_ac,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.g54b414 < 0.
            || self.g54b654 <= 0.
            || self.g54b64c <= 0.
            || self.g54b650 <= 0.
        {
            return Err("invalid primary phase-state operands".into());
        }
        let d = f64::from;
        let mut x = self.g54b688;
        let mut volume = self.g54b4a4;
        let vapor;
        let mut other_volume = self.g54b4a8;
        let mut inventory = self.g54bb38;
        let mut mass = self.g54b7f0;
        let mut pressure = self.g54b494;
        let mut flag_a = self.g54b4d6;
        let mut flag_b = self.g54b4d8;
        let mut continue_flow_preparation = true;
        if x > 1. {
            volume = single(d(self.g54b19c) * 0.5 + d(volume))?;
            if volume == 0. {
                return Err("zero corrected primary volume".into());
            }
            vapor = single((d(volume) - d(self.g54b19c) * 0.5) / d(volume))?;
            other_volume = single(d(self.g54b1a0) + d(self.g54b19c) - d(volume))?;
            inventory = single(d(inventory) - d(self.g54b19c) / d(self.g54b654) / 2.)?;
            flag_a = 1;
            x = fraction(vapor, self.g54b64c, self.g54b650)?;
            mass = mixture_mass(volume, x, self.g54b64c, self.g54b650)?;
            continue_flow_preparation = false;
        } else {
            if self.g54b4a0 < 0. {
                flag_a = 1;
            }
            if x < 0. {
                let inflow = if flag_b == 0 {
                    d(self.g54b4ac)
                } else {
                    d(self.g54b6c4) - d(self.local_ac)
                };
                mass = single((inflow - d(self.g54b6a8)) * d(self.g54b414) + d(mass))?;
                if mass == 0. || self.g54b650 == self.g54b64c {
                    return Err("invalid primary fraction reconstruction denominator".into());
                }
                x = single(
                    (d(volume) / d(mass) - d(self.g54b64c)) / (d(self.g54b650) - d(self.g54b64c)),
                )?;
                if x < 0. {
                    x = 0.;
                }
            }
            if pressure < self.g54b544 {
                pressure = self.g54b544;
            }
            if pressure < self.g54b684 && flag_b == 0 {
                volume = single(d(self.g54b1a0) + d(self.g54b19c))?;
                if volume == 0. {
                    return Err("zero primary saturation-entry volume".into());
                }
                flag_b = 1;
                vapor = single((1. - d(self.g54b4a0)) * d(self.g54b19c) / d(volume))?;
                x = fraction(vapor, self.g54b64c, self.g54b650)?;
                mass = mixture_mass(volume, x, self.g54b64c, self.g54b650)?;
                other_volume = 0.;
                continue_flow_preparation = false;
            } else {
                let gas_volume = single(d(self.g54b650) * d(x))?;
                let mixed = (1. - d(x)) * d(self.g54b64c) + d(gas_volume);
                if mixed == 0. {
                    return Err("zero primary vapor fraction denominator".into());
                }
                vapor = single(d(gas_volume) / mixed)?;
            }
        }
        let globals = [
            (0x54b688, x),
            (0x54b4a4, volume),
            (0x54b7ec, vapor),
            (0x54b4a8, other_volume),
            (0x54bb38, inventory),
            (0x54b7f0, mass),
            (0x54b494, pressure),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect();
        let flags = [(0x54b4d6, flag_a), (0x54b4d8, flag_b)]
            .into_iter()
            .map(|(a, v)| (format!("0x{a:x}"), v))
            .collect();
        Ok(PrimaryPhaseStateOutput {
            globals,
            flags,
            continue_flow_preparation,
        })
    }
}

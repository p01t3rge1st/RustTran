//! Native balance tail 0x50ce6d–0x50cfa4, inside function 0x50af30.
//! This computes two actual state derivatives from already-calculated inputs.
//! Raw operand names retain provenance until physical bindings are verified.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BalanceInputs {
    pub local_20: f32,
    pub g54b734: f32,
    pub g54b4ac: f32,
    pub g54b72c: f32,
    pub g54b6c4: f32,
    pub local_78: f32,
    pub local_ac: f32,
    pub g54b678: f32,
    pub local_48: f32,
    pub g54b774: f32,
    pub local_3c: f32,
    pub local_30: f32,
    pub local_24: f32,
    pub g54b654: f32,
    pub step: f32,
}
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BalanceOutputs {
    pub g54b770: f32,
    pub g54b784: f32,
}
impl BalanceInputs {
    pub fn derivatives(&self) -> Result<BalanceOutputs> {
        for value in [
            self.local_20,
            self.g54b734,
            self.g54b4ac,
            self.g54b72c,
            self.g54b6c4,
            self.local_78,
            self.local_ac,
            self.g54b678,
            self.local_48,
            self.g54b774,
            self.local_3c,
            self.local_30,
            self.local_24,
            self.g54b654,
            self.step,
        ] {
            if !value.is_finite() {
                return Err("non-finite balance input".into());
            }
        }
        if self.local_48 == 0. || self.g54b654 == 0. || self.step <= 0. {
            return Err("invalid balance denominator or step".into());
        }
        let d = |v: f32| f64::from(v);
        let checked = |v: f64| -> Result<f32> {
            let v = v as f32;
            if v.is_finite() {
                Ok(v)
            } else {
                Err("balance Single overflow".into())
            }
        };
        // Native Single stores at 0x50cea7, 0x50ceee, 0x50cf12, 0x50cf4a.
        let local_50 = checked(
            (d(self.local_20) - d(self.g54b734)) * d(self.g54b4ac)
                - (d(self.g54b72c) - d(self.g54b734)) * d(self.g54b6c4)
                + (d(self.local_78) - d(self.g54b734)) * d(self.local_ac)
                - d(self.g54b678),
        )?;
        let g54b770 = checked(
            d(local_50) / d(self.local_48) - d(self.g54b774) * d(self.local_3c) / d(self.local_48),
        )?;
        let local_34 = checked(d(g54b770) * d(self.local_30) + d(self.g54b774) * d(self.local_24))?;
        let local_90 = checked(d(local_34) / d(self.g54b654) + d(self.g54b6c4) - d(self.local_ac))?;
        let g54b784 = checked((d(local_90) - d(self.g54b4ac)) / d(self.step) / 3.)?;
        Ok(BalanceOutputs { g54b770, g54b784 })
    }
}

/// Balance block 0x50cc88–0x50ce63. All fields refer to original operands.
/// Earlier code must provide locals 0x98, 0x88, 0xa4 and 0xac.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PressureBalanceInputs {
    pub g54b650: f32,
    pub g54b64c: f32,
    pub g54b7f0: f32,
    pub g54b688: f32,
    pub g54b65c: f32,
    pub g54b658: f32,
    pub local_98: f32,
    pub local_88: f32,
    pub local_a4: f32,
    pub g54bad8: f32,
    pub g54b4a0: f32,
    pub g54b6a8: f32,
    pub local_ac: f32,
    pub g54b6c4: f32,
    pub g54b4ac: f32,
    pub g54b4a4: f32,
    pub g54b654: f32,
    pub g54b1a0: f32,
    pub g54b19c: f32,
    pub g54b70c: f32,
}
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PressureBalanceOutputs {
    pub g54b77c: f32,
    pub g54b774: f32,
}
impl PressureBalanceInputs {
    pub fn derivatives(&self) -> Result<PressureBalanceOutputs> {
        for v in [
            self.g54b650,
            self.g54b64c,
            self.g54b7f0,
            self.g54b688,
            self.g54b65c,
            self.g54b658,
            self.local_98,
            self.local_88,
            self.local_a4,
            self.g54bad8,
            self.g54b4a0,
            self.g54b6a8,
            self.local_ac,
            self.g54b6c4,
            self.g54b4ac,
            self.g54b4a4,
            self.g54b654,
            self.g54b1a0,
            self.g54b19c,
            self.g54b70c,
        ] {
            if !v.is_finite() {
                return Err("non-finite pressure balance input".into());
            }
        }
        let d = |v: f32| f64::from(v);
        let checked = |v: f64| -> Result<f32> {
            let v = v as f32;
            if v.is_finite() {
                Ok(v)
            } else {
                Err("pressure balance Single overflow".into())
            }
        };
        let local_5c = checked((d(self.g54b650) - d(self.g54b64c)) * d(self.g54b7f0))?;
        let local_74 = checked(
            ((1. - d(self.g54b688)) * d(self.g54b65c) + d(self.g54b658) * d(self.g54b688))
                * d(self.g54b7f0),
        )?;
        let denominator = d(self.local_98) * d(local_5c) - d(self.g54bad8) * d(local_74);
        if denominator == 0. {
            return Err("singular pressure balance".into());
        }
        let g54b77c = checked(
            (d(self.local_98) * d(self.local_88) - d(self.local_a4) * d(local_74)) / denominator,
        )?;
        let mut pressure =
            (d(self.local_a4) * d(local_5c) - d(self.g54bad8) * d(self.local_88)) / denominator;
        // The native __vbaFpR4 comparisons round operands to Single first.
        let gate = (self.g54b4a0 <= f32::from_bits(0x3f7fbe77)
            || ((d(self.g54b6a8) + d(self.local_ac)) as f32 >= self.g54b6c4
                && self.g54b4ac <= self.g54b6a8))
            && self.g54b4a4 >= 0.;
        if !gate {
            let capacity = d(self.g54b1a0) + d(self.g54b19c);
            if capacity == 0. || self.g54b70c == 0. {
                return Err("invalid pressure correction denominator".into());
            }
            pressure += (-(d(self.g54b6c4) - d(self.local_ac) - d(self.g54b6a8))
                * d(self.g54b654)
                * d(self.g54b654)
                / capacity)
                / d(self.g54b70c);
        }
        Ok(PressureBalanceOutputs {
            g54b77c,
            g54b774: checked(pressure)?,
        })
    }
}

/// Direct native combination at 0x523dc8–0x523e04. Input source components
/// remain external; output addresses are derivatives of states 12 and 13.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StreamBalanceInputs {
    pub g54b6a4: f32,
    pub g54bb50: f32,
    pub g54ba90: f32,
    pub g54b738: f32,
}
#[derive(Debug, Clone, Serialize)]
pub struct StreamBalanceOutputs {
    pub g54b674: f32,
    pub g54b4b8: f32,
}
impl StreamBalanceInputs {
    pub fn derivatives(&self) -> Result<StreamBalanceOutputs> {
        for value in [self.g54b6a4, self.g54bb50, self.g54ba90, self.g54b738] {
            if !value.is_finite() {
                return Err("non-finite stream balance input".into());
            }
        }
        let mass = (f64::from(self.g54b6a4) + f64::from(self.g54bb50)) as f32;
        let energy = (f64::from(self.g54b738) * f64::from(self.g54b6a4)
            + f64::from(self.g54ba90) * f64::from(self.g54bb50)) as f32;
        if !mass.is_finite() || !energy.is_finite() {
            return Err("stream balance Single overflow".into());
        }
        Ok(StreamBalanceOutputs {
            g54b674: mass,
            g54b4b8: energy,
        })
    }
}
/// Native volume-transfer block 0x50b5ae–0x50b60f. The integer flag is the
/// authenticated IC ISAT value; scientific activation semantics unresolved.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VolumeBalanceInputs {
    pub g54b4ac: f32,
    pub g54b654: f32,
    pub g54b734: f32,
    pub g54b728: f32,
    pub g54b4d8: i16,
}
#[derive(Debug, Clone, Serialize)]
pub struct VolumeBalanceOutputs {
    pub g54b788: f32,
    pub local_20: f32,
}
impl VolumeBalanceInputs {
    pub fn derivatives(&self) -> Result<VolumeBalanceOutputs> {
        for value in [self.g54b4ac, self.g54b654, self.g54b734, self.g54b728] {
            if !value.is_finite() {
                return Err("non-finite volume balance input".into());
            }
        }
        let positive = self.g54b4ac >= 0.;
        let value = if positive && self.g54b4d8 != 1 {
            (-f64::from(self.g54b4ac) * f64::from(self.g54b654)) as f32
        } else {
            0.
        };
        if !value.is_finite() {
            return Err("volume balance Single overflow".into());
        }
        Ok(VolumeBalanceOutputs {
            g54b788: value,
            local_20: if positive { self.g54b734 } else { self.g54b728 },
        })
    }
}

impl crate::native_globals::NativeGlobals {
    /// Original 0x523dc8–0x523e04; connect the two late derivative outputs.
    pub fn prepare_stream_balance(&mut self) -> Result<StreamBalanceOutputs> {
        let out = StreamBalanceInputs {
            g54b6a4: self.single(0x54b6a4)?,
            g54bb50: self.single(0x54bb50)?,
            g54ba90: self.single(0x54ba90)?,
            g54b738: self.single(0x54b738)?,
        }
        .derivatives()?;
        self.singles.insert("0x54b674".into(), out.g54b674);
        self.singles.insert("0x54b4b8".into(), out.g54b4b8);
        Ok(out)
    }
}

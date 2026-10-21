//! Numerical loop transfer 0x505370, before COM/error reporting at 0x505873.
//! Raw pNN names preserve EBP argument offsets until all physical meanings are
//! established. Native caller bindings are retained in analysis evidence.
use crate::{Result, physics};
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LoopTransferInputs {
    pub p0c: f32,
    pub p10: f32,
    pub p14: f32,
    pub p18: f32,
    pub p1c: f32,
    pub p20: f32,
    pub p24: f32,
    pub p2c: f32,
    pub p30: f32,
    pub p38: f32,
    pub p3c: f32,
    pub p40: f32,
    pub p44: f32,
    pub p48: f32,
    pub p4c: f32,
    pub p50: f32,
    pub p54: f32,
    pub p58: f32,
    pub p5c: f32,
    pub p60: f32,
    pub p64: i16,
    pub p68: f32,
    pub p6c: f32,
    pub p70: f32,
    pub p74: f32,
    pub p78: i16,
    pub g54b768: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct LoopTransferTrace {
    pub primary_coefficient: f32,
    pub secondary_coefficient: f32,
    pub effective_coefficient: f32,
    pub response_fraction: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct LoopTransferOutput {
    pub p08: f32,
    pub p28: f32,
    pub p34: f32,
    pub p3c: f32,
    pub trace: LoopTransferTrace,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("loop-transfer Single overflow or invalid power".into())
    }
}
impl LoopTransferInputs {
    pub fn calculate(&self) -> Result<LoopTransferOutput> {
        let d = |v: f32| f64::from(v);
        if [
            self.p0c,
            self.p10,
            self.p14,
            self.p18,
            self.p1c,
            self.p20,
            self.p24,
            self.p2c,
            self.p30,
            self.p38,
            self.p3c,
            self.p40,
            self.p44,
            self.p48,
            self.p4c,
            self.p50,
            self.p54,
            self.p58,
            self.p5c,
            self.p60,
            self.p68,
            self.p6c,
            self.p70,
            self.p74,
            self.g54b768,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.p10 == 0.
            || self.p58 == 0.
            || self.p24 == 0.
            || self.p30 == 0.
            || self.p4c == 0.
            || self.p78 == 0
        {
            return Err("invalid loop-transfer input or denominator".into());
        }
        let temperature = physics::saturation_temperature(self.p0c)?;
        let mut primary = if self.p64 == 0 {
            self.p14
        } else {
            if self.p1c == 0. {
                return Err("loop nominal flow is zero".into());
            }
            let ratio = d(self.p20).abs() / d(self.p1c) / d(self.p30);
            single(d(self.p10) * 4. * ratio.powf(0.8))?
        };
        let secondary_ratio =
            (d(self.p2c) + d(self.p5c) + 50.).abs() / d(self.p58) / d(self.p24) / d(self.p30) / 2.;
        let mut secondary = single(d(self.p10) * 4. * secondary_ratio.powf(0.8))?;
        if primary < self.p14 {
            primary = self.p14;
        }
        let minimum_secondary = single(d(self.p14) * 6.)?;
        if secondary < minimum_secondary {
            secondary = minimum_secondary;
        }
        if primary == 0. || secondary == 0. {
            return Err("loop heat-transfer coefficient is zero".into());
        }
        let resistance = 1. / d(self.p10) / 2. + 1. / d(primary) + 1. / d(secondary);
        if resistance == 0. {
            return Err("loop heat-transfer resistance is zero".into());
        }
        let effective = single(1. / resistance)?;
        let high = self.p3c > self.p74;
        let heat = single(if high {
            (d(self.p6c) - d(temperature)) * d(effective) * d(self.p68) * d(self.p30)
        } else {
            (d(self.p6c) - d(temperature)) * d(effective) * d(self.p70)
        })?;
        let volume = physics::vfld(self.p0c)?;
        if volume == 0. {
            return Err("loop liquid specific volume is zero".into());
        }
        let count = f64::from(self.p78);
        let response = single(if high {
            if self.p48 == 0. {
                return Err("loop response denominator is zero".into());
            }
            ((d(self.p70) - count * d(self.p38) * d(self.g54b768) / d(volume)) * d(volume)
                / d(self.p48)
                / count)
                + d(self.p74)
        } else {
            if self.p44 == 0. {
                return Err("loop inventory denominator is zero".into());
            }
            d(self.p70) / d(self.p44) * d(volume) / count
        })?;
        let fraction = if self.p50 < self.p54 {
            single(d(self.p60) / 100.)?
        } else {
            self.p24
        };
        let mut output = single(
            ((d(response) - d(self.p40)) + d(self.p4c) / 2.)
                * (d(self.p18) - d(fraction) * 20.)
                * 2.
                / d(self.p4c)
                + d(self.p2c) * 20. / d(self.p58) / d(self.p30),
        )?;
        if output < 0. {
            output = 0.;
        }
        Ok(LoopTransferOutput {
            p08: temperature,
            p28: output,
            p34: heat,
            p3c: response,
            trace: LoopTransferTrace {
                primary_coefficient: primary,
                secondary_coefficient: secondary,
                effective_coefficient: effective,
                response_fraction: fraction,
            },
        })
    }
}

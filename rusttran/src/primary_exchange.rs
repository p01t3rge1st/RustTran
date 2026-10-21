//! Upstream primary exchange in 0x50af30, original 0x50b10f–0x50b3ff.
//! GUI capacity extraction and the remainder of the balance are excluded.
use crate::{Result, physics, saturated_balance::pressure_difference_step};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryExchangeInputs {
    pub g54b684: f32,
    pub g54b730: f32,
    pub g54b67c: f32,
    pub g54b680: f32,
    pub g54b530: f32,
    pub g54b534: f32,
    pub g54b734: f32,
    pub g54b134: f32,
    pub g54b120: f32,
    pub g54ba68: f32,
    pub g54b330: f32,
    pub g54b6e0: f32,
    pub g54b724: f32,
    pub g54b728: f32,
    pub g54b688: f32,
    pub g54b720: f32,
    pub g54b71c: f32,
    pub g54b64c: f32,
    pub g54b650: f32,
    pub g54b334: f32,
    pub g54b4e2: i16,
    pub g54b4e4: i16,
    pub fault_flag: i16,
    pub pump_contributions: [f32; 2],
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryExchangeTrace {
    pub local_84: f32,
    pub local_78: f32,
    pub local_b0: f32,
    pub high: f32,
    pub low: f32,
    pub delta: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryExchangeOutput {
    #[serde(flatten)]
    pub globals: BTreeMap<String, f32>,
    pub trace: PrimaryExchangeTrace,
}
fn single(v: f64) -> Result<f32> {
    let v = v as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("primary exchange Single overflow".into())
    }
}
impl PrimaryExchangeInputs {
    pub fn calculate(&self) -> Result<PrimaryExchangeOutput> {
        let d = f64::from;
        if [
            self.g54b684,
            self.g54b730,
            self.g54b67c,
            self.g54b680,
            self.g54b530,
            self.g54b534,
            self.g54b734,
            self.g54b134,
            self.g54b120,
            self.g54ba68,
            self.g54b330,
            self.g54b6e0,
            self.g54b724,
            self.g54b728,
            self.g54b688,
            self.g54b720,
            self.g54b71c,
            self.g54b64c,
            self.g54b650,
            self.g54b334,
        ]
        .iter()
        .chain(self.pump_contributions.iter())
        .any(|v| !v.is_finite())
            || self.g54b730 == 0.
            || self.g54b530 == 0.
            || self.g54b534 == 0.
        {
            return Err("invalid primary exchange operands".into());
        }
        let count = self
            .g54b4e2
            .checked_add(self.g54b4e4)
            .ok_or("native primary pump-count overflow")?;
        let delta = pressure_difference_step(self.g54b684)?;
        let high = single(d(delta) + d(self.g54b684))?;
        let low = single(d(self.g54b684) - d(delta))?;
        let high_t = physics::saturation_temperature(high)?;
        let low_t = physics::saturation_temperature(low)?;
        if high_t == low_t {
            return Err("primary saturation-temperature slope denominator is zero".into());
        }
        let local_84 =
            single((d(physics::vfld(high)?) - d(physics::vfld(low)?)) / (d(high_t) - d(low_t)))?;
        let heat_a = single(d(self.g54b67c) / d(self.g54b730) / d(self.g54b530))?;
        let heat_b = single(d(self.g54b680) / d(self.g54b730) / d(self.g54b534))?;
        let half = d(heat_a) * d(self.g54b730) / 2.;
        let local_78 = single(if self.fault_flag == -1 {
            half + d(self.g54b734)
        } else {
            d(self.g54b734) - half
        })?;
        let pump_heat =
            single((d(self.pump_contributions[1]) + d(self.pump_contributions[0])) * 0.10764)?;
        let net_heat = single(
            (f64::from(count) * d(self.g54b134) / 2. + d(self.g54b120) * d(self.g54ba68) / 100.)
                * d(self.g54b330)
                - d(self.g54b67c)
                - d(self.g54b680)
                - d(self.g54b6e0),
        )?;
        let latent = single(d(self.g54b724) - d(self.g54b728))?;
        let local_b0 = single(
            (1. - d(self.g54b688)) * d(self.g54b720) + d(self.g54b71c) * d(self.g54b688)
                - ((1. - d(self.g54b688)) * d(self.g54b64c) + d(self.g54b650) * d(self.g54b688))
                    * d(self.g54b334),
        )?;
        let globals = [
            (0x54b6e4, heat_a),
            (0x54b6e8, heat_b),
            (0x54bab0, pump_heat),
            (0x54b678, net_heat),
            (0x54bad8, latent),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect();
        Ok(PrimaryExchangeOutput {
            globals,
            trace: PrimaryExchangeTrace {
                local_84,
                local_78,
                local_b0,
                high,
                low,
                delta,
            },
        })
    }
}

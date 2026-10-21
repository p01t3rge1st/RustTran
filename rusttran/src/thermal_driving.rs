//! Normal branch of coordinator thermal driving, 0x51f476–0x51f6fb.
//! External-model branch and the branch-selection event state are not included.
use crate::Result;
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ThermalDrivingInputs {
    pub g54b558: f32,
    pub g54b120: f32,
    pub g54b41c: f32,
    pub g54b330: f32,
    pub g54b550: f32,
    pub g54b498: f32,
    pub g54b6fc: f32,
}
fn single(v: f64) -> Result<f32> {
    let value = v as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("thermal driving Single overflow".into())
    }
}
impl ThermalDrivingInputs {
    pub fn calculate(&self) -> Result<BTreeMap<String, f32>> {
        let d = f64::from;
        if [
            self.g54b558,
            self.g54b120,
            self.g54b41c,
            self.g54b330,
            self.g54b550,
            self.g54b498,
            self.g54b6fc,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.g54b120 == 0.
            || self.g54b330 == 0.
        {
            return Err("invalid normal thermal-driving operands".into());
        }
        let heat = single(d(self.g54b558) * d(self.g54b120) * d(self.g54b41c) * d(self.g54b330))?;
        let fraction = single(d(heat) / d(self.g54b330) / d(self.g54b120) * 100.)?;
        let modifier = single(
            (d(self.g54b550) - d(self.g54b498)) * d(self.g54b6fc)
                / d(self.g54b330)
                / d(self.g54b120)
                * 100.,
        )?;
        let mean = single((d(self.g54b550) + d(self.g54b498)) / 2.)?;
        Ok([
            (0x54ba54, heat),
            (0x54ba64, fraction),
            (0x54ba68, modifier),
            (0x54b554, self.g54b550),
            (0x54bad4, self.g54b550),
            (0x54b56c, mean),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect())
    }
}
/// Initializer 0x51b0fe–0x51b132, after native unit-factor setup.
pub fn initialize_coefficient(
    unit_factor: f32,
    power: f32,
    outlet: f32,
    inlet: f32,
) -> Result<f32> {
    if [unit_factor, power, outlet, inlet]
        .iter()
        .any(|v| !v.is_finite())
        || outlet == inlet
    {
        return Err("invalid thermal-driving initialization operands".into());
    }
    single(f64::from(unit_factor) * f64::from(power) / (f64::from(outlet) - f64::from(inlet)))
}

/// Raw Double states produced by the alternate model; physical names are not inferred.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ExternalThermalInputs {
    pub g54bf44: f64,
    pub g54beb0: f64,
    pub g54beb8: f64,
    pub g54bdfc: f64,
    pub g54be04: f64,
    pub g54b300: f32,
    pub g54b304: f32,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ThermalModeInputs {
    pub normal: ThermalDrivingInputs,
    /// WORD at [0x54b630 + 0x0e]; -1 also sets the native limit to 99999.
    pub fault_flag: i16,
    /// Native mode WORD at 0x54bec8. A nonzero value selects alternate mode
    /// only when fault_flag is zero; this is not the complete event dispatcher.
    pub model_mode: i16,
    pub prior_limit: f32,
    pub prior_modifier: f32,
    pub external: Option<ExternalThermalInputs>,
}
impl ThermalModeInputs {
    pub fn calculate(&self) -> Result<BTreeMap<String, f32>> {
        if !self.prior_limit.is_finite() || !self.prior_modifier.is_finite() {
            return Err("invalid prior thermal-mode state".into());
        }
        let mut values = self.normal.calculate()?;
        values.insert(
            "0x54b190".into(),
            if self.fault_flag == -1 {
                99999.
            } else {
                self.prior_limit
            },
        );
        if self.fault_flag == 0 && self.model_mode != 0 {
            let ext = self
                .external
                .as_ref()
                .ok_or("alternate thermal mode requires external states")?;
            if [
                ext.g54bf44,
                ext.g54beb0,
                ext.g54beb8,
                ext.g54bdfc,
                ext.g54be04,
                f64::from(ext.g54b300),
                f64::from(ext.g54b304),
            ]
            .iter()
            .any(|v| !v.is_finite())
            {
                return Err("non-finite external thermal state".into());
            }
            let modifier = if ext.g54bf44 > 1. {
                if ext.g54beb0 == 0. {
                    return Err("external thermal denominator is zero".into());
                }
                single(
                    ext.g54bf44
                        / (ext.g54beb0 * 1.055)
                        / f64::from(self.normal.g54b330)
                        / f64::from(self.normal.g54b120)
                        * 100.,
                )?
            } else {
                self.prior_modifier
            };
            let heat = crate::decay_heat::DecayHeatInputs {
                time: ext.g54beb8,
                power: self.normal.g54b120,
            }
            .calculate()?
            .heat;
            let fraction = single(heat / 1000. / f64::from(self.normal.g54b120) * 100.)?;
            let outlet_a = single(f64::from(ext.g54b304) * ext.g54bdfc + f64::from(ext.g54b300))?;
            let outlet_b = single(f64::from(ext.g54b304) * ext.g54be04 + f64::from(ext.g54b300))?;
            let mean = single((f64::from(outlet_a) + f64::from(self.normal.g54b498)) / 2.)?;
            values.extend(
                [
                    (0x54ba68, modifier),
                    (0x54ba64, fraction),
                    (0x54b554, outlet_a),
                    (0x54bad4, outlet_b),
                    (0x54b56c, mean),
                ]
                .into_iter()
                .map(|(a, v)| (format!("0x{a:x}"), v)),
            );
        }
        Ok(values)
    }
}

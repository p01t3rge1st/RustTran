//! Final exchange and derivatives in 0x508960, original 0x50ac2e–0x50ad65.
//! Upstream transfer, valve state and control calculations are caller-supplied.
use crate::{Result, saturated_balance::SaturatedInputs};
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamGeneratorInputs {
    pub pressure: f32,
    pub pressure_floor: f32,
    pub fraction: f32,
    pub inflow_a: f32,
    pub inflow_b: f32,
    pub enthalpy_a: f32,
    pub enthalpy_b: f32,
    pub outflow: f32,
    pub volume: f32,
    pub share: f32,
    pub heat_a: f32,
    pub heat_b: f32,
    /// Legacy name: original SG selector, A=0/B=1; not mixture phase state.
    pub phase_flag: i16,
    pub pressure_work: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct SteamGeneratorOutput {
    pub pressure: f32,
    pub outflow: f32,
    pub fraction_derivative: f32,
    pub pressure_derivative: f32,
    pub inventory_derivative: f32,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("steam-generator Single overflow".into())
    }
}
impl SteamGeneratorInputs {
    pub fn derivatives(&self) -> Result<SteamGeneratorOutput> {
        let d = |v: f32| f64::from(v);
        if [
            self.pressure,
            self.pressure_floor,
            self.fraction,
            self.inflow_a,
            self.inflow_b,
            self.enthalpy_a,
            self.enthalpy_b,
            self.outflow,
            self.volume,
            self.share,
            self.heat_a,
            self.heat_b,
            self.pressure_work,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite steam-generator input".into());
        }
        let inflow = single(d(self.inflow_a) + d(self.inflow_b))?;
        if d(inflow) + 0.1 == 0. {
            return Err("steam-generator inflow enthalpy denominator is zero".into());
        }
        let inflow_enthalpy = single(
            (d(self.enthalpy_b) * d(self.inflow_b) + d(self.enthalpy_a) * d(self.inflow_a))
                / (d(inflow) + 0.1),
        )?;
        let pressure = self.pressure.max(self.pressure_floor);
        let outflow = if self.pressure < self.pressure_floor {
            0.
        } else {
            self.outflow
        };
        let volume = single(d(self.volume) * d(self.share))?;
        let heat = if self.phase_flag == 0 {
            self.heat_a
        } else {
            self.heat_b
        };
        let derivative = SaturatedInputs {
            pressure,
            fraction: self.fraction,
            inflow,
            inflow_enthalpy,
            outflow,
            heat,
            volume,
            pressure_work: self.pressure_work,
        }
        .derivatives()?;
        Ok(SteamGeneratorOutput {
            pressure,
            outflow,
            fraction_derivative: derivative.fraction_derivative,
            pressure_derivative: derivative.pressure_derivative,
            inventory_derivative: single(d(inflow) - d(outflow))?,
        })
    }
}

/// Earlier SG block 0x50a7ed–0x50a8a6, before final exchange. Flow lb/s,
/// inventory lb, step seconds, enthalpy Btu/lb, heat Btu/s. Contribution
/// identities remain upstream: retain the native base/additional assignments.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamOutflowInputs {
    pub base_flow: f32,
    pub additional_flow: f32,
    pub external_flow: f32,
    pub inventory: f32,
    pub step: f32,
    pub discharge_enthalpy: f32,
    pub feed_enthalpy: f32,
    pub heat_a: f32,
    pub heat_b: f32,
    /// Legacy name: original SG selector, A=0/B=1; not mixture phase state.
    pub phase_flag: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct SteamOutflowOutput {
    pub flow: f32,
    pub base_flow: f32,
    pub additional_flow: f32,
    pub heat_a: f32,
    pub heat_b: f32,
    pub feed_enthalpy: f32,
}
impl SteamOutflowInputs {
    pub fn limit(&self) -> Result<SteamOutflowOutput> {
        let d = |v: f32| f64::from(v);
        if [
            self.base_flow,
            self.additional_flow,
            self.external_flow,
            self.inventory,
            self.step,
            self.discharge_enthalpy,
            self.feed_enthalpy,
            self.heat_a,
            self.heat_b,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.step <= 0.
        {
            return Err("invalid SG outflow input or step".into());
        }
        let flow = single(d(self.base_flow) + d(self.additional_flow) + d(self.external_flow))?;
        let maximum = single(d(self.inventory) / d(self.step))?;
        let mut out = SteamOutflowOutput {
            flow,
            base_flow: self.base_flow,
            additional_flow: self.additional_flow,
            heat_a: self.heat_a,
            heat_b: self.heat_b,
            feed_enthalpy: self.feed_enthalpy,
        };
        if flow > maximum {
            // These two assignments are separate from total flow in the original.
            out.flow = maximum;
            out.base_flow = maximum;
            out.additional_flow = maximum;
            let heat = single((d(self.discharge_enthalpy) - d(self.feed_enthalpy)) * d(maximum))?;
            if self.phase_flag == 0 {
                out.heat_a = heat;
            } else {
                out.heat_b = heat;
            }
        }
        Ok(out)
    }
}

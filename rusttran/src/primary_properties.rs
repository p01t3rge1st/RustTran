//! Pressure properties/finite differences in 0x51d3d0 at 0x51d9ca–0x51dd2c.
//! Single result stores and pressure perturbations follow native order.
use crate::{Result, physics, saturated_balance::pressure_difference_step};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryPropertiesInputs {
    pub pressure: f32,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("primary property Single overflow".into())
    }
}
impl PrimaryPropertiesInputs {
    pub fn calculate(&self) -> Result<BTreeMap<String, f32>> {
        let delta = pressure_difference_step(self.pressure)?;
        let low = single(f64::from(self.pressure) - f64::from(delta))?;
        let high = single(f64::from(self.pressure) + f64::from(delta))?;
        if delta <= 0. || low <= 0. {
            return Err("invalid primary pressure perturbation".into());
        }
        let mut out = BTreeMap::new();
        for (address, value) in [
            (0x54b650, physics::vapor_specific_volume(self.pressure)?),
            (0x54b64c, physics::vfld(self.pressure)?),
            (0x54b724, physics::hgas(self.pressure)?),
            (0x54b728, physics::hfld(self.pressure)?),
        ] {
            out.insert(format!("0x{address:x}"), value);
        }
        for (address, function) in [
            (
                0x54b778,
                physics::saturation_temperature as fn(f32) -> Result<f32>,
            ),
            (0x54b71c, physics::hgas),
            (0x54b658, physics::vapor_specific_volume),
            (0x54b720, physics::hfld),
            (0x54b65c, physics::vfld),
        ] {
            let value = single(
                (f64::from(function(high)?) - f64::from(function(low)?)) / 2. / f64::from(delta),
            )?;
            out.insert(format!("0x{address:x}"), value);
        }
        Ok(out)
    }
}

/// Original primary liquid PSAT/VLIQ/HLIQ preparation, from live P/T globals.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryLiquidInputs {
    pub pressure: f32,
    pub temperature: f32,
}
impl PrimaryLiquidInputs {
    pub fn calculate(&self) -> Result<BTreeMap<String, f32>> {
        Ok([
            (
                "0x54b684".into(),
                physics::saturation_pressure(self.temperature)?,
            ),
            (
                "0x54b654".into(),
                physics::liquid_specific_volume(self.pressure, self.temperature)?,
            ),
            (
                "0x54b734".into(),
                single(physics::liquid_enthalpy(self.pressure, self.temperature)?)?,
            ),
        ]
        .into_iter()
        .collect())
    }
}

/// Primary thermal prefix 0x50afe4–0x50b0fb. Native temperature offsets are
/// +/-2 degF; Variant division uses the I16 value 4 before the Single store.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryHeatCapacityInputs {
    pub pressure: f32,
    pub temperature: f32,
}
impl PrimaryHeatCapacityInputs {
    pub fn calculate(&self) -> Result<BTreeMap<String, f32>> {
        let high = single(f64::from(self.temperature) + 2.)?;
        let low = single(f64::from(self.temperature) - 2.)?;
        let capacity = single(
            (physics::liquid_enthalpy(self.pressure, high)?
                - physics::liquid_enthalpy(self.pressure, low)?)
                / 4.,
        )?;
        Ok([
            (
                "0x54b690".into(),
                physics::saturation_temperature(self.pressure)?,
            ),
            ("0x54b730".into(), capacity),
            (
                "0x54b734".into(),
                single(physics::liquid_enthalpy(self.pressure, self.temperature)?)?,
            ),
        ]
        .into_iter()
        .collect())
    }
}

//! Numerical vessel equilibrium solver, native 0x5011b0, stopping before UI/error handling.
//! Parameter units remain those of native correlations. Physical field-to-database
//! bindings are not established; changes are supplied increments, not rates.
use crate::{Result, physics};
use serde::{Deserialize, Serialize};
const OFFSET: f32 = 459.67;
const HEAT: f32 = 0.1714;
const GAS: f32 = 53.54;
fn single(value: f64) -> Result<f32> {
    let v = value as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("vessel numeric overflow".into())
    }
}
fn d(v: f32) -> f64 {
    f64::from(v)
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct VesselState {
    pub pressure: f32,
    pub gas_pressure: f32,
    pub temperature: f32,
    pub level: f32,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct VesselInputs {
    pub mass_delta: f32,
    pub inflow_enthalpy: f32,
    pub gas_mass_delta: f32,
    pub energy_loss: f32,
    pub volume: f32,
    pub level_scale: f32,
    pub temperature_floor: f32,
    /// Original global 0x54b334, supplied rather than inferred from CSV.
    pub pressure_work: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct VesselSolution {
    pub state: VesselState,
    pub iterations: usize,
    pub trace: Vec<VesselIteration>,
}
#[derive(Clone, Debug, Serialize)]
pub struct VesselIteration {
    pub low_temperature: f32,
    pub upper_temperature: f32,
    pub low_error: f32,
    pub upper_error: f32,
    pub energy: f32,
    pub mass: f32,
}
#[derive(Clone, Copy)]
struct Point {
    temperature: f32,
    pressure: f32,
    liquid_volume: f32,
    quality: f32,
    error: f32,
}
fn properties(temperature: f32) -> Result<(f32, f32, f32, f32, f32)> {
    let p = physics::saturation_pressure(temperature)?;
    Ok((
        p,
        physics::hgas(p)?,
        physics::hfld(p)?,
        physics::vapor_specific_volume(p)?,
        physics::vfld(p)?,
    ))
}
impl VesselInputs {
    /// Complete recovered numerical branch, with a finite iteration budget to
    /// return an error if the original unbounded loop would fail to converge.
    pub fn solve(&self, state: &VesselState) -> Result<VesselSolution> {
        for value in [
            state.pressure,
            state.gas_pressure,
            state.temperature,
            state.level,
            self.mass_delta,
            self.inflow_enthalpy,
            self.gas_mass_delta,
            self.energy_loss,
            self.volume,
            self.level_scale,
            self.temperature_floor,
            self.pressure_work,
        ] {
            if !value.is_finite() {
                return Err("non-finite vessel input".into());
            }
        }
        if self.volume <= 0. || self.level_scale <= 0. || state.temperature + OFFSET <= 0. {
            return Err("invalid vessel volume, scale or temperature".into());
        }
        let (p, hg, hl, vg, vl) = properties(state.temperature)?;
        let vapor_mass = single((d(self.volume) - d(state.level) * d(self.level_scale)) / d(vg))?;
        let liquid_mass = single(d(state.level) * d(self.level_scale) / d(vl))?;
        let mass = single(d(vapor_mass) + d(liquid_mass))?;
        if mass <= 0. {
            return Err("non-positive vessel water mass".into());
        }
        let quality = single(d(vapor_mass) / d(mass))?;
        let old_gas_mass = single(
            ((d(state.pressure) - d(p)) * d(self.volume) / (d(state.temperature) + d(OFFSET)))
                / d(GAS)
                * 144.,
        )?;
        let old_energy = single(
            d(old_gas_mass) * d(HEAT) * (d(state.temperature) + d(OFFSET))
                + d(vapor_mass) * d(hg)
                + d(hl) * d(liquid_mass)
                - d(p) * d(self.pressure_work) * d(self.volume),
        )?;
        let gas_mass = single(d(old_gas_mass) - d(self.gas_mass_delta))?;
        let energy = single(
            d(self.mass_delta) * d(self.inflow_enthalpy) + d(old_energy)
                - d(self.gas_mass_delta) * d(HEAT) * (d(state.temperature) + d(OFFSET))
                - d(self.energy_loss),
        )?;
        let new_mass = single(d(mass) + d(self.mass_delta))?;
        if new_mass <= 0. {
            return Err("non-positive updated vessel water mass".into());
        }
        let specific = single(d(self.volume) / d(new_mass))?;
        let energy_at =
            |temperature: f32, pressure: f32, q: f32, hg: f32, hl: f32| -> Result<f32> {
                let mixture = single(d(q) * d(hg) + (1. - d(q)) * d(hl))?;
                single(
                    d(mixture) * d(new_mass) + d(gas_mass) * d(HEAT) * (d(temperature) + d(OFFSET))
                        - d(pressure) * d(self.pressure_work) * d(self.volume),
                )
            };
        let low_energy = energy_at(state.temperature, p, quality, hg, hl)?;
        let mut low = Point {
            temperature: state.temperature,
            pressure: p,
            liquid_volume: vl,
            quality,
            error: single(d(low_energy) - d(energy))?,
        };
        let upper_pressure = physics::pressure_from_vapor_volume(specific)?;
        let upper_temperature = physics::saturation_temperature(upper_pressure)?;
        let upper_enthalpy = physics::hgas(upper_pressure)?;
        let upper_energy = single(
            d(new_mass) * d(upper_enthalpy)
                + d(gas_mass) * d(HEAT) * (d(upper_temperature) + d(OFFSET))
                - d(upper_pressure) * d(self.pressure_work) * d(self.volume),
        )?;
        let mut upper_temperature = upper_temperature;
        let mut upper_error = single(d(upper_energy) - d(energy))?;
        let tolerance = single(d(energy) * 1e-5)?;
        let mut trace = Vec::new();
        for iteration in 1..=1024 {
            trace.push(VesselIteration {
                low_temperature: low.temperature,
                upper_temperature,
                low_error: low.error,
                upper_error,
                energy,
                mass: new_mass,
            });
            let temperature = single((d(upper_temperature) + d(low.temperature)) / 2.)?;
            let (pressure, hg, hl, vg, vl) = properties(temperature)?;
            if vg == vl {
                return Err("singular vessel phase volumes".into());
            }
            let quality = single((d(specific) - d(vl)) / (d(vg) - d(vl)))?;
            let trial_energy = energy_at(temperature, pressure, quality, hg, hl)?;
            let error = single(d(trial_energy) - d(energy))?;
            let mid = Point {
                temperature,
                pressure,
                liquid_volume: vl,
                quality,
                error,
            };
            let selected = if low.error.abs() < tolerance {
                Some(low)
            } else if error.abs() < tolerance
                || (d(low.temperature) - d(upper_temperature)).abs() < (0.005_f32 as f64)
            {
                Some(mid)
            } else {
                None
            };
            if let Some(point) = selected {
                let gas_pressure = single(
                    d(gas_mass) * d(GAS) * (d(point.temperature) + d(OFFSET))
                        / d(self.volume)
                        / 144.,
                )?;
                let pressure = single(d(gas_pressure) + d(point.pressure))?;
                let level = single(
                    (1. - d(point.quality)) * d(new_mass) * d(point.liquid_volume)
                        / d(self.level_scale),
                )?;
                return Ok(VesselSolution {
                    state: VesselState {
                        pressure,
                        gas_pressure,
                        temperature: point.temperature,
                        level,
                    },
                    iterations: iteration,
                    trace,
                });
            }
            if ((d(error) * d(low.error)) as f32) < 0. {
                upper_temperature = temperature;
                upper_error = error;
            } else if ((d(error) * d(upper_error)) as f32) < 0. {
                low = mid;
            } else {
                upper_temperature = low.temperature;
                upper_error = low.error;
                let reduced = single(d(low.temperature) - 10.)?;
                let temperature = if reduced > self.temperature_floor {
                    reduced
                } else {
                    self.temperature_floor
                };
                let (p, hg, hl, vg, vl) = properties(temperature)?;
                if vg == vl {
                    return Err("singular vessel lower phase volumes".into());
                }
                let quality = single((d(specific) - d(vl)) / (d(vg) - d(vl)))?;
                let energy_at_lower = energy_at(temperature, p, quality, hg, hl)?;
                low = Point {
                    temperature,
                    pressure: p,
                    liquid_volume: vl,
                    quality,
                    error: single(d(energy_at_lower) - d(energy))?,
                };
            }
        }
        Err("vessel solver did not converge within 1024 iterations".into())
    }
}

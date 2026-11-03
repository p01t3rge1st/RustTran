//! Native containment balance 0x5233c5–0x523f36 and vessel caller binding.
//! Remaining external Double/array/COM sources are explicit, never zero-filled.
use crate::{
    Result,
    native_globals::NativeGlobals,
    physics,
    vessel::{VesselInputs, VesselState},
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentBalanceInputs {
    /// Original caller EBP-0x34, produced by containment spray.
    pub outlet_temperature: f32,
    /// 0x54b614 array +0x3c, a Single (not the I16 fault flags).
    pub fault_level: f32,
    /// 0x54b5f8 array +8/+12, shared event times 2 and 3.
    pub event_times: [f32; 2],
    /// COM 0x4a4[0].9, shared with primary devices/spray.
    pub auxiliary_percent: i16,
    /// COM 0x530[0].9; physical identity not inferred.
    pub vent_percent: i16,
    /// Original Double 0x54bf7c.
    pub gas_source: f64,
    /// Original Double 0x54bdf4.
    pub heat_source: f64,
}
/// Session bindings: other return is original caller-local EBP-0x28.
/// Current supply return_flow overrides this explicit fallback when selected.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentBalanceUpdate {
    pub inputs: ContainmentBalanceInputs,
    pub other_return_flow: f32,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentBalanceRequest {
    pub globals: NativeGlobals,
    pub inputs: ContainmentBalanceInputs,
}
#[derive(Clone, Debug, Serialize)]
pub struct ContainmentBalanceOutput {
    pub singles: BTreeMap<String, f32>,
    pub vessel_called: bool,
    pub vessel_iterations: usize,
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("containment balance Single overflow".into())
    }
}
impl NativeGlobals {
    /// Native caller 0x5232ee–0x523358: wall feedback and old temperature.
    pub fn prepare_containment_feedback(&mut self) -> Result<BTreeMap<String, f32>> {
        let d = |a| self.single(a).map(f64::from);
        let heat =
            single((d(0x54b2f8)? * d(0x54b2d8)? + d(0x54bb08)? * d(0x54b2d4)?) * d(0x54b74c)?)?;
        let temperature = self.single(0x54b548)?;
        let out = BTreeMap::from([("0x54bb0c".into(), heat), ("0x54bb10".into(), temperature)]);
        self.singles.extend(out.clone());
        Ok(out)
    }
    /// Stage into a clone: failures in late balance or equilibrium commit nothing.
    pub fn advance_containment_balance(
        &mut self,
        c: &ContainmentBalanceInputs,
    ) -> Result<ContainmentBalanceOutput> {
        if [
            f64::from(c.outlet_temperature),
            f64::from(c.fault_level),
            f64::from(c.event_times[0]),
            f64::from(c.event_times[1]),
            c.gas_source,
            c.heat_source,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite containment balance source".into());
        }
        let mut g = self.clone();
        let mut out = BTreeMap::new();
        macro_rules! s {
            ($a:expr) => {
                f64::from(g.single($a)?)
            };
        }
        macro_rules! put {
            ($a:expr,$v:expr) => {{
                let v = single($v)?;
                g.singles.insert(format!("0x{:x}", $a), v);
                out.insert(format!("0x{:x}", $a), v);
                v
            }};
        }
        let psat = g.single(0x54bb20)?;
        put!(0x54c358, f64::from(physics::hgas(psat)?));
        put!(0x54c35c, f64::from(physics::hfld(psat)?));
        put!(0x54b660, f64::from(physics::vapor_specific_volume(psat)?));
        put!(0x54b664, f64::from(physics::vfld(psat)?));
        let vg = s!(0x54b660);
        let vl = s!(0x54b664);
        if vg == 0. || vl == 0. {
            return Err("singular containment phase volumes".into());
        }
        put!(0x54bb2c, (s!(0x54b2c0) - s!(0x54b2bc) * s!(0x54b54c)) / vg);
        put!(0x54bb30, s!(0x54b2bc) * s!(0x54b54c) / vl);
        let temperature = s!(0x54b548);
        let volume = s!(0x54b2c0);
        if temperature + 459.67 == 0. {
            return Err("singular containment gas temperature".into());
        }
        // Caller uses Double 53.34; the independently recovered solver uses
        // Single 53.54. Preserve both original constants rather than 'fixing' it.
        put!(
            0x54bb34,
            ((s!(0x54b544) - s!(0x54bb20)) * volume / (temperature + 459.67)) / 53.34 * 144.
        );
        let floor = f64::from(14.7_f32);
        let pressure = s!(0x54b544).max(floor);
        put!(0x54b544, pressure);
        let fault = f64::from(c.fault_level);
        put!(
            0x54bb40,
            (fault * 100. + s!(0x54b2dc)) * s!(0x54bb34) / 100. / 86400.
        );
        put!(
            0x54bb44,
            (fault * 100. + s!(0x54b2dc)) * s!(0x54bb2c) / 100. / 86400.
        );
        let leakage = if pressure > floor {
            f64::from(c.auxiliary_percent) * s!(0x54c064) / 100. * (pressure - 14.7).sqrt()
        } else {
            0.
        };
        put!(0x54c060, leakage);
        // Native BB48 has two writes; the second overwrites the first.
        put!(0x54bb48, s!(0x54c060) + s!(0x54bb44) + s!(0x54bb40));
        put!(
            0x54bb48,
            f64::from(c.auxiliary_percent) / 100. * (s!(0x54bb34) + s!(0x54bb2c)) / 86400.
                + s!(0x54bb44)
                + s!(0x54bb40)
        );
        put!(
            0x54bb4c,
            (s!(0x54b2dc) + fault) * s!(0x54bb30) / 100. / 86400.
        );
        let clock = g.single(0x54b40c)?;
        // 0x49be80 returns one for >=0, including exact event-time equality.
        let elapsed_a = single(f64::from(clock) - f64::from(c.event_times[0]))?;
        let elapsed_b = single(f64::from(clock) - f64::from(c.event_times[1]))?;
        let denominator = s!(0x54b4c0);
        if denominator == 0. {
            return Err("singular containment source denominator".into());
        }
        let common = s!(0x54b41c) * s!(0x54b538) * s!(0x54ba70);
        let rate_a = common * (s!(0x54b4fc) - pressure) / denominator
            * if elapsed_a >= 0. { 1. } else { 0. };
        let rate_b = common * (s!(0x54b4fc) - 14.7) / denominator
            * if elapsed_b >= 0. { 1. } else { 0. }
            * f64::from(c.vent_percent)
            / 100.;
        put!(0x54bb50, f64::from(single(rate_a)?.max(0.)));
        put!(0x54bb54, f64::from(single(rate_b)?.max(0.)));
        let step = s!(0x54b414);
        put!(
            0x54bb58,
            (s!(0x54b6a4) + s!(0x54bb50) + s!(0x54bf9c) + s!(0x54bb14)
                - s!(0x54ba24)
                - s!(0x54bb4c)
                - s!(0x54bb44))
                * step
        );
        put!(
            0x54bb5c,
            s!(0x54bb40) * step - s!(0x54b32c) * c.gas_source * step
        );
        let spray_mixture = s!(0x54bb1c) * 0.3 + s!(0x54c358) * 0.7;
        let heat_loss = s!(0x54b750) + s!(0x54bb0c) - s!(0x54b754);
        if s!(0x54bb58).abs() > 1. {
            let inflow = s!(0x54b738) * s!(0x54b6a4)
                + s!(0x54ba90) * s!(0x54bb50)
                + s!(0x54b73c) * s!(0x54bf9c)
                + s!(0x54bb14) * f64::from(c.outlet_temperature);
            let return_enthalpy = if s!(0x54bb14) > 5. {
                spray_mixture
            } else {
                s!(0x54bb1c)
            };
            let energy = inflow
                - return_enthalpy * s!(0x54ba24)
                - s!(0x54bb44) * s!(0x54c358)
                - s!(0x54bb4c) * s!(0x54c35c);
            // Order differs from mass_delta by the last two subtractions.
            let net = s!(0x54b6a4) + s!(0x54bb50) + s!(0x54bf9c) + s!(0x54bb14)
                - s!(0x54ba24)
                - s!(0x54bb44)
                - s!(0x54bb4c)
                + 0.01;
            if net == 0. {
                return Err("singular containment mixture denominator".into());
            }
            put!(0x54bb60, energy / net);
            put!(
                0x54bb28,
                heat_loss * step
                    - c.heat_source / 1000. * s!(0x54b330) * step
                    - step * s!(0x54bfb8) / 1.055
            );
        } else {
            put!(0x54bb60, 1.);
            put!(
                0x54bb28,
                ((spray_mixture - f64::from(c.outlet_temperature)) * s!(0x54bb14) + heat_loss)
                    * step
                    - c.heat_source / 1000. * s!(0x54b330) * step
            );
        }
        put!(0x54b674, s!(0x54b6a4) + s!(0x54bb50));
        put!(
            0x54b4b8,
            s!(0x54b738) * s!(0x54b6a4) + s!(0x54ba90) * s!(0x54bb50)
        );
        let vessel_called =
            !(s!(0x54bb58).abs() <= 2. && s!(0x54bb5c).abs() <= 2. && s!(0x54bb28).abs() <= 1.);
        let mut vessel_iterations = 0;
        if vessel_called {
            let inputs = VesselInputs {
                mass_delta: g.single(0x54bb58)?,
                inflow_enthalpy: g.single(0x54bb60)?,
                gas_mass_delta: g.single(0x54bb5c)?,
                energy_loss: g.single(0x54bb28)?,
                volume: g.single(0x54b2c0)?,
                level_scale: g.single(0x54b2bc)?,
                temperature_floor: g.single(0x54b160)?,
                pressure_work: g.single(0x54b334)?,
            };
            let state = VesselState {
                pressure: g.single(0x54b544)?,
                gas_pressure: g.single(0x54b800)?,
                temperature: g.single(0x54b548)?,
                level: g.single(0x54b54c)?,
            };
            let solution = inputs.solve(&state)?;
            vessel_iterations = solution.iterations;
            for (a, v) in [
                (0x54b544, solution.state.pressure),
                (0x54b800, solution.state.gas_pressure),
                (0x54b548, solution.state.temperature),
                (0x54b54c, solution.state.level),
            ] {
                put!(a, f64::from(v));
            }
        }
        put!(0x54b74c, s!(0x54b548) - s!(0x54bb10));
        *self = g;
        Ok(ContainmentBalanceOutput {
            singles: out,
            vessel_called,
            vessel_iterations,
        })
    }
}

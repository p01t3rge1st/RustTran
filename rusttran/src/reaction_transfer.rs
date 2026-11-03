//! Original post-model reaction transfer 0x51f8c6–0x51fc92.
//! Model evolution0x526b40 remains separate; Double node state is explicit.
use crate::{Result, native_globals::NativeGlobals};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReactionTransferInputs {
    /// Original Double array0x54bd04 +0x38 (element7).
    pub node_fraction: f64,
    /// Original Doubles BD48, BD40, BD50, BD58, in addition order.
    pub material_masses: [f64; 4],
    /// Original Double array0x54bd20 +0x38.
    pub node_temperature: f64,
    /// Original Double0x54c020; default is its exact initializer bits.
    #[serde(default = "native_pi")]
    pub pi: f64,
}
impl ReactionTransferInputs {
    /// Authenticated post-model operands from the existing typed fresh bundle.
    /// This maps current state; it does not run the unported alternate evolution.
    pub fn from_initialized(state: &crate::fresh_steam::FreshInitializedState) -> Result<Self> {
        let get = |address: u32| -> Result<f64> {
            let key = format!("0x{address:x}");
            let value = *state
                .alternate
                .doubles
                .get(&key)
                .or_else(|| state.model_doubles.get(&key))
                .ok_or_else(|| format!("missing reaction-transfer Double {key}"))?;
            finite(value)
        };
        let nodes = state
            .alternate
            .arrays
            .get("0x54bd04")
            .ok_or("missing reaction node-fraction array")?;
        Ok(Self {
            node_fraction: finite(nodes[7])?,
            material_masses: [
                get(0x54bd48)?,
                get(0x54bd40)?,
                get(0x54bd50)?,
                get(0x54bd58)?,
            ],
            node_temperature: finite(state.alternate.temperatures[1])?,
            pi: native_pi(),
        })
    }
}
pub const fn native_pi() -> f64 {
    f64::from_bits(0x400921fb54442d11)
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReactionTransferRequest {
    pub globals: NativeGlobals,
    pub inputs: ReactionTransferInputs,
}
#[derive(Clone, Debug, Serialize)]
pub struct ReactionTransferOutput {
    pub singles: BTreeMap<String, f32>,
    pub active: bool,
    pub positive_temperature_difference: bool,
    pub transfer_active: bool,
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("reaction-transfer Single overflow".into())
    }
}
fn finite(x: f64) -> Result<f64> {
    if x.is_finite() {
        Ok(x)
    } else {
        Err("reaction-transfer Double overflow".into())
    }
}
impl NativeGlobals {
    /// Missing upstream state or a late singularity preserves every history.
    pub fn advance_reaction_transfer(
        &mut self,
        c: &ReactionTransferInputs,
    ) -> Result<ReactionTransferOutput> {
        if !c.node_fraction.is_finite() {
            return Err("non-finite reaction node fraction".into());
        }
        let active = c.node_fraction > 0.01;
        if !active {
            // Native skip preserves BFB4 and all previous transfer/history values.
            return Ok(ReactionTransferOutput {
                singles: BTreeMap::new(),
                active: false,
                positive_temperature_difference: false,
                transfer_active: false,
            });
        }
        if !c.node_temperature.is_finite()
            || !c.pi.is_finite()
            || c.material_masses.iter().any(|v| !v.is_finite())
        {
            return Err("non-finite reaction-transfer Double source".into());
        }
        let d = |a| self.single(a).map(f64::from);
        let mass_sum = finite(
            finite(finite(c.material_masses[0] + c.material_masses[1])? + c.material_masses[2])?
                + c.material_masses[3],
        )?;
        let mass = single(mass_sum * c.node_fraction * d(0x54b32c)?)?;
        let temperature = finite(d(0x54b304)? * c.node_temperature + d(0x54b300)?)?;
        let old_temperature = d(0x54bfe8)?;
        let offset = d(0x54c010)?;
        // Preserve Double power operands and Single rate/history boundaries.
        let radiative = single(
            (finite((temperature + offset).powf(4.))?
                - finite((old_temperature + offset).powf(4.))?)
                * d(0x54bff4)?
                / 2.,
        )?;
        let convective = single((temperature - old_temperature) * d(0x54bff0)?)?;
        let positive_temperature_difference = temperature - old_temperature >= 0.;
        let (radiative, convective) = if positive_temperature_difference {
            (radiative, convective)
        } else {
            (1., 1.)
        };
        let rate = f64::from(convective) + f64::from(radiative);
        let step = d(0x54b414)?;
        let history = single(rate * step + d(0x54bfcc)?)?;
        let heat_coefficient = d(0x54bfec)?;
        let capacity = d(0x54bff8)?;
        let density = d(0x54bfc4)?;
        if heat_coefficient == 0. || capacity == 0. || density == 0. || rate == 0. {
            return Err("singular reaction-transfer heat interval".into());
        }
        let root_arg =
            finite((rate.abs() * 2. * f64::from(history)) / heat_coefficient / capacity / density)?;
        if root_arg < 0. {
            return Err("negative reaction-transfer root".into());
        }
        let root = root_arg.sqrt();
        let mut updated_temperature = single(rate / rate.abs() * root + d(0x54b2b0)?)?;
        let transfer_active = updated_temperature > 1629.;
        let mut singles = BTreeMap::from([
            ("0x54bfe4".into(), mass),
            ("0x54bfd0".into(), radiative),
            ("0x54bfd4".into(), convective),
            ("0x54bfcc".into(), history),
        ]);
        if transfer_active {
            updated_temperature = 1629.;
            let material_density = d(0x54bfc8)?;
            if material_density == 0. || c.pi == 0. || density == 0. {
                return Err("singular reaction-transfer geometry".into());
            }
            let radius_arg = finite(f64::from(mass) * 3. / material_density / 2. / c.pi)?;
            if radius_arg < 0. {
                return Err("negative reaction-transfer radius root".into());
            }
            let radius = single(finite(radius_arg.sqrt().powf(0.3333))?)?;
            let increment =
                single(finite(f64::from(radius).powf(2.))? * (rate * step / d(0x54bfc0)? * c.pi))?;
            let total = single(d(0x54bfbc)? + f64::from(increment))?;
            singles.insert("0x54bfd8".into(), radius);
            singles.insert("0x54bfb4".into(), increment);
            singles.insert("0x54bfbc".into(), total);
        } else {
            singles.insert("0x54bfb4".into(), 0.);
        }
        singles.insert("0x54bfe8".into(), updated_temperature);
        self.singles.extend(singles.clone());
        Ok(ReactionTransferOutput {
            singles,
            active,
            positive_temperature_difference,
            transfer_active,
        })
    }
}

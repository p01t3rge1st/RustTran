//! Fresh SG level/phase assignments from 0x51b6cf–0x51b806.
use crate::{Result, native_globals::NativeGlobals};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FreshSteamInputs {
    pub g54b1cc: f32,
    pub g54b214: f32,
    pub g54b768: f32,
    pub g54b1a4: f32,
    pub g54b1f8: f32,
    pub g54b188: f32,
    pub g54b76c: f32,
}
fn single(v: f64) -> Result<f32> {
    let x = v as f32;
    if x.is_finite() {
        Ok(x)
    } else {
        Err("fresh steam-generator Single overflow".into())
    }
}
impl FreshSteamInputs {
    pub fn initialize(&self) -> Result<BTreeMap<String, f32>> {
        if [
            self.g54b1cc,
            self.g54b214,
            self.g54b768,
            self.g54b1a4,
            self.g54b1f8,
            self.g54b188,
            self.g54b76c,
        ]
        .iter()
        .any(|x| !x.is_finite())
            || self.g54b768 == 0.
            || self.g54b188 == 0.
            || self.g54b76c == 0.
        {
            return Err("invalid fresh steam-generator operands".into());
        }
        let d = f64::from;
        let minimum_inventory = single(d(self.g54b1cc) * d(self.g54b214) / d(self.g54b768))?;
        let vapor_volume = single(1. - d(self.g54b1a4) * d(self.g54b768) / d(self.g54b188))?;
        let denominator =
            (1. - d(vapor_volume)) / d(self.g54b768) + d(vapor_volume) / d(self.g54b76c);
        if denominator == 0. {
            return Err("zero initial steam-generator mixture density".into());
        }
        let vapor_mass = single((d(vapor_volume) / d(self.g54b76c)) / denominator)?;
        Ok([
            (0x54b4cc, minimum_inventory),
            (0x54b4c4, self.g54b1f8),
            (0x54b4c8, self.g54b1f8),
            (0x54b7f4, vapor_volume),
            (0x54b7f8, vapor_mass),
            (0x54b504, vapor_mass),
            (0x54b508, vapor_mass),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect())
    }
}
impl NativeGlobals {
    pub fn initialize_fresh_steam(&mut self) -> Result<BTreeMap<String, f32>> {
        let out = FreshSteamInputs {
            g54b1cc: self.single(0x54b1cc)?,
            g54b214: self.single(0x54b214)?,
            g54b768: self.single(0x54b768)?,
            g54b1a4: self.single(0x54b1a4)?,
            g54b1f8: self.single(0x54b1f8)?,
            g54b188: self.single(0x54b188)?,
            g54b76c: self.single(0x54b76c)?,
        }
        .initialize()?;
        self.singles.extend(out.clone());
        Ok(out)
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FreshFeedwaterInputs {
    pub g54b764: f32,
    pub g54b134: f32,
    pub g54b120: f32,
    pub g54b330: f32,
    pub g54b2b8: f32,
    pub g54b714: f32,
    pub g54b740: f32,
    pub g54b744: f32,
    pub g54b41c: f32,
    pub g54b12c: f32,
    pub g54b2b0: f32,
}
impl FreshFeedwaterInputs {
    pub fn initialize(&self) -> Result<crate::fresh_primary::FreshPrimaryOutput> {
        if [
            self.g54b764,
            self.g54b134,
            self.g54b120,
            self.g54b330,
            self.g54b2b8,
            self.g54b714,
            self.g54b740,
            self.g54b744,
            self.g54b41c,
            self.g54b12c,
            self.g54b2b0,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite fresh feedwater operand".into());
        }
        let d = f64::from;
        let hg = crate::physics::hgas(self.g54b764)?;
        let denominator = d(hg) - d(self.g54b714);
        if denominator == 0. {
            return Err("zero initial feedwater enthalpy interval".into());
        }
        let reference =
            single((d(self.g54b134) + d(self.g54b120)) * d(self.g54b330) / denominator)?;
        let a = single(d(reference) * d(self.g54b740) * d(self.g54b41c))?;
        let b = single(d(reference) * d(self.g54b744) * d(self.g54b41c))?;
        let singles = [
            (0x54b54c, self.g54b2b8),
            (0x54b548, self.g54b2b0),
            (0x54b538, reference),
            (0x54b528, a),
            (0x54b52c, b),
            (0x54b564, b),
            (0x54b530, single(d(self.g54b12c) * d(self.g54b740))?),
            (0x54b534, single(d(self.g54b12c) * d(self.g54b744))?),
            (0x54b560, a),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect();
        Ok(crate::fresh_primary::FreshPrimaryOutput {
            singles,
            integers: BTreeMap::from([("0x54b4ea".into(), 0)]),
        })
    }
}
impl NativeGlobals {
    pub fn initialize_fresh_feedwater(
        &mut self,
    ) -> Result<crate::fresh_primary::FreshPrimaryOutput> {
        let out = FreshFeedwaterInputs {
            g54b764: self.single(0x54b764)?,
            g54b134: self.single(0x54b134)?,
            g54b120: self.single(0x54b120)?,
            g54b330: self.single(0x54b330)?,
            g54b2b8: self.single(0x54b2b8)?,
            g54b714: self.single(0x54b714)?,
            g54b740: self.single(0x54b740)?,
            g54b744: self.single(0x54b744)?,
            g54b41c: self.single(0x54b41c)?,
            g54b12c: self.single(0x54b12c)?,
            g54b2b0: self.single(0x54b2b0)?,
        }
        .initialize()?;
        self.singles.extend(out.singles.clone());
        self.integers.extend(out.integers.clone());
        Ok(out)
    }
    /// Remaining fresh coefficients 0x51b432–0x51b4fb. New-start only.
    pub fn initialize_fresh_thermal_coefficients(&mut self) -> Result<BTreeMap<String, f32>> {
        let d = f64::from;
        let pressure = self.single(0x54b764)?;
        let total =
            (d(self.single(0x54b134)?) + d(self.single(0x54b120)?)) * d(self.single(0x54b330)?);
        let mass = d(self.single(0x54b1a4)?);
        let interval = d(self.single(0x54b128)?) - d(self.single(0x54b760)?);
        if mass == 0. || interval == 0. {
            return Err("zero fresh primary heat-transfer denominator".into());
        }
        let coefficient = single((total / mass) / interval)?;
        let heat_a = single(total * d(self.single(0x54b740)?))?;
        let heat_b = single(total * d(self.single(0x54b744)?))?;
        let out = [
            (0x54b4fc, pressure),
            (0x54b500, pressure),
            (0x54b50c, pressure),
            (0x54b510, pressure),
            (0x54b4b0, coefficient),
            (0x54b67c, heat_a),
            (0x54b680, heat_b),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect::<BTreeMap<_, _>>();
        self.singles.extend(out.clone());
        Ok(out)
    }
}

/// Authenticated fresh numerical prefix through SG/feedwater setup. Other
/// initialization branches, event histories and the complete plant are pending.
fn prepare_thermal_state(
    database: &crate::Database,
    model: &str,
    ic: &str,
) -> Result<(NativeGlobals, crate::fresh_primary::FreshPrimaryOutput)> {
    let m = crate::bindings::NativeSeed::model(database, model)?;
    let c = crate::bindings::NativeSeed::condition(database, ic)?;
    let mut g = NativeGlobals::from_seeds(&m, &c)?;
    let constants = g.initialize_startup_constants();
    let geometry = g.initialize_startup_geometry()?;
    let driving_coefficient = g.initialize_thermal_driving()?;
    g.initialize_loop_reference()?;
    let reset = g.initialize_current_derivative_outputs();
    let mut out = g.initialize_fresh_primary_inventory()?;
    out.singles.extend(constants.singles);
    out.integers.extend(constants.integers);
    out.singles.extend(geometry);
    out.singles.insert("0x54b6fc".into(), driving_coefficient);
    out.singles
        .insert("0x54b330".into(), crate::bindings::HEAT_FACTOR);
    out.singles.extend(reset);
    out.singles
        .extend(g.initialize_fresh_thermal_coefficients()?);
    out.singles.extend(g.initialize_fresh_steam()?);
    let fw = g.initialize_fresh_feedwater()?;
    out.singles.extend(fw.singles);
    out.integers.extend(fw.integers);
    out.singles.extend(g.initialize_fresh_auxiliary()?);
    let control = g.initialize_pressure_control()?;
    out.singles
        .insert("0x54ba4c".into(), control.pressure_reference);
    out.singles
        .insert("0x54b6c0".into(), control.spray_level_percent);
    let late = g.initialize_late_thermal()?;
    out.singles.extend(late.singles);
    out.integers.extend(late.integers);
    Ok((g, out))
}

/// Compatibility API: writes previously exposed by the thermal startup panel.
pub fn prepare_thermal_startup(
    database: &crate::Database,
    model: &str,
    ic: &str,
) -> Result<crate::fresh_primary::FreshPrimaryOutput> {
    Ok(prepare_thermal_state(database, model, ic)?.1)
}

#[derive(Clone, Debug, serde::Serialize, serde::Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FreshInitializedState {
    pub globals: NativeGlobals,
    pub alternate: crate::alternate_init::AlternateState,
    /// Preserve model Double inputs independently of Single state.
    pub model_doubles: BTreeMap<String, f64>,
}

/// Assemble all recovered fresh writes, including reference outputs formerly
/// only used as temporary initializer operands. Does not invent missing runtime
/// histories or execute the original event/protection/restore dispatcher.
pub fn prepare_fresh_state(
    database: &crate::Database,
    model: &str,
    ic: &str,
    fault_flag: i16,
) -> Result<FreshInitializedState> {
    let (mut globals, _) = prepare_thermal_state(database, model, ic)?;
    globals.initialize_startup_clock()?;
    let model_doubles = crate::bindings::NativeSeed::model(database, model)?.doubles;
    let alternate = crate::alternate_init::AlternateInitRequest {
        globals: globals.clone(),
        model_doubles: model_doubles.clone(),
    }
    .initialize()?;
    globals.singles.extend(alternate.singles.clone());
    globals.integers.extend(alternate.integers.clone());
    globals.initialize_fresh_control_history(fault_flag)?;
    globals.initialize_integrator_alias()?;
    Ok(FreshInitializedState {
        globals,
        alternate,
        model_doubles,
    })
}

//! Authenticated new-start branch of 0x51afe0; not an IC restore.
use crate::{Result, native_globals::NativeGlobals, physics};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct FreshPrimaryInputs {
    pub g54b1a4: f32,
    pub g54b740: f32,
    pub g54b744: f32,
    pub g54b19c: f32,
    pub g54b124: f32,
    pub g54b1a0: f32,
    pub g54b758: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct FreshPrimaryOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
}
impl FreshPrimaryInputs {
    pub fn initialize(&self) -> Result<FreshPrimaryOutput> {
        if [
            self.g54b1a4,
            self.g54b740,
            self.g54b744,
            self.g54b19c,
            self.g54b124,
            self.g54b1a0,
            self.g54b758,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite fresh primary operand".into());
        }
        let inventory_a = (f64::from(self.g54b1a4) * f64::from(self.g54b740)) as f32;
        let inventory_b = (f64::from(self.g54b1a4) * f64::from(self.g54b744)) as f32;
        if !inventory_a.is_finite() || !inventory_b.is_finite() {
            return Err("initial steam-generator inventory Single overflow".into());
        }
        let singles = [
            (0x54b4f4, inventory_a),
            (0x54b40c, 0.),
            (0x54b4ac, 0.),
            (0x54b4f8, inventory_b),
            (0x54b4a8, self.g54b1a0),
            (0x54b4a4, self.g54b19c),
            (0x54b498, self.g54b758),
            (0x54b49c, self.g54b758),
            (0x54b494, self.g54b124),
            (0x54b64c, physics::vfld(self.g54b124)?),
            (0x54b650, physics::vapor_specific_volume(self.g54b124)?),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect();
        let integers = [
            0x54b4d0, 0x54b4ec, 0x54b4d2, 0x54b4d4, 0x54b4d6, 0x54b4d8, 0x54b4da, 0x54b4e0,
            0x54b4e6, 0x54b4e8,
        ]
        .into_iter()
        .map(|a| (format!("0x{a:x}"), 0))
        .collect();
        Ok(FreshPrimaryOutput { singles, integers })
    }
}
impl NativeGlobals {
    /// Explicit fresh-start choice. Never implicitly apply to a restored IC.
    pub fn initialize_fresh_primary(&mut self) -> Result<FreshPrimaryOutput> {
        let out = FreshPrimaryInputs {
            g54b1a4: self.single(0x54b1a4)?,
            g54b740: self.single(0x54b740)?,
            g54b744: self.single(0x54b744)?,
            g54b19c: self.single(0x54b19c)?,
            g54b124: self.single(0x54b124)?,
            g54b1a0: self.single(0x54b1a0)?,
            g54b758: self.single(0x54b758)?,
        }
        .initialize()?;
        self.singles.extend(out.singles.clone());
        self.integers.extend(out.integers.clone());
        Ok(out)
    }
}

#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct FreshPrimaryInventoryInputs {
    pub primary: FreshPrimaryInputs,
    pub g54b154: f32,
    pub g54b128: f32,
    pub g54b1a8: f32,
}
impl FreshPrimaryInventoryInputs {
    pub fn initialize(&self) -> Result<FreshPrimaryOutput> {
        let mut out = self.primary.initialize()?;
        let p = crate::initialization::PressurizerInitInputs {
            g54b154: self.g54b154,
            g54b128: self.g54b128,
            g54b1a8: self.g54b1a8,
            g54b498: out.singles["0x54b498"],
            g54b64c: out.singles["0x54b64c"],
            g54b650: out.singles["0x54b650"],
            g54b4a4: out.singles["0x54b4a4"],
        }
        .initialize()?;
        for (a, v) in [
            (0x54b6d4, p.g54b6d4),
            (0x54b7ec, p.g54b7ec),
            (0x54b4a0, p.g54b4a0),
            (0x54b4f0, p.g54b4f0),
            (0x54b7f0, p.g54b7f0),
        ] {
            out.singles.insert(format!("0x{a:x}"), v);
        }
        Ok(out)
    }
}
impl NativeGlobals {
    pub fn initialize_fresh_primary_inventory(&mut self) -> Result<FreshPrimaryOutput> {
        let out = FreshPrimaryInventoryInputs {
            primary: FreshPrimaryInputs {
                g54b1a4: self.single(0x54b1a4)?,
                g54b740: self.single(0x54b740)?,
                g54b744: self.single(0x54b744)?,
                g54b19c: self.single(0x54b19c)?,
                g54b124: self.single(0x54b124)?,
                g54b1a0: self.single(0x54b1a0)?,
                g54b758: self.single(0x54b758)?,
            },
            g54b154: self.single(0x54b154)?,
            g54b128: self.single(0x54b128)?,
            g54b1a8: self.single(0x54b1a8)?,
        }
        .initialize()?;
        self.singles.extend(out.singles.clone());
        self.integers.extend(out.integers.clone());
        Ok(out)
    }
}

#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct FreshPrimaryStartupRequest {
    pub model: String,
    pub ic: String,
}
/// The GUI and CLI share this authenticated primary-system preparation.
/// Earlier operating-point/reference inputs are selected explicitly; this
/// does not initialize the remaining plant or restore arbitrary IC histories.
pub fn prepare_primary_startup(
    database: &crate::Database,
    model: &str,
    ic: &str,
) -> Result<FreshPrimaryOutput> {
    let model = crate::bindings::NativeSeed::model(database, model)?;
    let condition = crate::bindings::NativeSeed::condition(database, ic)?;
    let mut g = NativeGlobals::from_seeds(&model, &condition)?;
    g.initialize_loop_reference()?;
    let mut out = g.initialize_fresh_primary_inventory()?;
    let control = g.initialize_pressure_control()?;
    out.singles
        .insert("0x54ba4c".into(), control.pressure_reference);
    out.singles
        .insert("0x54b6c0".into(), control.spray_level_percent);
    Ok(out)
}

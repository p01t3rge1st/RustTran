//! Original coordinator reference updates 0x51dd7b–0x51de6c.
use crate::{Result, native_globals::NativeGlobals};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReferenceControls {
    /// Original checkbox property 0x6803000e equals one.
    pub temperature_automatic: bool,
    /// Original checkbox property 0x6803000f equals one.
    pub level_automatic: bool,
}
impl NativeGlobals {
    pub fn prepare_primary_references(
        &mut self,
        c: &ReferenceControls,
    ) -> Result<BTreeMap<String, f32>> {
        let d = |a| self.single(a).map(f64::from);
        let temperature = if c.temperature_automatic {
            (d(0x54b850)? * d(0x54b818)? + d(0x54b1a8)?) as f32
        } else {
            self.single(0x54b75c)?
        };
        let mut level = if c.level_automatic {
            let span = d(0x54b850)?;
            if span == 0. {
                return Err("zero native reference temperature span".into());
            }
            ((d(0x54b154)? - 0.27) / span * (f64::from(temperature) - d(0x54b1a8)?) + 0.27) as f32
        } else {
            self.single(0x54b6d4)?
        };
        if !temperature.is_finite() || !level.is_finite() {
            return Err("primary reference Single overflow".into());
        }
        if level < f32::from_bits(0x3e8a3d71) {
            level = f32::from_bits(0x3e8a3d71);
        }
        let out = BTreeMap::from([("0x54b75c".into(), temperature), ("0x54b6d4".into(), level)]);
        self.singles.extend(out.clone());
        Ok(out)
    }
}

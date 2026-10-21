//! Remaining SG auxiliary feedwater update 0x50a8a6–0x50ac31.
use crate::{
    Result,
    native_globals::{LoopSide, NativeGlobals},
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamAuxiliaryRequest {
    pub globals: NativeGlobals,
    pub side: LoopSide,
    /// Original collection 0x5ac indices 2/3, property 0x68030009.
    pub auxiliary_percent: [i16; 2],
}
#[derive(Clone, Debug, Serialize)]
pub struct SteamAuxiliaryOutput {
    pub singles: BTreeMap<String, f32>,
    /// True runs the auxiliary controller; false preserves feedwater/history.
    pub active: bool,
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("SG auxiliary Single overflow".into())
    }
}
impl NativeGlobals {
    pub fn advance_steam_auxiliary(
        &mut self,
        side: LoopSide,
        percentages: [i16; 2],
    ) -> Result<SteamAuxiliaryOutput> {
        let a = Self::steam_addresses(side);
        let get = |o: usize| self.single(a[(o - 8) / 4]);
        let active = self.integer(a[(0x48 - 8) / 4])? == 1 || self.integer(a[(0x44 - 8) / 4])? == 1;
        if !active {
            return Ok(SteamAuxiliaryOutput {
                singles: BTreeMap::new(),
                active,
            });
        }
        let index = if matches!(side, LoopSide::A) { 0 } else { 1 };
        let d = f64::from;
        let scale = get(0x1c)?;
        let share = get(0xa4)?;
        if scale == 0. || share == 0. {
            return Err("zero SG auxiliary scale/share".into());
        }
        let error = single(
            (d(get(0x68)?) - d(get(0x20)?)) / d(scale) / d(share)
                + (d(get(0x64)?) - d(get(0x24)?)) * 0.033,
        )?;
        let capacity = get(0x5c)?;
        let maximum = single(d(capacity) * d(share))?;
        let delta = (d(error) * d(get(0xc)?) / 60. + (d(error) - d(get(0x88)?)))
            * d(self.single(0x54b184)?)
            * d(capacity)
            * d(share)
            * f64::from(percentages[index]);
        let other = single((1. - d(share)) * f64::from(percentages[1 - index]))?;
        let denominator = f64::from(percentages[index]) * d(share) + d(other) + 0.001;
        if denominator == 0. {
            return Err("zero SG auxiliary weighted-command denominator".into());
        }
        let mut flow = single(delta / denominator + d(get(0x20)?))?;
        if flow < 0. {
            flow = 0.;
        }
        if flow > maximum {
            flow = maximum;
        }
        let singles = [
            (a[(0x20 - 8) / 4], flow),
            (a[(0x88 - 8) / 4], error),
            (0x54b718, self.single(0x54b72c)?),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect::<BTreeMap<_, _>>();
        self.singles.extend(singles.clone());
        Ok(SteamAuxiliaryOutput { singles, active })
    }
}

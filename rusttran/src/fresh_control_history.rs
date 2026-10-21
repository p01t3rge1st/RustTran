//! Fresh Single control-history stores 0x51baa3–0x51bbed. External Double-model
//! init, restored-state branch, event rebasing and GUI callbacks are separate.
use crate::{Result, native_globals::NativeGlobals};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FreshControlHistoryRequest {
    pub globals: NativeGlobals,
    /// Original malfunction-array I16 entry at byte offset 0x10.
    pub fault_flag: i16,
}
impl NativeGlobals {
    pub fn initialize_fresh_control_history(
        &mut self,
        fault_flag: i16,
    ) -> Result<BTreeMap<String, f32>> {
        let (a, b) = if fault_flag == -1 {
            (self.single(0x54b560)?, self.single(0x54b564)?)
        } else {
            (0., 0.)
        };
        let out = [
            (0x54baa4, 0.),
            (0x54baa8, 0.),
            (0x54c068, self.single(0x54c06c)?),
            (0x54b6f8, self.single(0x54b524)?),
            (0x54bfe8, self.single(0x54b548)?),
            (0x54bfcc, 0.),
            (0x54bfbc, 0.),
            (0x54bbb0, f32::from_bits(0x47c34f80)),
            (0x54ba9c, a),
            (0x54baac, b),
            (0x54b490, self.single(0x54b48c)?),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect::<BTreeMap<_, _>>();
        self.singles.extend(out.clone());
        Ok(out)
    }
}

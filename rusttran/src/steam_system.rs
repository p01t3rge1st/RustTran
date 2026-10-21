//! Connected SG numerical/control body. Native COM commands and event inputs
//! remain explicit; this does not initialize or coordinate the whole plant.
use crate::{
    Result,
    native_globals::{LoopSide, NativeGlobals},
    steam_control::SteamControls,
    steam_valves::SteamValveControls,
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamSystemControls {
    pub initial: SteamControls,
    pub valves: SteamValveControls,
    pub auxiliary_percent: [i16; 2],
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamSystemRequest {
    pub globals: NativeGlobals,
    pub side: LoopSide,
    pub controls: SteamSystemControls,
}
#[derive(Clone, Debug, Serialize)]
pub struct SteamSystemOutput {
    pub singles: BTreeMap<String, f32>,
    pub fault_selected: bool,
    pub valve_controls: SteamValveControls,
    pub auxiliary_active: bool,
}
impl NativeGlobals {
    pub fn advance_steam_system(
        &mut self,
        side: LoopSide,
        c: &SteamSystemControls,
    ) -> Result<SteamSystemOutput> {
        let mut g = self.clone();
        let index = if matches!(side, LoopSide::A) { 0 } else { 1 };
        let mut initial = c.initial.clone();
        initial.feedwater_percent = c.valves.feedwater[index].percent;
        let control = g.advance_steam_control(side, &initial)?;
        let valve = g.advance_steam_valves(side, &c.valves)?;
        let auxiliary = g.advance_steam_auxiliary(side, c.auxiliary_percent)?;
        g.advance_steam_exchange(side, index as i16)?;
        let a = Self::steam_addresses(side);
        let mut singles = control.singles;
        singles.extend(valve.singles);
        singles.extend(auxiliary.singles);
        for o in [8, 0x68, 0xa0, 0x74, 0x70, 0x58] {
            let address = a[(o - 8) / 4];
            singles.insert(format!("0x{address:x}"), g.single(address)?);
        }
        *self = g;
        Ok(SteamSystemOutput {
            singles,
            fault_selected: control.fault_selected,
            valve_controls: valve.controls,
            auxiliary_active: auxiliary.active,
        })
    }
}

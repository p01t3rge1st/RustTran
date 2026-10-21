//! Stateful execution of the recovered pipeline, retaining device/COM commands.
//! Initial state and unrecovered producers are explicit, not a full plant loader.
use crate::{
    Result,
    native_globals::NativeGlobals,
    recovered_step::{RecoveredStepControls, RecoveredStepOutput},
};
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RecoveredSession {
    pub globals: NativeGlobals,
    /// Clock here selects the next update. Globals retain the last sample clock.
    pub controls: RecoveredStepControls,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SessionRunRequest {
    pub session: RecoveredSession,
    pub steps: usize,
}
impl RecoveredSession {
    /// A failed later update preserves the entire original session and controls.
    pub fn advance(&mut self, count: usize) -> Result<Vec<RecoveredStepOutput>> {
        if count == 0 {
            return Err("recovered session requires at least one update".into());
        }
        let mut staged = self.clone();
        staged.controls.capture_control_commands = true;
        let mut results = Vec::new();
        for i in 0..count {
            let out = staged
                .globals
                .advance_recovered_primary_step(&staged.controls)
                .map_err(|e| format!("recovered session update {i}: {e}"))?;
            if let (Some(control), Some(value)) =
                (&mut staged.controls.devices, &out.primary_devices)
            {
                control.controls = value.controls.clone();
            }
            if let (Some(control), Some(value)) = (&mut staged.controls.rcp, &out.rcp) {
                control.pump_percent = value.pump_percent;
            }
            if let (Some(control), Some(value)) = (&mut staged.controls.supply, &out.supply) {
                control.controls = value.controls.clone();
            }
            if let Some(value) = &out.accumulator {
                staged.controls.accumulator = Some(value.valves);
            }
            if let (Some(control), Some(value)) =
                (&mut staged.controls.steam_controls, &out.steam_controls)
                && let Some(last) = value.last()
            {
                control.fault_selected = last.fault_selected;
            }
            if let Some(value) = out.steam_valves.as_ref().and_then(|v| v.last()) {
                staged.controls.steam_valves = Some(value.controls.clone());
                if let Some(c) = &mut staged.controls.steam_controls {
                    c.feedwater_percent = value.controls.feedwater.each_ref().map(|x| x.percent);
                }
            }
            let commands = out
                .primary_commands
                .as_ref()
                .ok_or("missing recovered session commands")?;
            staged.controls.heaters = commands.heaters.clone();
            staged.controls.spray = commands.spray.clone();
            let next = (f64::from(staged.controls.clock) + f64::from(staged.controls.step)) as f32;
            if !next.is_finite() || next <= staged.controls.clock {
                return Err("recovered session clock cannot advance at Single precision".into());
            }
            staged.controls.clock = next;
            results.push(out);
        }
        *self = staged;
        Ok(results)
    }
}

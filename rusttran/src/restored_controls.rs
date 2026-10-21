//! Restored-state control initialization and native 20-event time rebasing.
//! This is not complete snapshot loading or the complete plant event dispatcher.
use crate::{Result, native_globals::NativeGlobals, recovered_step::RecoveredStepControls};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct EventSchedule {
    pub flags: [i16; 20],
    pub delays: [f32; 20],
    pub times: [f32; 20],
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RestoredControlRequest {
    pub globals: NativeGlobals,
    pub events: EventSchedule,
}
#[derive(Clone, Debug, Serialize)]
pub struct RestoredControlOutput {
    pub singles: BTreeMap<String, f32>,
    pub events: EventSchedule,
}
#[derive(Clone, Debug, Serialize)]
pub struct EventBindings {
    pub rcp_trip_time: f32,
    pub steam_failure_time: f32,
    pub steam_fault_flag: i16,
    pub steam_valve_fault_flags: [i16; 2],
}
impl EventSchedule {
    fn validate(&self) -> Result<()> {
        if self
            .delays
            .iter()
            .chain(&self.times)
            .any(|v| !v.is_finite())
        {
            return Err("non-finite event schedule".into());
        }
        Ok(())
    }
    pub(crate) fn bind(
        &self,
        c: &RecoveredStepControls,
    ) -> Result<(RecoveredStepControls, EventBindings)> {
        self.validate()?;
        let inputs = EventBindings {
            rcp_trip_time: self.times[6],
            steam_failure_time: self.times[8],
            steam_fault_flag: self.flags[8],
            steam_valve_fault_flags: [self.flags[2], self.flags[3]],
        };
        let mut controls = c.clone();
        if let Some(rcp) = &mut controls.rcp {
            rcp.trip_time = inputs.rcp_trip_time;
        }
        if let Some(thermal) = &mut controls.normal_thermal {
            thermal.fault_flag = self.flags[7];
            thermal.failure_time = inputs.steam_failure_time;
        }
        if let Some(sg) = &mut controls.steam_controls {
            sg.failure_time = inputs.steam_failure_time;
            sg.fault_flag = inputs.steam_fault_flag;
        }
        if let Some(valves) = &mut controls.steam_valves {
            valves.fault_flags = inputs.steam_valve_fault_flags;
        }
        Ok((controls, inputs))
    }
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("restored event Single overflow".into())
    }
}
impl NativeGlobals {
    pub fn initialize_restored_controls(
        &mut self,
        events: &EventSchedule,
    ) -> Result<RestoredControlOutput> {
        events.validate()?;
        let power = self.single(0x54b424)?;
        let clock = self.single(0x54b418)?;
        let mut next = events.clone();
        if self.integer(0x54b080)? == 0 {
            for (i, flag) in events.flags.iter().enumerate() {
                if *flag != 0 {
                    next.times[i] = single(f64::from(clock) - f64::from(events.delays[i]) - 1.)?;
                }
            }
        }
        let (a, b) = if events.flags[8] == -1 {
            (self.single(0x54b560)?, self.single(0x54b564)?)
        } else {
            (0., 0.)
        };
        let singles = [
            (0x54b818, power),
            (0x54b81c, power),
            (0x54b40c, clock),
            (0x54b820, self.single(0x54b554)?),
            (0x54bbc8, self.single(0x54b524)?),
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
        self.singles.extend(singles.clone());
        Ok(RestoredControlOutput {
            singles,
            events: next,
        })
    }
}

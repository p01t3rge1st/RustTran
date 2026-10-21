//! Original RCP switch/target/flow sequence 0x512520, scalar bindings at 0x51deea.
//! Explicit control properties; COM setter callbacks/log formatting excluded.
use crate::{
    Result,
    native_globals::NativeGlobals,
    pumps::{PumpPairInputs, targets},
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RcpControls {
    /// Original event-array byte offset 0x18, copied to 0x54ba30 by coordinator.
    pub trip_time: f32,
    /// Original form collection 0x48c indices 0/1, property 0x68030005.
    pub pump_percent: [i16; 2],
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RcpControlRequest {
    pub globals: NativeGlobals,
    pub controls: RcpControls,
}
#[derive(Clone, Debug, Serialize)]
pub struct RcpControlOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    pub pump_percent: [i16; 2],
    pub normalized_flow: [f32; 2],
    pub selected_time_constant_a: f32,
}
fn transition(clock: f32, threshold: f32, last: &mut f32, running: &mut i16, command: i16) -> bool {
    if clock >= threshold && (command != *running * 100 || *running == 1) {
        if *running == 1 {
            *running = 0;
            *last = clock;
        } else {
            *running = 1;
            *last = f32::from_bits(0x47c34f80);
        }
        true
    } else {
        false
    }
}
impl NativeGlobals {
    pub fn advance_rcp_control(&mut self, c: &RcpControls) -> Result<RcpControlOutput> {
        if !c.trip_time.is_finite() {
            return Err("non-finite RCP trip time".into());
        }
        let clock = self.single(0x54b40c)?;
        let mut last = [self.single(0x54b42c)?, self.single(0x54b430)?];
        let mut running = [self.integer(0x54b4e2)?, self.integer(0x54b4e4)?];
        if running.iter().any(|v| ![0, 1].contains(v)) {
            return Err("RCP running flags must be native 0/1".into());
        }
        let mut target = [self.single(0x54b83c)?, self.single(0x54b840)?];
        let mut pair = PumpPairInputs {
            flows: [self.single(0x54b530)?, self.single(0x54b534)?],
            targets: target,
            shares: [self.single(0x54b740)?, self.single(0x54b744)?],
            step: self.single(0x54b414)?,
            time_constant: self.single(0x54b130)?,
            base_flow: self.single(0x54b12c)?,
            volume_factor: self.single(0x54b860)?,
            specific_volume: self.single(0x54b654)?,
            void_fraction: self.single(0x54ba34)?,
            last_change_a: last[0],
            trip_time: c.trip_time,
        };
        // Original A threshold/time constant are selected before any switching.
        let effective_a = if last[0] >= c.trip_time {
            c.trip_time
        } else {
            last[0]
        };
        if transition(
            clock,
            effective_a,
            &mut last[0],
            &mut running[0],
            c.pump_percent[0],
        ) {
            let t = targets(running[0] == 1, running[1] == 1);
            target = [t.0, t.1];
        }
        pair.targets = target;
        let a = pair.advance()?;
        // B switches after A's numeric flow update. Re-evaluating the shared
        // flow helper here only consumes original B flow for the B result.
        let threshold_b = last[1];
        if transition(
            clock,
            threshold_b,
            &mut last[1],
            &mut running[1],
            c.pump_percent[1],
        ) {
            let t = targets(running[0] == 1, running[1] == 1);
            // Original B restart 0x5130c5–0x513100 indexes the B
            // matrix with B + 2*B, unlike the other target assignments.
            target = [t.0, if running[1] == 1 { 100. } else { t.1 }];
        }
        pair.targets = target;
        let b = pair.advance()?;
        let singles = BTreeMap::from([
            ("0x54b42c".into(), last[0]),
            ("0x54b430".into(), last[1]),
            ("0x54b530".into(), a.loops[0].flow),
            ("0x54b534".into(), b.loops[1].flow),
            ("0x54ba34".into(), a.void_fraction),
            ("0x54b83c".into(), target[0]),
            ("0x54b840".into(), target[1]),
            ("0x54ba30".into(), c.trip_time),
        ]);
        let integers = BTreeMap::from([
            ("0x54b4e2".into(), i32::from(running[0])),
            ("0x54b4e4".into(), i32::from(running[1])),
        ]);
        self.singles.extend(singles.clone());
        self.integers.extend(integers.clone());
        Ok(RcpControlOutput {
            singles,
            integers,
            pump_percent: running.map(|v| v * 100),
            normalized_flow: [a.loops[0].normalized_flow, b.loops[1].normalized_flow],
            selected_time_constant_a: a.selected_time_constant_a,
        })
    }
}

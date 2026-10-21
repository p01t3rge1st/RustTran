//! Original accumulator caller 0x51dfa1 and activation/discharge body 0x511b60.
//! Explicit valve COM state; callbacks, display/logging and dispatcher excluded.
use crate::{
    Result,
    accumulator::{AccumulatorInputs, ActivationInputs, ValveState},
    native_globals::NativeGlobals,
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AccumulatorSystemRequest {
    pub globals: NativeGlobals,
    pub valves: [ValveState; 2],
}
#[derive(Clone, Debug, Serialize)]
pub struct AccumulatorSystemOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    pub valves: [ValveState; 2],
    pub activated: bool,
}
impl NativeGlobals {
    pub fn advance_accumulator_system(
        &mut self,
        valves: [ValveState; 2],
    ) -> Result<AccumulatorSystemOutput> {
        let activation = ActivationInputs {
            system_pressure: self.single(0x54b494)?,
            trigger_pressure: self.single(0x54b1b8)?,
            activation: self.integer(0x54b4e6)?,
            clock: self.single(0x54b40c)?,
            event_time: self.single(0x54b458)?,
            valves,
        }
        .activate()?;
        let discharge = AccumulatorInputs {
            system_pressure: self.single(0x54b494)?,
            activation: activation.activation,
            gas_pressure: self.single(0x54b540)?,
            flow: self.single(0x54b804)?,
            water_volume: self.single(0x54b570)?,
            step: self.single(0x54b414)?,
            gas_volume: self.single(0x54b574)?,
            total_volume: self.single(0x54b708)?,
            coefficient: self.single(0x54b1c0)?,
            valve_a: activation.valves[0].opening,
            valve_b: activation.valves[1].opening,
        }
        .advance()?;
        let singles = [
            (0x54b458, activation.event_time),
            (0x54b540, discharge.gas_pressure),
            (0x54b804, discharge.flow),
            (0x54b570, discharge.water_volume),
            (0x54b574, discharge.gas_volume),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect::<BTreeMap<_, _>>();
        let integers = BTreeMap::from([("0x54b4e6".into(), i32::from(activation.activation))]);
        self.singles.extend(singles.clone());
        self.integers.extend(integers.clone());
        Ok(AccumulatorSystemOutput {
            singles,
            integers,
            valves: activation.valves,
            activated: activation.activated,
        })
    }
}

//! Numeric accumulator discharge in 0x511b00, from 0x511e9a to 0x5120f9.
//! Activation, valve values and time step are caller-supplied. Automatic opening,
//! event timestamps and COM/UI operations are not implemented here.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AccumulatorInputs {
    pub system_pressure: f32,
    pub activation: i16,
    pub gas_pressure: f32,
    pub flow: f32,
    pub water_volume: f32,
    pub step: f32,
    pub gas_volume: f32,
    pub total_volume: f32,
    pub coefficient: f32,
    pub valve_a: i16,
    pub valve_b: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct AccumulatorOutput {
    pub gas_pressure: f32,
    pub flow: f32,
    pub water_volume: f32,
    pub gas_volume: f32,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("accumulator Single overflow".into())
    }
}
impl AccumulatorInputs {
    /// Units follow native operands: psia, ft³, lb/s and seconds.
    /// Preserve native signed valve inputs and absence of a water-volume clamp.
    pub fn advance(&self) -> Result<AccumulatorOutput> {
        let d = |value: f32| f64::from(value);
        if [
            self.system_pressure,
            self.gas_pressure,
            self.flow,
            self.water_volume,
            self.step,
            self.gas_volume,
            self.total_volume,
            self.coefficient,
        ]
        .iter()
        .any(|value| !value.is_finite())
            || self.step < 0.
        {
            return Err("invalid accumulator input or step".into());
        }
        let mut output = AccumulatorOutput {
            gas_pressure: self.gas_pressure,
            flow: self.flow,
            water_volume: self.water_volume,
            gas_volume: self.gas_volume,
        };
        // Inactive calls retain the previous flow, exactly as the native branch.
        if self.activation != 1 {
            return Ok(output);
        }
        if self.water_volume < 1. || self.system_pressure >= self.gas_pressure {
            output.flow = 0.;
            return Ok(output);
        }
        let valves = self
            .valve_a
            .checked_add(self.valve_b)
            .ok_or("accumulator valve sum exceeds native I16")?;
        output.flow = single(
            d(self.coefficient)
                * (d(self.gas_pressure) - d(self.system_pressure)).sqrt()
                * f64::from(valves)
                / 100.,
        )?;
        output.water_volume = single(d(self.water_volume) - d(output.flow) / 62.4 * d(self.step))?;
        let denominator = d(self.total_volume) - d(output.water_volume);
        let ratio = d(self.gas_volume) / denominator;
        if denominator == 0. || !ratio.is_finite() || ratio < 0. {
            return Err("accumulator gas expansion outside numeric domain".into());
        }
        output.gas_pressure = single(d(self.gas_pressure) * ratio.powf(1.3))?;
        output.gas_volume = single(denominator)?;
        Ok(output)
    }
}

/// Original UI value and Boolean inhibit property. The physical UI binding is
/// not yet connected; partial openings and signed I16 values are preserved.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ValveState {
    pub opening: i16,
    pub inhibited: bool,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ActivationInputs {
    pub system_pressure: f32,
    pub trigger_pressure: f32,
    pub activation: i16,
    pub clock: f32,
    pub event_time: f32,
    pub valves: [ValveState; 2],
}
#[derive(Clone, Debug, Serialize)]
pub struct ActivationOutput {
    pub activation: i16,
    pub event_time: f32,
    pub valves: [ValveState; 2],
    pub activated: bool,
}
impl ActivationInputs {
    /// Native one-shot latch. Activation only occurs at flag 0 and P<=trigger;
    /// it records the current clock and opens each zero, uninhibited valve.
    /// Already active calls do not reopen a valve closed later by the operator.
    pub fn activate(&self) -> Result<ActivationOutput> {
        if [
            self.system_pressure,
            self.trigger_pressure,
            self.clock,
            self.event_time,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite accumulator activation input".into());
        }
        let activated = self.activation == 0 && self.system_pressure <= self.trigger_pressure;
        let mut output = ActivationOutput {
            activation: self.activation,
            event_time: self.event_time,
            valves: self.valves,
            activated,
        };
        if activated {
            output.activation = 1;
            output.event_time = self.clock;
            for valve in &mut output.valves {
                if valve.opening == 0 && !valve.inhibited {
                    valve.opening = 100;
                }
            }
        }
        Ok(output)
    }
}

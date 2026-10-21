//! Original spray selector and primary caller numerical/UI-command paths.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SprayInputs {
    pub signal: f32,
    pub lower_threshold: f32,
    pub upper_threshold: f32,
    pub interlock_signal: f32,
    pub pump_a: i16,
    pub pump_b: i16,
    pub spray_manual: bool,
    pub spray_percent: i16,
    pub auxiliary_percent: i16,
    pub spray_capacity: f32,
    pub auxiliary_capacity: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct SprayOutput {
    pub selector_value: f32,
    pub spray_command: i16,
    pub spray_percent: i16,
    pub spray_flow: f32,
    pub spray_active: bool,
}
impl SprayInputs {
    pub fn calculate(&self) -> Result<SprayOutput> {
        if [
            self.signal,
            self.lower_threshold,
            self.upper_threshold,
            self.interlock_signal,
            self.spray_capacity,
            self.auxiliary_capacity,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite spray operand".into());
        }
        let (selector_value, mut command) = if self.signal < self.lower_threshold {
            (0., 0)
        } else if self.signal > self.upper_threshold {
            (1., 1)
        } else {
            let interval = f64::from(self.upper_threshold) - f64::from(self.lower_threshold);
            if interval == 0. {
                return Err("zero spray selector threshold interval".into());
            }
            // Original FDIVR uses the full signal, without subtracting lower.
            ((f64::from(self.signal) / interval) as f32, 1)
        };
        if !selector_value.is_finite() {
            return Err("spray selector Single overflow".into());
        }
        if self.interlock_signal > 90. || self.pump_a == 0 {
            command = 0;
        }
        let percent =
            if !self.spray_manual && f64::from(self.spray_percent) / 100. != f64::from(command) {
                command * 100
            } else {
                self.spray_percent
            };
        let sum = self
            .pump_a
            .checked_add(self.pump_b)
            .ok_or("spray pump status I16 overflow")?;
        let gate = if (f64::from(sum) - 0.1) as f32 >= 0. {
            1.
        } else {
            0.
        };
        // Primary branch multiplies the raw I16 percent; auxiliary divides by 100.
        let primary = f64::from(percent) * f64::from(self.spray_capacity) * gate;
        let flow = (f64::from(self.auxiliary_percent) / 100. * f64::from(self.auxiliary_capacity)
            + primary) as f32;
        if !flow.is_finite() {
            return Err("spray flow Single overflow".into());
        }
        Ok(SprayOutput {
            selector_value,
            spray_command: command,
            spray_percent: percent,
            spray_flow: flow,
            spray_active: flow > 0.1_f32,
        })
    }
}
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SprayControls {
    pub spray_manual: bool,
    pub spray_percent: i16,
    pub auxiliary_percent: i16,
}
impl crate::native_globals::NativeGlobals {
    pub fn prepare_spray(&mut self, controls: &SprayControls) -> Result<SprayOutput> {
        let out = SprayInputs {
            signal: self.single(0x54b6d0)?,
            lower_threshold: self.single(0x54b1d8)?,
            upper_threshold: self.single(0x54b1dc)?,
            interlock_signal: self.single(0x54b6c0)?,
            pump_a: self.integer(0x54b4e2)?,
            pump_b: self.integer(0x54b4e4)?,
            spray_manual: controls.spray_manual,
            spray_percent: controls.spray_percent,
            auxiliary_percent: controls.auxiliary_percent,
            spray_capacity: self.single(0x54b1d4)?,
            auxiliary_capacity: self.single(0x54ba28)?,
        }
        .calculate()?;
        self.singles.insert("0x54b6d8".into(), out.spray_flow);
        self.integers
            .insert("0x54b6ec".into(), i32::from(out.spray_command));
        Ok(out)
    }
}

/// Shared heater/spray signal written by the coordinator at 0x51e0c7.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PressureControlSignalInputs {
    pub pressure: f32,
    pub pressure_adjustment: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PressureControlSignalOutput {
    pub signal: f32,
}
impl PressureControlSignalInputs {
    pub fn calculate(&self) -> Result<PressureControlSignalOutput> {
        let signal = (f64::from(self.pressure) - f64::from(self.pressure_adjustment)) as f32;
        if !self.pressure.is_finite()
            || !self.pressure_adjustment.is_finite()
            || !signal.is_finite()
        {
            return Err("invalid pressure-control signal operands".into());
        }
        Ok(PressureControlSignalOutput { signal })
    }
}
impl crate::native_globals::NativeGlobals {
    /// Call before the primary core, as in the original coordinator. The
    /// pressure adjustment must come from its upstream event/model producer.
    pub fn prepare_pressure_control_signal(&mut self) -> Result<PressureControlSignalOutput> {
        let out = PressureControlSignalInputs {
            pressure: self.single(0x54b494)?,
            pressure_adjustment: self.single(0x54ba4c)?,
        }
        .calculate()?;
        self.singles.insert("0x54b6d0".into(), out.signal);
        Ok(out)
    }
}

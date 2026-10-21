//! Numeric heater control from 0x500bd0; UI values remain explicit inputs.
use crate::Result;
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct HeaterInputs {
    pub signal: f32,
    pub level: f32,
    pub level_setpoint: f32,
    pub proportional_off_threshold: f32,
    pub proportional_full_threshold: f32,
    pub proportional_capacity: f32,
    pub backup_signal_threshold: f32,
    pub backup_capacity: f32,
    pub minimum_level: f32,
    pub proportional_manual: bool,
    pub backup_manual: bool,
    pub proportional_percent: i16,
    pub backup_percent: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct HeaterOutput {
    pub proportional_heat: f32,
    pub backup_heat: f32,
    pub total_heat: f32,
    pub proportional_percent: i16,
    pub backup_percent: i16,
}
impl HeaterInputs {
    pub fn calculate(&self) -> Result<HeaterOutput> {
        if [
            self.signal,
            self.level,
            self.level_setpoint,
            self.proportional_off_threshold,
            self.proportional_full_threshold,
            self.proportional_capacity,
            self.backup_signal_threshold,
            self.backup_capacity,
            self.minimum_level,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite heater input".into());
        }
        let mut out = HeaterOutput {
            proportional_heat: 0.,
            backup_heat: 0.,
            total_heat: 0.,
            proportional_percent: 0,
            backup_percent: 0,
        };
        if self.level <= self.minimum_level {
            return Ok(out);
        }
        let d = f64::from;
        if self.proportional_manual {
            out.proportional_percent = self.proportional_percent;
            out.proportional_heat = (f64::from(self.proportional_percent) / 100.
                * d(self.proportional_capacity)) as f32;
        } else if self.signal <= self.proportional_off_threshold {
            out.proportional_percent = 100;
            out.proportional_heat = if self.signal < self.proportional_full_threshold {
                self.proportional_capacity
            } else {
                let denominator =
                    d(self.proportional_off_threshold) - d(self.proportional_full_threshold);
                if denominator == 0. {
                    return Err("zero heater proportional threshold interval".into());
                }
                ((d(self.proportional_off_threshold) - d(self.signal)) / denominator
                    * d(self.proportional_capacity)) as f32
            };
        }
        if self.backup_manual {
            out.backup_percent = self.backup_percent;
            out.backup_heat =
                (f64::from(self.backup_percent) / 100. * d(self.backup_capacity)) as f32;
        } else if self.signal < self.backup_signal_threshold
            || (d(self.level_setpoint) - d(self.level)) as f32 > 0.05_f32
        {
            out.backup_percent = 100;
            out.backup_heat = self.backup_capacity;
        }
        out.total_heat = (d(out.proportional_heat) + d(out.backup_heat)) as f32;
        if [out.proportional_heat, out.backup_heat, out.total_heat]
            .iter()
            .any(|v| !v.is_finite())
        {
            return Err("heater Single overflow".into());
        }
        Ok(out)
    }
}

/// Native checkbox TRUE selects manual control; percentages are native I16.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct HeaterControls {
    pub proportional_manual: bool,
    pub backup_manual: bool,
    pub proportional_percent: i16,
    pub backup_percent: i16,
}
impl crate::native_globals::NativeGlobals {
    /// Bind the nine original caller arguments and commit heat after success.
    /// Spray/pressure control must prepare g54b6d0 before calling this stage.
    pub fn prepare_heaters(&mut self, controls: &HeaterControls) -> Result<HeaterOutput> {
        let out = HeaterInputs {
            signal: self.single(0x54b6d0)?,
            level: self.single(0x54b4a0)?,
            level_setpoint: self.single(0x54b6d4)?,
            proportional_off_threshold: self.single(0x54b1e4)?,
            proportional_full_threshold: self.single(0x54b1e8)?,
            proportional_capacity: self.single(0x54b1e0)?,
            backup_signal_threshold: self.single(0x54b1ec)?,
            backup_capacity: self.single(0x54b200)?,
            minimum_level: self.single(0x54b1d0)?,
            proportional_manual: controls.proportional_manual,
            backup_manual: controls.backup_manual,
            proportional_percent: controls.proportional_percent,
            backup_percent: controls.backup_percent,
        }
        .calculate()?;
        self.singles.insert("0x54b6dc".into(), out.total_heat);
        Ok(out)
    }
}

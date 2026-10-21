//! Numeric relief discharge in 0x50f660. Native branch 0x510177–0x5103d3.
//! Valve automation and post-discharge event/protection handling are outside
//! this block; caller supplies valve values and upstream phase properties.
use crate::{Result, physics};
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReliefInputs {
    pub pressure: f32,
    pub porv_area: f32,
    pub safety_area: f32,
    pub porv_a: i16,
    pub porv_b: i16,
    pub safety_valve: i16,
    pub level: f32,
    pub reset_level: f32,
    pub mixture_level: f32,
    pub phase_flag: i16,
    pub liquid_flux: f32,
    pub vapor_flux: f32,
    pub liquid_enthalpy: f32,
    pub vapor_enthalpy: f32,
    /// Unresolved global. Preserve the native <100 gate without inventing units.
    pub g54b6ac: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct ReliefOutput {
    pub flow: f32,
    pub enthalpy: f32,
    pub phase_flag: i16,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("relief Single overflow".into())
    }
}
impl ReliefInputs {
    pub fn discharge(&self) -> Result<ReliefOutput> {
        let d = |value: f32| f64::from(value);
        if [
            self.pressure,
            self.porv_area,
            self.safety_area,
            self.level,
            self.reset_level,
            self.mixture_level,
            self.liquid_flux,
            self.vapor_flux,
            self.liquid_enthalpy,
            self.vapor_enthalpy,
            self.g54b6ac,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite relief input".into());
        }
        let valves = self
            .porv_a
            .checked_add(self.porv_b)
            .ok_or("relief valve sum exceeds native I16")?;
        let porv_area = single(f64::from(valves) * d(self.porv_area) / 100.)?;
        let area =
            single(f64::from(self.safety_valve) * d(self.safety_area) / 100. + d(porv_area))?;
        let mut flag = self.phase_flag;
        if self.level < self.reset_level {
            flag = 0;
        }
        let (mut flow, enthalpy) = if self.level <= self.mixture_level && flag != 1 {
            (
                single(d(physics::critical_discharge_flux(self.pressure, 2)?) * d(area))?,
                physics::hgas(self.pressure)?,
            )
        } else {
            let width = d(self.mixture_level) - d(self.reset_level);
            if width == 0. {
                return Err("relief mixture interval is zero".into());
            }
            // Native caps the upper end only. No synthetic lower clamp.
            let fraction = single((d(self.level) - d(self.reset_level)) / width)?.min(1.);
            let liquid = d(fraction) * d(self.liquid_flux);
            let vapor = (1. - d(fraction)) * d(self.vapor_flux);
            let total = liquid + vapor;
            if total == 0. {
                return Err("relief mixture flux is zero".into());
            }
            flag = 1;
            (
                single(total * d(area))?,
                single(
                    (liquid * d(self.liquid_enthalpy) + vapor * d(self.vapor_enthalpy)) / total,
                )?,
            )
        };
        if self.g54b6ac < 100. {
            flow = single(d(flow) / 5.)?;
        }
        Ok(ReliefOutput {
            flow,
            enthalpy,
            phase_flag: flag,
        })
    }
}

/// Post-discharge control state. The original UI object's physical identity
/// remains unresolved; retain its signed I16 state without inventing a device.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReliefTailInputs {
    pub g54bf98: f32,
    pub g54bf9c: f32,
    pub g54b6a8: f32,
    pub control_state: i16,
}
#[derive(Clone, Debug, Serialize)]
pub struct ReliefTailOutput {
    pub g54bf9c: f32,
    pub control_state: i16,
    pub opened_event: bool,
}
impl ReliefTailInputs {
    pub fn calculate(&self) -> Result<ReliefTailOutput> {
        if [self.g54bf98, self.g54bf9c, self.g54b6a8]
            .iter()
            .any(|v| !v.is_finite())
        {
            return Err("non-finite post-relief state".into());
        }
        if self.g54bf98 < 5000. {
            return Ok(ReliefTailOutput {
                g54bf9c: 0.,
                control_state: 0,
                opened_event: false,
            });
        }
        let opened_event = self.g54bf9c > 1. && self.control_state == 0;
        Ok(ReliefTailOutput {
            g54bf9c: self.g54b6a8,
            control_state: if opened_event {
                100
            } else {
                self.control_state
            },
            opened_event,
        })
    }
}
impl crate::native_globals::NativeGlobals {
    pub fn advance_relief_tail(&mut self, control_state: i16) -> Result<ReliefTailOutput> {
        let out = ReliefTailInputs {
            g54bf98: self.single(0x54bf98)?,
            g54bf9c: self.single(0x54bf9c)?,
            g54b6a8: self.single(0x54b6a8)?,
            control_state,
        }
        .calculate()?;
        self.singles.insert("0x54bf9c".into(), out.g54bf9c);
        Ok(out)
    }
}

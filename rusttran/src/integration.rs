//! Recovered 14-state integration stage of native routine 0x51d3d0.
//!
//! Addresses are provenance, not physical variable names. This stage consumes
//! already-computed derivatives; it is NOT a complete plant transient engine.
//! Original integration variants reference Single globals (VT_BYREF|VT_R4).
use crate::{Result, physics};
use serde::{Deserialize, Serialize};

#[derive(Clone, Copy, Debug, Serialize, Deserialize)]
pub struct Binding {
    pub state: u32,
    pub derivative: u32,
    pub previous: u32,
}
pub const BINDINGS: [Binding; 14] = [
    Binding {
        state: 0x54b688,
        derivative: 0x54b77c,
        previous: 0x54bb64,
    },
    Binding {
        state: 0x54b49c,
        derivative: 0x54b770,
        previous: 0x54bb68,
    },
    Binding {
        state: 0x54b4ac,
        derivative: 0x54b784,
        previous: 0x54bb6c,
    },
    Binding {
        state: 0x54b494,
        derivative: 0x54b774,
        previous: 0x54bb70,
    },
    Binding {
        state: 0x54b4a4,
        derivative: 0x54b788,
        previous: 0x54bb74,
    },
    Binding {
        state: 0x54b504,
        derivative: 0x54b7d0,
        previous: 0x54bb7c,
    },
    Binding {
        state: 0x54b508,
        derivative: 0x54b7d4,
        previous: 0x54bb80,
    },
    Binding {
        state: 0x54b4fc,
        derivative: 0x54b7d8,
        previous: 0x54bb84,
    },
    Binding {
        state: 0x54b500,
        derivative: 0x54b7dc,
        previous: 0x54bb88,
    },
    Binding {
        state: 0x54b4f4,
        derivative: 0x54b7e0,
        previous: 0x54bb8c,
    },
    Binding {
        state: 0x54b4f8,
        derivative: 0x54b7e4,
        previous: 0x54bb90,
    },
    Binding {
        state: 0x54b4b4,
        derivative: 0x54b674,
        previous: 0x54bb94,
    },
    Binding {
        state: 0x54bba0,
        derivative: 0x54b4b8,
        previous: 0x54bb98,
    },
    Binding {
        state: 0x54bf98,
        derivative: 0x54b6a8,
        previous: 0x54bfa0,
    },
];
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct IntegrationState {
    pub values: [f32; 14],
    pub previous_derivatives: [f32; 14],
    /// Native copy of state 0x54b688 into 0x54b4f0 after its update.
    pub copied_state: f32,
}
impl IntegrationState {
    /// Apply the recovered integration stage atomically. Derivative computation,
    /// events, UI/COM calls and the intervening 0x54bba4 timed-event update
    /// remain outside this stage. Pressure floor input is native 0x54b544.
    pub fn advance(
        &mut self,
        derivatives: [f32; 14],
        step: f32,
        pressure_floor: f32,
    ) -> Result<()> {
        if !step.is_finite() || step <= 0.0 {
            return Err("integration step must be positive and finite".into());
        }
        if !pressure_floor.is_finite() {
            return Err("pressure floor must be finite".into());
        }
        let mut next = self.clone();
        for (index, current) in derivatives.into_iter().enumerate() {
            let update = physics::euler_single(
                current,
                next.previous_derivatives[index],
                step,
                next.values[index],
            )?;
            let value = update.state;
            if !value.is_finite() {
                return Err("integration Single overflow".into());
            }
            next.values[index] = value;
            next.previous_derivatives[index] = current;
            match index {
                0 => next.copied_state = value,
                5 | 6 if value > 1.0 => next.values[index] = 1.0,
                // Native constraints run after both states have been integrated.
                10 => {
                    if next.values[9] < 0. {
                        next.values[9] = 0.;
                    }
                    if value < 0. {
                        next.values[10] = 0.;
                    }
                }
                12 if next.values[3] < pressure_floor => {
                    let floor = (f64::from(pressure_floor) + 0.1) as f32;
                    if !floor.is_finite() {
                        return Err("pressure floor overflow".into());
                    }
                    next.values[3] = floor;
                }
                _ => (),
            }
        }
        *self = next;
        Ok(())
    }
}

/// States without an authenticated IC field assignment. Supply these explicitly
/// along with previous derivatives; absence of a field is not permission to zero.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ExtraIntegratedState {
    pub g54bba0: f32,
    pub g54bf98: f32,
}
impl IntegrationState {
    /// Map the 12 authenticated IC state inputs, including X -> 0x54b688 at
    /// 0x51c0f8/0x51c12e. This restores only integrator inputs, not plant globals,
    /// property histories or original fresh-start/restored-scenario dispatch.
    pub fn from_condition(
        seed: &crate::bindings::NativeSeed,
        extra: &ExtraIntegratedState,
        previous_derivatives: [f32; 14],
    ) -> Result<Self> {
        if seed.source_table != "ICThermoData" {
            return Err("integrator restoration requires an IC thermodynamic seed".into());
        }
        let get = |address: u32| -> Result<f32> {
            Ok(*seed
                .globals
                .get(&format!("0x{address:x}"))
                .ok_or_else(|| format!("missing IC state global 0x{address:x}"))?)
        };
        let mut values = [0.; 14];
        for (index, binding) in BINDINGS.iter().enumerate() {
            values[index] = match binding.state {
                0x54b688 => get(0x54b4f0)?,
                0x54bba0 => extra.g54bba0,
                0x54bf98 => extra.g54bf98,
                address => get(address)?,
            };
        }
        if values
            .iter()
            .chain(previous_derivatives.iter())
            .any(|v| !v.is_finite())
        {
            return Err("non-finite restored integration state".into());
        }
        Ok(Self {
            copied_state: values[0],
            values,
            previous_derivatives,
        })
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct NativeIntegrationRequest {
    pub globals: crate::native_globals::NativeGlobals,
    /// Original event-time array 0x54b5f8, element at byte offset 8.
    pub activation_time: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct NativeIntegrationOutput {
    pub singles: std::collections::BTreeMap<String, f32>,
}
impl crate::native_globals::NativeGlobals {
    /// Recovered 0x523f3b–0x52454f. All states, current derivatives and history
    /// are required. This commits the integrator, not a plant derivative model.
    pub fn advance_native_integration(
        &mut self,
        activation_time: f32,
    ) -> Result<NativeIntegrationOutput> {
        let mut values = [0.; 14];
        let mut previous = [0.; 14];
        let mut derivatives = [0.; 14];
        for (i, b) in BINDINGS.iter().enumerate() {
            values[i] = self.single(b.state)?;
            previous[i] = self.single(b.previous)?;
            derivatives[i] = self.single(b.derivative)?;
        }
        if !activation_time.is_finite() {
            return Err("non-finite integration activation time".into());
        }
        let delta = (f64::from(self.single(0x54b40c)?) - f64::from(activation_time)) as f32;
        if !delta.is_finite() {
            return Err("integration event-time Single overflow".into());
        }
        let amplitude = self.single(0x54bb50)?;
        let event = (f64::from(amplitude) * if delta >= 0. { 1. } else { 0. }) as f32;
        let mut state = IntegrationState {
            values,
            previous_derivatives: previous,
            copied_state: values[0],
        };
        state.advance(derivatives, self.single(0x54b414)?, self.single(0x54b544)?)?;
        let mut out = std::collections::BTreeMap::new();
        for (i, b) in BINDINGS.iter().enumerate() {
            out.insert(format!("0x{:x}", b.state), state.values[i]);
            out.insert(format!("0x{:x}", b.previous), state.previous_derivatives[i]);
        }
        out.insert("0x54b4f0".into(), state.copied_state);
        out.insert("0x54bba4".into(), event);
        self.singles.extend(out.clone());
        Ok(NativeIntegrationOutput { singles: out })
    }
}

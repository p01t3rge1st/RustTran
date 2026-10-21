//! Coordinator source/flux preparation and native relief argument binding.
use crate::{Result, native_globals::NativeGlobals, physics};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimarySourcesInputs {
    pub g54b6e0: f32,
    pub g54ba20: f32,
    pub g54ba1c: f32,
    pub g54b804: f32,
    pub g54ba28: f32,
    pub g54b494: f32,
}
impl PrimarySourcesInputs {
    pub fn calculate(&self) -> Result<BTreeMap<String, f32>> {
        if [
            self.g54b6e0,
            self.g54ba20,
            self.g54ba1c,
            self.g54b804,
            self.g54ba28,
            self.g54b494,
        ]
        .iter()
        .any(|v| !v.is_finite())
        {
            return Err("non-finite primary source operand".into());
        }
        let delta = (f64::from(self.g54b6e0) - 10.) as f32;
        if !delta.is_finite() {
            return Err("primary source threshold Single overflow".into());
        }
        let gate = if delta >= 0. { 1. } else { 0. };
        let flow = ((1. - gate) * f64::from(self.g54ba20)
            + f64::from(self.g54ba1c)
            + f64::from(self.g54b804)
            + f64::from(self.g54ba28)) as f32;
        if !flow.is_finite() {
            return Err("primary source sum Single overflow".into());
        }
        Ok(BTreeMap::from([
            ("0x54b6c4".into(), flow),
            (
                "0x54ba44".into(),
                physics::critical_discharge_flux(self.g54b494, 2)?,
            ),
            (
                "0x54ba48".into(),
                physics::critical_discharge_flux(self.g54b494, 1)?,
            ),
        ]))
    }
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReliefValveCommands {
    pub porv_a: i16,
    pub porv_b: i16,
    pub safety_valve: i16,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryReliefRequest {
    pub globals: NativeGlobals,
    pub valves: ReliefValveCommands,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryReliefOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
}
impl NativeGlobals {
    pub fn prepare_primary_sources(&mut self) -> Result<BTreeMap<String, f32>> {
        let out = PrimarySourcesInputs {
            g54b6e0: self.single(0x54b6e0)?,
            g54ba20: self.single(0x54ba20)?,
            g54ba1c: self.single(0x54ba1c)?,
            g54b804: self.single(0x54b804)?,
            g54ba28: self.single(0x54ba28)?,
            g54b494: self.single(0x54b494)?,
        }
        .calculate()?;
        self.singles.extend(out.clone());
        Ok(out)
    }
    /// Native numerical branch with explicit GUI valve values. The mixture
    /// level is unconditionally stored by original 0x50f6db, not a default.
    pub fn advance_relief_discharge(
        &mut self,
        valves: &ReliefValveCommands,
    ) -> Result<PrimaryReliefOutput> {
        let mixture_level = f32::from_bits(0x3f7ae148);
        let out = crate::relief::ReliefInputs {
            pressure: self.single(0x54b494)?,
            porv_area: self.single(0x54b138)?,
            safety_area: self.single(0x54b13c)?,
            porv_a: valves.porv_a,
            porv_b: valves.porv_b,
            safety_valve: valves.safety_valve,
            level: self.single(0x54b4a0)?,
            reset_level: self.single(0x54b400)?,
            mixture_level,
            phase_flag: self.integer(0x54b4d0)?,
            liquid_flux: self.single(0x54ba48)?,
            vapor_flux: self.single(0x54ba44)?,
            liquid_enthalpy: self.single(0x54b728)?,
            vapor_enthalpy: self.single(0x54b724)?,
            g54b6ac: self.single(0x54b6ac)?,
        }
        .discharge()?;
        let singles = BTreeMap::from([
            ("0x54b408".into(), mixture_level),
            ("0x54b6a8".into(), out.flow),
            ("0x54b73c".into(), out.enthalpy),
        ]);
        let integers = BTreeMap::from([("0x54b4d0".into(), i32::from(out.phase_flag))]);
        self.singles.extend(singles.clone());
        self.integers.extend(integers.clone());
        Ok(PrimaryReliefOutput { singles, integers })
    }
    pub fn advance_primary_relief(
        &mut self,
        valves: &ReliefValveCommands,
    ) -> Result<PrimaryReliefOutput> {
        let mut staged = self.clone();
        let sources = staged.prepare_primary_sources()?;
        let mut out = staged.advance_relief_discharge(valves)?;
        out.singles.extend(sources);
        *self = staged;
        Ok(out)
    }
}

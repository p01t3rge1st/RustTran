//! Connected recovered numerical pipeline. Explicit or recovered SG derivatives, plant cached
//! properties, event sources and all history states are explicit boundaries.
//! This is not the complete original plant timestep/event dispatcher.
use crate::{
    Result, heaters::HeaterControls, native_globals::NativeGlobals,
    primary_sources::ReliefValveCommands, relief::ReliefTailOutput, spray::SprayControls,
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
pub const STEAM_DERIVATIVES: [u32; 6] =
    [0x54b7d0, 0x54b7d4, 0x54b7d8, 0x54b7dc, 0x54b7e0, 0x54b7e4];
/// Normal model only (native 0x54bec8 == 0). Both loop callers use event 8.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct NormalThermalControls {
    pub fault_flag: i16,
    pub failure_time: f32,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RecoveredStepControls {
    #[serde(default, skip_serializing_if = "is_false")]
    pub loop_transport: bool,
    #[serde(default)]
    pub capture_control_commands: bool,
    #[serde(default)]
    pub event_schedule: Option<Box<crate::restored_controls::EventSchedule>>,
    /// Recovered coordinator references, before device automation.
    #[serde(default)]
    pub references: Option<crate::primary_references::ReferenceControls>,
    /// Recovered charging, letdown and injection producer. When omitted these
    /// source globals must still be supplied by the caller.
    #[serde(default)]
    pub devices: Option<crate::primary_devices::PrimaryDeviceUpdate>,
    #[serde(default)]
    pub rcp: Option<crate::rcp_control::RcpControls>,
    /// Original accumulator activation and discharge before source-flow summing.
    #[serde(default)]
    pub accumulator: Option<[crate::accumulator::ValveState; 2]>,
    #[serde(default)]
    pub supply: Option<Box<crate::supply_system::SupplyUpdate>>,
    /// Produce current thermal driving and A/B loop heat before the SGs.
    /// Omission retains the explicit cached-input boundary for older callers.
    #[serde(default)]
    pub normal_thermal: Option<NormalThermalControls>,
    #[serde(default)]
    pub steam_controls: Option<crate::steam_control::SteamControlPair>,
    #[serde(default)]
    pub steam_valves: Option<crate::steam_valves::SteamValveControls>,
    #[serde(default)]
    pub steam_auxiliary_percent: Option<[i16; 2]>,
    pub clock: f32,
    pub step: f32,
    pub command_percent: i16,
    pub fault_flag: i16,
    pub pump_contributions: [f32; 2],
    pub heaters: HeaterControls,
    pub spray: SprayControls,
    pub valves: ReliefValveCommands,
    pub tail_control_state: i16,
    pub activation_time: f32,
    /// Fresh outputs of the external SG numerical producer for this update,
    /// mutually exclusive with steam_phase_flags.
    #[serde(default)]
    pub steam_derivatives: Option<[f32; 6]>,
    /// Compute fresh SG derivatives from the recovered exchange blocks instead.
    #[serde(default)]
    pub steam_phase_flags: Option<[i16; 2]>,
}
fn is_false(value: &bool) -> bool {
    !value
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RecoveredStepRequest {
    pub globals: NativeGlobals,
    pub controls: RecoveredStepControls,
}
#[derive(Clone, Debug, Serialize)]
pub struct RecoveredStepOutput {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub primary_commands: Option<PrimaryControlCommands>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub event_bindings: Option<crate::restored_controls::EventBindings>,
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    pub relief_tail: ReliefTailOutput,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub primary_devices: Option<crate::primary_devices::PrimaryDevicesOutput>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub rcp: Option<crate::rcp_control::RcpControlOutput>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub accumulator: Option<crate::accumulator_system::AccumulatorSystemOutput>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub supply: Option<crate::supply_system::SupplyOutput>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub thermal_loops: Option<[crate::loop_transfer::LoopTransferOutput; 2]>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub steam_controls: Option<Vec<crate::steam_control::SteamControlOutput>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub steam_valves: Option<Vec<crate::steam_valves::SteamValveOutput>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub steam_auxiliary: Option<Vec<crate::steam_auxiliary::SteamAuxiliaryOutput>>,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct PrimaryControlCommands {
    pub heaters: HeaterControls,
    pub spray: SprayControls,
}
impl NativeGlobals {
    pub fn advance_recovered_primary_step(
        &mut self,
        c: &RecoveredStepControls,
    ) -> Result<RecoveredStepOutput> {
        let bound = c
            .event_schedule
            .as_ref()
            .map(|events| events.bind(c))
            .transpose()?;
        let c = bound.as_ref().map_or(c, |(controls, _)| controls);
        let event_bindings = bound.as_ref().map(|(_, bindings)| bindings.clone());
        if !c.clock.is_finite()
            || !c.step.is_finite()
            || c.step <= 0.
            || c.steam_derivatives
                .as_ref()
                .is_some_and(|d| d.iter().any(|v| !v.is_finite()))
        {
            return Err("invalid recovered update time or steam derivatives".into());
        }
        if c.steam_derivatives.is_some() == c.steam_phase_flags.is_some() {
            return Err("choose exactly one steam derivative source: explicit values or exchange phase flags".into());
        }
        if (c.steam_controls.is_some() || c.steam_valves.is_some())
            && c.steam_phase_flags != Some([0, 1])
        {
            return Err(
                "SG control/valve stages require computed exchanges with native A/B selectors [0,1]"
                    .into(),
            );
        }
        if c.steam_auxiliary_percent.is_some() && c.steam_valves.is_none() {
            return Err("SG auxiliary stage requires the valve/outflow producer".into());
        }
        let mut g = self.clone();
        let mut singles =
            BTreeMap::from([("0x54b40c".into(), c.clock), ("0x54b414".into(), c.step)]);
        g.singles.extend(singles.clone());
        singles.extend(g.prepare_primary_properties()?);
        if let Some(references) = &c.references {
            singles.extend(g.prepare_primary_references(references)?);
        }
        let primary_devices = c
            .devices
            .as_ref()
            .map(|devices| g.advance_primary_devices(&devices.controls, &devices.curve))
            .transpose()?;
        let mut integers = BTreeMap::new();
        if let Some(devices) = &primary_devices {
            singles.extend(devices.singles.clone());
            integers.extend(devices.integers.clone());
        }
        let rcp = c
            .rcp
            .as_ref()
            .map(|controls| g.advance_rcp_control(controls))
            .transpose()?;
        if let Some(output) = &rcp {
            singles.extend(output.singles.clone());
            integers.extend(output.integers.clone());
        }
        let supply = c
            .supply
            .as_ref()
            .map(|s| g.advance_supply_system(&s.controls, &s.curve))
            .transpose()?;
        if let Some(output) = &supply {
            singles.extend(output.singles.clone());
            integers.extend(output.integers.clone());
        }
        let accumulator = c
            .accumulator
            .map(|valves| g.advance_accumulator_system(valves))
            .transpose()?;
        if let Some(output) = &accumulator {
            singles.extend(output.singles.clone());
            integers.extend(output.integers.clone());
        }
        let source = g.advance_primary_relief(&c.valves)?;
        singles.extend(source.singles);
        integers.extend(source.integers);
        let relief_tail = g.advance_relief_tail(c.tail_control_state)?;
        singles.insert("0x54bf9c".into(), relief_tail.g54bf9c);
        let thermal_loops = if let Some(thermal) = &c.normal_thermal {
            if g.integer(0x54bec8)? != 0 {
                return Err("connected normal thermal transfer requires model mode 0; external-model dispatch is not connected".into());
            }
            singles.extend(g.prepare_thermal_mode(thermal.fault_flag, 0, None)?);
            // Original caller copies the A reference to B before both loops.
            let reference = g.single(0x54b50c)?;
            g.singles.insert("0x54b510".into(), reference);
            singles.insert("0x54b510".into(), reference);
            let a =
                g.advance_loop_transfer(crate::native_globals::LoopSide::A, thermal.failure_time)?;
            let b =
                g.advance_loop_transfer(crate::native_globals::LoopSide::B, thermal.failure_time)?;
            for address in [
                0x54b6b8, 0x54b6bc, 0x54b844, 0x54b848, 0x54b67c, 0x54b680, 0x54b4c4, 0x54b4c8,
            ] {
                singles.insert(format!("0x{address:x}"), g.single(address)?);
            }
            Some([a, b])
        } else {
            None
        };
        let mut steam_controls = Vec::new();
        let mut steam_valves = Vec::new();
        let mut steam_auxiliary = Vec::new();
        let mut valve_state = c.steam_valves.clone();
        let mut selected = c.steam_controls.as_ref().is_some_and(|v| v.fault_selected);
        if let Some(d) = c.steam_derivatives {
            for (a, v) in STEAM_DERIVATIVES.into_iter().zip(d) {
                let key = format!("0x{a:x}");
                g.singles.insert(key.clone(), v);
                singles.insert(key, v);
            }
        } else if let Some(flags) = c.steam_phase_flags {
            for (side, phase, addresses) in [
                (
                    crate::native_globals::LoopSide::A,
                    flags[0],
                    [0x54b4fc, 0x54b560, 0x54b7d0, 0x54b7d8, 0x54b7e0],
                ),
                (
                    crate::native_globals::LoopSide::B,
                    flags[1],
                    [0x54b500, 0x54b564, 0x54b7d4, 0x54b7dc, 0x54b7e4],
                ),
            ] {
                if let Some(controls) = &c.steam_controls {
                    let index = if matches!(side, crate::native_globals::LoopSide::A) {
                        0
                    } else {
                        1
                    };
                    let control = crate::steam_control::SteamControls {
                        failure_time: controls.failure_time,
                        fault_flag: controls.fault_flag,
                        fault_selected: selected,
                        feedwater_percent: valve_state
                            .as_ref()
                            .map_or(controls.feedwater_percent[index], |v| {
                                v.feedwater[index].percent
                            }),
                    };
                    let result = g.advance_steam_control(side, &control)?;
                    selected = result.fault_selected;
                    singles.extend(result.singles.clone());
                    steam_controls.push(result);
                }
                if let Some(controls) = &valve_state {
                    let result = g.advance_steam_valves(side, controls)?;
                    singles.extend(result.singles.clone());
                    valve_state = Some(result.controls.clone());
                    steam_valves.push(result);
                }
                if let Some(percentages) = c.steam_auxiliary_percent {
                    let result = g.advance_steam_auxiliary(side, percentages)?;
                    singles.extend(result.singles.clone());
                    steam_auxiliary.push(result);
                    g.advance_steam_exchange(side, phase)?;
                    let address = Self::steam_addresses(side)[(0xa0 - 8) / 4];
                    singles.insert(format!("0x{address:x}"), g.single(address)?);
                } else {
                    g.advance_steam_exchange(side, phase)?;
                }
                for a in addresses {
                    singles.insert(format!("0x{a:x}"), g.single(a)?);
                }
            }
        }
        let primary = g.advance_primary_control_cycle(
            c.command_percent,
            c.fault_flag,
            c.pump_contributions,
            &c.heaters,
            &c.spray,
        )?;
        let primary_commands = if c.capture_control_commands {
            Some(PrimaryControlCommands {
                heaters: primary
                    .heater_commands
                    .ok_or("missing recovered heater commands")?,
                spray: primary
                    .spray_commands
                    .ok_or("missing recovered spray commands")?,
            })
        } else {
            None
        };
        singles.extend(primary.singles);
        integers.extend(primary.integers);
        if c.loop_transport {
            singles.extend(g.advance_loop_transport()?);
        }
        let stream = g.prepare_stream_balance()?;
        singles.insert("0x54b674".into(), stream.g54b674);
        singles.insert("0x54b4b8".into(), stream.g54b4b8);
        singles.extend(g.advance_native_integration(c.activation_time)?.singles);
        *self = g;
        Ok(RecoveredStepOutput {
            primary_commands,
            event_bindings,
            singles,
            integers,
            relief_tail,
            steam_controls: c.steam_controls.as_ref().map(|_| steam_controls),
            steam_valves: c.steam_valves.as_ref().map(|_| steam_valves),
            steam_auxiliary: c.steam_auxiliary_percent.map(|_| steam_auxiliary),
            primary_devices,
            rcp,
            accumulator,
            supply,
            thermal_loops,
        })
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RecoveredRunRequest {
    pub globals: NativeGlobals,
    pub updates: Vec<RecoveredStepControls>,
}
impl NativeGlobals {
    /// Atomic explicit-input sequence, not the original scenario scheduler.
    /// Timestamps must follow the previous update's Single clock + step.
    pub fn advance_recovered_primary_run(
        &mut self,
        updates: &[RecoveredStepControls],
    ) -> Result<Vec<RecoveredStepOutput>> {
        if updates.is_empty() {
            return Err("recovered run requires at least one update".into());
        }
        let mut staged = self.clone();
        let mut results = Vec::with_capacity(updates.len());
        for (i, c) in updates.iter().enumerate() {
            if i > 0 {
                let previous = &updates[i - 1];
                let expected = (f64::from(previous.clock) + f64::from(previous.step)) as f32;
                if !expected.is_finite() || c.clock != expected {
                    return Err(format!(
                        "non-contiguous recovered update clock at index {i}: expected {expected}"
                    )
                    .into());
                }
            }
            results.push(
                staged
                    .advance_recovered_primary_step(c)
                    .map_err(|e| format!("recovered update {i}: {e}"))?,
            );
        }
        *self = staged;
        Ok(results)
    }
}

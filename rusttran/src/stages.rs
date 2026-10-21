//! Explicitly ordered recovered stages with an atomic shared-state commit.
//! This is a construction API, not the original plant/event dispatcher.
use crate::{
    Result,
    native_globals::{LoopSide, NativeGlobals},
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(tag = "kind", rename_all = "snake_case", deny_unknown_fields)]
pub enum RecoveredStage {
    LoopTransport,
    StartupConstants,
    StartupGeometry,
    StartupClock,
    Heaters {
        controls: crate::heaters::HeaterControls,
    },
    AccumulatorSystem {
        valves: [crate::accumulator::ValveState; 2],
    },
    SupplySystem {
        controls: crate::supply_system::SupplyControls,
        curve: crate::controller::InjectionCurve,
    },
    Spray {
        controls: crate::spray::SprayControls,
    },
    PrimaryControlFeedback {
        local_78: f32,
    },
    PrimaryControlCycle {
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
        heaters: crate::heaters::HeaterControls,
        spray: crate::spray::SprayControls,
    },
    RecoveredPrimaryRun {
        updates: Vec<crate::recovered_step::RecoveredStepControls>,
    },
    RecoveredPrimaryStep {
        controls: crate::recovered_step::RecoveredStepControls,
    },
    ReliefTail {
        control_state: i16,
    },
    PrimaryDevices {
        controls: crate::primary_devices::PrimaryDeviceControls,
        curve: crate::controller::InjectionCurve,
    },
    PrimaryReferences {
        controls: crate::primary_references::ReferenceControls,
    },
    PrimarySources,
    ReliefDischarge {
        valves: crate::primary_sources::ReliefValveCommands,
    },
    PrimaryRelief {
        valves: crate::primary_sources::ReliefValveCommands,
    },
    NewProcessStorage,
    IntegratorAlias,
    StreamBalance,
    CurrentDerivativeInit,
    NativeIntegration {
        activation_time: f32,
    },
    RestoredControls {
        events: crate::restored_controls::EventSchedule,
    },
    FreshControlHistory {
        fault_flag: i16,
    },
    LateThermalInit,
    FreshAuxiliaryInit,
    FreshFeedwaterInit,
    FreshThermalCoefficients,
    FreshSteamInit,
    FreshPrimaryInventoryInit,
    FreshPrimaryInit,
    PressureControlInit,
    PressureControlSignal,
    NumericConstants,
    LoopReference,
    ThermalCoefficient,
    PrimaryProperties,
    PrimaryLiquid,
    PrimaryHeatCapacity,
    PrimaryCoreWithControls {
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
        heaters: crate::heaters::HeaterControls,
        spray: crate::spray::SprayControls,
    },
    PrimaryCoreWithHeaters {
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
        controls: crate::heaters::HeaterControls,
    },
    PrimaryCore {
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
    },
    PrimaryPhaseState {
        local_ac: f32,
    },
    PrimaryFlow,
    PrimaryPhase {
        locals: crate::primary_phase::PrimaryPhaseLocals,
    },
    NormalPrimaryPhase {
        local_20: f32,
        local_54: f32,
        local_b0: f32,
    },
    PrimaryInventory {
        command_percent: i16,
        local_84: f32,
    },
    NormalLoops {
        clock: f32,
        failure_times: [f32; 2],
    },
    RcpControl {
        controls: crate::rcp_control::RcpControls,
    },
    RcpPair {
        trip_time: f32,
    },
    FeedwaterPi {
        side: LoopSide,
        fault_flag: i16,
        phase_flag: i16,
    },
    SteamAuxiliary {
        side: LoopSide,
        auxiliary_percent: [i16; 2],
    },
    SteamSystem {
        side: LoopSide,
        controls: crate::steam_system::SteamSystemControls,
    },
    SteamValves {
        side: LoopSide,
        controls: crate::steam_valves::SteamValveControls,
    },
    SteamControl {
        side: LoopSide,
        controls: crate::steam_control::SteamControls,
    },
    SteamExchange {
        side: LoopSide,
        phase_flag: i16,
    },
    PrimaryExchange {
        fault_flag: i16,
        pump_contributions: [f32; 2],
    },
    ThermalMode {
        fault_flag: i16,
        model_mode: i16,
        external: Option<crate::thermal_driving::ExternalThermalInputs>,
    },
}
#[derive(Debug, Serialize)]
pub struct StageResult {
    pub kind: String,
    pub solution: serde_json::Value,
}
impl NativeGlobals {
    pub fn prepare_thermal_mode(
        &mut self,
        fault_flag: i16,
        model_mode: i16,
        external: Option<crate::thermal_driving::ExternalThermalInputs>,
    ) -> Result<BTreeMap<String, f32>> {
        let normal = crate::thermal_driving::ThermalDrivingInputs {
            g54b558: self.single(0x54b558)?,
            g54b120: self.single(0x54b120)?,
            g54b41c: self.single(0x54b41c)?,
            g54b330: self.single(0x54b330)?,
            g54b550: self.single(0x54b550)?,
            g54b498: self.single(0x54b498)?,
            g54b6fc: self.single(0x54b6fc)?,
        };
        let values = crate::thermal_driving::ThermalModeInputs {
            normal,
            fault_flag,
            model_mode,
            prior_limit: self.single(0x54b190)?,
            prior_modifier: self.single(0x54ba68)?,
            external,
        }
        .calculate()?;
        self.singles.extend(values.clone());
        Ok(values)
    }
    /// Clone and commit once, so an error in any later stage cannot leave half
    /// of a requested update applied. No missing globals are initialized to zero.
    pub fn advance_stages(&mut self, stages: &[RecoveredStage]) -> Result<Vec<StageResult>> {
        let mut staged = self.clone();
        let mut results = Vec::with_capacity(stages.len());
        for (index, stage) in stages.iter().enumerate() {
            let kind = serde_json::to_value(stage)?["kind"]
                .as_str()
                .ok_or("missing stage kind")?
                .to_owned();
            let solution: Result<serde_json::Value> = (|| {
                Ok(match stage {
                    RecoveredStage::LoopTransport => {
                        serde_json::to_value(staged.advance_loop_transport()?)?
                    }
                    RecoveredStage::StartupClock => {
                        serde_json::to_value(staged.initialize_startup_clock()?)?
                    }
                    RecoveredStage::StartupConstants => {
                        serde_json::to_value(staged.initialize_startup_constants())?
                    }
                    RecoveredStage::StartupGeometry => {
                        serde_json::to_value(staged.initialize_startup_geometry()?)?
                    }
                    RecoveredStage::SupplySystem { controls, curve } => {
                        serde_json::to_value(staged.advance_supply_system(controls, curve)?)?
                    }
                    RecoveredStage::AccumulatorSystem { valves } => {
                        serde_json::to_value(staged.advance_accumulator_system(*valves)?)?
                    }
                    RecoveredStage::Heaters { controls } => {
                        serde_json::to_value(staged.prepare_heaters(controls)?)?
                    }
                    RecoveredStage::Spray { controls } => {
                        serde_json::to_value(staged.prepare_spray(controls)?)?
                    }
                    RecoveredStage::PrimaryControlFeedback { local_78 } => {
                        serde_json::to_value(staged.prepare_primary_feedback(*local_78)?)?
                    }
                    RecoveredStage::PrimaryControlCycle {
                        command_percent,
                        fault_flag,
                        pump_contributions,
                        heaters,
                        spray,
                    } => serde_json::to_value(staged.advance_primary_control_cycle(
                        *command_percent,
                        *fault_flag,
                        *pump_contributions,
                        heaters,
                        spray,
                    )?)?,
                    RecoveredStage::RecoveredPrimaryRun { updates } => {
                        serde_json::to_value(staged.advance_recovered_primary_run(updates)?)?
                    }
                    RecoveredStage::RecoveredPrimaryStep { controls } => {
                        serde_json::to_value(staged.advance_recovered_primary_step(controls)?)?
                    }
                    RecoveredStage::ReliefTail { control_state } => {
                        serde_json::to_value(staged.advance_relief_tail(*control_state)?)?
                    }
                    RecoveredStage::PrimaryDevices { controls, curve } => {
                        serde_json::to_value(staged.advance_primary_devices(controls, curve)?)?
                    }
                    RecoveredStage::PrimaryReferences { controls } => {
                        serde_json::to_value(staged.prepare_primary_references(controls)?)?
                    }
                    RecoveredStage::PrimarySources => {
                        serde_json::to_value(staged.prepare_primary_sources()?)?
                    }
                    RecoveredStage::ReliefDischarge { valves } => {
                        serde_json::to_value(staged.advance_relief_discharge(valves)?)?
                    }
                    RecoveredStage::PrimaryRelief { valves } => {
                        serde_json::to_value(staged.advance_primary_relief(valves)?)?
                    }
                    RecoveredStage::NewProcessStorage => {
                        serde_json::to_value(staged.initialize_new_process_storage()?)?
                    }
                    RecoveredStage::IntegratorAlias => {
                        serde_json::to_value(staged.initialize_integrator_alias()?)?
                    }
                    RecoveredStage::StreamBalance => {
                        serde_json::to_value(staged.prepare_stream_balance()?)?
                    }
                    RecoveredStage::CurrentDerivativeInit => {
                        serde_json::to_value(staged.initialize_current_derivative_outputs())?
                    }
                    RecoveredStage::NativeIntegration { activation_time } => {
                        serde_json::to_value(staged.advance_native_integration(*activation_time)?)?
                    }
                    RecoveredStage::RestoredControls { events } => {
                        serde_json::to_value(staged.initialize_restored_controls(events)?)?
                    }
                    RecoveredStage::FreshControlHistory { fault_flag } => {
                        serde_json::to_value(staged.initialize_fresh_control_history(*fault_flag)?)?
                    }
                    RecoveredStage::LateThermalInit => {
                        serde_json::to_value(staged.initialize_late_thermal()?)?
                    }
                    RecoveredStage::FreshAuxiliaryInit => {
                        serde_json::to_value(staged.initialize_fresh_auxiliary()?)?
                    }
                    RecoveredStage::FreshFeedwaterInit => {
                        serde_json::to_value(staged.initialize_fresh_feedwater()?)?
                    }
                    RecoveredStage::FreshThermalCoefficients => {
                        serde_json::to_value(staged.initialize_fresh_thermal_coefficients()?)?
                    }
                    RecoveredStage::FreshSteamInit => {
                        serde_json::to_value(staged.initialize_fresh_steam()?)?
                    }
                    RecoveredStage::FreshPrimaryInventoryInit => {
                        serde_json::to_value(staged.initialize_fresh_primary_inventory()?)?
                    }
                    RecoveredStage::FreshPrimaryInit => {
                        serde_json::to_value(staged.initialize_fresh_primary()?)?
                    }
                    RecoveredStage::PressureControlInit => {
                        serde_json::to_value(staged.initialize_pressure_control()?)?
                    }
                    RecoveredStage::PressureControlSignal => {
                        serde_json::to_value(staged.prepare_pressure_control_signal()?)?
                    }
                    RecoveredStage::NumericConstants => {
                        let values = BTreeMap::from([
                            ("0x54b330".to_owned(), crate::bindings::HEAT_FACTOR),
                            ("0x54b70c".to_owned(), crate::bindings::NATIVE_G54B70C),
                            ("0x54b334".to_owned(), crate::bindings::PRESSURE_WORK),
                        ]);
                        staged.singles.extend(values.clone());
                        serde_json::to_value(values)?
                    }
                    RecoveredStage::LoopReference => {
                        serde_json::to_value(staged.initialize_loop_reference()?)?
                    }
                    RecoveredStage::ThermalCoefficient => {
                        serde_json::json!({"0x54b6fc":staged.initialize_thermal_driving()?})
                    }
                    RecoveredStage::PrimaryProperties => {
                        serde_json::to_value(staged.prepare_primary_properties()?)?
                    }
                    RecoveredStage::PrimaryInventory {
                        command_percent,
                        local_84,
                    } => serde_json::to_value(
                        staged.prepare_primary_inventory(*command_percent, *local_84)?,
                    )?,
                    RecoveredStage::NormalPrimaryPhase {
                        local_20,
                        local_54,
                        local_b0,
                    } => serde_json::to_value(
                        staged.prepare_normal_primary_phase(*local_20, *local_54, *local_b0)?,
                    )?,
                    RecoveredStage::PrimaryCoreWithControls {
                        command_percent,
                        fault_flag,
                        pump_contributions,
                        heaters,
                        spray,
                    } => serde_json::to_value(staged.advance_primary_core_with_controls(
                        *command_percent,
                        *fault_flag,
                        *pump_contributions,
                        Some(heaters),
                        Some(spray),
                    )?)?,
                    RecoveredStage::PrimaryCoreWithHeaters {
                        command_percent,
                        fault_flag,
                        pump_contributions,
                        controls,
                    } => serde_json::to_value(staged.advance_primary_core_with_heaters(
                        *command_percent,
                        *fault_flag,
                        *pump_contributions,
                        Some(controls),
                    )?)?,
                    RecoveredStage::PrimaryCore {
                        command_percent,
                        fault_flag,
                        pump_contributions,
                    } => serde_json::to_value(staged.advance_primary_core(
                        *command_percent,
                        *fault_flag,
                        *pump_contributions,
                    )?)?,
                    RecoveredStage::PrimaryHeatCapacity => {
                        serde_json::to_value(staged.prepare_primary_heat_capacity()?)?
                    }
                    RecoveredStage::PrimaryPhaseState { local_ac } => {
                        serde_json::to_value(staged.prepare_primary_phase_state(*local_ac)?)?
                    }
                    RecoveredStage::PrimaryFlow => {
                        serde_json::to_value(staged.prepare_primary_flow()?)?
                    }
                    RecoveredStage::PrimaryPhase { locals } => {
                        serde_json::to_value(staged.prepare_primary_phase(locals)?)?
                    }
                    RecoveredStage::PrimaryLiquid => {
                        serde_json::to_value(staged.prepare_primary_liquid()?)?
                    }
                    RecoveredStage::NormalLoops {
                        clock,
                        failure_times,
                    } => {
                        serde_json::to_value(staged.advance_normal_loops(*clock, *failure_times)?)?
                    }
                    RecoveredStage::RcpControl { controls } => {
                        serde_json::to_value(staged.advance_rcp_control(controls)?)?
                    }
                    RecoveredStage::RcpPair { trip_time } => {
                        serde_json::to_value(staged.advance_rcp_pair(*trip_time)?)?
                    }
                    RecoveredStage::FeedwaterPi {
                        side,
                        fault_flag,
                        phase_flag,
                    } => serde_json::to_value(staged.advance_feedwater_pi(
                        *side,
                        *fault_flag,
                        *phase_flag,
                    )?)?,
                    RecoveredStage::SteamAuxiliary {
                        side,
                        auxiliary_percent,
                    } => serde_json::to_value(
                        staged.advance_steam_auxiliary(*side, *auxiliary_percent)?,
                    )?,
                    RecoveredStage::SteamSystem { side, controls } => {
                        serde_json::to_value(staged.advance_steam_system(*side, controls)?)?
                    }
                    RecoveredStage::SteamValves { side, controls } => {
                        serde_json::to_value(staged.advance_steam_valves(*side, controls)?)?
                    }
                    RecoveredStage::SteamControl { side, controls } => {
                        serde_json::to_value(staged.advance_steam_control(*side, controls)?)?
                    }
                    RecoveredStage::SteamExchange { side, phase_flag } => {
                        serde_json::to_value(staged.advance_steam_exchange(*side, *phase_flag)?)?
                    }
                    RecoveredStage::PrimaryExchange {
                        fault_flag,
                        pump_contributions,
                    } => serde_json::to_value(
                        staged.prepare_primary_exchange(*fault_flag, *pump_contributions)?,
                    )?,
                    RecoveredStage::ThermalMode {
                        fault_flag,
                        model_mode,
                        external,
                    } => serde_json::to_value(staged.prepare_thermal_mode(
                        *fault_flag,
                        *model_mode,
                        external.clone(),
                    )?)?,
                })
            })();
            let solution = solution.map_err(|e| format!("stage {} ({kind}): {e}", index + 1))?;
            results.push(StageResult { kind, solution });
        }
        *self = staged;
        Ok(results)
    }
}

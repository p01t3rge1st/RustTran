use rusttran::{Database, Result};
use serde::Serialize;
use std::path::PathBuf;

fn math(arguments: impl Iterator<Item = String>) -> Result<()> {
    use rusttran::physics;
    let mut arguments = arguments;
    let function = arguments
        .next()
        .ok_or("math requires FUNCTION")?
        .to_uppercase();
    let values = arguments
        .map(|value| value.parse::<f64>())
        .collect::<std::result::Result<Vec<_>, _>>()?;
    let expected = match function.as_str() {
        "EULER" => 4,
        "HLIQ" | "VLIQ" => 2,
        "DECAY" | "HFLD" | "HGAS" | "VFLD" | "TLIQ" | "PSAT" | "VGAS" | "P_FROM_VGAS" => 1,
        _ => return Err(format!("unknown math function: {function}").into()),
    };
    if values.len() != expected {
        return Err(format!("{function} requires {expected} numeric arguments").into());
    }
    if function == "EULER" {
        let result = physics::euler(values[0], values[1], values[2], values[3])?;
        return print(
            &serde_json::json!({"function": function, "state": result.state, "previous_derivative": result.previous_derivative, "scale": result.scale}),
        );
    }
    if function == "HLIQ" {
        let result = physics::liquid_enthalpy(values[0] as f32, values[1] as f32)?;
        return print(
            &serde_json::json!({"function": function, "value": result, "units": "pressure psia, temperature degF, enthalpy Btu/lb"}),
        );
    }
    let result = match function.as_str() {
        "DECAY" => physics::decay(values[0])?,
        "HFLD" => physics::hfld(values[0] as f32)?,
        "HGAS" => physics::hgas(values[0] as f32)?,
        "VFLD" => physics::vfld(values[0] as f32)?,
        "VLIQ" => physics::liquid_specific_volume(values[0] as f32, values[1] as f32)?,
        "P_FROM_VGAS" => physics::pressure_from_vapor_volume(values[0] as f32)?,
        "TLIQ" => physics::saturation_temperature(values[0] as f32)?,
        "PSAT" => physics::saturation_pressure(values[0] as f32)?,
        "VGAS" => physics::vapor_specific_volume(values[0] as f32)?,
        _ => unreachable!(),
    };
    print(
        &serde_json::json!({"function": function, "value": result, "units": "raw recovered units; property pressure psia, temperature degF, enthalpy Btu/lb, specific volume ft3/lb"}),
    )
}

fn print(value: &impl Serialize) -> Result<()> {
    println!("{}", serde_json::to_string_pretty(value)?);
    Ok(())
}

fn run() -> Result<()> {
    let mut args = std::env::args().skip(1);
    let mut root = None;
    let mut database = "ListData".to_owned();
    let command = loop {
        match args.next().as_deref() {
            Some("--data-root") => {
                root = Some(PathBuf::from(
                    args.next().ok_or("--data-root needs a path")?,
                ))
            }
            Some("--database") => database = args.next().ok_or("--database needs a name")?,
            Some("--help" | "-h") | None => {
                println!(
                    "rusttran-cli [--data-root PATH] [--database NAME] COMMAND\nCommands: tables, models, parameters SET, conditions, condition IC, malfunctions, table NAME, status, math FUNCTION ARGS, vessel-step INPUT.json, pump-step INPUT.json, pump-pair-step INPUT.json, accumulator-step INPUT.json, accumulator-activate INPUT.json, accumulator-system-step INPUT.json, relief-step INPUT.json, saturated-step INPUT.json, steam-generator-step INPUT.json, controller-step INPUT.json, supply-tank-step INPUT.json, supply-system-step INPUT.json, steam-outflow-step INPUT.json, pressurizer-init INPUT.json, startup-heat INPUT.json, integration-restore INPUT.json, loop-transfer-step INPUT.json, primary-properties INPUT.json, primary-liquid-properties INPUT.json, primary-exchange INPUT.json, primary-inventory INPUT.json, normal-primary-phase INPUT.json, primary-core INPUT.json, recovered-primary-run INPUT.json, recovered-session-run INPUT.json, recovered-primary-step INPUT.json, relief-tail-state INPUT.json, steam-system-step INPUT.json, steam-auxiliary-step INPUT.json, steam-valves-step INPUT.json, steam-control-step INPUT.json, rcp-control-step INPUT.json, primary-devices-step INPUT.json, primary-sources INPUT.json, primary-relief-step INPUT.json, native-integration-step INPUT.json, restored-control-state INPUT.json, fresh-control-history INPUT.json, alternate-init INPUT.json, late-thermal-init INPUT.json, fresh-initial-state INPUT.json, fresh-thermal-startup INPUT.json, fresh-feedwater-init INPUT.json, fresh-steam-init INPUT.json, fresh-primary-startup INPUT.json, primary-control-cycle INPUT.json, fresh-primary-inventory-init INPUT.json, fresh-primary-init INPUT.json, primary-control-feedback INPUT.json, pressure-control-init INPUT.json, pressure-control-signal INPUT.json, spray-control INPUT.json, heater-control INPUT.json, primary-correction INPUT.json, primary-heat-capacity INPUT.json, primary-flow-preparation INPUT.json, primary-phase-state INPUT.json, primary-phase INPUT.json, primary-core INPUT.json, primary-correction INPUT.json, primary-heat-capacity INPUT.json, primary-flow-preparation INPUT.json, primary-phase-state INPUT.json, loop-reference-init INPUT.json, thermal-driving INPUT.json, feedwater-pi-step INPUT.json, thermal-mode-step INPUT.json, decay-heat INPUT.json, normal-loops-step INPUT.json, native-stages INPUT.json, native-seed IC, model-seed SET\nMath: DECAY time; EULER current previous step state; HFLD/HGAS/VFLD/TLIQ/VGAS pressure; PSAT temperature; HLIQ/VLIQ pressure temperature; P_FROM_VGAS volume.\nProperty units: psia, degF, Btu/lb, ft3/lb; no metric conversion.\nUse rusttran for the desktop Simulation workspace and initial-condition views. Full plant reconstruction remains incomplete."
                );
                return Ok(());
            }
            Some(command) => break command.to_owned(),
        }
    };
    if command == "math" {
        return math(args);
    }
    if [
        "vessel-step",
        "pump-step",
        "pump-pair-step",
        "accumulator-step",
        "accumulator-activate",
        "accumulator-system-step",
        "relief-step",
        "saturated-step",
        "steam-generator-step",
        "controller-step",
        "supply-tank-step",
        "supply-system-step",
        "steam-outflow-step",
        "pressurizer-init",
        "startup-heat",
        "integration-restore",
        "loop-transfer-step",
        "primary-properties",
        "primary-liquid-properties",
        "primary-exchange",
        "primary-inventory",
        "normal-primary-phase",
        "primary-phase",
        "primary-core",
        "recovered-primary-run",
        "recovered-session-run",
        "recovered-primary-step",
        "relief-tail-state",
        "steam-auxiliary-step",
        "steam-system-step",
        "steam-valves-step",
        "steam-control-step",
        "rcp-control-step",
        "primary-devices-step",
        "primary-sources",
        "primary-relief-step",
        "native-integration-step",
        "restored-control-state",
        "fresh-control-history",
        "late-thermal-init",
        "alternate-init",
        "fresh-thermal-startup",
        "fresh-initial-state",
        "fresh-feedwater-init",
        "fresh-steam-init",
        "fresh-primary-startup",
        "primary-control-cycle",
        "fresh-primary-inventory-init",
        "fresh-primary-init",
        "primary-control-feedback",
        "pressure-control-init",
        "pressure-control-signal",
        "spray-control",
        "heater-control",
        "primary-correction",
        "primary-heat-capacity",
        "primary-flow-preparation",
        "primary-phase-state",
        "loop-reference-init",
        "thermal-driving",
        "feedwater-pi-step",
        "thermal-mode-step",
        "decay-heat",
        "normal-loops-step",
        "native-stages",
    ]
    .contains(&command.as_str())
    {
        let path = args
            .next()
            .ok_or("component step requires a JSON input file")?;
        if args.next().is_some() {
            return Err("unexpected extra argument".into());
        }
        let bytes = std::fs::read(path)?;
        if command == "vessel-step" {
            #[derive(serde::Deserialize)]
            #[serde(deny_unknown_fields)]
            struct Request {
                state: rusttran::vessel::VesselState,
                inputs: rusttran::vessel::VesselInputs,
            }
            let request: Request = serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered vessel component; not a complete plant simulation","solution":request.inputs.solve(&request.state)?}),
            );
        }
        if command == "accumulator-step" {
            let request: rusttran::accumulator::AccumulatorInputs = serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered accumulator discharge; activation and valves are supplied inputs", "solution":request.advance()?}),
            );
        }
        if command == "integration-restore" {
            #[derive(serde::Deserialize)]
            #[serde(deny_unknown_fields)]
            struct Request {
                ic: String,
                extra: rusttran::integration::ExtraIntegratedState,
                previous_derivatives: [f32; 14],
            }
            let request: Request = serde_json::from_slice(&bytes)?;
            let db = match &root {
                Some(root) => Database::new(root, &database)?,
                None => Database::embedded(&database)?,
            };
            let seed = rusttran::bindings::NativeSeed::condition(&db, &request.ic)?;
            return print(
                &serde_json::json!({"scope":"IC integrator inputs with two states and previous derivatives supplied explicitly; not complete plant initialization", "solution":rusttran::integration::IntegrationState::from_condition(&seed,&request.extra,request.previous_derivatives)?}),
            );
        }
        if command == "loop-reference-init" {
            #[derive(serde::Deserialize)]
            #[serde(deny_unknown_fields)]
            struct Request {
                model: String,
                ic: String,
            }
            let request: Request = serde_json::from_slice(&bytes)?;
            let db = match &root {
                Some(root) => Database::new(root, &database)?,
                None => Database::embedded(&database)?,
            };
            let model = rusttran::bindings::NativeSeed::model(&db, &request.model)?;
            let condition = rusttran::bindings::NativeSeed::condition(&db, &request.ic)?;
            let mut globals =
                rusttran::native_globals::NativeGlobals::from_seeds(&model, &condition)?;
            return print(
                &serde_json::json!({"scope":"Recovered reference initialization; full plant initialization remains incomplete", "solution":globals.initialize_loop_reference()?}),
            );
        }
        if command == "normal-loops-step" {
            #[derive(serde::Deserialize)]
            #[serde(deny_unknown_fields)]
            struct Request {
                model: String,
                ic: String,
                clock: f32,
                failure_times: [f32; 2],
            }
            let request: Request = serde_json::from_slice(&bytes)?;
            let db = match &root {
                Some(root) => Database::new(root, &database)?,
                None => Database::embedded(&database)?,
            };
            let model = rusttran::bindings::NativeSeed::model(&db, &request.model)?;
            let condition = rusttran::bindings::NativeSeed::condition(&db, &request.ic)?;
            let mut globals =
                rusttran::native_globals::NativeGlobals::from_seeds(&model, &condition)?;
            globals.initialize_loop_reference()?;
            globals.initialize_thermal_driving()?;
            let outputs = globals.advance_normal_loops(request.clock, request.failure_times)?;
            return print(
                &serde_json::json!({"scope":"Normal thermal driving and both loop components from IC; no plant integration or event dispatcher", "solution":outputs}),
            );
        }
        if command == "native-stages" {
            #[derive(serde::Deserialize)]
            #[serde(deny_unknown_fields)]
            struct Request {
                model: String,
                ic: String,
                stages: Vec<rusttran::stages::RecoveredStage>,
                #[serde(default)]
                extra_singles: std::collections::BTreeMap<String, f32>,
                #[serde(default)]
                extra_integers: std::collections::BTreeMap<String, i32>,
            }
            let request: Request = serde_json::from_slice(&bytes)?;
            let db = match &root {
                Some(root) => Database::new(root, &database)?,
                None => Database::embedded(&database)?,
            };
            let model = rusttran::bindings::NativeSeed::model(&db, &request.model)?;
            let condition = rusttran::bindings::NativeSeed::condition(&db, &request.ic)?;
            let mut globals =
                rusttran::native_globals::NativeGlobals::from_seeds(&model, &condition)?;
            globals.singles.extend(request.extra_singles);
            globals.integers.extend(request.extra_integers);
            let results = globals.advance_stages(&request.stages)?;
            return print(
                &serde_json::json!({"scope":"Explicit recovered-stage sequence; user-supplied order and missing operands, no original plant dispatcher", "solution":{"stages":results,"globals":globals}}),
            );
        }
        if command == "primary-core" {
            let mut request: rusttran::primary_core::PrimaryCoreRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Connected primary numerical core; optional recovered spray/heater controls; common pressure-control signal, cached properties and upstream components are explicit inputs; no full plant/event dispatcher","solution":request.globals.advance_primary_core_with_controls(request.command_percent,request.fault_flag,request.pump_contributions,request.heater_controls.as_ref(),request.spray_controls.as_ref())?}),
            );
        }
        if command == "recovered-session-run" {
            let mut q: rusttran::recovered_session::SessionRunRequest =
                serde_json::from_slice(&bytes)?;
            let steps = q.session.advance(q.steps)?;
            return print(
                &serde_json::json!({"scope":"Stateful recovered pipeline with retained actuator commands and explicit initial/unrecovered source state; not complete original plant scheduling or GUI trajectories","solution":{"session":q.session,"steps":steps}}),
            );
        }
        if command == "recovered-primary-run" {
            let mut q: rusttran::recovered_step::RecoveredRunRequest =
                serde_json::from_slice(&bytes)?;
            let steps = q.globals.advance_recovered_primary_run(&q.updates)?;
            return print(
                &serde_json::json!({"scope":"Explicit-input recovered numerical sequence; SG exchange inputs or explicit derivatives and remaining upstream sources supplied per update; not a whole-plant transient","solution":{"steps":steps,"globals":q.globals}}),
            );
        }
        if command == "recovered-primary-step" {
            let mut q: rusttran::recovered_step::RecoveredStepRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered sources/relief/primary-control/stream/integration pipeline; recovered SG exchange or explicit derivatives; remaining cached transfer/control/source inputs and history explicit; no complete plant dispatcher","solution":q.globals.advance_recovered_primary_step(&q.controls)?}),
            );
        }
        if command == "primary-relief-step" {
            let mut q: rusttran::primary_sources::PrimaryReliefRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered primary sources and relief discharge; valve commands and upstream equipment states explicit","solution":q.globals.advance_primary_relief(&q.valves)?}),
            );
        }
        if command == "native-integration-step" {
            let mut request: rusttran::integration::NativeIntegrationRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered 14-state integration and event update; upstream derivatives/history supplied explicitly, no complete plant timestep","solution":request.globals.advance_native_integration(request.activation_time)?}),
            );
        }
        if command == "supply-system-step" {
            let mut q: rusttran::supply_system::SupplyRequest = serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered supply/injection/recirculation decisions and native caller state; explicit COM controls, callbacks/logging/full dispatcher excluded","solution":q.globals.advance_supply_system(&q.controls,&q.curve)?}),
            );
        }
        if command == "accumulator-system-step" {
            let mut q: rusttran::accumulator_system::AccumulatorSystemRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered accumulator activation and discharge with native caller globals; explicit valve properties, no COM callbacks or complete plant dispatcher","solution":q.globals.advance_accumulator_system(q.valves)?}),
            );
        }
        if command == "restored-control-state" {
            let mut q: rusttran::restored_controls::RestoredControlRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Original restored controls and 20-event rebasing; full snapshot/plant dispatcher excluded","solution":q.globals.initialize_restored_controls(&q.events)?}),
            );
        }
        if command == "fresh-control-history" {
            let mut q: rusttran::fresh_control_history::FreshControlHistoryRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Original fresh Single control histories; restored/event/Double-model dispatch excluded","solution":q.globals.initialize_fresh_control_history(q.fault_flag)?}),
            );
        }
        if command == "alternate-init" {
            let request: rusttran::alternate_init::AlternateInitRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Original six-node Double/array initialization; evolution and COM excluded", "solution": request.initialize()?}),
            );
        }
        if command == "late-thermal-init" {
            let mut q: rusttran::late_thermal_init::LateThermalRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered late thermal numeric initializer; complete startup/Reset/restore excluded","solution":q.globals.initialize_late_thermal()?}),
            );
        }
        if command == "fresh-initial-state" {
            #[derive(serde::Deserialize)]
            #[serde(deny_unknown_fields)]
            struct Request {
                model: String,
                ic: String,
                fault_flag: i16,
            }
            let request: Request = serde_json::from_slice(&bytes)?;
            let db = match &root {
                Some(root) => Database::new(root, &database)?,
                None => Database::embedded(&database)?,
            };
            return print(
                &serde_json::json!({"scope":"All recovered fresh Single/reference/Double/array initialization; complete runtime histories, startup dispatcher and original restored files still excluded", "solution":rusttran::fresh_steam::prepare_fresh_state(&db,&request.model,&request.ic,request.fault_flag)?}),
            );
        }
        if command == "fresh-thermal-startup" {
            let request: rusttran::fresh_primary::FreshPrimaryStartupRequest =
                serde_json::from_slice(&bytes)?;
            let db = match &root {
                Some(root) => Database::new(root, &database)?,
                None => Database::embedded(&database)?,
            };
            return print(
                &serde_json::json!({"scope":"Recovered fresh primary/SG/feedwater preparation; complete initialization and transient engine remain incomplete","solution":rusttran::fresh_steam::prepare_thermal_startup(&db,&request.model,&request.ic)?}),
            );
        }
        if command == "fresh-primary-startup" {
            let request: rusttran::fresh_primary::FreshPrimaryStartupRequest =
                serde_json::from_slice(&bytes)?;
            let db = match &root {
                Some(root) => Database::new(root, &database)?,
                None => Database::embedded(&database)?,
            };
            return print(
                &serde_json::json!({"scope":"Authenticated fresh primary-system preparation; remaining plant initialization and full transient engine incomplete","solution":rusttran::fresh_primary::prepare_primary_startup(&db,&request.model,&request.ic)?}),
            );
        }
        if command == "primary-control-cycle" {
            let mut request: rusttran::primary_core::PrimaryCoreRequest =
                serde_json::from_slice(&bytes)?;
            let heaters = request
                .heater_controls
                .as_ref()
                .ok_or("primary control cycle requires heater_controls")?;
            let spray = request
                .spray_controls
                .as_ref()
                .ok_or("primary control cycle requires spray_controls")?;
            let out = request.globals.advance_primary_control_cycle(
                request.command_percent,
                request.fault_flag,
                request.pump_contributions,
                heaters,
                spray,
            )?;
            println!(
                "{}",
                serde_json::to_string_pretty(
                    &serde_json::json!({"scope":"Recovered primary control cycle with feedback; upstream states explicit; no full-plant integration or GUI trajectory validation","solution":out})
                )?
            );
            return Ok(());
        }
        if command == "steam-auxiliary-step" {
            let mut q: rusttran::steam_auxiliary::SteamAuxiliaryRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered SG auxiliary feedwater; complete plant dispatch excluded", "solution":q.globals.advance_steam_auxiliary(q.side,q.auxiliary_percent)?}),
            );
        }
        if command == "steam-system-step" {
            let mut q: rusttran::steam_system::SteamSystemRequest = serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Connected SG numerical/control body with explicit native commands; complete plant/GUI dispatch excluded", "solution":q.globals.advance_steam_system(q.side,&q.controls)?}),
            );
        }
        if command == "steam-valves-step" {
            let mut q: rusttran::steam_valves::SteamValveRequest = serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered SG valve decisions/outflow; later feedwater and full plant dispatch excluded", "solution":q.globals.advance_steam_valves(q.side,&q.controls)?}),
            );
        }
        if command == "steam-control-step" {
            let mut q: rusttran::steam_control::SteamControlRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered SG initial control prefix; later valve/device automation and complete plant dispatch excluded", "solution":q.globals.advance_steam_control(q.side,&q.controls)?}),
            );
        }
        if command == "rcp-control-step" {
            let mut q: rusttran::rcp_control::RcpControlRequest = serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered RCP switching/target/flow sequence with explicit UI properties and trip time; callbacks and full event dispatcher excluded", "solution":q.globals.advance_rcp_control(&q.controls)?}),
            );
        }
        if command == "primary-devices-step" {
            let mut q: rusttran::primary_devices::PrimaryDevicesRequest =
                serde_json::from_slice(&bytes)?;
            return print(
                &serde_json::json!({"scope":"Recovered primary device automation; COM state explicit, callbacks excluded; not a whole-plant trajectory", "solution":q.globals.advance_primary_devices(&q.controls, &q.curve)?}),
            );
        }
        let solution = match command.as_str() {
            "fresh-primary-inventory-init" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::fresh_primary::FreshPrimaryInventoryInputs>(
                    &bytes,
                )?
                .initialize()?,
            )?),
            "relief-tail-state" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::relief::ReliefTailInputs>(&bytes)?
                    .calculate()?,
            )?),
            "primary-sources" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_sources::PrimarySourcesInputs>(&bytes)?
                    .calculate()?,
            )?),
            "fresh-feedwater-init" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::fresh_steam::FreshFeedwaterInputs>(&bytes)?
                    .initialize()?,
            )?),
            "fresh-steam-init" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::fresh_steam::FreshSteamInputs>(&bytes)?
                    .initialize()?,
            )?),
            "fresh-primary-init" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::fresh_primary::FreshPrimaryInputs>(&bytes)?
                    .initialize()?,
            )?),
            "primary-control-feedback" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_feedback::PrimaryFeedbackInputs>(
                    &bytes,
                )?
                .calculate()?,
            )?),
            "pressure-control-init" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::initialization::PressureControlInitInputs>(
                    &bytes,
                )?
                .initialize()?,
            )?),
            "pressure-control-signal" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::spray::PressureControlSignalInputs>(&bytes)?
                    .calculate()?,
            )?),
            "spray-control" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::spray::SprayInputs>(&bytes)?.calculate()?,
            )?),
            "heater-control" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::heaters::HeaterInputs>(&bytes)?.calculate()?,
            )?),
            "primary-correction" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_correction::PrimaryCorrectionInputs>(
                    &bytes,
                )?
                .calculate()?,
            )?),
            "primary-heat-capacity" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_properties::PrimaryHeatCapacityInputs>(
                    &bytes,
                )?
                .calculate()?,
            )?),
            "primary-flow-preparation" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_flow::PrimaryFlowInputs>(&bytes)?
                    .calculate()?,
            )?),
            "primary-phase-state" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_phase_state::PrimaryPhaseStateInputs>(
                    &bytes,
                )?
                .calculate()?,
            )?),
            "primary-phase" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_phase::PrimaryPhaseInputs>(&bytes)?
                    .calculate()?,
            )?),
            "normal-primary-phase" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::normal_primary_phase::NormalPrimaryPhaseInputs>(
                    &bytes,
                )?
                .calculate()?,
            )?),
            "primary-inventory" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_inventory::PrimaryInventoryInputs>(
                    &bytes,
                )?
                .advance()?,
            )?),
            "primary-liquid-properties" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_properties::PrimaryLiquidInputs>(
                    &bytes,
                )?
                .calculate()?,
            )?),
            "pump-pair-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::pumps::PumpPairInputs>(&bytes)?.advance()?,
            )?),
            "primary-exchange" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_exchange::PrimaryExchangeInputs>(
                    &bytes,
                )?
                .calculate()?,
            )?),
            "feedwater-pi-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::feedwater_control::FeedwaterPiInputs>(&bytes)?
                    .advance()?,
            )?),
            "thermal-mode-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::thermal_driving::ThermalModeInputs>(&bytes)?
                    .calculate()?,
            )?),
            "decay-heat" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::decay_heat::DecayHeatInputs>(&bytes)?
                    .calculate()?,
            )?),
            "thermal-driving" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::thermal_driving::ThermalDrivingInputs>(&bytes)?
                    .calculate()?,
            )?),
            "loop-transfer-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::loop_transfer::LoopTransferInputs>(&bytes)?
                    .calculate()?,
            )?),
            "primary-properties" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::primary_properties::PrimaryPropertiesInputs>(
                    &bytes,
                )?
                .calculate()?,
            )?),
            "accumulator-activate" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::accumulator::ActivationInputs>(&bytes)?
                    .activate()?,
            )?),
            "relief-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::relief::ReliefInputs>(&bytes)?.discharge()?,
            )?),
            "saturated-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::saturated_balance::SaturatedInputs>(&bytes)?
                    .derivatives()?,
            )?),
            "steam-generator-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::steam_generator::SteamGeneratorInputs>(&bytes)?
                    .derivatives()?,
            )?),
            "supply-tank-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::supply_tank::SupplyTankInputs>(&bytes)?
                    .deplete()?,
            )?),
            "steam-outflow-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::steam_generator::SteamOutflowInputs>(&bytes)?
                    .limit()?,
            )?),
            "pressurizer-init" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::initialization::PressurizerInitInputs>(&bytes)?
                    .initialize()?,
            )?),
            "startup-heat" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::initialization::StartupHeatInputs>(&bytes)?
                    .initialize()?,
            )?),
            "controller-step" => Some(serde_json::to_value(
                serde_json::from_slice::<rusttran::controller::ControllerInputs>(&bytes)?
                    .advance()?,
            )?),
            _ => None,
        };
        if let Some(solution) = solution {
            return print(
                &serde_json::json!({"scope":"Recovered component calculation; upstream inputs supplied, not a complete plant simulation", "solution":solution}),
            );
        }
        let request: rusttran::pumps::PumpFlowInputs = serde_json::from_slice(&bytes)?;
        return print(
            &serde_json::json!({"scope":"Recovered RCP flow update; no plant event dispatcher","solution":request.advance()?}),
        );
    }
    let id = match command.as_str() {
        "parameters" | "condition" | "table" | "native-seed" | "model-seed" => {
            Some(args.next().ok_or("command requires an identifier")?)
        }
        _ => None,
    };
    if args.next().is_some() {
        return Err("unexpected extra argument".into());
    }
    let db = match &root {
        Some(root) => Database::new(root, &database)?,
        None => Database::embedded(&database)?,
    };
    match command.as_str() {
        "native-seed" => print(&rusttran::bindings::NativeSeed::condition(
            &db,
            id.as_deref().ok_or("missing IC")?,
        )?),
        "model-seed" => print(&rusttran::bindings::NativeSeed::model(
            &db,
            id.as_deref().ok_or("missing SET")?,
        )?),
        "tables" => print(&db.tables()?),
        "models" => print(&db.table("BasicData")?),
        "parameters" => print(&db.parameters(id.as_deref().ok_or("missing SET")?)?),
        "conditions" => print(&db.table("ListIC")?),
        "condition" => print(&db.condition(id.as_deref().ok_or("missing IC")?)?),
        "malfunctions" => print(&db.table("ListMalf")?),
        "table" => print(&db.table(id.as_deref().ok_or("missing table name")?)?),
        "status" => print(
            &serde_json::json!({"engine": "not fully reconstructed", "data_source": root, "database": database, "scope": "Recovered database fields; no simulated trajectories"}),
        ),
        _ => Err(format!("unknown command: {command}").into()),
    }
}

fn main() {
    if let Err(error) = run() {
        eprintln!("error: {error}");
        std::process::exit(1);
    }
}

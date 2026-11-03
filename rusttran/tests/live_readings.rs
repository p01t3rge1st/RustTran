use rusttran::{
    live_readings::{LiveReadings, PlantReadings},
    native_globals::NativeGlobals,
};
#[test]
fn live_mimic_converts_current_values_and_never_falls_back_to_ic_states() {
    let mut globals = NativeGlobals::default();
    globals.singles.insert(
        "0x54b494".into(),
        rusttran::bindings::native_pressure(155.).unwrap(),
    );
    globals.singles.insert(
        "0x54b498".into(),
        rusttran::bindings::native_temperature(300.).unwrap(),
    );
    globals.singles.insert("0x54b4a0".into(), 0.5);
    globals.singles.insert("0x54b424".into(), 100.); // Stored IC power is not live power.
    let readings = LiveReadings::from_globals(&globals);
    assert!((readings.number("P").unwrap() - 155.).abs() < 0.0001);
    assert!((readings.number("TAVG").unwrap() - 300.).abs() < 0.0001);
    assert!(readings.number("LEV").is_some());
    for field in ["PSGA", "POWR", "RDPOS", "PRB", "TRB", "TPCT"] {
        assert!(readings.number(field).is_none(), "{field}");
    }
    assert!(readings.pump("RCPA").is_none());
    assert!(readings.valve("PORVA").is_none());
    globals.singles.insert(
        "0x54b494".into(),
        rusttran::bindings::native_pressure(100.).unwrap(),
    );
    assert!((LiveReadings::from_globals(&globals).number("P").unwrap() - 100.).abs() < 0.0001);
}

#[test]
fn classic_mimic_uses_computed_loop_temperatures_after_stepping_and_reset() {
    use rusttran::simulation_workspace::SimulationWorkspace;
    let mut workspace =
        SimulationWorkspace::from_json(include_bytes!("../examples/gui-simulation-session.json"))
            .unwrap();
    let initial = LiveReadings::from_globals(&workspace.session.globals);
    workspace.advance_steps(8).unwrap();
    let readings = LiveReadings::from_globals(&workspace.session.globals);
    let mut changed = false;
    for (field, address) in [
        ("HOT_LEG_A", 0x54b694),
        ("HOT_LEG_B", 0x54b698),
        ("COLD_LEG_A", 0x54b69c),
        ("COLD_LEG_B", 0x54b6a0),
    ] {
        let expected = (f64::from(workspace.session.globals.single(address).unwrap()) - 32.) / 1.8;
        assert_eq!(readings.number(field), Some(expected));
        changed |= readings.number(field) != initial.number(field);
    }
    assert!(changed, "mimic must follow the evolving engine, not the IC");
    assert!(readings.number("POWR").is_none());
    workspace.reset();
    let reset = LiveReadings::from_globals(&workspace.session.globals);
    for field in ["HOT_LEG_A", "HOT_LEG_B", "COLD_LEG_A", "COLD_LEG_B"] {
        assert_eq!(reset.number(field), initial.number(field));
    }
    assert!(
        LiveReadings::from_globals(&NativeGlobals::default())
            .number("HOT_LEG_A")
            .is_none()
    );
}

#[test]
fn fan_state_and_heat_use_only_the_selected_computed_producer() {
    use rusttran::simulation_workspace::SimulationWorkspace;
    let mut w = SimulationWorkspace::from_json(include_bytes!(
        "../examples/gui-containment-fans-session.json"
    ))
    .unwrap();
    assert!(
        LiveReadings::from_session(&w.session)
            .number("FAN_COOLING_HEAT")
            .is_none()
    );
    w.session
        .controls
        .containment_fans
        .as_mut()
        .unwrap()
        .fan_percent[0] = 75;
    w.advance_steps(1).unwrap();
    let readings = LiveReadings::from_session(&w.session);
    assert_eq!(readings.fan("Fan Cooler 1"), Some(75.));
    assert!(readings.number("FAN_COOLING_HEAT").unwrap() > 0.);
    let expected = f64::from(w.session.globals.single(0x54b750).unwrap())
        / f64::from(rusttran::bindings::HEAT_FACTOR);
    assert_eq!(readings.number("FAN_COOLING_HEAT"), Some(expected));
    let no_control = LiveReadings::from_globals(&w.session.globals);
    assert!(no_control.fan("Fan Cooler 1").is_none());
    assert!(no_control.number("FAN_COOLING_HEAT").is_none());
    w.session.controls.containment_fans = None;
    assert!(
        LiveReadings::from_session(&w.session)
            .number("FAN_COOLING_HEAT")
            .is_none()
    );
    let p = rusttran::presentation::Presentation::embedded().unwrap();
    assert_eq!(p.fan("Fan Cooler 1"), Some(0.));
}

#[test]
fn containment_readings_and_history_follow_selected_balance_and_reset() {
    use rusttran::{
        bindings::IC_BINDINGS,
        simulation_workspace::{SERIES, SimulationWorkspace},
    };
    let mut w =
        SimulationWorkspace::from_json(include_bytes!("../examples/gui-containment-session.json"))
            .unwrap();
    let before = LiveReadings::from_session(&w.session);
    w.advance_steps(4).unwrap();
    let readings = LiveReadings::from_session(&w.session);
    let mut changed = false;
    for field in ["PRB", "TRB", "LWRB"] {
        let b = IC_BINDINGS.iter().find(|b| b.field == field).unwrap();
        let native = f64::from(w.session.globals.single(b.address).unwrap()) - f64::from(b.offset);
        let expected = if b.divide {
            native * f64::from(b.factor)
        } else {
            native / f64::from(b.factor)
        };
        assert_eq!(readings.number(field), Some(expected));
        changed |= before.number(field) != readings.number(field);
    }
    assert!(changed);
    let last = w.history.back().unwrap();
    for a in [
        "0x54b544", "0x54b548", "0x54b54c", "0x54bb58", "0x54bb14", "0x54bb24",
    ] {
        let i = SERIES
            .iter()
            .position(|(address, _, _)| *address == a)
            .unwrap();
        assert_eq!(last.values[i], w.session.globals.singles.get(a).copied());
    }
    w.reset();
    let reset = LiveReadings::from_session(&w.session);
    for field in ["PRB", "TRB", "LWRB"] {
        assert_eq!(reset.number(field), before.number(field));
    }
    w.session.controls.containment_balance = None;
    let without = LiveReadings::from_session(&w.session);
    for field in ["PRB", "TRB", "LWRB"] {
        assert!(without.number(field).is_none());
    }
    w.advance_steps(1).unwrap();
    for a in ["0x54b544", "0x54b548", "0x54b54c", "0x54bb58"] {
        let i = SERIES
            .iter()
            .position(|(address, _, _)| *address == a)
            .unwrap();
        assert_eq!(w.history.back().unwrap().values[i], None);
    }
}

#[test]
fn selected_hydrogen_producer_drives_classic_meter_and_complete_burn_history() {
    use rusttran::simulation_workspace::{SERIES, SimulationWorkspace};
    let mut w =
        SimulationWorkspace::from_json(include_bytes!("../examples/gui-hydrogen-session.json"))
            .unwrap();
    assert!(
        LiveReadings::from_session(&w.session)
            .number("HYDROGEN")
            .is_none()
    );
    w.advance_steps(16).unwrap();
    let readings = LiveReadings::from_session(&w.session);
    let concentration = w.session.globals.single(0x54bae4).unwrap();
    assert_eq!(readings.number("HYDROGEN"), Some(f64::from(concentration)));
    assert!(concentration < 1.);
    let heat = SERIES
        .iter()
        .position(|(a, _, _)| *a == "0x54b754")
        .unwrap();
    assert!(
        w.history
            .iter()
            .any(|s| s.values[heat].is_some_and(|v| v > 0.))
    );
    assert_eq!(w.history.back().unwrap().values[heat], Some(0.));
    for a in ["0x54bae4", "0x54b754"] {
        let i = SERIES
            .iter()
            .position(|(address, _, _)| *address == a)
            .unwrap();
        assert_eq!(
            w.history.back().unwrap().values[i],
            w.session.globals.singles.get(a).copied()
        );
    }
    w.session.controls.containment_thermal = None;
    assert!(
        LiveReadings::from_session(&w.session)
            .number("HYDROGEN")
            .is_none()
    );
    w.advance_steps(1).unwrap();
    for a in ["0x54bae4", "0x54b754"] {
        let i = SERIES
            .iter()
            .position(|(address, _, _)| *address == a)
            .unwrap();
        assert_eq!(w.history.back().unwrap().values[i], None);
    }
    w.reset();
    assert!(
        LiveReadings::from_session(&w.session)
            .number("HYDROGEN")
            .is_none()
    );
}

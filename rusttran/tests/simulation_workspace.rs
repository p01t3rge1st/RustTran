use rusttran::simulation_workspace::{SERIES, SimulationWorkspace};
fn input() -> Vec<u8> {
    std::fs::read(
        rusttran::default_data_root().join("../../rusttran/examples/recovered-session-run.json"),
    )
    .unwrap()
}
#[test]
fn loading_checks_operands_without_changing_state_and_pause_stops_real_updates() {
    let bytes = input();
    let mut w = SimulationWorkspace::from_json(&bytes).unwrap();
    let source: serde_json::Value = serde_json::from_slice(&bytes).unwrap();
    let expected: rusttran::recovered_session::RecoveredSession =
        serde_json::from_value(source["session"].clone()).unwrap();
    assert_eq!(w.session.globals.singles, expected.globals.singles);
    assert_eq!(w.session.globals.integers, expected.globals.integers);
    let before = serde_json::to_value(&w.session).unwrap();
    w.tick(5.).unwrap();
    assert_eq!(before, serde_json::to_value(&w.session).unwrap());
    assert!(w.history.is_empty());
    let mut broken = source;
    broken["session"]["globals"]["singles"]
        .as_object_mut()
        .unwrap()
        .remove("0x54bfa0");
    assert!(SimulationWorkspace::from_json(&serde_json::to_vec(&broken).unwrap()).is_err());
}
#[test]
fn frame_accumulation_steps_the_engine_and_bounded_work_never_skips_model_time() {
    let mut w = SimulationWorkspace::from_json(&input()).unwrap();
    let mut expected = w.session.clone();
    expected.advance(2).unwrap();
    let dt = f64::from(w.session.controls.step);
    w.start().unwrap();
    w.tick(dt * 1.5).unwrap();
    assert_eq!(w.updates, 1);
    w.tick(dt * 0.5).unwrap();
    assert_eq!(w.updates, 2);
    assert_eq!(
        serde_json::to_value(&w.session).unwrap(),
        serde_json::to_value(expected).unwrap()
    );
    w.pause();
    let before = serde_json::to_value(&w.session).unwrap();
    w.tick(1000.).unwrap();
    assert_eq!(before, serde_json::to_value(&w.session).unwrap());
    let mut many = SimulationWorkspace::from_json(&input()).unwrap();
    many.start().unwrap();
    many.tick(dt * 100.).unwrap();
    assert_eq!(many.updates, 32);
    many.tick(0.).unwrap();
    assert_eq!(many.updates, 64);
}
#[test]
fn manual_commands_reach_the_same_engine_as_cli_and_reset_restores_loaded_state() {
    let mut w = SimulationWorkspace::from_json(&input()).unwrap();
    let initial = serde_json::to_value(&w.session).unwrap();
    w.session.controls.heaters.proportional_manual = true;
    w.session.controls.heaters.proportional_percent = 25;
    w.session.controls.spray.spray_manual = true;
    w.session.controls.spray.spray_percent = 0;
    let mut direct = w.session.clone();
    direct.advance(1).unwrap();
    w.advance_steps(1).unwrap();
    assert_eq!(
        serde_json::to_value(&w.session).unwrap(),
        serde_json::to_value(direct).unwrap()
    );
    assert_eq!(w.history.len(), 1);
    w.reset();
    assert_eq!(serde_json::to_value(&w.session).unwrap(), initial);
    assert_eq!(w.updates, 0);
    assert!(!w.running);
    assert!(w.history.is_empty());
}
#[test]
fn frame_failure_pauses_and_retains_last_committed_state_and_history() {
    let mut w = SimulationWorkspace::from_json(&input()).unwrap();
    w.session.controls.clock = 16_777_215.;
    w.session.controls.step = 1.;
    let before = serde_json::to_value(&w.session).unwrap();
    w.start().unwrap();
    assert!(w.tick(2.).is_err());
    assert!(!w.running);
    assert!(w.history.is_empty());
    assert_eq!(before, serde_json::to_value(&w.session).unwrap());
}
#[test]
fn saved_state_resumes_and_csv_contains_actual_computed_samples() {
    let mut w = SimulationWorkspace::from_json(&input()).unwrap();
    w.advance_steps(3).unwrap();
    let folder = std::env::temp_dir().join(format!(
        "rusttran-workspace-{}-{}",
        std::process::id(),
        std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_nanos()
    ));
    std::fs::create_dir_all(&folder).unwrap();
    let state = folder.join("state.json");
    let csv = folder.join("history.csv");
    w.save(&state).unwrap();
    w.export_csv(&csv).unwrap();
    let mut restored = SimulationWorkspace::from_json(&std::fs::read(state).unwrap()).unwrap();
    restored.advance_steps(5).unwrap();
    w.advance_steps(5).unwrap();
    assert_eq!(
        serde_json::to_value(&w.session).unwrap(),
        serde_json::to_value(&restored.session).unwrap()
    );
    let mut reader = csv::Reader::from_path(csv).unwrap();
    assert_eq!(reader.headers().unwrap().len(), SERIES.len() + 2);
    let rows: Vec<_> = reader.records().collect::<Result<_, _>>().unwrap();
    assert_eq!(rows.len(), 3);
    for (row, sample) in rows.iter().zip(w.history.iter()) {
        assert_eq!(
            row[1].parse::<f32>().unwrap().to_bits(),
            sample.clock.to_bits()
        );
        for (i, v) in sample.values.iter().enumerate() {
            if let Some(v) = v {
                assert_eq!(row[i + 2].parse::<f32>().unwrap().to_bits(), v.to_bits());
            }
        }
    }
    std::fs::remove_dir_all(folder).unwrap();
}

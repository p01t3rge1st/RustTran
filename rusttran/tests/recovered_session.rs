use rusttran::recovered_session::{RecoveredSession, SessionRunRequest};
fn fixtures() -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../recovered_session_fixtures.json"))
            .unwrap(),
    )
    .unwrap()
}
fn compare(actual: &serde_json::Value, expected: &serde_json::Value, path: &str) {
    match expected {
        serde_json::Value::Object(fields) => {
            assert_eq!(actual.as_object().unwrap().len(), fields.len(), "{path}");
            for (k, v) in fields {
                compare(&actual[k], v, &format!("{path}.{k}"));
            }
        }
        serde_json::Value::Array(values) => {
            assert_eq!(actual.as_array().unwrap().len(), values.len(), "{path}");
            for (i, v) in values.iter().enumerate() {
                compare(&actual[i], v, &format!("{path}[{i}]"));
            }
        }
        serde_json::Value::Number(n) if n.is_f64() => {
            let a = actual.as_f64().unwrap() as f32;
            let e = n.as_f64().unwrap() as f32;
            let order = |x: f32| {
                if x.is_sign_negative() {
                    !x.to_bits()
                } else {
                    x.to_bits() | 0x80000000
                }
            };
            let tolerance = if path.contains(".trace.") { 2 } else { 4 };
            assert!(
                order(a).abs_diff(order(e)) <= tolerance,
                "{path}: {a} != {e}"
            );
        }
        _ => assert_eq!(actual, expected, "{path}"),
    }
}
#[test]
fn stateful_actuator_feedback_and_all_updates_match_native_slice_chains() {
    let d = fixtures();
    assert_eq!(d["cases"].as_array().unwrap().len(), 12);
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: SessionRunRequest = serde_json::from_value(c["inputs"].clone()).unwrap();
        let steps = q.session.advance(q.steps).unwrap();
        compare(
            &serde_json::json!({"session":q.session,"steps":steps}),
            &c["expected"],
            &format!("chain {i}"),
        );
    }
}
#[test]
fn saved_session_resume_and_batched_execution_preserve_all_scalar_and_command_states() {
    let d = fixtures();
    let q: SessionRunRequest = serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    let mut full = q.session.clone();
    let all = full.advance(8).unwrap();
    let mut split = q.session;
    let a = split.advance(3).unwrap();
    let mut restored: RecoveredSession =
        serde_json::from_slice(&serde_json::to_vec(&split).unwrap()).unwrap();
    let b = restored.advance(5).unwrap();
    assert_eq!(
        serde_json::to_value(&full).unwrap(),
        serde_json::to_value(&restored).unwrap()
    );
    assert_eq!(
        serde_json::to_value(&all[..3]).unwrap(),
        serde_json::to_value(a).unwrap()
    );
    assert_eq!(
        serde_json::to_value(&all[3..]).unwrap(),
        serde_json::to_value(b).unwrap()
    );
}
#[test]
fn returned_heaters_spray_source_and_valve_commands_are_used_by_the_next_update() {
    let d = fixtures();
    let mut q: SessionRunRequest = serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    let original = q.session.controls.clone();
    let steps = q.session.advance(1).unwrap();
    let out = &steps[0];
    let c = &q.session.controls;
    let primary = out.primary_commands.as_ref().unwrap();
    assert_eq!(
        serde_json::to_value(&c.heaters).unwrap(),
        serde_json::to_value(&primary.heaters).unwrap()
    );
    assert_eq!(
        serde_json::to_value(&c.spray).unwrap(),
        serde_json::to_value(&primary.spray).unwrap()
    );
    assert_eq!(
        serde_json::to_value(&c.supply.as_ref().unwrap().controls).unwrap(),
        serde_json::to_value(&out.supply.as_ref().unwrap().controls).unwrap()
    );
    assert_eq!(
        c.accumulator.unwrap(),
        out.accumulator.as_ref().unwrap().valves
    );
    assert_eq!(
        c.rcp.as_ref().unwrap().pump_percent,
        out.rcp.as_ref().unwrap().pump_percent
    );
    assert_eq!(
        serde_json::to_value(&c.steam_valves).unwrap(),
        serde_json::to_value(&out.steam_valves.as_ref().unwrap().last().unwrap().controls).unwrap()
    );
    assert!(c.clock > original.clock);
}
#[test]
fn zero_count_late_update_failure_and_unrepresentable_clock_leave_session_unchanged() {
    let d = fixtures();
    let q: SessionRunRequest = serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    let mut session = q.session.clone();
    let before = serde_json::to_value(&session).unwrap();
    assert!(session.advance(0).is_err());
    assert_eq!(before, serde_json::to_value(&session).unwrap());
    // The next Single clock becomes unrepresentable after a successful update.
    session.controls.clock = 16_777_215.;
    session.controls.step = 1.;
    let mut first = session.clone();
    first.advance(1).unwrap();
    assert_eq!(first.controls.clock, 16_777_216.);
    let before = serde_json::to_value(&session).unwrap();
    assert!(session.advance(2).is_err());
    assert_eq!(before, serde_json::to_value(&session).unwrap());
    let mut session = q.session;
    session.globals.singles.remove("0x54bfa0");
    let before = serde_json::to_value(&session).unwrap();
    assert!(session.advance(8).is_err());
    assert_eq!(before, serde_json::to_value(&session).unwrap());
}
#[test]
fn native_feedback_transport_feeds_temperatures_and_histories_into_next_updates() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_transport_session_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: SessionRunRequest = serde_json::from_value(c["inputs"].clone()).unwrap();
        let steps = q.session.advance(q.steps).unwrap();
        compare(
            &serde_json::json!({"session":q.session,"steps":steps}),
            &c["expected"],
            &format!("transport chain {i}"),
        );
    }
}

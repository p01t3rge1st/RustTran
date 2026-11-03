use rusttran::{
    containment_fans::ContainmentFanRequest, simulation_workspace::SimulationWorkspace,
};
use serde_json::Value;
fn fixture() -> Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../containment_fans_fixtures.json"))
            .unwrap(),
    )
    .unwrap()
}
fn compare(a: &Value, e: &Value, path: &str) {
    match e {
        Value::Object(fields) => {
            assert_eq!(a.as_object().unwrap().len(), fields.len(), "{path}");
            for (k, v) in fields {
                compare(&a[k], v, &format!("{path}.{k}"));
            }
        }
        Value::Array(values) => {
            assert_eq!(a.as_array().unwrap().len(), values.len(), "{path}");
            for (i, v) in values.iter().enumerate() {
                compare(&a[i], v, &format!("{path}[{i}]"));
            }
        }
        Value::Number(n) if n.is_f64() => {
            let a = a.as_f64().unwrap() as f32;
            let e = n.as_f64().unwrap() as f32;
            let order = |v: f32| {
                if v.is_sign_negative() {
                    !v.to_bits()
                } else {
                    v.to_bits() | 0x80000000
                }
            };
            let tolerance = if path.ends_with("0x54b450") {
                0
            } else if path.ends_with("0x54b750") {
                2
            } else {
                4
            };
            assert!(
                order(a).abs_diff(order(e)) <= tolerance,
                "{path}: {a} != {e}"
            );
        }
        _ => assert_eq!(a, e, "{path}"),
    }
}
#[test]
fn original_fan_thresholds_manual_states_and_two_stage_rounding_match() {
    for (i, case) in fixture()["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: ContainmentFanRequest = serde_json::from_value(case["inputs"].clone()).unwrap();
        let output = q.globals.advance_containment_fans(&q.controls).unwrap();
        compare(
            &serde_json::to_value(&output).unwrap(),
            &case["expected"],
            &format!("fan {i}"),
        );
        for (k, v) in output.singles {
            assert_eq!(q.globals.singles[&k], v);
        }
    }
}
#[test]
fn failed_heat_update_does_not_commit_an_activation_or_commands() {
    let original: ContainmentFanRequest =
        serde_json::from_value(fixture()["cases"][0]["inputs"].clone()).unwrap();
    for failure in 0..4 {
        let mut q = original.clone();
        q.globals.singles.insert("0x54b544".into(), 30.);
        q.globals.singles.insert("0x54b40c".into(), 0.);
        q.controls.fan_percent = [0, 0, 0, 0];
        q.controls.fan_manual = [false; 4];
        match failure {
            0 => {
                q.globals
                    .singles
                    .insert("0x54b2d0".into(), q.globals.singles["0x54b160"]);
            }
            1 => {
                q.globals.singles.remove("0x54b548");
            }
            2 => {
                q.controls.fan_percent = [32767, 1, -1, 0];
            }
            _ => {
                q.globals.singles.insert("0x54b548".into(), f32::MAX);
                q.globals.singles.insert("0x54b2cc".into(), f32::MAX);
            }
        }
        let before = serde_json::to_value(&q).unwrap();
        assert!(q.globals.advance_containment_fans(&q.controls).is_err());
        assert_eq!(serde_json::to_value(q).unwrap(), before);
    }
}
#[test]
fn session_retains_automatic_commands_and_rolls_back_late_fan_failure() {
    let mut w =
        SimulationWorkspace::from_json(include_bytes!("../examples/gui-simulation-session.json"))
            .unwrap();
    let q: ContainmentFanRequest =
        serde_json::from_value(fixture()["cases"][0]["inputs"].clone()).unwrap();
    for (k, v) in q.globals.singles {
        if k != "0x54b40c" {
            w.session.globals.singles.insert(k, v);
        }
    }
    w.session
        .globals
        .singles
        .insert("0x54b450".into(), w.session.controls.clock + 1.);
    w.session.globals.singles.insert("0x54b544".into(), 30.);
    let mut controls = q.controls;
    controls.fan_percent = [0; 4];
    controls.fan_manual = [false; 4];
    controls.exchanger_percent = 100;
    w.session.controls.containment_fans = Some(controls);
    w.advance_steps(2).unwrap();
    assert_eq!(
        w.session
            .controls
            .containment_fans
            .as_ref()
            .unwrap()
            .fan_percent,
        [100, 100, 0, 0]
    );
    assert_eq!(w.history.len(), 2);
    w.session.globals.singles.remove("0x54b548");
    let before = serde_json::to_value(&w.session).unwrap();
    assert!(w.advance_steps(2).is_err());
    assert_eq!(serde_json::to_value(&w.session).unwrap(), before);
    assert_eq!(w.history.len(), 2);
}

#[test]
fn connected_steps_and_stateful_native_fan_chains_match() {
    for (fixture, session) in [
        ("recovered_fans_step_fixtures.json", false),
        ("recovered_fans_session_fixtures.json", true),
    ] {
        let doc: Value = serde_json::from_slice(
            &std::fs::read(rusttran::default_data_root().join("..").join(fixture)).unwrap(),
        )
        .unwrap();
        for (i, case) in doc["cases"].as_array().unwrap().iter().enumerate() {
            let actual = if session {
                let mut q: rusttran::recovered_session::SessionRunRequest =
                    serde_json::from_value(case["inputs"].clone()).unwrap();
                let steps = q.session.advance(q.steps).unwrap();
                serde_json::json!({"session":q.session,"steps":steps})
            } else {
                let mut q: rusttran::recovered_step::RecoveredStepRequest =
                    serde_json::from_value(case["inputs"].clone()).unwrap();
                serde_json::to_value(
                    q.globals
                        .advance_recovered_primary_step(&q.controls)
                        .unwrap(),
                )
                .unwrap()
            };
            compare(&actual, &case["expected"], &format!("{fixture} case {i}"));
        }
    }
}

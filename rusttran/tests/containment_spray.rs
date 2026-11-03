use rusttran::{
    containment_spray::ContainmentSprayRequest, simulation_workspace::SimulationWorkspace,
};
use serde_json::Value;
fn fixture() -> Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../containment_spray_fixtures.json"))
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
            let tolerance = if path.ends_with("0x54b448") {
                0
            } else if path.ends_with("0x54bb24") {
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
fn original_spray_decisions_properties_and_cooling_match() {
    let cases = fixture();
    for (i, case) in cases["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: ContainmentSprayRequest =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let out = q.globals.advance_containment_spray(&q.controls).unwrap();
        compare(
            &serde_json::to_value(&out).unwrap(),
            &case["expected"],
            &format!("spray {i}"),
        );
        for (k, v) in out.singles {
            assert_eq!(q.globals.singles[&k], v);
        }
        assert_eq!(q.globals.integers["0x54b486"], out.integers["0x54b486"]);
    }
}
#[test]
fn errors_do_not_commit_latches_commands_or_partial_properties() {
    let base: ContainmentSprayRequest =
        serde_json::from_value(fixture()["cases"][0]["inputs"].clone()).unwrap();
    for failure in 0..5 {
        let mut q = base.clone();
        q.controls.mode = 1;
        q.controls.pump_percent = [0, 0];
        q.controls.pump_manual = [false; 2];
        q.globals.singles.insert("0x54b544".into(), 30.);
        q.globals.integers.insert("0x54b486".into(), 0);
        match failure {
            0 => {
                q.globals.singles.insert("0x54b160".into(), 300.);
            }
            1 => {
                q.globals.singles.remove("0x54b72c");
            }
            2 => {
                q.controls.pump_percent = [32767, 1];
            }
            3 => {
                q.globals.integers.insert("0x54b486".into(), 1);
                q.controls.pump_percent = [-1, 0];
                q.globals.singles.insert("0x54b298".into(), 100.);
            }
            _ => {
                q.globals.singles.insert("0x54b294".into(), f32::NAN);
            }
        }
        let globals = q.globals.clone();
        let commands = q.controls.clone();
        assert!(q.globals.advance_containment_spray(&q.controls).is_err());
        // NaN compares unequal; compare stored bits for unchanged state.
        assert_eq!(q.globals.integers, globals.integers);
        assert_eq!(
            q.globals.singles.keys().collect::<Vec<_>>(),
            globals.singles.keys().collect::<Vec<_>>()
        );
        for (k, v) in globals.singles {
            assert_eq!(q.globals.singles[&k].to_bits(), v.to_bits());
        }
        assert_eq!(
            serde_json::to_value(q.controls).unwrap(),
            serde_json::to_value(commands).unwrap()
        );
    }
}
#[test]
fn non_cooling_branch_does_not_require_unread_heat_inputs() {
    let mut q: ContainmentSprayRequest =
        serde_json::from_value(fixture()["cases"][0]["inputs"].clone()).unwrap();
    q.controls.mode = 0;
    q.globals.singles.remove("0x54b160");
    q.globals.singles.remove("0x54b2c8");
    let out = q.globals.advance_containment_spray(&q.controls).unwrap();
    assert_eq!(out.singles["0x54bb24"], 0.);
    assert_eq!(out.return_flow, 0.);
    assert_eq!(out.outlet_temperature, q.globals.singles["0x54b72c"]);
}
#[test]
fn session_binds_shared_properties_and_preserves_commands_on_resume() {
    let mut w = SimulationWorkspace::from_json(include_bytes!(
        "../examples/gui-containment-fans-session.json"
    ))
    .unwrap();
    let q: ContainmentSprayRequest =
        serde_json::from_value(fixture()["cases"][0]["inputs"].clone()).unwrap();
    for (k, v) in q.globals.singles {
        if !["0x54b40c", "0x54b544", "0x54b548", "0x54b72c"].contains(&k.as_str()) {
            w.session.globals.singles.insert(k, v);
        }
    }
    w.session.globals.integers.insert("0x54b486".into(), 0);
    w.session.globals.singles.insert("0x54b448".into(), 0.);
    let mut c = q.controls;
    c.mode = -1;
    c.auxiliary_percent = -1;
    c.exchanger_percent = -1;
    c.pump_percent = [0; 2];
    c.pump_manual = [false; 2];
    w.session.controls.containment_spray = Some(c);
    w.advance_steps(1).unwrap();
    let retained = w.session.controls.containment_spray.as_ref().unwrap();
    assert_eq!(retained.pump_percent, [100; 2]);
    assert_eq!(
        retained.mode,
        w.session.controls.supply.as_ref().unwrap().controls.mode
    );
    assert_eq!(
        retained.auxiliary_percent,
        w.session
            .controls
            .devices
            .as_ref()
            .unwrap()
            .controls
            .auxiliary_percent
    );
    assert_eq!(
        retained.exchanger_percent,
        w.session
            .controls
            .containment_fans
            .as_ref()
            .unwrap()
            .exchanger_percent
    );
    let bytes = serde_json::to_vec(&w.session).unwrap();
    let mut restored = SimulationWorkspace::from_json(&bytes).unwrap();
    w.advance_steps(2).unwrap();
    restored.advance_steps(2).unwrap();
    assert_eq!(
        serde_json::to_value(&w.session).unwrap(),
        serde_json::to_value(&restored.session).unwrap()
    );
    w.session.globals.singles.remove("0x54b72c");
    let before = serde_json::to_value(&w.session).unwrap();
    assert!(w.advance_steps(2).is_err());
    assert_eq!(serde_json::to_value(&w.session).unwrap(), before);
}

#[test]
fn original_composed_steps_and_retained_spray_chains_match() {
    for (name, session) in [
        ("recovered_spray_step_fixtures.json", false),
        ("recovered_spray_session_fixtures.json", true),
    ] {
        let doc: Value = serde_json::from_slice(
            &std::fs::read(rusttran::default_data_root().join("..").join(name)).unwrap(),
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
            compare(&actual, &case["expected"], &format!("{name} {i}"));
        }
    }
}

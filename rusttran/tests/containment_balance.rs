use rusttran::containment_balance::ContainmentBalanceRequest;
use serde_json::Value;
fn fixtures() -> Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../containment_balance_fixtures.json"))
            .unwrap(),
    )
    .unwrap()
}
fn compare(actual: &Value, expected: &Value, path: &str) {
    match expected {
        Value::Object(fields) => {
            assert_eq!(actual.as_object().unwrap().len(), fields.len(), "{path}");
            for (k, v) in fields {
                compare(&actual[k], v, &format!("{path}.{k}"));
            }
        }
        Value::Array(fields) => {
            assert_eq!(actual.as_array().unwrap().len(), fields.len(), "{path}");
            for (i, v) in fields.iter().enumerate() {
                compare(&actual[i], v, &format!("{path}[{i}]"));
            }
        }
        Value::Number(n) if n.is_f64() => {
            let a = actual.as_f64().unwrap() as f32;
            let e = n.as_f64().unwrap() as f32;
            let order = |v: f32| {
                if v.is_sign_negative() {
                    !v.to_bits()
                } else {
                    v.to_bits() | 0x80000000
                }
            };
            assert!(
                a.is_finite() && order(a).abs_diff(order(e)) <= 4,
                "{path}: {a} != {e}"
            );
        }
        _ => assert_eq!(actual, expected, "{path}"),
    }
}
#[test]
fn original_containment_balance_and_vessel_caller_match() {
    let f = fixtures();
    let cases = f["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 144);
    for (i, case) in cases.iter().enumerate() {
        let mut q: ContainmentBalanceRequest =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let result = q.globals.advance_containment_balance(&q.inputs).unwrap();
        compare(
            &serde_json::to_value(&result).unwrap(),
            &case["expected"],
            &format!("balance {i}"),
        );
        for (k, v) in result.singles {
            assert_eq!(q.globals.singles[&k], v);
        }
    }
}
#[test]
fn late_errors_preserve_complete_state() {
    let f = fixtures();
    let base: ContainmentBalanceRequest =
        serde_json::from_value(f["cases"][0]["inputs"].clone()).unwrap();
    for failure in 0..5 {
        let mut q = base.clone();
        q.globals.singles.insert("0x54b6a4".into(), 10.);
        match failure {
            0 => {
                q.globals.singles.remove("0x54b4c0");
            }
            1 => {
                q.globals.singles.insert("0x54b4c0".into(), 0.);
            }
            2 => {
                q.globals.singles.remove("0x54bfb8");
            }
            3 => {
                q.globals.singles.insert("0x54b2c0".into(), -1.);
            }
            _ => {
                q.globals.singles.remove("0x54bb10");
            }
        }
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals.advance_containment_balance(&q.inputs).is_err(),
            "failure {failure}"
        );
        assert_eq!(serde_json::to_value(&q.globals).unwrap(), before);
    }
}
#[test]
fn inactive_vessel_and_small_mass_paths_do_not_read_unused_sources() {
    let f = fixtures();
    let case = f["cases"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| {
            !c["expected"]["vessel_called"].as_bool().unwrap()
                && c["expected"]["singles"]["0x54bb58"].as_f64().unwrap() == 0.
        })
        .unwrap();
    let mut q: ContainmentBalanceRequest = serde_json::from_value(case["inputs"].clone()).unwrap();
    for a in ["0x54bfb8", "0x54b334", "0x54b160", "0x54b800"] {
        q.globals.singles.remove(a);
    }
    let out = q.globals.advance_containment_balance(&q.inputs).unwrap();
    assert!(!out.vessel_called);
    compare(
        &serde_json::to_value(&out).unwrap(),
        &case["expected"],
        "skip",
    );
}

#[test]
fn original_composed_containment_steps_and_chains_match() {
    for (name, session) in [
        ("recovered_containment_step_fixtures.json", false),
        ("recovered_containment_session_fixtures.json", true),
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
#[test]
fn session_resume_and_late_failure_preserve_connected_state() {
    let doc: Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_containment_session_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let mut q: rusttran::recovered_session::SessionRunRequest =
        serde_json::from_value(doc["cases"][0]["inputs"].clone()).unwrap();
    let initial = serde_json::to_value(&q.session).unwrap();
    q.session.advance(2).unwrap();
    let saved = serde_json::to_vec(&q.session).unwrap();
    let mut resumed: rusttran::recovered_session::RecoveredSession =
        serde_json::from_slice(&saved).unwrap();
    let first = q.session.advance(2).unwrap();
    let second = resumed.advance(2).unwrap();
    assert_eq!(
        serde_json::to_value(first).unwrap(),
        serde_json::to_value(second).unwrap()
    );
    assert_eq!(
        serde_json::to_value(&q.session).unwrap(),
        serde_json::to_value(&resumed).unwrap()
    );
    assert_ne!(
        initial["globals"]["singles"]["0x54b548"],
        serde_json::to_value(&q.session).unwrap()["globals"]["singles"]["0x54b548"]
    );
    q.session.globals.singles.remove("0x54b330");
    let before = serde_json::to_value(&q.session).unwrap();
    assert!(q.session.advance(2).is_err());
    assert_eq!(before, serde_json::to_value(&q.session).unwrap());
}

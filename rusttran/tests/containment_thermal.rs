use rusttran::containment_thermal::ContainmentThermalRequest;
use serde_json::Value;
fn fixtures() -> Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../containment_thermal_fixtures.json"))
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
            let actual = a.as_f64().unwrap() as f32;
            let expected = n.as_f64().unwrap() as f32;
            let ordered = |v: f32| {
                if v.is_sign_negative() {
                    !v.to_bits()
                } else {
                    v.to_bits() | 0x80000000
                }
            };
            let tolerance = if path.ends_with("burn_time") { 0 } else { 4 };
            assert!(
                actual.is_finite() && ordered(actual).abs_diff(ordered(expected)) <= tolerance,
                "{path}: {actual} != {expected}"
            );
        }
        _ => assert_eq!(a, e, "{path}"),
    }
}
#[test]
fn original_reaction_source_and_hydrogen_branches_match() {
    let f = fixtures();
    let cases = f["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 335);
    for (i, case) in cases.iter().enumerate() {
        let mut q: ContainmentThermalRequest =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let output = q.globals.advance_containment_thermal(&q.controls).unwrap();
        compare(
            &serde_json::to_value(&output).unwrap(),
            &case["expected"],
            &format!("thermal {i}"),
        );
        for (k, v) in output.singles {
            assert_eq!(q.globals.singles[&k], v);
        }
        assert_eq!(q.globals.integers["0x54bfa8"], output.integers["0x54bfa8"]);
    }
}
#[test]
fn invalid_sources_and_late_curve_failures_commit_nothing() {
    let f = fixtures();
    let base: ContainmentThermalRequest =
        serde_json::from_value(f["cases"][0]["inputs"].clone()).unwrap();
    for failure in 0..5 {
        let mut q = base.clone();
        match failure {
            0 => {
                q.globals.singles.insert("0x54b414".into(), 0.);
            }
            1 => {
                q.globals.singles.remove("0x54bffc");
            }
            2 => {
                q.globals.singles.insert("0x54b2c0".into(), 0.);
            }
            3 => {
                q.controls.hydrogen_curve.gauge_pressure = [0.; 7];
            }
            _ => {
                q.controls.burn_time = f32::NAN;
            }
        }
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals.advance_containment_thermal(&q.controls).is_err(),
            "failure {failure}"
        );
        assert_eq!(serde_json::to_value(&q.globals).unwrap(), before);
    }
}
#[test]
fn untouched_heat_and_pressure_snapshots_need_not_exist() {
    let f = fixtures();
    let base = f["cases"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| c["expected"]["ignited"] == true)
        .unwrap();
    let mut q: ContainmentThermalRequest = serde_json::from_value(base["inputs"].clone()).unwrap();
    q.globals.singles.remove("0x54b754");
    q.globals.singles.remove("0x54bfb0");
    let out = q.globals.advance_containment_thermal(&q.controls).unwrap();
    assert!(out.ignited);
    assert!(!out.singles.contains_key("0x54b754"));
    assert!(!q.globals.singles.contains_key("0x54b754"));
    compare(
        &serde_json::to_value(&out).unwrap(),
        &base["expected"],
        "ignite with missing unread heat",
    );
}

#[test]
fn original_composed_thermal_steps_and_complete_burn_cycles_match() {
    for (name, session) in [
        ("recovered_thermal_sources_step_fixtures.json", false),
        ("recovered_thermal_sources_session_fixtures.json", true),
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
                assert!(
                    steps
                        .iter()
                        .any(|s| s.containment_thermal.as_ref().unwrap().ignited)
                );
                assert!(
                    steps
                        .iter()
                        .any(|s| s.containment_thermal.as_ref().unwrap().burned)
                );
                assert!(
                    steps
                        .iter()
                        .any(|s| s.containment_thermal.as_ref().unwrap().extinguished)
                );
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
fn shared_ignition_time_survives_resume_and_late_failures_are_atomic() {
    let doc: Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root()
                .join("../recovered_thermal_sources_session_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let mut q: rusttran::recovered_session::SessionRunRequest =
        serde_json::from_value(doc["cases"][1]["inputs"].clone()).unwrap();
    let clock = q.session.controls.clock;
    assert_ne!(
        q.session
            .controls
            .containment_thermal
            .as_ref()
            .unwrap()
            .burn_flag,
        q.session.controls.event_schedule.as_ref().unwrap().flags[4]
    );
    let first = q.session.advance(1).unwrap();
    let out = first[0].containment_thermal.as_ref().unwrap();
    assert!(out.ignited);
    assert_eq!(out.controls.burn_time, clock);
    assert_eq!(
        q.session.controls.event_schedule.as_ref().unwrap().times[4],
        clock
    );
    assert_eq!(
        q.session
            .controls
            .containment_thermal
            .as_ref()
            .unwrap()
            .burn_time,
        clock
    );
    let mut restored: rusttran::recovered_session::RecoveredSession =
        serde_json::from_slice(&serde_json::to_vec(&q.session).unwrap()).unwrap();
    let a = q.session.advance(15).unwrap();
    let b = restored.advance(15).unwrap();
    assert_eq!(
        serde_json::to_value(a).unwrap(),
        serde_json::to_value(b).unwrap()
    );
    assert_eq!(
        serde_json::to_value(&q.session).unwrap(),
        serde_json::to_value(&restored).unwrap()
    );
    let mut failed: rusttran::recovered_session::SessionRunRequest =
        serde_json::from_value(doc["cases"][1]["inputs"].clone()).unwrap();
    failed.session.globals.singles.remove("0x54b330");
    let before = serde_json::to_value(&failed.session).unwrap();
    assert!(failed.session.advance(1).is_err());
    assert_eq!(before, serde_json::to_value(&failed.session).unwrap());
}

#[test]
fn default_limit_curve_matches_original_initializer_and_missing_field_loading() {
    let f = fixtures();
    let curve = rusttran::containment_thermal::HydrogenLimitCurve::default();
    assert_eq!(serde_json::to_value(&curve).unwrap(), f["original_curve"]);
    let mut input = f["cases"][0]["inputs"].clone();
    input["controls"]
        .as_object_mut()
        .unwrap()
        .remove("hydrogen_curve");
    let mut q: ContainmentThermalRequest = serde_json::from_value(input).unwrap();
    compare(
        &serde_json::to_value(q.globals.advance_containment_thermal(&q.controls).unwrap()).unwrap(),
        &f["cases"][0]["expected"],
        "original default curve",
    );
}

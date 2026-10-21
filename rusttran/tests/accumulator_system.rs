use rusttran::accumulator_system::AccumulatorSystemRequest;
fn fixtures(name: &str) -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
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
fn original_continuous_activation_and_discharge_match_all_states_and_valves() {
    let doc = fixtures("accumulator_system");
    assert_eq!(doc["cases"].as_array().unwrap().len(), 640);
    for (i, case) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: AccumulatorSystemRequest =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let out = q.globals.advance_accumulator_system(q.valves).unwrap();
        compare(
            &serde_json::to_value(&out).unwrap(),
            &case["expected"],
            &format!("case {i}"),
        );
        assert_eq!(out.singles.len(), 5);
        for (a, v) in &out.singles {
            assert_eq!(q.globals.singles[a].to_bits(), v.to_bits());
        }
        assert_eq!(q.globals.integers["0x54b4e6"], out.integers["0x54b4e6"]);
    }
}
#[test]
fn numeric_error_after_activation_leaves_flag_timestamp_and_valves_unchanged() {
    let doc = fixtures("accumulator_system");
    let mut q: AccumulatorSystemRequest =
        serde_json::from_value(doc["cases"][0]["inputs"].clone()).unwrap();
    q.globals.singles.extend([
        ("0x54b494".into(), 100.),
        ("0x54b1b8".into(), 100.),
        ("0x54b540".into(), 200.),
        ("0x54b570".into(), 10.),
        ("0x54b708".into(), 10.),
        ("0x54b414".into(), 0.),
    ]);
    q.globals.integers.insert("0x54b4e6".into(), 0);
    q.valves = [rusttran::accumulator::ValveState {
        opening: 0,
        inhibited: false,
    }; 2];
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(q.globals.advance_accumulator_system(q.valves).is_err());
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    assert!(q.valves.iter().all(|v| v.opening == 0));
    q.globals.singles.insert("0x54b708".into(), 100.);
    let out = q.globals.advance_accumulator_system(q.valves).unwrap();
    assert!(out.activated);
    assert_eq!(out.valves.map(|v| v.opening), [100, 100]);
}
#[test]
fn active_latch_retains_manual_closure_and_native_inactive_flow_is_not_cleared() {
    let doc = fixtures("accumulator_system");
    let mut q: AccumulatorSystemRequest =
        serde_json::from_value(doc["cases"][0]["inputs"].clone()).unwrap();
    q.globals.singles.extend([
        ("0x54b494".into(), 100.),
        ("0x54b1b8".into(), 100.),
        ("0x54b540".into(), 200.),
        ("0x54b570".into(), 100.),
        ("0x54b708".into(), 600.),
        ("0x54b574".into(), 500.),
        ("0x54b414".into(), 0.1),
    ]);
    q.globals.integers.insert("0x54b4e6".into(), 0);
    q.valves = [rusttran::accumulator::ValveState {
        opening: 0,
        inhibited: false,
    }; 2];
    let out = q.globals.advance_accumulator_system(q.valves).unwrap();
    assert!(out.activated);
    let event = out.singles["0x54b458"];
    q.globals.singles.insert("0x54b40c".into(), 300.);
    let next = q.globals.advance_accumulator_system(q.valves).unwrap();
    assert!(!next.activated);
    assert_eq!(next.valves, q.valves);
    assert_eq!(next.singles["0x54b804"], 0.);
    assert_eq!(next.singles["0x54b458"], event);
    q.globals.integers.insert("0x54b4e6".into(), 2);
    q.globals.singles.insert("0x54b804".into(), 17.);
    assert_eq!(
        q.globals
            .advance_accumulator_system(q.valves)
            .unwrap()
            .singles["0x54b804"],
        17.
    );
}
#[test]
fn accumulator_flow_reaches_source_sum_thermal_sgs_and_integration() {
    let doc = fixtures("recovered_accumulator_step");
    assert_eq!(doc["cases"].as_array().unwrap().len(), 64);
    for (i, case) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let controls = serde_json::to_value(&q.controls).unwrap();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        compare(
            &serde_json::to_value(&out).unwrap(),
            &case["expected"],
            &format!("connected {i}"),
        );
        assert_eq!(controls, serde_json::to_value(&q.controls).unwrap());
    }
}
#[test]
fn later_integration_failure_rolls_back_accumulator_activation_and_all_plant_outputs() {
    let doc = fixtures("recovered_accumulator_step");
    let mut q: rusttran::recovered_step::RecoveredStepRequest =
        serde_json::from_value(doc["cases"][0]["inputs"].clone()).unwrap();
    q.globals.singles.remove("0x54bfa0");
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_recovered_primary_step(&q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}

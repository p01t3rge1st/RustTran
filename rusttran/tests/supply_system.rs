use rusttran::supply_system::SupplyRequest;
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
fn all_supply_recirc_cooling_and_activation_decisions_match_continuous_original() {
    let d = fixtures("supply_system");
    assert_eq!(d["cases"].as_array().unwrap().len(), 960);
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: SupplyRequest = serde_json::from_value(c["inputs"].clone()).unwrap();
        let controls = serde_json::to_value(&q.controls).unwrap();
        let out = q
            .globals
            .advance_supply_system(&q.controls, &q.curve)
            .unwrap();
        compare(
            &serde_json::to_value(&out).unwrap(),
            &c["expected"],
            &format!("supply {i}"),
        );
        assert_eq!(controls, serde_json::to_value(&q.controls).unwrap());
    }
}
#[test]
fn post_activation_curve_and_numeric_errors_cannot_change_state_or_commands() {
    let d = fixtures("supply_system");
    let mut q: SupplyRequest = serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    q.globals.integers.insert("0x54b4e8".into(), 0);
    q.globals.singles.insert("0x54b494".into(), 100.);
    q.globals.singles.insert("0x54b1c4".into(), 100.);
    q.controls.mode = 0;
    q.controls.pump_percent = [0, 0];
    q.controls.pump_manual = [false, false];
    q.globals.singles.insert("0x54b57c".into(), 0.);
    q.globals.singles.insert("0x54ba40".into(), 0.);
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_supply_system(&q.controls, &q.curve)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    assert_eq!(q.controls.pump_percent, [0, 0]);
    q.globals.singles.insert("0x54b57c".into(), 10000.);
    q.controls.mode = 1;
    q.globals.singles.insert("0x54b160".into(), 300.);
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_supply_system(&q.controls, &q.curve)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}
#[test]
fn supply_modes_feed_source_accumulator_sgs_and_integrator_atomically() {
    let d = fixtures("recovered_supply_step");
    assert_eq!(d["cases"].as_array().unwrap().len(), 96);
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        compare(
            &serde_json::to_value(out).unwrap(),
            &c["expected"],
            &format!("coupled {i}"),
        );
    }
    let mut q: rusttran::recovered_step::RecoveredStepRequest =
        serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    q.globals.singles.remove("0x54bfa0");
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_recovered_primary_step(&q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}

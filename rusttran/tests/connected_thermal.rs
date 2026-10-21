use rusttran::recovered_step::RecoveredStepRequest;
fn fixtures() -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_thermal_step_fixtures.json"),
        )
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
fn native_thermal_heat_reaches_both_sgs_and_integrated_states_without_cached_outputs() {
    for (i, case) in fixtures()["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: RecoveredStepRequest = serde_json::from_value(case["inputs"].clone()).unwrap();
        for a in [
            "0x54b67c", "0x54b680", "0x54b6b8", "0x54b6bc", "0x54b844", "0x54b848", "0x54b510",
        ] {
            assert!(!q.globals.singles.contains_key(a));
        }
        let before = serde_json::to_value(&q.controls).unwrap();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        compare(
            &serde_json::to_value(&out).unwrap(),
            &case["expected"],
            &format!("case {i}"),
        );
        assert_eq!(before, serde_json::to_value(&q.controls).unwrap());
        for a in [
            "0x54b67c", "0x54b680", "0x54b6b8", "0x54b6bc", "0x54b844", "0x54b848",
        ] {
            assert_eq!(q.globals.singles[a].to_bits(), out.singles[a].to_bits());
        }
    }
}
#[test]
fn missing_loop_b_external_mode_and_later_integration_failure_roll_back_whole_step() {
    let data = fixtures();
    let initial: RecoveredStepRequest =
        serde_json::from_value(data["cases"][1]["inputs"].clone()).unwrap();
    for missing in ["0x54b204", "0x54bfa0"] {
        let mut q = initial.clone();
        q.globals.singles.remove(missing);
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_recovered_primary_step(&q.controls)
                .is_err(),
            "{missing}"
        );
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
    for mode in [-1, 1, 2] {
        let mut q = initial.clone();
        q.globals.integers.insert("0x54bec8".into(), mode);
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_recovered_primary_step(&q.controls)
                .unwrap_err()
                .to_string()
                .contains("model mode 0")
        );
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
    let mut q = initial;
    q.controls.event_schedule = None;
    q.controls.normal_thermal.as_mut().unwrap().failure_time = f32::NAN;
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_recovered_primary_step(&q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}
#[test]
fn scheduled_loop_failure_overrides_explicit_fallbacks_and_thermal_flag_is_event_seven() {
    let data = fixtures();
    let mut a: RecoveredStepRequest =
        serde_json::from_value(data["cases"][1]["inputs"].clone()).unwrap();
    let mut b = a.clone();
    let schedule = b.controls.event_schedule.take().unwrap();
    let thermal = b.controls.normal_thermal.as_mut().unwrap();
    thermal.fault_flag = schedule.flags[7];
    thermal.failure_time = schedule.times[8];
    b.controls.rcp.as_mut().unwrap().trip_time = schedule.times[6];
    let sg = b.controls.steam_controls.as_mut().unwrap();
    sg.failure_time = schedule.times[8];
    sg.fault_flag = schedule.flags[8];
    b.controls.steam_valves.as_mut().unwrap().fault_flags = [schedule.flags[2], schedule.flags[3]];
    let a = a
        .globals
        .advance_recovered_primary_step(&a.controls)
        .unwrap();
    let b = b
        .globals
        .advance_recovered_primary_step(&b.controls)
        .unwrap();
    assert_eq!(a.singles, b.singles);
    assert_eq!(a.integers, b.integers);
    assert_eq!(a.singles["0x54b190"], 99999.);
}

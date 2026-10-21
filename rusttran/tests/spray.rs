#[test]
fn spray_numeric_and_command_paths_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../spray_fixtures.json")).unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 640);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::spray::SprayInputs = serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = serde_json::to_value(q.calculate().unwrap()).unwrap();
        for (n, e) in c["expected"].as_object().unwrap() {
            if n == "selector_value" || n == "spray_flow" {
                assert!(
                    (out[n].as_f64().unwrap() as f32)
                        .to_bits()
                        .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                        <= 2,
                    "case {i} {n}: {} vs {e}",
                    out[n]
                );
            } else {
                assert_eq!(&out[n], e, "case {i} {n}");
            }
        }
    }
}

#[test]
fn spray_binding_and_primary_transaction_match_composed_original_slices() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_controls_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 160);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::primary_core::PrimaryCoreRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let initial = q.globals.clone();
        let out = q
            .globals
            .advance_primary_core_with_controls(
                q.command_percent,
                q.fault_flag,
                q.pump_contributions,
                q.heater_controls.as_ref(),
                q.spray_controls.as_ref(),
            )
            .unwrap();
        for (n, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "case {i} {n}"
            );
        }
        assert_eq!(
            serde_json::to_value(out.integers).unwrap(),
            c["expected"]["integers"]
        );
        q.globals = initial;
        q.globals.singles.remove("0x54b200"); // Late heater failure after spray writes.
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_primary_core_with_controls(
                    q.command_percent,
                    q.fault_flag,
                    q.pump_contributions,
                    q.heater_controls.as_ref(),
                    q.spray_controls.as_ref()
                )
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}

#[test]
fn spray_rejects_original_arithmetic_errors_without_mutation() {
    let mut q = rusttran::spray::SprayInputs {
        signal: 2000.,
        lower_threshold: 2000.,
        upper_threshold: 2000.,
        interlock_signal: 0.,
        pump_a: 1,
        pump_b: 1,
        spray_manual: false,
        spray_percent: 0,
        auxiliary_percent: 0,
        spray_capacity: 10.,
        auxiliary_capacity: 0.,
    };
    assert!(q.calculate().is_err());
    q.lower_threshold = 1900.;
    q.upper_threshold = 2100.;
    q.pump_a = i16::MAX;
    assert!(q.calculate().is_err());
}

#[test]
fn shared_pressure_control_signal_matches_original_coordinator_store() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../pressure_control_signal_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    for c in doc["cases"].as_array().unwrap() {
        let q: rusttran::spray::PressureControlSignalInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        assert_eq!(
            q.calculate().unwrap().signal.to_bits(),
            (c["expected"]["signal"].as_f64().unwrap() as f32).to_bits()
        );
        let mut g = rusttran::native_globals::NativeGlobals::default();
        g.singles.insert("0x54b494".into(), q.pressure);
        g.singles.insert("0x54ba4c".into(), q.pressure_adjustment);
        g.prepare_pressure_control_signal().unwrap();
        assert_eq!(g.single(0x54b6d0).unwrap(), q.calculate().unwrap().signal);
    }
}

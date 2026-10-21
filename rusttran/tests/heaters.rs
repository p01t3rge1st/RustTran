#[test]
fn heater_numeric_paths_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../heater_fixtures.json")).unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 800);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::heaters::HeaterInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = serde_json::to_value(q.calculate().unwrap()).unwrap();
        for (n, e) in c["expected"].as_object().unwrap() {
            if n.ends_with("percent") {
                assert_eq!(&a[n], e, "case {i} {n}");
            } else {
                assert!(
                    (a[n].as_f64().unwrap() as f32)
                        .to_bits()
                        .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                        <= 2,
                    "case {i} {n}"
                );
            }
        }
    }
}

#[test]
fn core_calculates_heat_at_live_phase_level_and_rolls_back_on_missing_control_state() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_core_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let mut q: rusttran::primary_core::PrimaryCoreRequest =
        serde_json::from_value(doc["cases"][0]["inputs"].clone()).unwrap();
    let mut baseline = q.globals.clone();
    baseline
        .advance_primary_core(q.command_percent, q.fault_flag, q.pump_contributions)
        .unwrap();
    let controls = rusttran::heaters::HeaterControls {
        proportional_manual: true,
        backup_manual: true,
        proportional_percent: 50,
        backup_percent: 25,
    };
    for (n, v) in [
        ("0x54b6d0", 2000.),
        ("0x54b6d4", 0.5),
        ("0x54b1e4", 2100.),
        ("0x54b1e8", 1900.),
        ("0x54b1e0", 100.),
        ("0x54b1ec", 2000.),
        ("0x54b200", 200.),
        ("0x54b1d0", -1000.),
    ] {
        q.globals.singles.insert(n.into(), v);
        baseline.singles.insert(n.into(), v);
    }
    let expected = baseline.prepare_heaters(&controls).unwrap().total_heat;
    q.globals.singles.remove("0x54b6dc");
    let initial = q.globals.clone();
    let out = q
        .globals
        .advance_primary_core_with_heaters(
            q.command_percent,
            q.fault_flag,
            q.pump_contributions,
            Some(&controls),
        )
        .unwrap();
    assert_eq!(out.singles["0x54b6dc"], expected);
    assert_eq!(q.globals.single(0x54b6dc).unwrap(), expected);
    q.globals = initial;
    q.globals.singles.remove("0x54b6d0");
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_primary_core_with_heaters(
                q.command_percent,
                q.fault_flag,
                q.pump_contributions,
                Some(&controls)
            )
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}

#[test]
fn connected_primary_heaters_match_composed_original_slices() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_heaters_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::primary_core::PrimaryCoreRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q
            .globals
            .advance_primary_core_with_heaters(
                q.command_percent,
                q.fault_flag,
                q.pump_contributions,
                q.heater_controls.as_ref(),
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
    }
}

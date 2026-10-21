use rusttran::alternate_init::AlternateInitRequest;
#[test]
fn double_and_array_initializer_matches_continuous_original_instructions() {
    let document: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../alternate_init_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (i, case) in document["cases"].as_array().unwrap().iter().enumerate() {
        let request: AlternateInitRequest = serde_json::from_value(case["inputs"].clone()).unwrap();
        let expected: rusttran::alternate_init::AlternateState =
            serde_json::from_value(case["expected"].clone()).unwrap();
        let actual = request.initialize().unwrap();
        for (a, e) in &expected.doubles {
            assert_eq!(actual.doubles[a].to_bits(), e.to_bits(), "case {i}, {a}");
        }
        for (a, e) in &expected.arrays {
            for (j, expected_value) in e.iter().enumerate() {
                assert_eq!(
                    actual.arrays[a][j].to_bits(),
                    expected_value.to_bits(),
                    "case {i}, {a}[{j}]"
                );
            }
        }
        assert_eq!(actual.integers, expected.integers);
        assert_eq!(actual.singles, expected.singles);
        assert_eq!(actual.temperatures, expected.temperatures);
        assert_eq!(actual.zero_variant.vartype, 5);
        assert_eq!(actual.zero_variant.value.to_bits(), 0f64.to_bits());
    }
}
#[test]
fn invalid_or_missing_double_inputs_fail_without_modifying_request() {
    let fixture: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../alternate_init_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let mut request: AlternateInitRequest =
        serde_json::from_value(fixture["cases"][0]["inputs"].clone()).unwrap();
    request.model_doubles.remove("0x54bd38");
    assert!(
        request
            .initialize()
            .unwrap_err()
            .to_string()
            .contains("missing model Double")
    );
    request.model_doubles.insert("0x54bd38".into(), f64::NAN);
    assert!(request.initialize().is_err());
    request.model_doubles.insert("0x54bd38".into(), 1.);
    request.globals.singles.insert("0x54b304".into(), 0.);
    assert!(request.initialize().is_err());
}

#[test]
fn assembled_fresh_state_retains_references_and_typed_double_arrays() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    let fixtures: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../fresh_thermal_startup_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    for c in fixtures["cases"].as_array().unwrap() {
        let model = c["inputs"]["model"].as_str().unwrap();
        let ic = c["inputs"]["ic"].as_str().unwrap();
        let state = rusttran::fresh_steam::prepare_fresh_state(&db, model, ic, 0).unwrap();
        let old = rusttran::fresh_steam::prepare_thermal_startup(&db, model, ic).unwrap();
        for (a, v) in old.singles {
            assert_eq!(
                state.globals.singles[&a].to_bits(),
                v.to_bits(),
                "{model}/{ic}: {a}"
            );
        }
        for a in [
            "0x54b740", "0x54b744", "0x54b758", "0x54b760", "0x54b764", "0x54b768", "0x54b76c",
        ] {
            assert!(state.globals.singles.contains_key(a), "{a}");
        }
        assert_eq!(state.alternate.arrays.len(), 12);
        assert_eq!(state.globals.integers["0x54bec8"], 0);
        assert_eq!(state.alternate.integers["0x54bd2c"], 6);
        let bytes = serde_json::to_vec(&state).unwrap();
        let restored: rusttran::fresh_steam::FreshInitializedState =
            serde_json::from_slice(&bytes).unwrap();
        assert_eq!(state.alternate.doubles, restored.alternate.doubles);
        assert_eq!(state.alternate.arrays, restored.alternate.arrays);
    }
}

#[test]
fn complete_recovered_fresh_bundle_matches_independent_source_composition() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    let fixtures: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../fresh_initialized_state_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    for c in fixtures["cases"].as_array().unwrap() {
        let q = &c["inputs"];
        let out = rusttran::fresh_steam::prepare_fresh_state(
            &db,
            q["model"].as_str().unwrap(),
            q["ic"].as_str().unwrap(),
            q["fault_flag"].as_i64().unwrap() as i16,
        )
        .unwrap();
        let expected: rusttran::fresh_steam::FreshInitializedState =
            serde_json::from_value(c["expected"].clone()).unwrap();
        assert_eq!(out.globals.singles.len(), expected.globals.singles.len());
        for (a, e) in expected.globals.singles {
            assert!(
                out.globals.singles[&a].to_bits().abs_diff(e.to_bits()) <= 2,
                "{a}"
            );
        }
        assert_eq!(out.globals.integers, expected.globals.integers);
        assert_eq!(out.alternate.arrays, expected.alternate.arrays);
        assert_eq!(out.alternate.doubles, expected.alternate.doubles);
        assert_eq!(out.alternate.temperatures, expected.alternate.temperatures);
        assert_eq!(out.model_doubles, expected.model_doubles);
    }
}

#[test]
fn presentation_initialization_keeps_original_snapshot_and_owns_full_state() {
    let view = rusttran::presentation::Presentation::embedded().unwrap();
    let before = view.thermo.clone();
    let state = view.initialize_fresh_state("4", 0).unwrap();
    assert_eq!(view.thermo, before);
    assert_eq!(state.alternate.arrays.len(), 12);
    assert!(state.globals.singles.contains_key("0x54b740"));
    assert!(state.globals.integers.contains_key("0x54b700"));
}

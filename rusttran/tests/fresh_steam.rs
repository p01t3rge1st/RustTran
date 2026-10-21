#[test]
fn fresh_sg_levels_fractions_and_phase_aliases_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../fresh_steam_fixtures.json")).unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 320);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::fresh_steam::FreshSteamInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.initialize().unwrap();
        for (n, e) in c["expected"].as_object().unwrap() {
            assert!(
                out[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {n}: {} vs {e}",
                out[n]
            );
        }
    }
}

#[test]
fn fresh_feedwater_shares_and_coolant_flows_match_native() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../fresh_feedwater_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::fresh_steam::FreshFeedwaterInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.initialize().unwrap();
        assert_eq!(
            serde_json::to_value(out.integers).unwrap(),
            c["expected"]["integers"]
        );
        for (n, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {n}"
            );
        }
    }
}

#[test]
fn gui_thermal_startup_matches_connected_original_for_all_operating_points() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../fresh_thermal_startup_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let mut p = rusttran::presentation::Presentation::embedded().unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 110);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        p.select(c["inputs"]["ic"].as_str().unwrap()).unwrap();
        let out = p
            .initialize_thermal_system(c["inputs"]["model"].as_str().unwrap())
            .unwrap();
        assert_eq!(out.singles.len(), 130);
        assert_eq!(out.integers.len(), 15);
        assert_eq!(
            serde_json::to_value(out.integers).unwrap(),
            c["expected"]["integers"]
        );
        for (n, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {n}: {} vs {e}",
                out.singles[n]
            );
        }
    }
}

#[test]
fn current_derivative_initializer_preserves_history_and_unbound_states() {
    let mut g = rusttran::native_globals::NativeGlobals::default();
    g.singles.insert("0x54bb64".into(), 123.);
    g.singles.insert("0x54bba0".into(), 456.);
    g.singles.insert("0x54bf98".into(), 789.);
    g.initialize_current_derivative_outputs();
    assert_eq!(g.single(0x54bb64).unwrap(), 123.);
    assert_eq!(g.single(0x54bba0).unwrap(), 456.);
    assert_eq!(g.single(0x54bf98).unwrap(), 789.);
    assert!(g.single(0x54bfa0).is_err());
    assert!(g.single(0x54b4b8).is_err());
}

#[test]
fn fresh_auxiliary_stores_match_native_and_late_failure_preserves_history() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../fresh_auxiliary_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for case in doc["cases"].as_array().unwrap() {
        let mut g: rusttran::native_globals::NativeGlobals = serde_json::from_value(
            serde_json::json!({"singles":case["inputs"]["extra_singles"],"integers":{}}),
        )
        .unwrap();
        g.singles.insert("0x54bb64".into(), 123.);
        g.singles.insert("0x54bba0".into(), 456.);
        let out = g.initialize_fresh_auxiliary().unwrap();
        assert_eq!(out.len(), rusttran::fresh_auxiliary::OUTPUTS.len());
        assert_eq!(g.single(0x54bb64).unwrap(), 123.);
        assert_eq!(g.single(0x54bba0).unwrap(), 456.);
        for (key, v) in case["expected"].as_object().unwrap() {
            assert!(
                out[key]
                    .to_bits()
                    .abs_diff((v.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "{key}"
            );
        }
        g.singles.remove("0x54b57c");
        let before = serde_json::to_value(&g).unwrap();
        assert!(g.initialize_fresh_auxiliary().is_err());
        assert_eq!(before, serde_json::to_value(&g).unwrap());
    }
}

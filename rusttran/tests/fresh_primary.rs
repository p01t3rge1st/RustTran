#[test]
fn fresh_primary_branch_matches_native_state_properties_and_flags() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../fresh_primary_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 240);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::fresh_primary::FreshPrimaryInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.initialize().unwrap();
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
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
fn connected_fresh_primary_inventory_matches_one_native_frame() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../fresh_primary_inventory_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::fresh_primary::FreshPrimaryInventoryInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.initialize().unwrap();
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
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
fn gui_primary_initialization_matches_all_model_operating_point_references() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../fresh_primary_startup_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let mut presentation = rusttran::presentation::Presentation::embedded().unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 110);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        presentation
            .select(c["inputs"]["ic"].as_str().unwrap())
            .unwrap();
        let out = presentation
            .initialize_primary_system(c["inputs"]["model"].as_str().unwrap())
            .unwrap();
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
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

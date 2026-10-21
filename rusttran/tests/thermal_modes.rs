#[test]
fn thermal_mode_selection_retention_and_alternate_states_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../thermal_modes_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 400);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::thermal_driving::ThermalModeInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = q.calculate().unwrap();
        for (field, e) in c["expected"].as_object().unwrap() {
            assert!(
                a[field]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {field}: {} != {e}",
                a[field]
            );
        }
    }
}

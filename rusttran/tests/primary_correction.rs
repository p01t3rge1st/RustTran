#[test]
fn final_primary_mass_and_energy_corrections_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_correction_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 240);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::primary_correction::PrimaryCorrectionInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = serde_json::to_value(q.calculate().unwrap()).unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            assert!(
                (a[name].as_f64().unwrap() as f32)
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {name}"
            );
        }
    }
}

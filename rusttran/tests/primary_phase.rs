#[test]
fn all_four_primary_phase_branches_match_original_level_and_flow_boundaries() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_phase_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 640);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::primary_phase::PrimaryPhaseInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = serde_json::to_value(q.calculate().unwrap()).unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            if name == "trace" {
                for (field, e) in e.as_object().unwrap() {
                    assert!(
                        (a[name][field].as_f64().unwrap() as f32)
                            .to_bits()
                            .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                            <= 2,
                        "case {i} {field}: {} != {e}",
                        a[name][field]
                    );
                }
            } else {
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
}

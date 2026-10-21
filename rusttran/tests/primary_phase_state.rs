#[test]
fn mixture_reconstruction_pressure_floor_and_flag_changes_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_phase_state_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 640);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::primary_phase_state::PrimaryPhaseStateInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = serde_json::to_value(q.calculate().unwrap()).unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            if e.is_boolean() || name == "0x54b4d6" || name == "0x54b4d8" {
                assert_eq!(&a[name], e, "case {i} {name}");
            } else {
                assert!(
                    (a[name].as_f64().unwrap() as f32)
                        .to_bits()
                        .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                        <= 2,
                    "case {i} {name}: {} != {e}",
                    a[name]
                );
            }
        }
    }
}

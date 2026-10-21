#[test]
fn post_balance_feedback_matches_original_stores() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../primary_control_feedback_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 320);
    for c in doc["cases"].as_array().unwrap() {
        let q: rusttran::primary_feedback::PrimaryFeedbackInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = serde_json::to_value(q.calculate().unwrap()).unwrap();
        for (n, e) in c["expected"].as_object().unwrap() {
            assert_eq!(
                (out[n].as_f64().unwrap() as f32).to_bits(),
                (e.as_f64().unwrap() as f32).to_bits()
            );
        }
    }
}

#[test]
fn alternate_decay_heat_matches_original_dll_exp_and_sqrt_at_boundaries() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../decay_heat_fixtures.json")).unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 300);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::decay_heat::DecayHeatInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = q.calculate().unwrap().heat;
        let e = c["expected"]["heat"].as_f64().unwrap();
        assert!(
            (a - e).abs() <= e.abs().max(1.) * 2e-13,
            "case {i}: {a} != {e}"
        );
    }
}

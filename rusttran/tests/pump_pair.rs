#[test]
fn coupled_rcp_normalization_void_cap_and_asymmetric_constants_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../pump_pair_fixtures.json")).unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 320);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::pumps::PumpPairInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = q.advance().unwrap();
        for side in 0..2 {
            for (value, name) in [
                (a.loops[side].flow, "flow"),
                (a.loops[side].normalized_flow, "normalized_flow"),
            ] {
                let e = c["expected"]["loops"][side][name].as_f64().unwrap() as f32;
                assert!(
                    value.to_bits().abs_diff(e.to_bits()) <= 4,
                    "case {i} loop {side} {name}: {value} != {e}"
                );
            }
        }
        assert_eq!(
            a.void_fraction,
            c["expected"]["void_fraction"].as_f64().unwrap() as f32
        );
        assert_eq!(
            a.selected_time_constant_a,
            c["expected"]["selected_time_constant_a"].as_f64().unwrap() as f32
        );
    }
}

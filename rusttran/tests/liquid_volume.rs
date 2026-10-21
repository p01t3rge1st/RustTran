#[test]
fn compressed_liquid_volume_matches_original_wrapper() {
    let path = rusttran::default_data_root().join("../liquid_volume_fixtures.json");
    let doc: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 96);
    for (index, case) in cases.iter().enumerate() {
        let actual = rusttran::physics::liquid_specific_volume(
            case["pressure"].as_f64().unwrap() as f32,
            case["temperature"].as_f64().unwrap() as f32,
        )
        .unwrap();
        let expected = case["expected"].as_f64().unwrap() as f32;
        let ordered = |v: f32| {
            let b = v.to_bits();
            i64::from(if b & 0x8000_0000 != 0 {
                !b
            } else {
                b | 0x8000_0000
            })
        };
        assert!(
            (ordered(actual) - ordered(expected)).abs() <= 2,
            "case {index}: {actual} != {expected}"
        );
    }
}

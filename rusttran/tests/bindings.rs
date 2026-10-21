#[test]
fn conversions_match_original_variant_operand_blocks() {
    let path = rusttran::default_data_root().join("../field_conversion_fixtures.json");
    let doc: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 68);
    for case in cases {
        let input = case["input"].as_f64().unwrap();
        let actual = match case["kind"].as_str().unwrap() {
            "pressure" => rusttran::bindings::native_pressure(input),
            "temperature" => rusttran::bindings::native_temperature(input),
            _ => panic!("unknown conversion"),
        }
        .unwrap();
        assert_eq!(
            actual.to_bits(),
            (case["expected"].as_f64().unwrap() as f32).to_bits()
        );
    }
}
#[test]
fn seeds_include_only_authenticated_fields() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    let seed = rusttran::bindings::NativeSeed::condition(&db, "1").unwrap();
    assert_eq!(seed.globals.len(), 85);
    assert_eq!(seed.globals["0x54b414"], 0.5);
    assert_eq!(
        seed.globals["0x54b494"],
        rusttran::bindings::native_pressure(158.2).unwrap()
    );
    assert!(rusttran::bindings::NativeSeed::condition(&db, "21").is_err());
    let model = rusttran::bindings::NativeSeed::model(&db, "1").unwrap();
    assert_eq!(model.globals["0x54b120"], 2705.);
}

#[test]
fn all_recovered_condition_fields_match_native_loader_blocks() {
    let path = rusttran::default_data_root().join("../field_conversion_fixtures.json");
    let doc: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = doc["seed_cases"].as_array().unwrap();
    assert_eq!(cases.len(), 1870);
    let db = rusttran::Database::embedded("ListData").unwrap();
    for case in cases {
        let seed =
            rusttran::bindings::NativeSeed::condition(&db, case["ic"].as_str().unwrap()).unwrap();
        let actual = seed.globals[case["target"].as_str().unwrap()];
        let expected = case["expected"].as_f64().unwrap() as f32;
        assert_eq!(
            actual.to_bits(),
            expected.to_bits(),
            "IC {} field {}",
            case["ic"],
            case["field"]
        );
    }
}

#[test]
fn integer_fields_match_original_loader_stores() {
    let path = rusttran::default_data_root().join("../integer_seed_fixtures.json");
    let doc: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 418);
    let db = rusttran::Database::embedded("ListData").unwrap();
    for case in cases {
        let seed =
            rusttran::bindings::NativeSeed::condition(&db, case["ic"].as_str().unwrap()).unwrap();
        assert_eq!(
            seed.integers[case["target"].as_str().unwrap()],
            case["expected"].as_i64().unwrap() as i32
        );
    }
}

#[test]
fn model_fields_match_native_vb6_and_original_field_blocks() {
    let path = rusttran::default_data_root().join("../model_seed_fixtures.json");
    let doc: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 675);
    let db = rusttran::Database::embedded("ListData").unwrap();
    for case in cases {
        let seed =
            rusttran::bindings::NativeSeed::model(&db, case["set"].as_str().unwrap()).unwrap();
        let address = case["target"].as_str().unwrap();
        let expected = case["expected"].as_f64().unwrap();
        if let Some(curve) = case["curve"].as_str().filter(|c| !c.is_empty()) {
            assert_eq!(
                seed.curves[curve][case["index"].as_u64().unwrap() as usize].to_bits(),
                (expected as f32).to_bits(),
                "SET {} field {}",
                case["set"],
                case["field"]
            );
        } else if case["output_bits"] == 64 {
            assert_eq!(
                seed.doubles[address].to_bits(),
                expected.to_bits(),
                "SET {} field {}",
                case["set"],
                case["field"]
            );
        } else {
            assert_eq!(
                seed.globals[address].to_bits(),
                (expected as f32).to_bits(),
                "SET {} field {}",
                case["set"],
                case["field"]
            );
        }
    }
}

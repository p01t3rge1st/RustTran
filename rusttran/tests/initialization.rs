#[test]
fn fresh_pressurizer_inventory_matches_native_branch() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../pressurizer_init_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 240);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::initialization::PressurizerInitInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = serde_json::to_value(input.initialize().unwrap()).unwrap();
        for (name, e) in case["expected"].as_object().unwrap() {
            let a = actual[name].as_f64().unwrap() as f32;
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {index} {name}: {a} != {e}"
            );
        }
    }
}
#[test]
fn model_mapping_and_invalid_inputs_are_checked() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    for id in ["1", "2", "3", "4", "5"] {
        let model = rusttran::bindings::NativeSeed::model(&db, id).unwrap();
        let input = rusttran::initialization::PressurizerInitInputs::from_model(
            &model,
            model.globals["0x54b128"],
        )
        .unwrap();
        let out = input.initialize().unwrap();
        assert!(out.g54b7f0 > 0.);
        assert!((out.g54b6d4 - model.globals["0x54b154"]).abs() < 2. * f32::EPSILON);
        let mut invalid = input;
        invalid.g54b128 = invalid.g54b1a8;
        assert!(invalid.initialize().is_err());
    }
}

#[test]
fn startup_heat_and_conversion_constants_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../startup_heat_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (name, value) in [
        ("0x54b330", rusttran::bindings::HEAT_FACTOR),
        ("0x54b2fc", rusttran::bindings::PRESSURE_FACTOR),
        ("0x54b304", rusttran::bindings::TEMPERATURE_FACTOR),
        ("0x54b300", rusttran::bindings::TEMPERATURE_OFFSET),
        ("0x54b334", rusttran::bindings::PRESSURE_WORK),
    ] {
        assert_eq!(
            value.to_bits(),
            (doc["constants"][name].as_f64().unwrap() as f32).to_bits()
        );
    }
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 200);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::initialization::StartupHeatInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = serde_json::to_value(input.initialize().unwrap()).unwrap();
        for (name, e) in case["expected"].as_object().unwrap() {
            let a = actual[name].as_f64().unwrap() as f32;
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {index} {name}: {a} != {e}"
            );
        }
    }
}

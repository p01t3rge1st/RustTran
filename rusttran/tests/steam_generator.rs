#[test]
fn final_exchange_matches_both_original_native_branches() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../steam_generator_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 160);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::steam_generator::SteamGeneratorInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = serde_json::to_value(input.derivatives().unwrap()).unwrap();
        for (name, e) in case["expected"].as_object().unwrap() {
            let a = actual[name].as_f64().unwrap() as f32;
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 4,
                "case {index} {name}: {a} != {e}"
            );
        }
    }
}
#[test]
fn caller_output_bindings_match_six_integration_inputs() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../steam_generator_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (i, binding) in doc["caller_bindings"]
        .as_array()
        .unwrap()
        .iter()
        .enumerate()
    {
        let args = binding["arguments"].as_array().unwrap();
        assert_eq!(args.len(), 42);
        // Original EBP+0x58, +0x70 and +0x74 are the three derivative outputs.
        for (arg, address) in [
            (20, ["0x54b7e0", "0x54b7e4"]),
            (26, ["0x54b7d8", "0x54b7dc"]),
            (27, ["0x54b7d0", "0x54b7d4"]),
        ] {
            assert_eq!(args[arg]["pointer"].as_str().unwrap(), address[i]);
        }
    }
}

#[test]
fn outflow_limit_and_heat_correction_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../steam_outflow_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 240);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::steam_generator::SteamOutflowInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = serde_json::to_value(input.limit().unwrap()).unwrap();
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

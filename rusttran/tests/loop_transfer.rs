#[test]
fn full_numerical_loop_body_matches_native_instructions_and_dll_power() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../loop_transfer_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 300);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::loop_transfer::LoopTransferInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let output = serde_json::to_value(input.calculate().unwrap()).unwrap();
        for name in ["p08", "p28", "p34", "p3c"] {
            let a = output[name].as_f64().unwrap() as f32;
            let e = case["expected"][name].as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 4,
                "case {index} {name}: {a} != {e}"
            );
        }
        for (name, e) in case["expected"]["trace"].as_object().unwrap() {
            let a = output["trace"][name].as_f64().unwrap() as f32;
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {index} trace {name}: {a} != {e}"
            );
        }
    }
}
#[test]
fn invalid_loop_transfer_inputs_fail() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../loop_transfer_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let mut input: rusttran::loop_transfer::LoopTransferInputs =
        serde_json::from_value(doc["cases"][0]["inputs"].clone()).unwrap();
    input.p78 = 0;
    assert!(input.calculate().is_err());
    input.p78 = 1;
    input.p4c = 0.;
    assert!(input.calculate().is_err());
}

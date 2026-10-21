#[test]
fn rcp_flow_updates_match_original_blocks() {
    let path = rusttran::default_data_root().join("../pump_fixtures.json");
    let doc: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 200);
    for (index, case) in cases.iter().enumerate() {
        let inputs: rusttran::pumps::PumpFlowInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = serde_json::to_value(inputs.advance().unwrap()).unwrap();
        for name in ["normalized_flow", "flow"] {
            let a = actual[name].as_f64().unwrap() as f32;
            let e = case["expected"][name].as_f64().unwrap() as f32;
            // Native x87 vs portable binary64 can round the intermediate
            // coastdown increment to adjacent Singles. Near cancellation,
            // a final-output ULP bound would amplify that one-bit difference.
            let normalized_tolerance = 2.
                * f32::EPSILON
                * f32::max(
                    1.,
                    inputs
                        .normalized_flow
                        .abs()
                        .max(inputs.target.abs())
                        .max(case["expected"]["normalized_flow"].as_f64().unwrap().abs() as f32),
                );
            let scale = (f64::from(inputs.base_flow) / 100.
                * f64::from(inputs.loop_share)
                * f64::from(inputs.volume_factor)
                / f64::from(inputs.specific_volume)
                * (1. - f64::from(inputs.void_fraction)))
            .abs();
            let tolerance = if name == "normalized_flow" {
                f64::from(normalized_tolerance)
            } else {
                f64::from(normalized_tolerance) * scale
                    + f64::from(2. * f32::EPSILON * e.abs().max(1.))
            };
            assert!(
                f64::from((a - e).abs()) <= tolerance,
                "case {index} {name}: {a} != {e}, tolerance={tolerance}"
            );
        }
    }
}

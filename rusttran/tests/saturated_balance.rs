#[test]
fn saturated_vessel_derivatives_and_intermediates_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../saturated_balance_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 240);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::saturated_balance::SaturatedInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let output = serde_json::to_value(input.derivatives().unwrap()).unwrap();
        for name in ["fraction_derivative", "pressure_derivative"] {
            let a = output[name].as_f64().unwrap() as f32;
            let e = case["expected"][name].as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 4,
                "case {index} {name}: {a} != {e}"
            );
        }
        for (name, e) in case["trace"].as_object().unwrap() {
            let a = output["trace"][name].as_f64().unwrap() as f32;
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {index} trace {name}: {a} != {e}"
            );
        }
    }
    for case in doc["delta_cases"].as_array().unwrap() {
        let a = rusttran::saturated_balance::pressure_difference_step(
            case["pressure"].as_f64().unwrap() as f32,
        )
        .unwrap();
        assert_eq!(
            a.to_bits(),
            (case["expected"].as_f64().unwrap() as f32).to_bits()
        );
    }
}
#[test]
fn invalid_saturated_domains_fail() {
    let mut input = rusttran::saturated_balance::SaturatedInputs {
        pressure: 0.,
        fraction: 0.5,
        inflow: 1.,
        inflow_enthalpy: 300.,
        outflow: 1.,
        heat: 0.,
        volume: 100.,
        pressure_work: 0.185,
    };
    assert!(input.derivatives().is_err());
    input.pressure = 100.;
    input.volume = 0.;
    assert!(input.derivatives().is_err());
}

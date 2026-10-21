#[test]
fn bounded_pi_matches_original_numeric_instructions() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../controller_fixtures.json")).unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 300);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::controller::ControllerInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = serde_json::to_value(input.advance().unwrap()).unwrap();
        for name in ["output", "previous_error"] {
            let a = actual[name].as_f64().unwrap() as f32;
            let e = case["expected"][name].as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {index} {name}: {a} != {e}"
            );
        }
    }
}
#[test]
fn invalid_controller_inputs_fail() {
    let mut input = rusttran::controller::ControllerInputs {
        measured: 1.,
        target: 0.,
        proportional_band: 0.,
        output: 0.,
        previous_error: 0.,
        gain: 1.,
        integral_time: 1.,
        step: 1.,
        lower: 0.,
        upper: 100.,
    };
    assert!(input.advance().is_err());
    input.proportional_band = 1.;
    input.lower = 101.;
    assert!(input.advance().is_err());
}

#[test]
fn native_seven_point_curves_and_model_bindings_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../injection_curve_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 140);
    let db = rusttran::Database::embedded("ListData").unwrap();
    for case in cases {
        let seed =
            rusttran::bindings::NativeSeed::model(&db, case["model"].as_str().unwrap()).unwrap();
        let curve = rusttran::controller::InjectionCurve::from_model(
            &seed,
            case["family"].as_str().unwrap() == "high",
        )
        .unwrap();
        let actual = curve
            .evaluate(case["query"].as_f64().unwrap() as f32)
            .unwrap();
        assert_eq!(
            actual.to_bits(),
            (case["expected"].as_f64().unwrap() as f32).to_bits()
        );
    }
}

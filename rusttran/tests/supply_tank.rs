#[test]
fn supply_depletion_and_trigger_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../supply_tank_fixtures.json")).unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 200);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::supply_tank::SupplyTankInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let output = input.deplete().unwrap();
        assert_eq!(
            output.recirculation_required,
            case["expected"]["recirculation_required"]
                .as_bool()
                .unwrap()
        );
        assert_eq!(output.recirculation_flow, 0.);
        assert_eq!(output.other_recirculation_flow, 0.);
        for (name, a) in [
            ("volume", Some(output.volume)),
            ("level_command", output.level_command),
        ] {
            if let Some(a) = a {
                let e = case["expected"][name].as_f64().unwrap() as f32;
                assert!(
                    a.to_bits().abs_diff(e.to_bits()) <= 2,
                    "case {index} {name}: {a} != {e}"
                );
            } else {
                assert!(case["expected"][name].is_null());
            }
        }
    }
}
#[test]
fn model_thresholds_and_invalid_domains_are_checked() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    let model = rusttran::bindings::NativeSeed::model(&db, "1").unwrap();
    let input = rusttran::supply_tank::SupplyTankInputs {
        volume: 0.,
        injection_flow: 0.,
        flow_a: 0.,
        flow_b: 0.,
        step: 0.,
        minimum_volume: 0.,
        initial_volume: 0.,
    };
    let from_model = input.clone().with_model_thresholds(&model).unwrap();
    assert_eq!(from_model.minimum_volume, model.globals["0x54b580"]);
    assert_eq!(from_model.initial_volume, model.globals["0x54b57c"]);
    let mut invalid = input;
    invalid.minimum_volume = 1.;
    assert!(invalid.deplete().is_err());
    invalid.step = -1.;
    assert!(invalid.deplete().is_err());
}

#[test]
fn relief_and_critical_table_blocks_match_native() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../relief_fixtures.json")).unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 300);
    for (index, case) in cases.iter().enumerate() {
        let inputs: rusttran::relief::ReliefInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = inputs.discharge().unwrap();
        assert_eq!(
            actual.phase_flag,
            case["expected"]["phase_flag"].as_i64().unwrap() as i16
        );
        for (name, value) in [("flow", actual.flow), ("enthalpy", actual.enthalpy)] {
            let e = case["expected"][name].as_f64().unwrap() as f32;
            assert!(
                value.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {index} {name}: {value} != {e}"
            );
        }
    }
    let cases = doc["critical_cases"].as_array().unwrap();
    assert_eq!(cases.len(), 160);
    for case in cases {
        let a = rusttran::physics::critical_discharge_flux(
            case["pressure"].as_f64().unwrap() as f32,
            case["phase"].as_i64().unwrap() as i16,
        )
        .unwrap();
        let e = case["expected"].as_f64().unwrap() as f32;
        assert_eq!(a.to_bits(), e.to_bits());
    }
}
#[test]
fn invalid_relief_inputs_fail() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../relief_fixtures.json")).unwrap(),
    )
    .unwrap();
    let mut input: rusttran::relief::ReliefInputs =
        serde_json::from_value(doc["cases"][0]["inputs"].clone()).unwrap();
    input.porv_a = i16::MAX;
    input.porv_b = 1;
    assert!(input.discharge().is_err());
    input.porv_a = 0;
    input.porv_b = 0;
    input.phase_flag = 1;
    input.level = 1.;
    input.reset_level = 0.98;
    input.mixture_level = 0.98;
    assert!(input.discharge().is_err());
    input.reset_level = 0.5;
    input.liquid_flux = 0.;
    input.vapor_flux = 0.;
    assert!(input.discharge().is_err());
}

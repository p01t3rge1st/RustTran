use rusttran::accumulator::AccumulatorInputs;
fn input() -> AccumulatorInputs {
    AccumulatorInputs {
        system_pressure: 500.,
        activation: 1,
        gas_pressure: 600.,
        flow: 9.,
        water_volume: 100.,
        step: 1.,
        gas_volume: 100.,
        total_volume: 200.,
        coefficient: 1.,
        valve_a: 100,
        valve_b: 100,
    }
}
#[test]
fn discharge_matches_native_numeric_blocks() {
    let path = rusttran::default_data_root().join("../accumulator_fixtures.json");
    let doc: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 200);
    for (index, case) in cases.iter().enumerate() {
        let input: AccumulatorInputs = serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = serde_json::to_value(input.advance().unwrap()).unwrap();
        for name in ["gas_pressure", "flow", "water_volume", "gas_volume"] {
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
fn inactive_and_blocked_branches_preserve_inventory() {
    let mut input = input();
    input.activation = 0;
    let output = input.advance().unwrap();
    assert_eq!(output.flow, 9.);
    assert_eq!(output.water_volume, 100.);
    input.activation = 1;
    input.system_pressure = 600.;
    let output = input.advance().unwrap();
    assert_eq!(output.flow, 0.);
    assert_eq!(output.gas_pressure, 600.);
    input.system_pressure = 500.;
    input.water_volume = 0.999;
    assert_eq!(input.advance().unwrap().flow, 0.);
}
#[test]
fn invalid_numeric_domain_and_native_integer_overflow_fail() {
    let mut input = input();
    input.valve_a = i16::MAX;
    input.valve_b = 1;
    assert!(input.advance().is_err());
    input.valve_a = 100;
    input.valve_b = 100;
    input.total_volume = 0.;
    assert!(input.advance().is_err());
    input.step = f32::NAN;
    assert!(input.advance().is_err());
}

#[test]
fn activation_latch_time_and_valve_commands_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../activation_fixtures.json")).unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 240);
    for case in cases {
        let input: rusttran::accumulator::ActivationInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let output = input.activate().unwrap();
        assert_eq!(
            output.event_time.to_bits(),
            (case["expected"]["event_time"].as_f64().unwrap() as f32).to_bits()
        );
        let mut actual = serde_json::to_value(output).unwrap();
        let mut expected = case["expected"].clone();
        actual.as_object_mut().unwrap().remove("event_time");
        expected.as_object_mut().unwrap().remove("event_time");
        assert_eq!(actual, expected);
    }
}

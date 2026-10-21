use rusttran::vessel::{VesselInputs, VesselState};
#[test]
fn numeric_vessel_solver_matches_original_iterations_and_outputs() {
    let path = rusttran::default_data_root().join("../vessel_fixtures.json");
    let fixture: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = fixture["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 112);
    for (index, case) in cases.iter().enumerate() {
        let args: Vec<_> = case["parameters"]
            .as_array()
            .unwrap()
            .iter()
            .map(|v| v.as_f64().unwrap() as f32)
            .collect();
        let state = VesselState {
            pressure: args[0],
            gas_pressure: args[1],
            temperature: args[2],
            level: args[3],
        };
        let inputs = VesselInputs {
            mass_delta: args[4],
            inflow_enthalpy: args[5],
            gas_mass_delta: args[6],
            energy_loss: args[7],
            volume: args[8],
            level_scale: args[9],
            temperature_floor: args[10],
            pressure_work: case["work_coefficient"].as_f64().unwrap() as f32,
        };
        let result = inputs.solve(&state).unwrap();
        assert_eq!(
            result.iterations,
            case["iterations"].as_u64().unwrap() as usize,
            "case {index} iteration count"
        );
        let traces = case["iteration_trace"].as_array().unwrap();
        for (iteration, (actual, expected)) in result.trace.iter().zip(traces).enumerate() {
            let actual = serde_json::to_value(actual).unwrap();
            for (name, expected) in expected.as_object().unwrap() {
                let actual = actual[name].as_f64().unwrap() as f32;
                let expected = expected.as_f64().unwrap() as f32;
                assert!(
                    (ordered(actual) - ordered(expected)).abs() <= 2,
                    "case {index} iteration {iteration} {name}: {actual} != {expected}"
                );
            }
        }
        let actual = [
            result.state.pressure,
            result.state.gas_pressure,
            result.state.temperature,
            result.state.level,
        ];
        for (field, (&actual, expected)) in actual
            .iter()
            .zip(case["outputs"].as_array().unwrap())
            .enumerate()
        {
            let expected = expected.as_f64().unwrap() as f32;
            assert!(
                (ordered(actual) - ordered(expected)).abs() <= 2,
                "case {index} field {field}: {actual} != {expected}"
            );
        }
    }
}
fn ordered(value: f32) -> i64 {
    let bits = value.to_bits();
    i64::from(if bits & 0x8000_0000 != 0 {
        !bits
    } else {
        bits | 0x8000_0000
    })
}

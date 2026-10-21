use rusttran::integration::{BINDINGS, IntegrationState};
#[test]
fn bindings_match_recovered_native_operands() {
    let path = rusttran::default_data_root().join("../integration_states.json");
    let evidence: serde_json::Value =
        serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    for (binding, native) in BINDINGS.iter().zip(evidence["states"].as_array().unwrap()) {
        assert_eq!(binding.state as u64, native["state_va"].as_u64().unwrap());
        assert_eq!(
            binding.derivative as u64,
            native["new_derivative_va"].as_u64().unwrap()
        );
        assert_eq!(
            binding.previous as u64,
            native["previous_derivative_va"].as_u64().unwrap()
        );
    }
}
#[test]
fn native_constraints_and_single_precision_stores() {
    let mut state = IntegrationState {
        values: [0.; 14],
        previous_derivatives: [1.; 14],
        copied_state: 0.,
    };
    let mut derivatives = [1.; 14];
    derivatives[9] = -1.;
    derivatives[10] = -1.;
    state.previous_derivatives = derivatives;
    state.advance(derivatives, 2., 155.).unwrap();
    assert_eq!(state.values[0], 2.);
    assert_eq!(state.copied_state, 2.);
    assert_eq!(state.values[5], 1.);
    assert_eq!(state.values[6], 1.);
    assert_eq!(state.values[9], 0.);
    assert_eq!(state.values[10], 0.);
    assert_eq!(state.values[3], 155.1_f32);
    assert_eq!(state.previous_derivatives, derivatives);
    // Native upper bound is not a guessed lower bound for fraction states.
    derivatives[5] = -1.;
    state.previous_derivatives = derivatives;
    state.advance(derivatives, 2., 155.).unwrap();
    assert_eq!(state.values[5], -1.);
}
#[test]
fn failed_step_preserves_all_state() {
    let initial = IntegrationState {
        values: [2.; 14],
        previous_derivatives: [1.; 14],
        copied_state: 2.,
    };
    for (step, index) in [(0., 0), (f32::INFINITY, 0), (1., 13)] {
        let mut state = initial.clone();
        let mut derivatives = [1.; 14];
        if index == 13 {
            derivatives[index] = f32::NAN;
        }
        assert!(state.advance(derivatives, step, 1.).is_err());
        assert_eq!(state, initial);
    }
}

#[test]
fn fourteen_state_stage_matches_original_single_byref_prefixes() {
    let path = rusttran::default_data_root().join("../integration_fixtures.json");
    let fixture: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let array = |case: &serde_json::Value, name: &str| -> [f32; 14] {
        case[name]
            .as_array()
            .unwrap()
            .iter()
            .map(|v| v.as_f64().unwrap() as f32)
            .collect::<Vec<_>>()
            .try_into()
            .unwrap()
    };
    assert_eq!(fixture["cases"].as_array().unwrap().len(), 100);
    for (index, case) in fixture["cases"].as_array().unwrap().iter().enumerate() {
        let mut state = IntegrationState {
            values: array(case, "values"),
            previous_derivatives: array(case, "previous"),
            copied_state: 0.,
        };
        state
            .advance(
                array(case, "derivatives"),
                case["step"].as_f64().unwrap() as f32,
                case["pressure_floor"].as_f64().unwrap() as f32,
            )
            .unwrap();
        for (actual, expected) in state.values.into_iter().zip(array(case, "expected")) {
            assert_eq!(
                actual.to_bits(),
                expected.to_bits(),
                "native integration case {index}"
            );
        }
        assert_eq!(state.previous_derivatives, array(case, "expected_previous"));
        assert_eq!(
            state.copied_state,
            case["copied_state"].as_f64().unwrap() as f32
        );
    }
}

#[test]
fn integrator_restoration_matches_native_ic_values_and_alias() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../integration_seed_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 22);
    let db = rusttran::Database::embedded("ListData").unwrap();
    for case in cases {
        let seed =
            rusttran::bindings::NativeSeed::condition(&db, case["ic"].as_str().unwrap()).unwrap();
        let extra = serde_json::from_value(case["extra"].clone()).unwrap();
        let previous: [f32; 14] =
            serde_json::from_value(case["previous_derivatives"].clone()).unwrap();
        let state = IntegrationState::from_condition(&seed, &extra, previous).unwrap();
        for (a, e) in state
            .values
            .iter()
            .zip(case["expected_values"].as_array().unwrap())
        {
            assert_eq!(a.to_bits(), (e.as_f64().unwrap() as f32).to_bits());
        }
        assert_eq!(state.previous_derivatives, previous);
        assert_eq!(
            state.copied_state.to_bits(),
            (case["copied_state"].as_f64().unwrap() as f32).to_bits()
        );
        let mut missing = seed;
        missing.globals.remove("0x54b4f0");
        assert!(IntegrationState::from_condition(&missing, &extra, previous).is_err());
    }
}

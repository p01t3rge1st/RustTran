use rusttran::reaction_transfer::ReactionTransferRequest;
use serde_json::Value;
fn fixtures() -> Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../reaction_transfer_fixtures.json"))
            .unwrap(),
    )
    .unwrap()
}
fn compare(a: &Value, e: &Value, path: &str) {
    match e {
        Value::Object(fields) => {
            assert_eq!(a.as_object().unwrap().len(), fields.len(), "{path}");
            for (k, v) in fields {
                compare(&a[k], v, &format!("{path}.{k}"));
            }
        }
        Value::Array(values) => {
            assert_eq!(a.as_array().unwrap().len(), values.len(), "{path}");
            for (i, v) in values.iter().enumerate() {
                compare(&a[i], v, &format!("{path}[{i}]"));
            }
        }
        Value::Number(n) if n.is_f64() => {
            if path.contains(".controls.reaction_transfer.") {
                assert_eq!(
                    a.as_f64().unwrap().to_bits(),
                    n.as_f64().unwrap().to_bits(),
                    "{path}: Double retention"
                );
                return;
            }

            let actual = a.as_f64().unwrap() as f32;
            let expected = n.as_f64().unwrap() as f32;
            let ordered = |v: f32| {
                if v.is_sign_negative() {
                    !v.to_bits()
                } else {
                    v.to_bits() | 0x80000000
                }
            };
            assert!(
                actual.is_finite() && ordered(actual).abs_diff(ordered(expected)) <= 4,
                "{path}: {actual} != {expected}; {} ULP",
                ordered(actual).abs_diff(ordered(expected))
            );
        }
        _ => assert_eq!(a, e, "{path}"),
    }
}
#[test]
fn original_post_model_transfer_and_histories_match() {
    let f = fixtures();
    let cases = f["cases"].as_array().unwrap();
    assert!(cases.len() >= 192);
    for (i, case) in cases.iter().enumerate() {
        let mut q: ReactionTransferRequest =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let output = q.globals.advance_reaction_transfer(&q.inputs).unwrap();
        compare(
            &serde_json::to_value(&output).unwrap(),
            &case["expected"],
            &format!("reaction {i}"),
        );
        for (k, v) in output.singles {
            assert_eq!(q.globals.singles[&k], v);
        }
    }
}
#[test]
fn native_singularities_and_late_failures_preserve_all_histories() {
    let f = fixtures();
    assert!(!f["error_cases"].as_array().unwrap().is_empty());
    for case in f["error_cases"].as_array().unwrap() {
        let mut q: ReactionTransferRequest =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(q.globals.advance_reaction_transfer(&q.inputs).is_err());
        assert_eq!(serde_json::to_value(&q.globals).unwrap(), before);
    }
    let base = f["cases"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| c["expected"]["transfer_active"] == true)
        .unwrap();
    for failure in 0..4 {
        let mut q: ReactionTransferRequest =
            serde_json::from_value(base["inputs"].clone()).unwrap();
        match failure {
            0 => {
                q.globals.singles.remove("0x54bfc8");
            }
            1 => {
                q.globals.singles.insert("0x54bfc0".into(), 0.);
            }
            2 => {
                q.globals.singles.remove("0x54bfbc");
            }
            _ => q.inputs.pi = f64::NAN,
        }
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(q.globals.advance_reaction_transfer(&q.inputs).is_err());
        assert_eq!(serde_json::to_value(&q.globals).unwrap(), before);
    }
}
#[test]
fn skipped_fraction_and_no_transfer_do_not_require_unread_sources() {
    let f = fixtures();
    let case = &f["cases"][0];
    let mut q: ReactionTransferRequest = serde_json::from_value(case["inputs"].clone()).unwrap();
    q.globals.singles.clear();
    q.inputs.node_temperature = f64::NAN;
    q.inputs.material_masses = [f64::NAN; 4];
    q.inputs.pi = f64::NAN;
    let out = q.globals.advance_reaction_transfer(&q.inputs).unwrap();
    assert!(!out.active);
    assert!(out.singles.is_empty());
    let case = f["cases"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| c["expected"]["active"] == true && c["expected"]["transfer_active"] == false)
        .unwrap();
    let mut q: ReactionTransferRequest = serde_json::from_value(case["inputs"].clone()).unwrap();
    for a in ["0x54bfc8", "0x54bfc0", "0x54bfbc"] {
        q.globals.singles.remove(a);
    }
    let out = q.globals.advance_reaction_transfer(&q.inputs).unwrap();
    compare(
        &serde_json::to_value(out).unwrap(),
        &case["expected"],
        "inactive transfer",
    );
}

#[test]
fn original_composed_steps_and_retained_reaction_chains_match() {
    for (name, session) in [
        ("recovered_reaction_step_fixtures.json", false),
        ("recovered_reaction_session_fixtures.json", true),
    ] {
        let doc: Value = serde_json::from_slice(
            &std::fs::read(rusttran::default_data_root().join("..").join(name)).unwrap(),
        )
        .unwrap();
        for (i, case) in doc["cases"].as_array().unwrap().iter().enumerate() {
            let actual = if session {
                let mut q: rusttran::recovered_session::SessionRunRequest =
                    serde_json::from_value(case["inputs"].clone()).unwrap();
                let steps = q.session.advance(q.steps).unwrap();
                serde_json::json!({"session":q.session,"steps":steps})
            } else {
                let mut q: rusttran::recovered_step::RecoveredStepRequest =
                    serde_json::from_value(case["inputs"].clone()).unwrap();
                serde_json::to_value(
                    q.globals
                        .advance_recovered_primary_step(&q.controls)
                        .unwrap(),
                )
                .unwrap()
            };
            compare(&actual, &case["expected"], &format!("{name} {i}"));
        }
    }
}
#[test]
fn current_transfer_feeds_energy_and_survives_resume_with_atomic_late_failure() {
    let doc: Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_reaction_session_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let mut q: rusttran::recovered_session::SessionRunRequest =
        serde_json::from_value(doc["cases"][1]["inputs"].clone()).unwrap();
    let mut cached = q.session.clone();
    cached.controls.reaction_transfer = None;
    let first = q.session.advance(1).unwrap();
    let transfer = first[0].reaction_transfer.as_ref().unwrap();
    assert!(transfer.transfer_active);
    assert!(transfer.singles["0x54bfb4"] > 0.);
    let old = cached.advance(1).unwrap();
    assert_ne!(
        first[0].containment_thermal.as_ref().unwrap().singles["0x54bfb8"],
        old[0].containment_thermal.as_ref().unwrap().singles["0x54bfb8"]
    );
    let mut resumed: rusttran::recovered_session::RecoveredSession =
        serde_json::from_slice(&serde_json::to_vec(&q.session).unwrap()).unwrap();
    let a = q.session.advance(15).unwrap();
    let b = resumed.advance(15).unwrap();
    assert_eq!(
        serde_json::to_value(a).unwrap(),
        serde_json::to_value(b).unwrap()
    );
    assert_eq!(
        serde_json::to_value(&q.session).unwrap(),
        serde_json::to_value(&resumed).unwrap()
    );
    q.session.globals.singles.remove("0x54b330");
    let before = serde_json::to_value(&q.session).unwrap();
    assert!(q.session.advance(1).is_err());
    assert_eq!(serde_json::to_value(&q.session).unwrap(), before);
}
#[test]
fn assembled_initial_state_maps_double_operands_without_fabricating_reaction() {
    use rusttran::reaction_transfer::{ReactionTransferInputs, native_pi};
    let doc: Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../fresh_initialized_state_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 110);
    for case in cases {
        let mut state: rusttran::fresh_steam::FreshInitializedState =
            serde_json::from_value(case["expected"].clone()).unwrap();
        let inputs = ReactionTransferInputs::from_initialized(&state).unwrap();
        assert_eq!(inputs.node_fraction, 0.);
        assert_eq!(
            inputs.node_temperature.to_bits(),
            state.alternate.temperatures[1].to_bits()
        );
        assert_eq!(
            inputs.material_masses[1].to_bits(),
            state.alternate.doubles["0x54bd40"].to_bits()
        );
        for (i, a) in [(0, "0x54bd48"), (2, "0x54bd50"), (3, "0x54bd58")] {
            assert_eq!(
                inputs.material_masses[i].to_bits(),
                state.model_doubles[a].to_bits()
            );
        }
        assert_eq!(inputs.pi.to_bits(), native_pi().to_bits());
        for a in [0x54c000, 0x54bffc, 0x54c004] {
            assert!(state.globals.single(a).is_ok());
        }
        let before = serde_json::to_value(&state.globals).unwrap();
        assert!(
            !state
                .globals
                .advance_reaction_transfer(&inputs)
                .unwrap()
                .active
        );
        assert_eq!(before, serde_json::to_value(&state.globals).unwrap());
        state.model_doubles.remove("0x54bd48");
        assert!(ReactionTransferInputs::from_initialized(&state).is_err());
    }
    let f = fixtures();
    let case = f["cases"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| c["expected"]["transfer_active"] == true)
        .unwrap();
    let mut input = case["inputs"].clone();
    input["inputs"].as_object_mut().unwrap().remove("pi");
    let mut q: ReactionTransferRequest = serde_json::from_value(input).unwrap();
    compare(
        &serde_json::to_value(q.globals.advance_reaction_transfer(&q.inputs).unwrap()).unwrap(),
        &case["expected"],
        "native default pi",
    );
}

#[test]
fn connected_numerical_update_matches_native_slices_and_rolls_back_late_failure() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_primary_step_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    assert_eq!(d["cases"].as_array().unwrap().len(), 32);
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        // Explicit current SG derivatives must override stale caller-store values.
        for a in rusttran::recovered_step::STEAM_DERIVATIVES {
            q.globals.singles.insert(format!("0x{a:x}"), 99999.);
        }
        let initial = q.globals.clone();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        assert_eq!(
            serde_json::to_value(out.integers).unwrap(),
            c["expected"]["integers"]
        );
        for (n, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "case {i} {n}: {} vs {e}",
                out.singles[n]
            );
        }
        assert_eq!(
            out.relief_tail.g54bf9c.to_bits(),
            (c["expected"]["relief_tail"]["g54bf9c"].as_f64().unwrap() as f32).to_bits()
        );
        assert_eq!(
            i64::from(out.relief_tail.control_state),
            c["expected"]["relief_tail"]["control_state"]
                .as_i64()
                .unwrap()
        );
        assert_eq!(
            out.relief_tail.opened_event,
            c["expected"]["relief_tail"]["opened_event"]
                .as_bool()
                .unwrap()
        );
        q.globals = initial;
        q.globals.singles.remove("0x54bfa0");
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_recovered_primary_step(&q.controls)
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}

#[test]
fn consecutive_updates_preserve_native_histories_and_run_is_atomic() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_primary_run_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    assert_eq!(d["cases"].as_array().unwrap().len(), 8);
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredRunRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let initial = q.globals.clone();
        let steps = q.globals.advance_recovered_primary_run(&q.updates).unwrap();
        for (step, expected) in steps.iter().zip(c["expected"]["steps"].as_array().unwrap()) {
            assert_eq!(
                serde_json::to_value(&step.integers).unwrap(),
                expected["integers"]
            );
            for (n, e) in expected["singles"].as_object().unwrap() {
                assert!(
                    step.singles[n]
                        .to_bits()
                        .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                        <= 4,
                    "chain {i} {n}"
                );
            }
            assert_eq!(
                step.relief_tail.opened_event,
                expected["relief_tail"]["opened_event"].as_bool().unwrap()
            );
        }
        for (n, e) in c["expected"]["globals"]["singles"].as_object().unwrap() {
            assert!(
                q.globals.singles[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "chain {i} final {n}"
            );
        }
        q.globals = initial;
        q.updates[2].clock += 1.;
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(q.globals.advance_recovered_primary_run(&q.updates).is_err());
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}

#[test]
fn both_steam_exchanges_produce_current_derivatives_and_late_b_failure_is_atomic() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_exchange_step_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    assert_eq!(d["cases"].as_array().unwrap().len(), 32);
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let initial = q.globals.clone();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        assert_eq!(
            serde_json::to_value(out.integers).unwrap(),
            c["expected"]["integers"]
        );
        for (n, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "SG step {i} {n}: {} vs {e}",
                out.singles[n]
            );
        }
        q.globals = initial;
        q.globals.singles.remove("0x54b6cc");
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_recovered_primary_step(&q.controls)
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}

#[test]
fn numerical_update_requires_an_unambiguous_steam_producer() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_primary_step_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let mut q: rusttran::recovered_step::RecoveredStepRequest =
        serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    let before = serde_json::to_value(&q.globals).unwrap();
    q.controls.steam_phase_flags = Some([0, 0]);
    assert!(
        q.globals
            .advance_recovered_primary_step(&q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    q.controls.steam_phase_flags = None;
    q.controls.steam_derivatives = None;
    assert!(
        q.globals
            .advance_recovered_primary_step(&q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}

#[test]
fn successive_updates_recompute_both_steam_exchanges_from_evolving_state() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../recovered_exchange_run_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    assert_eq!(d["cases"].as_array().unwrap().len(), 4);
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredRunRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.globals.advance_recovered_primary_run(&q.updates).unwrap();
        for (step, e) in out.iter().zip(c["expected"]["steps"].as_array().unwrap()) {
            assert_eq!(serde_json::to_value(&step.integers).unwrap(), e["integers"]);
            for (n, v) in e["singles"].as_object().unwrap() {
                assert!(
                    step.singles[n]
                        .to_bits()
                        .abs_diff((v.as_f64().unwrap() as f32).to_bits())
                        <= 4,
                    "computed SG chain {i} {n}"
                );
            }
            assert_eq!(
                step.relief_tail.opened_event,
                e["relief_tail"]["opened_event"].as_bool().unwrap()
            );
        }
        for (n, v) in c["expected"]["globals"]["singles"].as_object().unwrap() {
            assert!(
                q.globals.singles[n]
                    .to_bits()
                    .abs_diff((v.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "computed SG chain {i} final {n}"
            );
        }
    }
}

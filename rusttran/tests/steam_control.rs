fn cases(name: &str) -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
            .unwrap(),
    )
    .unwrap()
}
#[test]
fn full_control_prefix_matches_native_timing_level_pressure_and_fault_branches() {
    let data = cases("steam_control");
    for (i, c) in data["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::steam_control::SteamControlRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q
            .globals
            .advance_steam_control(q.side, &q.controls)
            .unwrap();
        assert_eq!(
            out.fault_selected,
            c["expected"]["fault_selected"].as_bool().unwrap()
        );
        assert_eq!(out.singles.len(), 7);
        for (name, actual) in [("singles", out.singles), ("trace", out.trace)] {
            for (a, e) in c["expected"][name].as_object().unwrap() {
                assert!(
                    actual[a]
                        .to_bits()
                        .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                        <= 4,
                    "case {i} {name} {a}: {} vs {e}",
                    actual[a]
                );
            }
        }
    }
}
#[test]
fn bad_normal_control_denominator_cannot_commit_feedwater_or_history() {
    let data = cases("steam_control");
    let mut q: rusttran::steam_control::SteamControlRequest =
        serde_json::from_value(data["cases"][0]["inputs"].clone()).unwrap();
    q.globals.integers.insert("0x54b484".into(), 0);
    q.controls.fault_flag = 0;
    q.globals.singles.insert("0x54ba8c".into(), 0.9);
    q.globals.singles.insert("0x54b194".into(), 0.5);
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_steam_control(q.side, &q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}
#[test]
fn both_sg_controls_feed_exchange_and_stream_integration_and_rollback_together() {
    let data = cases("recovered_steam_control_step");
    for (i, c) in data["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        assert!(!q.globals.singles.contains_key("0x54ba90"));
        assert!(!q.globals.singles.contains_key("0x54ba94"));
        let initial = q.globals.clone();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
            c["expected"]["integers"]
        );
        assert_eq!(out.steam_controls.as_ref().unwrap().len(), 2);
        for (a, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[a]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "case {i} {a}"
            );
        }
        q.globals = initial.clone();
        q.globals.singles.remove("0x54bfa0");
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_recovered_primary_step(&q.controls)
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
        q.globals = initial;
        q.globals.singles.remove("0x54baa0");
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
fn controlled_pair_requires_native_sg_selectors_and_computed_exchange() {
    let data = cases("recovered_steam_control_step");
    let mut q: rusttran::recovered_step::RecoveredStepRequest =
        serde_json::from_value(data["cases"][0]["inputs"].clone()).unwrap();
    let before = serde_json::to_value(&q.globals).unwrap();
    q.controls.steam_phase_flags = Some([0, 0]);
    assert!(
        q.globals
            .advance_recovered_primary_step(&q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}

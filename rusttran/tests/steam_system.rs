fn cases(name: &str) -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
            .unwrap(),
    )
    .unwrap()
}
fn singles(
    actual: &std::collections::BTreeMap<String, f32>,
    expected: &serde_json::Value,
    context: &str,
) {
    assert_eq!(
        actual.len(),
        expected.as_object().unwrap().len(),
        "{context}"
    );
    for (a, e) in expected.as_object().unwrap() {
        assert!(
            actual[a]
                .to_bits()
                .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                <= 4,
            "{context} {a}: {} vs {e}",
            actual[a]
        );
    }
}
#[test]
fn auxiliary_matches_native_exact_activation_flags_and_weighted_commands() {
    let d = cases("steam_auxiliary");
    let mut active = 0;
    let mut skipped = 0;
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::steam_auxiliary::SteamAuxiliaryRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let before = serde_json::to_value(&q.globals).unwrap();
        let out = q
            .globals
            .advance_steam_auxiliary(q.side, q.auxiliary_percent)
            .unwrap();
        singles(&out.singles, &c["expected"]["singles"], &format!("aux {i}"));
        assert_eq!(out.active, c["expected"]["active"].as_bool().unwrap());
        if out.active {
            active += 1;
        } else {
            skipped += 1;
            assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
        }
    }
    assert!(active > 0 && skipped > 0);
}
#[test]
fn continuous_sg_native_body_matches_all_stages_and_total_outflow_on_both_paths() {
    let d = cases("steam_system");
    let mut skipped_floor = 0;
    let mut total_floor = 0;
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::steam_system::SteamSystemRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let is_a = matches!(q.side, rusttran::native_globals::LoopSide::A);
        let pressure = if is_a { "0x54b4fc" } else { "0x54b500" };
        let total = if is_a { "0x54b560" } else { "0x54b564" };
        let base = if is_a { "0x54b874" } else { "0x54b878" };
        let floor = q.globals.singles["0x54b544"] > q.globals.singles[pressure];
        let out = q.globals.advance_steam_system(q.side, &q.controls).unwrap();
        singles(
            &out.singles,
            &c["expected"]["singles"],
            &format!("body {i}"),
        );
        assert_eq!(
            out.fault_selected,
            c["expected"]["fault_selected"].as_bool().unwrap()
        );
        assert_eq!(
            out.auxiliary_active,
            c["expected"]["auxiliary_active"].as_bool().unwrap()
        );
        assert_eq!(
            serde_json::to_value(out.valve_controls).unwrap(),
            c["expected"]["valve_controls"]
        );
        if floor {
            if out.auxiliary_active {
                assert_eq!(out.singles[total], 0.);
                total_floor += 1;
            } else {
                assert_eq!(out.singles[total], 0.);
                skipped_floor += usize::from(out.singles[base] != 0.);
            }
        }
    }
    assert!(skipped_floor > 0 && total_floor > 0);
}
#[test]
fn late_auxiliary_and_saturated_errors_do_not_commit_earlier_controls() {
    let d = cases("steam_system");
    for missing in ["0x54b72c", "0x54b188"] {
        let mut q: rusttran::steam_system::SteamSystemRequest =
            serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
        q.globals.integers.insert("0x54b4d2".into(), 1);
        q.globals.singles.remove(missing);
        let before = serde_json::to_value(&q.globals).unwrap();
        let commands = serde_json::to_value(&q.controls).unwrap();
        assert!(q.globals.advance_steam_system(q.side, &q.controls).is_err());
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
        assert_eq!(commands, serde_json::to_value(&q.controls).unwrap());
    }
}
#[test]
fn complete_sg_stages_connect_to_primary_integration_with_atomic_rollback() {
    let d = cases("recovered_steam_system_step");
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let initial = q.globals.clone();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        singles(
            &out.singles,
            &c["expected"]["singles"],
            &format!("step {i}"),
        );
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
            c["expected"]["integers"]
        );
        let aux = out.steam_auxiliary.unwrap();
        assert_eq!(aux.len(), 2);
        for (j, a) in aux.iter().enumerate() {
            assert_eq!(
                a.active,
                c["expected"]["steam_auxiliary"][j]["active"]
                    .as_bool()
                    .unwrap()
            );
        }
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
fn auxiliary_stage_requires_the_original_valve_outflow_predecessor() {
    let d = cases("recovered_steam_system_step");
    let mut q: rusttran::recovered_step::RecoveredStepRequest =
        serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    q.controls.steam_valves = None;
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_recovered_primary_step(&q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}

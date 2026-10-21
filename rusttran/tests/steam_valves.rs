fn cases(name: &str) -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
            .unwrap(),
    )
    .unwrap()
}
#[test]
fn valve_decisions_fault_flow_and_inventory_limit_match_native() {
    let data = cases("steam_valves");
    let mut closed = 0;
    let mut safety_changed = 0;
    let mut limited = 0;
    for (i, c) in data["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::steam_valves::SteamValveRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let before = q.controls.clone();
        let old_heat = [q.globals.singles["0x54b67c"], q.globals.singles["0x54b680"]];
        let out = q.globals.advance_steam_valves(q.side, &q.controls).unwrap();
        assert_eq!(
            serde_json::to_value(&out.controls).unwrap(),
            c["expected"]["controls"],
            "case {i}"
        );
        assert_eq!(out.singles.len(), 6);
        for (a, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[a]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {a}: {} vs {e}",
                out.singles[a]
            );
        }
        closed += usize::from(
            before
                .main
                .iter()
                .zip(&out.controls.main)
                .any(|(a, b)| a.percent != b.percent),
        );
        safety_changed += usize::from(
            before
                .safety
                .iter()
                .zip(&out.controls.safety)
                .any(|(a, b)| a.percent != b.percent),
        );
        limited += usize::from(
            out.singles["0x54b67c"] != old_heat[0] || out.singles["0x54b680"] != old_heat[1],
        );
    }
    assert!(closed > 0 && safety_changed > 0);
    // The separate limiter oracle covers exact equality and signed flow cases.
    assert!(limited > 0);
}
#[test]
fn late_invalid_valve_state_does_not_commit_flow_or_commands() {
    let data = cases("steam_valves");
    let mut q: rusttran::steam_valves::SteamValveRequest =
        serde_json::from_value(data["cases"][0]["inputs"].clone()).unwrap();
    q.globals.singles.insert("0x54b2ac".into(), 0.);
    let before = serde_json::to_value(&q.globals).unwrap();
    let controls = serde_json::to_value(&q.controls).unwrap();
    assert!(q.globals.advance_steam_valves(q.side, &q.controls).is_err());
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    assert_eq!(controls, serde_json::to_value(&q.controls).unwrap());
}

#[test]
fn both_sg_valve_producers_feed_exchange_and_roll_back_with_integration() {
    let data = cases("recovered_steam_valve_step");
    for (i, c) in data["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        assert!(!q.globals.singles.contains_key("0x54b874"));
        assert!(!q.globals.singles.contains_key("0x54b878"));
        let initial = q.globals.clone();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
            c["expected"]["integers"]
        );
        for (a, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[a]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "case {i} {a}: {} vs {e}",
                out.singles[a]
            );
        }
        let stages = out.steam_valves.as_ref().unwrap();
        assert_eq!(stages.len(), 2);
        for (j, stage) in stages.iter().enumerate() {
            assert_eq!(
                serde_json::to_value(&stage.controls).unwrap(),
                c["expected"]["steam_valves"][j]["controls"]
            );
        }
        // B's inventory is needed only after A has changed the shared control
        // and flow state; final previous-derivative history is needed even later.
        for missing in ["0x54b4f8", "0x54bfa0"] {
            q.globals = initial.clone();
            q.globals.singles.remove(missing);
            let before = serde_json::to_value(&q.globals).unwrap();
            assert!(
                q.globals
                    .advance_recovered_primary_step(&q.controls)
                    .is_err()
            );
            assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
        }
    }
}
#[test]
fn valve_producer_rejects_explicit_sg_derivatives_without_mutating_state() {
    let data = cases("recovered_steam_valve_step");
    let mut q: rusttran::recovered_step::RecoveredStepRequest =
        serde_json::from_value(data["cases"][0]["inputs"].clone()).unwrap();
    q.controls.steam_controls = None;
    q.controls.steam_phase_flags = None;
    q.controls.steam_derivatives = Some([0.; 6]);
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .advance_recovered_primary_step(&q.controls)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
}

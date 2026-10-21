fn cases(name: &str) -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
            .unwrap(),
    )
    .unwrap()
}
#[test]
fn switching_timestamps_targets_and_flows_match_original() {
    let data = cases("rcp_control");
    for (i, c) in data["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::rcp_control::RcpControlRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.globals.advance_rcp_control(&q.controls).unwrap();
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
            c["expected"]["integers"]
        );
        assert_eq!(
            serde_json::to_value(out.pump_percent).unwrap(),
            c["expected"]["pump_percent"]
        );
        for (a, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[a]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "case {i} {a}"
            );
        }
        for (a, e) in out
            .normalized_flow
            .iter()
            .zip(c["expected"]["normalized_flow"].as_array().unwrap())
        {
            assert!(
                a.to_bits().abs_diff((e.as_f64().unwrap() as f32).to_bits()) <= 4,
                "case {i}"
            );
        }
        assert_eq!(
            f64::from(out.selected_time_constant_a),
            c["expected"]["selected_time_constant_a"].as_f64().unwrap()
        );
    }
}
#[test]
fn b_restart_keeps_native_diagonal_lookup_and_a_precedes_b_switch() {
    let data = cases("rcp_control");
    let mut q: rusttran::rcp_control::RcpControlRequest =
        serde_json::from_value(data["cases"][112]["inputs"].clone()).unwrap();
    let mut no_b_switch = q.clone();
    no_b_switch.controls.pump_percent[1] = 0;
    let baseline = no_b_switch
        .globals
        .advance_rcp_control(&no_b_switch.controls)
        .unwrap();
    let out = q.globals.advance_rcp_control(&q.controls).unwrap();
    assert_eq!(out.integers["0x54b4e2"], 0);
    assert_eq!(out.integers["0x54b4e4"], 1);
    assert_eq!(out.singles["0x54b83c"], -10.);
    assert_eq!(out.singles["0x54b840"], 100.);
    assert_eq!(out.singles["0x54b430"], 99999.);
    // Although B changes final A target, A's flow was already updated using 4.
    assert_eq!(baseline.singles["0x54b83c"], 4.);
    assert_eq!(baseline.integers["0x54b4e4"], 0);
    assert_eq!(baseline.singles["0x54b530"], out.singles["0x54b530"]);
}
#[test]
fn invalid_b_flow_or_running_flag_cannot_commit_a_transition() {
    let data = cases("rcp_control");
    for invalid in [0, 1] {
        let mut q: rusttran::rcp_control::RcpControlRequest =
            serde_json::from_value(data["cases"][135]["inputs"].clone()).unwrap();
        if invalid == 0 {
            q.globals.singles.insert("0x54b534".into(), f32::MAX);
        } else {
            q.globals.integers.insert("0x54b4e4".into(), 2);
        }
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(q.globals.advance_rcp_control(&q.controls).is_err());
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}
#[test]
fn rcp_producer_updates_sg_primary_and_integration_with_late_rollback() {
    let data = cases("recovered_rcp_step");
    for (i, c) in data["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let initial = q.globals.clone();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
            c["expected"]["integers"]
        );
        assert_eq!(
            serde_json::to_value(out.rcp.unwrap().pump_percent).unwrap(),
            c["expected"]["rcp"]["pump_percent"]
        );
        for (a, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[a]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "case {i} {a}"
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

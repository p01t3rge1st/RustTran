fn cases() -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../fresh_control_history_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap()
}
#[test]
fn fresh_histories_and_exact_minus_one_fault_branch_match_native() {
    let d = cases();
    for c in d["cases"].as_array().unwrap() {
        let mut q: rusttran::fresh_control_history::FreshControlHistoryRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q
            .globals
            .initialize_fresh_control_history(q.fault_flag)
            .unwrap();
        assert_eq!(out.len(), 11);
        for (a, e) in c["expected"].as_object().unwrap() {
            assert_eq!(out[a].to_bits(), (e.as_f64().unwrap() as f32).to_bits());
        }
    }
}
#[test]
fn fresh_history_failure_is_atomic_and_does_not_reset_integrator_history() {
    let d = cases();
    let mut q: rusttran::fresh_control_history::FreshControlHistoryRequest =
        serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    q.globals.singles.insert("0x54bb64".into(), 123.);
    q.globals.singles.remove("0x54b48c");
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(
        q.globals
            .initialize_fresh_control_history(q.fault_flag)
            .is_err()
    );
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    q.globals.singles.insert("0x54b48c".into(), 50.);
    q.globals
        .initialize_fresh_control_history(q.fault_flag)
        .unwrap();
    assert_eq!(q.globals.singles["0x54bb64"], 123.);
}

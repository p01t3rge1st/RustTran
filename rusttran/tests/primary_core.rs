#[test]
fn connected_primary_core_matches_one_original_machine_frame_and_rolls_back() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_core_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 160);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::primary_core::PrimaryCoreRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let initial = q.globals.clone();
        let a = q
            .globals
            .advance_primary_core(q.command_percent, q.fault_flag, q.pump_contributions)
            .unwrap();
        for (name, e) in c["expected"]["singles"].as_object().unwrap() {
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.singles[name].to_bits().abs_diff(e.to_bits()) <= 4,
                "case {i} {name}: {} != {e}",
                a.singles[name]
            );
        }
        assert_eq!(
            serde_json::to_value(a.integers).unwrap(),
            c["expected"]["integers"]
        );
        q.globals = initial;
        q.globals.singles.remove("0x54b6dc");
        let before = serde_json::to_value(&q.globals).unwrap();
        let error = q
            .globals
            .advance_primary_core(q.command_percent, q.fault_flag, q.pump_contributions)
            .unwrap_err();
        assert!(error.to_string().contains("0x54b6dc"));
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}

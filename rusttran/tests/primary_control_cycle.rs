#[test]
fn primary_cycle_matches_original_pressure_core_and_feedback_order() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../primary_control_cycle_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::primary_core::PrimaryCoreRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let initial = q.globals.clone();
        let out = q
            .globals
            .advance_primary_control_cycle(
                q.command_percent,
                q.fault_flag,
                q.pump_contributions,
                q.heater_controls.as_ref().unwrap(),
                q.spray_controls.as_ref().unwrap(),
            )
            .unwrap();
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
            serde_json::to_value(out.integers).unwrap(),
            c["expected"]["integers"]
        );
        q.globals = initial;
        q.globals.singles.remove("0x54b160");
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_primary_control_cycle(
                    q.command_percent,
                    q.fault_flag,
                    q.pump_contributions,
                    q.heater_controls.as_ref().unwrap(),
                    q.spray_controls.as_ref().unwrap()
                )
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}

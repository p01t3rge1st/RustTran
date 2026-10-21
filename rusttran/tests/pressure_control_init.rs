#[test]
fn fresh_pressure_reference_and_level_interlock_match_original_stores() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../pressure_control_init_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 300);
    for c in doc["cases"].as_array().unwrap() {
        let q: rusttran::initialization::PressureControlInitInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.initialize().unwrap();
        assert_eq!(
            out.pressure_reference.to_bits(),
            (c["expected"]["pressure_reference"].as_f64().unwrap() as f32).to_bits()
        );
        assert_eq!(
            out.spray_level_percent.to_bits(),
            (c["expected"]["spray_level_percent"].as_f64().unwrap() as f32).to_bits()
        );
        let mut g = rusttran::native_globals::NativeGlobals::default();
        g.singles.insert("0x54b124".into(), q.nominal_pressure);
        g.singles.insert("0x54b4a0".into(), q.liquid_level);
        g.singles.insert("0x54b494".into(), q.nominal_pressure);
        g.initialize_pressure_control().unwrap();
        assert_eq!(g.prepare_pressure_control_signal().unwrap().signal, 0.);
    }
}
#[test]
fn fresh_pressure_control_initialization_does_not_commit_on_overflow() {
    let mut g = rusttran::native_globals::NativeGlobals::default();
    g.singles.insert("0x54b124".into(), 2000.);
    g.singles.insert("0x54b4a0".into(), f32::MAX);
    let before = serde_json::to_value(&g).unwrap();
    assert!(g.initialize_pressure_control().is_err());
    assert_eq!(before, serde_json::to_value(&g).unwrap());
}

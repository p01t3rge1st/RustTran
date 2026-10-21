#[test]
fn process_birth_storage_matches_original_loader_image_and_cannot_clobber_history() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../process_storage_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let mut g = rusttran::native_globals::NativeGlobals::default();
    let out = g.initialize_new_process_storage().unwrap();
    assert_eq!(out.len(), 18);
    for (n, e) in d["cases"][0]["expected"].as_object().unwrap() {
        assert_eq!(out[n].to_bits(), (e.as_f64().unwrap() as f32).to_bits());
    }
    g.singles.insert("0x54bb64".into(), 123.);
    let before = serde_json::to_value(&g).unwrap();
    assert!(g.initialize_new_process_storage().is_err());
    assert_eq!(before, serde_json::to_value(&g).unwrap());
}
#[test]
fn explicit_process_storage_and_condition_alias_supply_fourteen_integrator_values() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    let m = rusttran::bindings::NativeSeed::model(&db, "1").unwrap();
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../integration_seed_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for case in d["cases"].as_array().unwrap() {
        let c =
            rusttran::bindings::NativeSeed::condition(&db, case["ic"].as_str().unwrap()).unwrap();
        let mut g = rusttran::native_globals::NativeGlobals::from_seeds(&m, &c).unwrap();
        g.initialize_new_process_storage().unwrap();
        g.initialize_integrator_alias().unwrap();
        for (i, b) in rusttran::integration::BINDINGS.iter().enumerate() {
            let expected = if i >= 12 {
                0.
            } else {
                case["expected_values"][i].as_f64().unwrap() as f32
            };
            assert_eq!(g.single(b.state).unwrap().to_bits(), expected.to_bits());
            assert_eq!(g.single(b.previous).unwrap().to_bits(), 0_f32.to_bits());
        }
    }
}

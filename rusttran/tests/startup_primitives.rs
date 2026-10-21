#[test]
fn native_startup_constants_and_geometry_match_original_scalar_stores() {
    for name in ["startup_constants", "startup_geometry"] {
        let d: serde_json::Value = serde_json::from_slice(
            &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
                .unwrap(),
        )
        .unwrap();
        for c in d["cases"].as_array().unwrap() {
            let mut g = rusttran::native_globals::NativeGlobals::default();
            if let Some(values) = c["inputs"]["extra_singles"].as_object() {
                for (a, v) in values {
                    g.singles.insert(a.clone(), v.as_f64().unwrap() as f32);
                }
            }
            if name == "startup_constants" {
                let out = g.initialize_startup_constants();
                for (a, e) in c["expected"]["singles"].as_object().unwrap() {
                    assert_eq!(
                        out.singles[a].to_bits(),
                        (e.as_f64().unwrap() as f32).to_bits(),
                        "{a}"
                    );
                }
                assert_eq!(
                    serde_json::to_value(out.integers).unwrap(),
                    c["expected"]["integers"]
                );
            } else {
                let out = g.initialize_startup_geometry().unwrap();
                for (a, e) in c["expected"].as_object().unwrap() {
                    assert_eq!(
                        out[a].to_bits(),
                        (e.as_f64().unwrap() as f32).to_bits(),
                        "{a}"
                    );
                }
            }
        }
    }
}
#[test]
fn geometry_missing_or_overflowing_operand_cannot_partially_reset_state() {
    let mut g = rusttran::native_globals::NativeGlobals::default();
    g.singles.extend([
        ("0x54b470".into(), 100.),
        ("0x54b46c".into(), 1.),
        ("0x54b220".into(), f32::MAX),
        ("0x54b1bc".into(), f32::MAX),
        ("0x54b74c".into(), 42.),
    ]);
    let before = serde_json::to_value(&g).unwrap();
    assert!(g.initialize_startup_geometry().is_err());
    assert_eq!(before, serde_json::to_value(&g).unwrap());
}

#[test]
fn startup_clock_uses_original_floor_conversion_and_rejects_overflow_atomically() {
    let fixture: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../startup_clock_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let mut g = rusttran::native_globals::NativeGlobals::default();
    for c in fixture["cases"].as_array().unwrap() {
        g.singles.insert(
            "0x54b414".into(),
            c["inputs"]["extra_singles"]["0x54b414"].as_f64().unwrap() as f32,
        );
        let out = g.initialize_startup_clock().unwrap();
        assert_eq!(serde_json::to_value(out).unwrap(), c["expected"]);
    }
    let old = g.integers.clone();
    g.singles.insert("0x54b414".into(), 100.);
    assert!(g.initialize_startup_clock().is_err());
    assert_eq!(g.integers, old);
}

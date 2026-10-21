fn cases() -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../late_thermal_init_fixtures.json"))
            .unwrap(),
    )
    .unwrap()
}
#[test]
fn late_thermal_numeric_stores_match_original_slices() {
    let d = cases();
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::late_thermal_init::LateThermalRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.globals.initialize_late_thermal().unwrap();
        assert_eq!(out.singles.len(), 28);
        assert_eq!(
            serde_json::to_value(out.integers).unwrap(),
            c["expected"]["integers"]
        );
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
    }
}
#[test]
fn late_invalid_inputs_cannot_commit_resets_alias_or_reference_values() {
    let d = cases();
    for missing in ["0x54b464", "0x54b160", "0x54b4f0"] {
        let mut q: rusttran::late_thermal_init::LateThermalRequest =
            serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
        q.globals.singles.remove(missing);
        q.globals.singles.insert("0x54b9f8".into(), 77.);
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(q.globals.initialize_late_thermal().is_err());
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}
#[test]
fn numeric_initializer_preserves_unrelated_integrator_and_event_histories() {
    let d = cases();
    let mut q: rusttran::late_thermal_init::LateThermalRequest =
        serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    for (a, v) in [("0x54bb64", 12.), ("0x54bbb0", 34.), ("0x54c068", 56.)] {
        q.globals.singles.insert(a.into(), v);
    }
    q.globals.initialize_late_thermal().unwrap();
    assert_eq!(q.globals.singles["0x54bb64"], 12.);
    assert_eq!(q.globals.singles["0x54bbb0"], 34.);
    assert_eq!(q.globals.singles["0x54c068"], 56.);
}

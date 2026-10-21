#[test]
fn normal_primary_phase_branch_and_shared_commits_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../normal_primary_phase_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 300);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::normal_primary_phase::NormalPrimaryPhaseInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = serde_json::to_value(q.calculate().unwrap()).unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            if name == "trace" {
                for (field, e) in e.as_object().unwrap() {
                    assert!(
                        (a[name][field].as_f64().unwrap() as f32)
                            .to_bits()
                            .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                            <= 2,
                        "case {i} {field}"
                    );
                }
            } else {
                assert!(
                    (a[name].as_f64().unwrap() as f32)
                        .to_bits()
                        .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                        <= 2,
                    "case {i} {name}"
                );
            }
        }
        let mut g = rusttran::native_globals::NativeGlobals::default();
        for (name, v) in c["inputs"].as_object().unwrap() {
            if let Some(address) = name.strip_prefix('g') {
                if ["54b4d6", "54b4d8"].contains(&address) {
                    g.integers
                        .insert(format!("0x{address}"), v.as_i64().unwrap() as i32);
                } else {
                    g.singles
                        .insert(format!("0x{address}"), v.as_f64().unwrap() as f32);
                }
            }
        }
        let linked = g
            .prepare_normal_primary_phase(q.local_20, q.local_54, q.local_b0)
            .unwrap();
        assert_eq!(a, serde_json::to_value(linked).unwrap());
        g.integers.insert("0x54b4d6".into(), 1);
        let before = serde_json::to_value(&g).unwrap();
        assert!(
            g.prepare_normal_primary_phase(q.local_20, q.local_54, q.local_b0)
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(g).unwrap());
    }
}

#[test]
fn native_store_integrator_matches_original_coordinator_and_rejects_missing_history() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../native_integration_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 36);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::integration::NativeIntegrationRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let original = q.globals.clone();
        let out = q
            .globals
            .advance_native_integration(q.activation_time)
            .unwrap();
        for (n, e) in c["expected"]["singles"].as_object().unwrap() {
            assert_eq!(
                out.singles[n].to_bits(),
                (e.as_f64().unwrap() as f32).to_bits(),
                "case {i} {n}"
            );
        }
        q.globals = original;
        q.globals.singles.remove("0x54bfa0");
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_native_integration(q.activation_time)
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}

#[test]
fn shared_stream_derivative_bindings_match_original_and_rollback_with_late_integration_failure() {
    use rusttran::{native_globals::NativeGlobals, stages::RecoveredStage};
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../additional_balance_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for c in doc["cases"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|c| c["kind"] == "stream")
    {
        let mut g = NativeGlobals::default();
        for (n, v) in c["inputs"].as_object().unwrap() {
            g.singles
                .insert(format!("0x{}", &n[1..]), v.as_f64().unwrap() as f32);
        }
        let before = serde_json::to_value(&g).unwrap();
        assert!(
            g.advance_stages(&[
                RecoveredStage::StreamBalance,
                RecoveredStage::NativeIntegration {
                    activation_time: 0.
                }
            ])
            .is_err()
        );
        assert_eq!(before, serde_json::to_value(&g).unwrap());
        g.prepare_stream_balance().unwrap();
        for (n, e) in c["expected"].as_object().unwrap() {
            assert_eq!(
                g.singles[&format!("0x{}", &n[1..])].to_bits(),
                (e.as_f64().unwrap() as f32).to_bits()
            );
        }
    }
}

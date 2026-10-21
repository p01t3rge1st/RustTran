#[test]
fn source_gate_and_phase_fluxes_match_original() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_sources_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(d["cases"].as_array().unwrap().len(), 300);
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::primary_sources::PrimarySourcesInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.calculate().unwrap();
        for (n, e) in c["expected"].as_object().unwrap() {
            assert!(
                out[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {n}"
            );
        }
    }
}
#[test]
fn source_relief_binding_and_late_failure_rollback_match_original_slices() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_relief_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut q: rusttran::primary_sources::PrimaryReliefRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let initial = q.globals.clone();
        let out = q.globals.advance_primary_relief(&q.valves).unwrap();
        assert_eq!(
            serde_json::to_value(out.integers).unwrap(),
            c["expected"]["integers"]
        );
        for (n, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[n]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {n}"
            );
        }
        q.globals = initial;
        q.globals.singles.remove("0x54b6ac");
        let before = serde_json::to_value(&q.globals).unwrap();
        assert!(q.globals.advance_primary_relief(&q.valves).is_err());
        assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    }
}

#[test]
fn post_relief_native_boundary_decisions_and_flow_copy_match_original() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../relief_tail_fixtures.json")).unwrap(),
    )
    .unwrap();
    for c in d["cases"].as_array().unwrap() {
        let q: rusttran::relief::ReliefTailInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.calculate().unwrap();
        assert_eq!(
            out.g54bf9c.to_bits(),
            (c["expected"]["g54bf9c"].as_f64().unwrap() as f32).to_bits()
        );
        assert_eq!(
            i64::from(out.control_state),
            c["expected"]["control_state"].as_i64().unwrap()
        );
        assert_eq!(
            out.opened_event,
            c["expected"]["opened_event"].as_bool().unwrap()
        );
    }
}

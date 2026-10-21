fn cases(name: &str) -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
            .unwrap(),
    )
    .unwrap()
}
fn exact_singles(actual: &std::collections::BTreeMap<String, f32>, expected: &serde_json::Value) {
    assert_eq!(actual.len(), expected.as_object().unwrap().len());
    for (a, e) in expected.as_object().unwrap() {
        assert_eq!(
            actual[a].to_bits(),
            (e.as_f64().unwrap() as f32).to_bits(),
            "{a}"
        );
    }
}
fn events(actual: &rusttran::restored_controls::EventSchedule, expected: &serde_json::Value) {
    let e: rusttran::restored_controls::EventSchedule =
        serde_json::from_value(expected.clone()).unwrap();
    assert_eq!(actual.flags, e.flags);
    for i in 0..20 {
        assert_eq!(actual.times[i].to_bits(), e.times[i].to_bits(), "event {i}");
        assert_eq!(actual.delays[i].to_bits(), e.delays[i].to_bits());
    }
}
#[test]
fn restored_controls_and_all_twenty_event_times_match_original_branch() {
    let d = cases("restored_controls");
    for c in d["cases"].as_array().unwrap() {
        let mut q: rusttran::restored_controls::RestoredControlRequest =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let out = q.globals.initialize_restored_controls(&q.events).unwrap();
        exact_singles(&out.singles, &c["expected"]["singles"]);
        events(&out.events, &c["expected"]["events"]);
    }
}
#[test]
fn restoration_preserves_saved_boron_sg_errors_and_integrator_history() {
    let d = cases("restored_controls");
    let mut q: rusttran::restored_controls::RestoredControlRequest =
        serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    let saved = [
        ("0x54c068", 123.),
        ("0x54baa4", 0.25),
        ("0x54baa8", -0.5),
        ("0x54b6f8", 17.),
        ("0x54bb64", 42.),
    ];
    for (a, v) in saved {
        q.globals.singles.insert(a.into(), v);
    }
    q.globals.initialize_restored_controls(&q.events).unwrap();
    for (a, v) in saved {
        assert_eq!(q.globals.singles[a], v);
    }
}
#[test]
fn late_missing_state_or_event_overflow_cannot_commit_restoration() {
    let d = cases("restored_controls");
    let mut q: rusttran::restored_controls::RestoredControlRequest =
        serde_json::from_value(d["cases"][0]["inputs"].clone()).unwrap();
    q.globals.singles.remove("0x54b48c");
    let before = serde_json::to_value(&q.globals).unwrap();
    let times = q.events.times;
    assert!(q.globals.initialize_restored_controls(&q.events).is_err());
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    assert_eq!(times, q.events.times);
    q.globals.singles.insert("0x54b48c".into(), 50.);
    q.globals.singles.insert("0x54b418".into(), f32::MAX);
    q.globals.integers.insert("0x54b080".into(), 0);
    q.events.flags[19] = 1;
    q.events.delays[19] = -f32::MAX;
    let before = serde_json::to_value(&q.globals).unwrap();
    assert!(q.globals.initialize_restored_controls(&q.events).is_err());
    assert_eq!(before, serde_json::to_value(&q.globals).unwrap());
    assert_eq!(times, q.events.times);
}
#[test]
fn native_rebased_events_bind_rcp_sg_and_integration_and_fail_atomically() {
    let d = cases("recovered_restored_event_step");
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut restore: rusttran::restored_controls::RestoredControlRequest =
            serde_json::from_value(c["restore_inputs"].clone()).unwrap();
        let out = restore
            .globals
            .initialize_restored_controls(&restore.events)
            .unwrap();
        exact_singles(&out.singles, &c["restoration"]["singles"]);
        events(&out.events, &c["restoration"]["events"]);
        let mut controls: rusttran::recovered_step::RecoveredStepControls =
            serde_json::from_value(c["inputs"]["controls"].clone()).unwrap();
        controls.event_schedule = Some(Box::new(out.events));
        let initial = restore.globals.clone();
        let result = restore
            .globals
            .advance_recovered_primary_step(&controls)
            .unwrap();
        let bound = result.event_bindings.as_ref().unwrap();
        let expected = &c["expected"]["event_bindings"];
        assert_eq!(
            bound.rcp_trip_time.to_bits(),
            (expected["rcp_trip_time"].as_f64().unwrap() as f32).to_bits()
        );
        assert_eq!(
            bound.steam_failure_time.to_bits(),
            (expected["steam_failure_time"].as_f64().unwrap() as f32).to_bits()
        );
        assert_eq!(
            i64::from(bound.steam_fault_flag),
            expected["steam_fault_flag"].as_i64().unwrap()
        );
        assert_eq!(
            serde_json::to_value(bound.steam_valve_fault_flags).unwrap(),
            expected["steam_valve_fault_flags"]
        );
        assert_eq!(
            serde_json::to_value(&result.integers).unwrap(),
            c["expected"]["integers"]
        );
        for (a, e) in c["expected"]["singles"].as_object().unwrap() {
            assert!(
                result.singles[a]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "case {i} {a}"
            );
        }
        restore.globals = initial.clone();
        restore.globals.singles.remove("0x54bfa0");
        let before = serde_json::to_value(&restore.globals).unwrap();
        assert!(
            restore
                .globals
                .advance_recovered_primary_step(&controls)
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(&restore.globals).unwrap());
        restore.globals = initial;
        controls.event_schedule.as_mut().unwrap().times[19] = f32::NAN;
        let before = serde_json::to_value(&restore.globals).unwrap();
        assert!(
            restore
                .globals
                .advance_recovered_primary_step(&controls)
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(&restore.globals).unwrap());
    }
}

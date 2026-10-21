use rusttran::{native_globals::NativeGlobals, primary_devices::PrimaryDevicesRequest};
fn cases(name: &str) -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
            .unwrap(),
    )
    .unwrap()
}
#[test]
fn device_decisions_and_numeric_flow_match_original_and_errors_do_not_commit() {
    let d = cases("primary_devices");
    for case in d["cases"].as_array().unwrap() {
        let mut q: PrimaryDevicesRequest = serde_json::from_value(case["inputs"].clone()).unwrap();
        let before = q.globals.clone();
        let out = q
            .globals
            .advance_primary_devices(&q.controls, &q.curve)
            .unwrap();
        let actual = serde_json::to_value(&out).unwrap();
        for key in ["integers", "controls", "events"] {
            assert_eq!(actual[key], case["expected"][key]);
        }
        for (key, v) in case["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[key]
                    .to_bits()
                    .abs_diff((v.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "{key}"
            );
        }
        assert!(
            out.controller_output.to_bits().abs_diff(
                (case["expected"]["controller_output"].as_f64().unwrap() as f32).to_bits()
            ) <= 2
        );
        // Failure in the final curve must not commit earlier command/flow/latch changes.
        q.globals = before;
        q.curve.flow[6] = f32::NAN;
        let state = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_primary_devices(&q.controls, &q.curve)
                .is_err()
        );
        assert_eq!(state, serde_json::to_value(&q.globals).unwrap());
    }
}
#[test]
fn automatic_references_match_original_and_zero_span_rolls_back() {
    let d = cases("primary_references");
    for case in d["cases"].as_array().unwrap() {
        let mut g: NativeGlobals = serde_json::from_value(
            serde_json::json!({"singles":case["inputs"]["extra_singles"],"integers":{}}),
        )
        .unwrap();
        let c = serde_json::from_value(case["inputs"]["stages"][0]["controls"].clone()).unwrap();
        let out = g.prepare_primary_references(&c).unwrap();
        for (key, v) in case["expected"].as_object().unwrap() {
            assert!(
                out[key]
                    .to_bits()
                    .abs_diff((v.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "{key}"
            );
        }
        g.singles.insert("0x54b850".into(), 0.);
        let state = serde_json::to_value(&g).unwrap();
        let c = rusttran::primary_references::ReferenceControls {
            temperature_automatic: true,
            level_automatic: true,
        };
        assert!(g.prepare_primary_references(&c).is_err());
        assert_eq!(state, serde_json::to_value(&g).unwrap());
    }
}
#[test]
fn device_sources_feed_whole_recovered_pipeline_with_atomic_late_failure() {
    let d = cases("recovered_devices_step");
    for case in d["cases"].as_array().unwrap() {
        let mut q: rusttran::recovered_step::RecoveredStepRequest =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        assert!(!q.globals.singles.contains_key("0x54ba1c"));
        assert!(!q.globals.singles.contains_key("0x54ba28"));
        let before = q.globals.clone();
        let out = q
            .globals
            .advance_recovered_primary_step(&q.controls)
            .unwrap();
        assert_eq!(
            serde_json::to_value(&out.integers).unwrap(),
            case["expected"]["integers"]
        );
        assert_eq!(
            serde_json::to_value(&out.primary_devices.as_ref().unwrap().controls).unwrap(),
            case["expected"]["primary_devices"]["controls"]
        );
        for (key, v) in case["expected"]["singles"].as_object().unwrap() {
            assert!(
                out.singles[key]
                    .to_bits()
                    .abs_diff((v.as_f64().unwrap() as f32).to_bits())
                    <= 4,
                "{key}"
            );
        }
        q.globals = before;
        q.globals.singles.remove("0x54bfa0");
        let state = serde_json::to_value(&q.globals).unwrap();
        assert!(
            q.globals
                .advance_recovered_primary_step(&q.controls)
                .is_err()
        );
        assert_eq!(state, serde_json::to_value(&q.globals).unwrap());
    }
}

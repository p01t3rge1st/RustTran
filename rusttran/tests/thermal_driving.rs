use rusttran::{native_globals::NativeGlobals, thermal_driving::ThermalDrivingInputs};
#[test]
fn normal_thermal_driving_matches_original_signed_and_boundary_cases() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../thermal_driving_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 320);
    for (i, case) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let input: ThermalDrivingInputs = serde_json::from_value(case["inputs"].clone()).unwrap();
        let values = input.calculate().unwrap();
        for (name, e) in case["expected"].as_object().unwrap() {
            let a = values[name];
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {i} {name}: {a} != {e}"
            );
        }
    }
}
#[test]
fn normal_loops_from_all_model_ic_pairs_and_failure_atomicity() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../loop_reference_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for case in doc["cases"].as_array().unwrap() {
        let model =
            rusttran::bindings::NativeSeed::model(&db, case["model"].as_str().unwrap()).unwrap();
        let ic =
            rusttran::bindings::NativeSeed::condition(&db, case["ic"].as_str().unwrap()).unwrap();
        let mut g = NativeGlobals::from_seeds(&model, &ic).unwrap();
        g.initialize_loop_reference().unwrap();
        g.initialize_thermal_driving().unwrap();
        g.advance_normal_loops(0., [300., 300.]).unwrap();
        assert!(g.single(0x54ba68).unwrap().is_finite());
        g.singles.remove("0x54b534");
        let before = serde_json::to_value(&g).unwrap();
        assert!(g.advance_normal_loops(1., [300., 300.]).is_err());
        assert_eq!(before, serde_json::to_value(&g).unwrap());
    }
}
#[test]
fn composed_normal_loops_match_independent_original_slices() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../normal_loops_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 330);
    for (i, case) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q = &case["inputs"];
        let model =
            rusttran::bindings::NativeSeed::model(&db, q["model"].as_str().unwrap()).unwrap();
        let ic = rusttran::bindings::NativeSeed::condition(&db, q["ic"].as_str().unwrap()).unwrap();
        let mut g = NativeGlobals::from_seeds(&model, &ic).unwrap();
        g.initialize_loop_reference().unwrap();
        let coefficient = g.initialize_thermal_driving().unwrap();
        assert!(
            coefficient
                .to_bits()
                .abs_diff((case["coefficient"].as_f64().unwrap() as f32).to_bits())
                <= 2
        );
        let actual = g
            .advance_normal_loops(q["clock"].as_f64().unwrap() as f32, [150., 300.])
            .unwrap();
        let actual = serde_json::to_value(actual).unwrap();
        for side in 0..2 {
            for (name, e) in case["expected"][side].as_object().unwrap() {
                if name == "trace" {
                    for (field, e) in e.as_object().unwrap() {
                        let a = actual[side][name][field].as_f64().unwrap() as f32;
                        assert!(
                            a.to_bits().abs_diff((e.as_f64().unwrap() as f32).to_bits()) <= 2,
                            "case {i} loop {side} trace {field}"
                        );
                    }
                } else {
                    let a = actual[side][name].as_f64().unwrap() as f32;
                    assert!(
                        a.to_bits().abs_diff((e.as_f64().unwrap() as f32).to_bits()) <= 4,
                        "case {i} loop {side} {name}"
                    );
                }
            }
        }
    }
}

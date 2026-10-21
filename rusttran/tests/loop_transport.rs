fn compare(actual: &serde_json::Value, expected: &serde_json::Value, path: &str) {
    match expected {
        serde_json::Value::Object(fields) => {
            assert_eq!(actual.as_object().unwrap().len(), fields.len(), "{path}");
            for (k, v) in fields {
                compare(&actual[k], v, &format!("{path}.{k}"));
            }
        }
        serde_json::Value::Array(values) => {
            assert_eq!(actual.as_array().unwrap().len(), values.len(), "{path}");
            for (i, v) in values.iter().enumerate() {
                compare(&actual[i], v, &format!("{path}[{i}]"));
            }
        }
        serde_json::Value::Number(n) if n.is_f64() => {
            let a = actual.as_f64().unwrap() as f32;
            let e = n.as_f64().unwrap() as f32;
            let order = |x: f32| {
                if x.is_sign_negative() {
                    !x.to_bits()
                } else {
                    x.to_bits() | 0x80000000
                }
            };
            let tolerance = if path.contains(".trace.") { 2 } else { 4 };
            assert!(
                order(a).abs_diff(order(e)) <= tolerance,
                "{path}: {a} != {e}"
            );
        }
        _ => assert_eq!(actual, expected, "{path}"),
    }
}
#[test]
fn full_native_thermal_transport_histories_and_reverse_flows_match() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../loop_transport_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (i, c) in d["cases"].as_array().unwrap().iter().enumerate() {
        let mut g = rusttran::native_globals::NativeGlobals::default();
        for (a, v) in c["inputs"]["extra_singles"].as_object().unwrap() {
            g.singles.insert(a.clone(), v.as_f64().unwrap() as f32);
        }
        let out = g.advance_loop_transport().unwrap();
        compare(
            &serde_json::to_value(out).unwrap(),
            &c["expected"],
            &format!("transport {i}"),
        );
    }
}
#[test]
fn missing_history_or_zero_flow_cannot_partially_commit_feedback() {
    let d: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../loop_transport_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let mut g = rusttran::native_globals::NativeGlobals::default();
    for (a, v) in d["cases"][0]["inputs"]["extra_singles"]
        .as_object()
        .unwrap()
    {
        g.singles.insert(a.clone(), v.as_f64().unwrap() as f32);
    }
    g.singles.insert("0x54b40c".into(), 300.);
    g.singles.remove("0x54bac0");
    let before = serde_json::to_value(&g).unwrap();
    assert!(g.advance_loop_transport().is_err());
    assert_eq!(before, serde_json::to_value(&g).unwrap());
    g.singles.insert("0x54b530".into(), 0.);
    let before = serde_json::to_value(&g).unwrap();
    assert!(g.advance_loop_transport().is_err());
    assert_eq!(before, serde_json::to_value(&g).unwrap());
}

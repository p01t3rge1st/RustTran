#[test]
fn upstream_primary_heat_and_property_slope_match_original_prefix() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_exchange_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 300);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::primary_exchange::PrimaryExchangeInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = serde_json::to_value(q.calculate().unwrap()).unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            if name == "trace" {
                for (field, e) in e.as_object().unwrap() {
                    let a = a[name][field].as_f64().unwrap() as f32;
                    let e = e.as_f64().unwrap() as f32;
                    assert!(
                        a.to_bits().abs_diff(e.to_bits()) <= 2,
                        "case {i} trace {field}: {a} != {e}"
                    );
                }
            } else {
                let a = a[name].as_f64().unwrap() as f32;
                let e = e.as_f64().unwrap() as f32;
                assert!(
                    a.to_bits().abs_diff(e.to_bits()) <= 4,
                    "case {i} {name}: {a} != {e}"
                );
            }
        }
    }
}

#[test]
fn primary_properties_and_pressure_slopes_match_original_prefix() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_properties_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 240);
    for (index, case) in cases.iter().enumerate() {
        let input: rusttran::primary_properties::PrimaryPropertiesInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let actual = input.calculate().unwrap();
        for (name, e) in case["expected"].as_object().unwrap() {
            let a = actual[name];
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {index} {name}: {a} != {e}"
            );
        }
    }
}
#[test]
fn failing_pressure_preparation_leaves_global_store_intact() {
    let mut globals = rusttran::native_globals::NativeGlobals::default();
    globals.singles.insert("0x54b494".into(), 0.);
    globals.singles.insert("0x54b724".into(), 123.);
    let before = serde_json::to_value(&globals).unwrap();
    assert!(globals.prepare_primary_properties().is_err());
    assert_eq!(serde_json::to_value(globals).unwrap(), before);
}
#[test]
fn primary_liquid_properties_match_original_both_enthalpy_branches() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_liquid_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 200);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::primary_properties::PrimaryLiquidInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = q.calculate().unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            assert!(
                a[name]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {name}"
            );
        }
    }
}
#[test]
fn primary_heat_capacity_matches_original_variant_arithmetic_and_enthalpy_types() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(
            rusttran::default_data_root().join("../primary_heat_capacity_fixtures.json"),
        )
        .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 240);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::primary_properties::PrimaryHeatCapacityInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = q.calculate().unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            assert!(
                a[name]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2,
                "case {i} {name}: {} != {e}",
                a[name]
            );
        }
    }
}
#[test]
fn original_primary_volume_coefficient_initializer_bits_are_preserved() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_volume_coefficient.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(
        u64::from(rusttran::bindings::NATIVE_G54B70C.to_bits()),
        doc["bits"].as_u64().unwrap()
    );
}

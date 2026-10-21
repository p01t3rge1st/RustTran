#[test]
fn primary_inventory_and_missing_balance_coefficients_match_original() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../primary_inventory_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    assert_eq!(doc["cases"].as_array().unwrap().len(), 300);
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let q: rusttran::primary_inventory::PrimaryInventoryInputs =
            serde_json::from_value(c["inputs"].clone()).unwrap();
        let a = serde_json::to_value(q.advance().unwrap()).unwrap();
        let mut globals = rusttran::native_globals::NativeGlobals::default();
        for (name, v) in c["inputs"].as_object().unwrap() {
            if let Some(address) = name.strip_prefix('g') {
                globals
                    .singles
                    .insert(format!("0x{address}"), v.as_f64().unwrap() as f32);
            }
        }
        let linked = globals
            .prepare_primary_inventory(q.command_percent, q.local_84)
            .unwrap();
        assert_eq!(globals.single(0x54bb38).unwrap(), linked.g54bb38);
        assert_eq!(serde_json::to_value(linked).unwrap(), a);
        globals.singles.remove("0x54b730");
        let before = serde_json::to_value(&globals).unwrap();
        assert!(
            globals
                .prepare_primary_inventory(q.command_percent, q.local_84)
                .is_err()
        );
        assert_eq!(before, serde_json::to_value(globals).unwrap());

        for (name, e) in c["expected"].as_object().unwrap() {
            let a = a[name].as_f64().unwrap() as f32;
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "case {i} {name}: {a} != {e}"
            );
        }
    }
}

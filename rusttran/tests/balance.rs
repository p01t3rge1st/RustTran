use rusttran::balance::BalanceInputs;
#[test]
fn derivatives_match_original_native_balance_tail() {
    let path = rusttran::default_data_root().join("../balance_fixtures.json");
    let document: serde_json::Value =
        serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = document["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 100);
    for (index, case) in cases.iter().enumerate() {
        let inputs: BalanceInputs = serde_json::from_value(case["inputs"].clone()).unwrap();
        let outputs = inputs.derivatives().unwrap();
        for (name, actual) in [("g54b770", outputs.g54b770), ("g54b784", outputs.g54b784)] {
            let expected = case["expected"][name].as_f64().unwrap() as f32;
            assert!(
                (ordered(actual) - ordered(expected)).abs() <= 2,
                "case {index} {name}: {actual} != {expected}"
            );
        }
    }
}

fn ordered(value: f32) -> i64 {
    let bits = value.to_bits();
    i64::from(if bits & 0x8000_0000 != 0 {
        !bits
    } else {
        bits | 0x8000_0000
    })
}

#[test]
fn pressure_derivatives_match_original_native_block() {
    let path = rusttran::default_data_root().join("../pressure_balance_fixtures.json");
    let document: serde_json::Value =
        serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = document["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 100);
    for (index, case) in cases.iter().enumerate() {
        let inputs: rusttran::balance::PressureBalanceInputs =
            serde_json::from_value(case["inputs"].clone()).unwrap();
        let outputs = inputs.derivatives().unwrap();
        for (name, actual) in [("g54b77c", outputs.g54b77c), ("g54b774", outputs.g54b774)] {
            let expected = case["expected"][name].as_f64().unwrap() as f32;
            assert!(
                (ordered(actual) - ordered(expected)).abs() <= 2,
                "case {index} {name}: {actual} != {expected}"
            );
        }
    }
}

#[test]
fn stream_and_volume_balances_match_original_native_blocks() {
    let path = rusttran::default_data_root().join("../additional_balance_fixtures.json");
    let doc: serde_json::Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 200);
    for (index, case) in cases.iter().enumerate() {
        let actual = if case["kind"] == "stream" {
            serde_json::to_value(
                serde_json::from_value::<rusttran::balance::StreamBalanceInputs>(
                    case["inputs"].clone(),
                )
                .unwrap()
                .derivatives()
                .unwrap(),
            )
            .unwrap()
        } else {
            serde_json::to_value(
                serde_json::from_value::<rusttran::balance::VolumeBalanceInputs>(
                    case["inputs"].clone(),
                )
                .unwrap()
                .derivatives()
                .unwrap(),
            )
            .unwrap()
        };
        for (name, expected) in case["expected"].as_object().unwrap() {
            let a = actual[name].as_f64().unwrap() as f32;
            let e = expected.as_f64().unwrap() as f32;
            assert_eq!(a.to_bits(), e.to_bits(), "case {index} {name}");
        }
    }
}

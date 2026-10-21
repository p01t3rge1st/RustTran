use rusttran::native_globals::{LOOP_A_ARGUMENTS, LOOP_B_ARGUMENTS, LoopSide, NativeGlobals};
#[test]
fn both_loop_call_bindings_and_native_integer_rounding_match() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../loop_transfer_bindings.json"))
            .unwrap(),
    )
    .unwrap();
    for (i, case) in doc["caller_bindings"]
        .as_array()
        .unwrap()
        .iter()
        .enumerate()
    {
        let addresses = if i == 0 {
            LOOP_A_ARGUMENTS
        } else {
            LOOP_B_ARGUMENTS
        };
        for (index, arg) in case["arguments"].as_array().unwrap().iter().enumerate() {
            if index == 19 || (index == 28 && i == 1) {
                assert!(!arg["pointer"].as_str().unwrap().starts_with("0x54"));
                continue;
            }
            assert_eq!(
                arg["pointer"].as_str().unwrap(),
                format!("0x{:x}", addresses[index])
            );
        }
    }
    for case in doc["loop_b_count_cases"].as_array().unwrap() {
        let mut globals = NativeGlobals::default();
        globals
            .singles
            .insert("0x54b204".into(), case["total"].as_f64().unwrap() as f32);
        globals
            .integers
            .insert("0x54b4de".into(), case["a"].as_i64().unwrap() as i32);
        assert_eq!(
            i64::from(globals.loop_b_count().unwrap()),
            case["expected"].as_i64().unwrap()
        );
    }
}
#[test]
fn global_store_binding_calculation_commit_and_failure_are_checked() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../loop_transfer_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (index, case) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let side = if index % 2 == 0 {
            LoopSide::A
        } else {
            LoopSide::B
        };
        let addresses = if index % 2 == 0 {
            LOOP_A_ARGUMENTS
        } else {
            LOOP_B_ARGUMENTS
        };
        let mut globals = NativeGlobals::default();
        for (name, value) in case["inputs"].as_object().unwrap() {
            if name == "p54" {
                continue;
            }
            let address = if name == "g54b768" {
                0x54b768
            } else {
                addresses[(usize::from_str_radix(&name[1..], 16).unwrap() - 8) / 4]
            };
            if name == "p64" || name == "p78" {
                if address != 0 {
                    globals
                        .integers
                        .insert(format!("0x{address:x}"), value.as_i64().unwrap() as i32);
                }
            } else {
                globals
                    .singles
                    .insert(format!("0x{address:x}"), value.as_f64().unwrap() as f32);
            }
        }
        if index % 2 != 0 {
            globals.integers.insert("0x54b4de".into(), 1);
            globals.singles.insert(
                "0x54b204".into(),
                case["inputs"]["p78"].as_f64().unwrap() as f32 + 1.,
            );
        }
        let time = case["inputs"]["p54"].as_f64().unwrap() as f32;
        let before = globals.clone();
        let actual = globals.advance_loop_transfer(side, time).unwrap();
        for (offset, name, value) in [
            (8, "p08", actual.p08),
            (0x28, "p28", actual.p28),
            (0x34, "p34", actual.p34),
            (0x3c, "p3c", actual.p3c),
        ] {
            assert_eq!(globals.single(addresses[(offset - 8) / 4]).unwrap(), value);
            assert!(
                value
                    .to_bits()
                    .abs_diff((case["expected"][name].as_f64().unwrap() as f32).to_bits())
                    <= 4
            );
        }
        let mut invalid = before;
        invalid.singles.remove("0x54b768");
        let saved = serde_json::to_value(&invalid).unwrap();
        assert!(invalid.advance_loop_transfer(side, time).is_err());
        assert_eq!(serde_json::to_value(&invalid).unwrap(), saved);
    }
}

#[test]
fn reference_initialization_matches_all_native_model_condition_pairs() {
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../loop_reference_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    let cases = doc["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 110);
    let db = rusttran::Database::embedded("ListData").unwrap();
    for case in cases {
        let model =
            rusttran::bindings::NativeSeed::model(&db, case["model"].as_str().unwrap()).unwrap();
        let ic =
            rusttran::bindings::NativeSeed::condition(&db, case["ic"].as_str().unwrap()).unwrap();
        let mut globals = NativeGlobals::from_seeds(&model, &ic).unwrap();
        let actual = globals.initialize_loop_reference().unwrap();
        for (name, e) in case["expected"].as_object().unwrap() {
            let a = actual[name];
            let e = e.as_f64().unwrap() as f32;
            assert!(
                a.to_bits().abs_diff(e.to_bits()) <= 2,
                "model {}, IC {}, {name}: {a} != {e}",
                case["model"],
                case["ic"]
            );
        }
        for side in [LoopSide::A, LoopSide::B] {
            assert_eq!(
                globals.missing_loop_transfer_inputs(side),
                vec!["0x54b40c".to_owned(), "0x54ba68".to_owned()]
            );
        }
        let saved = serde_json::to_value(&globals).unwrap();
        assert!(globals.advance_loop_transfer(LoopSide::A, 300.).is_err());
        assert_eq!(serde_json::to_value(&globals).unwrap(), saved);
    }
}
#[test]
fn steam_call_bindings_and_exchange_commits_match_original() {
    use rusttran::native_globals::{STEAM_A_ARGUMENTS, STEAM_B_ARGUMENTS};
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../steam_generator_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for (side, call) in doc["caller_bindings"]
        .as_array()
        .unwrap()
        .iter()
        .enumerate()
    {
        let addresses = if side == 0 {
            STEAM_A_ARGUMENTS
        } else {
            STEAM_B_ARGUMENTS
        };
        for (i, arg) in call["arguments"].as_array().unwrap().iter().enumerate() {
            let pointer = arg["pointer"].as_str().unwrap();
            assert_eq!(
                addresses[i],
                if pointer.starts_with("0x54") {
                    u32::from_str_radix(&pointer[2..], 16).unwrap()
                } else {
                    0
                }
            );
        }
    }
    for (i, c) in doc["cases"].as_array().unwrap().iter().enumerate() {
        let addresses = if i % 2 == 0 {
            STEAM_A_ARGUMENTS
        } else {
            STEAM_B_ARGUMENTS
        };
        let side = if i % 2 == 0 { LoopSide::A } else { LoopSide::B };
        let mut g = NativeGlobals::default();
        let q = &c["inputs"];
        for (name, offset) in [
            ("pressure", 8),
            ("fraction", 0x60),
            ("inflow_a", 0x20),
            ("inflow_b", 0x50),
            ("outflow", 0x68),
            ("volume", 0x80),
            ("share", 0xa4),
            ("heat_a", 0x94),
            ("heat_b", 0x98),
        ] {
            g.singles.insert(
                format!("0x{:x}", addresses[(offset - 8) / 4]),
                q[name].as_f64().unwrap() as f32,
            );
        }
        for (name, address) in [
            ("pressure_floor", 0x54b544),
            ("enthalpy_a", 0x54b718),
            ("enthalpy_b", 0x54b734),
            ("pressure_work", 0x54b334),
        ] {
            g.singles
                .insert(format!("0x{address:x}"), q[name].as_f64().unwrap() as f32);
        }
        g.advance_steam_exchange(side, q["phase_flag"].as_i64().unwrap() as i16)
            .unwrap();
        for (name, offset) in [
            ("pressure", 8),
            ("outflow", 0x68),
            ("fraction_derivative", 0x74),
            ("pressure_derivative", 0x70),
            ("inventory_derivative", 0x58),
        ] {
            let a = g.single(addresses[(offset - 8) / 4]).unwrap();
            let e = c["expected"][name].as_f64().unwrap() as f32;
            assert!(a.to_bits().abs_diff(e.to_bits()) <= 4, "case {i} {name}");
        }
        g.singles.remove("0x54b718");
        let before = serde_json::to_value(&g).unwrap();
        assert!(g.advance_steam_exchange(side, 0).is_err());
        assert_eq!(before, serde_json::to_value(&g).unwrap());
    }
}

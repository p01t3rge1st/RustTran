use rusttran::native_globals::NativeGlobals;
fn fixtures(name: &str) -> serde_json::Value {
    serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join(format!("../{name}_fixtures.json")))
            .unwrap(),
    )
    .unwrap()
}
#[test]
fn primary_exchange_global_inputs_commit_original_outputs_atomically() {
    for c in fixtures("primary_exchange")["cases"].as_array().unwrap() {
        let mut g = NativeGlobals::default();
        let q = &c["inputs"];
        for (key, v) in q.as_object().unwrap() {
            if let Some(address) = key.strip_prefix('g') {
                if ["54b4e2", "54b4e4"].contains(&address) {
                    g.integers
                        .insert(format!("0x{address}"), v.as_i64().unwrap() as i32);
                } else {
                    g.singles
                        .insert(format!("0x{address}"), v.as_f64().unwrap() as f32);
                }
            }
        }
        let pump_contributions = serde_json::from_value(q["pump_contributions"].clone()).unwrap();
        g.prepare_primary_exchange(q["fault_flag"].as_i64().unwrap() as i16, pump_contributions)
            .unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            if name == "trace" {
                continue;
            }
            assert!(
                g.singles[name]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 4
            );
        }
        g.singles.remove("0x54b730");
        let before = serde_json::to_value(&g).unwrap();
        assert!(g.prepare_primary_exchange(0, pump_contributions).is_err());
        assert_eq!(before, serde_json::to_value(&g).unwrap());
    }
}
#[test]
fn pump_global_pair_uses_original_pointers_and_preserves_state_on_error() {
    for c in fixtures("pump_pair")["cases"].as_array().unwrap() {
        let q = &c["inputs"];
        let mut g = NativeGlobals::default();
        for (address, v) in [
            (0x54b530, &q["flows"][0]),
            (0x54b534, &q["flows"][1]),
            (0x54b83c, &q["targets"][0]),
            (0x54b840, &q["targets"][1]),
            (0x54b740, &q["shares"][0]),
            (0x54b744, &q["shares"][1]),
            (0x54b414, &q["step"]),
            (0x54b130, &q["time_constant"]),
            (0x54b12c, &q["base_flow"]),
            (0x54b860, &q["volume_factor"]),
            (0x54b654, &q["specific_volume"]),
            (0x54ba34, &q["void_fraction"]),
            (0x54b42c, &q["last_change_a"]),
        ] {
            g.singles
                .insert(format!("0x{address:x}"), v.as_f64().unwrap() as f32);
        }
        g.advance_rcp_pair(q["trip_time"].as_f64().unwrap() as f32)
            .unwrap();
        for (side, address) in [(0, 0x54b530), (1, 0x54b534)] {
            assert!(
                g.single(address).unwrap().to_bits().abs_diff(
                    (c["expected"]["loops"][side]["flow"].as_f64().unwrap() as f32).to_bits()
                ) <= 4
            );
        }
        g.singles.remove("0x54b534");
        let before = serde_json::to_value(&g).unwrap();
        assert!(g.advance_rcp_pair(10.).is_err());
        assert_eq!(before, serde_json::to_value(&g).unwrap());
    }
}
#[test]
fn thermal_mode_globals_preserve_threshold_state_and_commit_native_outputs() {
    for c in fixtures("thermal_modes")["cases"].as_array().unwrap() {
        let q = &c["inputs"];
        let mut g = NativeGlobals::default();
        for (name, v) in q["normal"].as_object().unwrap() {
            g.singles
                .insert(name.replacen('g', "0x", 1), v.as_f64().unwrap() as f32);
        }
        g.singles
            .insert("0x54b190".into(), q["prior_limit"].as_f64().unwrap() as f32);
        g.singles.insert(
            "0x54ba68".into(),
            q["prior_modifier"].as_f64().unwrap() as f32,
        );
        let ext = serde_json::from_value(q["external"].clone()).unwrap();
        g.prepare_thermal_mode(
            q["fault_flag"].as_i64().unwrap() as i16,
            q["model_mode"].as_i64().unwrap() as i16,
            Some(ext),
        )
        .unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            assert!(
                g.singles[name]
                    .to_bits()
                    .abs_diff((e.as_f64().unwrap() as f32).to_bits())
                    <= 2
            );
        }
        let before = serde_json::to_value(&g).unwrap();
        assert!(g.prepare_thermal_mode(0, 1, None).is_err());
        assert_eq!(before, serde_json::to_value(&g).unwrap());
    }
}
#[test]
fn feedwater_global_gain_capacity_and_output_binding_match_original() {
    use rusttran::native_globals::LoopSide;
    for c in fixtures("feedwater_globals")["cases"].as_array().unwrap() {
        let q = &c["inputs"];
        let mut g = NativeGlobals {
            singles: serde_json::from_value(q["extra_singles"].clone()).unwrap(),
            ..Default::default()
        };
        let stage = &q["stages"][0];
        let side = if stage["side"] == "A" {
            LoopSide::A
        } else {
            LoopSide::B
        };
        let a = serde_json::to_value(
            g.advance_feedwater_pi(
                side,
                stage["fault_flag"].as_i64().unwrap() as i16,
                stage["phase_flag"].as_i64().unwrap() as i16,
            )
            .unwrap(),
        )
        .unwrap();
        for (name, e) in c["expected"].as_object().unwrap() {
            let a = a[name].as_f64().unwrap() as f32;
            assert!(a.to_bits().abs_diff((e.as_f64().unwrap() as f32).to_bits()) <= 2);
        }
        let before = serde_json::to_value(&g).unwrap();
        g.singles.remove("0x54b208");
        let incomplete = serde_json::to_value(&g).unwrap();
        assert!(g.advance_feedwater_pi(side, 0, 0).is_err());
        assert_eq!(incomplete, serde_json::to_value(&g).unwrap());
        assert_ne!(before, incomplete);
    }
}

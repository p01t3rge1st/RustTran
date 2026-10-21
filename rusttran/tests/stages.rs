use rusttran::{bindings::NativeSeed, native_globals::NativeGlobals, stages::RecoveredStage};
#[test]
fn staged_original_normal_loop_chain_matches_every_reference_case() {
    let db = rusttran::Database::embedded("ListData").unwrap();
    let doc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(rusttran::default_data_root().join("../normal_loops_fixtures.json"))
            .unwrap(),
    )
    .unwrap();
    for c in doc["cases"].as_array().unwrap() {
        let q = &c["inputs"];
        let model = NativeSeed::model(&db, q["model"].as_str().unwrap()).unwrap();
        let ic = NativeSeed::condition(&db, q["ic"].as_str().unwrap()).unwrap();
        let mut g = NativeGlobals::from_seeds(&model, &ic).unwrap();
        let result = g
            .advance_stages(&[
                RecoveredStage::LoopReference,
                RecoveredStage::ThermalCoefficient,
                RecoveredStage::NormalLoops {
                    clock: q["clock"].as_f64().unwrap() as f32,
                    failure_times: [150., 300.],
                },
            ])
            .unwrap();
        for side in 0..2 {
            for name in ["p08", "p28", "p34", "p3c"] {
                let a = result[2].solution[side][name].as_f64().unwrap() as f32;
                let e = c["expected"][side][name].as_f64().unwrap() as f32;
                assert!(a.to_bits().abs_diff(e.to_bits()) <= 4);
            }
        }
    }
}
#[test]
fn a_late_stage_failure_rolls_back_the_entire_batch() {
    let mut g = NativeGlobals::default();
    g.singles.insert("0x54b494".into(), 2200.);
    let before = serde_json::to_value(&g).unwrap();
    let err = g
        .advance_stages(&[
            RecoveredStage::NumericConstants,
            RecoveredStage::PrimaryProperties,
            RecoveredStage::RcpPair { trip_time: 300. },
        ])
        .unwrap_err();
    assert!(err.to_string().contains("stage 3 (rcp_pair)"));
    assert_eq!(before, serde_json::to_value(&g).unwrap());
}

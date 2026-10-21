use rusttran::{
    default_data_root,
    presentation::{Presentation, RunClock},
};

#[test]
fn recovered_snapshot_and_unknown_fields() {
    let mut model = Presentation::load(&default_data_root()).unwrap();
    model.select("1").unwrap();
    assert_eq!(model.number("P"), Some(158.2));
    assert_eq!(model.number("TAVG"), Some(309.1));
    assert_eq!(model.format("TAVG", 1), "309.1");
    assert_eq!(model.format("not_recovered", 1), "—");
    assert_eq!(model.pump("not_recovered"), None);
    let previous = model.thermo.clone();
    assert!(model.select("not_an_ic").is_err());
    assert_eq!(model.selected_id, "1");
    assert_eq!(model.thermo, previous);
    let ids: Vec<_> = model.conditions.iter().map(|c| c.id.clone()).collect();
    for id in ids {
        model.select(&id).unwrap();
        assert_eq!(model.thermo.get("IC"), Some(&id));
    }
}

#[test]
fn preview_clock_has_no_original_duration_ceiling() {
    let mut clock = RunClock::default();
    clock.start().unwrap();
    for target in [301.0, 3601.0, 86401.0] {
        clock.advance(target - clock.elapsed_seconds).unwrap();
        assert_eq!(clock.elapsed_seconds, target);
        assert!(clock.running);
    }
    clock.pause().unwrap();
    clock.advance(100.0).unwrap();
    assert_eq!(clock.elapsed_seconds, 86401.0);
    clock.speed = 2.0;
    clock.start().unwrap();
    clock.advance(1.5).unwrap();
    assert_eq!(clock.elapsed_seconds, 86404.0);
    clock.reset().unwrap();
    assert_eq!(clock.elapsed_seconds, 0.0);
    assert!(!clock.running);
}

#[test]
fn clock_rejects_invalid_inputs_atomically() {
    let mut clock = RunClock::default();
    clock.seek(12.0).unwrap();
    clock.start().unwrap();
    for invalid in [f64::NAN, f64::INFINITY, -1.0] {
        assert!(clock.advance(invalid).is_err());
        assert!(clock.seek(invalid).is_err());
        assert_eq!(clock.elapsed_seconds, 12.0);
    }
    clock.speed = 0.0;
    assert!(clock.advance(1.0).is_err());
    assert_eq!(clock.elapsed_seconds, 12.0);
    clock.speed = f64::MAX;
    assert!(clock.advance(2.0).is_err());
    assert_eq!(clock.elapsed_seconds, 12.0);
}

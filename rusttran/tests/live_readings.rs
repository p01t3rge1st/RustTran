use rusttran::{
    live_readings::{LiveReadings, PlantReadings},
    native_globals::NativeGlobals,
};
#[test]
fn live_mimic_converts_current_values_and_never_falls_back_to_ic_states() {
    let mut globals = NativeGlobals::default();
    globals.singles.insert(
        "0x54b494".into(),
        rusttran::bindings::native_pressure(155.).unwrap(),
    );
    globals.singles.insert(
        "0x54b498".into(),
        rusttran::bindings::native_temperature(300.).unwrap(),
    );
    globals.singles.insert("0x54b4a0".into(), 0.5);
    globals.singles.insert("0x54b424".into(), 100.); // Stored IC power is not live power.
    let readings = LiveReadings::from_globals(&globals);
    assert!((readings.number("P").unwrap() - 155.).abs() < 0.0001);
    assert!((readings.number("TAVG").unwrap() - 300.).abs() < 0.0001);
    assert!(readings.number("LEV").is_some());
    for field in ["PSGA", "POWR", "RDPOS", "PRB", "TRB", "TPCT"] {
        assert!(readings.number(field).is_none(), "{field}");
    }
    assert!(readings.pump("RCPA").is_none());
    assert!(readings.valve("PORVA").is_none());
    globals.singles.insert(
        "0x54b494".into(),
        rusttran::bindings::native_pressure(100.).unwrap(),
    );
    assert!((LiveReadings::from_globals(&globals).number("P").unwrap() - 100.).abs() < 0.0001);
}

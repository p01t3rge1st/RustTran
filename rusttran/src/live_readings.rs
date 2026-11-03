//! Original mimic units for the recovered session. Unconnected sources are absent.
use crate::{bindings::IC_BINDINGS, native_globals::NativeGlobals, presentation::Presentation};
use std::collections::BTreeMap;
pub trait PlantReadings {
    fn number(&self, field: &str) -> Option<f64>;
    fn pump(&self, field: &str) -> Option<f64>;
    fn valve(&self, field: &str) -> Option<f64>;
    fn fan(&self, _field: &str) -> Option<f64> {
        None
    }
}
impl PlantReadings for Presentation {
    fn fan(&self, field: &str) -> Option<f64> {
        Presentation::fan(self, field)
    }
    fn number(&self, field: &str) -> Option<f64> {
        Presentation::number(self, field)
    }
    fn pump(&self, field: &str) -> Option<f64> {
        Presentation::pump(self, field)
    }
    fn valve(&self, field: &str) -> Option<f64> {
        Presentation::valve(self, field)
    }
}
#[derive(Default)]
pub struct LiveReadings {
    readings: BTreeMap<String, f64>,
    fans: BTreeMap<String, f64>,
}
impl LiveReadings {
    pub fn from_globals(globals: &NativeGlobals) -> Self {
        let mut readings = BTreeMap::new();
        // These states have connected numerical producers. Do not show stored
        // IC power, rod, containment or unknown device states as live output.
        for field in [
            "P", "TAVG", "LEV", "PSGA", "PSGB", "LSGA", "LSGB", "WRCA", "WRCB",
        ] {
            if let Some(b) = IC_BINDINGS.iter().find(|b| b.field == field)
                && let Ok(value) = globals.single(b.address)
            {
                let shifted = f64::from(value) - f64::from(b.offset);
                let value = if b.divide {
                    shifted * f64::from(b.factor)
                } else {
                    shifted / f64::from(b.factor)
                };
                if value.is_finite() {
                    readings.insert(field.into(), value);
                }
            }
        }
        // Recovered thermal-transport outputs (0x50d1f8–0x50d867).
        // The engine stores Fahrenheit; the classic mimic displays Celsius.
        for (field, address) in [
            ("HOT_LEG_A", 0x54b694),
            ("HOT_LEG_B", 0x54b698),
            ("COLD_LEG_A", 0x54b69c),
            ("COLD_LEG_B", 0x54b6a0),
        ] {
            if let Ok(value) = globals.single(address) {
                let celsius = (f64::from(value) - 32.) / 1.8;
                if celsius.is_finite() {
                    readings.insert(field.into(), celsius);
                }
            }
        }
        Self {
            readings,
            fans: BTreeMap::new(),
        }
    }
    /// Selected producers supply containment state and retained fan commands. Heat
    /// is exposed only when that producer is selected; unrelated IC state is
    /// never substituted for missing live sources.
    pub fn from_session(session: &crate::recovered_session::RecoveredSession) -> Self {
        let mut out = Self::from_globals(&session.globals);
        if session.controls.containment_thermal.is_some()
            && let Ok(value) = session.globals.single(0x54bae4)
        {
            out.readings.insert("HYDROGEN".into(), f64::from(value));
        }
        if session.controls.containment_balance.is_some() {
            for field in ["PRB", "TRB", "LWRB"] {
                if let Some(b) = IC_BINDINGS.iter().find(|b| b.field == field)
                    && let Ok(value) = session.globals.single(b.address)
                {
                    let shifted = f64::from(value) - f64::from(b.offset);
                    let value = if b.divide {
                        shifted * f64::from(b.factor)
                    } else {
                        shifted / f64::from(b.factor)
                    };
                    if value.is_finite() {
                        out.readings.insert(field.into(), value);
                    }
                }
            }
        }
        if let Some(c) = &session.controls.containment_fans {
            for (i, value) in c.fan_percent.iter().enumerate() {
                out.fans
                    .insert(format!("Fan Cooler {}", i + 1), f64::from(*value));
            }
            if let Ok(value) = session.globals.single(0x54b750) {
                out.readings.insert(
                    "FAN_COOLING_HEAT".into(),
                    f64::from(value) / f64::from(crate::bindings::HEAT_FACTOR),
                );
            }
        }
        out
    }
}
impl PlantReadings for LiveReadings {
    fn fan(&self, field: &str) -> Option<f64> {
        self.fans.get(field).copied()
    }
    fn number(&self, field: &str) -> Option<f64> {
        self.readings.get(field).copied()
    }
    fn pump(&self, _field: &str) -> Option<f64> {
        None
    }
    fn valve(&self, _field: &str) -> Option<f64> {
        None
    }
}

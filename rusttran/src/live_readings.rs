//! Original mimic units for the recovered session. Unconnected sources are absent.
use crate::{bindings::IC_BINDINGS, native_globals::NativeGlobals, presentation::Presentation};
use std::collections::BTreeMap;
pub trait PlantReadings {
    fn number(&self, field: &str) -> Option<f64>;
    fn pump(&self, field: &str) -> Option<f64>;
    fn valve(&self, field: &str) -> Option<f64>;
}
impl PlantReadings for Presentation {
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
        Self { readings }
    }
}
impl PlantReadings for LiveReadings {
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

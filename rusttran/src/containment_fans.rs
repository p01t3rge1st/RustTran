//! Recovered containment fan cooling 0x503564–0x503cf2.
//! Caller globals are authenticated by 0x523383–0x5233c0. COM properties
//! are explicit state; text, setter callbacks and error UI are not emulated.
use crate::{Result, native_globals::NativeGlobals};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentFanControls {
    /// Original collection 0x494, indices 0..3, property 0x68030007.
    pub fan_percent: [i16; 4],
    /// Same collection, property 0x68030006. Only fans 0/1 auto-start here.
    pub fan_manual: [bool; 4],
    /// Collection 0x554, index 0, property 0x68030000.
    pub exchanger_percent: i16,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentFanRequest {
    pub globals: NativeGlobals,
    pub controls: ContainmentFanControls,
}
#[derive(Clone, Debug, Serialize)]
pub struct ContainmentFanOutput {
    pub singles: BTreeMap<String, f32>,
    pub controls: ContainmentFanControls,
    pub activated: bool,
}
fn single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("containment fan Single overflow".into())
    }
}
impl NativeGlobals {
    /// Atomic update: unavailable source values and native I16 overflow fail
    /// without committing the activation time or returned automatic commands.
    pub fn advance_containment_fans(
        &mut self,
        c: &ContainmentFanControls,
    ) -> Result<ContainmentFanOutput> {
        let pressure = self.single(0x54b544)?;
        let threshold = self.single(0x54b2c4)?;
        let clock = self.single(0x54b40c)?;
        let activation_time = self.single(0x54b450)?;
        let ambient = f64::from(self.single(0x54b160)?);
        let design = f64::from(self.single(0x54b2d0)?);
        let rated = f64::from(self.single(0x54b2cc)?);
        let current = f64::from(self.single(0x54b548)?);
        if design == ambient {
            return Err("singular containment fan design temperature".into());
        }
        let activated = pressure >= threshold && clock < activation_time;
        let mut controls = c.clone();
        if activated {
            for i in 0..2 {
                if controls.fan_percent[i] == 0 && !controls.fan_manual[i] {
                    controls.fan_percent[i] = 100;
                }
            }
        }
        // VB6 adds signed I16 values, trapping at every intermediate addition.
        let mut sum = controls.fan_percent[1];
        for i in [0, 2, 3] {
            sum = sum
                .checked_add(controls.fan_percent[i])
                .ok_or("containment fan I16 sum overflow")?;
        }
        // 0x503c97 rounds before applying the exchanger command. Negative or
        // above-100 commands are not silently clamped by the original body.
        let heat =
            single((current - ambient) / (design - ambient) * rated * f64::from(sum) / 100.)?;
        let heat = single(f64::from(heat) * f64::from(controls.exchanger_percent) / 100.)?;
        let singles = BTreeMap::from([
            (
                "0x54b450".into(),
                if activated { clock } else { activation_time },
            ),
            ("0x54b750".into(), heat),
        ]);
        self.singles.extend(singles.clone());
        Ok(ContainmentFanOutput {
            singles,
            controls,
            activated,
        })
    }
}

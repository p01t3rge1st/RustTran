//! Late numerical initializer slices in 0x51afe0. COM, external Double-model
//! initialization and restored-scenario/event dispatch remain separate.
use crate::{Result, fresh_primary::FreshPrimaryOutput, native_globals::NativeGlobals, physics};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LateThermalRequest {
    pub globals: NativeGlobals,
}
fn single(v: f64) -> Result<f32> {
    let x = v as f32;
    if x.is_finite() {
        Ok(x)
    } else {
        Err("late thermal initializer Single overflow".into())
    }
}
impl NativeGlobals {
    pub fn initialize_late_thermal(&mut self) -> Result<FreshPrimaryOutput> {
        let get = |a| self.single(a);
        let d = f64::from;
        let count = get(0x54b204)?;
        let nominal = get(0x54b12c)?;
        let share_a = get(0x54b740)?;
        let share_b = get(0x54b744)?;
        let interval = d(get(0x54b1f8)?) - d(get(0x54b1cc)?);
        if count == 0. || nominal == 0. || share_a == 0. || share_b == 0. || interval == 0. {
            return Err("zero late thermal initializer denominator".into());
        }
        let density_volume = physics::liquid_specific_volume(get(0x54b494)?, get(0x54b49c)?)?;
        if density_volume == 0. {
            return Err("zero late thermal liquid volume".into());
        }
        let tank_inventory = single(d(get(0x54b1a0)?) / d(density_volume))?;
        let pairs = [
            (0x54b848, get(0x54b518)?),
            (0x54b838, single(d(get(0x54b4b0)?) / 30.)?),
            (
                0x54b83c,
                single(d(get(0x54b530)?) / d(nominal) / d(share_a) * 100.)?,
            ),
            (
                0x54b840,
                single(d(get(0x54b534)?) / d(nominal) / d(share_b) * 100.)?,
            ),
            (0x54b844, get(0x54b514)?),
            (0x54b84c, get(0x54b514)?),
            (
                0x54b808,
                single(
                    (d(get(0x54b2a0)?) - d(get(0x54b1a8)?)) * d(get(0x54b41c)?) + d(get(0x54b1a8)?),
                )?,
            ),
            (0x54b850, single(d(get(0x54b128)?) - d(get(0x54b1a8)?))?),
            (
                0x54b854,
                single(
                    (d(get(0x54b768)?) / interval)
                        * (d(get(0x54b1a4)?) - d(get(0x54b4cc)?) * d(count))
                        / d(count),
                )?,
            ),
            (
                0x54b860,
                physics::liquid_specific_volume(get(0x54b124)?, get(0x54b128)?)?,
            ),
            (0x54b6c0, single(d(get(0x54b4a0)?) * 100.)?),
            (0x54b688, get(0x54b4f0)?),
            (
                0x54b72c,
                single(physics::liquid_enthalpy(get(0x54b494)?, get(0x54b160)?)?)?,
            ),
            (0x54b870, single(d(get(0x54b464)?) * d(nominal))?),
            (0x54b684, physics::saturation_pressure(get(0x54b49c)?)?),
            (0x54b654, density_volume),
            (0x54bb3c, tank_inventory),
            (0x54bb38, tank_inventory),
        ];
        let mut singles = pairs
            .into_iter()
            .map(|(a, v)| (format!("0x{a:x}"), v))
            .collect::<BTreeMap<_, _>>();
        // These are explicit application initializer stores, not assumed image defaults.
        for a in [
            0x54b9f8, 0x54b9fc, 0x54ba0c, 0x54ba10, 0x54ba14, 0x54ba18, 0x54b858, 0x54b864,
            0x54b868, 0x54b86c,
        ] {
            singles.insert(format!("0x{a:x}"), 0.);
        }
        let integers = [0x54b85c, 0x54c01c, 0x54c01e]
            .into_iter()
            .map(|a| (format!("0x{a:x}"), 0))
            .collect::<BTreeMap<_, _>>();
        self.singles.extend(singles.clone());
        self.integers.extend(integers.clone());
        Ok(FreshPrimaryOutput { singles, integers })
    }
}

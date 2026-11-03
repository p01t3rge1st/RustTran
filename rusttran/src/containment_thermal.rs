//! Original thermal source 0x51fc92–0x51fd6c and hydrogen burn 0x52059e–0x520986.
//! Explicit upstream reaction state and seven-point limit curve. No COM/log UI.
use crate::{Result, native_globals::NativeGlobals, physics};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
// Original DLL PowerR8(30.48, 3), CW0x027f. Preserves its result rather than
// substituting a modern pow implementation at an ignition boundary.
const CUBIC_FOOT_CM3: f64 = f64::from_bits(0x40dba7362e90363c);
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct HydrogenLimitCurve {
    /// Original seven points at 0x54c02c; initializer data pointer0x54c038.
    pub gauge_pressure: [f32; 7],
    /// Original seven points at 0x54c048.
    pub limit_percent: [f32; 7],
}
impl Default for HydrogenLimitCurve {
    /// Original initializer 0x51d326–0x51d3c6. EBX=Single20 and EDI=Single100
    /// originate at 0x51c98a/0x51c998 and survive to the trailing array stores.
    fn default() -> Self {
        Self {
            gauge_pressure: [0., 10., 20., 30., 35., 40., 100.],
            limit_percent: [5., 6., 7.5, 9.5, 12., 18., 20.],
        }
    }
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentThermalControls {
    /// I16 malfunction array 0x54b630 +8, shared event flag index4.
    pub burn_flag: i16,
    /// Event-time array 0x54b5f8 +0x10, shared index4 and retained on ignition.
    pub burn_time: f32,
    #[serde(default)]
    pub hydrogen_curve: HydrogenLimitCurve,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContainmentThermalRequest {
    pub globals: NativeGlobals,
    pub controls: ContainmentThermalControls,
}
#[derive(Clone, Debug, Serialize)]
pub struct ContainmentThermalOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    pub controls: ContainmentThermalControls,
    pub ignited: bool,
    pub extinguished: bool,
    pub burned: bool,
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("containment thermal Single overflow".into())
    }
}
impl NativeGlobals {
    /// Both producers commit together, including latch/event state. Missing
    /// sources never become zeros; unused delayed-burn inputs are not required.
    pub fn advance_containment_thermal(
        &mut self,
        c: &ContainmentThermalControls,
    ) -> Result<ContainmentThermalOutput> {
        if !c.burn_time.is_finite() {
            return Err("non-finite hydrogen event time".into());
        }
        let get = |a| self.single(a).map(f64::from);
        let step = get(0x54b414)?;
        let mass_factor = get(0x54b32c)?;
        if step == 0. || mass_factor == 0. {
            return Err("singular containment thermal source denominator".into());
        }
        let source = single(
            (-get(0x54c000)? * 55.85 / 46. * 337. + get(0x54bffc)? / 18. * 977846.)
                * (get(0x54bfb4)? / step / mass_factor * get(0x54c004)?),
        )?;
        let volume = get(0x54b2c0)?;
        if volume == 0. {
            return Err("zero hydrogen concentration volume".into());
        }
        let inventory = get(0x54bd78)?;
        let concentration =
            single((inventory * 1000. / 2. * 22400.) / (CUBIC_FOOT_CM3 * volume) * 100.)?;
        let gauge = single(get(0x54b544)? - 14.7)?;
        let threshold = physics::interpolate(
            &c.hydrogen_curve.gauge_pressure,
            &c.hydrogen_curve.limit_percent,
            gauge,
        )?;
        let mut latch = self.integer(0x54bfa8)?;
        let mut controls = c.clone();
        let mut singles = BTreeMap::from([
            ("0x54bfb8".into(), source),
            ("0x54bae4".into(), concentration),
            ("0x54bfac".into(), threshold),
        ]);
        let ignited = c.burn_flag != 0 && latch == 0 && concentration > threshold;
        let mut extinguished = false;
        let mut burned = false;
        if ignited {
            latch = 1;
            controls.burn_time = self.single(0x54b40c)?;
            singles.insert("0x54bfb0".into(), self.single(0x54b544)?);
        } else if concentration < 1. && latch == 1 {
            latch = 0;
            extinguished = true;
            singles.insert("0x54b754".into(), 0.);
        } else {
            let delayed = single(step + f64::from(controls.burn_time))?;
            // Native FpR4 before the strict comparison, not >=.
            if delayed < self.single(0x54b40c)? && latch == 1 {
                burned = true;
                singles.insert(
                    "0x54b754".into(),
                    single(f64::from(concentration) * 5_000_000.)?,
                );
                singles.insert("0x54bd78".into(), single(inventory * 0.8)?);
            }
        }
        let integers = BTreeMap::from([("0x54bfa8".into(), i32::from(latch))]);
        self.singles.extend(singles.clone());
        self.integers.extend(integers.clone());
        Ok(ContainmentThermalOutput {
            singles,
            integers,
            controls,
            ignited,
            extinguished,
            burned,
        })
    }
}

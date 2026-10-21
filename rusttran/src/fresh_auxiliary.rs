//! Fresh-start cached states 0x51b905–0x51ba28, before external model init.
use crate::{Result, native_globals::NativeGlobals};
use std::collections::BTreeMap;
pub const OUTPUTS: [u32; 25] = [
    0x54b454, 0x54b458, 0x54b438, 0x54b544, 0x54b7fc, 0x54b804, 0x54b800, 0x54b540, 0x54b574,
    0x54b53c, 0x54b570, 0x54b810, 0x54b814, 0x54b55c, 0x54b524, 0x54ba4c, 0x54ba40, 0x54b808,
    0x54b550, 0x54b554, 0x54b80c, 0x54b558, 0x54b818, 0x54b81c, 0x54b428,
];
fn single(v: f64) -> Result<f32> {
    let x = v as f32;
    if x.is_finite() {
        Ok(x)
    } else {
        Err("fresh auxiliary Single overflow".into())
    }
}
impl NativeGlobals {
    /// New-start stores only. The external-model initializer 0x526200 and
    /// subsequent restored-scenario/UI/event initialization are not included.
    pub fn initialize_fresh_auxiliary(&mut self) -> Result<BTreeMap<String, f32>> {
        let power = self.single(0x54b41c)?;
        let pressure = self.single(0x54b2b4)?;
        let saturation = crate::physics::saturation_pressure(self.single(0x54b548)?)?;
        let reference = single(
            (f64::from(self.single(0x54b2a0)?) - f64::from(self.single(0x54b1a8)?))
                * f64::from(power)
                + f64::from(self.single(0x54b1a8)?),
        )?;
        let mut out = BTreeMap::new();
        for a in [0x54b454, 0x54b458, 0x54b438] {
            out.insert(format!("0x{a:x}"), f32::from_bits(0x47c34ff3));
        }
        for a in [0x54b804, 0x54b810, 0x54b814, 0x54b55c, 0x54b524] {
            out.insert(format!("0x{a:x}"), 0.);
        }
        for a in [0x54b808, 0x54b550, 0x54b554] {
            out.insert(format!("0x{a:x}"), reference);
        }
        for a in [0x54b80c, 0x54b558] {
            out.insert(format!("0x{a:x}"), 1.);
        }
        for a in [0x54b818, 0x54b81c, 0x54b428] {
            out.insert(format!("0x{a:x}"), power);
        }
        for (a, v) in [
            (0x54b544, pressure),
            (0x54b7fc, saturation),
            (
                0x54b800,
                single(f64::from(pressure) - f64::from(saturation))?,
            ),
            (
                0x54b540,
                single(f64::from(self.single(0x54b1b8)?) + f64::from(f32::from_bits(0x41700000)))?,
            ),
            (
                0x54b53c,
                single(f64::from(self.single(0x54bfa4)?) + f64::from(f32::from_bits(0x41700000)))?,
            ),
            (0x54b574, self.single(0x54b220)?),
            (0x54b570, self.single(0x54b1bc)?),
            (0x54ba4c, self.single(0x54b124)?),
            (0x54ba40, self.single(0x54b57c)?),
        ] {
            out.insert(format!("0x{a:x}"), v);
        }
        self.singles.extend(out.clone());
        Ok(out)
    }
}

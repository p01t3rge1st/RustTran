//! Original scalar unit/geometry initialization omitted by earlier partial starts.
//! External Double state, property arrays and UI initialization remain separate.
use crate::{Result, fresh_primary::FreshPrimaryOutput, native_globals::NativeGlobals};
use std::collections::BTreeMap;
pub const CONSTANTS: [(u32, u32); 20] = [
    (0x54b2f4, 0x3d6978d5),
    (0x54b2f8, 0x3de147ae),
    (0x54b2fc, 0x41681062),
    (0x54b300, 0x42000000),
    (0x54b304, 0x3fe66666),
    (0x54b308, 0x3f1ccccd),
    (0x54b30c, 0x3edcac08),
    (0x54b310, 0x4051f8a1),
    (0x54b314, 0x4a505020),
    (0x54b318, 0x45610000),
    (0x54b31c, 0x3e9c0ebf),
    (0x54b320, 0x412c3958),
    (0x54b324, 0x420d428f),
    (0x54b328, 0x418e3958),
    (0x54b32c, 0x400d1eb8),
    (0x54b334, 0x3e3d70a4),
    (0x54b044, 0x42140000),
    (0x54bb08, 0x3d75c28f),
    (0x54b330, crate::bindings::HEAT_FACTOR.to_bits()),
    (0x54b70c, crate::bindings::NATIVE_G54B70C.to_bits()),
];
impl NativeGlobals {
    /// Scalar stores in original 0x51c310-0x51c42d. PI Double and subsequent
    /// property arrays are not represented as invented Single globals here.
    pub fn initialize_startup_constants(&mut self) -> FreshPrimaryOutput {
        let singles = CONSTANTS
            .iter()
            .map(|(a, b)| (format!("0x{a:x}"), f32::from_bits(*b)))
            .collect::<BTreeMap<_, _>>();
        let integers = BTreeMap::from([("0x54bfa8".into(), 0)]);
        self.singles.extend(singles.clone());
        self.integers.extend(integers.clone());
        FreshPrimaryOutput { singles, integers }
    }
    /// Original 0x51b174-0x51b196 + 0x51b19c-0x51b1d9. The skipped I16 B700
    /// comes from the earlier VB time conversion and is not guessed here.
    pub fn initialize_startup_geometry(&mut self) -> Result<BTreeMap<String, f32>> {
        let denominator = self.single(0x54b46c)?;
        if denominator == 0. {
            return Err("zero initial sampling interval".into());
        }
        let ratio = (f64::from(self.single(0x54b470)?) / f64::from(denominator)) as f32;
        let accumulator =
            (f64::from(self.single(0x54b220)?) + f64::from(self.single(0x54b1bc)?)) as f32;
        if !ratio.is_finite() || !accumulator.is_finite() {
            return Err("initial geometry Single overflow".into());
        }
        let singles = [
            (0x54b704, ratio),
            (0x54b708, accumulator),
            (0x54b74c, 0.),
            (0x54b750, 0.),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect::<BTreeMap<_, _>>();
        self.singles.extend(singles.clone());
        Ok(singles)
    }
}

impl NativeGlobals {
    /// Original DT / Double 0.001, __vbaR8IntI2 floor conversion, then I16 B700.
    /// This reproduces the scalar result; Rust has no process-wide x87 state.
    pub fn initialize_startup_clock(&mut self) -> Result<BTreeMap<String, i32>> {
        let value = (f64::from(self.single(0x54b414)?) / 0.001).floor();
        if !value.is_finite() || value < f64::from(i16::MIN) || value > f64::from(i16::MAX) {
            return Err("initial clock quantum exceeds original I16 range".into());
        }
        let out = BTreeMap::from([("0x54b700".into(), value as i32)]);
        self.integers.extend(out.clone());
        Ok(out)
    }
}

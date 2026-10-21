//! Original six-node Double initializer 0x52624b-0x5269d2 and fresh
//! temperature stores 0x51ba2d-0x51baa3. Evolution/COM paths are separate.
use crate::{Result, native_globals::NativeGlobals};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AlternateInitRequest {
    pub globals: NativeGlobals,
    pub model_doubles: BTreeMap<String, f64>,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ZeroDoubleVariant {
    pub vartype: u16,
    pub value: f64,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AlternateState {
    pub doubles: BTreeMap<String, f64>,
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    /// Keys identify original pointer globals; values own their eight elements.
    pub arrays: BTreeMap<String, [f64; 8]>,
    /// Original pointer 0x54bd20, offsets 0x30 and 0x38.
    pub temperatures: [f64; 2],
    /// Original Variant 0x54be14, reset by __vbaVarMove to Double zero.
    pub zero_variant: ZeroDoubleVariant,
}
fn checked(value: f64) -> Result<f64> {
    if value.is_finite() {
        Ok(value)
    } else {
        Err("alternate initialization Double overflow".into())
    }
}
impl AlternateInitRequest {
    pub fn initialize(&self) -> Result<AlternateState> {
        let get = |a| self.globals.single(a).map(f64::from);
        let double = |a: u32| -> Result<f64> {
            checked(
                *self
                    .model_doubles
                    .get(&format!("0x{a:x}"))
                    .ok_or_else(|| format!("missing model Double 0x{a:x}"))?,
            )
        };
        let mass_factor = get(0x54b32c)?;
        let pressure_factor = get(0x54b310)?;
        let temperature_factor = get(0x54b304)?;
        if mass_factor == 0. || pressure_factor == 0. || temperature_factor == 0. {
            return Err("zero alternate initialization conversion factor".into());
        }
        // Source conversions at 0x4ce082 and 0x4ce3a8 store Double, not Single.
        let bd40 = checked(get(0x54b1b0)? / mass_factor)?;
        let bd30 = checked(get(0x54bfa4)? / pressure_factor)?;
        let bd38 = double(0x54bd38)?;
        let bd48 = double(0x54bd48)?;
        let bd50 = double(0x54bd50)?;
        let bd58 = double(0x54bd58)?;
        let sum = checked(checked(checked(bd48 + bd40)? + bd50)? + bd58)?;
        let mut doubles = [
            (0x54bd30, bd30),
            (0x54bd40, bd40),
            (0x54bd60, checked(bd30 / 6.)?),
            (0x54bd68, checked(bd38 / 6.)?),
            (0x54bd9c, checked(sum / 6.)?),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect::<BTreeMap<_, _>>();
        // Exact native paired DWORD constants in the initializer.
        for (a, v) in [
            (0x54bdc4, 900.),
            (0x54be3c, 1250.),
            (0x54be44, 2250.),
            (0x54be4c, 1760.),
            (0x54be54, 2250.),
            (0x54be5c, 2250.),
            (0x54be64, 250.),
            (0x54be6c, 225.),
            (0x54be74, 225.),
            (0x54be7c, 275.),
            (0x54be84, 275.),
            (0x54bf0c, 1.),
            (0x54bf24, 0.2),
            (0x54bdfc, 300.),
            (0x54be04, 280.),
            (0x54bdb4, 286.),
        ] {
            doubles.insert(format!("0x{a:x}"), v);
        }
        for a in [
            0x54bd70, 0x54be0c, 0x54bdcc, 0x54bf2c, 0x54bec0, 0x54bedc, 0x54bee4, 0x54bf34,
            0x54bf50, 0x54bf44, 0x54bdf4, 0x54bf7c,
        ] {
            doubles.insert(format!("0x{a:x}"), 0.);
        }
        let mut arrays = BTreeMap::new();
        for (a, total) in [
            (0x54bbec, bd40),
            (0x54bc08, bd48),
            (0x54bc24, bd50),
            (0x54bc40, bd58),
        ] {
            let mut values = [0.; 8];
            values[..6].fill(checked(total / 6.)?);
            arrays.insert(format!("0x{a:x}"), values);
        }
        for a in [0x54bc5c, 0x54bc78, 0x54bc94, 0x54bcb0, 0x54bccc, 0x54bce8] {
            arrays.insert(format!("0x{a:x}"), [0.; 8]);
        }
        arrays.insert("0x54bd04".into(), [1., 1., 1., 1., 1., 1., 0., 0.]);
        arrays.insert(
            "0x54bf70".into(),
            [0.705, 1.007, 1.135, 1.179, 1.121, 0.853, 1., 1.],
        );
        let temperature = checked((get(0x54b548)? - get(0x54b300)?) / temperature_factor)?;
        Ok(AlternateState {
            doubles,
            singles: BTreeMap::from([("0x54bd78".into(), 0.)]),
            integers: [(0x54bd2c, 6), (0x54be8c, 0), (0x54be8e, 0), (0x54bec8, 0)]
                .into_iter()
                .map(|(a, v)| (format!("0x{a:x}"), v))
                .collect(),
            arrays,
            temperatures: [temperature; 2],
            zero_variant: ZeroDoubleVariant {
                vartype: 5,
                value: 0.,
            },
        })
    }
}

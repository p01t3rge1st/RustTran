//! Recovered portions of 0x51afe0. These do not initialize the complete plant.
use crate::{Result, bindings::NativeSeed, physics};
use serde::{Deserialize, Serialize};
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PressurizerInitInputs {
    pub g54b154: f32,
    pub g54b128: f32,
    pub g54b1a8: f32,
    pub g54b498: f32,
    pub g54b64c: f32,
    pub g54b650: f32,
    pub g54b4a4: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PressurizerInitOutput {
    pub g54b6d4: f32,
    pub g54b7ec: f32,
    pub g54b4a0: f32,
    pub g54b4f0: f32,
    pub g54b7f0: f32,
}
fn single(v: f64) -> Result<f32> {
    let value = v as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("initialization Single overflow".into())
    }
}
impl PressurizerInitInputs {
    /// 0x51b4fb–0x51b6cf: liquid level, vapor volume/mass fractions, total mass.
    /// Raw globals preserve native operand provenance. Source unit conversions
    /// must be completed before this calculation; temperatures are degF.
    pub fn initialize(&self) -> Result<PressurizerInitOutput> {
        let d = |v: f32| f64::from(v);
        if [
            self.g54b154,
            self.g54b128,
            self.g54b1a8,
            self.g54b498,
            self.g54b64c,
            self.g54b650,
            self.g54b4a4,
        ]
        .iter()
        .any(|v| !v.is_finite())
            || self.g54b128 == self.g54b1a8
            || self.g54b64c <= 0.
            || self.g54b650 <= 0.
        {
            return Err("invalid pressurizer initialization operands".into());
        }
        let ratio = (d(self.g54b154) - 0.27) / (d(self.g54b128) - d(self.g54b1a8));
        let mut level = single((d(self.g54b498) - d(self.g54b1a8)) * ratio + 0.27)?;
        if level < 0.27_f32 {
            level = 0.27_f32;
        }
        if level > self.g54b154 {
            level = self.g54b154;
        }
        let vapor = single(1. - d(level))?;
        let stored_level = single(1. - d(vapor))?;
        let vapor_density = d(vapor) / d(self.g54b650);
        let total_density = (1. - d(vapor)) / d(self.g54b64c) + vapor_density;
        if total_density == 0. {
            return Err("initial mixture density is zero".into());
        }
        let fraction = single(vapor_density / total_density)?;
        let specific = (1. - d(fraction)) * d(self.g54b64c) + d(fraction) * d(self.g54b650);
        if specific == 0. {
            return Err("initial mixture specific volume is zero".into());
        }
        let mass = single(d(self.g54b4a4) / specific)?;
        Ok(PressurizerInitOutput {
            g54b6d4: level,
            g54b7ec: vapor,
            g54b4a0: stored_level,
            g54b4f0: fraction,
            g54b7f0: mass,
        })
    }
    /// Map authenticated BasicData globals into the fresh-start branch. This
    /// does not apply that branch to restored IC snapshots or initialize events.
    pub fn from_model(model: &NativeSeed, coolant_temperature: f32) -> Result<Self> {
        if model.source_table != "BasicData" {
            return Err("fresh-start inputs require a BasicData model seed".into());
        }
        let get = |address: &str| -> Result<f32> {
            Ok(*model
                .globals
                .get(address)
                .ok_or_else(|| format!("missing model global {address}"))?)
        };
        let pressure = get("0x54b124")?;
        Ok(Self {
            g54b154: get("0x54b154")?,
            g54b128: get("0x54b128")?,
            g54b1a8: get("0x54b1a8")?,
            g54b498: coolant_temperature,
            g54b64c: physics::vfld(pressure)?,
            g54b650: physics::vapor_specific_volume(pressure)?,
            g54b4a4: get("0x54b19c")?,
        })
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct StartupHeatInputs {
    pub g54b120: f32,
    pub g54b134: f32,
    pub g54b740: f32,
    pub g54b744: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct StartupHeatOutput {
    pub g54b67c: f32,
    pub g54b680: f32,
}
impl StartupHeatInputs {
    /// Original 0x51b4ab–0x51b4fb: initialize both loop heat inputs, Btu/s.
    /// Loop shares are separate caller inputs; native code does not normalize.
    pub fn initialize(&self) -> Result<StartupHeatOutput> {
        if [self.g54b120, self.g54b134, self.g54b740, self.g54b744]
            .iter()
            .any(|v| !v.is_finite())
        {
            return Err("non-finite startup heat input".into());
        }
        let total = (f64::from(self.g54b134) + f64::from(self.g54b120))
            * f64::from(crate::bindings::HEAT_FACTOR);
        Ok(StartupHeatOutput {
            g54b67c: single(total * f64::from(self.g54b740))?,
            g54b680: single(total * f64::from(self.g54b744))?,
        })
    }
    pub fn from_model(model: &NativeSeed, share_a: f32, share_b: f32) -> Result<Self> {
        if model.source_table != "BasicData" {
            return Err("startup heat requires a BasicData model seed".into());
        }
        Ok(Self {
            g54b120: *model.globals.get("0x54b120").ok_or("missing POWER")?,
            g54b134: *model.globals.get("0x54b134").ok_or("missing QWMS")?,
            g54b740: share_a,
            g54b744: share_b,
        })
    }
}

/// Two authenticated fresh-start assignments; restored histories are separate.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PressureControlInitInputs {
    pub nominal_pressure: f32,
    pub liquid_level: f32,
}
#[derive(Clone, Debug, Serialize)]
pub struct PressureControlInitOutput {
    pub pressure_reference: f32,
    pub spray_level_percent: f32,
}
impl PressureControlInitInputs {
    pub fn initialize(&self) -> Result<PressureControlInitOutput> {
        if !self.nominal_pressure.is_finite() || !self.liquid_level.is_finite() {
            return Err("non-finite pressure-control initialization input".into());
        }
        Ok(PressureControlInitOutput {
            pressure_reference: self.nominal_pressure,
            spray_level_percent: single(f64::from(self.liquid_level) * 100.)?,
        })
    }
}
impl crate::native_globals::NativeGlobals {
    /// Fresh-start paths of 0x51afe0, not a substitute for restoring an IC.
    pub fn initialize_pressure_control(&mut self) -> Result<PressureControlInitOutput> {
        let out = PressureControlInitInputs {
            nominal_pressure: self.single(0x54b124)?,
            liquid_level: self.single(0x54b4a0)?,
        }
        .initialize()?;
        self.singles
            .insert("0x54ba4c".into(), out.pressure_reference);
        self.singles
            .insert("0x54b6c0".into(), out.spray_level_percent);
        Ok(out)
    }
}

/// Original initializer stores 0x51b2f7 and 0x51b303–0x51b351.
/// Twelve are integrator derivative inputs; the other two are native outputs.
/// These are CURRENT derivatives, not previous-derivative history.
pub const INITIAL_DERIVATIVE_OUTPUTS: [u32; 14] = [
    0x54b77c, 0x54b770, 0x54b784, 0x54b774, 0x54b788, 0x54b2ec, 0x54b7d0, 0x54b7d4, 0x54b7d8,
    0x54b7dc, 0x54b7e0, 0x54b7e4, 0x54b674, 0x54b7e8,
];
impl crate::native_globals::NativeGlobals {
    pub fn initialize_current_derivative_outputs(
        &mut self,
    ) -> std::collections::BTreeMap<String, f32> {
        let out = INITIAL_DERIVATIVE_OUTPUTS
            .into_iter()
            .map(|a| (format!("0x{a:x}"), 0.))
            .collect::<std::collections::BTreeMap<_, _>>();
        self.singles.extend(out.clone());
        out
    }
}

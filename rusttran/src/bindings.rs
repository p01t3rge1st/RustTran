//! Authenticated field reads and unit constants in the original executable.
//! These are partial seeds, not enough globals to run a complete plant step.
use crate::{Database, Result, Row};
use serde::Serialize;
use std::collections::BTreeMap;
/// Native write 0x51c370 to global 0x54b2fc. Preserve 14.504 even though
/// the source database labels pressure kg/cm² (the physical conversion differs).
pub const PRESSURE_FACTOR: f32 = f32::from_bits(0x41681062);
pub const TEMPERATURE_FACTOR: f32 = f32::from_bits(0x3fe66666);
pub const TEMPERATURE_OFFSET: f32 = f32::from_bits(0x42000000);
/// Original x87 constant initializer 0x51c326–0x51c41d: 3413000 / 3600.
pub const HEAT_FACTOR: f32 = f32::from_bits(0x446d038e);
/// Original constant initializer 0x51c310–0x51c320: Double -5e-7 stored as Single.
pub const NATIVE_G54B70C: f32 = f32::from_bits(0xb50637bd);
pub const PRESSURE_WORK: f32 = f32::from_bits(0x3e3d70a4);
fn single(value: f64) -> Result<f32> {
    let v = value as f32;
    if value.is_finite() && v.is_finite() {
        Ok(v)
    } else {
        Err("non-finite native field conversion".into())
    }
}
pub fn native_pressure(value: f64) -> Result<f32> {
    single(value * f64::from(PRESSURE_FACTOR))
}
pub fn native_temperature(value: f64) -> Result<f32> {
    single(value * f64::from(TEMPERATURE_FACTOR) + f64::from(TEMPERATURE_OFFSET))
}
#[derive(Debug, Serialize)]
pub struct NativeSeed {
    pub selection: String,
    pub source_table: String,
    pub globals: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    pub doubles: BTreeMap<String, f64>,
    pub curves: BTreeMap<String, [f32; 7]>,
}
fn field(row: &Row, name: &str) -> Result<f64> {
    Ok(row
        .get(name)
        .ok_or_else(|| format!("missing native seed field {name}"))?
        .parse()?)
}
pub struct FieldBinding {
    pub field: &'static str,
    pub address: u32,
    pub factor: f32,
    pub offset: f32,
    pub divide: bool,
    pub source_single: bool,
}
pub struct IntegerBinding {
    pub field: &'static str,
    pub address: u32,
    pub bits: u8,
}
include!("seed_bindings.rs");
pub enum NumberOpKind {
    Multiply,
    Divide,
    Add,
}
pub struct NumberOp {
    pub kind: NumberOpKind,
    pub constant: f64,
    pub constant_left: bool,
    pub single_result: bool,
}
pub struct ModelFieldBinding {
    pub field: &'static str,
    pub address: u32,
    pub source_single: bool,
    pub output_bits: u8,
    pub curve: &'static str,
    pub index: usize,
    pub operations: &'static [NumberOp],
}
include!("model_bindings.rs");
fn converted_model(row: &Row, binding: &ModelFieldBinding) -> Result<f64> {
    let raw = field(row, binding.field)?;
    let mut value = if binding.source_single {
        f64::from(single(raw)?)
    } else {
        raw
    };
    for operation in binding.operations {
        let (left, right) = if operation.constant_left {
            (operation.constant, value)
        } else {
            (value, operation.constant)
        };
        value = match operation.kind {
            NumberOpKind::Multiply => left * right,
            NumberOpKind::Divide => left / right,
            NumberOpKind::Add => left + right,
        };
        if !value.is_finite() {
            return Err("model numeric conversion failed".into());
        }
        if operation.single_result {
            value = f64::from(single(value)?);
        }
    }
    if binding.output_bits == 32 {
        Ok(f64::from(single(value)?))
    } else if value.is_finite() {
        Ok(value)
    } else {
        Err("non-finite Double model value".into())
    }
}
fn converted(row: &Row, binding: &FieldBinding) -> Result<f32> {
    let raw = field(row, binding.field)?;
    let value = if binding.source_single {
        f64::from(single(raw)?)
    } else {
        raw
    };
    let factor = f64::from(binding.factor);
    let intermediate = if binding.divide {
        value / factor
    } else {
        value * factor
    };
    let intermediate = if binding.source_single {
        f64::from(single(intermediate)?)
    } else {
        intermediate
    };
    single(if binding.offset == 0. {
        intermediate
    } else {
        intermediate + f64::from(binding.offset)
    })
}
impl NativeSeed {
    pub fn condition(database: &Database, id: &str) -> Result<Self> {
        let table = database.table("ICThermoData")?.matching("IC", id)?;
        if table.rows.len() != 1 {
            return Err(format!("expected one condition row for IC {id}").into());
        }
        let row = &table.rows[0];
        let mut globals = BTreeMap::new();
        for binding in IC_BINDINGS {
            globals.insert(format!("{:#x}", binding.address), converted(row, binding)?);
        }
        let mut integers = BTreeMap::new();
        for binding in IC_INTEGER_BINDINGS {
            let value: i32 = row
                .get(binding.field)
                .ok_or_else(|| format!("missing integer field {}", binding.field))?
                .parse()?;
            if binding.bits == 16 {
                i16::try_from(value)?;
            }
            integers.insert(format!("{:#x}", binding.address), value);
        }
        Ok(Self {
            selection: id.into(),
            source_table: "ICThermoData".into(),
            globals,
            integers,
            doubles: BTreeMap::new(),
            curves: BTreeMap::new(),
        })
    }
    pub fn model(database: &Database, id: &str) -> Result<Self> {
        let table = database.parameters(id)?;
        if table.rows.len() != 1 {
            return Err(format!("expected one model row for SET {id}").into());
        }
        let row = &table.rows[0];
        let mut globals = BTreeMap::new();
        let mut doubles = BTreeMap::new();
        let mut curves = BTreeMap::new();
        for binding in MODEL_BINDINGS {
            let value = converted_model(row, binding)?;
            let address = format!("{:#x}", binding.address);
            if !binding.curve.is_empty() {
                curves.entry(binding.curve.into()).or_insert([0.; 7])[binding.index] = value as f32;
            } else if binding.output_bits == 64 {
                doubles.insert(address, value);
            } else {
                globals.insert(address, value as f32);
            }
        }
        Ok(Self {
            selection: id.into(),
            source_table: "BasicData".into(),
            globals,
            integers: BTreeMap::new(),
            doubles,
            curves,
        })
    }
}

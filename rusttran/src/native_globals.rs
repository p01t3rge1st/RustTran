//! Partial native global store for connecting recovered calculations.
//! Missing operands are errors; this is not a complete plant initializer.
use crate::{
    Result,
    bindings::NativeSeed,
    loop_transfer::{LoopTransferInputs, LoopTransferOutput},
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Default, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct NativeGlobals {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
}
#[derive(Clone, Copy, Debug, Serialize, Deserialize)]
pub enum LoopSide {
    A,
    B,
}
pub const LOOP_A_ARGUMENTS: [u32; 29] = [
    0x54b6b8, 0x54b4fc, 0x54b4b0, 0x54b838, 0x54b84c, 0x54b12c, 0x54b530, 0x54b41c, 0x54b844,
    0x54b560, 0x54b740, 0x54b67c, 0x54b4cc, 0x54b4c4, 0x54b1f8, 0x54b214, 0x54b854, 0x54b218,
    0x54b40c, 0, 0x54b538, 0x54b528, 0x54ba68, 0x54b4e2, 0x54b1a4, 0x54b498, 0x54b4f4, 0x54b1cc,
    0x54b4de,
];
pub const LOOP_B_ARGUMENTS: [u32; 29] = [
    0x54b6bc, 0x54b500, 0x54b4b0, 0x54b838, 0x54b84c, 0x54b12c, 0x54b534, 0x54b41c, 0x54b848,
    0x54b564, 0x54b744, 0x54b680, 0x54b4cc, 0x54b4c8, 0x54b1f8, 0x54b214, 0x54b854, 0x54b218,
    0x54b40c, 0, 0x54b538, 0x54b52c, 0x54ba68, 0x54b4e4, 0x54b1a4, 0x54b498, 0x54b4f8, 0x54b1cc, 0,
];
fn key(address: u32) -> String {
    format!("0x{address:x}")
}
impl NativeGlobals {
    /// Overlay only the authenticated scalar/flag seeds. Curves and Double
    /// model fields remain in NativeSeed; uncomputed globals are not invented.
    pub fn from_seeds(model: &NativeSeed, condition: &NativeSeed) -> Result<Self> {
        if model.source_table != "BasicData" || condition.source_table != "ICThermoData" {
            return Err("native globals require model and condition seeds".into());
        }
        let mut out = Self::default();
        out.singles.extend(model.globals.clone());
        out.singles.extend(condition.globals.clone());
        out.integers.extend(model.integers.clone());
        out.integers.extend(condition.integers.clone());
        Ok(out)
    }
    pub fn single(&self, address: u32) -> Result<f32> {
        let value = *self
            .singles
            .get(&key(address))
            .ok_or_else(|| format!("uncomputed native global {}", key(address)))?;
        if !value.is_finite() {
            return Err(format!("non-finite native global {}", key(address)).into());
        }
        Ok(value)
    }
    pub fn integer(&self, address: u32) -> Result<i16> {
        let value = *self
            .integers
            .get(&key(address))
            .ok_or_else(|| format!("missing native flag {}", key(address)))?;
        Ok(i16::try_from(value)?)
    }
    pub fn loop_b_count(&self) -> Result<i16> {
        let value = (f64::from(self.single(0x54b204)?) - f64::from(self.integer(0x54b4de)?))
            .round_ties_even();
        if value < f64::from(i16::MIN) || value > f64::from(i16::MAX) {
            return Err("native loop-B count overflow".into());
        }
        Ok(value as i16)
    }
    pub fn loop_transfer_inputs(
        &self,
        side: LoopSide,
        failure_time: f32,
    ) -> Result<LoopTransferInputs> {
        let addresses = match side {
            LoopSide::A => LOOP_A_ARGUMENTS,
            LoopSide::B => LOOP_B_ARGUMENTS,
        };
        let get = |offset: usize| self.single(addresses[(offset - 8) / 4]);
        let count = match side {
            LoopSide::A => self.integer(0x54b4de)?,
            LoopSide::B => self.loop_b_count()?,
        };
        if !failure_time.is_finite() {
            return Err("non-finite failure time".into());
        }
        Ok(LoopTransferInputs {
            p0c: get(0x0c)?,
            p10: get(0x10)?,
            p14: get(0x14)?,
            p18: get(0x18)?,
            p1c: get(0x1c)?,
            p20: get(0x20)?,
            p24: get(0x24)?,
            p2c: get(0x2c)?,
            p30: get(0x30)?,
            p38: get(0x38)?,
            p3c: get(0x3c)?,
            p40: get(0x40)?,
            p44: get(0x44)?,
            p48: get(0x48)?,
            p4c: get(0x4c)?,
            p50: get(0x50)?,
            p54: failure_time,
            p58: get(0x58)?,
            p5c: get(0x5c)?,
            p60: get(0x60)?,
            p64: self.integer(addresses[(0x64 - 8) / 4])?,
            p68: get(0x68)?,
            p6c: get(0x6c)?,
            p70: get(0x70)?,
            p74: get(0x74)?,
            p78: count,
            g54b768: self.single(0x54b768)?,
        })
    }
    /// Calculate then commit all four native outputs atomically. Error paths
    /// leave the global store intact; no event/UI side effects are synthesized.
    pub fn advance_loop_transfer(
        &mut self,
        side: LoopSide,
        failure_time: f32,
    ) -> Result<LoopTransferOutput> {
        let result = self.loop_transfer_inputs(side, failure_time)?.calculate()?;
        let addresses = match side {
            LoopSide::A => LOOP_A_ARGUMENTS,
            LoopSide::B => LOOP_B_ARGUMENTS,
        };
        for (offset, value) in [
            (8, result.p08),
            (0x28, result.p28),
            (0x34, result.p34),
            (0x3c, result.p3c),
        ] {
            self.singles.insert(key(addresses[(offset - 8) / 4]), value);
        }
        Ok(result)
    }
}

fn checked_single(value: f64) -> Result<f32> {
    let value = value as f32;
    if value.is_finite() {
        Ok(value)
    } else {
        Err("native loop-reference overflow".into())
    }
}
impl NativeGlobals {
    /// Recovered common loop-reference prefixes from 0x51afe0. This computes
    /// reference temperatures/properties and transport coefficients, without
    /// replacing live IC pressures/levels or resetting plant/event state.
    pub fn initialize_loop_reference(&mut self) -> Result<BTreeMap<String, f32>> {
        let get = |address| -> Result<f64> { Ok(f64::from(self.single(address)?)) };
        let total = get(0x54b204)?;
        let count = f64::from(self.integer(0x54b4de)?);
        let t0 = get(0x54b128)?;
        let tfw = get(0x54b1a8)?;
        let power = get(0x54b41c)?;
        let level = get(0x54b1f8)?;
        let low = get(0x54b1cc)?;
        if total == 0. || level == low {
            return Err("invalid loop-reference count or level interval".into());
        }
        let mut values = BTreeMap::new();
        let mut put = |address, value| {
            values.insert(key(address), value);
        };
        put(0x54b740, checked_single(count / total)?);
        put(0x54b744, checked_single((total - count) / total)?);
        let temperature = checked_single((t0 - tfw) * power + tfw)?;
        put(0x54b758, temperature);
        put(0x54b75c, temperature);
        // The original pushes TFW at 0x51b19c before the 0x51b293 PSAT call.
        let base = crate::physics::saturation_pressure(tfw as f32)?;
        put(0x54b4c0, base);
        put(
            0x54b760,
            crate::physics::saturation_temperature(self.single(0x54b1fc)?)?,
        );
        let pressure =
            checked_single((get(0x54b1fc)? - f64::from(base)) * power + f64::from(base))?;
        put(0x54b764, pressure);
        let vf = crate::physics::vfld(pressure)?;
        put(0x54b768, vf);
        put(0x54b76c, crate::physics::vapor_specific_volume(pressure)?);
        put(0x54b838, checked_single(get(0x54b4b0)? / 30.)?);
        put(0x54b848, self.single(0x54b518)?);
        put(0x54b84c, self.single(0x54b514)?);
        put(
            0x54b808,
            checked_single((get(0x54b2a0)? - tfw) * power + tfw)?,
        );
        put(0x54b850, checked_single(t0 - tfw)?);
        put(
            0x54b854,
            checked_single(
                f64::from(vf) / (level - low) * (get(0x54b1a4)? - get(0x54b4cc)? * total) / total,
            )?,
        );
        self.singles.extend(values.clone());
        Ok(values)
    }
    /// Missing live/reference inputs for this recovered calculation only.
    /// Failure time is a separate argument. No zeros are supplied for absences.
    pub fn missing_loop_transfer_inputs(&self, side: LoopSide) -> Vec<String> {
        let addresses = match side {
            LoopSide::A => LOOP_A_ARGUMENTS,
            LoopSide::B => LOOP_B_ARGUMENTS,
        };
        let mut missing = std::collections::BTreeSet::new();
        for (index, address) in addresses.into_iter().enumerate() {
            if [0, 8, 11, 19, 28].contains(&index) {
                continue;
            }
            let present = if index == 23 {
                self.integers.contains_key(&key(address))
            } else {
                self.singles.contains_key(&key(address))
            };
            if !present {
                missing.insert(key(address));
            }
        }
        if !self.singles.contains_key("0x54b768") {
            missing.insert("0x54b768".into());
        }
        if !self.integers.contains_key("0x54b4de") {
            missing.insert("0x54b4de".into());
        }
        if matches!(side, LoopSide::B) && !self.singles.contains_key("0x54b204") {
            missing.insert("0x54b204".into());
        }
        missing.into_iter().collect()
    }
}

impl NativeGlobals {
    pub fn prepare_primary_properties(&mut self) -> Result<BTreeMap<String, f32>> {
        let result = crate::primary_properties::PrimaryPropertiesInputs {
            pressure: self.single(0x54b494)?,
        }
        .calculate()?;
        self.singles.extend(result.clone());
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn initialize_thermal_driving(&mut self) -> Result<f32> {
        let value = crate::thermal_driving::initialize_coefficient(
            crate::bindings::HEAT_FACTOR,
            self.single(0x54b120)?,
            self.single(0x54b2a0)?,
            self.single(0x54b128)?,
        )?;
        self.singles
            .insert("0x54b330".into(), crate::bindings::HEAT_FACTOR);
        self.singles.insert("0x54b6fc".into(), value);
        Ok(value)
    }
    pub fn prepare_normal_thermal_driving(&mut self) -> Result<BTreeMap<String, f32>> {
        let values = crate::thermal_driving::ThermalDrivingInputs {
            g54b558: self.single(0x54b558)?,
            g54b120: self.single(0x54b120)?,
            g54b41c: self.single(0x54b41c)?,
            g54b330: self.single(0x54b330)?,
            g54b550: self.single(0x54b550)?,
            g54b498: self.single(0x54b498)?,
            g54b6fc: self.single(0x54b6fc)?,
        }
        .calculate()?;
        self.singles.extend(values.clone());
        Ok(values)
    }
    /// Explicitly selected normal branch, not the original event dispatcher.
    /// Both loops use a staged store so any failure preserves all prior globals.
    pub fn advance_normal_loops(
        &mut self,
        clock: f32,
        failure_times: [f32; 2],
    ) -> Result<[crate::loop_transfer::LoopTransferOutput; 2]> {
        if !clock.is_finite() {
            return Err("invalid loop clock".into());
        }
        let mut staged = self.clone();
        staged.singles.insert("0x54b40c".into(), clock);
        staged.prepare_normal_thermal_driving()?;
        let a = staged.advance_loop_transfer(LoopSide::A, failure_times[0])?;
        let b = staged.advance_loop_transfer(LoopSide::B, failure_times[1])?;
        *self = staged;
        Ok([a, b])
    }
}

// Recovered 42-argument caller bindings for 0x508960; zero marks a local pointer.
pub const STEAM_A_ARGUMENTS: [u32; 42] = [
    0x54b4fc, 0x54b414, 0x54b850, 0x54b40c, 0, 0x54b538, 0x54b528, 0x54b844, 0x54b818, 0x54ba8c,
    0x54bbb0, 0x54b50c, 0x54b41c, 0x54ba78, 0x54b484, 0x54b4d4, 0x54b4d2, 0x54b4c0, 0x54b6c8,
    0x54ba70, 0x54b7e0, 0x54ba7c, 0x54b504, 0x54b514, 0x54b560, 0x54ba90, 0x54b7d8, 0x54b7d0,
    0x54b4f4, 0, 0x54b188, 0x54ba98, 0x54baa4, 0x54b4ec, 0x54ba9c, 0x54b67c, 0x54b680, 0, 0x54b874,
    0x54b740, 0x54b51c, 0x54bf84,
];
pub const STEAM_B_ARGUMENTS: [u32; 42] = [
    0x54b500, 0x54b414, 0x54b850, 0x54b40c, 0, 0x54b538, 0x54b52c, 0x54b848, 0x54b818, 0x54ba8c,
    0x54bbb0, 0x54b510, 0x54b41c, 0x54ba78, 0x54b484, 0x54b4d4, 0x54b4d2, 0x54b4c0, 0x54b6cc, 0,
    0x54b7e4, 0x54ba7c, 0x54b508, 0x54b518, 0x54b564, 0x54ba94, 0x54b7dc, 0x54b7d4, 0x54b4f8, 0,
    0x54b188, 0x54baa0, 0x54baa8, 0x54b4ec, 0x54baac, 0x54b67c, 0x54b680, 0, 0x54b878, 0x54b744,
    0x54b520, 0,
];

impl NativeGlobals {
    pub(crate) fn steam_addresses(side: LoopSide) -> [u32; 42] {
        match side {
            LoopSide::A => STEAM_A_ARGUMENTS,
            LoopSide::B => STEAM_B_ARGUMENTS,
        }
    }
    pub fn advance_feedwater_pi(
        &mut self,
        side: LoopSide,
        fault_flag: i16,
        phase_flag: i16,
    ) -> Result<crate::feedwater_control::FeedwaterPiOutput> {
        let addresses = Self::steam_addresses(side);
        let get = |offset: usize| self.single(addresses[(offset - 8) / 4]);
        let scale = get(0x1c)?;
        let share = get(0xa4)?;
        let gain = (f64::from(self.single(0x54b208)?) * f64::from(share) * f64::from(scale)) as f32;
        let capacity = (f64::from(self.single(0x54b18c)?)
            * f64::from(scale)
            * f64::from(share)
            * f64::from(get(0x38)?)) as f32;
        let result = crate::feedwater_control::FeedwaterPiInputs {
            pressure: get(8)?,
            target: get(0x34)?,
            pressure_band: get(0x4c)?,
            capacity,
            gain,
            step: get(0xc)?,
            output: get(0x90)?,
            previous_error: get(0x84)?,
            scale,
            ratio: get(0x28)?,
            heat_a: get(0x94)?,
            heat_b: get(0x98)?,
            fault_flag,
            phase_flag,
        }
        .advance()?;
        for (offset, value) in [
            (0x90, result.output),
            (0x84, result.previous_error),
            (0xa8, result.heat_partition),
        ] {
            self.singles.insert(key(addresses[(offset - 8) / 4]), value);
        }
        Ok(result)
    }
    pub fn advance_steam_exchange(
        &mut self,
        side: LoopSide,
        phase_flag: i16,
    ) -> Result<crate::steam_generator::SteamGeneratorOutput> {
        let addresses = Self::steam_addresses(side);
        let get = |offset: usize| self.single(addresses[(offset - 8) / 4]);
        let result = crate::steam_generator::SteamGeneratorInputs {
            pressure: get(8)?,
            pressure_floor: self.single(0x54b544)?,
            fraction: get(0x60)?,
            inflow_a: get(0x20)?,
            inflow_b: get(0x50)?,
            enthalpy_a: self.single(0x54b718)?,
            enthalpy_b: self.single(0x54b734)?,
            outflow: get(0x68)?,
            volume: get(0x80)?,
            share: get(0xa4)?,
            heat_a: get(0x94)?,
            heat_b: get(0x98)?,
            phase_flag,
            pressure_work: self.single(0x54b334)?,
        }
        .derivatives()?;
        for (offset, value) in [
            (8, result.pressure),
            (0x68, result.outflow),
            (0x74, result.fraction_derivative),
            (0x70, result.pressure_derivative),
            (0x58, result.inventory_derivative),
        ] {
            self.singles.insert(key(addresses[(offset - 8) / 4]), value);
        }
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn prepare_primary_exchange(
        &mut self,
        fault_flag: i16,
        pump_contributions: [f32; 2],
    ) -> Result<crate::primary_exchange::PrimaryExchangeOutput> {
        let result = crate::primary_exchange::PrimaryExchangeInputs {
            g54b684: self.single(0x54b684)?,
            g54b730: self.single(0x54b730)?,
            g54b67c: self.single(0x54b67c)?,
            g54b680: self.single(0x54b680)?,
            g54b530: self.single(0x54b530)?,
            g54b534: self.single(0x54b534)?,
            g54b734: self.single(0x54b734)?,
            g54b134: self.single(0x54b134)?,
            g54b120: self.single(0x54b120)?,
            g54ba68: self.single(0x54ba68)?,
            g54b330: self.single(0x54b330)?,
            g54b6e0: self.single(0x54b6e0)?,
            g54b724: self.single(0x54b724)?,
            g54b728: self.single(0x54b728)?,
            g54b688: self.single(0x54b688)?,
            g54b720: self.single(0x54b720)?,
            g54b71c: self.single(0x54b71c)?,
            g54b64c: self.single(0x54b64c)?,
            g54b650: self.single(0x54b650)?,
            g54b334: self.single(0x54b334)?,
            g54b4e2: self.integer(0x54b4e2)?,
            g54b4e4: self.integer(0x54b4e4)?,
            fault_flag,
            pump_contributions,
        }
        .calculate()?;
        self.singles.extend(result.globals.clone());
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn advance_rcp_pair(&mut self, trip_time: f32) -> Result<crate::pumps::PumpPairOutput> {
        let result = crate::pumps::PumpPairInputs {
            flows: [self.single(0x54b530)?, self.single(0x54b534)?],
            targets: [self.single(0x54b83c)?, self.single(0x54b840)?],
            shares: [self.single(0x54b740)?, self.single(0x54b744)?],
            step: self.single(0x54b414)?,
            time_constant: self.single(0x54b130)?,
            base_flow: self.single(0x54b12c)?,
            volume_factor: self.single(0x54b860)?,
            specific_volume: self.single(0x54b654)?,
            void_fraction: self.single(0x54ba34)?,
            last_change_a: self.single(0x54b42c)?,
            trip_time,
        }
        .advance()?;
        self.singles.insert("0x54b530".into(), result.loops[0].flow);
        self.singles.insert("0x54b534".into(), result.loops[1].flow);
        self.singles.insert("0x54ba34".into(), result.void_fraction);
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn prepare_primary_liquid(&mut self) -> Result<BTreeMap<String, f32>> {
        let values = crate::primary_properties::PrimaryLiquidInputs {
            pressure: self.single(0x54b494)?,
            temperature: self.single(0x54b49c)?,
        }
        .calculate()?;
        self.singles.extend(values.clone());
        Ok(values)
    }
}

impl NativeGlobals {
    pub fn prepare_primary_inventory(
        &mut self,
        command_percent: i16,
        local_84: f32,
    ) -> Result<crate::primary_inventory::PrimaryInventoryOutput> {
        let result = crate::primary_inventory::PrimaryInventoryInputs {
            g54b6d8: self.single(0x54b6d8)?,
            g54b6c8: self.single(0x54b6c8)?,
            g54b6a4: self.single(0x54b6a4)?,
            g54b6cc: self.single(0x54b6cc)?,
            g54b6b0: self.single(0x54b6b0)?,
            g54b6c4: self.single(0x54b6c4)?,
            g54b4ac: self.single(0x54b4ac)?,
            g54b414: self.single(0x54b414)?,
            g54bb38: self.single(0x54bb38)?,
            g54b70c: self.single(0x54b70c)?,
            g54b4a8: self.single(0x54b4a8)?,
            g54b334: self.single(0x54b334)?,
            g54b730: self.single(0x54b730)?,
            g54b2f8: self.single(0x54b2f8)?,
            g54b1ac: self.single(0x54b1ac)?,
            command_percent,
            local_84,
        }
        .advance()?;
        self.singles.insert("0x54bb38".into(), result.g54bb38);
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn prepare_normal_primary_phase(
        &mut self,
        local_20: f32,
        local_54: f32,
        local_b0: f32,
    ) -> Result<crate::normal_primary_phase::NormalPrimaryPhaseOutput> {
        let result = crate::normal_primary_phase::NormalPrimaryPhaseInputs {
            g54b688: self.single(0x54b688)?,
            g54b728: self.single(0x54b728)?,
            g54b724: self.single(0x54b724)?,
            g54b4ac: self.single(0x54b4ac)?,
            g54b73c: self.single(0x54b73c)?,
            g54b6a8: self.single(0x54b6a8)?,
            g54b7f0: self.single(0x54b7f0)?,
            g54b64c: self.single(0x54b64c)?,
            g54b650: self.single(0x54b650)?,
            g54b788: self.single(0x54b788)?,
            g54b334: self.single(0x54b334)?,
            g54b494: self.single(0x54b494)?,
            g54b49c: self.single(0x54b49c)?,
            g54b7ec: self.single(0x54b7ec)?,
            g54b4a4: self.single(0x54b4a4)?,
            g54b19c: self.single(0x54b19c)?,
            local_20,
            local_54,
            local_b0,
            g54b4d6: self.integer(0x54b4d6)?,
            g54b4d8: self.integer(0x54b4d8)?,
        }
        .calculate()?;
        self.singles.extend(result.globals.clone());
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn prepare_primary_phase(
        &mut self,
        locals: &crate::primary_phase::PrimaryPhaseLocals,
    ) -> Result<crate::primary_phase::PrimaryPhaseOutput> {
        let result = crate::primary_phase::PrimaryPhaseInputs {
            g54b688: self.single(0x54b688)?,
            g54b728: self.single(0x54b728)?,
            g54b724: self.single(0x54b724)?,
            g54b4ac: self.single(0x54b4ac)?,
            g54b73c: self.single(0x54b73c)?,
            g54b6a8: self.single(0x54b6a8)?,
            g54b7f0: self.single(0x54b7f0)?,
            g54b64c: self.single(0x54b64c)?,
            g54b650: self.single(0x54b650)?,
            g54b788: self.single(0x54b788)?,
            g54b334: self.single(0x54b334)?,
            g54b494: self.single(0x54b494)?,
            g54b49c: self.single(0x54b49c)?,
            g54b7ec: self.single(0x54b7ec)?,
            g54b4a4: self.single(0x54b4a4)?,
            g54b19c: self.single(0x54b19c)?,
            local_20: locals.local_20,
            local_54: locals.local_54,
            local_b0: locals.local_b0,
            g54b4d6: self.integer(0x54b4d6)?,
            g54b4d8: self.integer(0x54b4d8)?,
            g54b690: self.single(0x54b690)?,
            g54b734: self.single(0x54b734)?,
            g54b72c: self.single(0x54b72c)?,
            g54b678: self.single(0x54b678)?,
            g54b2f8: self.single(0x54b2f8)?,
            g54b1ac: self.single(0x54b1ac)?,
            g54b778: self.single(0x54b778)?,
            g54b6c4: self.single(0x54b6c4)?,
            g54b6c8: self.single(0x54b6c8)?,
            g54b6cc: self.single(0x54b6cc)?,
            g54b6b0: self.single(0x54b6b0)?,
            g54b6d8: self.single(0x54b6d8)?,
            g54b668: self.single(0x54b668)?,
            g54b3fc: self.single(0x54b3fc)?,
            g54b404: self.single(0x54b404)?,
            local_4c: locals.local_4c,
            local_40: locals.local_40,
            local_58: locals.local_58,
            local_ac: locals.local_ac,
            local_78: locals.local_78,
        }
        .calculate()?;
        self.singles.extend(result.globals.clone());
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn prepare_primary_phase_state(
        &mut self,
        local_ac: f32,
    ) -> Result<crate::primary_phase_state::PrimaryPhaseStateOutput> {
        let result = crate::primary_phase_state::PrimaryPhaseStateInputs {
            g54b688: self.single(0x54b688)?,
            g54b4a4: self.single(0x54b4a4)?,
            g54b19c: self.single(0x54b19c)?,
            g54b1a0: self.single(0x54b1a0)?,
            g54b7ec: self.single(0x54b7ec)?,
            g54b4a8: self.single(0x54b4a8)?,
            g54bb38: self.single(0x54bb38)?,
            g54b7f0: self.single(0x54b7f0)?,
            g54b654: self.single(0x54b654)?,
            g54b650: self.single(0x54b650)?,
            g54b64c: self.single(0x54b64c)?,
            g54b4a0: self.single(0x54b4a0)?,
            g54b4ac: self.single(0x54b4ac)?,
            g54b6c4: self.single(0x54b6c4)?,
            g54b6a8: self.single(0x54b6a8)?,
            g54b414: self.single(0x54b414)?,
            g54b494: self.single(0x54b494)?,
            g54b544: self.single(0x54b544)?,
            g54b684: self.single(0x54b684)?,
            local_ac,
            g54b4d6: self.integer(0x54b4d6)?,
            g54b4d8: self.integer(0x54b4d8)?,
        }
        .calculate()?;
        self.singles.extend(result.globals.clone());
        self.integers
            .extend(result.flags.iter().map(|(a, v)| (a.clone(), i32::from(*v))));
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn prepare_primary_flow(&mut self) -> Result<crate::primary_flow::PrimaryFlowOutput> {
        let result = crate::primary_flow::PrimaryFlowInputs {
            g54b494: self.single(0x54b494)?,
            g54b684: self.single(0x54b684)?,
            g54b64c: self.single(0x54b64c)?,
            g54bab0: self.single(0x54bab0)?,
            g54b544: self.single(0x54b544)?,
            g54b2e0: self.single(0x54b2e0)?,
            g54b66c: self.single(0x54b66c)?,
            g54b670: self.single(0x54b670)?,
            g54ba34: self.single(0x54ba34)?,
            g54b728: self.single(0x54b728)?,
            g54b724: self.single(0x54b724)?,
            g54b4a4: self.single(0x54b4a4)?,
            g54b688: self.single(0x54b688)?,
            g54b650: self.single(0x54b650)?,
            g54b4ea: self.integer(0x54b4ea)?,
        }
        .calculate()?;
        self.singles.extend(result.globals.clone());
        self.integers
            .insert("0x54b4ea".into(), i32::from(result.g54b4ea));
        Ok(result)
    }
}

impl NativeGlobals {
    pub fn prepare_primary_heat_capacity(&mut self) -> Result<BTreeMap<String, f32>> {
        let values = crate::primary_properties::PrimaryHeatCapacityInputs {
            pressure: self.single(0x54b494)?,
            temperature: self.single(0x54b49c)?,
        }
        .calculate()?;
        self.singles.extend(values.clone());
        Ok(values)
    }
}

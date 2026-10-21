//! Connected primary numerical core with explicit GUI command, pump heat and
//! optional recovered spray/heater controls. This is not the complete plant dispatcher.
use crate::{
    Result,
    balance::{BalanceInputs, PressureBalanceInputs, VolumeBalanceInputs},
    native_globals::NativeGlobals,
    primary_phase::PrimaryPhaseLocals,
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
pub const CORE_OUTPUTS: &[u32] = &[
    0x54b690, 0x54b730, 0x54b734, 0x54b6e4, 0x54b6e8, 0x54bab0, 0x54b678, 0x54bad8, 0x54bb38,
    0x54b788, 0x54b688, 0x54b4a4, 0x54b7ec, 0x54b4a8, 0x54b7f0, 0x54b494, 0x54b668, 0x54b66c,
    0x54b670, 0x54b6a4, 0x54b498, 0x54b49c, 0x54b4a0, 0x54b684, 0x54b654, 0x54b77c, 0x54b774,
    0x54b770, 0x54b784,
];
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PrimaryCoreRequest {
    pub globals: NativeGlobals,
    pub command_percent: i16,
    pub fault_flag: i16,
    pub pump_contributions: [f32; 2],
    #[serde(default)]
    pub heater_controls: Option<crate::heaters::HeaterControls>,
    #[serde(default)]
    pub spray_controls: Option<crate::spray::SprayControls>,
}
#[derive(Clone, Debug, Serialize)]
pub struct PrimaryCoreOutput {
    pub singles: BTreeMap<String, f32>,
    pub integers: BTreeMap<String, i32>,
    #[serde(skip)]
    pub heater_commands: Option<crate::heaters::HeaterControls>,
    #[serde(skip)]
    pub spray_commands: Option<crate::spray::SprayControls>,
}
impl NativeGlobals {
    pub fn advance_primary_core(
        &mut self,
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
    ) -> Result<PrimaryCoreOutput> {
        self.advance_primary_core_with_heaters(
            command_percent,
            fault_flag,
            pump_contributions,
            None,
        )
    }
    /// Run heaters after the phase update, before the final energy correction.
    /// The upstream spray/control signal remains an explicitly prepared state.
    pub fn advance_primary_core_with_heaters(
        &mut self,
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
        heater_controls: Option<&crate::heaters::HeaterControls>,
    ) -> Result<PrimaryCoreOutput> {
        self.advance_primary_core_with_controls(
            command_percent,
            fault_flag,
            pump_contributions,
            heater_controls,
            None,
        )
    }
    /// Spray control and heaters run in original order before energy correction.
    pub fn advance_primary_core_with_controls(
        &mut self,
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
        heater_controls: Option<&crate::heaters::HeaterControls>,
        spray_controls: Option<&crate::spray::SprayControls>,
    ) -> Result<PrimaryCoreOutput> {
        self.advance_primary_core_inner(
            command_percent,
            fault_flag,
            pump_contributions,
            heater_controls,
            spray_controls,
            false,
        )
    }
    /// Connected pressure signal, primary controls/balance and post-balance
    /// feedback. Upstream component states remain explicit; no integration.
    pub fn advance_primary_control_cycle(
        &mut self,
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
        heaters: &crate::heaters::HeaterControls,
        spray: &crate::spray::SprayControls,
    ) -> Result<PrimaryCoreOutput> {
        let mut staged = self.clone();
        staged.prepare_pressure_control_signal()?;
        let mut out = staged.advance_primary_core_inner(
            command_percent,
            fault_flag,
            pump_contributions,
            Some(heaters),
            Some(spray),
            true,
        )?;
        out.singles
            .insert("0x54b6d0".into(), staged.single(0x54b6d0)?);
        *self = staged;
        Ok(out)
    }
    fn advance_primary_core_inner(
        &mut self,
        command_percent: i16,
        fault_flag: i16,
        pump_contributions: [f32; 2],
        heater_controls: Option<&crate::heaters::HeaterControls>,
        spray_controls: Option<&crate::spray::SprayControls>,
        finalize_feedback: bool,
    ) -> Result<PrimaryCoreOutput> {
        let mut g = self.clone();
        g.prepare_primary_heat_capacity()?;
        let exchange = g.prepare_primary_exchange(fault_flag, pump_contributions)?;
        let inventory = g.prepare_primary_inventory(command_percent, exchange.trace.local_84)?;
        let volume = VolumeBalanceInputs {
            g54b4ac: g.single(0x54b4ac)?,
            g54b654: g.single(0x54b654)?,
            g54b734: g.single(0x54b734)?,
            g54b728: g.single(0x54b728)?,
            g54b4d8: g.integer(0x54b4d8)?,
        }
        .derivatives()?;
        g.singles.insert("0x54b788".into(), volume.g54b788);
        let phase_state = g.prepare_primary_phase_state(inventory.local_ac)?;
        // Original frame writes at 0x50af64/67/6a/6d explicitly initialize
        // these locals to zero. The early phase exits bypass their assignment.
        let mut local_54 = 0.;
        let mut local_40 = 0.;
        let mut local_4c = 0.;
        let mut local_58 = 0.;
        if phase_state.continue_flow_preparation {
            let flow = g.prepare_primary_flow()?;
            local_54 = flow.trace.local_54;
            local_40 = flow.trace.local_40;
            local_4c = flow.trace.local_4c;
            local_58 = flow.trace.local_58;
        }
        let phase = g.prepare_primary_phase(&PrimaryPhaseLocals {
            local_20: volume.local_20,
            local_54,
            local_b0: exchange.trace.local_b0,
            local_4c,
            local_40,
            local_58,
            local_ac: inventory.local_ac,
            local_78: exchange.trace.local_78,
        })?;
        // Late 0x50c587–0x50c5ac updates PSAT/VLIQ only; HLIQ remains the
        // early value even if the phase branch changes live temperature.
        let saturation = crate::physics::saturation_pressure(g.single(0x54b49c)?)?;
        let specific =
            crate::physics::liquid_specific_volume(g.single(0x54b494)?, g.single(0x54b49c)?)?;
        g.singles.insert("0x54b684".into(), saturation);
        g.singles.insert("0x54b654".into(), specific);
        let mut spray_commands = spray_controls.cloned();
        let mut heater_commands = heater_controls.cloned();
        if let Some(controls) = &mut spray_commands {
            controls.spray_percent = g.prepare_spray(controls)?.spray_percent;
        }
        if let Some(controls) = &mut heater_commands {
            let out = g.prepare_heaters(controls)?;
            controls.proportional_percent = out.proportional_percent;
            controls.backup_percent = out.backup_percent;
        }
        let correction = crate::primary_correction::PrimaryCorrectionInputs {
            g54b6e4: g.single(0x54b6e4)?,
            g54b730: g.single(0x54b730)?,
            g54b734: g.single(0x54b734)?,
            g54b688: g.single(0x54b688)?,
            g54b64c: g.single(0x54b64c)?,
            g54b650: g.single(0x54b650)?,
            g54b6d8: g.single(0x54b6d8)?,
            g54b7f0: g.single(0x54b7f0)?,
            g54b6dc: g.single(0x54b6dc)?,
            local_88: phase.trace.local_88,
            local_a4: phase.trace.local_a4,
            local_8c: phase.trace.local_8c,
        }
        .calculate()?;
        let pressure = PressureBalanceInputs {
            g54b650: g.single(0x54b650)?,
            g54b64c: g.single(0x54b64c)?,
            g54b7f0: g.single(0x54b7f0)?,
            g54b688: g.single(0x54b688)?,
            g54b65c: g.single(0x54b65c)?,
            g54b658: g.single(0x54b658)?,
            local_98: phase.trace.local_98,
            local_88: correction.local_88,
            local_a4: correction.local_a4,
            g54bad8: g.single(0x54bad8)?,
            g54b4a0: g.single(0x54b4a0)?,
            g54b6a8: g.single(0x54b6a8)?,
            local_ac: phase.trace.local_ac,
            g54b6c4: g.single(0x54b6c4)?,
            g54b4ac: g.single(0x54b4ac)?,
            g54b4a4: g.single(0x54b4a4)?,
            g54b654: g.single(0x54b654)?,
            g54b1a0: g.single(0x54b1a0)?,
            g54b19c: g.single(0x54b19c)?,
            g54b70c: g.single(0x54b70c)?,
        }
        .derivatives()?;
        g.singles.insert("0x54b77c".into(), pressure.g54b77c);
        g.singles.insert("0x54b774".into(), pressure.g54b774);
        let balance = BalanceInputs {
            local_20: volume.local_20,
            g54b734: g.single(0x54b734)?,
            g54b4ac: g.single(0x54b4ac)?,
            g54b72c: g.single(0x54b72c)?,
            g54b6c4: g.single(0x54b6c4)?,
            local_78: phase.trace.local_78,
            local_ac: phase.trace.local_ac,
            g54b678: g.single(0x54b678)?,
            local_48: inventory.local_48,
            g54b774: pressure.g54b774,
            local_3c: inventory.local_3c,
            local_30: inventory.local_30,
            local_24: inventory.local_24,
            g54b654: g.single(0x54b654)?,
            step: g.single(0x54b414)?,
        }
        .derivatives()?;
        g.singles.insert("0x54b770".into(), balance.g54b770);
        g.singles.insert("0x54b784".into(), balance.g54b784);
        if finalize_feedback {
            g.prepare_primary_feedback(phase.trace.local_78)?;
        }
        let mut singles = BTreeMap::new();
        for address in CORE_OUTPUTS {
            singles.insert(format!("0x{address:x}"), g.single(*address)?);
        }
        if heater_controls.is_some() {
            singles.insert("0x54b6dc".into(), g.single(0x54b6dc)?);
        }
        let mut integers = BTreeMap::new();
        for address in [0x54b4d6, 0x54b4d8, 0x54b4ea] {
            integers.insert(format!("0x{address:x}"), i32::from(g.integer(address)?));
        }
        if spray_controls.is_some() {
            singles.insert("0x54b6d8".into(), g.single(0x54b6d8)?);
            integers.insert("0x54b6ec".into(), i32::from(g.integer(0x54b6ec)?));
        }
        if finalize_feedback {
            for a in [0x54b738, 0x54b6c0] {
                singles.insert(format!("0x{a:x}"), g.single(a)?);
            }
        }
        *self = g;
        Ok(PrimaryCoreOutput {
            singles,
            integers,
            heater_commands,
            spray_commands,
        })
    }
}

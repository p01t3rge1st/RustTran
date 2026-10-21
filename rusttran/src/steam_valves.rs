//! SG device/valve decisions and outflow 0x509213–0x50a8a6.
//! Later auxiliary feedwater control and final exchange are separate stages.
use crate::{
    Result,
    native_globals::{LoopSide, NativeGlobals},
    steam_generator::SteamOutflowInputs,
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamPercentControl {
    pub percent: i16,
    pub manual: bool,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamValveControls {
    /// Native shared caller local, initially 99999; event producer is explicit.
    pub shutdown_time: f32,
    /// Original malfunction-array I16 entries at byte offsets 4 and 6.
    pub fault_flags: [i16; 2],
    /// Collection 0x4f8, index 0, property 0x68030009.
    pub turbine_percent: i16,
    /// Collection 0x530, SG indices 0/1.
    pub main: [SteamPercentControl; 2],
    /// Collection 0x5ac, SG indices 0/1.
    pub feedwater: [SteamPercentControl; 2],
    /// Collection 0x588, indices 0/1 and 2/3, two valve banks.
    pub safety: [SteamPercentControl; 4],
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamValveRequest {
    pub globals: NativeGlobals,
    pub side: LoopSide,
    pub controls: SteamValveControls,
}
#[derive(Clone, Debug, Serialize)]
pub struct SteamValveOutput {
    pub singles: BTreeMap<String, f32>,
    pub controls: SteamValveControls,
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("SG valve Single overflow".into())
    }
}
fn auto_close(c: &mut SteamPercentControl, condition: bool) {
    if condition && c.percent == 100 && !c.manual {
        c.percent = 0;
    }
}
fn safety(c: &mut SteamPercentControl, pressure: f32, threshold: f32) -> Result<()> {
    if pressure > threshold && c.percent == 0 && !c.manual {
        c.percent = 100;
    } else if single(f64::from(threshold) - 30.)? > pressure && c.percent == 100 && !c.manual {
        c.percent = 0;
    }
    Ok(())
}
impl NativeGlobals {
    pub fn advance_steam_valves(
        &mut self,
        side: LoopSide,
        c: &SteamValveControls,
    ) -> Result<SteamValveOutput> {
        if !c.shutdown_time.is_finite() {
            return Err("non-finite SG shutdown time".into());
        }
        let a = Self::steam_addresses(side);
        let get = |o: usize| self.single(a[(o - 8) / 4]);
        let index = if matches!(side, LoopSide::A) { 0 } else { 1 };
        let d = f64::from;
        let clock = get(0x14)?;
        let pressure = get(8)?;
        let mut controls = c.clone();
        auto_close(&mut controls.main[index], clock > c.shutdown_time);
        auto_close(&mut controls.feedwater[index], clock > c.shutdown_time);
        auto_close(
            &mut controls.main[index],
            clock > c.shutdown_time || pressure < self.single(0x54b58c)?,
        );
        let initial = single(f64::from(c.turbine_percent) * d(get(0x90)?) / 100. + d(get(0xa8)?))?;
        let main = f64::from(controls.main[index].percent);
        let mut additional = if c.fault_flags[0] != 0 && index == 0 {
            let reference = self.single(0x54b4fc)?;
            if reference == 0. {
                return Err("zero SG-A fault pressure reference".into());
            }
            single(
                d(initial) * main / 100. + d(pressure) / d(reference) * d(self.single(0x54bb50)?),
            )?
        } else if c.fault_flags[0] == 0 && c.fault_flags[1] != 0 {
            let normal = single(d(initial) * main / 100.)?;
            let reference = self.single(0x54b4fc)?;
            if reference == 0. {
                return Err("zero SG fault pressure reference".into());
            }
            single(
                d(self.single(0x54bb54)?) * d(get(0xa4)?) * (d(pressure) / d(reference)) * main
                    / 100.
                    + d(normal),
            )?
        } else {
            single(d(initial) * main / 100.)?
        };
        // The native clamp here affects the old total-flow field; the following
        // sum replaces it. Preserve the final output-producing assignments.
        safety(
            &mut controls.safety[index],
            pressure,
            self.single(0x54b164)?,
        )?;
        safety(
            &mut controls.safety[index + 2],
            pressure,
            self.single(0x54b2ac)?,
        )?;
        let first_threshold = self.single(0x54b164)?;
        let second_threshold = self.single(0x54b2ac)?;
        if first_threshold == 0. || second_threshold == 0. {
            return Err("zero SG safety-valve pressure threshold".into());
        }
        let second = single(
            d(self.single(0x54b2a8)?) / d(second_threshold)
                * f64::from(controls.safety[index + 2].percent)
                / 100.,
        )?;
        let base = single(
            (d(self.single(0x54b168)?) / d(first_threshold)
                * f64::from(controls.safety[index].percent)
                / 100.
                + d(second))
                * d(pressure)
                * d(get(0xa4)?),
        )?;
        // Caller 0x520fa5–0x520fad passes the negative A crossflow to B.
        let crossflow = self.single(0x54bf84)?;
        let out = SteamOutflowInputs {
            base_flow: base,
            additional_flow: additional,
            external_flow: if index == 0 { crossflow } else { -crossflow },
            inventory: get(0x78)?,
            step: get(0xc)?,
            discharge_enthalpy: get(0x6c)?,
            feed_enthalpy: self.single(0x54b714)?,
            heat_a: get(0x94)?,
            heat_b: get(0x98)?,
            phase_flag: index as i16,
        }
        .limit()?;
        additional = out.additional_flow;
        let singles = [
            (a[(0x68 - 8) / 4], out.flow),
            (a[(0xa0 - 8) / 4], out.base_flow),
            (a[(0xa8 - 8) / 4], additional),
            (a[(0x94 - 8) / 4], out.heat_a),
            (a[(0x98 - 8) / 4], out.heat_b),
            (0x54b718, out.feed_enthalpy),
        ]
        .into_iter()
        .map(|(a, v)| (format!("0x{a:x}"), v))
        .collect::<BTreeMap<_, _>>();
        self.singles.extend(singles.clone());
        Ok(SteamValveOutput { singles, controls })
    }
}

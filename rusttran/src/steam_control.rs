//! Original SG control prefix 0x5089f0–0x509213. Later valve/device dispatch
//! remains separate. The caller's selector is the SG index A=0/B=1.
use crate::{
    Result,
    feedwater_control::FeedwaterPiInputs,
    native_globals::{LoopSide, NativeGlobals},
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamControls {
    pub failure_time: f32,
    pub fault_flag: i16,
    pub fault_selected: bool,
    /// Collection 0x5ac, SG index, property 0x68030009.
    pub feedwater_percent: i16,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamControlPair {
    /// Same original event-array byte offset 0x20 is passed to both calls.
    pub failure_time: f32,
    pub fault_flag: i16,
    pub fault_selected: bool,
    pub feedwater_percent: [i16; 2],
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SteamControlRequest {
    pub globals: NativeGlobals,
    pub side: LoopSide,
    pub controls: SteamControls,
}
#[derive(Clone, Debug, Serialize)]
pub struct SteamControlOutput {
    pub singles: BTreeMap<String, f32>,
    pub fault_selected: bool,
    pub trace: BTreeMap<String, f32>,
}
fn single(x: f64) -> Result<f32> {
    let v = x as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("SG control Single overflow".into())
    }
}
impl NativeGlobals {
    pub fn advance_steam_control(
        &mut self,
        side: LoopSide,
        c: &SteamControls,
    ) -> Result<SteamControlOutput> {
        if !c.failure_time.is_finite() {
            return Err("non-finite SG failure time".into());
        }
        let args = Self::steam_addresses(side);
        let get = |o: usize| self.single(args[(o - 8) / 4]);
        let flag = |o: usize| self.integer(args[(o - 8) / 4]);
        let d = f64::from;
        let scale = get(0x1c)?;
        let share = get(0xa4)?;
        let step = get(0xc)?;
        let clock = get(0x14)?;
        let pressure = get(8)?;
        let gain = single(d(self.single(0x54b208)?) * d(share) * d(scale))?;
        let capacity = single(d(self.single(0x54b18c)?) * d(scale) * d(share) * d(get(0x38)?))?;
        let vapor_enthalpy = crate::physics::hgas(pressure)?;
        let mut flow = get(0x20)?;
        let mut transition_time = get(0x30)?;
        let mut maximum = 0.;
        let mut error = 0.;
        if flag(0x48)? == 0 {
            let end = single(d(transition_time) + 60.)?;
            if clock > transition_time && clock <= end {
                let count = 2_i16
                    .checked_sub(flag(0x8c)?)
                    .ok_or("SG pump-count I16 overflow")?;
                let elapsed = d(clock) - d(transition_time) - 60.;
                let old = elapsed - d(step);
                flow = single(
                    f64::from(count) * d(scale) / 4. * d(share) * (elapsed.powi(2) - old.powi(2))
                        / 60.
                        / 60.
                        + d(flow),
                )?;
            } else if end > clock {
                if scale == 0. || share == 0. {
                    return Err("zero SG level-control scale/share".into());
                }
                error = single(
                    (d(get(0x68)?) - d(flow)) / d(scale) / d(share)
                        + (d(get(0x64)?) - d(get(0x24)?)) * 0.033,
                )?;
                flow = single(
                    ((d(error) * d(step) / 60. + d(error) - d(get(0x88)?))
                        * d(self.single(0x54b184)?)
                        * d(scale)
                        * d(share)
                        + d(flow))
                        * f64::from(c.feedwater_percent)
                        / 100.,
                )?;
                maximum = single(d(scale) * 1.2 * d(share) * f64::from(flag(0x8c)?) / 2.)?;
            } else {
                transition_time = f32::from_bits(0x47c34f80);
            }
        }
        // Original frame initializes maximum/error to zero, then clamps and
        // stores the level history on every path, including pressure PI mode.
        if flow < 0. {
            flow = 0.;
        }
        if flow > maximum {
            flow = maximum;
        }
        let mut pressure_error = get(0x84)?;
        let valve_flow;
        let partition;
        let mut selected = c.fault_selected;
        let index = if matches!(side, LoopSide::A) { 0 } else { 1 };
        if flag(0x40)? != 0 {
            let out = FeedwaterPiInputs {
                pressure,
                target: get(0x34)?,
                pressure_band: get(0x4c)?,
                capacity,
                gain,
                step,
                output: get(0x90)?,
                previous_error: pressure_error,
                scale,
                ratio: get(0x28)?,
                heat_a: get(0x94)?,
                heat_b: get(0x98)?,
                fault_flag: c.fault_flag,
                phase_flag: index,
            }
            .advance()?;
            valve_flow = out.output;
            pressure_error = out.previous_error;
            partition = out.heat_partition;
        } else if c.fault_flag != 0 {
            selected = true;
            let gate = if single(d(clock) - d(c.failure_time))? >= 0. {
                1.
            } else {
                0.
            };
            let band = get(0x4c)?;
            let span = get(0x10)?;
            if band == 0. || span == 0. {
                return Err("zero SG fault-control denominator".into());
            }
            let value =
                single(d(capacity) * d(pressure) / d(band) * d(get(0x2c)?) / d(span) * gate)?;
            valve_flow = if value <= 0. { 0. } else { value };
            partition = 0.;
        } else {
            let a = get(0x94)?;
            let b = get(0x98)?;
            if d(a) + d(b) == 0. {
                return Err("zero SG heat sum".into());
            }
            partition = single(
                d(scale) * d(get(0x28)?) * d(if index == 0 { a } else { b }) / (d(a) + d(b)),
            )?;
            let signal = get(0x2c)?;
            let lower = self.single(0x54b20c)?;
            valve_flow = if signal > lower {
                let band = get(0x4c)?;
                let upper = self.single(0x54b194)?;
                if band == 0. || upper == lower {
                    return Err("zero SG normal-control denominator".into());
                }
                single(
                    d(pressure) / d(band) * d(capacity) * (d(signal) - d(lower))
                        / (d(upper) - d(lower))
                        * f64::from(flag(0x3c)?),
                )?
            } else {
                0.
            };
        }
        let singles = [
            (0x20, flow),
            (0x30, transition_time),
            (0x6c, vapor_enthalpy),
            (0x84, pressure_error),
            (0x88, error),
            (0x90, valve_flow),
            (0xa8, partition),
        ]
        .into_iter()
        .map(|(o, v)| (format!("0x{:x}", args[(o - 8) / 4]), v))
        .collect::<BTreeMap<_, _>>();
        self.singles.extend(singles.clone());
        Ok(SteamControlOutput {
            singles,
            fault_selected: selected,
            trace: BTreeMap::from([
                ("gain".into(), gain),
                ("capacity".into(), capacity),
                ("maximum_feedwater".into(), maximum),
                ("level_error".into(), error),
            ]),
        })
    }
}

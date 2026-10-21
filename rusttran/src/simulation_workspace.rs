//! Desktop/CLI adapter for supplied-state recovered sessions, with real stepping.
//! Fresh IC construction and the complete original plant model remain separate.
use crate::{Result, recovered_session::RecoveredSession};
use std::{collections::VecDeque, path::Path};
pub const HISTORY_LIMIT: usize = 50_000;
pub const SERIES: [(&str, &str, &str); 16] = [
    ("0x54b694", "Hot leg A temperature", "degF"),
    ("0x54b698", "Hot leg B temperature", "degF"),
    ("0x54b69c", "Cold leg A temperature", "degF"),
    ("0x54b6a0", "Cold leg B temperature", "degF"),
    ("0x54b494", "Primary pressure", "psia"),
    ("0x54b498", "Primary temperature", "degF"),
    ("0x54b4a0", "Pressurizer level", "fraction"),
    ("0x54b4fc", "SG A pressure", "psia"),
    ("0x54b500", "SG B pressure", "psia"),
    ("0x54b530", "RCP A flow", "lb/s"),
    ("0x54b534", "RCP B flow", "lb/s"),
    ("0x54ba20", "Supply injection", "lb/s"),
    ("0x54ba40", "Supply tank volume", "ft3"),
    ("0x54b804", "Accumulator discharge", "lb/s"),
    ("0x54b570", "Accumulator water", "ft3"),
    ("0x54b540", "Accumulator gas pressure", "psia"),
];
#[derive(Clone, Debug)]
pub struct HistorySample {
    pub update: u64,
    pub clock: f32,
    pub values: [Option<f32>; SERIES.len()],
}
#[derive(Clone, Debug)]
pub struct SimulationWorkspace {
    initial: RecoveredSession,
    pub session: RecoveredSession,
    pub running: bool,
    pub speed: f64,
    pub updates: u64,
    pub history: VecDeque<HistorySample>,
    pending: f64,
}
impl SimulationWorkspace {
    pub fn from_json(bytes: &[u8]) -> Result<Self> {
        let value: serde_json::Value = serde_json::from_slice(bytes)?;
        let value = value.get("solution").unwrap_or(&value);
        let value = value.get("session").unwrap_or(value);
        let session: RecoveredSession = serde_json::from_value(value.clone())?;
        // Check that all currently selected producers have required operands,
        // without committing even one step of the user's loaded state.
        session.clone().advance(1)?;
        Ok(Self {
            initial: session.clone(),
            session,
            running: false,
            speed: 1.,
            updates: 0,
            history: VecDeque::new(),
            pending: 0.,
        })
    }
    pub fn start(&mut self) -> Result<()> {
        if !self.speed.is_finite() || self.speed <= 0. {
            return Err("invalid simulation speed".into());
        }
        self.running = true;
        Ok(())
    }
    pub fn pause(&mut self) {
        self.running = false;
        self.pending = 0.;
    }
    pub fn reset(&mut self) {
        self.session = self.initial.clone();
        self.running = false;
        self.updates = 0;
        self.history.clear();
        self.pending = 0.;
    }
    pub fn advance_steps(&mut self, count: usize) -> Result<()> {
        let mut values = SERIES.map(|(a, _, _)| self.session.globals.singles.get(a).copied());
        let results = match self.session.advance(count) {
            Ok(results) => results,
            Err(error) => {
                self.pause();
                return Err(error);
            }
        };
        for out in results {
            self.updates += 1;
            for (i, (address, _, _)) in SERIES.iter().enumerate() {
                if let Some(value) = out.singles.get(*address) {
                    values[i] = Some(*value);
                }
            }
            self.history.push_back(HistorySample {
                update: self.updates,
                clock: out.singles["0x54b40c"],
                values,
            });
            if self.history.len() > HISTORY_LIMIT {
                self.history.pop_front();
            }
        }
        Ok(())
    }
    /// Bounded work per frame; pending time is retained, never substituted for
    /// numerical advances. GUI latency cannot jump the model clock forward.
    pub fn tick(&mut self, delta: f64) -> Result<()> {
        if !self.running {
            return Ok(());
        }
        if !delta.is_finite() || delta < 0. || !self.speed.is_finite() || self.speed <= 0. {
            self.pause();
            return Err("invalid simulation frame time or speed".into());
        }
        let step = f64::from(self.session.controls.step);
        if !step.is_finite() || step <= 0. {
            self.pause();
            return Err("invalid simulation step".into());
        }
        let pending = self.pending + delta * self.speed;
        if !pending.is_finite() {
            self.pause();
            return Err("simulation frame budget overflow".into());
        }
        self.pending = pending;
        let count = (self.pending / step).floor().min(32.) as usize;
        if count > 0 {
            self.advance_steps(count)?;
            self.pending -= count as f64 * step;
        }
        Ok(())
    }
    pub fn save(&self, path: &Path) -> Result<()> {
        std::fs::write(path, serde_json::to_vec_pretty(&self.session)?)?;
        Ok(())
    }
    pub fn export_csv(&self, path: &Path) -> Result<()> {
        let mut writer = csv::Writer::from_path(path)?;
        writer.write_record(
            std::iter::once("update".into())
                .chain(std::iter::once("evaluation_clock_s".into()))
                .chain(SERIES.iter().map(|(_, n, u)| format!("{n} [{u}]"))),
        )?;
        for sample in &self.history {
            writer.write_record(
                std::iter::once(sample.update.to_string())
                    .chain(std::iter::once(sample.clock.to_string()))
                    .chain(
                        sample
                            .values
                            .iter()
                            .map(|v| v.map_or_else(String::new, |v| v.to_string())),
                    ),
            )?;
        }
        writer.flush()?;
        Ok(())
    }
}

//! Read-only recovered initial conditions and a presentation preview clock.
//! Advancing the clock does not simulate or change the plant snapshot.
use crate::{Database, Result, Row, Table};
use std::path::Path;

#[derive(Debug, Clone)]
pub struct ConditionChoice {
    pub id: String,
    pub description: String,
}

pub struct Presentation {
    database: Database,
    pub conditions: Vec<ConditionChoice>,
    pub selected_id: String,
    pub thermo: Row,
    pub pumps: Row,
    pub valves: Row,
    pub core: Row,
    pub malfunctions: Table,
}

impl Presentation {
    pub fn load(root: &Path) -> Result<Self> {
        let database = Database::new(root, "ListData")?;
        Self::from_database(database)
    }
    pub fn embedded() -> Result<Self> {
        Self::from_database(Database::embedded("ListData")?)
    }
    fn from_database(database: Database) -> Result<Self> {
        let source = database.table("ICThermoData")?;
        let mut conditions = Vec::new();
        for row in &source.rows {
            let id = row.get("IC").ok_or("ICThermoData lacks IC")?.clone();
            if !conditions
                .iter()
                .any(|choice: &ConditionChoice| choice.id == id)
            {
                let description = row
                    .get("Description")
                    .filter(|s| !s.trim().is_empty())
                    .cloned()
                    .unwrap_or_else(|| format!("IC {id}"));
                conditions.push(ConditionChoice { id, description });
            }
        }
        let first = conditions
            .first()
            .ok_or("no recovered initial conditions")?
            .id
            .clone();
        let malfunctions = database.table("ListMalf")?;
        let mut model = Self {
            database,
            conditions,
            selected_id: String::new(),
            thermo: Row::new(),
            pumps: Row::new(),
            valves: Row::new(),
            core: Row::new(),
            malfunctions,
        };
        model.select(&first)?;
        Ok(model)
    }

    /// Select recovered rows atomically; absent equipment rows remain unknown.
    pub fn select(&mut self, id: &str) -> Result<()> {
        if !self.conditions.iter().any(|choice| choice.id == id) {
            return Err(format!("unknown recovered IC: {id}").into());
        }
        let tables = self.database.condition(id)?;
        let row = |name: &str| {
            tables
                .iter()
                .find(|table| table.name == name)
                .and_then(|table| table.rows.first())
                .cloned()
                .unwrap_or_default()
        };
        let thermo = row("ICThermoData");
        if thermo.is_empty() {
            return Err(format!("missing thermodynamic snapshot: {id}").into());
        }
        let pumps = row("ICPumpData");
        let valves = row("ICValveData");
        let core = row("ICCoreData");
        self.thermo = thermo;
        self.pumps = pumps;
        self.valves = valves;
        self.core = core;
        self.selected_id = id.into();
        Ok(())
    }

    pub fn number(&self, key: &str) -> Option<f64> {
        number(&self.thermo, key)
    }
    pub fn pump(&self, key: &str) -> Option<f64> {
        number(&self.pumps, key)
    }
    pub fn valve(&self, key: &str) -> Option<f64> {
        number(&self.valves, key)
    }
    pub fn format(&self, key: &str, decimals: usize) -> String {
        self.number(key)
            .map(|value| format!("{value:.decimals$}"))
            .unwrap_or_else(|| "—".into())
    }
}

fn number(row: &Row, key: &str) -> Option<f64> {
    row.get(key)?
        .parse::<f64>()
        .ok()
        .filter(|value| value.is_finite())
}

/// Unlimited GUI preview time; this is not a reconstructed simulation engine.
#[derive(Debug, Clone)]
pub struct RunClock {
    pub elapsed_seconds: f64,
    pub speed: f64,
    pub running: bool,
}

impl Default for RunClock {
    fn default() -> Self {
        Self {
            elapsed_seconds: 0.0,
            speed: 1.0,
            running: false,
        }
    }
}

impl RunClock {
    fn validate(&self) -> Result<()> {
        if !self.elapsed_seconds.is_finite()
            || self.elapsed_seconds < 0.0
            || !self.speed.is_finite()
            || self.speed <= 0.0
        {
            return Err("invalid preview clock state".into());
        }
        Ok(())
    }
    pub fn advance(&mut self, delta_seconds: f64) -> Result<()> {
        self.validate()?;
        if !delta_seconds.is_finite() || delta_seconds < 0.0 {
            return Err("invalid preview time delta".into());
        }
        if self.running {
            let elapsed = self.elapsed_seconds + delta_seconds * self.speed;
            if !elapsed.is_finite() {
                return Err("preview time overflow".into());
            }
            self.elapsed_seconds = elapsed;
        }
        Ok(())
    }
    pub fn start(&mut self) -> Result<()> {
        self.validate()?;
        self.running = true;
        Ok(())
    }
    pub fn pause(&mut self) -> Result<()> {
        self.running = false;
        Ok(())
    }
    pub fn reset(&mut self) -> Result<()> {
        self.elapsed_seconds = 0.0;
        self.running = false;
        Ok(())
    }
    pub fn seek(&mut self, seconds: f64) -> Result<()> {
        if !seconds.is_finite() || seconds < 0.0 {
            return Err("invalid preview time".into());
        }
        self.elapsed_seconds = seconds;
        Ok(())
    }
}

impl Presentation {
    pub fn model_choices(&self) -> Result<Vec<ConditionChoice>> {
        self.database
            .table("BasicData")?
            .rows
            .iter()
            .map(|r| {
                Ok(ConditionChoice {
                    id: r.get("SET").ok_or("BasicData lacks SET")?.clone(),
                    description: r.get("Description").cloned().unwrap_or_default(),
                })
            })
            .collect()
    }
    /// Fresh primary-system calculation from the selected operating point.
    /// Returns only authenticated outputs, never a complete runnable plant.
    pub fn initialize_primary_system(
        &self,
        model_id: &str,
    ) -> Result<crate::fresh_primary::FreshPrimaryOutput> {
        crate::fresh_primary::prepare_primary_startup(&self.database, model_id, &self.selected_id)
    }
}

impl Presentation {
    pub fn initialize_thermal_system(
        &self,
        model_id: &str,
    ) -> Result<crate::fresh_primary::FreshPrimaryOutput> {
        crate::fresh_steam::prepare_thermal_startup(&self.database, model_id, &self.selected_id)
    }
}

impl Presentation {
    /// Recovered fresh state including owned Double arrays, without changing the IC snapshot.
    pub fn initialize_fresh_state(
        &self,
        model_id: &str,
        fault_flag: i16,
    ) -> Result<crate::fresh_steam::FreshInitializedState> {
        crate::fresh_steam::prepare_fresh_state(
            &self.database,
            model_id,
            &self.selected_id,
            fault_flag,
        )
    }
}

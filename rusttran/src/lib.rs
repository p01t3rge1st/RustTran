//! Lossless field values from recovered PCTran CSV exports.
pub mod accumulator;
pub mod accumulator_system;
pub mod alternate_init;
pub mod balance;
pub mod bindings;
pub mod controller;
pub mod decay_heat;
pub mod feedwater_control;
pub mod fresh_auxiliary;
pub mod fresh_primary;
pub mod fresh_steam;
pub mod heaters;
pub mod initialization;
pub mod integration;
pub mod live_readings;
pub mod loop_transfer;
pub mod loop_transport;
pub mod native_globals;
pub mod normal_primary_phase;
pub mod physics;
pub mod presentation;
pub mod primary_core;
pub mod primary_correction;
pub mod primary_devices;
pub mod primary_exchange;
pub mod primary_feedback;
pub mod primary_flow;
pub mod primary_inventory;
pub mod primary_phase;
pub mod primary_phase_state;
pub mod primary_properties;
pub mod primary_references;
pub mod primary_sources;
pub mod process_storage;
pub mod pumps;
pub mod rcp_control;
pub mod recovered_session;
pub mod recovered_step;
pub mod relief;
pub mod saturated_balance;
pub mod simulation_workspace;
pub mod spray;
pub mod stages;
pub mod startup_primitives;
pub mod steam_control;
pub mod steam_generator;
pub mod supply_system;
pub mod supply_tank;
pub mod thermal_driving;
pub mod vessel;
use serde::Serialize;
use std::{
    collections::BTreeMap,
    error::Error,
    fs,
    path::{Path, PathBuf},
};

pub type Result<T> = std::result::Result<T, Box<dyn Error>>;
include!(concat!(env!("OUT_DIR"), "/embedded_data.rs"));

pub type Row = BTreeMap<String, String>;

#[derive(Debug, Serialize)]
pub struct Table {
    pub name: String,
    pub columns: Vec<String>,
    pub rows: Vec<Row>,
}

impl Table {
    pub fn read(name: &str, path: &Path) -> Result<Self> {
        Self::from_reader(name, fs::File::open(path)?)
    }

    fn from_reader(name: &str, input: impl std::io::Read) -> Result<Self> {
        let mut reader = csv::Reader::from_reader(input);
        let columns: Vec<String> = reader.headers()?.iter().map(str::to_owned).collect();
        let unique: std::collections::BTreeSet<_> = columns.iter().collect();
        if unique.len() != columns.len() {
            return Err("duplicate CSV columns".into());
        }
        let rows = reader
            .records()
            .map(|record| {
                Ok(columns
                    .iter()
                    .cloned()
                    .zip(record?.iter().map(str::to_owned))
                    .collect())
            })
            .collect::<Result<Vec<Row>>>()?;
        Ok(Self {
            name: name.into(),
            columns,
            rows,
        })
    }

    pub fn matching(mut self, key: &str, value: &str) -> Result<Self> {
        if !self.columns.iter().any(|column| column == key) {
            return Err(format!("{} lacks required column {key}", self.name).into());
        }
        self.rows
            .retain(|row| row.get(key).is_some_and(|field| field == value));
        Ok(self)
    }
}

pub struct Database {
    directory: Option<PathBuf>,
    database: String,
}

impl Database {
    pub fn new(root: &Path, database: &str) -> Result<Self> {
        if !["ListData", "BackData", "OptData", "DoseData", "PlotData"].contains(&database) {
            return Err(format!("unknown database: {database}").into());
        }
        let directory = root.join(database);
        if !directory.is_dir() {
            return Err(format!("missing data directory: {}", directory.display()).into());
        }
        Ok(Self {
            directory: Some(directory),
            database: database.into(),
        })
    }

    pub fn embedded(database: &str) -> Result<Self> {
        if !EMBEDDED_CSV.iter().any(|(db, _, _)| *db == database) {
            return Err(format!("unknown database: {database}").into());
        }
        Ok(Self {
            directory: None,
            database: database.into(),
        })
    }

    pub fn tables(&self) -> Result<Vec<String>> {
        let mut names = Vec::new();
        if self.directory.is_none() {
            return Ok(EMBEDDED_CSV
                .iter()
                .filter(|(db, _, _)| *db == self.database)
                .map(|(_, name, _)| name.to_string())
                .collect());
        }
        for entry in fs::read_dir(self.directory.as_ref().unwrap())? {
            let path = entry?.path();
            if path.extension().is_some_and(|extension| extension == "csv") {
                names.push(
                    path.file_stem()
                        .ok_or("missing table name")?
                        .to_string_lossy()
                        .into_owned(),
                );
            }
        }
        names.sort();
        Ok(names)
    }

    pub fn table(&self, name: &str) -> Result<Table> {
        if !self.tables()?.iter().any(|table| table == name) {
            return Err(format!("unknown table: {name}").into());
        }
        if let Some(directory) = &self.directory {
            Table::read(name, &directory.join(format!("{name}.csv")))
        } else {
            let (_, _, csv) = EMBEDDED_CSV
                .iter()
                .find(|(db, table, _)| *db == self.database && *table == name)
                .ok_or("missing embedded table")?;
            Table::from_reader(name, csv.as_bytes())
        }
    }

    pub fn parameters(&self, id: &str) -> Result<Table> {
        let table = self.table("BasicData")?.matching("SET", id)?;
        if table.rows.is_empty() {
            return Err(format!("unknown SET: {id}").into());
        }
        Ok(table)
    }

    /// Recover every available IC row, even when ListIC has no catalog entry.
    pub fn condition(&self, id: &str) -> Result<Vec<Table>> {
        let mut tables = vec![self.table("ListIC")?.matching("IC", id)?];
        for name in self
            .tables()?
            .into_iter()
            .filter(|name| name.starts_with("IC") && name != "ICMalfDataTemp")
        {
            let table = self.table(&name)?.matching("IC", id)?;
            tables.push(table);
        }
        if tables.iter().all(|table| table.rows.is_empty()) {
            return Err(format!("unknown IC: {id}").into());
        }
        Ok(tables)
    }
}

pub fn default_data_root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("../analysis/data")
}

/// Strict comparison of an exported freeze predicate. This does not reproduce
/// the original simulator's dispatch, evaluation timing, or freeze state machine.
pub fn evaluate_freeze(predicate: &Row, variables: &BTreeMap<String, f64>) -> Result<bool> {
    let field = |name: &str| {
        predicate
            .get(name)
            .ok_or_else(|| format!("missing predicate column: {name}"))
    };
    let variable = field("Variable")?;
    let actual = *variables
        .get(variable)
        .ok_or_else(|| format!("missing variable: {variable}"))?;
    let threshold: f64 = field("Value")?.parse()?;
    if !actual.is_finite() || !threshold.is_finite() {
        return Err("non-finite freeze comparison".into());
    }
    match field("Relation")?.as_str() {
        ">" => Ok(actual > threshold),
        "<" => Ok(actual < threshold),
        relation => Err(format!("unsupported freeze relation: {relation}").into()),
    }
}

pub mod steam_valves;

pub mod steam_auxiliary;
pub mod steam_system;

pub mod late_thermal_init;

pub mod fresh_control_history;

pub mod restored_controls;

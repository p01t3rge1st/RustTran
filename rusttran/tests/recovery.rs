use rusttran::{Database, Table, default_data_root, evaluate_freeze};
use std::collections::BTreeMap;

fn db() -> Database {
    Database::new(&default_data_root(), "ListData").unwrap()
}

#[test]
fn configurations_are_selected_by_key_and_values_are_exact() {
    let table = db().parameters("1").unwrap();
    assert_eq!(table.rows.len(), 1);
    assert_eq!(table.rows[0]["POWER"], "2705");
    assert_eq!(table.rows[0]["P0"], "158.2");
    assert_eq!(table.rows[0]["T0"], "309.14");
    assert_eq!(table.rows[0]["Description"], "W 3-Loop TPC #3");
    assert!(db().parameters("999").is_err());
}

#[test]
fn joins_preserve_catalog_discrepancy_and_unlisted_snapshots() {
    assert_eq!(db().table("ListIC").unwrap().rows.len(), 13);
    assert_eq!(db().table("ICThermoData").unwrap().rows.len(), 22);
    let condition = db().condition("1").unwrap();
    assert_eq!(condition[0].rows[0]["RC Press"], "155");
    let thermo = condition
        .iter()
        .find(|table| table.name == "ICThermoData")
        .unwrap();
    assert_eq!(thermo.rows[0]["P"], "158.2");
    assert_eq!(thermo.rows[0]["TAVG"], "309.1");
    let unlisted = db().condition("12").unwrap();
    assert!(unlisted[0].rows.is_empty());
    assert!(unlisted.iter().any(|table| !table.rows.is_empty()));
    assert!(db().condition("21").is_err());
}

#[test]
fn unusual_malfunction_fractions_are_preserved() {
    let rows = db().table("ICMalfData").unwrap().rows;
    assert_eq!(rows.len(), 440);
    assert!(rows.iter().any(|row| row["FailureFraction"] == "-100"));
    assert!(rows.iter().any(|row| row["FailureFraction"] == "3000"));
}

#[test]
fn csv_quotes_empty_fields_and_missing_columns_are_distinct() {
    let path = std::env::temp_dir().join(format!("pctran-csv-{}.csv", std::process::id()));
    std::fs::write(&path, "ID,Text,Empty\n1,\"a,b \"\"quoted\"\"\",\n").unwrap();
    let table = Table::read("fixture", &path).unwrap();
    std::fs::remove_file(path).unwrap();
    assert_eq!(table.rows[0]["Text"], "a,b \"quoted\"");
    assert_eq!(table.rows[0].get("Empty").map(String::as_str), Some(""));
    assert_eq!(table.rows[0].get("Absent"), None);
    assert!(table.matching("Absent", "").is_err());
}

#[test]
fn recovered_freeze_predicates_are_strict_and_require_variables() {
    let table = db()
        .table("PresetFreeze")
        .unwrap()
        .matching("IC", "16")
        .unwrap();
    let time = table
        .rows
        .iter()
        .find(|row| row["Variable"] == "TIME")
        .unwrap();
    let mut variables = BTreeMap::from([("TIME".into(), 30000.0)]);
    assert!(!evaluate_freeze(time, &variables).unwrap());
    variables.insert("TIME".into(), 30000.1);
    assert!(evaluate_freeze(time, &variables).unwrap());
    assert!(evaluate_freeze(time, &BTreeMap::new()).is_err());
    variables.insert("TIME".into(), f64::NAN);
    assert!(evaluate_freeze(time, &variables).is_err());
    let low = table
        .rows
        .iter()
        .find(|row| row["Variable"] == "PSGA")
        .unwrap();
    variables.insert("PSGA".into(), 0.0);
    assert!(!evaluate_freeze(low, &variables).unwrap());
    variables.insert("PSGA".into(), -0.1);
    assert!(evaluate_freeze(low, &variables).unwrap());
}

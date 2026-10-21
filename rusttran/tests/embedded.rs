use rusttran::{Database, default_data_root};
#[test]
fn packaged_data_matches_every_recovered_table() {
    let mut tables = 0;
    for name in ["ListData", "BackData", "OptData", "DoseData", "PlotData"] {
        let files = Database::new(&default_data_root(), name).unwrap();
        let embedded = Database::embedded(name).unwrap();
        assert_eq!(files.tables().unwrap(), embedded.tables().unwrap());
        for table in files.tables().unwrap() {
            let a = files.table(&table).unwrap();
            let b = embedded.table(&table).unwrap();
            assert_eq!(a.columns, b.columns);
            assert_eq!(a.rows, b.rows);
            tables += 1;
        }
    }
    assert_eq!(tables, 53);
    assert!(Database::new(std::path::Path::new("/missing-rusttran-data"), "ListData").is_err());
}

use std::{env, fs, path::PathBuf};
fn main() {
    let root = PathBuf::from(env::var("CARGO_MANIFEST_DIR").unwrap());
    let mut output = String::from("static EMBEDDED_CSV: &[(&str, &str, &str)] = &[\n");
    for db in ["ListData", "BackData", "OptData", "DoseData", "PlotData"] {
        let folder = root.join("../analysis/data").join(db);
        println!("cargo:rerun-if-changed={}", folder.display());
        let mut paths: Vec<_> = fs::read_dir(folder)
            .unwrap()
            .map(|e| e.unwrap().path())
            .filter(|p| p.extension().is_some_and(|e| e == "csv"))
            .collect();
        paths.sort();
        for path in paths {
            output.push_str(&format!(
                "({:?}, {:?}, include_str!({:?})),\n",
                db,
                path.file_stem().unwrap().to_str().unwrap(),
                path.canonicalize().unwrap()
            ));
        }
    }
    output.push_str("];\n");
    fs::write(
        PathBuf::from(env::var("OUT_DIR").unwrap()).join("embedded_data.rs"),
        output,
    )
    .unwrap();
    if env::var("CARGO_CFG_TARGET_OS").unwrap() == "windows" {
        let mut resource = winresource::WindowsResource::new();
        resource
            .set_icon("assets/rusttran.ico")
            .set("ProductName", "RustTran")
            .set("FileDescription", "RustTran PWR 3LP");
        if let Ok(path) = env::var("RUSTTRAN_WINDRES") {
            resource.set_windres_path(&path);
        }
        resource.compile().unwrap();
    }
}

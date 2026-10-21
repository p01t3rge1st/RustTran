//! Desktop workspace for the recovered numerical engine, distinct from IC views.
use eframe::egui::{self, Color32, RichText, Stroke, Vec2};
use rusttran::{
    Result,
    simulation_workspace::{SERIES, SimulationWorkspace},
};
use std::path::Path;
#[derive(Default)]
pub struct EnginePanel {
    pub workspace: Option<SimulationWorkspace>,
    pub input: String,
    save_path: String,
    csv_path: String,
    selected_series: usize,
    message: Option<String>,
}
impl EnginePanel {
    pub fn load_sample(&mut self) -> Result<()> {
        let next = SimulationWorkspace::from_json(include_bytes!(
            "../examples/gui-simulation-session.json"
        ))?;
        self.workspace = Some(next);
        self.input.clear();
        self.save_path = "rusttran-session.json".into();
        self.csv_path = "rusttran-history.csv".into();
        self.message = Some(
            "Synthetic sample session loaded and paused. This is not a complete reactor scenario."
                .into(),
        );
        Ok(())
    }
    pub fn load(&mut self, path: &Path) -> Result<()> {
        let next = SimulationWorkspace::from_json(&std::fs::read(path)?)?;
        self.workspace = Some(next);
        self.input = path.display().to_string();
        self.save_path = "rusttran-session.json".into();
        self.csv_path = "rusttran-history.csv".into();
        self.message = Some("Session loaded and paused.".into());
        Ok(())
    }
    pub fn running(&self) -> bool {
        self.workspace.as_ref().is_some_and(|w| w.running)
    }
    pub fn tick(&mut self, dt: f64) -> Result<()> {
        if let Some(w) = &mut self.workspace {
            w.tick(dt)?;
        }
        Ok(())
    }
    pub fn reset(&mut self) {
        if let Some(w) = &mut self.workspace {
            w.reset();
        }
    }
    pub fn start(&mut self) -> Result<()> {
        self.workspace
            .as_mut()
            .ok_or("Load a RustTran session first.")?
            .start()
    }
    pub fn pause(&mut self) {
        if let Some(w) = &mut self.workspace {
            w.pause();
        }
    }
    pub fn toolbar(&mut self, ui: &mut egui::Ui) -> Result<()> {
        ui.horizontal(|ui| -> Result<()> {
            ui.heading("Simulation");
            if let Some(w) = &mut self.workspace {
                if ui
                    .button(if w.running { "Pause" } else { "▶ Start" })
                    .clicked()
                {
                    if w.running {
                        w.pause();
                    } else {
                        w.start()?;
                    }
                }
                if ui
                    .add_enabled(!w.running, egui::Button::new("Step"))
                    .clicked()
                {
                    w.advance_steps(1)?;
                }
                if ui.button("Reset").clicked() {
                    w.reset();
                }
                egui::ComboBox::from_id_salt("engine_speed")
                    .selected_text(format!("{}×", w.speed))
                    .show_ui(ui, |ui| {
                        for speed in [0.1, 0.5, 1., 2., 5., 10.] {
                            ui.selectable_value(&mut w.speed, speed, format!("{speed}×"));
                        }
                    });
                ui.label(
                    RichText::new(format!(
                        "Next: {:.6} s · {} updates",
                        w.session.controls.clock, w.updates
                    ))
                    .color(super::AMBER),
                );
            } else {
                ui.label("Load a session to run the engine.");
            }
            Ok(())
        })
        .inner
    }
    pub fn show(&mut self, ui: &mut egui::Ui) -> Result<()> {
        ui.label(
            RichText::new("Recovered engine · supplied initial/source state")
                .color(super::AMBER)
                .strong(),
        );
        ui.label("Runs the reconstructed systems. Full plant initialization and PCTran scenario equivalence are still pending. Other views show stored initial conditions.");
        let mut load = false;
        let mut sample = false;
        ui.horizontal(|ui| {
            ui.label("Session JSON");
            ui.add(egui::TextEdit::singleline(&mut self.input).desired_width(550.));
            load = ui.button("Load state").clicked();
            sample = ui.button("Load sample session").clicked();
        });
        if load {
            let path = self.input.clone();
            self.load(Path::new(&path))?;
        }
        if sample {
            self.load_sample()?;
        }
        if let Some(message) = &self.message {
            ui.label(RichText::new(message).color(super::MUTED));
        }
        let Some(w) = &mut self.workspace else {
            return Ok(());
        };
        ui.separator();
        egui::ScrollArea::vertical().show(ui,|ui|->Result<()> {
            ui.columns(2,|columns| {
                columns[0].heading("Current plant values");
                egui::Grid::new("engine_values").striped(true).show(&mut columns[0],|ui| {
                    for (address,label,unit) in SERIES {
                        ui.label(label);ui.label(w.session.globals.singles.get(address).map_or_else(||"—".into(),|v|format!("{v:.5} {unit}")));ui.end_row();
                    }
                });
                columns[1].heading("Device controls");
                let c=&mut w.session.controls;
                columns[1].checkbox(&mut c.loop_transport,"Loop thermal feedback");
                egui::CollapsingHeader::new("Coolant pumps").default_open(true).show(&mut columns[1],|ui| {
                    if let Some(rcp)=&mut c.rcp {for i in 0..2 {percent(ui,&format!("RCP {}",['A','B'][i]),&mut rcp.pump_percent[i]);}}
                    else{ui.label("Pump producer not selected in this state.");}
                });
                egui::CollapsingHeader::new("Supply and injection").show(&mut columns[1],|ui|{
                    if let Some(s)=&mut c.supply {
                        egui::ComboBox::from_id_salt("supply_mode").selected_text(match s.controls.mode {1=>"Recirculation",2=>"Cooling",_=>"Tank supply"}).show_ui(ui,|ui|{ui.selectable_value(&mut s.controls.mode,0,"Tank supply");ui.selectable_value(&mut s.controls.mode,1,"Recirculation");ui.selectable_value(&mut s.controls.mode,2,"Cooling");});
                        for i in 0..2 {ui.checkbox(&mut s.controls.pump_manual[i],format!("Pump {} manual",i+1));percent(ui,&format!("Supply pump {}",i+1),&mut s.controls.pump_percent[i]);}
                        percent(ui,"Heat exchanger",&mut s.controls.exchanger_percent);
                    }
                    if let Some(d)=&mut c.devices {for i in 0..3 {ui.checkbox(&mut d.controls.pump_manual[i],format!("Injection / charging {} manual",i+1));percent(ui,&format!("Injection / charging {}",i+1),&mut d.controls.pump_percent[i]);}ui.checkbox(&mut d.controls.letdown_manual,"Letdown manual");percent(ui,"Letdown",&mut d.controls.letdown_percent);}
                });
                egui::CollapsingHeader::new("Accumulator valves").show(&mut columns[1],|ui| {if let Some(valves)=&mut c.accumulator {for (i,v) in valves.iter_mut().enumerate() {ui.checkbox(&mut v.inhibited,format!("Valve {} inhibited",i+1));percent(ui,&format!("Accumulator valve {}",i+1),&mut v.opening);}}});
                egui::CollapsingHeader::new("Heaters and spray").show(&mut columns[1],|ui| {
                    ui.checkbox(&mut c.heaters.proportional_manual,"Proportional heater manual");percent(ui,"Proportional heater",&mut c.heaters.proportional_percent);
                    ui.checkbox(&mut c.heaters.backup_manual,"Backup heater manual");percent(ui,"Backup heater",&mut c.heaters.backup_percent);
                    ui.checkbox(&mut c.spray.spray_manual,"Spray manual");percent(ui,"Spray",&mut c.spray.spray_percent);percent(ui,"Auxiliary spray",&mut c.spray.auxiliary_percent);
                });
                egui::CollapsingHeader::new("Steam-generator valves").show(&mut columns[1],|ui|{if let Some(v)=&mut c.steam_valves {for i in 0..2 {ui.checkbox(&mut v.main[i].manual,format!("SG {} main manual",['A','B'][i]));percent(ui,&format!("SG {} main",['A','B'][i]),&mut v.main[i].percent);ui.checkbox(&mut v.feedwater[i].manual,format!("SG {} feedwater manual",['A','B'][i]));percent(ui,&format!("SG {} feedwater",['A','B'][i]),&mut v.feedwater[i].percent);}}});
                egui::CollapsingHeader::new("Recovered event inputs").show(&mut columns[1],|ui|{if let Some(events)=&mut c.event_schedule {ui.horizontal(|ui|{ui.label("RCP trip time (s)");ui.add(egui::DragValue::new(&mut events.times[6]).speed(0.1));});ui.horizontal(|ui|{ui.label("Loop / SG failure time (s)");ui.add(egui::DragValue::new(&mut events.times[8]).speed(0.1));});for (i,label) in [(7,"Thermal fault flag"),(8,"SG fault flag"),(2,"SG A valve fault"),(3,"SG B valve fault")] {ui.horizontal(|ui|{ui.label(label);ui.add(egui::DragValue::new(&mut events.flags[i]));});}}else{ui.label("No event schedule in this state; remaining scenario dispatch is not reconstructed.");}});
            });
            ui.separator();ui.heading("Recorded history");
            egui::ComboBox::from_id_salt("engine_series").selected_text(SERIES[self.selected_series].1).show_ui(ui,|ui|{for (i,(_,label,unit)) in SERIES.iter().enumerate() {ui.selectable_value(&mut self.selected_series,i,format!("{label} ({unit})"));}});
            chart(ui,w,self.selected_series);
            ui.label(format!("{} retained samples of {} updates · CSV exports the retained history. Reset restores the loaded state.",w.history.len(),w.updates));
            ui.horizontal(|ui|->Result<()> {ui.label("Save session");ui.text_edit_singleline(&mut self.save_path);if ui.button("Save state").clicked(){w.save(Path::new(&self.save_path))?;self.message=Some(format!("Saved {}",self.save_path));}Ok(())}).inner?;
            ui.horizontal(|ui|->Result<()> {ui.label("History CSV");ui.text_edit_singleline(&mut self.csv_path);if ui.button("Export CSV").clicked(){w.export_csv(Path::new(&self.csv_path))?;self.message=Some(format!("Saved {}",self.csv_path));}Ok(())}).inner?;
            Ok(())
        }).inner
    }
}
fn percent(ui: &mut egui::Ui, label: &str, value: &mut i16) {
    ui.horizontal(|ui| {
        ui.label(label);
        ui.add(egui::DragValue::new(value).range(0..=100).suffix(" %"));
    });
}
fn chart(ui: &mut egui::Ui, w: &SimulationWorkspace, series: usize) {
    let (rect, _) =
        ui.allocate_exact_size(Vec2::new(ui.available_width(), 240.), egui::Sense::hover());
    let p = ui.painter_at(rect);
    p.rect_filled(rect, 6., super::PANEL);
    let points: Vec<_> = w
        .history
        .iter()
        .step_by((w.history.len() / 2000).max(1))
        .filter_map(|s| s.values[series].map(|v| (s.clock, v)))
        .collect();
    if points.is_empty() {
        p.text(
            rect.center(),
            egui::Align2::CENTER_CENTER,
            "Press Step or Start to record computed values.",
            egui::FontId::proportional(14.),
            super::MUTED,
        );
        return;
    }
    let xmin = points[0].0;
    let xmax = points.last().unwrap().0;
    let ymin = points.iter().map(|(_, y)| *y).fold(f32::INFINITY, f32::min);
    let ymax = points
        .iter()
        .map(|(_, y)| *y)
        .fold(f32::NEG_INFINITY, f32::max);
    let plot = rect.shrink2(Vec2::new(65., 28.));
    let dx = (xmax - xmin).max(f32::EPSILON);
    let dy = (ymax - ymin).max(ymax.abs().max(1.) * 1e-6);
    let pos = |x: f32, y: f32| {
        egui::pos2(
            plot.left() + (x - xmin) / dx * plot.width(),
            plot.bottom() - (y - ymin) / dy * plot.height(),
        )
    };
    for i in 0..=4 {
        let y = ymin + dy * i as f32 / 4.;
        let py = pos(xmin, y).y;
        p.line_segment(
            [egui::pos2(plot.left(), py), egui::pos2(plot.right(), py)],
            Stroke::new(1.0_f32, super::BORDER),
        );
        p.text(
            egui::pos2(plot.left() - 5., py),
            egui::Align2::RIGHT_CENTER,
            format!("{y:.4}"),
            egui::FontId::monospace(11.),
            super::MUTED,
        );
    }
    p.add(egui::Shape::line(
        points.iter().map(|(x, y)| pos(*x, *y)).collect(),
        Stroke::new(2.0_f32, super::AMBER),
    ));
    if points.len() == 1 {
        p.circle_filled(pos(points[0].0, points[0].1), 3., super::AMBER);
    }
    p.text(
        egui::pos2(plot.left(), plot.bottom() + 7.),
        egui::Align2::LEFT_TOP,
        format!("{xmin:.6} s"),
        egui::FontId::monospace(11.),
        Color32::LIGHT_GRAY,
    );
    p.text(
        egui::pos2(plot.right(), plot.bottom() + 7.),
        egui::Align2::RIGHT_TOP,
        format!("{xmax:.6} s · {}", SERIES[series].2),
        egui::FontId::monospace(11.),
        Color32::LIGHT_GRAY,
    );
}

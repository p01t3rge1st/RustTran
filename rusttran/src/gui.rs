#![cfg_attr(target_os = "windows", windows_subsystem = "windows")]
//! Native desktop presentation of recovered PCTran initial conditions.
//! The unlimited preview clock does not evolve the unreconstructed plant model.
mod gui_engine;
mod schematic;
use eframe::egui::{self, Color32, FontId, RichText, Stroke, Vec2};
use rusttran::{
    Row, physics,
    presentation::{Presentation, RunClock},
};
use serde::Serialize;
use std::{
    collections::BTreeMap,
    path::PathBuf,
    time::{Duration, Instant},
};

const BG: Color32 = Color32::from_rgb(198, 195, 198);
const PANEL: Color32 = Color32::from_rgb(198, 195, 198);
const BORDER: Color32 = Color32::from_rgb(80, 80, 80);
const MUTED: Color32 = Color32::from_rgb(64, 64, 64);
const INK: Color32 = Color32::from_rgb(0, 0, 0);
const AMBER: Color32 = Color32::from_rgb(0, 0, 128);

#[derive(Clone, Copy, PartialEq)]
enum View {
    Simulation,
    LiveSchematic,
    Schematic,
    Plots,
    Data,
    Properties,
}
impl View {
    fn runs_session(self) -> bool {
        matches!(self, Self::Simulation | Self::LiveSchematic)
    }
}
#[derive(Default, Serialize)]
struct MalfunctionDraft {
    active: bool,
    fraction: f64,
}

struct RustTranApp {
    engine: gui_engine::EnginePanel,
    model: Presentation,
    clock: RunClock,
    last_frame: Instant,
    view: View,
    error: Option<String>,
    show_malfunctions: bool,
    show_about: bool,
    show_condition_selector: bool,
    show_initialization: bool,
    initialization_model: String,
    initialized_primary: Option<rusttran::fresh_steam::FreshInitializedState>,
    initialization_fault: bool,
    initialization_export: String,
    selected: Option<schematic::ComponentSelection>,
    selected_live: bool,
    show_live_schematic: bool,
    drafts: BTreeMap<String, MalfunctionDraft>,
    query: String,
    data_section: usize,
    property_pressure: f64,
    property_temperature: f64,
    export_path: String,
    notification: Option<String>,
    #[cfg(feature = "gui-screenshot")]
    screenshot_path: Option<PathBuf>,
    #[cfg(feature = "gui-screenshot")]
    screenshot_requested: bool,
    #[cfg(feature = "gui-screenshot")]
    frame_count: usize,
    #[cfg(feature = "gui-screenshot")]
    screenshot_after_frames: usize,
    #[cfg(feature = "gui-screenshot")]
    gui_state_path: Option<PathBuf>,
}

// Fixed-size vector icons avoid platform-dependent missing Unicode glyphs.
fn classic_tool(ui: &mut egui::Ui, action: usize, tip: &str) -> egui::Response {
    let response = ui.add_sized([25., 24.], egui::Button::new(""));
    let p = ui.painter();
    let r = response.rect;
    let pos = |x: f32, y: f32| r.min + Vec2::new(x, y);
    let line = |points: &[(f32, f32)], color: Color32| {
        p.add(egui::Shape::line(
            points.iter().map(|&(x, y)| pos(x, y)).collect(),
            Stroke::new(1.0_f32, color),
        ))
    };
    let rect = |x: f32, y: f32, w: f32, h: f32, color: Color32| {
        p.rect_filled(
            egui::Rect::from_min_size(pos(x, y), Vec2::new(w, h)),
            0.,
            color,
        )
    };
    match action {
        0 => {
            rect(5., 5., 5., 14., Color32::from_rgb(0, 0, 128));
            line(&[(11., 12.), (20., 12.), (16., 8.)], Color32::BLACK);
            line(&[(20., 12.), (16., 16.)], Color32::BLACK);
        }
        1 => {
            for (x, y) in [(5., 5.), (14., 5.), (5., 14.), (14., 14.)] {
                rect(x, y, 5., 5., Color32::WHITE);
                line(
                    &[(x, y), (x + 5., y), (x + 5., y + 5.), (x, y + 5.), (x, y)],
                    Color32::BLACK,
                );
            }
        }
        2 => {
            line(&[(20., 12.), (5., 12.), (10., 7.)], Color32::BLACK);
            line(&[(5., 12.), (10., 17.)], Color32::BLACK);
        }
        3 | 4 => {
            p.circle_filled(pos(14., 6.), 2., Color32::BLACK);
            line(&[(14., 9.), (10., 14.), (6., 14.)], Color32::BLACK);
            line(&[(10., 13.), (15., 16.), (18., 20.)], Color32::BLACK);
            line(&[(11., 14.), (8., 20.)], Color32::BLACK);
            if action == 4 {
                line(&[(6., 5.), (20., 20.)], Color32::WHITE);
            }
        }
        5 => {
            rect(7., 5., 11., 15., Color32::RED);
            line(&[(5., 5.), (20., 20.)], Color32::WHITE);
            line(&[(20., 5.), (5., 20.)], Color32::WHITE);
        }
        6 | 7 => {
            rect(5., 5., 16., 15., Color32::WHITE);
            line(&[(5., 5.), (5., 20.), (21., 20.)], Color32::BLACK);
            line(
                &[(7., 16.), (10., 11.), (14., 15.), (19., 8.)],
                Color32::BLUE,
            );
            if action == 6 {
                line(
                    &[(7., 8.), (11., 16.), (18., 13.)],
                    Color32::from_rgb(0, 132, 0),
                );
            }
        }
        11 => {
            line(&[(7., 5.), (7., 20.)], Color32::BLACK);
            p.add(egui::Shape::convex_polygon(
                vec![pos(10., 5.), pos(20., 12.), pos(10., 20.)],
                Color32::BLACK,
                Stroke::NONE,
            ));
        }
        8 => {
            rect(6., 4., 14., 17., Color32::WHITE);
            for y in [8., 11., 14., 17.] {
                line(&[(9., y), (17., y)], Color32::BLUE);
            }
            line(
                &[(6., 4.), (20., 4.), (20., 21.), (6., 21.), (6., 4.)],
                Color32::BLACK,
            );
        }
        9 => {
            for y in [5., 11., 17.] {
                rect(5., y, 4., 4., Color32::BLUE);
                line(&[(12., y + 2.), (20., y + 2.)], Color32::BLACK);
            }
        }
        _ => {
            p.text(
                r.center(),
                egui::Align2::CENTER_CENTER,
                "?",
                FontId::proportional(18.),
                Color32::from_rgb(0, 100, 100),
            );
        }
    }
    track_widget(response, &format!("classic_tool_{action}")).on_hover_text(tip)
}
fn track_widget(response: egui::Response, key: &str) -> egui::Response {
    #[cfg(feature = "gui-screenshot")]
    response.ctx.data_mut(|data| {
        let id = egui::Id::new("test_widget_rects");
        let mut bounds = data
            .get_temp::<BTreeMap<String, [f32; 4]>>(id)
            .unwrap_or_default();
        let rect = response.rect;
        bounds.insert(key.into(), [rect.min.x, rect.min.y, rect.max.x, rect.max.y]);
        data.insert_temp(id, bounds);
    });
    #[cfg(not(feature = "gui-screenshot"))]
    let _ = key;
    response
}

fn theme(ctx: &egui::Context) {
    let mut fonts = egui::FontDefinitions::default();
    fonts.font_data.insert(
        "classic-sans".into(),
        egui::FontData::from_static(include_bytes!("../assets/fonts/LiberationSans-Regular.ttf"))
            .into(),
    );
    fonts.font_data.insert(
        "classic-bold".into(),
        egui::FontData::from_static(include_bytes!("../assets/fonts/LiberationSans-Bold.ttf"))
            .into(),
    );
    fonts
        .families
        .entry(egui::FontFamily::Proportional)
        .or_default()
        .insert(0, "classic-sans".into());
    fonts.families.insert(
        egui::FontFamily::Name("classic-bold".into()),
        vec!["classic-bold".into()],
    );
    ctx.set_fonts(fonts);
    let mut visuals = egui::Visuals::light();
    visuals.panel_fill = BG;
    visuals.window_fill = PANEL;
    visuals.extreme_bg_color = Color32::from_rgb(255, 255, 255);
    visuals.faint_bg_color = Color32::from_rgb(222, 223, 222);
    visuals.override_text_color = Some(INK);
    visuals.selection.bg_fill = Color32::from_rgb(170, 170, 205);
    visuals.selection.stroke = Stroke::new(1.0_f32, AMBER);
    visuals.widgets.noninteractive.bg_stroke = Stroke::new(1.0_f32, BORDER);
    visuals.widgets.inactive.bg_fill = Color32::from_rgb(198, 195, 198);
    visuals.widgets.inactive.weak_bg_fill = Color32::from_rgb(198, 195, 198);
    visuals.widgets.inactive.bg_stroke = Stroke::new(1.0_f32, BORDER);
    visuals.widgets.hovered.bg_fill = Color32::from_rgb(222, 223, 222);
    visuals.widgets.hovered.weak_bg_fill = Color32::from_rgb(222, 223, 222);
    visuals.widgets.hovered.bg_stroke = Stroke::new(1.0_f32, AMBER);
    visuals.widgets.active.bg_fill = Color32::from_rgb(170, 170, 170);
    visuals.widgets.active.weak_bg_fill = Color32::from_rgb(170, 170, 170);
    for widgets in [
        &mut visuals.widgets.inactive,
        &mut visuals.widgets.hovered,
        &mut visuals.widgets.active,
        &mut visuals.widgets.noninteractive,
    ] {
        widgets.corner_radius = egui::CornerRadius::ZERO;
        widgets.fg_stroke = Stroke::new(1.0_f32, INK);
    }
    visuals.window_corner_radius = egui::CornerRadius::ZERO;
    ctx.set_visuals(visuals);
    ctx.style_mut(|style| {
        style.spacing.item_spacing = Vec2::new(4.0, 3.0);
        style.spacing.button_padding = Vec2::new(5.0, 3.0);
        style
            .text_styles
            .insert(egui::TextStyle::Body, FontId::proportional(12.0));
        style
            .text_styles
            .insert(egui::TextStyle::Button, FontId::proportional(12.0));
        style
            .text_styles
            .insert(egui::TextStyle::Heading, FontId::proportional(16.0));
        style
            .text_styles
            .insert(egui::TextStyle::Monospace, FontId::monospace(14.0));
    });
}

impl RustTranApp {
    fn new(
        cc: &eframe::CreationContext<'_>,
        model: Presentation,
        clock: RunClock,
        view: View,
    ) -> Self {
        theme(&cc.egui_ctx);
        let pressure = f64::from(
            rusttran::bindings::native_pressure(model.number("P").unwrap_or(155.0))
                .unwrap_or(155. * rusttran::bindings::PRESSURE_FACTOR),
        );
        let temperature = f64::from(
            rusttran::bindings::native_temperature(model.number("TAVG").unwrap_or(300.0))
                .unwrap_or(
                    300. * rusttran::bindings::TEMPERATURE_FACTOR
                        + rusttran::bindings::TEMPERATURE_OFFSET,
                ),
        );
        Self {
            engine: gui_engine::EnginePanel::default(),
            model,
            clock,
            last_frame: Instant::now(),
            view,
            error: None,
            show_malfunctions: false,
            show_about: false,
            show_condition_selector: false,
            show_initialization: false,
            initialization_model: "1".into(),
            initialized_primary: None,
            initialization_fault: false,
            initialization_export: "initialized-state.json".into(),
            selected: None,
            selected_live: false,
            show_live_schematic: false,
            drafts: BTreeMap::new(),
            query: String::new(),
            data_section: 0,
            property_pressure: pressure,
            property_temperature: temperature,
            export_path: "scenarios/scenario.json".into(),
            notification: None,
            #[cfg(feature = "gui-screenshot")]
            screenshot_path: std::env::var_os("RUSTTRAN_SCREENSHOT_TO").map(PathBuf::from),
            #[cfg(feature = "gui-screenshot")]
            screenshot_requested: false,
            #[cfg(feature = "gui-screenshot")]
            frame_count: 0,
            #[cfg(feature = "gui-screenshot")]
            screenshot_after_frames: std::env::var("RUSTTRAN_SCREENSHOT_FRAME")
                .ok()
                .and_then(|v| v.parse().ok())
                .unwrap_or(8),
            #[cfg(feature = "gui-screenshot")]
            gui_state_path: std::env::var_os("RUSTTRAN_GUI_STATE_TO").map(PathBuf::from),
        }
    }
    fn handle(&mut self, result: rusttran::Result<()>) {
        if let Err(error) = result {
            self.error = Some(error.to_string());
        }
    }
    fn primary_initialization_window(&mut self, ctx: &egui::Context) {
        if !self.show_initialization {
            return;
        }
        let mut open = true;
        egui::Window::new("Thermal system initialization")
            .open(&mut open)
            .default_width(480.)
            .show(ctx, |ui| {
                ui.label("Fresh primary and steam-generator calculation for the selected operating point.");
                ui.label(
                    "Full plant startup and transient simulation are still being reconstructed.",
                );
                match self.model.model_choices() {
                    Ok(models) => {
                        egui::ComboBox::from_label("Plant model")
                            .selected_text(
                                models
                                    .iter()
                                    .find(|m| m.id == self.initialization_model)
                                    .map(|m| m.description.as_str())
                                    .unwrap_or("Choose model"),
                            )
                            .show_ui(ui, |ui| {
                                for model in models {
                                    if ui
                                        .selectable_value(
                                            &mut self.initialization_model,
                                            model.id,
                                            model.description,
                                        )
                                        .changed()
                                    {
                                        self.initialized_primary = None;
                                    }
                                }
                            });
                    }
                    Err(error) => {
                        ui.colored_label(AMBER, error.to_string());
                    }
                }
                if ui.checkbox(&mut self.initialization_fault, "Initial SG failure selected").changed() { self.initialized_primary = None; }
                if ui.button("Initialize thermal systems").clicked() {
                    match self
                        .model
                        .initialize_fresh_state(&self.initialization_model, if self.initialization_fault { -1 } else { 0 })
                    {
                        Ok(out) => self.initialized_primary = Some(out),
                        Err(error) => {
                            self.initialized_primary = None;
                            self.error = Some(error.to_string());
                        }
                    }
                }
                if let Some(out) = &self.initialized_primary {
                    ui.separator();
                    ui.label("Includes thermal model initial state. This is not a runnable session or an original save file.");
                    ui.horizontal(|ui| {
                        ui.text_edit_singleline(&mut self.initialization_export);
                        if ui.button("Save initialized state").clicked() {
                            let result = serde_json::to_vec_pretty(out).map_err(|e| e.to_string()).and_then(|bytes| std::fs::write(&self.initialization_export, bytes).map_err(|e|e.to_string()));
                            match result { Ok(()) => self.notification=Some(format!("Initialized state saved to {}",self.initialization_export)), Err(error) => self.error=Some(error) }
                        }
                    });
                    egui::Grid::new("primary_initialized_values")
                        .striped(true)
                        .show(ui, |ui| {
                            for (address, label, unit) in [
                                ("0x54b494", "Pressure", "psia"),
                                ("0x54b498", "Coolant temperature", "°F"),
                                ("0x54b4f4", "Steam-generator inventory A", "lb"),
                                ("0x54b4f8", "Steam-generator inventory B", "lb"),
                                ("0x54b4a0", "Liquid level", "fraction"),
                                ("0x54b7ec", "Vapor volume fraction", "fraction"),
                                ("0x54b4f0", "Vapor mass fraction", "fraction"),
                                ("0x54b7f0", "Pressurizer inventory", "lb"),
                                ("0x54ba4c", "Pressure reference", "psia"),
                                ("0x54b6c0", "Level indication", "%"),
                        ("0x54b504", "Steam-generator vapor fraction A", "fraction"),
                        ("0x54b508", "Steam-generator vapor fraction B", "fraction"),
                        ("0x54b528", "Feedwater flow A", "lb/s"),
                        ("0x54b52c", "Feedwater flow B", "lb/s"),
                        ("0x54b530", "Primary coolant flow A", "lb/s"),
                        ("0x54b534", "Primary coolant flow B", "lb/s"),
                            ] {
                                if let Some(value) = out.globals.singles.get(address) {
                                    ui.label(label);
                                    ui.label(
                                        RichText::new(format!("{value:.5} {unit}")).color(AMBER),
                                    );
                                    ui.end_row();
                                }
                            }
                        });
                }
            });
        self.show_initialization = open;
    }
    fn reset(&mut self) {
        if self.view.runs_session() {
            self.engine.reset();
            self.last_frame = Instant::now();
            return;
        }
        let result = self.clock.reset();
        self.handle(result);
        self.last_frame = Instant::now();
    }
    fn select_condition(&mut self, id: &str) {
        match self.model.select(id) {
            Ok(()) => {
                self.reset();
                self.drafts.clear();
                self.initialized_primary = None;
                self.selected = None;
                self.notification = None;
            }
            Err(error) => self.error = Some(error.to_string()),
        }
    }
    fn menu(&mut self, ctx: &egui::Context) {
        egui::TopBottomPanel::top("menu")
            .frame(
                egui::Frame::new()
                    .fill(BG)
                    .inner_margin(egui::Margin::symmetric(4, 0)),
            )
            .show(ctx, |ui| {
                egui::MenuBar::new().ui(ui, |ui| {
                    ui.menu_button("File", |ui| {
                        if ui.button("Simulation workspace…").clicked() {
                            self.view = View::Simulation;
                            ui.close();
                        }
                        if ui.button("Load containment-cooling example").clicked() {
                            let result=self.engine.load_fan_sample();self.handle(result);
                            self.view=View::LiveSchematic;self.selected=None;
                            ui.close();
                        }
                        if ui.button("Export scenario…").clicked() {
                            self.show_malfunctions = true;
                            ui.close();
                        }
                        ui.separator();
                        if ui.button("Close").clicked() {
                            ctx.send_viewport_cmd(egui::ViewportCommand::Close);
                        }
                    });
                    ui.menu_button("Restart", |ui| {
                        if ui
                            .button(if self.view.runs_session() {
                                "Reset loaded state"
                            } else {
                                "Reset preview time"
                            })
                            .clicked()
                        {
                            self.reset();
                            ui.close();
                        }
                        if self.view.runs_session() {
                            ui.label("Reset restores the loaded session. IC selection belongs to the stored-state views.");
                            return;
                        }
                        let mut choice = None;
                        for condition in &self.model.conditions {
                            if ui
                                .button(format!("IC {} · {}", condition.id, condition.description))
                                .clicked()
                            {
                                choice = Some(condition.id.clone());
                                ui.close();
                            }
                        }
                        if let Some(id) = choice {
                            self.select_condition(&id);
                        }
                    });
                    ui.menu_button("Edit", |ui| {
                        if ui.button("Malfunctions…").clicked() {
                            self.show_malfunctions = true;
                            ui.close();
                        }
                    });
                    let menu_response = ui.menu_button("View", |ui| {
                        if track_widget(ui.add_enabled(self.engine.workspace.is_some(), egui::Button::new("Live simulation mimic…")), "live_mimic_item").clicked() {
                            self.view=View::Simulation;
                            self.show_live_schematic=true;
                            ui.close();
                        }
                        if track_widget(ui.add_enabled(self.engine.workspace.is_some(), egui::Button::new("Computed NSSS mimic")), "computed_mimic_item").clicked() {
                            self.view=View::LiveSchematic; self.selected=None;
                            ui.close();
                        }
                        for (view, label) in [
                            (View::Simulation, "Simulation workspace"),
                            (View::Schematic, "NSSS mimic"),
                            (View::Plots, "Decay heat curve"),
                            (View::Data, "State data"),
                            (View::Properties, "Water / steam properties"),
                        ] {
                            if ui.selectable_label(self.view == view, label).clicked() {
                                self.view = view;
                                ui.close();
                            }
                        }
                    });
                    track_widget(menu_response.response, "view_menu");
                    ui.menu_button("Code Control", |ui| {
                        if ui.button("Initialize thermal systems…").clicked() {
                            self.show_initialization = true;
                            ui.close();
                        }
                        if ui
                            .button(if self.view.runs_session() {
                                "Start simulation"
                            } else {
                                "Start preview"
                            })
                            .clicked()
                        {
                            let result = if self.view.runs_session() {
                                self.engine.start()
                            } else {
                                self.clock.start()
                            };
                            self.handle(result);
                            ui.close();
                        }
                        if ui.button("Pause").clicked() {
                            let result = if self.view.runs_session() {
                                self.engine.pause();
                                Ok(())
                            } else {
                                self.clock.pause()
                            };
                            self.handle(result);
                            ui.close();
                        }
                        if ui.button("Malfunctions…").clicked() {
                            self.show_malfunctions = true;
                            ui.close();
                        }
                    });
                    if ui.button("Help").clicked() {
                        self.show_about = true;
                    }
                    ui.with_layout(egui::Layout::right_to_left(egui::Align::Center), |ui| {
                        ui.label(RichText::new("PWR · 3 LOOPS").size(11.0).color(MUTED));
                    });
                });
            });
    }
    fn toolbar(&mut self, ctx: &egui::Context) {
        if self.view == View::Simulation {
            let result = egui::TopBottomPanel::top("engine_toolbar")
                .show(ctx, |ui| self.engine.toolbar(ui))
                .inner;
            self.handle(result);
            return;
        }
        egui::TopBottomPanel::top("toolbar")
            .exact_height(28.0)
            .frame(
                egui::Frame::new()
                    .fill(BG)
                    .inner_margin(egui::Margin::symmetric(2, 1))
                    .stroke(Stroke::new(1.0_f32, Color32::WHITE)),
            )
            .show(ctx, |ui| {
                ui.horizontal(|ui| {
                    let buttons = [
                        ("↪", "Close", 0),
                        ("IC", "Initial conditions (Restart menu)", 1),
                        (
                            "↶",
                            if self.view.runs_session() {
                                "Reset loaded session"
                            } else {
                                "Reset preview time"
                            },
                            2,
                        ),
                        (
                            "▶",
                            if self.view.runs_session() {
                                "Start simulation"
                            } else {
                                "Start preview clock; stored plant values do not evolve"
                            },
                            3,
                        ),
                        (
                            "Ⅱ",
                            if self.view.runs_session() {
                                "Pause simulation"
                            } else {
                                "Pause preview clock"
                            },
                            4,
                        ),
                        ("■", "Reset", 5),
                        ("▧", "NSSS mimic", 6),
                        ("⌁", "Decay heat curve", 7),
                        ("▤", "State data", 8),
                        ("⚙", "Simulation workspace", 9),
                        ("?", "About RustTran", 10),
                        ("Step", "Compute one step (loaded session)", 11),
                    ];
                    for (_label, tip, action) in buttons {
                        if classic_tool(ui, action, tip).clicked() {
                            match action {
                                0 => ctx.send_viewport_cmd(egui::ViewportCommand::Close),
                                1 => {
                                    self.view = View::Schematic;
                                    self.engine.pause();
                                    self.show_condition_selector = true;
                                }
                                2 | 5 => self.reset(),
                                3 => {
                                    let result = if self.view.runs_session() {
                                        self.engine.start()
                                    } else {
                                        self.clock.start()
                                    };
                                    self.handle(result);
                                }
                                4 => {
                                    let result = if self.view.runs_session() {
                                        self.engine.pause();
                                        Ok(())
                                    } else {
                                        self.clock.pause()
                                    };
                                    self.handle(result);
                                }
                                6 => {
                                    self.view = if self.engine.workspace.is_some() {
                                        View::LiveSchematic
                                    } else {
                                        View::Schematic
                                    }
                                }
                                7 => self.view = View::Plots,
                                8 => self.view = View::Data,
                                9 => self.view = View::Simulation,
                                11 => {
                                    if let Some(w) = &mut self.engine.workspace {
                                        w.pause();
                                        let result = w.advance_steps(1);
                                        self.handle(result);
                                    } else {
                                        self.error =
                                            Some("Load a session in Simulation first.".into());
                                    }
                                }
                                _ => self.show_about = true,
                            }
                        }
                    }
                });
            });
    }
    fn status_bar(&mut self, ctx: &egui::Context) {
        if self.view.runs_session() {
            egui::TopBottomPanel::bottom("engine_status").show(ctx, |ui| {
                ui.horizontal(|ui| {
                    ui.label(
                        RichText::new(if self.engine.running() {
                            "RUN · RECOVERED ENGINE"
                        } else {
                            "PAUSED · RECOVERED ENGINE"
                        })
                        .color(AMBER),
                    );
                    if let Some(w) = &self.engine.workspace {
                        ui.label(format!(
                            "{:.2} sec · {} updates",
                            w.session.controls.clock, w.updates
                        ));
                    }
                    ui.label("Supplied state · complete plant validation pending");
                });
            });
            return;
        }
        egui::TopBottomPanel::bottom("status")
            .exact_height(22.)
            .frame(
                egui::Frame::new()
                    .fill(BG)
                    .inner_margin(egui::Margin::symmetric(3, 1))
                    .stroke(Stroke::new(1.0_f32, Color32::WHITE)),
            )
            .show(ctx, |ui| {
                ui.horizontal(|ui| {
                    ui.label(if self.clock.running {
                        "RUN · PREVIEW"
                    } else {
                        "FREEZE"
                    });
                    ui.separator();
                    ui.label(format!("{:.2} sec", self.clock.elapsed_seconds));
                    ui.separator();
                    ui.label(format!("IC {}", self.model.selected_id));
                    ui.separator();
                    ui.label("Stored initial condition");
                    if let Some(text) = &self.notification {
                        ui.label(text);
                    }
                });
            });
    }
    fn plots(&self, ui: &mut egui::Ui) {
        ui.heading("Decay heat after shutdown");
        ui.label(
            RichText::new(
                "DECAY correlation · an independent curve, separate from the stored plant state.",
            )
            .color(MUTED),
        );
        ui.add_space(18.0);
        let available = ui.available_size();
        let (outer, _) = ui.allocate_exact_size(
            Vec2::new(available.x, available.y.max(300.0) - 20.0),
            egui::Sense::hover(),
        );
        let painter = ui.painter();
        painter.rect_filled(outer, 8.0, PANEL);
        let graph = outer.shrink2(Vec2::new(65.0, 65.0));
        let duration = self.clock.elapsed_seconds.max(1000.0);
        let maximum = 0.08;
        let point = |time: f64, value: f64| {
            egui::pos2(
                graph.min.x + (time / duration) as f32 * graph.width(),
                graph.max.y - (value / maximum) as f32 * graph.height(),
            )
        };
        for n in 0..=4 {
            let fraction = n as f32 / 4.0;
            let x = graph.min.x + graph.width() * fraction;
            let y = graph.max.y - graph.height() * fraction;
            painter.line_segment(
                [egui::pos2(x, graph.min.y), egui::pos2(x, graph.max.y)],
                Stroke::new(1.0_f32, BORDER),
            );
            painter.line_segment(
                [egui::pos2(graph.min.x, y), egui::pos2(graph.max.x, y)],
                Stroke::new(1.0_f32, BORDER),
            );
            painter.text(
                egui::pos2(x, graph.max.y + 18.0),
                egui::Align2::CENTER_TOP,
                format!("{:.0}", duration * fraction as f64),
                FontId::monospace(12.0),
                MUTED,
            );
            painter.text(
                egui::pos2(graph.min.x - 12.0, y),
                egui::Align2::RIGHT_CENTER,
                format!("{:.0}%", maximum * fraction as f64 * 100.0),
                FontId::monospace(12.0),
                MUTED,
            );
        }
        let points = (0..=600)
            .filter_map(|i| {
                let t = duration * i as f64 / 600.0;
                physics::decay(t).ok().map(|v| point(t, v as f64))
            })
            .collect::<Vec<_>>();
        painter.add(egui::Shape::line(points, Stroke::new(2.0_f32, AMBER)));
        if let Ok(value) = physics::decay(self.clock.elapsed_seconds) {
            let location = point(self.clock.elapsed_seconds, value as f64);
            painter.circle_filled(location, 5.0, AMBER);
            painter.text(
                outer.min + Vec2::new(26.0, 17.0),
                egui::Align2::LEFT_TOP,
                format!(
                    "DECAY({:.1} s) = {:.4}%",
                    self.clock.elapsed_seconds,
                    value * 100.0
                ),
                FontId::monospace(14.0),
                INK,
            );
        }
        painter.text(
            egui::pos2(graph.center().x, outer.max.y - 8.0),
            egui::Align2::CENTER_BOTTOM,
            "Time [s]",
            FontId::proportional(12.0),
            MUTED,
        );
    }
    fn data(&mut self, ui: &mut egui::Ui) {
        ui.horizontal(|ui| {
            ui.heading(format!("Initial condition IC {}", self.model.selected_id));
            ui.with_layout(egui::Layout::right_to_left(egui::Align::Center), |ui| {
                ui.add(
                    egui::TextEdit::singleline(&mut self.query)
                        .hint_text("Search parameters…")
                        .desired_width(260.0),
                );
            });
        });
        ui.add_space(12.0);
        ui.horizontal(|ui| {
            for (i, name) in ["Thermodynamics", "Pumps", "Valves", "Core"]
                .into_iter()
                .enumerate()
            {
                ui.selectable_value(&mut self.data_section, i, name);
            }
        });
        ui.separator();
        let row: &Row = match self.data_section {
            1 => &self.model.pumps,
            2 => &self.model.valves,
            3 => &self.model.core,
            _ => &self.model.thermo,
        };
        if row.is_empty() {
            ui.label("No stored data for this initial condition.");
            return;
        }
        let query = self.query.to_lowercase();
        egui::ScrollArea::vertical().show(ui, |ui| {
            egui::Grid::new("snapshot_values")
                .striped(true)
                .min_col_width(240.0)
                .spacing(Vec2::new(40.0, 10.0))
                .show(ui, |ui| {
                    ui.label(RichText::new("PARAMETER").color(MUTED));
                    ui.label(RichText::new("STORED VALUE").color(MUTED));
                    ui.end_row();
                    for (key, value) in row {
                        if !key.to_lowercase().contains(&query)
                            && !value.to_lowercase().contains(&query)
                        {
                            continue;
                        }
                        ui.monospace(key);
                        ui.label(if value.is_empty() { "—" } else { value });
                        ui.end_row();
                    }
                });
        });
    }
    fn properties(&mut self, ui: &mut egui::Ui) {
        ui.heading("Water and steam properties");
        ui.label(
            RichText::new("Plant correlations and tables · original calculation units.")
                .color(MUTED),
        );
        ui.add_space(24.0);
        ui.horizontal(|ui| {
            ui.label("Pressure [psia]");
            ui.add(
                egui::DragValue::new(&mut self.property_pressure)
                    .speed(1.0)
                    .range(0.001..=10000.0),
            );
            ui.add_space(24.0);
            ui.label("Temperature [°F]");
            ui.add(egui::DragValue::new(&mut self.property_temperature).speed(1.0));
        });
        ui.add_space(24.0);
        let p = self.property_pressure as f32;
        let t = self.property_temperature as f32;
        let values = [
            (
                "HFLD",
                "Saturated liquid enthalpy",
                physics::hfld(p).map(f64::from),
                "Btu/lb",
            ),
            (
                "HGAS",
                "Saturated steam enthalpy",
                physics::hgas(p).map(f64::from),
                "Btu/lb",
            ),
            (
                "HLIQ",
                "Liquid enthalpy",
                physics::liquid_enthalpy(p, t),
                "Btu/lb",
            ),
            (
                "TLIQ",
                "Saturation temperature",
                physics::saturation_temperature(p).map(f64::from),
                "°F",
            ),
            (
                "VFLD",
                "Liquid specific volume",
                physics::vfld(p).map(f64::from),
                "ft³/lb",
            ),
            (
                "VLIQ",
                "Pressure-corrected liquid specific volume",
                physics::liquid_specific_volume(p, t).map(f64::from),
                "ft³/lb",
            ),
            (
                "VGAS",
                "Steam specific volume",
                physics::vapor_specific_volume(p).map(f64::from),
                "ft³/lb",
            ),
            (
                "PSAT",
                "Saturation pressure",
                physics::saturation_pressure(t).map(f64::from),
                "psia",
            ),
        ];
        egui::Grid::new("water_values")
            .min_col_width(120.0)
            .spacing(Vec2::new(36.0, 22.0))
            .show(ui, |ui| {
                for (code, label, value, unit) in values {
                    ui.label(RichText::new(code).monospace().color(AMBER));
                    ui.label(label);
                    match value {
                        Ok(value) => {
                            ui.label(RichText::new(format!("{value:.5}")).monospace().strong());
                        }
                        Err(error) => {
                            ui.label(RichText::new(error.to_string()).color(MUTED));
                        }
                    }
                    ui.label(RichText::new(unit).color(MUTED));
                    ui.end_row();
                }
            });
    }
    fn dialogs(&mut self, ctx: &egui::Context) {
        if let Some(selection) = &self.selected {
            let mut open = true;
            let mut dismiss = false;
            egui::Window::new(&selection.label).id(egui::Id::new("equipment_details")).open(&mut open).resizable(false).show(ctx,|ui|{
                ui.label(RichText::new(if self.selected_live {"Computed recovered-session value · commands apply on the next step".into()} else {format!("IC {} · stored equipment state",self.model.selected_id)}).color(MUTED));ui.add_space(8.0);
                ui.horizontal(|ui|{ui.label(&selection.kind);ui.label(RichText::new(selection.value.map(|v|format!("{v:.1} {}",selection.unit)).unwrap_or_else(||"—".into())).font(FontId::monospace(24.0)).color(AMBER));});
                ui.label(RichText::new(&selection.key).monospace().color(MUTED));
                ui.separator();
                if self.selected_live {
                    if let Some(w)=&mut self.engine.workspace
                        && !gui_engine::device_control(ui, &selection.key, &mut w.session.controls) {
                        ui.label("No recovered control for this component yet.");
                    }
                } else { ui.label("Stored initial-condition value. Open Simulation to control a recovered session."); }
                dismiss=track_widget(ui.button("Close"),"component_close").clicked();
            });
            if !open || dismiss {
                self.selected = None;
            }
        }
        if self.show_malfunctions {
            let mut open = true;
            let mut export = false;
            egui::Window::new("Malfunctions · Scenario")
                .open(&mut open)
                .default_width(850.0)
                .default_height(520.0)
                .show(ctx, |ui| {
                    ui.label(
                        RichText::new(
                            "Scenario settings · do not change the displayed initial condition.",
                        )
                        .color(MUTED),
                    );
                    ui.add_space(10.0);
                    egui::ScrollArea::vertical()
                        .max_height(420.0)
                        .show(ui, |ui| {
                            egui::Grid::new("malfunctions")
                                .striped(true)
                                .spacing(Vec2::new(14.0, 12.0))
                                .show(ui, |ui| {
                                    ui.label("Active");
                                    ui.label("ID");
                                    ui.label("Malfunction");
                                    ui.label("Value");
                                    ui.label("Scale");
                                    ui.end_row();
                                    for row in &self.model.malfunctions.rows {
                                        let id =
                                            row.get("Malfunction").cloned().unwrap_or_default();
                                        let draft = self.drafts.entry(id.clone()).or_default();
                                        ui.checkbox(&mut draft.active, "");
                                        ui.monospace(id);
                                        ui.add(
                                            egui::Label::new(
                                                row.get("Description")
                                                    .map(String::as_str)
                                                    .unwrap_or("—"),
                                            )
                                            .wrap(),
                                        );
                                        ui.add(
                                            egui::DragValue::new(&mut draft.fraction).speed(1.0),
                                        );
                                        ui.label(
                                            RichText::new(
                                                row.get("Criteria")
                                                    .map(String::as_str)
                                                    .unwrap_or("—"),
                                            )
                                            .color(MUTED),
                                        );
                                        ui.end_row();
                                    }
                                });
                        });
                    ui.separator();
                    ui.horizontal(|ui| {
                        ui.label("File:");
                        ui.add(
                            egui::TextEdit::singleline(&mut self.export_path).desired_width(380.0),
                        );
                        if ui.button("Save scenario").clicked() {
                            export = true;
                        }
                    });
                });
            self.show_malfunctions = open;
            if export {
                self.export_scenario();
            }
        }
        if self.show_about {
            egui::Window::new("RustTran").open(&mut self.show_about).default_width(470.0).show(ctx,|ui|{
                ui.heading("PWR · 3 loops");ui.label("Plant layout: NSSS mimic, ECCS, coolant loops and equipment panels.");ui.separator();
                ui.label("The schematic displays stored initial-condition values. The Simulation view runs recovered sessions.");
                ui.label("Click a pump or valve to inspect its stored state. Select an initial condition in the toolbar to update the plant display.");
                egui::CollapsingHeader::new("Font license").show(ui, |ui| {
                    egui::ScrollArea::vertical().max_height(220.).show(ui, |ui| { ui.label(include_str!("../assets/fonts/LICENSE.txt")); });
                });
            });
        }
        if let Some(error) = self.error.clone() {
            let mut open = true;
            egui::Window::new("Operation failed")
                .open(&mut open)
                .show(ctx, |ui| {
                    ui.label(error);
                    if ui.button("Dismiss").clicked() {
                        self.error = None;
                    }
                });
            if !open {
                self.error = None;
            }
        }
    }
    fn export_scenario(&mut self) {
        let operation = || -> rusttran::Result<()> {
            if self.export_path.trim().is_empty() {
                return Err("enter a file name".into());
            }
            if self.drafts.values().any(|v| !v.fraction.is_finite()) {
                return Err("malfunction values must be finite".into());
            }
            let path = PathBuf::from(&self.export_path);
            if let Some(parent) = path.parent().filter(|p| !p.as_os_str().is_empty()) {
                std::fs::create_dir_all(parent)?;
            }
            let data = serde_json::to_vec_pretty(
                &serde_json::json!({"format":"rusttran-scenario-draft-v1","initial_condition":self.model.selected_id,"malfunctions":self.drafts,"scope":"Scenario settings only; transient engine not reconstructed"}),
            )?;
            use std::io::Write;
            let mut file = std::fs::OpenOptions::new()
                .write(true)
                .create_new(true)
                .open(path)?;
            file.write_all(&data)?;
            Ok(())
        };
        match operation() {
            Ok(()) => self.notification = Some(format!("Saved {}", self.export_path)),
            Err(error) => self.error = Some(error.to_string()),
        }
    }
}

impl eframe::App for RustTranApp {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        let now = Instant::now();
        let dt = now.duration_since(self.last_frame).as_secs_f64();
        self.last_frame = now;
        let result = if self.view.runs_session() {
            self.engine.tick(dt)
        } else {
            self.engine.pause();
            self.clock.advance(dt)
        };
        self.handle(result);
        self.menu(ctx);
        self.primary_initialization_window(ctx);
        if self.show_condition_selector {
            let mut open = true;
            let mut choice = None;
            egui::Window::new("Initial conditions")
                .open(&mut open)
                .resizable(false)
                .show(ctx, |ui| {
                    for condition in &self.model.conditions {
                        if track_widget(
                            ui.selectable_label(
                                self.model.selected_id == condition.id,
                                format!("IC {} · {}", condition.id, condition.description),
                            ),
                            &format!("ic_{}", condition.id),
                        )
                        .clicked()
                        {
                            choice = Some(condition.id.clone());
                        }
                    }
                });
            self.show_condition_selector = open;
            if let Some(id) = choice {
                self.select_condition(&id);
                self.show_condition_selector = false;
            }
        }
        self.toolbar(ctx);
        self.status_bar(ctx);
        egui::CentralPanel::default()
            .frame(
                egui::Frame::new()
                    .fill(BG)
                    .inner_margin(egui::Margin::same(0)),
            )
            .show(ctx, |ui| match self.view {
                View::Simulation => {
                    let result = self.engine.show(ui);
                    self.handle(result);
                }
                View::Schematic => {
                    if let Some(selected) = schematic::draw_schematic(ui, &self.model) {
                        self.selected = Some(selected);
                        self.selected_live = false;
                    }
                }
                View::LiveSchematic => {
                    if let Some(w) = &self.engine.workspace {
                        let readings =
                            rusttran::live_readings::LiveReadings::from_session(&w.session);
                        if let Some(selected) = schematic::draw_schematic(ui, &readings) {
                            self.selected = Some(selected);
                            self.selected_live = true;
                        }
                    } else {
                        ui.label("Load a session in Simulation first.");
                    }
                }
                View::Plots => self.plots(ui),
                View::Data => self.data(ui),
                View::Properties => self.properties(ui),
            });
        if self.show_live_schematic {
            let mut open = true;
            egui::Window::new("Live simulation mimic").open(&mut open).default_size(egui::vec2(1100.,780.)).show(ctx,|ui| {
                ui.label("Computed recovered-session values. Unconnected readouts and device states are shown as —. Run and control the session in Simulation.");
                if let Some(w)=&self.engine.workspace {
                    ui.label(format!("Evaluation clock: {:.6} s · {} updates",w.session.globals.singles.get("0x54b40c").copied().unwrap_or(0.),w.updates));
                    let readings=rusttran::live_readings::LiveReadings::from_session(&w.session);
                    if let Some(selected)=schematic::draw_schematic(ui,&readings) {self.selected=Some(selected);self.selected_live=true;}
                }
            });
            self.show_live_schematic = open;
        }
        if self.selected_live
            && let (Some(selection), Some(w)) = (&mut self.selected, &self.engine.workspace)
        {
            let readings = rusttran::live_readings::LiveReadings::from_session(&w.session);
            use rusttran::live_readings::PlantReadings;
            selection.value = match selection.kind.as_str() {
                "Pump" => readings.pump(&selection.key),
                "Valve" => readings.valve(&selection.key),
                "Fan" => readings.fan(&selection.key),
                _ => readings
                    .number(&selection.key)
                    .map(|v| if selection.key == "LEV" { v * 100. } else { v }),
            };
        }
        self.dialogs(ctx);
        #[cfg(feature = "gui-screenshot")]
        if let Some(path) = &self.gui_state_path {
            let w = self.engine.workspace.as_ref();
            let temporary = path.with_extension("pending");
            let data = serde_json::json!({
                "updates":w.map_or(0,|w|w.updates),"running":w.is_some_and(|w|w.running),
                "history_samples":w.map_or(0,|w|w.history.len()),"live_schematic_open":self.show_live_schematic,
                "session":w.map(|w|&w.session),"error":self.error,
                "view":match self.view { View::Simulation=>"simulation",View::LiveSchematic=>"live",View::Schematic=>"schematic",View::Data=>"data",View::Plots=>"plots",View::Properties=>"properties" },
                "selected_ic":self.model.selected_id,"selected_component":self.selected.as_ref().map(|s|&s.key),
                "widget_rects":ctx.data(|data|data.get_temp::<BTreeMap<String,[f32;4]>>(egui::Id::new("test_widget_rects"))).unwrap_or_default()
            });
            if let Ok(bytes) = serde_json::to_vec(&data)
                && std::fs::write(&temporary, bytes).is_ok()
            {
                let _ = std::fs::rename(temporary, path);
            }
        }
        #[cfg(feature = "gui-screenshot")]
        if let Some(path) = &self.screenshot_path {
            self.frame_count += 1;
            // Request after layout and font uploads have settled. Eframe captures
            // this frame before swapping buffers; post-swap readback can be black.
            if !self.screenshot_requested && self.frame_count >= self.screenshot_after_frames {
                ctx.send_viewport_cmd(egui::ViewportCommand::Screenshot(egui::UserData::default()));
                self.screenshot_requested = true;
            }
            if let Some(image) = ctx.input(|input| {
                input.events.iter().find_map(|event| {
                    if let egui::Event::Screenshot { image, .. } = event {
                        Some(image.clone())
                    } else {
                        None
                    }
                })
            }) {
                let pixels: Vec<u8> = image
                    .pixels
                    .iter()
                    .flat_map(|pixel| pixel.to_array())
                    .collect();
                if let Err(error) = image::save_buffer(
                    path,
                    &pixels,
                    image.size[0] as u32,
                    image.size[1] as u32,
                    image::ColorType::Rgba8,
                ) {
                    eprintln!("Screenshot failed: {error}");
                }
                ctx.send_viewport_cmd(egui::ViewportCommand::Close);
            } else if self.frame_count > self.screenshot_after_frames + 80 {
                eprintln!("Screenshot was not delivered by the renderer");
                ctx.send_viewport_cmd(egui::ViewportCommand::Close);
            }
            ctx.request_repaint_after(Duration::from_millis(40));
        }
        if self.clock.running || self.engine.running() {
            ctx.request_repaint_after(Duration::from_millis(40));
        }
    }
}

fn run() -> rusttran::Result<()> {
    let mut args = std::env::args().skip(1);
    let mut root = None;
    let mut initial = None;
    let mut primary_model = None;
    let mut session_path = None;
    let mut session_steps = 0_usize;
    let mut clock = RunClock::default();
    let mut view = View::Schematic;
    let mut size = Vec2::new(1024.0, 716.0);
    while let Some(argument) = args.next() {
        match argument.as_str() {
            "--session" => {
                session_path = Some(PathBuf::from(
                    args.next()
                        .ok_or("--session needs a RustTran JSON state path")?,
                ))
            }
            "--session-steps" => {
                session_steps = args
                    .next()
                    .ok_or("--session-steps needs an update count")?
                    .parse()?
            }
            "--data-root" => {
                root = Some(PathBuf::from(
                    args.next().ok_or("--data-root needs a path")?,
                ))
            }
            "--ic" => initial = Some(args.next().ok_or("--ic needs an identifier")?),
            "--initialize-primary" | "--initialize-thermal" => {
                primary_model = Some(
                    args.next()
                        .ok_or("--initialize-primary needs a model identifier")?,
                )
            }
            "--preview-time" => {
                clock.seek(args.next().ok_or("--preview-time needs seconds")?.parse()?)?
            }
            "--view" => {
                view = match args.next().as_deref() {
                    Some("simulation") => View::Simulation,
                    Some("schematic") => View::Schematic,
                    Some("live") => View::LiveSchematic,
                    Some("plots") => View::Plots,
                    Some("data") => View::Data,
                    Some("properties") => View::Properties,
                    _ => {
                        return Err(
                            "--view needs simulation, schematic, live, plots, data or properties"
                                .into(),
                        );
                    }
                }
            }
            "--size" => {
                size.x = args.next().ok_or("--size needs width height")?.parse()?;
                size.y = args.next().ok_or("--size needs height")?.parse()?;
                if !size.x.is_finite() || !size.y.is_finite() || size.x < 1024.0 || size.y < 716.0 {
                    return Err("window size must be finite and at least 1024×716".into());
                }
            }
            "--help" | "-h" => {
                println!(
                    "rusttran [--data-root PATH] [--ic ID] [--initialize-thermal MODEL] [--session PATH] [--session-steps COUNT] [--preview-time SECONDS] [--view simulation|schematic|live|plots|data|properties] [--size WIDTH HEIGHT]\nRustTran desktop: stored initial conditions and recovered-engine Simulation workspace."
                );
                return Ok(());
            }
            _ => return Err(format!("unknown argument {argument}").into()),
        }
    }
    let mut model = match root {
        Some(root) => Presentation::load(&root)?,
        None => Presentation::embedded()?,
    };
    if let Some(id) = initial {
        model.select(&id)?;
    }
    let startup = primary_model
        .map(|id| model.initialize_fresh_state(&id, 0).map(|out| (id, out)))
        .transpose()?;
    let mut engine = gui_engine::EnginePanel::default();
    if let Some(path) = session_path {
        engine.load(&path)?;
        if session_steps > 0 {
            engine
                .workspace
                .as_mut()
                .ok_or("missing loaded simulation")?
                .advance_steps(session_steps)?;
        }
        if view != View::LiveSchematic {
            view = View::Simulation;
        }
        clock.pause()?;
    } else if view == View::LiveSchematic {
        return Err("--view live requires --session".into());
    } else if session_steps > 0 {
        return Err("--session-steps requires --session".into());
    }
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default()
            .with_app_id("org.rusttran.RustTran")
            .with_icon(eframe::icon_data::from_png_bytes(include_bytes!(
                "../assets/rusttran-256.png"
            ))?)
            .with_inner_size(size)
            .with_min_inner_size([1024.0, 716.0]),
        renderer: eframe::Renderer::Glow,
        ..Default::default()
    };
    eframe::run_native(
        "RustTran · PWR 3LP",
        options,
        Box::new(move |cc| {
            let mut app = RustTranApp::new(cc, model, clock, view);
            app.engine = engine;
            if let Some((id, out)) = startup {
                app.initialization_model = id;
                app.initialized_primary = Some(out);
                app.show_initialization = true;
            }
            Ok(Box::new(app))
        }),
    )?;
    Ok(())
}
fn main() {
    if let Err(error) = run() {
        eprintln!("{error}");
        std::process::exit(1);
    }
}

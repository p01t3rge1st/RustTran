//! Vector plant mimic: recovered snapshots, no synthetic process values.
use eframe::egui::{self, Color32, FontId, Pos2, Rect, Sense, Stroke, Vec2};
use rusttran::live_readings::PlantReadings;

pub struct ComponentSelection {
    pub key: String,
    pub label: String,
    pub value: Option<f64>,
    pub kind: String,
    pub unit: String,
}
const BG: Color32 = Color32::from_rgb(37, 42, 46);
const PANEL: Color32 = Color32::from_rgb(48, 54, 59);
const BORDER: Color32 = Color32::from_rgb(75, 84, 91);
const TEXT: Color32 = Color32::from_rgb(228, 231, 233);
const MUTED: Color32 = Color32::from_rgb(159, 170, 179);
const AMBER: Color32 = Color32::from_rgb(231, 191, 84);
const FLUID: Color32 = Color32::from_rgb(136, 156, 167);
struct Canvas<'a> {
    ui: &'a mut egui::Ui,
    origin: Pos2,
    scale: f32,
    selection: Option<ComponentSelection>,
}
impl Canvas<'_> {
    fn p(&self, x: f32, y: f32) -> Pos2 {
        self.origin + Vec2::new(x, y) * self.scale
    }
    fn rect(&self, x: f32, y: f32, w: f32, h: f32) -> Rect {
        Rect::from_min_size(self.p(x, y), Vec2::new(w, h) * self.scale)
    }
    fn box_at(&self, x: f32, y: f32, w: f32, h: f32, color: Color32, r: f32) {
        self.ui.painter().rect(
            self.rect(x, y, w, h),
            r * self.scale,
            color,
            Stroke::new(self.scale, BORDER),
            egui::StrokeKind::Inside,
        );
    }
    fn text(&self, x: f32, y: f32, t: &str, size: f32, color: Color32) {
        self.ui.painter().text(
            self.p(x, y),
            egui::Align2::CENTER_CENTER,
            t,
            FontId::proportional(size * self.scale),
            color,
        );
    }
    fn line(&self, points: &[(f32, f32)], color: Color32, width: f32) {
        self.ui.painter().add(egui::Shape::line(
            points.iter().map(|&(x, y)| self.p(x, y)).collect(),
            Stroke::new(width * self.scale, color),
        ));
    }
    fn panel(&self, x: f32, y: f32, w: f32, h: f32, title: &str) {
        self.box_at(x, y, w, h, PANEL, 5.);
        self.text(x + w / 2., y + 15., title, 15., AMBER);
        self.line(&[(x + 8., y + 29.), (x + w - 8., y + 29.)], BORDER, 1.);
    }
    fn hit(
        &mut self,
        rect: Rect,
        key: &str,
        label: &str,
        value: Option<f64>,
        kind: &str,
        unit: &str,
    ) {
        let response = self.ui.interact(
            rect,
            self.ui.id().with((
                key,
                label,
                ((rect.min.x - self.origin.x) / self.scale).round() as i32,
                ((rect.min.y - self.origin.y) / self.scale).round() as i32,
            )),
            Sense::click(),
        );
        if response.hovered() {
            self.ui.painter().rect_stroke(
                rect,
                4.,
                Stroke::new(1.5_f32, AMBER),
                egui::StrokeKind::Inside,
            );
        }
        if response.clicked() {
            self.selection = Some(ComponentSelection {
                key: key.into(),
                label: label.into(),
                value,
                kind: kind.into(),
                unit: unit.into(),
            });
        }
        response.on_hover_text(format!("{label}\n{key}\nClick to inspect the value"));
    }
    #[allow(clippy::too_many_arguments)] // Physical position, label, source value and its display unit.
    fn meter(
        &mut self,
        x: f32,
        y: f32,
        w: f32,
        label: &str,
        key: &str,
        value: Option<f64>,
        unit: &str,
        mult: f64,
    ) {
        self.box_at(x, y, w, 43., BG, 3.);
        self.text(x + w / 2., y + 12., label, 11., MUTED);
        let v = value
            .map(|v| format!("{:.1} {unit}", v * mult))
            .unwrap_or_else(|| "—".into());
        self.text(x + w / 2., y + 30., &v, 14., TEXT);
        self.hit(
            self.rect(x, y, w, 43.),
            key,
            label,
            value.map(|value| value * mult),
            "Process variable",
            unit,
        );
    }
    fn pump(&mut self, x: f32, y: f32, key: &str, label: &str, model: &dyn PlantReadings) {
        let value = model.pump(key);
        let active = value.is_some_and(|v| v > 0.);
        self.ui.painter().circle(
            self.p(x, y),
            12. * self.scale,
            if active { AMBER } else { PANEL },
            Stroke::new(2. * self.scale, BORDER),
        );
        self.line(
            &[(x - 7., y), (x + 7., y)],
            if active { BG } else { MUTED },
            3.,
        );
        self.hit(
            self.rect(x - 15., y - 15., 30., 30.),
            key,
            label,
            value,
            "Pump",
            "%",
        );
    }
    fn valve(&mut self, x: f32, y: f32, key: &str, label: &str, model: &dyn PlantReadings) {
        let value = model.valve(key);
        let color = if value.is_some_and(|v| v > 0.) {
            AMBER
        } else {
            MUTED
        };
        for pts in [
            [(x - 10., y - 7.), (x, y), (x - 10., y + 7.)],
            [(x + 10., y - 7.), (x, y), (x + 10., y + 7.)],
        ] {
            self.ui.painter().add(egui::Shape::convex_polygon(
                pts.iter().map(|&(x, y)| self.p(x, y)).collect(),
                PANEL,
                Stroke::new(1.5 * self.scale, color),
            ));
        }
        self.hit(
            self.rect(x - 14., y - 12., 28., 24.),
            key,
            label,
            value,
            "Valve",
            "%",
        );
    }
}
pub fn draw_schematic(ui: &mut egui::Ui, model: &dyn PlantReadings) -> Option<ComponentSelection> {
    let available = ui.available_size();
    let scale = (available.x / 1024.).min(available.y / 630.).max(0.1);
    let (rect, _) = ui.allocate_exact_size(Vec2::new(available.x, 630. * scale), Sense::hover());
    let mut c = Canvas {
        ui,
        origin: rect.min + Vec2::new((available.x - 1024. * scale) / 2., 0.),
        scale,
        selection: None,
    };
    c.box_at(0., 0., 1024., 630., BG, 0.);
    // The original four safety-system panels remain on the left.
    for (y, h, title, keys) in [
        (12., 119., "HPI / CVCS", ["HPI-1", "HPI-2"]),
        (143., 85., "Accumulator", ["", ""]),
        (240., 147., "LPI / RHR", ["RHR-1", "RHR-2"]),
        (395., 117., "RB Spray", ["RBS-1", "RBS-2"]),
    ] {
        c.panel(10., y, 135., h, title);
        if keys[0].is_empty() {
            c.valve(45., y + 48., "ValveAccumulator1", "Accumulator A", model);
            c.valve(108., y + 48., "ValveAccumulator2", "Accumulator B", model);
        } else {
            c.pump(45., y + 49., keys[0], keys[0], model);
            c.pump(108., y + 49., keys[1], keys[1], model);
        }
        if h > 100. {
            let row = if title == "HPI / CVCS" {
                ("CHG-1", "CVCS charging")
            } else if title == "LPI / RHR" {
                ("RHR-1", "RHR pump")
            } else {
                ("RBS-1", "Spray pump")
            };
            c.meter(20., y + 70., 115., row.1, row.0, model.pump(row.0), "%", 1.);
        }
    }
    // Steam paths and turbine/feedwater circuit.
    c.line(
        &[
            (261., 70.),
            (261., 38.),
            (783., 38.),
            (783., 146.),
            (843., 146.),
        ],
        FLUID,
        4.,
    );
    c.line(&[(733., 70.), (733., 38.)], FLUID, 4.);
    c.valve(325., 38., "ValveMSIV-A", "Steam isolation A", model);
    c.valve(671., 38., "ValveMSIV-B", "Steam isolation B", model);
    c.line(&[(809., 145.), (809., 201.), (844., 201.)], FLUID, 4.);
    c.valve(809., 180., "ValveTurbineBypass", "Turbine bypass", model);
    c.ui.painter().add(egui::Shape::convex_polygon(
        vec![
            c.p(814., 135.),
            c.p(851., 122.),
            c.p(851., 166.),
            c.p(814., 153.),
        ],
        PANEL,
        Stroke::new(2. * scale, AMBER),
    ));
    c.text(832., 112., "Turbine", 12., MUTED);
    c.box_at(815., 192., 37., 20., PANEL, 2.);
    c.line(
        &[
            (834., 214.),
            (834., 328.),
            (791., 328.),
            (791., 250.),
            (755., 250.),
        ],
        FLUID,
        4.,
    );
    c.line(
        &[
            (834., 328.),
            (834., 438.),
            (188., 438.),
            (188., 250.),
            (234., 250.),
        ],
        FLUID,
        4.,
    );
    c.pump(834., 292., "MFW-1", "Main feedwater pump 1", model);
    c.pump(834., 355., "MFW-2", "Main feedwater pump 2", model);
    c.pump(834., 410., "EFW-TB", "Auxiliary feedwater", model);
    c.valve(188., 250., "ValveMainFeed-A", "Feedwater A", model);
    c.valve(791., 250., "ValveMainFeed-B", "Feedwater B", model);
    // Primary loops flank the reactor as in the source mimic.
    c.line(
        &[
            (437., 258.),
            (343., 258.),
            (343., 343.),
            (262., 343.),
            (262., 306.),
        ],
        FLUID,
        7.,
    );
    c.line(
        &[
            (562., 258.),
            (646., 258.),
            (646., 343.),
            (733., 343.),
            (733., 306.),
        ],
        FLUID,
        7.,
    );
    c.line(
        &[
            (262., 306.),
            (262., 382.),
            (359., 382.),
            (359., 302.),
            (437., 302.),
        ],
        FLUID,
        7.,
    );
    c.line(
        &[
            (733., 306.),
            (733., 382.),
            (636., 382.),
            (636., 302.),
            (562., 302.),
        ],
        FLUID,
        7.,
    );
    for (x, tag, pressure, level) in [(230., "A", "PSGA", "LSGA"), (701., "B", "PSGB", "LSGB")] {
        c.box_at(x, 70., 64., 249., PANEL, 30.);
        c.box_at(x + 9., 174., 46., 119., Color32::from_rgb(60, 72, 79), 15.);
        c.line(
            &[
                (x + 22., 283.),
                (x + 22., 189.),
                (x + 42., 189.),
                (x + 42., 283.),
            ],
            AMBER,
            3.,
        );
        c.text(
            x + 32.,
            55.,
            &format!("SG {tag} · {}×", if tag == "A" { 1 } else { 2 }),
            16.,
            TEXT,
        );
        c.meter(
            x - 18.,
            88.,
            100.,
            "Pressure",
            pressure,
            model.number(pressure),
            "kg/cm²",
            1.,
        );
        c.meter(
            x - 18.,
            133.,
            100.,
            "SG level",
            level,
            model.number(level),
            "",
            1.,
        );
    }
    c.pump(359., 345., "RCP-1", "Coolant pump A", model);
    c.pump(636., 345., "RCP-2", "Coolant pump B", model);
    // Pressurizer vessel and relief/spray fittings.
    c.line(&[(367., 219.), (367., 258.), (437., 258.)], FLUID, 4.);
    c.box_at(338., 85., 57., 137., PANEL, 25.);
    c.box_at(343., 160., 47., 43., Color32::from_rgb(60, 72, 79), 4.);
    c.line(&[(367., 85.), (367., 64.), (408., 64.)], FLUID, 3.);
    c.valve(402., 64., "ValvePressurizerPORV1", "PORV", model);
    c.text(366., 239., "Pressurizer", 12., MUTED);
    c.meter(
        420.,
        64.,
        135.,
        "Pressure",
        "P",
        model.number("P"),
        "kg/cm²",
        1.,
    );
    c.meter(
        420.,
        110.,
        135.,
        "Level",
        "LEV",
        model.number("LEV"),
        "%",
        100.,
    );
    // Reactor: outlined vessel with seven recognizable fuel rods.
    c.box_at(433., 223., 134., 229., PANEL, 62.);
    c.box_at(429., 255., 142., 15., BORDER, 2.);
    c.box_at(445., 277., 110., 117., Color32::from_rgb(60, 72, 79), 4.);
    for i in 0..7 {
        let x = 453. + i as f32 * 14.;
        c.box_at(x, 312., 7., 77., AMBER, 3.);
        c.line(&[(x + 3.5, 292.), (x + 3.5, 311.)], MUTED, 2.);
    }
    c.text(500., 422., "REACTOR", 16., TEXT);
    c.hit(
        c.rect(433., 223., 134., 229.),
        "POWR",
        "Reactor",
        model.number("POWR").map(|value| value * 100.0),
        "Reactor",
        "%",
    );
    c.meter(
        304.,
        395.,
        111.,
        "TAVG",
        "TAVG",
        model.number("TAVG"),
        "°C",
        1.,
    );
    c.meter(
        585.,
        395.,
        111.,
        "Loop A flow",
        "WRCA",
        model.number("WRCA"),
        "",
        1.,
    );
    c.text(501., 473., "WESTINGHOUSE · PWR", 17., MUTED);
    // Right setpoint/instrument column keeps the original ordering.
    c.panel(873., 12., 141., 123., "Reactor");
    c.meter(
        883.,
        48.,
        121.,
        "Power",
        "POWR",
        model.number("POWR"),
        "%",
        100.,
    );
    c.meter(
        883.,
        92.,
        121.,
        "Control rods",
        "RDPOS",
        model.number("RDPOS"),
        "%",
        1.,
    );
    c.panel(873., 147., 141., 217., "Steam Generators");
    c.meter(
        883.,
        184.,
        121.,
        "Pressure A",
        "PSGA",
        model.number("PSGA"),
        "kg/cm²",
        1.,
    );
    c.meter(
        883.,
        231.,
        121.,
        "Pressure B",
        "PSGB",
        model.number("PSGB"),
        "kg/cm²",
        1.,
    );
    c.meter(
        883.,
        278.,
        121.,
        "SG A level",
        "LSGA",
        model.number("LSGA"),
        "",
        1.,
    );
    c.text(943., 344., "A × 1 · B × 2", 12., MUTED);
    c.panel(873., 376., 141., 127., "Pressurizer");
    c.meter(
        883.,
        413.,
        121.,
        "Level",
        "LEV",
        model.number("LEV"),
        "%",
        100.,
    );
    c.meter(
        883.,
        458.,
        121.,
        "Pressure",
        "P",
        model.number("P"),
        "kg/cm²",
        1.,
    );
    // Containment, core and protection panels span the base of the original.
    c.panel(10., 517., 173., 103., "RB Fan / Vent");
    for x in [36., 75., 114., 153.] {
        c.ui.painter()
            .circle_stroke(c.p(x, 560.), 10. * scale, Stroke::new(1.5 * scale, MUTED));
        c.line(&[(x - 6., 554.), (x + 6., 566.)], MUTED, 2.);
    }
    c.valve(49., 596., "ValveRBVent", "Building vent", model);
    c.text(123., 596., "VENT", 12., MUTED);
    c.panel(195., 517., 200., 103., "Reactor Building");
    c.meter(
        205.,
        553.,
        86.,
        "Pressure",
        "PRB",
        model.number("PRB"),
        "kg/cm²",
        1.,
    );
    c.meter(
        297.,
        553.,
        88.,
        "Temperature",
        "TRB",
        model.number("TRB"),
        "°C",
        1.,
    );
    c.panel(407., 517., 246., 103., "Core");
    c.meter(
        417.,
        553.,
        111.,
        "Power",
        "POWR",
        model.number("POWR"),
        "%",
        100.,
    );
    c.meter(
        534.,
        553.,
        109.,
        "Temperature",
        "TPCT",
        model.number("TPCT"),
        "°C",
        1.,
    );
    c.panel(665., 517., 349., 103., "RPS / Power Supply");
    c.text(753., 556., "Reactor protection", 13., TEXT);
    c.text(838., 582., "RPS signals: no stored state", 12., MUTED);
    c.selection
}

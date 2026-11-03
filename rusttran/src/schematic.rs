//! Classic NSSS mimic measured from the original handbook's 1024×768 display.
//! Geometry and colours are independent of the data source; absent values stay unknown.
use eframe::egui::{self, Color32, FontId, Pos2, Rect, Sense, Stroke, Vec2};
use rusttran::live_readings::PlantReadings;

pub struct ComponentSelection {
    pub key: String,
    pub label: String,
    pub value: Option<f64>,
    pub kind: String,
    pub unit: String,
}
const BG: Color32 = Color32::from_rgb(198, 195, 198);
const PANEL: Color32 = Color32::from_rgb(132, 130, 132);
const BLACK: Color32 = Color32::BLACK;
const WHITE: Color32 = Color32::WHITE;
const CYAN: Color32 = Color32::CYAN;
const YELLOW: Color32 = Color32::YELLOW;
const BLUE: Color32 = Color32::BLUE;
const NAVY: Color32 = Color32::from_rgb(0, 0, 123);
const RED: Color32 = Color32::from_rgb(198, 0, 0);
const MAROON: Color32 = Color32::from_rgb(132, 0, 0);
struct Canvas<'a> {
    ui: &'a mut egui::Ui,
    origin: Pos2,
    scale: f32,
    selection: Option<ComponentSelection>,
}
impl Canvas<'_> {
    // Reference coordinates include the original title/menu/tool bars (69 px).
    fn p(&self, x: f32, y: f32) -> Pos2 {
        self.origin + Vec2::new(x, y - 69.) * self.scale
    }
    fn rect(&self, x: f32, y: f32, w: f32, h: f32) -> Rect {
        Rect::from_min_size(self.p(x, y), Vec2::new(w, h) * self.scale)
    }
    fn box_at(&self, x: f32, y: f32, w: f32, h: f32, color: Color32) {
        self.ui.painter().rect(
            self.rect(x, y, w, h),
            0.,
            color,
            Stroke::new(self.scale, BLACK),
            egui::StrokeKind::Inside,
        );
    }
    fn text(&self, x: f32, y: f32, t: &str, size: f32, color: Color32) {
        self.ui.painter().text(
            self.p(x, y),
            egui::Align2::CENTER_CENTER,
            t,
            FontId::new(
                size * self.scale,
                egui::FontFamily::Name("classic-bold".into()),
            ),
            color,
        );
    }
    fn line(&self, points: &[(f32, f32)], color: Color32, width: f32) {
        self.ui.painter().add(egui::Shape::line(
            points.iter().map(|&(x, y)| self.p(x, y)).collect(),
            Stroke::new(width * self.scale, color),
        ));
    }
    fn pipe(&self, points: &[(f32, f32)], color: Color32, width: f32) {
        self.line(points, BLACK, width + 2.);
        self.line(points, color, width);
    }
    fn polygon(&self, points: &[(f32, f32)], color: Color32) {
        self.ui.painter().add(egui::Shape::convex_polygon(
            points.iter().map(|&(x, y)| self.p(x, y)).collect(),
            color,
            Stroke::new(self.scale, BLACK),
        ));
    }
    fn panel(&self, x: f32, y: f32, w: f32, h: f32, title: &str) {
        self.box_at(x, y, w, h, PANEL);
        self.line(
            &[(x + 2., y + h - 2.), (x + 2., y + 2.), (x + w - 2., y + 2.)],
            WHITE,
            1.,
        );
        self.line(&[(x + 2., y + 22.), (x + w - 2., y + 22.)], WHITE, 2.);
        self.text(x + w / 2., y + 12., title, 16., CYAN);
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
        let response = super::track_widget(response, &format!("mimic_{key}"));
        if response.hovered() {
            self.ui.painter().rect_stroke(
                rect,
                0.,
                Stroke::new(self.scale, YELLOW),
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
    #[allow(clippy::too_many_arguments)]
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
        self.box_at(x, y, w, 32., PANEL);
        self.line(&[(x, y + 32.), (x + w, y + 32.), (x + w, y)], WHITE, 1.);
        self.text(x + w / 2., y + 8., label, 12., CYAN);
        let value = value.map(|v| v * mult);
        let highlighted = matches!(
            key,
            "POWER_MW" | "POWR" | "VOIDS" | "TAVG" | "TFPK" | "TPCT" | "WSTA" | "WSTB"
        ) || key.starts_with("RELIEF_");
        let unit_color = if unit == "°C" || unit == "MW" || matches!(key, "WSTA" | "WSTB") {
            CYAN
        } else {
            YELLOW
        };
        self.text(
            x + w * 0.38,
            y + 23.,
            &value
                .map(|v| format!("{v:.1}"))
                .unwrap_or_else(|| "—".into()),
            12.,
            if highlighted { YELLOW } else { WHITE },
        );
        self.text(x + w * 0.82, y + 23., unit, 11., unit_color);
        self.hit(
            self.rect(x, y, w, 32.),
            key,
            label,
            value,
            "Process variable",
            unit,
        );
    }
    fn pump(&mut self, x: f32, y: f32, key: &str, model: &dyn PlantReadings) {
        let value = model.pump(key);
        let fill = match value {
            Some(v) if v > 0. => RED,
            Some(_) => WHITE,
            None => PANEL,
        };
        self.ui.painter().circle(
            self.p(x, y),
            12. * self.scale,
            fill,
            Stroke::new(2. * self.scale, BLACK),
        );
        self.box_at(x - 7., y - 3., 11., 6., BLACK);
        self.line(&[(x - 13., y + 12.), (x + 13., y + 12.)], BLACK, 2.);
        self.hit(
            self.rect(x - 14., y - 14., 28., 28.),
            key,
            key,
            value,
            "Pump",
            "%",
        );
    }
    fn valve(&mut self, x: f32, y: f32, key: &str, model: &dyn PlantReadings) {
        let value = model.valve(key);
        let color = match value {
            Some(v) if v > 0. => RED,
            Some(_) => WHITE,
            None => PANEL,
        };
        self.polygon(&[(x - 16., y - 7.), (x, y), (x - 16., y + 7.)], color);
        self.polygon(&[(x + 16., y - 7.), (x, y), (x + 16., y + 7.)], color);
        self.hit(
            self.rect(x - 18., y - 9., 36., 18.),
            key,
            key,
            value,
            "Valve",
            "%",
        );
    }
    fn hx(&self, x: f32, y: f32) {
        self.box_at(x, y, 40., 19., BG);
        for dy in [4., 10., 15.] {
            self.line(&[(x + 7., y + dy), (x + 33., y + dy)], BLACK, 1.);
        }
        for dx in [8., 32.] {
            self.line(&[(x + dx, y), (x + dx, y + 19.)], BLACK, 1.);
        }
    }
}
pub fn draw_schematic(ui: &mut egui::Ui, model: &dyn PlantReadings) -> Option<ComponentSelection> {
    let available = ui.available_size();
    let scale = (available.x / 1024.).min(available.y / 646.).max(0.1);
    let (rect, _) = ui.allocate_exact_size(Vec2::new(available.x, 646. * scale), Sense::hover());
    let mut c = Canvas {
        ui,
        origin: rect.min + Vec2::new((available.x - 1024. * scale) / 2., 0.),
        scale,
        selection: None,
    };
    c.box_at(0., 69., 1024., 646., BG);
    // Primary piping, drawn first so instruments remain legible.
    for (points, color, width) in [
        (
            vec![
                (273., 82.),
                (273., 73.),
                (213., 73.),
                (213., 172.),
                (147., 172.),
            ],
            RED,
            3.,
        ),
        (
            vec![
                (710., 82.),
                (710., 73.),
                (769., 73.),
                (769., 171.),
                (850., 171.),
                (850., 310.),
                (935., 310.),
            ],
            RED,
            3.,
        ),
        (
            vec![
                (314., 119.),
                (480., 119.),
                (480., 153.),
                (403., 153.),
                (403., 128.),
                (363., 128.),
            ],
            BLACK,
            2.,
        ),
        (
            vec![
                (439., 330.),
                (326., 330.),
                (310., 375.),
                (250., 375.),
                (250., 391.),
                (319., 391.),
                (329., 359.),
                (356., 359.),
            ],
            BG,
            8.,
        ),
        (
            vec![
                (356., 359.),
                (356., 402.),
                (327., 402.),
                (327., 359.),
                (439., 359.),
            ],
            BG,
            8.,
        ),
        (
            vec![
                (568., 330.),
                (659., 330.),
                (677., 375.),
                (733., 375.),
                (733., 391.),
                (663., 391.),
                (652., 359.),
                (630., 359.),
            ],
            BG,
            8.,
        ),
        (
            vec![
                (630., 359.),
                (630., 402.),
                (660., 402.),
                (660., 359.),
                (568., 359.),
            ],
            BG,
            8.,
        ),
        (vec![(364., 260.), (364., 326.)], BG, 3.),
        (
            vec![
                (937., 362.),
                (839., 362.),
                (839., 513.),
                (819., 513.),
                (819., 268.),
                (762., 268.),
            ],
            BLUE,
            3.,
        ),
        (
            vec![(937., 310.), (799., 310.), (799., 497.), (931., 497.)],
            RED,
            3.,
        ),
        (vec![(218., 250.), (146., 250.)], BLUE, 3.),
        (vec![(218., 280.), (146., 280.)], BLUE, 3.),
    ] {
        c.pipe(&points, color, width);
    }
    // Safety injection, accumulator, residual heat removal and containment spray.
    for (y, h, title) in [
        (99., 139., "HPI/CVCS"),
        (242., 88., "Accumulator"),
        (339., 221., "LPI/RHR"),
        (565., 131., "RB Spray"),
    ] {
        c.panel(3., y, 136., h, title);
    }
    for (x, y, key) in [
        (34., 146., "HPI-1"),
        (96., 146., "HPI-2"),
        (34., 184., "CHG-1"),
        (31., 407., "RHR-1"),
        (87., 407., "RHR-2"),
        (31., 608., "RBS-1"),
        (96., 608., "RBS-2"),
    ] {
        c.pump(x, y, key, model);
    }
    for (x, y, key) in [
        (34., 218., "ValvePressurizerLetdown"),
        (34., 284., "ValveAccumulator1"),
        (96., 284., "ValveAccumulator2"),
        (34., 312., "ValveAccumulator1"),
    ] {
        c.valve(x, y, key, model);
    }
    for (y, label, key, unit) in [
        (170., "Flow", "CVCS_FLOW", "t/hr"),
        (202., "Letdown", "LETDOWN_FLOW", "t/hr"),
        (297., "Flow", "ACC_FLOW", "t/hr"),
        (438., "RHR Flow", "RHR_FLOW", "t/hr"),
        (479., "RWST Lvl", "RWST_VOLUME", "m³"),
        (518., "Heat", "RHR_HEAT", "MW"),
        (625., "Flow", "SPRAY_FLOW", "t/hr"),
        (658., "Heat", "SPRAY_HEAT", "MW"),
    ] {
        c.meter(57., y, 79., label, key, model.number(key), unit, 1.);
    }
    for (x, label) in [(8., "LPI"), (49., "Sump"), (91., "SDC")] {
        c.box_at(x, 363., 40., 22., BG);
        c.text(x + 20., 374., label, 12., BLACK);
    }
    c.box_at(16., 458., 32., 47., NAVY);
    c.box_at(17., 459., 30., 9., Color32::from_rgb(0, 132, 0));
    c.hx(11., 528.);
    c.hx(11., 650.);
    // Steam generators: pressure and level are source values, not screenshot numbers.
    for (x, side, pk, lk, flow, feed) in [
        (232., "A", "PSGA", "LSGA", "WSTA", "WFWA"),
        (659., "B", "PSGB", "LSGB", "WSTB", "WFWB"),
    ] {
        ellipse(&c, x, 82., 82., 64., CYAN);
        c.box_at(x, 127., 82., 44., NAVY);
        c.polygon(
            &[(x, 170.), (x + 82., 170.), (x + 74., 205.), (x + 8., 205.)],
            NAVY,
        );
        ellipse(&c, x + 8., 310., 66., 65., MAROON);
        c.box_at(x + 8., 202., 66., 141., NAVY);
        c.box_at(x + 27., 193., 24., 150., MAROON);
        c.line(
            &[
                (x + 27., 343.),
                (x + 27., 200.),
                (x + 31., 189.),
                (x + 40., 184.),
                (x + 47., 189.),
                (x + 51., 200.),
                (x + 51., 343.),
            ],
            WHITE,
            1.,
        );
        c.meter(
            x + 4.,
            98.,
            74.,
            &format!("'{side}' SG Level"),
            lk,
            model.number(lk),
            "m",
            1.,
        );
        c.meter(
            x + 4.,
            130.,
            74.,
            &format!("'{side}' SG Press"),
            pk,
            model.number(pk),
            "kg/cm²",
            1.,
        );
        let mx = if side == "A" { 143. } else { 773. };
        c.meter(
            mx,
            122.,
            78.,
            "Stm Flow",
            flow,
            model.number(flow),
            "t/hr",
            1.,
        );
        c.meter(
            if side == "A" { 147. } else { 757. },
            if side == "A" { 202. } else { 220. },
            78.,
            "Feed Flow",
            feed,
            model.number(feed),
            "t/hr",
            1.,
        );
        let vx = if side == "A" { 185. } else { 799. };
        for (y, kind) in [
            (172., "MSIV"),
            (if side == "A" { 250. } else { 268. }, "AuxFeed"),
            (if side == "A" { 280. } else { 298. }, "MainFeed"),
        ] {
            c.valve(vx, y, &format!("Valve{kind}-{side}"), model);
        }
        c.box_at(if side == "A" { 153. } else { 745. }, 321., 78., 32., PANEL);
        c.text(
            if side == "A" { 192. } else { 784. },
            343.,
            if side == "A" { "1 × SG" } else { "2 × SG" },
            13.,
            YELLOW,
        );
    }
    for (x, side) in [(165., "A"), (801., "B")] {
        for (dx, kind) in [(0., "ADV"), (34., "MSV")] {
            let xx = x + dx;
            c.line(&[(xx, 111.), (xx, 89.)], BLACK, 2.);
            c.valve(xx, 88., &format!("ValveSG_{kind}-{side}"), model);
        }
        c.meter(
            if side == "A" { 40. } else { 858. },
            68.,
            99.,
            "ADV/MSV Flow",
            &format!("RELIEF_{side}"),
            None,
            "t/hr",
            1.,
        );
    }
    // Pressurizer, relief tank and heater elements.
    ellipse(&c, 333., 125., 60., 52., MAROON);
    c.box_at(333., 150., 60., 91., CYAN);
    ellipse(&c, 333., 215., 60., 51., MAROON);
    c.box_at(334., 162., 58., 78., CYAN);
    for x in [340., 365.] {
        c.box_at(x, 208., 23., 24., Color32::GREEN);
        c.text(x + 11., 220., if x < 350. { "P" } else { "B" }, 12., BLACK);
    }
    for (x, key, label) in [
        (340., "HeaterProportional", "Proportional heater"),
        (365., "HeaterBackup", "Backup heater"),
    ] {
        c.hit(c.rect(x, 208., 23., 24.), key, label, None, "Heater", "%");
    }
    c.box_at(442., 178., 55., 53., CYAN);
    c.box_at(442., 215., 55., 15., NAVY);
    c.valve(437., 159., "ValvePressurizerPORV1", model);
    c.valve(403., 207., "ValvePressurizerSpray", model);
    c.panel(505., 81., 104., 120., "Pressurizer");
    for (y, label, key, unit, mult) in [
        (101., "Pressure", "P", "kg/cm²", 1.),
        (133., "Level", "LEV", "%", 100.),
        (166., "Heater Power", "HEATER_POWER", "kW", 1.),
    ] {
        c.meter(508., y, 98., label, key, model.number(key), unit, mult);
    }
    // Reactor vessel and fuel rods.
    ellipse(&c, 423., 250., 145., 93., MAROON);
    ellipse(&c, 423., 439., 145., 93., MAROON);
    c.box_at(423., 282., 145., 192., BLUE);
    c.box_at(416., 277., 159., 15., MAROON);
    for i in 0..6 {
        let x = 442. + i as f32 * 19.;
        c.box_at(x, 373., 9., 95., WHITE);
        c.box_at(x + 2., 379., 5., 85., RED);
        c.line(&[(x + 4., 360.), (x + 4., 373.)], BLACK, 2.);
    }
    c.hit(
        c.rect(423., 250., 145., 282.),
        "POWR",
        "Reactor",
        model.number("POWR").map(|v| v * 100.),
        "Reactor",
        "%",
    );
    c.pump(356., 359., "RCP-1", model);
    c.pump(630., 359., "RCP-2", model);
    for (x, y, label, key, unit) in [
        (335., 290., "'A' HL Temp", "HOT_LEG_A", "°C"),
        (573., 290., "'B' HL Temp", "HOT_LEG_B", "°C"),
        (247., 406., "'A' CL Temp", "COLD_LEG_A", "°C"),
        (329., 406., "'A' Flow", "WRCA", "t/hr"),
        (575., 406., "'B' Flow", "WRCB", "t/hr"),
        (657., 406., "'B' CL Temp", "COLD_LEG_B", "°C"),
    ] {
        c.meter(x, y, 79., label, key, model.number(key), unit, 1.);
    }
    c.text(245., 460., "Westinghouse PWR", 20., BLUE);
    // Feedwater pump train and turbine/condenser.
    c.polygon(
        &[(939., 300.), (994., 288.), (994., 334.), (939., 322.)],
        BLUE,
    );
    c.box_at(936., 346., 58., 31., NAVY);
    c.box_at(938., 350., 54., 10., PANEL);
    c.valve(892., 310., "ValveTurbineStop", model);
    c.valve(891., 362., "ValveTurbineBypass", model);
    for (x, y, key) in [
        (898., 407., "MFW-1"),
        (898., 438., "MFW-2"),
        (898., 469., "MFW-3"),
        (952., 407., "EFW-TB"),
        (960., 466., "EFW-M1"),
        (960., 498., "EFW-M2"),
        (899., 524., "CDS"),
    ] {
        c.pump(x, y, key, model);
    }
    c.line(
        &[
            (872., 395.),
            (872., 458.),
            (923., 458.),
            (923., 395.),
            (975., 395.),
            (975., 377.),
        ],
        BLUE,
        3.,
    );
    c.line(&[(985., 450.), (985., 498.), (975., 498.)], BLUE, 3.);
    c.box_at(968., 418., 30., 31., NAVY);
    c.box_at(969., 419., 28., 12., Color32::from_rgb(0, 132, 0));
    // Original control panel positions. No inferred setpoints or automation modes.
    for (y, h, title) in [
        (98., 91., "Reactor"),
        (193., 91., "Steam Generators"),
        (609., 90., "Pressurizer"),
    ] {
        c.panel(858., y, 144., h, title);
    }
    for (y, label, key, unit, mult) in [
        (121., "Power Demand", "POWER_DEMAND", "%", 100.),
        (154., "Rate Demand", "RAMP", "%", 1.),
        (216., "SG Press Spt", "SG_PRESS_SETPOINT", "kg/cm²", 1.),
        (249., "Tavg Spt", "TAVG_SETPOINT", "°C", 1.),
        (541., "SG A Lvl Spt", "SG_LEVEL_SETPOINT_A", "%", 1.),
        (573., "SG B Lvl Spt", "SG_LEVEL_SETPOINT_B", "%", 1.),
        (633., "Level Spt", "LEVEL_SETPOINT", "%", 1.),
        (666., "Press Spt", "PRESSURE_SETPOINT", "kg/cm²", 1.),
    ] {
        c.meter(860., y, 97., label, key, model.number(key), unit, mult);
        for (x, label) in [(961., "A"), (981., "M")] {
            c.box_at(x, y + 8., 18., 21., BG);
            c.text(x + 9., y + 19., label, 12., BLACK);
        }
    }
    // Lower containment, core and protection strips.
    c.panel(144., 545., 133., 151., "RB Fan Vent");
    for (i, x) in [155., 187., 219., 251.].into_iter().enumerate() {
        let key = format!("Fan Cooler {}", i + 1);
        let value = model.fan(&key);
        let color = match value {
            Some(v) if v > 0. => RED,
            Some(_) => Color32::from_rgb(0, 132, 0),
            None => PANEL,
        };
        c.polygon(
            &[(x, 581.), (x + 20., 586.), (x + 20., 598.), (x, 603.)],
            color,
        );
        c.text(x + 9., 592., "○", 14., WHITE);
        c.hit(c.rect(x, 579., 22., 26.), &key, &key, value, "Fan", "%");
    }
    c.valve(168., 643., "ValveRBVent", model);
    c.hx(148., 663.);
    c.meter(197., 624., 77., "Vent Flow", "VENT_FLOW", None, "t/hr", 1.);
    c.meter(
        197.,
        657.,
        77.,
        "Heat",
        "FAN_COOLING_HEAT",
        model.number("FAN_COOLING_HEAT"),
        "MW",
        1.,
    );
    c.panel(281., 545., 102., 151., "Reactor Bldg");
    for (y, label, key, unit) in [
        (564., "Pressure", "PRB", "kg/cm²"),
        (597., "Temperature", "TRB", "°C"),
        (630., "Level", "LWRB", "m"),
        (663., "Hydrogen", "HYDROGEN", "% "),
    ] {
        c.meter(284., y, 96., label, key, model.number(key), unit, 1.);
    }
    c.panel(387., 545., 207., 121., "Core");
    for (x, y, label, key, unit, mult) in [
        (390., 563., "Power", "POWER_MW", "MW", 1.),
        (492., 563., "Voids", "VOIDS", "%", 1.),
        (390., 596., "Power", "POWR", "%", 100.),
        (492., 596., "Max Fuel Temp", "TFPK", "°C", 1.),
        (390., 629., "Tavg", "TAVG", "°C", 1.),
        (492., 629., "Max Clad Temp", "TPCT", "°C", 1.),
    ] {
        c.meter(x, y, 99., label, key, model.number(key), unit, mult);
    }
    c.panel(598., 545., 257., 154., "RPS / Power Supply");
    for (y, label) in [
        (574., "Reactor"),
        (598., "Turbine"),
        (622., "Offsite AC"),
        (646., "EG Bus A"),
        (670., "EG Bus B"),
    ] {
        c.box_at(605., y, 56., 22., BG);
        c.text(633., y + 11., label, 12., BLACK);
    }
    for (x, y, text) in [
        (698., 581., "Lo  RxP   Hi"),
        (798., 581., "F×    RxL"),
        (690., 598., "FW"),
        (798., 598., "OTDT  PzL"),
        (695., 614., "SGL"),
        (798., 614., "OPDT  RxP"),
        (699., 640., "ECCS"),
        (792., 640., "Lo     Hi"),
        (690., 657., "LL"),
        (799., 657., "RxP    RBP"),
        (697., 674., "RxP"),
        (798., 674., "PzL    SGFL"),
        (782., 689., "SGP"),
    ] {
        c.text(x, y, text, 12., CYAN);
    }
    c.selection
}
fn ellipse(c: &Canvas<'_>, x: f32, y: f32, w: f32, h: f32, color: Color32) {
    let rect = c.rect(x, y, w, h);
    c.ui.painter().add(egui::Shape::ellipse_filled(
        rect.center(),
        rect.size() / 2.,
        color,
    ));
}

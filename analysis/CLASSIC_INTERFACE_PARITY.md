# Classic PCTran interface reconstruction — 2026-11-03

The current target is the classic interface, superseding the earlier gray/amber redesign. The name remains RustTran; the application remains English.

## Source and implemented layout

Primary visual source: `reference-ui/PWR Severe Accidents_html_44050c8d.png`, a 1024×768 screenshot included with the original handbook. The independent gray screenshot `..._7c80ee25.png` confirms the layout. The orange `..._95dbbb4d.png` is a different presentation; it is not the default reference.

The NSSS is drawn as vector primitives, with reference coordinates measured against the handbook. The drawing maps the rectangle x=0–1024, y=69–715 into the client area, preserving proportions at larger sizes. No screenshot is used as an application background. Readouts and component targets remain interactive.

| Element | Reference position / colour | Implementation |
|---|---|---|
| Background | RGB 198,195,198 | Shared classic palette |
| Instrument panels | RGB 132,130,132 | Flat panels, black/white bevels |
| Labels / numerical values | Cyan / white and yellow | Separate text and values |
| Safety systems | x=3–139 | HPI/CVCS, accumulator, LPI/RHR, RB spray |
| Steam generators | x=232 and 659 | Vessels, U-tubes, pressure/level/flow meters |
| Pressurizer | x=333–393 | Vessel, P/B heater targets, relief/spray fittings |
| Reactor | x=423–568 | Vessel, six fuel rods, primary loops/RCP |
| Right controls | x=858–1002 | Reactor, SG, pressurizer panels and feedwater train |
| Lower panels | y=545–699 | RB fan/vent, reactor building, core, protection |
| Window chrome | Compact menu/tool/status bars | File, Restart, Edit, View, Code Control, Help; no modern tab/header rows |

Liberation Sans Regular/Bold is embedded so the same font is available on Linux and Windows. The fonts are distributed under SIL OFL 1.1; the notice is in `rusttran/assets/fonts/LICENSE.txt` and readable in Help → Font license. This is a compatible substitute, not the original Windows bitmap font.

## Functional changes

- `--session PATH --view live` runs the supplied recovered session behind the classic main NSSS screen. `View → Computed NSSS mimic` opens the same main screen after loading in Simulation. The separate live popup remains available.
- The classic toolbar can Start, Pause, Step and Reset the actual supplied session. In the stored IC view, the preview clock remains explicitly identified as a preview.
- Clicking an RCP, proportional/backup heater or connected spray component opens commands for the same retained controls as Simulation/CLI. Native interlocks remain in the numerical step. Unrecovered component commands remain unavailable.
- Current hot/cold leg temperatures for both loops use recovered globals 0x54b694/698/69c/6a0, converted from °F to °C. They do not fall back to stored IC values. Inspectors refresh live values after each step.
- The IC toolbar button opens an actual condition selector. Choosing a stored IC pauses the session and returns to the stored-state view; it does not claim a complete reactor initialization.
- Missing setpoint, equipment and process sources remain `—`. Red/white equipment state is shown only when available from the selected source. Numbers from handbook screenshots are never used as live simulation results.

## Validation

- `cargo test --manifest-path rusttran/Cargo.toml --features gui`: 171 tests passed, including stepping/resetting the four new live temperature readouts.
- `cargo clippy --manifest-path rusttran/Cargo.toml --features gui-screenshot --all-targets -- -D warnings`: passed.
- `python3 scripts/test_simulation_gui.py`: actual X11/XTest interactions passed. Classic heater 25% and RCP A 50% commands followed by Step match CLI session state exactly. Start/Pause/Reset, IC selector, stored equipment inspection, existing workspace controls, loading and live popup also passed.
- `python3 scripts/capture_classic_interface.py`: software-rendered native and enlarged client screenshots; no platform screenshot/font dependency.
- [Interactive side-by-side / overlay comparison](classic-ui/comparison.html), [1024 px capture](classic-ui/nsss-1024.png), [GUI interaction results](gui-interaction/results.json).

- Portable Linux GUI/CLI compiled with maximum glibc 2.28. Packaged CLI matches the tested debug CLI on the supplied example. Per-user desktop installation updated; installed GUI hash matches the package. [Package evidence](classic-package-validation.json).
- Windows GNU EXE cross-build passed. Windows GUI execution remains untested for this revision.

## Remaining acceptance work

This is not a claim of pixel-for-pixel identity. Vessel shoulders, pipe curves, toolbar icons and text rasterization still differ. The Windows title bar is supplied by the operating system; the old Windows taskbar is not part of the application. Original dialogs, secondary screens, menus, shortcuts and every component callback still need a complete inventory and comparison. Main-screen visual agreement does not establish whole-scenario numerical agreement. Full fresh/restore initialization, remaining model producers, events/protection and original 0–300 second scenario comparisons remain open under the existing milestones.

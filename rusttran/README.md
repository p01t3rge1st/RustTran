# RustTran

This crate reads the complete recovered CSV exports in `../analysis/data`.
It includes recovered numerical routines and a working data recovery layer.
The full PCTran numerical engine remains incomplete. A native desktop GUI
displays the recovered initial conditions and equipment layout, and offers a Simulation workspace for the recovered numerical engine. It produces JSON with original column
names and string values, preserving numeric spelling, empty fields, flags,
and unusual malfunction fractions (including -100 and 3000). CSV exports
cannot distinguish database NULL from empty text. Missing columns cause errors.

```sh
cargo run --manifest-path rusttran/Cargo.toml -- status
cargo run --manifest-path rusttran/Cargo.toml -- tables
cargo run --manifest-path rusttran/Cargo.toml -- models
cargo run --manifest-path rusttran/Cargo.toml -- parameters 1
cargo run --manifest-path rusttran/Cargo.toml -- conditions
cargo run --manifest-path rusttran/Cargo.toml -- condition 12
cargo run --manifest-path rusttran/Cargo.toml -- malfunctions
cargo run --manifest-path rusttran/Cargo.toml -- table PresetFreeze
cargo run --manifest-path rusttran/Cargo.toml -- --database PlotData table ListPlotVariables
cargo run --manifest-path rusttran/Cargo.toml -- math DECAY 150
cargo run --manifest-path rusttran/Cargo.toml -- math EULER 1 10 2 3
cargo run --manifest-path rusttran/Cargo.toml -- math HFLD 158.2
cargo run --manifest-path rusttran/Cargo.toml -- math TLIQ 14.7
cargo run --manifest-path rusttran/Cargo.toml -- math HLIQ 100 300
```

Options precede the command: `--data-root PATH` selects the export root and
`--database NAME` selects ListData (default), BackData, PlotData, DoseData or
OptData. Unknown tables and identifiers are rejected. `condition IC` joins
the ListIC catalog with the IC-prefixed snapshot tables by the exact IC field and
retains empty result tables. ListIC has 13 entries while ICThermoData has 22;
unlisted snapshots retain their recovered fields without invented descriptions.
IC21 is absent. IC1's menu RC Press=155/Tavg=306.9 differs from its actual
ICThermoData P=158.2/TAVG=309.1. Both are preserved. SET1 POWER is 2705 in
this installation; it must not be replaced with a guessed reactor rating.
`ICMalfDataTemp` is a temporary malfunction table without an IC column;
it is available via `table ICMalfDataTemp` and is excluded from snapshot joins.

Library APIs expose `Database`, `Table`, `Row`, and `evaluate_freeze`.
The latter evaluates the recovered strict `<` and `>` comparisons and
rejects missing variables, unsupported relations and non-finite numbers.
It does not reproduce event dispatch, comparison timing, or the original
freeze state machine. No units are inferred for fields whose units have
not been traced. See `../analysis/DATA_FINDINGS.md` for source evidence.

`math` exposes DECAY(time), EULER(current derivative, previous derivative,
step, state), HFLD/HGAS/VFLD/TLIQ/VGAS(pressure), PSAT(temperature) and
HLIQ(pressure, temperature). Property inputs and outputs retain the recovered
imperial units: pressure in psia, temperature in degrees Fahrenheit, enthalpy
in Btu/lb and specific volume in ft³/lb. No metric conversion is guessed.
These independent functions do not simulate a reactor transient.

The 98 numeric fixture cases compare Rust with original x86 numerical
prefixes executed in Unicorn using modeled VB6 numeric helpers. This is
not original Windows/MSVBVM60 execution. Runtime coercions and original
error/cleanup behavior are not validated by these fixtures. Float32 results
allow at most 2 ULP; EULER state allows relative 1e-7 (absolute 1e-7 below
magnitude 1). HLIQ retains its recovered binary64 return value and allows
relative 1e-10 (absolute 1e-10 below magnitude 1). See
`../analysis/native_math_fixtures.json` for oracle limits.
All 44 saturation temperature/pressure knots and 68 vapor volume knots are
checked against extracted executable arrays, including endpoint clamps.

```sh
cargo test --manifest-path rusttran/Cargo.toml
cargo clippy --manifest-path rusttran/Cargo.toml --all-targets -- -D warnings
```

## Native desktop GUI

The English interface follows the original NSSS mimic: ECCS panels on the
left, the reactor and steam-generator groups in the center, operating panels
on the right, and containment/core/protection indicators along the bottom.
The palette uses graphite gray, muted steel piping, and amber highlights.

```sh
cargo run --manifest-path rusttran/Cargo.toml --features gui --bin rusttran
# Ready-to-run local bundle:
dist/rusttran-linux-x86_64/rusttran
```

Select an IC in the toolbar to update stored plant values. Click equipment
or a readout to inspect its saved state. Plots shows the independent DECAY
correlation; State data lists original fields, and Water / steam evaluates
the recovered property functions. Malfunctions edits scenario settings and
exports a new JSON file without overwriting an existing file.

Start preview, Pause, Reset and the speed selector operate the presentation
clock. They do not evolve the plant snapshot or implement the unfinished
transient engine. Unknown values are displayed as an em dash. Steam-generator
levels and the loop-flow readout retain their source values without guessed
unit conversions. A pressure readout opens with pressure units, and percentage
readouts preserve their display scale. Screenshots: `../analysis/previews`.

Build and package from the project root:

```sh
cargo build --manifest-path rusttran/Cargo.toml --release --features gui --bins
python3 scripts/package_release.py
```

The supplied Linux x86_64 package was built with cargo-zigbuild targeting
glibc 2.28; a native build may require your build machine's newer glibc.
Both binaries embed the recovered CSV tables. An explicit `--data-root`
overrides these embedded tables.

```sh
bash dist/rusttran-linux-x86_64/install.sh
```

This installs for the current user and adds an English RustTran entry and
icon to GNOME/Plasma application menus. Debian/Ubuntu can instead install
`dist/rusttran_0.1.0_amd64.deb` with `sudo apt install ./dist/rusttran_0.1.0_amd64.deb`.
Windows x86_64: `dist/RustTran.exe` is a GUI executable with embedded data and
an icon; imports are Windows system DLLs. Its runtime has not been tested on
Windows. ARM and macOS binaries are not supplied yet.
GUI screenshots can be generated with the development-only `gui-screenshot`
feature and the `RUSTTRAN_SCREENSHOT_TO` environment variable. Capture is
requested after layout settles and reads the rendered frame before swapping buffers. Visual checks
covered X11/software rendering at1440×1020 and1024×760, plus a Wayland
state-data view.

## Recovered component and initialization tools

```sh
cargo run --manifest-path rusttran/Cargo.toml -- native-seed 1
cargo run --manifest-path rusttran/Cargo.toml -- model-seed 1
cargo run --manifest-path rusttran/Cargo.toml -- vessel-step rusttran/examples/vessel-step.json
cargo run --manifest-path rusttran/Cargo.toml -- pump-step rusttran/examples/pump-step.json
cargo run --manifest-path rusttran/Cargo.toml -- math VLIQ 2200 500
```

Component tools print JSON results and the vessel solver includes an iteration
trace. They are isolated component calculations, not a full plant run.
Initialization maps preserve the original numeric conversions and store widths.
All 135 model fields are mapped; IC thermodynamics maps 104/109 fields.
Further derived globals and the other IC tables still require reconstruction.

The main coordinator uses Single-by-reference EULER arithmetic; the CLI `math
EULER` command retains its numeric Double input convention. The difference is
intentional and reflects the original Variant argument types.

The live conversion checklist is `analysis/CONVERSION_PROGRESS.md`.

The recovered accumulator discharge calculation is also available separately:

```sh
rusttran-cli accumulator-step accumulator-step.json
```

Use `examples/accumulator-step.json` as an input example. Pressures use psia,
volumes ft³, flow lb/s and step seconds. Activation and signed integer valve
values are supplied explicitly. Automatic activation, opening events and full
plant coupling are still being reconstructed. The original numeric branch is
checked in 200 comparison cases; its power helper is modeled in the reference.

Additional recovered calculations are exposed as isolated CLI commands:

```sh
rusttran-cli relief-step examples/relief-step.json
rusttran-cli saturated-step examples/saturated-step.json
rusttran-cli steam-generator-step examples/steam-generator-step.json
rusttran-cli controller-step examples/controller-step.json
rusttran-cli accumulator-activate examples/accumulator-activate.json
rusttran-cli supply-tank-step examples/supply-tank-step.json
```

The steam-generator final exchange includes pressure-floor handling, incoming
flow/enthalpy mixing, heat selection and derivatives of vapor mass fraction,
pressure and inventory. The PI controller preserves native lower-bound error
reset and upper-bound behavior. Accumulator activation preserves the one-shot
latch/time and uninhibited zero-valve opening rule. Supply tank depletion
reports a recirculation request only strictly below the configured threshold.
Upstream inputs and operating-mode selection remain caller-supplied.
These commands do not run complete plant scenarios.

All 14 final derivative outputs now have checked numeric equations and native
address bindings. Full initial-state construction, upstream balances/transfer,
reactivity, event/protection sequencing, operating controls and real plant
histories/reports remain incomplete. The graphical application still displays
initial conditions; the new component methods are not a completed GUI simulator.

More recovered upstream/startup blocks:

```sh
rusttran-cli steam-outflow-step examples/steam-outflow-step.json
rusttran-cli pressurizer-init examples/pressurizer-init.json
rusttran-cli startup-heat examples/startup-heat.json
rusttran-cli integration-restore examples/integration-restore.json
```

Outflow limiting preserves the native inventory/step cap and heat correction.
The fresh-start pressurizer calculation determines initial level, vapor mass
fraction and mass. Startup heat uses the model heat-conversion coefficient and
separate loop shares. Library constructors can attach authenticated BasicData
parameters; original startup mode/plant sequencing remains incomplete.

Integrator restoration uses all 22 recovered IC snapshots. Twelve state inputs
have checked source assignments; two unbound states and all previous derivatives
are required in the request. This command does not infer missing history or
complete the original plant initializer.

Recovered loop exchange and pressure-property preparation are available through:

```sh
rusttran-cli loop-transfer-step examples/loop-transfer-step.json
rusttran-cli primary-properties examples/primary-properties.json
rusttran-cli loop-reference-init examples/loop-reference-init.json
```

The exchange routine retains raw stack-offset argument names where physical identities remain uncertain. Its four outputs and intermediate trace were checked in 300 original-x86 cases. Reference initialization checks all 110 model/IC pairs and prepares 15 globals; pressure-property preparation checks nine outputs in 240 cases. These are component calculations, not complete simulation trajectories. The shared global store binds both loops and commits outputs only after successful calculation. The isolated loop command takes clock and modifier `0x54ba68` explicitly. The composed normal-loop command below computes that modifier from authenticated thermal-driving equations.

Loop power runs the actual VB6 DLL arithmetic with an explicit scratch errno cell and x87 53-bit precision. The original Windows application floating-point context has not been established.


Normal thermal driving is now connected to both loop components:

```sh
rusttran-cli thermal-driving examples/thermal-driving.json
rusttran-cli normal-loops-step examples/normal-loops-step.json
```

`normal-loops-step` loads the selected model and IC, computes reference values and the thermal coefficient from original initialization formulas, prepares normal thermal driving, and calculates loops A and B in original order. Clock and both failure times are explicit JSON inputs. The normal branch is explicitly selected; external-model mode and the event dispatcher are not implemented by this command. It performs one component update, without advancing the 14 plant states. Library updates are atomic across both loops.

The normal thermal calculation has 320 original-x86 cases. The composed initialization/driving/loop sequence has 330 reference cases: all 110 model/IC pairs at 0, 150 and 300 seconds, with failure-time boundaries exercised. These compare independent original slices with the Rust calculation; they do not run complete Windows PCTran trajectories.


Additional recovered stages:

```sh
rusttran-cli decay-heat examples/decay-heat.json
rusttran-cli thermal-mode-step examples/thermal-mode-step.json
rusttran-cli feedwater-pi-step examples/feedwater-pi-step.json
rusttran-cli primary-exchange examples/primary-exchange.json
rusttran-cli pump-pair-step examples/pump-pair-step.json
rusttran-cli primary-liquid-properties examples/primary-liquid-properties.json
rusttran-cli native-stages examples/native-stages.json
```

The alternate decay-heat routine keeps its original binary64 result, eleven exponential groups and 10000/60000-second correction boundaries. These late-time checks execute a numerical helper directly; they are not original application runs beyond its 300-second cap.

Thermal mode selection follows the original fault/mode flags and retains the prior modifier at/below the external threshold. Alternate-model states must be provided explicitly; the full alternate model is incomplete. The SG pressure PI branch includes its fault-specific bounds, integral time and heat partition. Both SG caller bindings now connect the controller and final derivatives to shared globals.

Coupled RCP updates recover normalization, the void-fraction cap and asymmetric time constants: A selects 2 seconds in the recovered event-time branch, while B uses the model constant. Trip/restart GUI events are still excluded. Primary exchange prepares five globals and six traced locals before the remaining balance equations. Liquid preparation computes three P/T properties.

`native-stages` runs an explicitly ordered sequence over authenticated model/IC seeds and optional explicit extra globals. It returns all stage results and the updated store. The batch commits only after every stage succeeds. This construction API does not select original events or constitute a complete plant timestep. Missing inputs fail with the stage number and name.


`primary-inventory examples/primary-inventory.json` additionally computes primary mass and the previously missing balance locals `local_ac`, `local_24`, `local_30`, `local_3c` and `local_48`. This matches 300 original numeric-slice cases. The signed I16 command and upstream volume slope remain explicit inputs. The `primary_inventory` stage commits mass to the shared store and returns the locals for further balance construction.


`normal-primary-phase examples/normal-primary-phase.json` recovers the no-phase-change branch and resolves `local_98`, `local_88` and `local_a4` from supplied upstream locals. It covers both signs of transfer flow and refuses nonzero native phase flags. Three globals and five locals match 300 original-x86 cases. The corresponding recovered stage commits shared globals atomically; the wider phase API below additionally covers all four zero/one combinations.


The four primary phase branches and preceding state/flow preparation are recovered:

```sh
rusttran-cli primary-phase examples/primary-phase.json
rusttran-cli primary-phase-state examples/primary-phase-state.json
rusttran-cli primary-flow-preparation examples/primary-flow-preparation.json
rusttran-cli primary-heat-capacity examples/primary-heat-capacity.json
rusttran-cli primary-correction examples/primary-correction.json
rusttran-cli primary-core examples/primary-core.json
```

`primary-core` connects thermal capacity, exchange, inventory, volume transfer, phase reconstruction, flow preparation when selected, all four phase-flag branches, late liquid-volume properties, correction and five final derivatives. Its 160 references run the original slices in a single x86 machine/frame, including 71 early phase exits and 89 flow-preparation paths. Flags/latches are exact, numerical outputs within four float32 ULP.

This command requires a raw shared-state snapshot, pump heat contributions and a signed I16 command. With optional `heater_controls`, it computes heater heat after the phase update and before the energy correction; otherwise `0x54b6dc` must be supplied. With optional `spray_controls`, the spray numeric/interlock paths execute before heaters. The common control signal can be prepared separately from pressure and its upstream adjustment. COM event/error handling remains excluded. Cached saturation pressures in the reference cases are 100–2600 psia so the volume-slope denominator remains nonzero. This is not a complete plant timestep or a test of Windows error handling. Missing inputs leave the shared state unchanged.

The flow locals used on early phase exits are zero because the original frame explicitly clears them at `0x50af64/67/6a/6d`; they are not inferred defaults. Phase pairs 00/01/10/11 are supported; other native flag values are rejected. Native threshold comparisons preserve strict versus inclusive boundaries. The thermal capacity is computed from HLIQ at Single-rounded T +/- 2 degF, divided by the original I16 value 4.

The `numeric_constants` stage also restores `0x54b70c` from the original Double -5e-7 initializer with its exact Single bits. Each of the new component preparations and `primary_core` is available through the recovered-stage API. Heat capacity is computed from the original formulas.

Heater numeric control is available as `heater-control examples/heater-control.json`, as the `heaters` recovered stage, or within `primary-core examples/primary-core-heaters.json`. The `primary_core_with_heaters` stage supports the same connected computation. 800 original numeric-path comparisons and 160 composed core/heater comparisons pass. GUI inputs remain explicit; the coordinator signal expression is now available as a separate stage.

Spray control is available as `spray-control examples/spray-control.json`. `pressure-control-signal examples/pressure-control-signal.json` implements the authenticated coordinator signal expression. `primary-core examples/primary-core-controls.json` connects spray and heaters before the energy correction. The `primary_core_with_controls` recovered stage exposes the same sequence; `pressure_control_signal` prepares its signal beforehand. Prior spray flow is still required because the original inventory and phase stages read it before refresh. See [spray conversion evidence](../analysis/SPRAY_PORT.md).

Fresh pressure-control initialization is available as `pressure-control-init examples/pressure-control-init.json` and recovered stage `pressure_control_init`. It copies nominal model pressure to the reference and sets the level interlock. `primary-control-feedback examples/primary-control-feedback.json` / stage `primary_control_feedback` refreshes the exchange state and level percent and applies the native temperature floor after balance. It requires the upstream exchange trace explicitly. These fragments add 620 exact-bit original-slice comparisons; complete initialization and timestep dispatch remain unfinished.

Fresh primary initialization is now connected to the desktop: **Code Control → Initialize thermal systems**. Select a model and calculate its fresh primary state from the selected operating point. `rusttran --ic 1 --initialize-primary 1` opens the populated window. This computes real recovered initialization equations; whole-plant startup and transient evolution remain incomplete.

CLI: `fresh-primary-startup examples/fresh-primary-startup.json` uses the same backend as the GUI; all 110 source model/operating-point combinations are compared. `fresh-primary-init` and `fresh-primary-inventory-init` expose the numerical branch separately. `primary-control-cycle examples/primary-control-cycle.json` connects the pressure signal, spray/heaters, balance and post-balance feedback with atomic rollback; upstream plant inputs remain explicit and the cycle does not perform full-plant integration.

The initialization panel now includes both steam generators and feedwater setup: **Code Control → Initialize thermal systems**, or `rusttran --ic 1 --initialize-thermal 1`. SG inventories are displayed in lb; actual feedwater/coolant flows have separate lb/s rows. `fresh-thermal-startup examples/fresh-thermal-startup.json` uses the same backend, checked for all 110 source model/operating-point pairs. Complete plant initialization is still pending.

`native-integration-step examples/native-integration-step.json` connects all 14 integration states and their histories to shared globals and computes the original timed-event update. It requires every state, derivative and previous derivative explicitly. It does not calculate all plant derivatives or advance the simulation clock. The `stream_balance` and `native_integration` recovered stages can be sequenced atomically after their upstream producers. These blocks remain separate from the full transient GUI engine.

The recovered numerical pipeline is available through `recovered-primary-step` and `recovered-primary-run`. It connects refreshed pressure properties, primary sources, relief discharge/tail decisions, primary controls/balance/feedback, stream derivatives and all 14 integration states. Choose exactly one SG producer: six explicit `steam_derivatives`, or `steam_phase_flags` to execute both recovered SG exchanges. Examples: `examples/recovered-primary-step.json`, `examples/recovered-exchange-step.json`, and the corresponding `*-run.json` examples. Run timestamps must be contiguous at native Single precision; a late failure rolls back the entire run. Remaining upstream transfer/control/device/event producers are explicit boundaries, so this is not yet the complete plant transient engine.

`native-stages examples/new-process-storage-stages.json` checks the explicit process-birth storage layer against original mapped PE bytes. It cannot overwrite existing/restored histories. `integrator_alias` is a separate stage after the chosen state-loading path. Raw process defaults do not replace application initialization, Reset or restored-scenario semantics. [Evidence and remaining work](../analysis/RECOVERED_STEP_CONNECTIONS.md).


Recovered device automation is available with `primary-devices-step
examples/primary-devices-step.json`, or the `primary_devices` recovered stage.
It updates charging/letdown/injection flows, latch/timestamp, PI history and
explicit control properties. Returned control state should be retained for the
next update. Original COM setter callbacks remain outside the port.

`native-stages examples/primary-reference-stages.json` runs dynamic temperature/
level references; `native-stages examples/fresh-auxiliary-stages.json` initializes
25 cached states before external-model initialization. The GUI/CLI thermal
startup backend now returns 105 Singles and 14 flags for all 110 verified model/
operating-point pairs. Previous integration histories and restore/Reset remain
separate.

`recovered-primary-step examples/recovered-devices-step.json` connects optional
`references` and `devices` to the existing SG/primary/integration pipeline. Both
new source flows are produced in this update rather than supplied as initial
values. Other pump, feedwater, thermal and event producers are still explicit;
this does not enable full plant trajectories in the GUI. Current original-slice
comparison: 22,345 cases and 464,346 output checks; 153 Rust tests.
[Detailed evidence and limitations](../analysis/PRIMARY_DEVICE_CONNECTIONS.md).


`rcp-control-step examples/rcp-control-step.json` / stage `rcp_control` adds the
original RCP switching, timestamps, target selection and flow updates.
`recovered-primary-step examples/recovered-rcp-step.json` connects it before
relief, both SGs and primary integration. RCP event time and UI command
properties remain explicit; callback/event scheduling is not reconstructed.
[Source evidence](../analysis/RCP_CONTROL_CONNECTIONS.md).


`steam-control-step examples/steam-control-step.json` / stage `steam_control`
executes the original initial SG control prefix: feedwater timing/level, pressure
PI, fault response and heat partition. `recovered-primary-step
examples/recovered-steam-control-step.json` enables optional `steam_controls`
for both sides. It requires `steam_phase_flags: [0,1]`; the legacy name denotes
SG selectors A/B, not mixture phase. Both calls share one `failure_time`, the
transition timestamp and fault checkbox. Returned checkbox state should be
retained for the next update. SG vapor enthalpies are calculated inside the step.

960 prefix cases and 32 composed updates were compared with original native
slices. Auxiliary feedwater is now available through the optional stage below, so these CLI
commands do not enable full GUI plant trajectories.
[Evidence](../analysis/STEAM_CONTROL_CONNECTIONS.md).


`steam-valves-step examples/steam-valves-step.json` / stage `steam_valves`
runs SG main/feedwater closures, safety valve hysteresis/manual overrides,
fault-flow branches and inventory-limited outflow with heat correction.
`recovered-primary-step examples/recovered-steam-valves-step.json` connects
optional `steam_valves` before both SG exchanges. Returned control state should
be kept for the next update. With both SG producers enabled, the initial prefix
reads feedwater percentage from `steam_valves.feedwater` rather than the legacy
fallback array in `steam_controls`. Native computed SG selectors [0,1] are
required. Auxiliary feedwater is available through the stage below; full plant trajectories
and GUI evolution remain unavailable.
[Source evidence and exact boundary](../analysis/STEAM_VALVE_CONNECTIONS.md).


`steam-auxiliary-step examples/steam-auxiliary-step.json` / stage `steam_auxiliary`
ports the remaining SG auxiliary feedwater controller. `steam-system-step
examples/steam-system-step.json` executes the entire recovered SG numerical/
control body; `examples/steam-system-active-step.json` exercises auxiliary mode.
`native-stages examples/steam-system-stages.json` uses the same transactional
implementation. Inactive auxiliary mode preserves feedwater/history; both
paths use total outflow in the final exchange.

`recovered-primary-step examples/recovered-steam-system-step.json` enables
`steam_auxiliary_percent: [A,B]` alongside `steam_valves` and computed SG selectors
[0,1]. Preserve returned checkbox and valve state for subsequent updates.
640 auxiliary cases, 320 continuous original-body cases and 32 more connected
updates check the implementation. Complete plant initialization/events, remaining
thermal/source producers and GUI transients remain unfinished.
[Evidence and corrected pointer analysis](../analysis/STEAM_SYSTEM_CONNECTIONS.md).


The fresh thermal backend now includes late numeric references and properties:
**105 Single values and 14 flags for all 110 model/IC pairs**. These recompute
level/flow targets from the freshly initialized systems and produce auxiliary
feedwater enthalpy and primary liquid properties. `late-thermal-init
examples/late-thermal-init.json` or stage `late_thermal_init` runs the new stage.

`fresh-control-history examples/fresh-control-history.json` / stage
`fresh_control_history` initializes 11 fresh control-history/boron/rod values
using the explicit original malfunction flag. It preserves unrelated integrator
history. It is separate from the GUI thermal button, which does not choose a
fault mode. Neither stage provides complete Reset/restore or event dispatch.
[Source evidence and limitations](../analysis/LATE_THERMAL_INITIALIZATION.md).


`restored-control-state examples/restored-control-state.json` / stage
`restored_controls` implements the original restored clock/reference state and
twenty-event time rebasing. Saved boron, SG level-error histories and integrator
histories are preserved. It accepts decoded state and arrays; full saved-file
loading, Reset/restore dispatch and GUI Resume remain unfinished.

Optional `event_schedule` in recovered step controls binds original event-array
times to RCP and both SGs, plus the original SG malfunction entries. Example:
`recovered-primary-step examples/recovered-restored-events-step.json`. Its scalar
state and schedule are already restored. Other protection, ramp/delay/latch
dispatch remains explicit. 400 native restored-branch cases and 32 composed
updates validate the new work.
[Source evidence and limitations](../analysis/RESTORED_CONTROLS_AND_EVENTS.md).

Optional `normal_thermal` in `recovered-primary-step` computes current thermal
power/temperatures and both loop heat transfers before the SGs and integration.
It requires the authenticated native model-mode flag to be zero. Both loops share
`failure_time`; `event_schedule`, if supplied, overrides it from time 8 and selects
the thermal fault flag from flag 7. Cached heat/level outputs are then unnecessary.
The original A-to-B reference copy and B loop-count conversion are preserved.
Nonzero external-model modes require the remaining external dispatcher.

`recovered-primary-step examples/recovered-thermal-step.json` demonstrates the
connection. The shared fresh GUI/CLI backend now also includes the driving
coefficient and unit factor: 107 Singles and 14 flags for all 110 model/IC pairs.
[Native evidence and remaining work](../analysis/CONNECTED_THERMAL_TRANSFER.md).

`accumulator-system-step examples/accumulator-system-step.json` joins the native
activation latch and valve decisions with discharge and gas expansion using the
original coordinator globals. The `accumulator_system` stage exposes the same
atomic update. Optional `accumulator` in `RecoveredStepControls` produces current
injection flow before source summation and the later balance/integration.
Use `recovered-primary-step examples/recovered-accumulator-step.json`. Retain the
returned valve properties for later calls. COM callbacks, the remaining supply
dispatcher and full initialization/GUI transients are still outside this block.
[Native verification](../analysis/ACCUMULATOR_SYSTEM_CONNECTIONS.md).

The recovered supply system now includes injection activation, mode switching,
recirculation, cooling, heat removal and source enthalpy. Use
`supply-system-step examples/supply-system-step.json`, stage `supply_system`, or
`recovered-primary-step examples/recovered-supply-step.json`. Both PL/WL curve
queries and native mode/threshold behavior are checked against original x86.

`recovered-session-run examples/recovered-session-run.json` advances a stateful
session and returns its updates plus a resumable `solution.session`. Calculated
pump/valve/heater/spray commands carry into the next update. A failed batch changes
neither numerical state nor commands. This requires explicit decoded initial and
unrecovered source state; it is not a PCTran save-file loader or the full plant
scheduler. The GUI preview remains independent of this CLI engine API.

From the project directory, export actual recovered-session samples with:

```
python3 scripts/run_session_report.py \
  --state rusttran/examples/recovered-session-run.json \
  --steps 8 --output analysis/session-history
```

The output contains a resumable JSON result, CSV samples and an offline HTML plot
with variable selection and native units. The supplied example uses short synthetic
component-state chains, not an original application's complete reactor scenario.
See [supply evidence](../analysis/SUPPLY_SYSTEM_CONNECTIONS.md) and
[session/history evidence](../analysis/RECOVERED_SESSION_CONNECTIONS.md).


## Simulation workspace (2026-10-21)

Open **Simulation → Load sample session → Start**. The sample is embedded in
both desktop executables, including `RustTran.exe`. It is a synthetic component
reference state, not a complete initialized reactor scenario. Existing IC/schematic
views continue to show stored initial conditions; their preview clock is separate.

Alternatively load an explicit engine session:

```sh
rusttran --session rusttran/examples/gui-simulation-session.json
rusttran --session rusttran/examples/gui-simulation-session.json --session-steps 8
```

Start/Pause/Step/Reset operate on actual computed state. Reset restores the loaded
session and its controls. Device panels pass RCP, supply/injection, accumulator,
heater/spray and SG commands to the same stateful engine as the CLI. The workspace
shows 16 selectable computed series, retains the most recent 50,000 samples, saves
resumable session JSON and exports the retained history as CSV in native units.
Loop thermal feedback is optional for older sessions and enabled in the sample.
Missing required inputs stop execution with an error; they are not filled silently.

The fresh model/IC initialization backend now produces 130 Singles and 15 flags
for all 110 pairs. It is still not a complete source of runnable session state.
Full IC startup/restore, remaining plant sources, external model, protection/event
scheduling and original Windows scenario agreement remain unfinished.

Validation: 163 Rust tests; 23,322 native component/composed cases and 524,437
output checks. These counts do not validate complete PCTran scenarios. Actual X11
widget tests exercise Start, Pause, Step, Reset, embedded sample loading and manual
heater control; the resulting heater-step session matches the CLI exactly.
See [workspace evidence](../analysis/SIMULATION_WORKSPACE_CONNECTIONS.md) and
[current progress](../analysis/CONVERSION_PROGRESS.md).


## Recovered fresh state with Double model initialization

`Code Control → Initialize thermal systems` now preserves loop references,
control histories, 33 Double writes and 12 owned Double arrays. Use **Save
initialized state** to export them. This export is not a runnable session or an
original save file. The existing IC snapshot stays unchanged.

```sh
rusttran-cli fresh-initial-state examples/fresh-initial-state.json
rusttran-cli alternate-init examples/alternate-init.json
rusttran-cli native-stages examples/startup-clock.json
```

The assembled state contains 290 Singles and 28 integer fields for each of the
110 source pairs, alongside Double/array state and model Double inputs. Startup
clock conversion uses the original floor operation. JSON decoding preserves
binary64 round trips. Current validation: 170 Rust tests, 23,912 native
component/composed cases and 608,507 output checks. The numerical Double
initializer is implemented; its evolution, full startup/restore and complete
plant/event coordination remain open. See
[fresh state evidence](../analysis/FRESH_STATE_AND_DOUBLE_INITIALIZATION.md).


With a recovered session loaded, **View → Live simulation mimic…** shows current
computed pressures, temperature, levels and coolant flows in the original-style
layout. Unconnected readouts/device states show —; stored IC values are not used
as fallback. Continue stepping and controlling the session in Simulation.


## Install/update the latest published build

Linux x86_64, glibc >=2.28, Python 3 and a desktop with OpenGL:

```sh
gh api --hostname github.com -H 'Accept: application/vnd.github.raw+json' repos/p01t3rge1st/RustTran/contents/install.sh | bash
```

The private repository requires access and `gh auth login` once. Run the same
command to update. The installer downloads a successful release, verifies SHA-256
and installs the GUI/CLI plus a Plasma/GNOME menu icon for the current user.
Windows binaries and the Debian package are available from
[Releases](https://github.com/p01t3rge1st/RustTran/releases/latest).

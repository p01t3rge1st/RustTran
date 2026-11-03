# Remaining engine dependency work

Current portable build: 24672 component/composed-slice cases, 653483 checks; 176 Rust tests (2026-11-03). Full PCTran replacement remains incomplete.

1. Primary numerical core is connected for all four zero/one flag combinations, including phase-state changes and flow preparation. Heater numeric control `0x500bd0` is now connected after live phase updates and before energy correction; 800 standalone and 160 composed original-slice cases pass. Spray selector `0x500950`, caller interlocks, manual/auto command writes and flow arithmetic are now ported (640 cases), and both controls are connected in original order (160 composed cases). Shared signal preparation `0x51e0c7–0x51e0d9` is checked (300). Fresh pressure reference `0x54ba4c` now copies nominal model pressure; initial interlock `0x54b6c0` is level * 100 (300 cases). Post-balance refresh and temperature floor are recovered as explicit stages (320 cases). Pressure signal, controls, balance and post-balance feedback are now one transactional primary control cycle (160 references); no integration or other-plant update is implied. New-start state/flags and connected inventory are checked (240+240), and the GUI/CLI primary startup backend covers all 110 model/operating-point pairs. Source/phase-flux preparation, relief discharge and post-discharge state are now bound to primary control/balance, stream derivatives and integration. Numerical updates can either consume six explicit SG derivatives or execute both recovered SG exchanges. 32 + 32 isolated updates and 8 + 4 three-update chains pass original-slice comparisons. Transfer/control/device producers and scenario scheduling are still boundaries. Dynamic temperature/level references and charging/letdown/injection automation are now optional producers in that pipeline (320 reference, 960 device and 32 connected-update cases). Next: complete initializer/restore branches, relief/protection dispatch and remaining source producers; then wire a complete timestep to GUI controls.
2. Fresh SG phase/level (320) and feedwater/coolant-share setup (300) are now connected to fresh primary initialization. The fresh cached-state prefix through 0x51ba28 adds 25 writes (320 standalone cases); late numeric reference/property slices now extend the 110-model/operating-point backend to 130 Single outputs and 15 I16 flags; current derivatives are initialized only at the explicit source-proven stores. An explicit fresh control-history stage adds 11 stores with a supplied fault flag (320 cases); restored control state and 20-event rebasing are now ported (400 cases); known event inputs feed RCP/SG (32 additional connected cases). The numeric Double-model initializer is now assembled below. Double-model evolution, full restored-file loading/dispatch and remaining arrays/histories remain separate. See LATE_THERMAL_INITIALIZATION.md. Bind and initialize the cached globals required by the core from authenticated model/IC data and remaining upstream components. Do not fill missing source states or heat with zeros. The skipped frame flow locals are an exception because their zeroing is explicitly proven by original instructions.
3. The entire recovered SG numerical/control body 0x5089f0–0x50ad65 is now connected: initial controls, valves/outflow, auxiliary feedwater and final saturated exchange. 640 auxiliary and 320 continuous native-body cases plus 32 additional composed updates pass. Activation requires exact flags ==1. Both paths use total outflow: 0x50a7ff already changes ESI, correcting the earlier pointer inference. See STEAM_SYSTEM_CONNECTIONS.md. Next work moves to remaining plant producers/initialization/event dispatch; original COM callbacks and actual GUI controls remain unverified.
4. Pumps: switch/timestamp/target/flow producer is now connected and checked (768 cases), including the original B-restart matrix index and A-before-B update order. It is optional in the recovered timestep (32 composed cases). Known RCP trip-time binding from the event array is now connected; the full scheduler/protection dispatch and COM setter callbacks remain outside this block. See RCP_CONTROL_CONNECTIONS.md.
5. Alternate thermal branch selection and its decay-heat helper are checked. The underlying alternate model (including 0x526b40) must supply its Double states; these are still explicit inputs.
6. Shared-state integration now binds all 14 state/current/previous derivative triples, copies the primary alias and computes the original time-gated event update. The original coordinator constraints are executed in 36 reference cases. The stream-balance derivative pair is also bound to shared state and covered by late-failure batch rollback. Complete plant derivative production still must precede integration. Finish initializer and event/protection dispatch, including delay/ramp behavior and latch histories. Loader-mapped process-birth values for two integrated accumulators, 14 previous derivatives and two flow-history fields are now authenticated; an explicit stage refuses to overwrite existing/restored state. The initializer fraction alias is also connected. Application-start, Reset and restored-scenario values still require their real dispatch paths; five IC fields remain without authenticated bindings.
7. Simulation workspace now advances the recovered engine from an explicit session or embedded synthetic sample. Start/Pause/Step/Reset, device controls, 16 history series, resumable JSON and retained CSV are connected. Actual X11 clicks validate run/pause/reset and manual heater state against CLI. This closes the recovered-engine GUI connection, not full IC initialization or complete scenarios. Next connect a complete authenticated fresh/restored initializer, remaining source/event models, and live original schematic values. See SIMULATION_WORKSPACE_CONNECTIONS.md.

Use recovered-stage composition and atomic shared-state updates to connect the next authenticated blocks. Update progress and original-slice fixtures with each port. Windows app floating-point context and complete trajectories remain unvalidated.


The four 0/1 phase branches, phase-state/flow preparation and core thermal capacity are now connected in `primary_core.rs`, with one-frame original references. The previously remaining phase locals are computed for supported flags. Heater and spray numeric controls can now calculate heat/flow inside the core. The common signal has an authenticated coordinator expression; its pressure-adjustment producer and initial/history state remain upstream dependencies. `0x54b70c` is now an authenticated constant. Other cached/upstream plant properties and complete initialization still need binding/verification before real timesteps can be driven from the GUI.

Latest closure: normal mode-0 thermal driving and both loop transfers are connected
before SGs/integration, including event 7/8 bindings and the A-to-B reference copy.
Fresh initialization now provides its coefficient and unit factor (107/14).
Remaining thermal work is external-model dispatch and the other coordinator
producers/order, not reconnecting these normal loop formulas. See
CONNECTED_THERMAL_TRANSFER.md. GUI Start preview still advances only the clock.

Accumulator closure: native caller globals now bind activation, valve decisions,
water depletion and gas expansion into one update before source summation.
640 continuous-body and 64 composed references cover the connection. The full
supply-tank/injection/recirculation dispatcher is a concrete next source dependency;
only its supply-depletion helper is currently ported. This stays under AUTO/STEP.
See ACCUMULATOR_SYSTEM_CONNECTIONS.md. Do not reconnect accumulator formulas as a
new task; remaining GUI COM callbacks and full scenario dispatch are separate.

Supply closure: 0x510850's recovered mode/control/numeric body is now connected
before accumulator and source summation. It includes injection, recirculation,
cooling, heat and source enthalpy. Do not list this dispatcher as unported again.
Next source/thermal dependencies include the later containment/auxiliary producers
0x502480 and 0x5034b0, their caller-local flows and other transport/heat states;
external Double initialization/evolution and full scenario scheduling remain open.

A stateful session now retains all returned recovered actuator commands, including
primary heaters/spray at their original calculation stage. CSV/JSON and interactive
HTML history are available for that supplied-state session. Complete fresh/restore
state construction, actual GUI Start/Pause/Reset wiring and whole-plant validation
remain necessary. Short stateful reference chains are not long transient proof.


Late primary loop-temperature feedback (0x50d1f8–0x50d867) is now an optional
connected stage, enabled by the sample: 640 continuous native cases and 16
eight-update original-slice chains. It supplies current hot/cold temperatures,
four filtered histories and accumulator bulk fraction. Do not list this exact
body as still unported. Other transport/external branches remain unaudited.


Current fresh-state closure (2026-10-21): the numerical Double/array initializer
0x52624b–0x5269d2 and two fresh temperature stores are now ported (240 native
cases). The original floor-to-I16 startup clock is checked against actual VB6
machine code (240 cases). All recovered fresh writes/references are preserved
in an assembled state (290 Singles/28 integers plus 33 Double writes/12 arrays),
checked for 110 source pairs and exposed by the GUI initializer/JSON export.
Do not list that numeric Double initializer as unported again. Evolution
0x526b40, complete fresh/restored dispatch, other histories, source/protection
scheduling and whole original scenarios remain open. Current validation: 169
Rust tests, 23,912 cases and 608,507 checks. Earlier entries are historical scope
records. See FRESH_STATE_AND_DOUBLE_INITIALIZATION.md.


Live mimic connection: View → Live simulation mimic now renders the original-style
layout from nine recovered pressure/temperature/level/flow fields, using inverse
authenticated IC conversions. No fallback to stored IC power, rods, containment
or device state is used. Current GUI widget tests open this window and preserve
manual heater/CLI equivalence. Current Rust test count is 170. Remaining schematic
coverage depends on unconnected source/device states, not these nine mappings.


Current closure (2026-11-03): containment fan cooling 0x5034b0 is connected
before stream balance/integration, with retained automatic/manual commands.
720 standalone references, 32 composed steps, and eight eight-step native-slice
chains pass. Classic fan command 75% + Step matches CLI; heat is recorded as
the 17th series. See CONTAINMENT_FAN_CONNECTIONS.md. Older paragraphs listing
0x5034b0 as wholly unported are historical. Next containment work is spray
0x502480, source/balance 0x5233c5–0x523f36, and binding recovered vessel solver
0x5011b0. Fan heat alone does not evolve containment pressure/temperature.


Current closure (2026-11-03, spray): 0x502480 is now ported and connected
before fans. 192 standalone references, eight composed updates and two four-step
chains pass; shared device/supply/exchanger properties use current commands.
See CONTAINMENT_SPRAY_CONNECTIONS.md and SESSION_HANDOFF.md. Earlier references
to wholly unported spray are historical. Next: complete source/balance
0x5233c5–0x523f36 and vessel binding 0x5011b0, preserving caller-local spray
return flow/temperature and all other source terms. Do not fill missing sources
with zero. Dedicated classic spray controls are still open. Current tests:181;
new targeted comparison:202 cases/10424 checks. Packages remain fan checkpoint.


Current closure (2026-11-03, containment balance): numeric 0x5233c5–0x523f36
and conditional vessel0x5011b0 are now connected after spray/fans. Includes
caller wall feedback and old-temperature snapshot0x5232ee–0x523358; current
supply return_flow (native EBP-0x28 from caller0x51df66) plus spray return_flow
produce BA24. Current device command and event times2/3 override fallback copies.
144 continuous native caller cases (84 solver calls), eight composed updates and
two four-update chains pass. 187 Rust tests, Clippy and 154-case/11359-check
small CLI report pass. PRB/TRB/LWRB and23-series history expose these outputs.
Earlier paragraphs listing the numeric containment balance/vessel binding as
wholly unported are historical. Next: remaining upstream heat/Double/fault
producers (BB08/B754/BFB8, BF7C/BDF4, fault Single array+0x3c), complete scenario
initialization/events/alternate model; dedicated classic spray controls.
See CONTAINMENT_BALANCE_CONNECTIONS.md and SESSION_HANDOFF.md. No release or
installed-binary rebuild; no original Windows end-to-end proof.


Current closure (2026-11-03, thermal/hydrogen): BFB8 source0x51fc92–0x51fd6c
and ignition/delayed burn/extinction0x52059e–0x520986 are ported and connected
before normal thermal/SG and containment balance. Shared event4 time updates
on ignition and survives save/resume. The original seven-point limit curve is
recovered from initializer0x51d326–0x51d3c6 (EBX/EDI context0x51c98a/0x51c998),
so it no longer needs an invented threshold.335 native cases +8 composed steps
+2 sixteen-update chains pass (345 cases/26830 checks);194 Rust tests and Clippy
pass. Both chains ignite, burn ten times and extinguish. Classic Hydrogen and
25-series history expose computed results. No new X11/package/Windows build.
BB08 is already a checked startup constant: earlier lists calling it missing
were inaccurate. BFB8/B754 arithmetic and burn logic are now closed; upstream
C000/BFFC/BFB4/C004 reaction/inventory production and alternate-model Double
BF7C/BDF4 evolution remain the earlier unresolved dependency, not new independent
scope. Next inspect the source prefix before0x51fc92, model0x526b40 evolution
and original initialization/restore. See CONTAINMENT_THERMAL_CONNECTIONS.md.


Current closure (2026-11-03, post-model transfer):0x51f8c6–0x51fc92 is ported
and connected before thermal/hydrogen. BFB4 and BFCC/BFBC/BFE8 histories are now
produced, with Double node-fraction gate and original Single stores.206 native
output cases +one native singular/error case,8 composed updates and2 sixteen-step
chains pass;216-case/20542-check small CLI report,200 Rust tests and Clippy pass.
One active chain has no transfer, the other transfers in all16 updates. Double
control retention is bit-exact. Typed initialized-state adapter checked for110
source pairs, preserving the original zero-fraction skip. Important correction:
C000/BFFC/C004 are already loaded FCO2/FH2O/FDEC model parameters, not independent
unported producers. BB08 also already loaded. Remaining upstream dependency is
actual Double/node evolution0x526b40 and hydrogen production/BF7C/BDF4; full
0x503f50, startup/restore/dispatcher and original Windows trajectories remain open.
Do not repeat BFB4 transfer/source/burn/balance ports; see REACTION_TRANSFER_CONNECTIONS.md
and SESSION_HANDOFF.md. No new packages, Windows build or X11 widget test.

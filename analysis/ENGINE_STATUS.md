# RustTran transient-engine reconstruction

Work started 2026-10-13. The GUI has an initial-condition viewer and a real recovered-engine Simulation workspace.
It is not yet a complete plant simulator. This document tracks concrete implementation and
remaining dependencies; helper agreement must not be reported as plant validation.

## Implemented and checked

- `rusttran/src/integration.rs`: original 14-state update order, Single stores,
  previous-derivative updates, first-state copy, fraction upper bounds,
  nonnegative-state bounds and pressure floor. Consumes externally supplied
  derivatives and floor. The intervening property calculation is not included.
- `rusttran/src/balance.rs`: seven final derivative outputs for globals 0x54b77c,
  0x54b774, 0x54b770, 0x54b784, 0x54b788, 0x54b674 and 0x54b4b8.
  Includes the pressure, tail, stream and volume balance blocks. Earlier local and global operands remain required
  inputs, not reconstructed initial-condition mappings.
- 100 integration-stage cases: 1,400 original EULER prefix executions with
  original numeric VB6/OLEAUT32 helpers, with remaining storage/error helpers
  modeled. Coordinator constraints come from recovered assembly.
  Rust state values matched fixture bits exactly.
- 400 balance cases: direct x86 execution of the four balance blocks; pressure
  block models only the Single-rounding helper. Acceptance is <= 2 float32 ULP.
- Existing 253 helper comparisons remain passing. Complete Windows VB6 runtime, full coordinator execution and end-to-end
  0–300 s trajectories are not verified.

Regenerate new fixtures:

```sh
.tools/python/bin/python scripts/integration_oracle.py
.tools/python/bin/python scripts/balance_oracle.py
.tools/python/bin/python scripts/pressure_balance_oracle.py
cargo test --manifest-path rusttran/Cargo.toml --test integration --test balance
```

## Native investigation

`analysis/rea/engine-components.json` preserves REA results for seven component
selectors. Six produced pseudocode. Decompilation of 0x5059e0 stalled and its
owned decompiler subprocess was cancelled; its item explicitly records failure.
Do not infer complete body ownership from decompiled text alone: some native VB6
procedures have overly broad recovered ranges and nonsensical pointer types.
Assembly is authoritative for numeric operand binding.

`analysis/rea/derivative-writers.json` inventories direct writes to integration
inputs. 0x50af30 is the nearest procedure entry before five derivative stores;
0x51afe0 contains reset writes. This inventory cannot locate every derivative:
indirect pointer stores and component output bindings require further tracing.
0x4fa8e0 is immediately before integration but is not thereby proven to compute
all derivatives. Its outputs do not directly account for the 14 required inputs.

`analysis/rea/state-derivatives.json` preserves the two following requests:
0x50af30 decompilation stalled and was cancelled (explicit failed item),
while initialization procedure 0x51afe0 produced pseudocode retained as
`analysis/rea/0x51afe0.c`. It initializes derivative globals to zero and,
in its fresh-state branch, copies 0x54b124 into pressure 0x54b494,
0x54b758 into state 0x54b49c, and 0x54b764 into paired states
0x54b4fc/0x54b500. These are global-to-global relationships; they do not yet
prove direct CSV field bindings or unit conversions.

## Remaining work in dependency order

1. Finish upstream balances in 0x50af30; initialize all required locals and globals
   from authenticated original field-to-global assignments. Establish pressure,
   temperature, inventory and flow unit conversions before using CSV values.
2. Trace indirect derivative stores and complete component calls in 0x51d3d0.
   Resolve all 14 derivative inputs, including neutron/thermal response and
   steam-generator/containment relationships. Preserve branch and Single-store order.
3. Map pump/valve UI inputs into these equations. COM calls currently mix control
   reads, state writes and logging; removing them wholesale is not a valid port.
4. Recover malfunction timing, delay/ramp behavior and protection latches. Stored
   scenario JSON currently records settings only. Preserve arbitrary original
   failure fractions until their interpretation has been verified.
5. Connect validated state outputs to GUI controls and fixed simulation steps.
   Add real variable histories, plot selection and CSV/report exports.
6. Validate unchanged, control-change and fault scenarios at matching times in
   0–300 s against actual PCTran runs. Original Windows/MSVBVM60 execution is
   unavailable on the current Linux host; numerical-prefix tests are narrower.

Do not replace missing equations with generic reactor approximations or expose
preview-clock movement as a completed simulation.

## Extended conversion and native runtime validation

- IC field loading: 85 Single and 19 integer fields mapped (104/109).
  1,870 numeric and 418 integer field-store cases cover all 22 snapshots.
  Five fields without located name references remain unresolved.
- BasicData: all 135 numeric source fields mapped, including four seven-point
  curves and five Double stores. All 675 cases across five configurations
  matched original conversion blocks and original VB6/OLEAUT32 arithmetic.
  This does not mean all post-load derived globals or initialization behavior
  have been translated.
- `vessel.rs`: complete numerical equilibrium branch of 0x5011b0; 112 cases
  compare final outputs, iteration counts and each iteration's numeric trace.
  Component exchange inputs and original UI/logging/error paths remain external.
- `pumps.rs`: RCP numeric flow updates, 200 original-block cases. Near
  cancellation, native x87 vs portable binary64 may round the Single increment
  differently. Tests bound propagated rounding error rather than claiming
  identical final-output bits. Switching/timing dispatcher remains incomplete.
- `physics.rs`: inverse vapor-volume lookup and pressure-corrected liquid volume;
  96 wrapper cases. GUI property defaults now preserve native pressure/temperature
  conversions, including 14.504 rather than the physical kg/cm² conversion.
- Original arithmetic exports in installer DLLs can be executed in Unicorn
  (`native_variant_runtime.py`). Dynamic OLEAUT arithmetic pointers are bound
  to original exports. Unknown system imports fail closed. DLL attach, Windows
  context, COM and original error handling are not replayed. The emulated
  floating-point environment has not been validated against a Windows run.
- Native numeric runtime validation exposed a Single-vs-Double rounding issue
  in the old integration port. `euler_single` now preserves intermediate Single
  operations for the actual byref-Single coordinator calls; all 1,400 reference
  EULER executions in the 100 integration fixtures now use original arithmetic
  helpers and match final state bits. OnError, FPU rounding and byref writes
  remain modeled; complete native coordinator constraints are still assembly-derived.

Current countable scopes and remaining items: `analysis/CONVERSION_PROGRESS.md`
and `analysis/conversion_progress.json`, regenerated by
`python3 scripts/update_conversion_progress.py`. Overall completion is not
estimated from raw procedure counts.

## Accumulator discharge (0x511b00)

`accumulator.rs` translates the numeric branch 0x511e9a–0x5120f9:
activation must equal 1, remaining water must be at least 1 ft³ and system
pressure must be below gas pressure. Flow is the coefficient times the square
root of pressure difference times the signed-I16 valve sum / 100. Water is
reduced by flow / 62.4 times step; gas pressure follows the native volume
ratio raised to 1.3. Single stores and lack of a depletion clamp are preserved.
Inactive calls retain prior flow; an activated but blocked call sets flow to zero.

200 cases execute original x86 numeric gates and arithmetic. COM reads are
replaced by supplied valve values and cleanup is skipped. Square root executes
x87 FSQRT; the external VB6 power operation is modeled with Python libm.
Outputs match within 2 float32 ULP. This is a component comparison, not a
Windows application run or independent validation of the power library.
Three Rust tests also check inactive/blocked branches and invalid domains.

The native caller at 0x51dfa1–0x51dfd8 binds system pressure 0x54b494,
trigger pressure 0x54b1b8, activation 0x54b4e6, gas pressure 0x54b540,
flow 0x54b804, water volume 0x54b570, step 0x54b414, gas volume 0x54b574,
total volume 0x54b708 and coefficient 0x54b1c0. The initial activation/opening
and event timestamp branch before 0x511e9a remains unported. This component
adds no new main derivative output: the remaining count stays 7/14.

Regenerate fixtures with `.tools/python/bin/python scripts/accumulator_oracle.py`.
Run an isolated step with `rusttran-cli accumulator-step INPUT.json`;
`rusttran/examples/accumulator-step.json` is a reproducible component example.

## Relief, steam-generator balances, controllers and activation

The final derivative-output scope is now **14/14**. This only covers the final
numeric equations and their native output bindings: upstream transfer, flows,
reactivity, initialization and event sequencing are still incomplete.

- `relief.rs`: original 0x510177–0x5103d3 inside 0x50f660. Two PORV areas and
  one safety-valve area, signed-I16 opening values and sum overflow behavior;
  native phase latch/reset, vapor vs mixture flow/enthalpy, <100 reduction.
  The caller 0x51e0c2 binds the output to derivative 0x54b6a8 (state 0x54bf98).
  300 comparison cases include latch boundaries, partial/signed openings and
  the reduction threshold. Property returns use independently executed prefixes.
- `critical_discharge_flux`: 0x49b3a0 selects native liquid table unless phase
  equals 2. All three 16-point arrays preserve initializer bits. 160 wrapper
  cases verify phase selection and original INTP interpolation/clamps. Labels
  and flux units derive from the caller; they are not retained native symbols.
- `saturated_balance.rs`: numerical body 0x501eba–0x502304 in 0x501e60.
  Vapor mass fraction, mass/energy balance and central differences of HFLD,
  HGAS, VFLD and VGAS. All Single stores preserved. 240 original-body cases
  check 13 intermediate quantities within 2 ULP and both derivatives within
  4 ULP. The DELP helper (0x49a3f0) uses strict >100/>10 thresholds;
  ten boundary cases verify its original Variant instructions with modeled
  helpers. No complete Windows floating-point environment is replayed.
- `steam_generator.rs`: final exchange 0x50ac2e–0x50ad65 in 0x508960.
  Mixes the incoming flows and their enthalpies using the native +0.1 divisor,
  applies containment-pressure floor with zero outflow, selects heat input
  by native SG selector index, scales **VSG volume** by loop share and invokes the
  saturated balance. Heat/volume binding was established from actual argument
  pushes, rather than decompiler labels. 160 original-block cases replay the
  numerical callee and compare all five outputs within 4 ULP.
  Actual push sequences at 0x520fa0 and 0x5210b1 establish six outputs:
  fraction derivatives 0x54b7d0/0x54b7d4, pressure derivatives 0x54b7d8/0x54b7dc
  and inventory derivatives 0x54b7e0/0x54b7e4. The initial prefix and valve/outflow producer are now ported (see below);
  auxiliary feedwater and the continuous body are now ported (see the latest
  SG section and STEAM_SYSTEM_CONNECTIONS.md).
- `controller.rs`: bounded PI numerical branch 0x5122d8–0x512372. Native
  Single error store, integral term and lower/upper limits. At the lower
  bound previous error resets to zero; the upper bound retains it. 300
  original x86 cases without arithmetic mocks agree within 2 ULP.
  Automatic dispatch and original UI/error reporting remain separate.
- Accumulator activation: original pressure<=trigger gate at flag==0,
  one-shot activation latch/time and opening command 100 only for zero,
  uninhibited valves. 240 original-instruction cases supply COM property
  values and capture UI commands; object cleanup is skipped. Existing
  active calls do not reopen later operator-closed valves. Comparisons check
  event time as binary32 bits and other state values exactly.

Regeneration scripts: `relief_oracle.py`, `saturated_balance_oracle.py`,
`steam_generator_oracle.py`, `controller_oracle.py`, `activation_oracle.py`.
The component JSON examples are included in Linux bundles and can be exercised
with the matching CLI commands; they are not whole-plant scenarios.

- Seven-point injection curves: native wrapper 0x5124e0 with original INTP
  prefixes, 140 cases across all five BasicData configurations and both curve
  families. `InjectionCurve::from_model` connects authenticated PH/WH or PL/WL
  conversions to the evaluator. Curve values/clamps match native bits exactly.
- Supply tank: original 0x511605–0x51170b numeric branch of 0x510850.
  Depletion includes injection and two other flow terms, with density 62.4.
  No synthetic zero clamp; recirculation request is strictly below TKMIN.
  The level command is volume/TANK0*0.8; both thresholds can come from the
  authenticated model seed. 200 original-instruction cases compare depletion,
  threshold branch and level command within 2 ULP. COM writes are captured,
  not executed against the original UI. Full source-mode dispatcher is pending.

`analysis/component-comparison/results.html` adds a color report generated by
`scripts/compare_components.py`: 22345 separate component cases, including
accumulator, relief, saturated balance, steam-generator exchange, PI, activation
and supply tank. The report invokes the Rust CLI against recovered reference
fixtures. Structural result fields, integer/Boolean state, binary32 event time
and numeric outputs are checked; detailed method limits and reference/binary
hashes are saved in JSON. This is not an end-to-end Windows comparison.

## Further upstream dependencies and initialization

- `SteamOutflowInputs::limit`: original SG block 0x50a7ed–0x50a8a6 adds base,
  additional and external flow, caps total discharge at inventory/step and
  corrects the selected heat input. Native base-flow and additional-flow writes
  are preserved separately; they are not a normalization of contributions.
  The feed-enthalpy assignment occurs even if the cap is not reached. 240
  original x86 cases compare all six outputs within 2 ULP. The intervening
  steam-generator valve/control feedback remains incomplete.
- `PressurizerInitInputs`: fresh-start numeric branch 0x51b4fb–0x51b6cf,
  including the temperature-derived level, native 0.27/upper-level clamps,
  complementary volume fraction, vapor mass fraction and total mass.
  240 original-instruction cases match five outputs within 2 ULP. The helper
  can obtain model parameters and specific volumes from authenticated model
  globals, with coolant temperature supplied explicitly. This fresh-start
  formula is not automatically applied to restored IC snapshots.
- `StartupHeatInputs`: original 0x51b4ab–0x51b4fb converts nominal plus added
  heat into separate loop heat inputs using caller-supplied shares. 200 native
  x86 cases compare both outputs within 2 ULP. Loop shares are not normalized.
- Native constant initializer 0x51c310–0x51c42d is now executed independently,
  establishing HEAT_FACTOR=948.0555419921875 (binary32 0x446d038e) from the
  original 3413000/3600 instructions. Pressure, temperature and pressure-work
  constants are also cross-checked against those original stores. No arithmetic
  helper mocks are required for this initializer prefix.
- `IntegrationState::from_condition`: 11 direct IC state assignments plus
  native X -> 0x54b688 copy at 0x51c0f8/0x51c12e. All 22 recovered IC snapshots
  compare state bits with independently checked loader values and the executed
  native alias instructions. States 0x54bba0/0x54bf98 and all previous
  derivatives are explicit caller inputs. They are not inferred to be zero.
  This restores integrator inputs only; full plant initialization is pending.

`scripts/compare_components.py` now covers 22345 cases and 464346 output checks.
Scripts added: `steam_outflow_oracle.py`, `pressurizer_init_oracle.py`,
`startup_heat_oracle.py`, `integration_seed_oracle.py`. Their method boundaries
and original binary hashes are preserved with the fixtures.


## Loop transfer and primary properties

- Numerical loop-transfer body `0x5053b8–0x505873`: 300 reference cases, four outputs and four trace values (4 ULP outputs, 2 ULP trace).
- Both original 29-argument call bindings recovered; loop-B count rounding checked against the original VB6 helper.
- Fifteen reference globals: all 110 model/IC combinations checked against original initialization slices.
- Primary pressure-property prefix `0x51d9ca–0x51dd2c`: nine globals checked in 240 cases (2 ULP).
- Shared globals support atomic component updates. Two live inputs remain absent after reference initialization: clock `0x54b40c` and modifier `0x54ba68`; the connected normal stage below now computes the latter.
- Full initializer, event dispatcher, device control, protection responses and complete GUI trajectories remain incomplete. Original Windows floating-point context is unverified; loop references explicitly select x87 53-bit precision.


## Connected normal thermal-driving stage

- Original `0x51b0fe–0x51b132` supplies the thermal coefficient `0x54b6fc` from model power, original heat factor and model temperature difference.
- Normal numerical slices `0x51f476–0x51f4f2`, `0x51f654–0x51f6c3`, `0x51f6c3–0x51f6fb` produce six globals, including the previously unresolved live input `0x54ba68`. 320 original cases pass.
- `NativeGlobals::advance_normal_loops` connects thermal driving and A/B loop transfer transactionally. 330 original-slice comparisons pass across every model/IC pair and three clocks. A failed B-loop calculation preserves all original globals.
- Clock and failure times remain explicit inputs. Normal mode must be selected explicitly: external-model mode, mode-selection flags and event transitions are not yet connected. The coefficient is initialized from model reference temperatures, while live temperatures come from the IC.
- Current comparison total: 22345 cases, 464346 output checks. These counts include component and composed-slice comparisons, not complete simulations.


## Alternate thermal mode and connected preparation stages

- `0x52cbc0` numeric body: alternate decay heat, 11 groups and late-time corrections; 300 original DLL Exp/Sqr comparisons. Binary64 acceptance is max(1, abs(reference)) * 2e-13.
- Thermal branch selection/body `0x51f4f2–0x51f6fb`: 400 checks across flags, threshold retention and external temperatures. External model states remain explicit.
- SG bounded PI/heat partition `0x5090ba–0x509213`: 350 comparisons; additional 180 original gain/capacity plus authenticated A/B pointer tests exercise shared-state execution.
- Primary exchange `0x50b10f–0x50b3ff`: 300 comparisons covering five globals and six locals. The following thermal and phase preparations now compute these dependencies within the connected primary core; heater/UI dispatch remains incomplete.
- Coupled pump normalization/updates: 320 comparisons, including >=1 void cap and the native A/B time-constant asymmetry. Full switching/event dispatcher is incomplete.
- Primary liquid property preparation: 200 comparisons for PSAT/VLIQ and Single-rounded HLIQ.
- Recovered stages now compose on one shared store and commit atomically. Entire-batch rollback and native pointer output commits are checked. Stage order and missing upstream operands are caller-supplied.
- Report totals: 22345 cases, 464346 output checks. End-to-end Windows runs and complete reactor trajectories remain unvalidated.


Primary inventory/coefficient slices `0x50b46b–0x50b4e8` and `0x50b50c–0x50b5ae` now have 300 comparisons, including command endpoints and zero step. They produce `local_ac`, `local_24`, `local_30`, `local_3c`, `local_48` and the updated mass `0x54bb38`. The command is an explicit signed I16 GUI input, and `local_84` comes from the recovered primary exchange trace. Shared-state commit and failure atomicity are checked. The connected core below now supplies phase-state/flow/phase locals for the supported zero/one flags; heater/UI source preparation remains incomplete.


No-phase-change branch `0x50bdd9–0x50c587`: 300 comparisons covering positive/zero/negative transfer flow. This produces the remaining pressure-balance locals `local_98`, `local_88` and `local_a4` in the zero/zero phase-flag branch, plus mixture enthalpy and transfer energy. It updates three native globals and is connected to the recovered-stage store. This narrow API rejects nonzero flags; the wider primary-phase API below supports all four zero/one combinations and computes the flow locals through the preceding stages. Current totals: 22345 cases, 464346 checks.


## Connected primary numerical core

- Four phase-flag branches `0x50bdd9–0x50c587`: 640 original cases, strict/inclusive level thresholds preserved. Both flags restricted to native 0/1 paths.
- Phase-state preparation `0x50b60f–0x50bae2` with exits at `0x50bde7`: 640 cases, fraction reconstruction, pressure floor, saturation entry and flag changes. Early exits skip flow preparation.
- Flow/latch preparation `0x50bae2–0x50bdd9`: 400 cases, original DLL Sqr and native critical-flux selector/table prefixes.
- Thermal prefix `0x50afe4–0x50b0fb`: 240 cases, original installer DLL Variant subtraction/division/conversion; original HLIQ numeric-prefix returns retain R4/R8 types. Capacity is (HLIQ(P,T+2)-HLIQ(P,T-2))/4 with native Single temperature stores.
- Final correction `0x50cbac–0x50cc88`: 240 cases, input heat source explicit.
- `primary-core`: 160 references run all connected slices in one original machine/frame, 29 Single outputs and three flags each. 71 early phase exits and 89 normal flow-preparation entries are covered. Five final derivatives are now connected through these recovered computations. Upstream cached properties, pump contributions, GUI command and heater heat are supplied; the heater/UI region is omitted.
- Core error rollback is checked by removing the late-required heat source from an otherwise valid input snapshot. No partial mutation is committed.
- Original frame initializer explicitly zeros skipped flow locals; no guessed BSS state is used. The original `0x54b70c` initializer is now authenticated as Single bits 0xb50637bd (-5e-7).
- Total report: 22345 cases, 464346 output checks. Full plant coordination, complete initialization, heater/control dispatch and actual GUI trajectories remain incomplete; Windows floating-point context is unverified.

## Heater numeric control and primary coupling

`0x500bd0` automatic/manual control, proportional interpolation, backup thresholds and low-level shutdown are ported with 800 original numerical-path comparisons. An optional heater-control input now computes `0x54b6dc` from the live phase level inside the primary core. 160 composed original-slice comparisons cover the coupled correction and derivatives. Upstream spray/control signal remains explicit, and initialization/full GUI trajectories remain incomplete. See [HEATER_PORT.md](HEATER_PORT.md).

## Spray control and coordinator signal

Spray selector, pump interlocks, automatic/manual command and native flow arithmetic are ported: 640 original-slice cases. The shared pressure-control signal expression is checked in 300 cases. Spray and heaters run in original order inside the primary core, checked against 160 composed original-slice references. Prior spray flow is read before its refresh and remains a required history state. The late-failure transaction test preserves both controls and all numerical state. UI/fault dispatch and full initialization remain incomplete. See [SPRAY_PORT.md](SPRAY_PORT.md).

## Fresh pressure-control initialization and feedback

Fresh `0x54ba4c` is copied from model pressure, not zero; this corrects the previous source note. Initial level interlock and post-balance exchange/level/temperature feedback are now available as explicit recovered stages. 300 initializer and 320 feedback original-slice cases pass exact binary32 checks. Complete coordinator ordering and IC/history restoration remain outstanding. See [PRESSURE_CONTROL_INITIALIZATION.md](PRESSURE_CONTROL_INITIALIZATION.md).

## Connected fresh primary startup and GUI initialization

New-start state/flags (240) and connected primary inventory (240) are checked against native instructions. The shared GUI/CLI startup backend is checked across all 110 model/operating-point pairs. The desktop now calculates and displays the fresh primary state; a Linux GUI screenshot smoke test passed. Pressure signal, primary controls/balance and feedback are also connected and checked in 160 composed native-slice cases. Full plant initialization, transient GUI controls and whole-application trace validation remain outstanding. See [FRESH_PRIMARY_AND_CONTROL_CYCLE.md](FRESH_PRIMARY_AND_CONTROL_CYCLE.md) and [END_TO_END_VALIDATION.md](END_TO_END_VALIDATION.md).

## Thermal startup and integration store

Fresh SG phase/level and feedwater setup are ported (320 + 300 cases) and connected to the GUI startup backend (110 model/operating-point combinations, 66 checks each). The shared native integrator/event adapter executes all 14 states and is checked against 36 original coordinator slices. Stream derivative bindings are connected, preserving atomic batches when late history is missing. Current derivative resets are source-proven; prior histories remain explicit. Corrected GUI SG inventory labels and added separate actual flow rows. See [THERMAL_STARTUP_AND_NATIVE_INTEGRATION.md](THERMAL_STARTUP_AND_NATIVE_INTEGRATION.md).

## Connected source/relief/SG/primary/integration updates

Bound original source/flux preparation, relief discharge and post-discharge decisions to the primary control and 14-state integration store. Both SG exchanges can compute their derivatives inside the connected update; remaining upstream producers stay explicit. Coverage includes 32 + 32 isolated updates and 8 + 4 three-update native-slice history chains, with late-failure rollback. Mapped PE bytes separately authenticate 18 process-birth storage fields; this does not establish application startup/Reset/restore behavior. Original fresh/restored dispatcher, complete automation and GUI transients remain unfinished. See [RECOVERED_STEP_CONNECTIONS.md](RECOVERED_STEP_CONNECTIONS.md).


## Primary device automation and extended fresh startup

`primary_devices.rs` recovers the decisions and numerical producers in
`0x50da40`: letdown, charging PI, high-pressure injection, latch/time transitions
and stateful manual/automatic properties (960 cases). `primary_references.rs`
recovers coordinator temperature/level references (320). Both are optional
producers before relief in the recovered timestep, checked in 32 additional
composed reference/device/SG/primary/integration updates. New source flows need
not exist in input globals. GUI callbacks/event dispatch remain unported.

Fresh initialization now reaches `0x51ba28` before external-model init: 25
additional cached-state stores (320 cases), and the earlier 79 Singles/11 flags in the shared
GUI/CLI backend for all 110 model/operating-point pairs. History and full
restore/Reset remain separate. Four new Rust tests also verify rollback and
history preservation; 141 pass overall. Current report: 22345 cases and 464346
checks. See `PRIMARY_DEVICE_CONNECTIONS.md` for exact branches and limitations.


## RCP switching producer and progress accounting

The native RCP switch/timestamp/target/flow sequence is connected via optional
`rcp` in the recovered timestep: 768 original-body cases plus 32 composed
reference/device/RCP/SG/primary/integration updates. The B-restart matrix index
and A-before-B order are preserved. Scheduler, COM callbacks/log formatting
and whole Windows trajectories remain unvalidated. `RCP_CONTROL_CONNECTIONS.md`
records bindings and scope. Current tests: 153 Rust; 22345 reference cases and
464346 checks.

`CONVERSION_PROGRESS.md` now uses seven stable acceptance milestones from
`CONVERSION_MILESTONES.json`, with explicit remaining work and a change journal.
Earlier detailed notes are retained in `CONVERSION_HISTORY.md`. Component
coverage and procedure inventory are not used as an overall completion percent.


## Initial steam-generator control connected

`steam_control.rs` ports 0x5089f0–0x509213: timed feedwater transition, level
controller/clamp, pressure PI, fault branch and normal heat partition. 960 native
prefix cases and 32 additional composed updates cover both sides. The original
caller passes SG selectors A=0/B=1 (the legacy API calls this `phase_flag`), a
shared event-array failure time and shared timestamp/checkbox. Fresh HGAS values
now feed the stream balance without supplied input values. Four tests cover
outputs, late failure rollback and controlled-pair validation. Current total:
153 Rust tests; 22345 reference cases and 464346 checks.

Valve/outflow and auxiliary automation are now optional producers (see below).
The complete recovered SG numerical/control body has continuous native
references; it is still not a full original application trajectory. AUTO and STEP remain
partial. See [STEAM_CONTROL_CONNECTIONS.md](STEAM_CONTROL_CONNECTIONS.md).


## SG device/valve decisions and outflow producer

`steam_valves.rs` now connects 0x509213–0x50a8a6: timed/low-pressure closure,
manual inhibition, two safety banks with 30-psia hysteresis, fault-dependent
flow, A/B crossflow sign, inventory cap and heat correction. 1200 standalone
native cases and 32 composed updates pass. Four Rust tests include B-side and
final-integrator rollback. Current total: 22345 cases / 464346 checks / 153 tests.
Auxiliary feedwater is now recovered; the earlier skip-path pointer inference
was incorrect, as recorded in STEAM_SYSTEM_CONNECTIONS.md. See
[STEAM_VALVE_CONNECTIONS.md](STEAM_VALVE_CONNECTIONS.md).


## Remaining SG gap closed and continuous native body checked

`steam_auxiliary.rs` implements 0x50a8a6–0x50ac31 (640 cases). `steam_system.rs`
connects initial controls, valves/outflow, auxiliary and saturated exchange;
320 references execute the entire native 0x5089f0–0x50ad65 body continuously.
32 additional composed plant updates connect this to primary/integration. Five
Rust tests check activation, skipped writes, total outflow on both branches and
late error rollback. The earlier base-flow pointer inference was incorrect:
0x50a7ff already changes ESI to total outflow. Both branches retain that source.
Full original COM callbacks/error/logging, initialization, other plant producers
and actual GUI/event trajectories remain outside this port. See
[STEAM_SYSTEM_CONNECTIONS.md](STEAM_SYSTEM_CONNECTIONS.md).


## Late thermal initialization and fresh control histories

Late numeric initializer slices now produce 28 Singles and three I16 resets,
including level/flow references, auxiliary feedwater enthalpy, liquid properties
and the integrator alias. 320 standalone native references pass. The shared
GUI/CLI fresh thermal backend is expanded to 105 Singles and 14 flags for all
110 source model/IC combinations. A separate fresh-control-history stage adds
11 source-proven stores with the explicit malfunction +0x10 flag (320 cases).
Five new Rust tests check outputs, failure atomicity and unrelated-history
preservation. External Double-model initialization, restored dispatch, arrays,
event rebasing and full Reset/restore remain incomplete. See
[LATE_THERMAL_INITIALIZATION.md](LATE_THERMAL_INITIALIZATION.md).


## Restored control state and native event inputs

`restored_controls.rs` implements the continuous restored control/event branch
0x51bb14–0x51bbed (400 original cases), preserving saved boron and SG/integrator
histories. Optional recovered-step event arrays bind RCP/SG failure times and
SG flags using original offsets; 32 additional composed restoration/binding/
RCP/SG/primary/integration references pass. Four Rust tests check outputs and
late rollback. Complete snapshot loading, external initialization, protection/
ramp/delay dispatch, GUI resume and Windows trajectories remain incomplete.
See [RESTORED_CONTROLS_AND_EVENTS.md](RESTORED_CONTROLS_AND_EVENTS.md).

## Normal thermal transfer connected to recovered updates

The optional mode-0 thermal producer now connects driving, both native caller
bindings and A/B transfer outputs to both SGs, primary balance and integration.
Event 7 selects the thermal flag, event 8 supplies the shared failure time; the
original A-to-B reference copy and B count conversion are preserved. Eight loop
outputs and seven driving globals come from current calculations. Nonzero model
modes still need external dispatch and are rejected by this connection.
The GUI/CLI fresh initializer also includes the original early driving coefficient
and factor, giving 107 Singles/14 flags for all 110 model/IC pairs.
Evidence and limits: [CONNECTED_THERMAL_TRANSFER.md](CONNECTED_THERMAL_TRANSFER.md).

## Accumulator activation and current source flow — 2026-10-21

Original accumulator caller pointers now connect activation, timestamp, valve
properties, flow, gas pressure and water/gas inventories as one atomic update.
640 continuous native-body cases (original DLL power) and 64 composed steps
verify current flow reaching source sum, both loops/SGs, balance and integration.
The latch preserves manual closure after activation and the inactive branch's
retained flow. Five additional Rust tests include late rollback. The full supply
dispatcher, remaining events and GUI trajectories remain incomplete.
See [ACCUMULATOR_SYSTEM_CONNECTIONS.md](ACCUMULATOR_SYSTEM_CONNECTIONS.md).

## Supply/recirculation and stateful runs — 2026-10-21

Ported all recovered 0x510901–0x511907 control/numeric branches, with the original
14 caller pointers, pressure activation, injection curve, cooling/recirculation,
source enthalpy and tank depletion/mode transition. 960 continuous references and
96 composed updates cover the connection before accumulator/source/SG/balance.
Remaining late containment/source routines 0x502480 and 0x5034b0 are separate.

The recovered session retains actual actuator commands across updates, including
heaters/spray captured in the primary numerical block's original phase. Twelve
eight-update original-slice chains, save/resume/chunk equivalence and complete
batch rollback are verified. Initial/unrecovered state remains explicit.
A reporter exports actual engine samples to CSV/JSON and offline selectable plots;
CSV clock/pressure values were checked against results and the chart rendered in
headless Firefox. This does not connect the default GUI preview or validate long
whole-plant PCTran scenarios. See SUPPLY_SYSTEM_CONNECTIONS.md and
RECOVERED_SESSION_CONNECTIONS.md.


## Current connection: real simulation workspace (2026-10-21)

The Simulation view now advances the recovered stateful numerical pipeline,
including optional late hot/cold loop feedback. Start/Pause/Step/Reset, device
controls, 16 history series, resumable JSON, and retained CSV are connected to
that engine. The embedded sample is explicitly synthetic and is not full IC
initialization. Actual X11 clicks verified manual heater control against CLI
state, as well as run/pause/reset/sample loading. Stored IC views retain their
separate snapshot/preview behavior.

Startup constants/geometry increase fresh initialization to 130 Singles and 15
flags across all 110 pairs. Current validation: 163 Rust tests, 23,322 component
or composed cases, 524,437 output checks. Earlier sections are chronological
scope records. Full initial/restored scenario setup, remaining sources/external
model and protection/event dispatch still prevent full replacement. Windows
whole-application trajectories remain unvalidated. See
[SIMULATION_WORKSPACE_CONNECTIONS.md](SIMULATION_WORKSPACE_CONNECTIONS.md).


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

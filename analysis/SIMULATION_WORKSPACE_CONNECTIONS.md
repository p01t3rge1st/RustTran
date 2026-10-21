# Real recovered-engine workspace, startup primitives and loop feedback

Validated 2026-10-21. This closes the recovered-engine GUI connection. It does
not establish complete PCTran startup, plant coordination, or scenario agreement.

## Source-backed initialization

`startup_primitives.rs` reproduces 20 Single scalar constants and one I16 reset
from `0x51c310–0x51c42d`. Double PI and subsequent property arrays are deliberately
outside this Single store. Original slices `0x51b174–0x51b196` and
`0x51b19c–0x51b1d9` supply the sampling ratio, total accumulator volume, and two
zero stores. The intervening VB time conversion to I16 `0x54b700` is not guessed.
Zero denominator, missing inputs and Single overflow fail before committing.

`scripts/startup_primitives_oracle.py` independently executes the original
instructions: one fixed-constant case and 320 geometry cases. These are composed
into the shared fresh thermal initializer and independently checked for all 110
model/IC pairs by `fresh_thermal_startup_oracle.py`. The backend now produces
130 Singles and 15 I16 flags. That is not a complete runnable session initializer.

## Connected late primary feedback

`loop_transport.rs` implements the continuous arithmetic body
`0x50d1f8–0x50d867`: bulk fraction `0x54ba34`, hot/cold branch temperatures
`0x54b694/698/69c/6a0` and four filtered histories `0x54bab4/bab8/babc/bac0`.
The implementation preserves Single stores, cold outlet floors, A-before-B
reverse-flow copying, full-delta reverse-flow hot correction, core-temperature
ceiling, minimum five-second time constants and initial-clock history seeding.

The stage runs after primary balance/control and before stream/integration.
Its fraction and temperatures are consumed in subsequent recovered updates.
Older sessions retain their previous behavior: `controls.loop_transport` defaults
to false and is omitted on serialization when false. The GUI sample enables it.
The stage rejects zero pump flow, zero volume, nonpositive step and missing
restored histories; this is an explicit error boundary, not original UI behavior.

`scripts/loop_transport_oracle.py` checks 640 continuous x86 executions using
53-bit x87 precision and a modeled Single-round bridge. The session oracle
checks 16 eight-update chains using original recovered slices, including reversed
flows and filter histories. These are supplied synthetic states, not complete
original Windows runs. Windows floating-point context remains unverified.

## Real desktop execution

`simulation_workspace.rs` owns the stateful recovered session, frame budget and
rolling history. Loading performs a dry-run on a clone without advancing the
loaded state. Start/Pause/Step/Reset act on computed state; errors pause execution
and preserve the prior state. Each frame executes at most 32 numerical updates;
pending time is retained, and the display clock comes from computed output.
Reset restores the loaded state and commands, then clears history.

`gui_engine.rs` connects this workspace to the Simulation view. The view exposes
RCP, supply/injection/recirculation, accumulator, heater/spray and SG controls,
known imported event inputs, actual readings, 16 selectable history series,
resumable JSON and CSV. GUI history retains the last 50,000 samples; the interface
and export action explicitly describe that scope. The separate CLI report can
export every requested sample. Existing IC/schematic views remain snapshots with
their separate preview clock; they do not acquire live values implicitly.

**Simulation → Load sample session → Start** works without external files.
The embedded `examples/gui-simulation-session.json` is a synthetic native-reference
state, clearly described as such. CLI launch accepts `--session PATH` and optional
`--session-steps COUNT`. It is not an original PCTran save file or full reactor IC.

## Verification evidence

- 163 Rust tests pass: `simulation-workspace-rust-tests.log`.
- Clippy GUI/screenshot, all targets, `-D warnings`: `simulation-workspace-clippy.log`.
- Component report: 23,322/23,322 cases, 524,437/524,437 output checks in
  [the colored report](component-comparison/results.html). New comparisons
  include 321 startup, 640 feedback and 16 session-chain cases. Existing fresh
  initialization cases now check the additional outputs.
- `scripts/test_simulation_gui.py` opens the actual application in private Xvfb,
  uses XTest mouse/key events, and checks instrumentation compiled only with
  `gui-screenshot`. It verifies Step, Start, frozen state after Pause, Reset,
  embedded sample loading and a 25% manual heater command. The complete session
  after that manual step equals CLI output for the same state/command.
- Machine-readable GUI results: [gui-interaction/results.json](gui-interaction/results.json).
  [Actual heater screenshot](gui-interaction/manual-heater-computed.png).
  [Embedded sample screenshot](gui-interaction/sample-loaded.png).
- Linux/Windows build logs and release smoke are recorded beside this document.
  Windows binaries are cross-compiled, not tested on Windows.

## Remaining acceptance boundaries

Full fresh/restored dispatcher and original file loading, five unresolved IC
fields, external Double model/property arrays, remaining containment/source
producers (`0x502480`, `0x5034b0`), complete event/protection/ramp/delay scheduling,
live binding of the original schematic, and 0–300-second comparisons against
the original Windows application remain open. None of these are replaced by
synthetic sample inputs. Stable acceptance milestones remain INIT, AUTO, STEP,
EVENTS, GUI, HISTORY and E2E; no overall completion percentage is inferred from
case counts. `Kiedy_skonczysz` is therefore not opened.

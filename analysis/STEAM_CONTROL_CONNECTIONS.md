# Initial SG control and shared-state connection

Port: `rusttran/src/steam_control.rs`. Original control prefix
`0x5089f0–0x509213` in procedure `0x508960`. CLI `steam-control-step`, recovered
stage `steam_control`, optional recovered-step producer `steam_controls`.
Examples: `steam-control-step examples/steam-control-step.json` and
`recovered-primary-step examples/recovered-steam-control-step.json`.

## Original decisions and state

The prefix computes gain/capacity from model constants, calculates HGAS at
current SG pressure, and runs these original branches:

- Feedwater timed transition, level error/controller, percentage command and
  clamp. Frame locals maximum/error start at zero; the clamp/history store runs
  on every path, including paths that leave those locals unchanged.
- The timed branch requires clock > transition time and clock <= transition
  time + 60. The following branch requires clock < transition time + 60;
  otherwise it stores native Single 99999. Preserve these exact comparisons.
- Pressure-control mode invokes the previously checked bounded PI with native
  fault-dependent integral time and lower bound, then partitions heat.
- Outside pressure-control mode, an active fault selects the shared checkbox
  and gates the pressure-control flow with the original STEP call. Normal mode
  partitions heat and applies the model's signal threshold/range.

Original frame initialization at `0x508997`/`0x5089a3` proves the zero locals.
Native Single stores, strict clamp comparisons, checked I16 subtraction and
model Double constants are retained. Missing state, zero denominators and
nonfinite results fail before state commits; no state defaults are guessed.

| Output A / B | Produced value |
|---|---|
| `0x54b528` / `0x54b52c` | feedwater flow |
| `0x54bbb0` (shared) | transition timestamp |
| `0x54ba90` / `0x54ba94` | current SG vapor enthalpy, HGAS |
| `0x54ba98` / `0x54baa0` | pressure-control error history |
| `0x54baa4` / `0x54baa8` | level-control error history |
| `0x54ba9c` / `0x54baac` | pressure-control flow |
| `0x54b51c` / `0x54b520` | heat partition |

Original caller argument arrays are retained in `native_globals.rs`. The caller
passes Double zero at `0x520eb1–0x520ec7` for A and Double one at
`0x520fbd–0x520fc5` for B, converted through `__vbaFpI2`. Consequently the legacy
`phase_flag`/`steam_phase_flags` fields in these SG APIs mean **SG selector
A=0/B=1**, not mixture phase. Existing API spelling remains compatible.

Both caller sites (`0x520f83`, `0x521094`) pass the same event-array byte offset
`0x20` as failure time. `SteamControlPair` therefore accepts one `failure_time`.
Feedwater command is original collection `0x5ac`, side index, property
`0x68030009` (raw I16 percentage). Fault checkbox is original getter `0x548`,
property `0x68030005`. No invented control is substituted.

## Connected update

With `steam_controls` present, computed exchanges require native selectors
`steam_phase_flags: [0,1]`. The sequence is A control prefix → A final exchange →
B control prefix → B final exchange, then existing primary/balance/stream/
integration stages. The shared transition timestamp and checkbox propagate
from A to B; returned checkbox state is explicit for the next update.
HGAS fields need not exist in the input: they are freshly produced and consumed
by the stream balance. A failure in B or final integration commits none of the
new device, control or numerical state.

**This composition skips the still-unported middle SG automation
`0x509213–0x50ac2e`.** Its other cached device/valve/flow operands remain explicit
inputs. It is a composition of authenticated native slices, not execution of
the full original SG procedure, a complete original timestep or a validated
application trajectory. Full initialization, scheduling, GUI transients and
Windows application floating-point context remain unfinished.

## Reproducible evidence

- `scripts/steam_control_oracle.py`: 960 cases continuously execute original
  x86 `0x5089f0–0x509213` with explicit x87 53-bit precision. Native HGAS and PI
  instruction prefixes are called independently; PowerR8 executes the original
  installer DLL. Only explicit COM property state and known VB/runtime bridges
  replace UI/runtime interactions. Unknown targets fail. Setter callbacks,
  original GUI dispatch and native error handling are outside this reference.
- Cases cover both sides, clock comparisons through 300 seconds, zero/positive
  steps, 0/50/100 commands, count and mode flags, pressure PI, normal and fault
  paths. Native source hash is recorded in the fixtures.
- `scripts/recovered_steam_control_step_oracle.py`: 32 additional composed
  reference/device/RCP/SG/primary/integration cases, with both HGAS input fields
  removed. It carries shared timestamp/checkbox in original A-before-B order.
- Four Rust tests check native output/trace agreement, late denominator failure,
  rollback at B/final integration and unsupported controlled-pair rejection.
- Aggregate report: 17149 reference cases, 203872 output checks; 120 Rust tests.
  These counts describe components and composed slices, not whole scenarios.

This closes the initial SG-control prefix subproblem under AUTO/STEP. Both
milestones remain partial; the middle automation remains in their existing
scope rather than introducing a new milestone.


Subsequent update: optional device/valve/outflow producer 0x509213–0x50a8a6
is now ported and connected. The remaining SG gap is auxiliary feedwater
0x50a8a6–0x50ac31 and its final-exchange skip-path semantics. The counts above
record this prefix's validation snapshot; see [STEAM_VALVE_CONNECTIONS.md](STEAM_VALVE_CONNECTIONS.md)
and [latest-validation.json](latest-validation.json) for current totals.


Later update: auxiliary feedwater and the continuous SG body are now ported.
The earlier base-flow pointer inference was incorrect: 0x50a7ff already changes
ESI to total outflow, so both paths use total flow. This is verified by continuous
native execution; see [STEAM_SYSTEM_CONNECTIONS.md](STEAM_SYSTEM_CONNECTIONS.md)
for current implementation, evidence and remaining whole-plant scope.

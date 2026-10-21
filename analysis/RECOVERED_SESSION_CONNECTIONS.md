# Stateful recovered execution and recorded history — 2026-10-21

`RecoveredSession` owns the numerical store and current controls. Unlike the
existing explicit-update list, it carries original calculated command states into
the next update: charging/letdown/injection, RCP percentages, supply mode/pumps,
accumulator valves, SG checkbox/valves/feedwater, heaters and spray. Heater/spray
commands are captured at their actual phase in the primary block, before correction
and integration. They are not recomputed afterwards from changed state.

Optional `capture_control_commands` exposes primary command state for the existing
single-step API without changing previous JSON responses. The session API enables
it automatically. `RecoveredSession::advance` stages both state and controls and
commits only if every requested update succeeds. Clocks use the existing explicit
Single-clock convention; controls hold the next evaluation time and globals hold
the last evaluation clock. A nonrepresentable next clock is an error. No 300-second
time cap is imposed.

Serialization preserves the RustTran session for continuation. This is not a
PCTran save-file decoder, full fresh initialization, original COM callbacks,
whole-plant scheduler or a completed GUI transient engine. Missing/unrecovered
source inputs remain explicit; their values are retained, not synthesized.

`recovered-session-run examples/recovered-session-run.json` returns all numerical
updates and a resumable `solution.session`. To continue a saved result, pass its
session and another positive `steps` count to this command. Controls may be changed
between batches; they are not overwritten by a stale initial-command list.

Twelve native-slice chains of eight updates independently execute each component,
retain native control writes and feed those commands into the next call. The
synthetic component states use 0.0001-second steps to stay within the supported
numeric ranges; clocks remain 0–300 s. These short chains do not establish long
reactor-trajectory stability or original application equivalence. All nested state,
commands and outputs use the established four-ULP tolerance, flags/commands exact.
Four Rust tests verify these references, 3+5 versus 8-step execution, exact JSON
save/resume, actuator retention and whole-session rollback after a later update
fails at the Single-clock precision boundary.

## Actual recorded history

`scripts/run_session_report.py` runs the released engine and produces:

- `run.json`: actual returned updates plus the resumable session;
- `history.csv`: all recorded samples for pressure, temperature, levels and flows;
- `history.html`: offline variable selection, plots and sample tooltips.

Example:

```
python3 scripts/run_session_report.py \
  --state rusttran/examples/recovered-session-run.json \
  --steps 8 --output analysis/session-history
```

The exporter reconstructs scalar history from actual update outputs. CSV retains
all samples. Plot markers are thinned for large histories; values are not changed.
The report labels raw native units and evaluation clocks, and states the recovered
pipeline scope. It does not present a synthetic whole-plant PCTran comparison.

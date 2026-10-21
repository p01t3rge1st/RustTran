# Restored controls, twenty-event rebasing and coordinator bindings

Port: `rusttran/src/restored_controls.rs`. Original restored-control branch
`0x51bb14–0x51bbed` in initializer `0x51afe0`, with EDI=0 from its prologue.
CLI `restored-control-state examples/restored-control-state.json`; construction
stage `restored_controls`, example `examples/restored-control-stages.json`.

This accepts already decoded scalar state and explicit event arrays. It does
not load an original saved file, initialize the external Double model, execute
all restored-state branches or provide a working GUI Resume/Reset command.

## Original state and event behavior

- Copy saved clock `0x54b418` to `0x54b40c`, saved power `0x54b424` to both
  `0x54b818/0x54b81c`, and cached references `0x54b554/0x54b524` to
  `0x54b820/0x54bbc8`.
- If I16 `0x54b080 == 0`, iterate exactly twenty events. For each nonzero I16
  flag, store Single(saved clock − delay − 1) in its event time. Zero flags
  preserve their old times. Nonzero modes −1, 1 and 2 skip the entire rebase.
  Negative delays and negative resulting times retain the original arithmetic;
  no new physical clamp is added.
- Copy `0x54b548` to `0x54bfe8`, clear `0x54bfcc/0x54bfbc`, and set the SG
  transition timestamp `0x54bbb0` to native Single 99999.
- Exactly malfunction-array entry +0x10 == −1 copies SG outflows into pressure
  control outputs `0x54ba9c/0x54baac`. Other flags take the zero branch.
- Copy rod position `0x54b48c` to `0x54b490`.

There are twelve Single outputs. Unlike the fresh branch, this path does not
copy initial PPM0 over saved PPM, zero SG level-error histories, or reset the
fresh-only cached field `0x54b6f8`. Integrator derivative histories are also
preserved. Missing state, nonfinite arrays or a late Single overflow commit
neither scalar restoration nor event-array changes.

## Bound inputs of the recovered step

Optional `RecoveredStepControls.event_schedule` supplies the authenticated
native event arrays to the existing optional producers:

| Original input | Consumer |
|---|---|
| time array +0x18, index 6 | RCP trip time copied to `0x54ba30` |
| time array +0x20, index 8 | shared SG failure time for A and B |
| malfunction I16 array +0x10, index 8 | SG initial-control fault flag |
| malfunction I16 array +4/+6, indices 2/3 | SG valve fault-flow branches |

The RCP caller `0x51deea–0x51df52` performs the +0x18 copy. Original A/B SG push
sequences `0x520ec2–0x520fa0` and `0x520fc5–0x5210b1` pass the same +0x20 time
pointer. Fault offsets are established by the original SG control and valve
loads. No mapping is inferred for the still-unrecovered shutdown-time producer,
other primary fault inputs or protection/event dispatch.

Bindings override the corresponding duplicated inputs only when a schedule is
present. Other command values remain explicit and existing requests without a
schedule retain their behavior. Bound controls are a local copy; input requests
are not mutated. The returned `event_bindings` records the consumed values.
Invalid schedules fail before any step changes; late integration failure rolls
back all resulting RCP/SG/device changes.

Example: `recovered-primary-step examples/recovered-restored-events-step.json`.
The example's scalar state is already restored and its schedule already rebased;
this command performs one recovered numerical update, not full application
resume or a complete trajectory.

## Independent evidence

- `scripts/restored_controls_oracle.py` continuously executes the restored branch
  for 400 cases, with actual twenty-element memory arrays. Original comparisons,
  loop bounds, branches, Single stores and scalar copies execute directly.
  No arithmetic or COM helper is substituted in this branch. Saved clocks cover
  zero, below/equal/above 100, and 300 seconds; gates/faults include 0, −1, 1, 2.
- Its binding reference executes the RCP caller and both SG push sequences to
  read the native time sources. Malfunction entries come from the original
  array offsets documented above.
- `scripts/recovered_restored_event_step_oracle.py` adds 32 composed references:
  native restoration → native event bindings → RCP/SG/primary/integration slices.
  Deliberately inconsistent standalone consumer times/flags ensure that the
  schedule is actually consumed. This is not continuous whole-coordinator or
  original Windows application execution.
- Four Rust tests check every returned scalar/event, preservation of saved
  state, late missing-input/overflow atomicity and the connected updates,
  including final-integrator rollback and nonfinite-schedule rejection.

This closes the restored control-state/rebase subproblem under INIT/EVENTS and
connects known event inputs under STEP/AUTO. Full snapshot loading, remaining
initialization/arrays, event ramp/delay/latch/protection dispatch, external-model
setup, GUI trajectories and original Windows scenario comparisons remain open.
The seven acceptance milestones are unchanged and remain incomplete.

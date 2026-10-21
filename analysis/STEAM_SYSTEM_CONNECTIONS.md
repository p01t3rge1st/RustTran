# Auxiliary feedwater and continuous SG numerical/control body

Ports: `rusttran/src/steam_auxiliary.rs`, `steam_system.rs`. The remaining auxiliary
feedwater branch `0x50a8a6–0x50ac31` is now implemented and connected between
valves/outflow and the final exchange. The standalone `steam-system-step`
composes the initial control, device/valve/outflow, auxiliary and saturated
exchange stages transactionally. Native command values and event times remain
explicit; this does not initialize or coordinate the entire plant.

## Auxiliary branch

- Run only when I16 `0x54b4d2 == 1` or `0x54b4d4 == 1`. Nonzero −1 and 2 do
  **not** activate it. The skipped branch writes no feedwater/history/enthalpy.
- Set feedwater enthalpy `0x54b718` from `0x54b72c` on the active path.
- Compute the Single level/flow error from current outflow minus feedwater,
  nominal flow, share and level-minus-target times native Double 0.033.
- Maximum flow is Single(`0x54ba7c * share`). The PI-like increment uses error,
  step/60, previous error, model `0x54b184`, capacity, share and the selected
  auxiliary command.
- The denominator weights the two auxiliary percentages by share and 1−share,
  preserving the native intermediate Single store and Double 0.001 addition.
  Clamp with the original strict comparisons, then store the new error history.
- Commands are original collection `0x5ac`, property `0x68030009`, indices 2/3.
  The opposite command is index `3 − side`. They remain explicit raw I16 inputs.

## Corrected pointer evidence

The previous valve note inferred that bypassing `0x50ac2e` retained a base-flow
pointer. Continuous instruction execution disproved this inference:
**`0x50a7ff` already loads ESI from argument `+0x68`, the total outflow pointer.**
The auxiliary skip at `0x50a8eb` retains that total-flow pointer. Both paths use
and, below the pressure floor, zero total outflow in the final exchange.
The previous final-exchange implementation already used total outflow; that
behavior is retained. Tests check active and skipped paths with nonzero base
flow below the pressure floor. No artificial alternative outflow source is added.

## API and coordinator connection

- `steam-auxiliary-step examples/steam-auxiliary-step.json`, recovered stage
  `steam_auxiliary`: auxiliary update only, including an `active` result.
- `steam-system-step examples/steam-system-step.json` and
  `examples/steam-system-active-step.json`, stage `steam_system`: entire recovered
  SG numerical/control sequence for one side. Outputs include all 16 shared
  numerical values, the fault checkbox and resulting valve command state.
  Initial feedwater command comes from `controls.valves.feedwater`.
- `recovered-primary-step examples/recovered-steam-system-step.json`: optional
  `steam_auxiliary_percent: [A,B]` requires the valve/outflow producer and native
  computed SG selectors `[0,1]`. Each auxiliary branch runs after its valve
  stage and before its final exchange; A completes before B starts.

Returned checkbox and valve state must be retained across subsequent updates.
A late auxiliary or saturated-balance error commits none of the initial-control
or valve outputs. A late primary/integration error rolls back both SGs and all
other composed producers.

## Independent native references

`scripts/steam_system_oracle.py` continuously executes the original body
`0x5089f0–0x50ad65`, including both auxiliary paths, rather than stitching the
previous SG prefix and final-exchange slices together. Original HGAS, PI and
saturated numerical callees execute independently; PowerR8 uses the original
installer DLL. Explicit stateful COM properties and known VB/runtime operations
are bridged. x87 53-bit precision, zero EBX from the original prologue, and
nonaliasing caller-local storage are explicit. Required numerical input fields
are asserted rather than silently using mapped image zeros.

- 640 auxiliary cases cover exact activation flags, both sides, zero/partial/full
  command combinations, shares, clamps, steps including zero and skip no-writes.
- 320 continuous SG cases cover initial timing/control, fault and valve branches,
  auxiliary modes, pressure floor and final derivatives in one native execution.
- 32 additional composed plant-slice updates connect these stages to primary
  balance and 14-state integration. These remain composed slices of the plant
  coordinator, not original application scenarios.
- Five Rust tests check outputs, activation/no-writes, late-stage rollback,
  connected rollback and unsupported predecessor rejection.

This closes the previously explicit auxiliary SG gap under AUTO/STEP. The
numeric/control body has native references; Windows COM callbacks, logging and
error handling are excluded. Complete initialization/restore, remaining plant
thermal/source/event dispatch, actual GUI transients, histories and original
Windows scenarios remain unfinished. The seven acceptance milestones therefore
remain unchanged and the program is not a complete PCTran replacement.

Current aggregate: **19373 reference cases / 264600 output checks / 129 Rust tests**.

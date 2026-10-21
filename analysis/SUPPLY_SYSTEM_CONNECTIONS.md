# Supply, injection and recirculation — 2026-10-21

The original `0x510850` control/numerical body is now connected, not just the
previous standalone tank-depletion formula. `supply_system.rs` implements:

- Pressure-triggered one-shot activation, timestamp and zero/uninhibited pump
  openings, preserving manual and partial commands.
- Current low-pressure injection from the authenticated seven-point PL/WL curve,
  scaled by the native checked I16 sum of both pump percentages.
- Mode 2 cooling: original Single-rounded `30 * pressure_factor` threshold,
  exchanger heat, reference flow at query 100, and exact inactive clears.
- Mode 1 recirculation: exchanger heat, return-flow scratch, source enthalpy and
  the native lower temperature floor. Its denominator uses `return_flow + 1`,
  not a guessed small epsilon.
- Other mode values: original normalization to mode 0, supply depletion and
  strictly-below-minimum transition to mode 1 with the original level command.
  Newly selected mode 1 starts its thermal branch on the next call.

The actual coordinator push sequence `0x51df57–0x51df9c` authenticates 14 arguments.
Its caller-local return-flow scratch is kept separate from the callee frame in
reference execution. Seven global states (`BA20`, `B454`, `B6e0`, `BA38`, `B2e8`,
`BA40`, `B72c` at base `0x540000`), I16 `B4e8`, controls, return flow and optional
level command are returned atomically. Missing operands and numerical errors
cannot commit activation or partially change the plant.

Optional `RecoveredStepControls.supply` executes after RCP and before accumulator,
source sum, thermal loops, SGs and primary balance/integration, matching the native
call order. The later containment/auxiliary source producers remain incomplete;
the returned caller-local flow is exposed but not inserted into an unrelated
primary operand. Original COM setter callbacks, log/error UI and complete scenario
dispatch remain outside this block.

Verification: `scripts/supply_system_oracle.py` continuously executes original
`0x510901–0x511907` with a checked stateful COM bridge. Both curve calls execute
independent original wrapper/INTP instructions; FpR4 is a real Single round bridge.
The log-only tail after the level command and post-numeric error UI are excluded.
The reference uses explicit x87 53-bit precision, not a verified Windows app context.

960 native body cases cover five mode values, −1/0/1/2 latches, pressure and volume
boundaries, partial/manual/signed commands, zero steps and 0–300 second clocks.
96 composed cases check these outputs feeding accumulator, source/enthalpy balance,
both thermal loops and SGs, and all 14 integrated states. Three Rust tests also
verify rollback after activation and a late integration error.

CLI: `supply-system-step examples/supply-system-step.json`.
Stage: `native-stages examples/supply-system-stages.json`.
Connection: `recovered-primary-step examples/recovered-supply-step.json`.

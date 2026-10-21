# Heater conversion — 2026-10-13

Source: PCTran 0x500bd0, numeric paths 0x500c21–0x501036; caller 0x50cae3–0x50cb10. Explicit COM inputs and captured writes replace the original form calls. Post-calculation UI/error reporting is outside scope.

- Level <= minimum: both heats and percentage commands zero.
- Native checkbox TRUE selects manual mode: signed I16 percentage / 100 * capacity, rounded to Single. Original percentages are not silently clamped.
- Automatic proportional: signal > off threshold gives zero; signal < full threshold gives capacity; otherwise (off-signal)/(off-full)*capacity. The UI percentage is 100 throughout this active branch, even for fractional heat.
- Automatic backup: capacity when signal < backup threshold OR Single(level_setpoint-level) > Single(0.05); otherwise zero.
- Sum the two Single heats and round to Single at the original store.

`heater-control` runs the standalone numerical component. `heaters` recovered stage binds the nine original global arguments and writes 0x54b6dc atomically after validation. `primary-core` optionally takes `heater_controls`; `primary_core_with_heaters` stage calls the heater after phase/level update, before the energy correction. Missing late inputs abort the full transaction. Existing explicit-heat mode remains available for prior reference fixtures.

Validation: 800 original numeric-path cases, 160 composed original core/heater slices (5280 checks), and shared-state rollback tests. Composed reference reads the live level from the original primary frame, executes the original heater numeric paths in a separate machine, writes the result back and continues the original correction/derivatives. Upstream spray/pressure-signal preparation remains explicit. This does not reproduce the full original control region or validate GUI trajectories. Windows application floating-point context remains unproven.

Next: port 0x500950 and the spray/control-signal updates in 0x50c5ac–0x50cae3, complete cached-state initialization, then connect the full timestep coordinator to the GUI.

# Spray control and shared pressure signal — 2026-10-13

Original evidence: selector `0x50099b–0x500a3c`, caller control/flow `0x50c5e7–0x50ca84`, and coordinator signal store `0x51e0c7–0x51e0d9`.

- Selector: signal < lower threshold sets command 0; signal > upper sets 1; the inclusive interval also sets 1 and returns Single(signal/(upper-lower)). The caller discards the selector return. This unusual division is retained exactly.
- Interlock: signal `0x54b6c0` > 90 or pump A status zero forces the command to zero. Equality at 90 does not clear the command by itself.
- Manual mode preserves the UI percentage. Automatic mode writes command * 100 when percentage/100 differs from the command.
- Pump flow gate: original step helper returns 1 for Single(pump A + pump B - Double(0.1)) >= 0, otherwise 0. Signed I16 addition overflow is rejected.
- Flow: Single(raw spray percentage * spray capacity * pump gate + auxiliary percentage/100 * auxiliary capacity). The original primary term does not divide the percentage by 100.
- Active indication: computed flow > Single(0.1).
- Shared spray/heater signal: Single(primary pressure - pressure adjustment `0x54ba4c`), prepared in the coordinator before the core, not after its phase update.

Native reference executes original numeric instructions, with explicit COM inputs and captured writes; cleanup/UI/error-reporting calls are skipped. 640 standalone spray cases, 300 pressure-signal cases, and 160 composed original core/spray/heater cases pass. The composed reference uses separate original numeric control slices and writes their results into the live primary frame before original energy correction.

Earlier inventory/phase computations read the previous `0x54b6d8` before the spray stage refreshes it. This history value remains required; it is not replaced by an invented zero. A late heater failure rolls back spray writes and the entire primary transaction.

APIs: `spray-control`, `pressure-control-signal`, optional `spray_controls` with `primary-core`; recovered stages `spray`, `pressure_control_signal`, `primary_core_with_controls`.

Remaining: upstream pressure-adjustment producer, complete initialization of history/interlock states, fault/event transitions and actual GUI controls driving complete timesteps. Original application/Windows FPU context and whole-plant trajectories remain unvalidated.

Pressure adjustment producer references to investigate next: original initializer nominal-model-pressure copy `0x51b9d4` (ECX loaded from `0x54b124` at `0x51b988`), event/UI writes `0x4b4a8b`, `0x4dc764`, `0x5435b2`. Validate their conditions before using initial defaults.

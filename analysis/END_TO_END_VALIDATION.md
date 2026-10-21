# Validation needed before claiming a PCTran replacement

Current tests are necessary but insufficient. They compare native numerical slices, selected connected components, field conversion, state ordering and rollback. The GUI startup backend is compared for all 110 source model/operating-point pairs. A Linux screenshot confirms that the new initialization window opens and renders computed results. None of these checks proves complete transient agreement.

After the initializer, other components, event/protection dispatch and integrator are connected:

1. Compare startup/restoration for every supported model and IC. Check equipment states, protection latches, previous derivatives, properties and missing-data handling, not just the displayed initial values.
2. Run matching scenarios in both complete applications over 0–300 seconds: steady operation, manual heater/spray changes, pump trip/restart, operating-mode changes, representative leaks/relief events and protection thresholds. Use exactly matching command/event times and inputs. Choose cases from actual supported original controls.
3. Export timestamps and every available variable in original native units; retain original exports, Rust exports and scenario configuration. Compare full traces, event order/times, peak/final values and first divergence. Establish variable-specific tolerances from source precision and reference repeatability; component ULP limits are not automatically valid for a full trajectory.
4. Exercise GUI Start/Pause/Reset, condition/model changes, command edits and plots/reports against the running numerical state. Verify that GUI timing/speed affects scheduling only, and errors do not partially advance time or state.
5. Check Windows execution and Linux desktop installation separately. Windows cross-compilation alone is insufficient; original Windows floating-point context remains unverified.
6. Test Rust runs beyond 300 seconds for numerical/state stability, clearly separated from original-app equivalence tests constrained by its runtime cap.

Record these as pending until actual application trajectories and GUI actions are exercised. A passing component comparison table must never be relabeled as full end-to-end validation.

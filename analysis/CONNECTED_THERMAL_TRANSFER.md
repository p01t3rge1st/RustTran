# Connected normal thermal transfer — 2026-10-20

`RecoveredStepControls.normal_thermal` optionally closes the cached thermal-input
boundary for the normal plant model (`0x54bec8 == 0`). It executes thermal driving
and both loop transfers before SG control/exchange and primary balance/integration.
The existing explicit-cache interface remains available when the option is absent.

Native evidence:

- `0x51f476–0x51f6fb`: heat, power fraction, thermal modifier, temperatures and
  the fault-flag −1 limit store. Malfunction array byte offset `+0x0e` is event 7.
- `0x51ff5c–0x51fffd`: A caller and `0x54b50c → 0x54b510` copy. The latter is
  executed by original instructions in the reference, not inferred from symmetry.
- `0x520002–0x5200d4`: native B loop-count subtraction and VB6 FpI2 conversion,
  then B caller. Both loop failure pointers use event-time array `+0x20` (event 8).
- `0x5053b8–0x505873`: both numerical loop bodies with independently executed
  property prefixes and original installer-DLL power. The eight scalar outputs
  (including heat, levels, transfer state and heat histories) are committed before SGs.
- SG exchange and all subsequent recovered blocks consume these current outputs.

`event_schedule`, when present, overrides the thermal fallback flag/time with
flag 7 and time 8. Its existing RCP/SG bindings still apply. Controls are cloned;
a failed B loop, later SG computation or integration cannot partially commit a step.
Nonzero external-model modes are explicitly rejected for this connection: executing
the isolated thermal formula alone would skip original external-model dispatch.

The fresh GUI/CLI initialization backend also now executes the already recovered
`0x51b0fe–0x51b132` thermal-driving coefficient from authenticated model temperatures
and power. It returns the coefficient and unit factor, extending its checked output
from 105 to **107 Singles**, still **14 I16 flags**, across all 110 model/IC pairs.
This is one recovered initialization dependency, not completion of startup/Reset.

Reference generation: `scripts/connected_thermal_oracle.py` and
`scripts/recovered_thermal_step_oracle.py`. **128 composed native updates** cover
0–300 second clocks, failure boundaries, direct/scheduled inputs, −1/0/1/2 thermal
flags, both auxiliary-feedwater paths and model loop counts. Cached heat, level,
transfer outputs and the copied B reference are removed from every request.
The reference asserts required caller operands instead of accepting mapped zeros.

`rusttran/tests/connected_thermal.rs` compares all nested outputs and state flags,
verifies event overrides and caller immutability, and checks complete rollback for
missing B operands, external-model selection and late integration failure.
The full report remains a comparison of native components/composed slices under
explicit x87 53-bit precision, not a continuous Windows application trajectory.

Example: `recovered-primary-step examples/recovered-thermal-step.json`.

Remaining work stays under the seven established milestones: external Double model,
other plant/event/protection producers and initialization/history/restore dispatch,
complete coordinator order, GUI-driven trajectories, plots and end-to-end scenarios.
`Start preview` still advances only the GUI clock. `Kiedy_skonczysz` is untouched.

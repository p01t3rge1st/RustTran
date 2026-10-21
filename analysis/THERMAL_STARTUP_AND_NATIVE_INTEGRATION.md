# Thermal startup and native-state integration — 2026-10-20

Implemented:

- Fresh SG level/phase `0x51b6cf–0x51b806`: seven Single outputs, including both SG fraction aliases. 320 native-prefix cases.
- Fresh feedwater/coolant sharing `0x51b806–0x51b905`: nine Singles and one I16 latch. Includes original HGAS prefix and separate native share/operating-power factors. 300 cases.
- Fresh coefficient/pressure/heat stores `0x51b432–0x51b4fb` and current-derivative reset stores `0x51b2f7`, `0x51b303–0x51b351` are connected to primary inventory, SG state and feedwater startup. Fourteen reset outputs include twelve integrator derivatives and two other native outputs. They are not previous-derivative history.
- Combined thermal startup backend: 110 model/operating-point pairs against one original primary/SG initialization frame with original numerical property prefixes and separate pressure/level-reference stores. 55 Single outputs and 11 exact I16 flags each.
- Shared-state integration: all 14 state/current/previous derivative bindings, original constraints, primary fraction alias and event-gated `0x54bba4`. 36 references execute coordinator `0x523f3b–0x52454f` with original EULER numerical-prefix/VB arithmetic calls. The original EBX=Single(1) load at `0x523d48` is executed before the slice, reproducing its fraction ceiling stores. Each original constraint and ordering instruction is replayed. Prior fixture constraints were reconstructed; this new set additionally executes those original constraints.
- Shared stream-balance derivative bindings (`0x523dc8–0x523e04`); comparison against the existing 100 original stream cases, including rollback when a later integration stage lacks history.

Source correction: model `MSG0` maps to `0x54b1a4`. Fresh `0x54b4f4/0x54b4f8` are SG inventories in lb, not loop flows. The GUI now labels them correctly. Actual coolant flows are `0x54b530/0x54b534` in lb/s, and feedwater flows are `0x54b528/0x54b52c`. Inventory `0x54b7f0` is the pressurizer mixture inventory. Earlier startup window labels were incorrect; numerical values and native comparisons were unchanged by the label correction.

Desktop: Code Control → Initialize thermal systems. New panel shows initial inventories, fractions, feedwater and primary coolant flows. `--initialize-thermal MODEL` opens the populated panel; `--initialize-primary` remains a compatible alias. Linux screenshot smoke test: `thermal-initialization-gui.png`. This panel computes initialization results; the selected IC schematic remains a snapshot and Start preview is not a plant transient.

CLI: `fresh-steam-init`, `fresh-feedwater-init`, `fresh-thermal-startup`, `native-integration-step`. Recovered stages: `fresh_steam_init`, `fresh_feedwater_init`, `fresh_thermal_coefficients`, `current_derivative_init`, `stream_balance`, `native_integration`. Missing history/derivatives fail without partial commits; no default zero history is invented.

Pending: remaining fresh/restored initializer branches, two unbound integrated-state sources and previous-derivative histories, live upstream property/event producers, complete SG and device automation, protection/event transitions and the full original timestep order. The integration adapter consumes explicitly prepared complete derivatives; it must not be advertised as the full plant engine. Whole-application traces, Windows runtime/FPU context and full transient GUI actions remain unvalidated.

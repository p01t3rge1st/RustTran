# Late thermal references and fresh control histories

The GUI/CLI fresh thermal backend now returns **105 Single values and 14 I16
flags for all 110 model/operating-point pairs**, extending the previous 79/11
snapshot. It still does not execute the complete original initializer, Reset,
restored scenarios or original external-model/UI/event dispatcher.

## Late numeric stores

`rusttran/src/late_thermal_init.rs` ports the numeric slices
`0x51bde6–0x51bf00` and `0x51c014–0x51c1e4` in initializer `0x51afe0`.
CLI: `late-thermal-init examples/late-thermal-init.json`; construction stage
`late_thermal_init`, example `examples/late-thermal-init-stages.json`.

| Original state | Produced values |
|---|---|
| Live SG levels | A/B target levels and shared level reference |
| Coolant flows, nominal flow and shares | Normalized A/B pump targets |
| Current heat-transfer coefficient | Native coefficient / 30 |
| Model temperature interval, power, inventory, count | Dynamic reference and transfer coefficients |
| Model P/T | Initial liquid specific volume |
| Current primary P/T | Saturation pressure, liquid specific volume, inventory pair |
| Model minimum temperature + primary pressure | Auxiliary feedwater enthalpy via original HLIQ |
| Current pressurizer level and vapor fraction | Level-percent indication and integrator fraction alias |
| IC WRC1 and model coolant flow | Initial loop flow |
| Explicit original stores | Ten Single zeros and three I16 flag resets |

There are 28 numeric outputs and three flag outputs in this stage; two numeric
outputs already existed in the previous fresh backend, so the combined result
adds 26 distinct Singles and three flags. The stage recomputes references after
fresh primary/SG/feedwater setup, using the resulting state instead of stale IC
levels/flows. The zero stores are original application instructions, not guessed
memory defaults. The 14 integrator previous-derivative histories remain separate.

All inputs are authenticated model/IC bindings or already recovered numerical
outputs. No new fallback inputs or default fault selections are introduced.
The stage calculates every result before committing; missing/invalid operands,
zero denominators or late property failures leave the input state unchanged.

## Fresh control-history stores

`rusttran/src/fresh_control_history.rs` ports `0x51baa3–0x51bbed`, with EDI=0
proven by the initializer prologue. CLI: `fresh-control-history
examples/fresh-control-history.json`; stage `fresh_control_history`.
This is explicitly a fresh-start stage, not restored-scenario initialization.

- Zero both SG level-error histories, two native control/history fields, and
  set the shared SG transition time to native Single 99999.
- Copy initial boron PPM0 to current PPM, startup cached temperature/state,
  and current rod position to its reference.
- Exactly malfunction-array entry +0x10 == −1 copies current SG outflows to
  the pressure-control outputs. Flags 0, 1 and 2 take the native zero branch.
- All 11 Single writes commit together. Integrator derivative histories and
  unrelated event state remain unchanged.

The malfunction flag stays explicit. This stage is available separately rather
than silently assuming a fault mode in the GUI's thermal initialization button.
External Double-model writes preceding it, restored-state branch `0x51bb14`,
20-event timestamp rebasing and original COM callbacks are not included.

## Independent evidence and connection

- `scripts/late_thermal_init_oracle.py` executes the two original numeric slices
  with explicit x87 53-bit precision. Original PSAT/VLIQ/HLIQ numerical callees
  execute independently. Only known Variant conversion/cleanup bridges replace
  runtime operations. Required input addresses are checked explicitly.
- 320 standalone cases include 0/partial/full power, varying current levels and
  flows, and HLIQ's below/equal/above 220°F branches.
- `scripts/fresh_thermal_startup_oracle.py` now composes the existing original
  fresh primary/SG/feedwater prefix with the late slices, passing resulting state
  for every one of the 110 source model/IC pairs. External-model and COM gaps
  are documented; this is not continuous complete initializer execution.
- `scripts/fresh_control_history_oracle.py` continuously executes the fresh
  Single history stores for 320 cases, including all four fault modes above.
- Five new Rust tests compare numeric/flag/history outputs and verify atomic
  failure and preservation of unrelated integration/event histories. Existing
  Presentation/GUI-backend tests cover the expanded 110-pair startup result.

The initializer subproblem shrinks under the existing INIT/AUTO/STEP milestones.
The next initialization work is external Double-model setup, actual fresh versus
restored dispatch, remaining histories/array initialization, event rebasing and
GUI callback state. Full plant coordination and original Windows scenario
validation are also still required. No milestone is marked complete by these
component comparisons.

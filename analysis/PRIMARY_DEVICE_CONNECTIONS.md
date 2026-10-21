# Primary device automation and fresh cached state

Implemented in `rusttran/src/primary_devices.rs`, `primary_references.rs`,
`fresh_auxiliary.rs` and `recovered_step.rs`. Assembly from the unchanged original
`analysis/program/PCTran.exe` remains authoritative.

## Recovered coordinator order

1. Refresh pressure-dependent properties.
2. Optionally update reference temperature/level (`0x51dd7b–0x51de6c`).
3. Optionally run original device decisions, charging PI and injection curve
   (`0x50da40`, call binding `0x51de72–0x51dee5`).
4. Calculate primary sources and relief/tail state.
5. Calculate both SG exchanges, primary control/balance/feedback, stream
   derivatives and 14-state integration as in the existing recovered pipeline.

Steps 2/3 now have explicit optional inputs in `RecoveredStepControls`; returned
`primary_devices.controls` contains the updated control state for the next update.
The actual pump/event/feedwater/thermal dispatcher is still incomplete.

## Device state and numerical outputs

| Original binding | Rust meaning/output |
|---|---|
| collection `0x568`, index 0, properties 9/8 | letdown percent/manual |
| collection `0x56c`, indices 0/1, properties 5/4 | injection pump percents/manual |
| collection `0x56c`, index 2, properties 5/4 | charging pump percent/manual |
| collection `0x4a4`, index 0, properties 9/8 | auxiliary control percent/manual; kept distinct from spray collection `0x5b8` |
| `0x54b6b0` | letdown flow, computed **before** this update's injection-command changes |
| `0x54ba28` | charging flow |
| `0x54ba1c` | high-pressure injection flow from authenticated seven-point curve and checked I16 command sum |
| `0x54b4e0`, `0x54b45c` | injection latch and one-time transition timestamp |
| `0x54ba2c` | charging PI previous error |

The first three activation checks run only when the old latch is zero, in order:
primary pressure <= `0x54b158`, containment pressure >= `0x54b584`, either SG
pressure < `0x54b58c`. The subsequent pressure/level branch can set the latch
without entering an original log branch. Manual activation uses the original
checked I16 sum == 200. Command transitions require **timestamp > clock** and
latch == 1, then store the clock. Equality does not enter the transition block.
Manual flags and noncanonical percentages/flags are preserved where the original
does so. There is no invented 0–100 clamp.

Automatic charging invokes the already ported PI with gain **-500**, integral
30 s, band 1, lower limit `Single(-WLD0/CHG)` and upper 1. The coordinator
initializes the PI output scratch from DLL ordinal 605, **rtcGetErl**, converted
from I32 to Single; it is not a timer. `runtime_erl` is explicit. Pump display
transitions compare charging flow with **1**, not zero. Automatic reference
updates preserve Double 0.27 in the expression and Single 0.27 in the final floor.

The returned event flags report entry into native log branches. They do not
claim to execute the original log formatter, ActiveX setter callbacks or errors.
Colors and log construction are excluded from the oracle after native decisions.

## Fresh initialization

`initialize_fresh_auxiliary` executes stores equivalent to `0x51b905–0x51ba28`:
25 Single outputs, including three native sentinel times, containment pressure,
feedwater-temperature saturation pressure, tank/temperature references,
source resets and power aliases. The pressure offset is original Single **15**.
The PSAT pointer was pushed earlier by `0x51b820`; the full initializer oracle
preserves that pending stack argument. EDI=0 is proven at `0x51b00c`.

The GUI/CLI thermal startup backend now returns **79 Single values and 11 I16
flags**, checked against the contiguous native prefix for all 110 model/IC
combinations. The new stage stops before external-model init `0x526200`.
It does not initialize previous-derivative histories or implement restored IC,
application Reset, arrays or subsequent UI/event dispatch.

## Evidence and reproduction

- `primary_devices_oracle.py`: 960 cases, including strict threshold and equality
  branches, manual controls, nonzero/noncanonical latches, PI saturation and
  explicit runtime error-line values; native numeric PI/curve callees.
- `primary_references_oracle.py`: 320 reference cases.
- `fresh_auxiliary_oracle.py`: 320 initialization cases.
- `fresh_thermal_startup_oracle.py`: expanded original contiguous prefix for all
  110 source model/operating-point pairs.
- `recovered_devices_step_oracle.py`: 32 composed device/reference/SG/primary/
  integration updates. Newly produced `0x54ba1c`/`0x54ba28` are absent from input.
- Rust tests check original results plus rollback on final curve failure,
  zero reference span, missing late initialization operand and missing final
  integration history. Existing producer modes and earlier fixtures remain valid.

Reference cases run original x86 slices in Unicorn with explicit x87 53-bit
precision and documented numeric/runtime bridges. They are not complete PCTran
Windows application runs or handbook scenario trajectories. The latter remain
required before claiming complete replacement.

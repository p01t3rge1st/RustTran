# SG device decisions, safety valves and outflow

Port: `rusttran/src/steam_valves.rs`. Original instructions
`0x509213–0x50a8a6` in procedure `0x508960`, including the previously checked
outflow limiter. Stage `steam_valves`; CLI
`steam-valves-step examples/steam-valves-step.json`. Optional recovered-step
producer `steam_valves` runs before each computed SG exchange. Example:
`recovered-primary-step examples/recovered-steam-valves-step.json`.

## Native decisions retained

- Main steam and feedwater controls close only at clock > shutdown time when
  their current percentage is exactly 100 and manual override is false. The
  main control also closes below `0x54b58c`; equal pressure does not trigger it.
- Original malfunction-array entries at byte offsets 4 and 6 select the flow
  branches. Entry 4 has priority. Its additional term applies only to A; entry
  6 adds a share-scaled term using the main control percentage. Both branches
  use the original A pressure reference, including when calculating side B.
- Each safety bank opens from exactly 0 to 100 above its pressure threshold,
  and closes from exactly 100 below Single(threshold − 30). Equal pressure,
  intermediate percentages and manual override retain the original state.
- Base outflow uses model capacities/thresholds, both safety percentages,
  current pressure and side share. Its sum with control and crossflow terms
  is capped at Single(inventory / timestep). Native stores assign this cap to
  both base and additional flow independently; the selected heat is corrected
  using discharge/feedwater enthalpy. No extra physical reinterpretation or
  sign clamp is introduced.
- The caller at `0x520fa5–0x520fad` negates A's `0x54bf84` for the B call. The
  port and reference preserve that sign and evaluate B using the state after A.

`SteamValveControls` carries the shared shutdown time, both I16 malfunction
flags, turbine percentage, two main/feedwater controls and four safety controls.
The shutdown time is the caller's `[ebp-0x20]`, initially native Single 99999
(`0x51d3fe`) and conditionally overwritten at `0x51f1a9`. The event producer
remains explicit; the port does not invent a default trip time.

| Native form collection | Index | Properties |
|---|---|---|
| `0x530` | SG A/B: 0/1 | main percentage `0x68030009`, manual `0x68030008` |
| `0x5ac` | SG A/B: 0/1 | feedwater percentage/manual, same property IDs |
| `0x588` | first bank: 0/1; second bank: 2/3 | safety percentage/manual |
| `0x4f8` | 0 | turbine percentage `0x68030009` |

Percentages remain raw I16 values; they are not silently restricted to 0–100.
Actual COM callbacks and property-specific Windows behavior remain outside this
explicit-state port.

## Shared numerical outputs and connection

| A / B address | Output |
|---|---|
| `0x54b560` / `0x54b564` | total SG outflow |
| `0x54b874` / `0x54b878` | base flow |
| `0x54b51c` / `0x54b520` | control/additional flow |
| `0x54b67c`, `0x54b680` (shared) | selected heat correction, other heat retained |
| `0x54b718` (shared) | feedwater enthalpy copied from `0x54b714` |

When both `steam_controls` and `steam_valves` are enabled, the initial SG control
prefix reads the feedwater percentage from the shared `steam_valves` state.
Its legacy `steam_controls.feedwater_percent` array remains the fallback when
the valve stage is absent. The order is A prefix → A valves/outflow → A final
exchange → B prefix → B valves/outflow → B final exchange, followed by the
existing primary/balance/stream/integration stages. Returned valve control state
is explicit for the next update. Computed native selectors `[0,1]` are required.
Every numerical and control output rolls back on a late failure.

## Evidence and remaining boundary

`scripts/steam_valves_oracle.py` continuously executes original x86
`0x509213–0x50a8a6` with explicit x87 53-bit precision. It bridges only known VB
runtime operations, Single rounding and stateful COM access. The native code
performs the comparisons, branches, arithmetic and property writes. Caller
locals are remapped away from the callee frame to prevent accidental aliasing.
Source SHA-256 is stored in each fixture file.

- 1200 standalone native cases cover both SGs, both malfunction flags including
  priority, clock below/equal/above shutdown through 300 seconds, pressure on
  either side of opening/closing and isolation thresholds, manual overrides,
  0/50/100 commands, signed crossflow and inventory limiting.
- 32 additional composed native-slice updates connect initial controls,
  valves/outflow, SG exchange and primary/integration. Base-flow input fields
  `0x54b874/0x54b878` are absent and produced inside the update.
- Four Rust tests compare numeric/control outputs and check late standalone,
  B-side and final-integration rollback, plus incompatible producer rejection.
- Current aggregate: 18381 cases, 242912 output checks, 124 Rust tests.

Auxiliary feedwater is now ported and validated as part of the continuous SG
body; see STEAM_SYSTEM_CONNECTIONS.md. The earlier inference about the skip path
retaining a base-flow pointer was incorrect: 0x50a7ff already loads total outflow.
Both final-exchange paths use total flow. The isolated final exchange was already
correct; continuous execution now confirms the connection.

Complete initialization/restore, event scheduling, GUI evolution and original
Windows scenario validation remain in the existing INIT/AUTO/STEP/EVENTS/GUI/E2E
milestones. This work closes the SG valve/outflow producer under AUTO and STEP;
neither whole milestone is marked complete.


Later update: auxiliary feedwater and the continuous SG body are now ported.
The earlier base-flow pointer inference was incorrect: 0x50a7ff already changes
ESI to total outflow, so both paths use total flow. This is verified by continuous
native execution; see [STEAM_SYSTEM_CONNECTIONS.md](STEAM_SYSTEM_CONNECTIONS.md)
for current implementation, evidence and remaining whole-plant scope.

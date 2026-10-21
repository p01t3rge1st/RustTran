# RCP switching, flow targets and coordinator connection

Port: `rusttran/src/rcp_control.rs`. Original procedure `0x512520`; coordinator
bindings `0x51deea–0x51df52`. Stage `rcp_control`; standalone CLI
`rcp-control-step examples/rcp-control-step.json`. Optional recovered-step producer
`rcp` runs after primary devices and before source/relief/SG/primary integration.
Example: `recovered-primary-step examples/recovered-rcp-step.json`.

## Decisions and retained native order

- Native state flags `0x54b4e2`/`0x54b4e4` are supported for 0/1. Other flags fail
  explicitly. The two command properties are original form collection `0x48c`,
  indices 0/1, property `0x68030005`. No fabricated manual/auto checkbox is added.
- The coordinator copies event-array byte offset `0x18` to `0x54ba30` before
  calling the procedure. `RcpControls.trip_time` supplies that value explicitly.
- A's effective threshold is min(old `0x54b42c`, trip time); the two-second A time
  constant is selected when old `0x54b42c` >= trip time, otherwise the model's
  time constant. Both selections precede this update's switching.
- At clock >= threshold, a command differing from the state flag * 100 toggles
  the state. Otherwise a running pump trips when its threshold is reached.
  Stopping stores the clock; restarting stores native Single 99999.
- A's targets and numeric flow are updated first. B's normalization and switch
  follow. B changes the shared final targets after A's flow has already been
  computed. Its numeric update always uses the model time constant.
- Original target matrices are A `[4,120,-10,100]`, B `[4,-10,120,100]`.
  Original B restart `0x5130c5–0x513100` indexes the B matrix with **B + 2*B**.
  This returns 100 on supported restarts. The port preserves that instruction
  behavior. Other assignments use the recovered A/B indices.
- Native void cap and Single-store/rounding order use the previously checked
  pump numerical helper. Final command properties become state flag * 100.

## Shared-state outputs

| Globals | Meaning |
|---|---|
| `0x54b42c`, `0x54b430` | switch/threshold timestamps |
| `0x54b4e2`, `0x54b4e4` | running flags |
| `0x54b83c`, `0x54b840` | final flow targets |
| `0x54b530`, `0x54b534` | updated loop coolant flows |
| `0x54ba34` | capped void fraction |
| `0x54ba30` | coordinator event-time copy |

The returned `pump_percent` is the resulting explicit UI state for a subsequent
update. In the recovered timestep, these flags/flows now feed later SG and
primary control calculations. Cached thermal-transfer/feedwater inputs remain
explicit; this is not the complete plant dispatcher or transient GUI engine.
All new outputs commit together; later integration failure rolls back the whole
recovered update, including device and RCP changes.

## Evidence and limitations

`rcp_control_oracle.py` runs original instructions continuously from native
matrix stores `0x5125c4` through final property writes, stopping at `0x513688`.
Array backing replaces VB allocation. Stateful property reads/writes are explicit.
Logging gates are zero; callbacks, string formatting, error handling and actual
Windows COM execution are excluded. x87 53-bit precision is explicit; the Windows
application floating-point context remains unverified.

- 768 original decision/flow cases: clock thresholds below/equal/above, all flag
  combinations, commands 0/50/100, restart/trip paths, void cap and time constants.
- 32 additional composed native-slice updates connect device/reference/RCP/SG/
  primary/balance/integration calculations.
- Rust checks original outputs, the B-restart lookup, A-before-B order, unsupported
  flag and flow failure rollback, and failure in final integration history.

This closes the **RCP switch/target producer** subproblem under stable milestone
AUTO. It does not close all of AUTO, STEP or EVENTS. SG/feedwater/valve automation,
remaining protections, complete initialization and original application scenarios
remain in the existing milestones, with no new milestone added by this work.

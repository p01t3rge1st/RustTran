# Accumulator activation/discharge connection — 2026-10-21

`accumulator_system.rs` joins the recovered activation latch, valve commands,
flow, water inventory and expanding-gas pressure into one atomic update. The
original coordinator `0x51dfa1–0x51dfd8` push sequence authenticates all 11 pointers:

| Role | Native global |
|---|---|
| Primary pressure / activation threshold | `0x54b494` / `0x54b1b8` |
| I16 activation latch | `0x54b4e6` |
| Gas pressure / discharge flow | `0x54b540` / `0x54b804` |
| Water / gas / total volume | `0x54b570` / `0x54b574` / `0x54b708` |
| Step / flow coefficient / clock | `0x54b414` / `0x54b1c0` / `0x54b40c` |

The activation body stores its event timestamp at `0x54b458`. Only an initially
zero latch with pressure at or below the threshold activates the device. Each
zero, uninhibited valve opens to 100; partial openings and manually closed valves
after activation retain the native behavior. Numerical discharge requires latch
exactly 1, water volume at least 1, and gas pressure strictly above primary
pressure. Other activation values retain prior flow. Water is not clamped; signed
valve commands and native I16 sum overflow rules are preserved.

`RecoveredStepControls.accumulator`, when supplied, runs after RCP and before
source-flow summation/relief, following the original accumulator call location.
Its current flow contributes to `0x54b6c4` and the later primary balance and
integration. Normal loop transfer and both SGs remain connected. The intervening
supply-tank/injection dispatcher still has explicit inputs and is not implied by
this optional connection. Omission preserves the prior cached-flow API.

The result contains five scalar states, the activation latch, both updated valve
properties and an activation indication. Callers must retain returned valve
properties for subsequent updates; the explicit-input run API does not synthesize
operator actions. Late numerical errors do not commit activation/timestamp changes;
errors in later plant stages roll back the entire connected step.

## Verification

`scripts/accumulator_system_oracle.py` continuously executes original numerical
and activation instructions from `0x511b60` through `0x5120f9`. It executes the
coordinator push sequence to obtain actual pointers, supplies explicit stateful
COM valve properties, and skips object cleanup/log presentation. FSQRT executes
as x87; PowerR8 executes the original installer DLL with the existing scratch
errno bridge. The reference explicitly uses 53-bit x87 precision; this remains
unverified as the original Windows application's runtime setting.

- 640 continuous native cases: pressure/volume boundaries, zero/nonzero activation,
  −1/0/1/2 flags, inhibited/manual/partial/signed valve commands, and 0–300 s clocks.
- 64 composed updates join native accumulator, sources, normal thermal loops,
  SGs, primary controls/balance and the 14-state integrator.
- Five Rust tests check all reference outputs, latch/manual closure retention,
  inactive-flow retention, post-activation numeric rollback and late-step rollback.

These are component and composed-slice comparisons, not complete original GUI
runs. Full initialization, remaining source/event/protection dispatch, GUI
transients/history and end-to-end Windows scenarios remain open.

CLI: `accumulator-system-step examples/accumulator-system-step.json`.
Stage: `native-stages examples/accumulator-system-stages.json`.
Connected step: `recovered-primary-step examples/recovered-accumulator-step.json`.

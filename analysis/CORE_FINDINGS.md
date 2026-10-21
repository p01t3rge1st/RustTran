# Native simulation core findings

The routine at `0x51d3d0` is a substantial simulation-step coordinator, not only a UI procedure or isolated property calculation. REA recovered 7,594 assembly instructions, 807 blocks and 62 callees (including runtime helpers), with a 210 kB pseudocode artifact at `analysis/rea/0x51d3d0.c`. Source evidence is preserved in `analysis/rea/session-evidence.json` (analysis record beginning `ev_a5b`). Scientific component names below are limited to what operands and mathematical relationships support.

## Responsibilities established by evidence

- Evaluates pressure-dependent vapor volume, liquid volume, vapor enthalpy and liquid enthalpy using recovered functions `0x49c190`, `0x49bf00`, `0x49ae10`, `0x49ab70`. The input global `0x54b494` is consequently a pressure state, very likely primary-system pressure (pseudocode lines 298–305).
- Computes numerical finite-difference property derivatives: pressure perturbations evaluated through property functions, divided by twice the perturbation. Outputs include `0x54b778`, `0x54b71c`, `0x54b658` (lines 305–365). Some decompiler arguments are invalid apparent code addresses, so exact perturbation bindings require assembly verification.
- Calls many component routines (`0x512520`, `0x510850`, `0x511b00`, `0x50f660`, `0x5059e0`, `0x5011b0` and others) and combines their global outputs. Physical identities of those routines remain unproven without further inspection.
- Applies DECAY calculations in event-dependent branches, including a time difference involving `0x54b40c - 0x54b44c` (lines 472 onward). Global `0x54b40c` is a strong simulation-time candidate; `0x54b414` is the exactly recovered integration-step value.
- Computes signed pressure-driven relationships through `(P1-P2)/abs(P1-P2+0.01)` for globals `0x54b500` and `0x54b4fc` against `0x54b494` (lines 1351–1405). The paired globals are pressure candidates; naming them steam generators or loops would need more evidence.
- Combines mass/energy-like component terms before the integration phase. For example `0x54b674 = 0x54b6a4 + 0x54bb50`, and `0x54b4b8 = 0x54ba90*0x54bb50 + 0x54b738*0x54b6a4` (lines 3395–3401). These are exact algebraic relationships, not sufficient alone to assign units or tank names.
- Calls `0x4fa8e0` immediately before the integration batch (`0x523f36`), then performs 14 EULER updates. Its proximity does not establish that it computes the derivatives. A new direct-write scan finds derivatives 0x54b770, 0x54b774, 0x54b77c, 0x54b784 and 0x54b788 in the nearest preceding procedure 0x50af30; ownership still needs REA body-range confirmation.
- Copies updated state `0x54b688` into `0x54b4f0` after the first update. It caps states `0x54b504` and `0x54b508` at 1, floors `0x54b4f4` and `0x54b4f8` at 0, and sets `0x54b494 = 0x54b544 + 0.1` when `0x54b494 < 0x54b544`, before the final update. These are explicitly observed post-update constraints (lines 3428–3464 and assembly).
- Includes COM/UI calls, event logging, and VB/FPU error paths. A faithful headless translation must identify which state changes are scientific and which are presentation effects; blanket deletion of COM calls could remove model control inputs.

## Exact integration state bindings

All calls use `VT_BYREF | VT_R4 = 0x4004`, pointing at single-precision globals. The native push order yields EULER arguments `(new_derivative, previous_derivative, step, state)`. The common step is `0x54b414`: instruction `0x523f5a` loads EDI with that address, and every call stores EDI into the step variant payload.

| Call VA | State | New derivative | Previous derivative | Scientific candidate |
|---|---|---|---|---|
| `0x523f9d` | `0x54b688` | `0x54b77c` | `0x54bb64` | unresolved; copied to `0x54b4f0` |
| `0x524006` | `0x54b49c` | `0x54b770` | `0x54bb68` | unresolved |
| `0x524063` | `0x54b4ac` | `0x54b784` | `0x54bb6c` | unresolved |
| `0x5240c0` | `0x54b494` | `0x54b774` | `0x54bb70` | primary-system pressure, high confidence |
| `0x52411d` | `0x54b4a4` | `0x54b788` | `0x54bb74` | unresolved |
| `0x52417a` | `0x54b504` | `0x54b7d0` | `0x54bb7c` | fraction A, component unresolved |
| `0x5241f0` | `0x54b508` | `0x54b7d4` | `0x54bb80` | fraction B, component unresolved |
| `0x524266` | `0x54b4fc` | `0x54b7d8` | `0x54bb84` | paired subsystem pressure A |
| `0x5242c3` | `0x54b500` | `0x54b7dc` | `0x54bb88` | paired subsystem pressure B |
| `0x524320` | `0x54b4f4` | `0x54b7e0` | `0x54bb8c` | nonnegative state A, unresolved |
| `0x52437d` | `0x54b4f8` | `0x54b7e4` | `0x54bb90` | nonnegative state B, unresolved |
| `0x524414` | `0x54b4b4` | `0x54b674` | `0x54bb94` | unresolved |
| `0x524471` | `0x54bba0` | `0x54b4b8` | `0x54bb98` | unresolved |
| `0x52454a` | `0x54bf98` | `0x54b6a8` | `0x54bfa0` | unresolved |

The JSON separates exact address-binding confidence from semantic naming confidence. No mapping from these addresses to database field names has been established here. Reproduce extraction with `python3 scripts/extract_integration_states.py`; native evidence is in `analysis/core_integration_disassembly.txt`.

## Remaining implementation gap

The recovered property functions, table interpolation and EULER helper are only a small part of the simulation. A complete Rust engine still needs the derivative-producing helper `0x4fa8e0`, component routines called by the core, database-to-global initialization bindings, event and malfunction updates, and observable output bindings. The 14-state integration layout now supplies precise addresses for tracing that remaining work.

REA pseudocode has major VB type-propagation limitations: missing function arguments, bogus apparent pointer arguments, and deep nesting of FPU-status checks. It is evidence for relationships and call inventory, but is not directly compilable C or a reliable source of all control-flow semantics. Assembly remains authoritative for argument binding and function boundaries.

## Rust integration and balance work (2026-10-13)

- `rusttran/src/integration.rs` implements the 14-state integration stage from
  the recovered operand bindings, Single stores and post-update constraints.
  It consumes derivatives; it does not calculate a complete plant step.
- `scripts/integration_oracle.py` supplies 100 seeded cases from 1,400 original
  EULER prefix executions with modeled VB helpers and VT_BYREF|VT_R4 arguments.
  Constraints are derived from assembly, not independently executed coordinator code.
- `rusttran/src/balance.rs` ports native 0x50cc88–0x50ce63 and 0x50ce6d–0x50cfa4, computing derivatives
  0x54b77c, 0x54b774, 0x54b770 and 0x54b784 from preceding component outputs and locals.
  Its 200 cases execute the original instruction blocks in Unicorn,
  normal hardware-FPU branch. The pressure block models Single rounding;
  the tail block requires no modeled arithmetic helpers.
- `analysis/rea/derivative-writers.json` records direct native writes; nearest
  preceding procedure labels are candidates, not authenticated body ownership.
- Physical bindings, initialization, upstream component equations, protection
  and malfunction dispatch remain incomplete. The GUI intentionally retains
  its initial-condition/preview behavior; no invented plant model is exposed.

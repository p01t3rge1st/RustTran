# Handoff — RustTran reconstruction

Updated: 2026-11-03. Read this first in a new session.

## Requirements and workflow

- Continue quality Rust conversion, necessary tests and remaining-work notes.
  Avoid repeated installers/release builds, huge full comparison reports or new
  Ghidra decompilation when `analysis/rea/all-native.asm` is sufficient.
- Application English, name RustTran, classic PCTran layout. Full window parity
  remains open; the classic layout supersedes the earlier gray/yellow redesign.
- Preserve existing uncommitted work. No new commit/push/release publication.
  Keep this handoff and progress current so another session can continue.
- **Do not open or execute `Kiedy_skonczysz`: program incomplete, folder untouched.**

## Current completed checkpoint: post-model reaction transfer

`rusttran/src/reaction_transfer.rs` ports native coordinator0x51f8c6–0x51fc92,
just after unported model0x526b40 and before the already ported BFB8 source.
It produces BFB4 transfer and BFCC/BFBC/BFE8 histories, plus BFE4/BFD0/BFD4/BFD8.

- Gate: Double node_fraction>Double0.01. At equality/below skip the whole block,
  preserving previous transfer/history. Do not automatically zero BFB4 on skip.
- Inputs: node fraction=Double arrayBD04+0x38; masses=Double BD48+BD40+BD50+BD58
  in that addition order; node temperature=Double arrayBD20+0x38; PI=Double C020,
  default initializer bits0x400921fb54442d11.
- Negative temperature difference selects the original pair of Single1 rates.
  Preserve intermediate Single history stores and strict updated temperature>1629
  transfer gate; otherwise zero BFB4. Transfer clamps temperature and accumulates
  BFBC. Native fractional exponent is0.3333, not1/3.
- Optional boxed `controls.reaction_transfer` runs before containment_thermal,
  normal thermal/SG and balance. Current BFB4 replaces a deliberately stale input
  before reaction energy. Whole step/session failures remain atomic.
- `ReactionTransferInputs::from_initialized` maps current alternate arrays and
  Doubles plus model Doubles from existing `FreshInitializedState`. All110 source
  pairs checked without narrowing to Single. Initial element7=0 selects native
  skip; this does not implement alternate evolution or complete runnable startup.

**Backlog correction:** C000/BFFC/C004 already are loaded model parameters
FCO2/FH2O/FDEC (`model_bindings.rs`, original stores4ce5ef/4ce532/4ce6ac). They are
not independently unported producers. BB08 is already a checked startup constant.
BFB4 arithmetic is now ported; actual upstream dynamic dependency is node evolution.

Detailed evidence/commands: **REACTION_TRANSFER_CONNECTIONS.md**.

## New files and validated results

- `rusttran/src/reaction_transfer.rs`, `tests/reaction_transfer.rs` (6 new tests).
- `scripts/reaction_transfer_oracle.py`, `recovered_reaction_oracle.py`.
- `analysis/reaction_transfer_fixtures.json`, `recovered_reaction_step_fixtures.json`,
  `recovered_reaction_session_fixtures.json`.
- `rusttran/examples/gui-reaction-session.json`: synthetic sixteen-update fixture;
  not an original IC start or handbook accident.

Integration: `recovered_step.rs`, `lib.rs`, `main.rs`, native composed/session
oracle and selected-family comparison script. No new GUI widget or history column;
existing25-series history consumes the connected pipeline. Existing GUI loader
accepts the example with current source, but no new X11 interaction was run.

Validation:

- **200 Rust tests pass** with GUI (`analysis/reaction-transfer-tests.log`).
- GUI/all-target Clippy `-D warnings` passes (`reaction-transfer-clippy.log`).
- **206 standalone native output cases**,110 active blocks and74 transfers.
  One separate native numerical singularity is checked as an error with rollback.
- **8 composed steps +2 sixteen-update native-slice chains**: one active/no-transfer
  chain, another with transfer in all16 steps and changing increments.
- Small current debug CLI report: **216/216 cases,20,542/20,542 output checks**;
  `analysis/reaction-transfer-comparison/results.html`.
- Saved reaction-input Doubles compare bit-for-bit, not cast to Single. Native
  Boolean decisions exact; numeric scalar outputs within4 float32 ULP.
- Typed startup adapter checked for110 model/IC bundles; missing Double fails.
- Save/resume equivalence, current-source vs stale-value difference, original
  singularities/late rollback and branch-dependent unread sources checked.
- Final targeted tests additionally check default PI on an active transfer path:
  `reaction-transfer-final-targeted.log`.
- 16-update 25-series history has27 CSV columns, finite samples match CLI float32
  outputs bit-for-bit; all16 example updates transfer and replace the stale input.
  `reaction-transfer-history/history.html`, `reaction-transfer-history-validation.json`.
- Python syntax and `git diff --check` pass.

Use `.tools/python/bin/python` for Unicorn/pefile. Other logs:
`reaction-transfer-{native,composed-native,cli-build,comparison,history}.log`.
The session oracle now omits absent new optional fields per serde, while retaining
older optional fields' explicit nulls. This corrects reference serialization for
an omitted-spray chain without changing the old Rust format/numerical logic.

## Earlier completed checkpoints and binary boundaries

- Classic NSSS and fan0x5034b0:720 native cases,32 steps,8 eight-step chains;
  earlier actual fan widget/CLI interaction proof remains its own checkpoint.
- Spray0x502480:192 cases,8 steps,2 four-step chains; separate202/10,424 report.
- Balance0x5233c5–0x523f36 with conditional vessel0x5011b0:144 native cases
  (84 solver calls),8 steps,2 four-step chains; separate154/11,359 report.
  Prefix0x5232ee–0x523358 produces wall heat BB0C and snapshots BB10; B74C carries
  the new temperature difference. Do not substitute a fixed old temperature.
- Supply caller51df66 binds EBP-0x28 as return_flow; original52337d–5233a1 sums it
  with spray EBP-0x2c into Single BA24. Current producers override stale fallback
  values. Caller Double53.34 and vessel Single53.54 intentionally differ.
- Thermal BFB8 source51fc92–51fd6c and hydrogen52059e–520986:335 native cases,
  8 steps,2 sixteen-update chains; separate345/26,830 report. Original limit curve
  recovered exactly; ignition/time4, delayed burn and extinction connected.
  Hydrogen meter selected-only,25-series history. Original curve default:
  x=[0,10,20,30,35,40,100],y=[5,6,7.5,9.5,12,18,20]. Initializer51d326–51d3c6,
  EBX/EDI context51c98a/51c998. DLL PowerR8(30.48,3), CW0x027f result bits
  0x40dba7362e90363c. Shared event flag4/time4 overrides copies; ignition updates
  shared time4 and sessions retain it.

Evidence: CONTAINMENT_{FAN,SPRAY,BALANCE,THERMAL}_CONNECTIONS.md (separate files).
The old full report stays **24,672 cases /653,483 checks** at the fan-checkpoint
CLI. Its ignored JSON is ~314MB: do not read/regenerate it for a local change.
Use `compare_components.py --families ...` for compact selected reports.

**Only source and `rusttran/target/debug/rusttran-cli` include current work.**
Installed binaries and `dist/` remain the earlier fan build. No new packages,
installers, Windows build or original Windows scenario run. Debug CLI hash is
recorded in latest-validation; earlier cross-build proof is not current proof.
Native references use Unicorn, original numerical slices/native DLL power,
documented sqrt/FPU/COM bridges and explicit x87 53-bit context. Rust host power
matches the tested probes; full Windows FPU/dispatcher behavior remains untested.
Original PE SHA-256:
`b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389`.

## Next work — earlier dependency, not new scope

1. Recover **actual Double/node evolution0x526b40**, including hydrogen inventory
   production near52bf92 and BF7C/BDF4. Its initializer and the now completed
   post-model transfer do not evolve node fractions/masses/temperatures. These
   are the previous upstream dependencies, not new unrelated features. Do not
   redo BFB4/BFB8/burning/balance or parameter loading. Do not zero missing state.
2. Assess full routine0x503f50 (caller5232da) against existing evidence; complete
   remaining plant producers/dispatch. Inspect existing disassembly first.
3. Complete fresh/restored initialization into runnable sessions, remaining
   Reset/history restoration and5 unresolved IC fields. Single fault-level
   arrayB614+0x3c differs from I16 malfunction flags.
4. Full event/protection dispatcher, dedicated classic spray/spark controls and
   remaining dialog parity, whole-original0–300s trajectories/handbook tasks open.
5. Update milestone/validation/handoff at coherent checkpoints, then run
   `python3 scripts/update_conversion_progress.py` (progress Markdown generated).
   Seven stable milestones remain; no justified overall percentage/hours estimate.

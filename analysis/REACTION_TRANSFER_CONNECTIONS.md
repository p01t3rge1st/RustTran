# Post-model reaction transfer and retained histories

Checkpoint: 2026-11-03. PCTran.exe SHA-256:
`b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389`.

## Completed producer

`rusttran/src/reaction_transfer.rs` translates the original coordinator body
0x51f8c6–0x51fc92, immediately after model0x526b40 and before the already ported
BFB8 thermal-source expression. It supplies current BFB4 transfer and its
BFCC/BFBC/BFE8 histories rather than requiring a cached transfer value.

The original branch gate is **Double node_fraction > Double0.01**, not a Single
comparison. At equality/below the entire block skips and preserves previous
transfer/history values; it does not overwrite BFB4 with zero. Once active, the
code computes material mass BFE4, fourth-power/linear temperature terms BFD0/BFD4,
updated BFCC history and the new BFE8 temperature. A negative temperature
_difference_ selects the original pair of Single1 rates, without an absolute-value
reinterpretation. The updated temperature must be strictly greater than Single1629
to enter transfer. Otherwise BFB4 becomes zero. Transfer clamps BFE8 to1629,
produces BFD8/BFB4 and accumulates BFBC. Native exponent0.3333 remains0.3333;
it is not replaced with1/3.

All original Single stores remain explicit rounding boundaries; Double inputs and
intermediates stay Double. Finite/range/singularity errors preserve the whole
original Rust state, including errors after intermediate history calculations.
The native reference additionally records the original numerical error branch
for one zero-rate boundary; Rust reports an error and rolls back. Original VB6
error UI and its partial-write behavior are not reconstructed.

## Authenticated bindings and startup adapter

| Input | Original binding |
|---|---|
| node_fraction | Double array0x54bd04 +0x38, element7 |
| material_masses | Doubles BD48, BD40, BD50, BD58, in that addition order |
| node_temperature | Double array0x54bd20 +0x38 |
| pi | Double0x54c020; initializer bits0x400921fb54442d11 |

`ReactionTransferInputs::from_initialized` maps the existing typed
`FreshInitializedState`: owned Double arrays/temperatures and current alternate
Double values, with original model Doubles for the remaining mass inputs. It
preserves binary64 values; it does not squeeze them into `NativeGlobals` Singles.
All110 existing model/IC bundles are checked: initial element7 is zero, therefore
the original skip branch leaves the initialized globals unchanged. Missing model
Doubles fail rather than becoming zero. This adapter does not implement the
alternate model's evolution or make the full initialized bundle a runnable plant.

Three values listed as missing in previous handoffs are **already recovered model
parameters**, not new unported producers: FCO2→C000, FH2O→BFFC and FDEC→C004.
`model_bindings.rs` loads them; the fresh bundles contain them. Their original
stores are0x4ce5ef,0x4ce532 and0x4ce6ac. Their loading should not remain on the
conversion backlog. BB08 was also already a startup constant.

## Integration and compatibility

Optional boxed `controls.reaction_transfer` runs before `containment_thermal`,
normal thermal/SG and late balance/integration. Thus the current BFB4 result feeds
BFB8; a test deliberately starts with stale BFB4 and confirms the changed energy
source. The selected stage's history is retained in globals across steps. Native
Double node inputs stay explicit until model0x526b40 is connected.

Old sessions omit the optional field and retain their serialized shape. Box does
not alter JSON. Native session-reference serialization now omits absent new
optional stages, as specified by serde; older optional fields preserve explicit
nulls. This fixes the reference's shape for a chain with omitted spray without
changing the recovered numerical calculations or old session format.

CLI: `reaction-transfer-step INPUT.json`. For the existing GUI session loader:

```sh
rusttran --session examples/gui-reaction-session.json --view live
```

This example is a synthetic sixteen-update supplied-state fixture, not original
IC startup or a handbook accident. Existing containment/Hydrogen/history adapters
consume its connected engine results. No new widget, X11 test, release package,
installer or Windows build was added. The installed binaries remain older.

## Native evidence and verification

- 206 standalone native numerical cases;110 active blocks and74 transfers.
  Double neighbors of0.01, negative/equal/positive temperature difference,
  transfer/no-transfer and timestep/history variations are covered.
- One additional native singular/error case is verified separately in Rust; it is
  not counted as a successful numeric output case in the colored report.
- Eight composed steps and two sixteen-step native-slice chains. One chain stays
  in the active/no-transfer path; another transfers in all16 steps with changing
  increments. Source, hydrogen, balance and plant integration remain connected.
- Six new Rust tests cover native equality, native errors/late rollback, skipped
  unread inputs, complete composed chains, stale-source replacement, save/resume,
  exact binary64 controls and the adapter for all110 initialized source pairs.
- Float outputs are compared within4 float32 ULP; Boolean decisions exact.
  Saved reaction-input Doubles are compared **bit-for-bit**, not cast to Single.

The oracle continuously executes original0x51f8c6–0x51fc92. PowerR8 runs original
installer DLL arithmetic with explicit x87 CW0x027f and scratch errno lookup.
FpR8 is a Double store/reload bridge; square roots use x87. The block contains no
COM/logging skip. This is still not a full Windows/application/model dispatcher
run, and the Windows FPU context remains unverified. The Rust port uses host
floating-point power; agreement is established for the tested probes, not all
possible extreme inputs.

**200 Rust tests and GUI/all-target Clippy pass.** The selected CLI report has
**216 cases /20,542 output checks, all passing**, separate from the native error
case checked in Rust. Results are in `latest-validation.json`, `SESSION_HANDOFF.md`, the
[small colored comparison](reaction-transfer-comparison/results.html) and
[recorded history](reaction-transfer-history/history.html). Logs are
`reaction-transfer-{native,composed-native,tests,clippy,comparison}.log`.

```sh
.tools/python/bin/python scripts/reaction_transfer_oracle.py
.tools/python/bin/python scripts/recovered_reaction_oracle.py
cargo test --manifest-path rusttran/Cargo.toml --features gui
cargo clippy --manifest-path rusttran/Cargo.toml --features gui --all-targets -- -D warnings
cargo build --manifest-path rusttran/Cargo.toml --bin rusttran-cli
.tools/python/bin/python scripts/compare_components.py --rust-cli rusttran/target/debug/rusttran-cli --families reaction_transfer recovered_reaction_step recovered_reaction_session --output analysis/reaction-transfer-comparison
.tools/python/bin/python scripts/run_session_report.py --state rusttran/examples/gui-reaction-session.json --steps 16 --cli rusttran/target/debug/rusttran-cli --output analysis/reaction-transfer-history
```

## Remaining earlier dependency

Post-model transfer/BFB4 and model parameter loading are now closed. Remaining
upstream work is the **actual evolution of Double node state and hydrogen
production** in0x526b40, including BF7C/BDF4 sources; its initializer alone does
not evolve those values. Core/severe routine0x503f50, full initialization/restore,
fault-level/protection dispatcher, classic dialog/control parity and whole-original
0–300s scenarios remain open. None of these component tests proves full PCTran
replacement. Do not reopen `Kiedy_skonczysz`.

# Containment balance and vessel connection

Validated 2026-11-03. Original PCTran.exe SHA-256:
`b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389`.

## Implemented

`rusttran/src/containment_balance.rs` ports the numerical coordinator body
0x5233c5–0x523f36, with saturated properties, vapor/liquid/gas inventories,
pressure floor, leakage/source rates, Single increments, two energy-balance
branches and the original gate/caller for `vessel.rs` procedure 0x5011b0.
Pressure, gas pressure, temperature and water level now evolve when the supplied
sources require equilibrium. The small-increment gate preserves the original
decision: skip only when |water increment| <= 2, |gas increment| <= 2 and
|energy loss| <= 1. The separate energy branch switches at |water increment| > 1.

The earlier caller feedback 0x5232ee–0x523358 computes wall heat 0x54bb0c and
snapshots the old temperature 0x54bb10 before spray. The balance returns the
new temperature difference 0x54b74c for the next update. A fixed supplied old
temperature would incorrectly accumulate differences across the session.

`RecoveredStepControls.containment_balance` selects this optional stage after
spray/fans, before stream/integration. Missing operands and arithmetic/solver
failures preserve the entire original step/session. Old sessions omit the
new field and retain the previous JSON shape. The standalone CLI command is
`containment-balance-step INPUT.json` (balance request, without coordinator prefix).

## Shared native state

- The spray outlet EBP-0x34 supplies the balance outlet temperature.
- The original supply caller 0x51df66 passes EBP-0x28 to procedure 0x510850;
  this is its already recovered `return_flow`. When selected, the current supply
  output overrides `other_return_flow` in the balance update.
- Native 0x52337d–0x5233a1 adds that flow to spray EBP-0x2c, rounds once to
  Single, and stores 0x54ba24. Both terms are included.
- Device/spray auxiliary state supplies shared COM 0x4a4[0].9. COM 0x530[0].9
  remains explicit; its physical identity has not been established.
- Event schedule times[2]/times[3] override stale balance times. The original
  0x49be80 executes in the reference and enables a source at exact equality.
- Fault level is a **Single** at array pointer 0x54b614 +0x3c, separate from
  I16 fault flags. Double 0x54bf7c and 0x54bdf4 remain explicit typed sources.
- The caller gas calculation uses Double 53.34 while the solver uses Single 53.54.
  Both recovered constants are preserved.
- Native 0x54bb48 is written twice; the second expression overwrites the first.
  Both calculations, their rounding and possible failures are preserved.

## GUI and recorded history

The existing classic Reactor Bldg meters PRB/TRB/LWRB now show the selected
balance's evolving values, converted with authenticated IC bindings. With that
producer omitted, those live readings remain absent. No stored IC fallback.
History/CSV/HTML append six series: containment pressure, temperature, water level,
water-mass increment, spray flow and spray heat. Existing columns retain order;
there are now 23 series. New series are absent if their producer is omitted.

`rusttran/examples/gui-containment-session.json` is a **synthetic short-session
fixture**, checked for four updates and save/resume; it is not original IC startup
or a verified full accident scenario. Load it through the existing session loader:

```sh
rusttran --session examples/gui-containment-session.json --view live
```

The GUI adapter/reset/history behavior is tested in Rust. Actual desktop widget
interaction was not rerun for this backend/reading change; earlier GUI interaction
evidence belongs to its earlier checkpoint. Dedicated classic spray controls and
all-original dialog parity remain open.

## Validation and reproduction

- 144 continuous native caller cases, including 84 actual numeric vessel calls.
  Cases cover pressure floor, event neighbors, signed rates, Double sources,
  both energy branches, solver gating thresholds and several temperatures/levels.
- Eight composed native-slice steps and two four-update chains. Shared controls
  deliberately conflict with fallback inputs; schedules and omitted supply/spray
  stages cover both current-producer bindings and explicit-input boundaries.
- Native integer/Boolean/iteration decisions exact; floats within 4 float32 ULP.
- Small CLI report: **154 cases / 11,359 output checks pass**.
- Full Rust GUI-feature suite: **187 tests pass**. Includes five balance tests and
  one new selected-producer live-reading/history/reset test.
- GUI/all-target Clippy with `-D warnings` passes.

The standalone oracle continuously executes original balance instructions and
the original numerical vessel callee. COM reads use explicit state; properties
use independent native prefixes, Single rounding/sqrt use x87 bridges. Execution
stops before original UI/error handling. x87 precision is explicitly 53 bits.
Composed steps exchange state between original slices rather than executing the
complete original Windows dispatcher. Whole-application equivalence is untested.

```sh
.tools/python/bin/python scripts/containment_balance_oracle.py
.tools/python/bin/python scripts/recovered_containment_oracle.py
cargo test --manifest-path rusttran/Cargo.toml --features gui
cargo clippy --manifest-path rusttran/Cargo.toml --features gui --all-targets -- -D warnings
cargo build --manifest-path rusttran/Cargo.toml --bin rusttran-cli
.tools/python/bin/python scripts/compare_components.py --rust-cli rusttran/target/debug/rusttran-cli --families containment_balance recovered_containment_step recovered_containment_session --output analysis/containment-balance-comparison
.tools/python/bin/python scripts/run_session_report.py --state rusttran/examples/gui-containment-session.json --steps 4 --cli rusttran/target/debug/rusttran-cli --output analysis/containment-balance-history
```

See the [small comparison table](containment-balance-comparison/results.html),
[short history](containment-balance-history/history.html), and logs
`containment-balance-{tests,clippy,comparison,native,composed-native}.log`.
The earlier full 24,672-case report and package binaries were not regenerated.

## Next boundary

The numerical balance and solver binding are now connected; do not list them as
wholly unported. Remaining work includes producing all upstream thermal/source
inputs (including BB08, B754, BFB8 and Double sources) from the recovered model,
complete fault-level/time evolution and initialization/restore. Dedicated spray
controls, model0x526b40 evolution, remaining protection and complete original
0–300s scenario validation are still open. This checkpoint is source/debug CLI;
installed binaries and installers remain at the earlier containment-fan build.

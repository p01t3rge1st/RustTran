# Containment thermal source and hydrogen burning

Checkpoint: 2026-11-03. Original PCTran.exe SHA-256:
`b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389`.

## Recovered code and data

`rusttran/src/containment_thermal.rs` translates the original source expression
0x51fc92–0x51fd6c and concentration/ignition/delayed-burning body
0x52059e–0x520986. The stage produces current reaction-energy source0x54bfb8,
hydrogen percent0x54bae4, interpolated ignition limit0x54bfac, burn heat0x54b754,
remaining inventory0x54bd78 and latch0x54bfa8. Conditional writes preserve earlier
state when the original branch does not update it.

The seven-point pressure/limit curve is recovered from the original initializer,
not inferred from physics. Instructions0x51c98a/0x51c998 authenticate EBX=Single20
and EDI=Single100 for trailing stores0x51d326–0x51d3c6. Data pointers0x54c038 and
0x54c054 belong to descriptors0x54c02c/0x54c048 used by the caller.

| Gauge pressure | 0 | 10 | 20 | 30 | 35 | 40 | 100 |
|---|---:|---:|---:|---:|---:|---:|---:|
| Limit (%) | 5 | 6 | 7.5 | 9.5 | 12 | 18 | 20 |

`HydrogenLimitCurve::default()` uses these exact values. JSON may omit
`hydrogen_curve` to select this authenticated default, or supply an explicit
curve. This does not claim completion of the whole fresh initializer.

The concentration conversion preserves original DLL PowerR8(30.48,3) at explicit
x87 53-bit precision: Double bits `0x40dba7362e90363c`. The reference executes
the DLL arithmetic; Rust retains its constant result rather than substituting
modern exponentiation at an ignition threshold.

## Decisions and retained state

- Ignition requires nonzero event flag4, latch exactly0 and concentration strictly
  greater than the interpolated limit. Equality does not ignite. Ignition stores
  the current containment pressure and writes the current clock to event time4.
- Ignition preserves previous burn heat; it does not release heat in that branch.
- With latch exactly1 and concentration below1%, extinguish: reset latch and heat.
  At exactly1% it follows the delayed-burning branch.
- Otherwise burning requires latch exactly1 and `Single(step + burn_time) < clock`.
  Equality does not burn. The branch writes heat=`Single(percent * 5000000)` and
  inventory=`Single(inventory * Double0.8)`. Percent remains the pre-burn reading
  until the next update, as in the original.
- Latch values−1/2 and a nonzero/negative enable flag preserve their original
  distinctions. Burn enable controls ignition; it does not separately disable an
  already active latch.

The optional `controls.containment_thermal` producer runs before normal thermal
transfer/SGs, matching the original coordinator ordering. Existing balance uses
its current BFB8/B754, not cached fixture values. Current schedule flag/time4
override stale thermal-control copies; sessions retain the returned ignition time
in both the controls and the shared schedule. Whole step/session updates remain
transactional, including a later balance failure after an ignition.

## Scope and remaining boundaries

Upstream C000/BFFC/BFB4/C004 reaction state and inventory production from the
alternate model remain explicit. This port consumes and burns supplied hydrogen;
it does not implement all mechanisms that generate hydrogen or corium state.
Double BF7C/BDF4 evolution, full fault-level/dispatcher and complete startup/restore
remain open. **BB08 was already a checked startup constant** in
`startup_primitives.rs`; older lists calling it an unported producer were wrong.

No original logging, color-setter callbacks, error UI or complete Windows dispatcher
is reproduced. The reference skips only log formatting0x5206e1–0x52086a and models
the color setter's successful HRESULT. Normal numerical/control paths and the
curve wrapper execute original instructions; native INTP prefixes evaluate explicit
curve values. x87 53-bit is a test context, not a verified Windows application FPU
setting. Whole original 0–300s accident scenarios remain unvalidated.

## GUI, history and example

The existing classic Hydrogen meter reads computed BAE4 only when this producer
is selected. History/CSV/HTML append hydrogen percent and burn heat: **25 series**,
older columns unchanged. Without this producer, the new readings/series are absent.
The raw BFB8 source remains available in JSON; its detailed physical source
bindings are not presented as a separately validated GUI quantity.

`rusttran/examples/gui-hydrogen-session.json` is a synthetic supplied-state example
checked through16 updates: ignition, ten burn updates and extinction. It is not
original IC startup or a validated handbook accident. The existing session loader
can load it; no dedicated classic spark/chemistry dialog was added.

```sh
rusttran --session examples/gui-hydrogen-session.json --view live
```

GUI adapter, history and Reset are tested in Rust; no new X11 widget/screenshot run
or installer/release rebuild was performed. Source/debug CLI is newer than the
installed containment-fan build.

## Validation and commands

- 335 standalone native-reference cases, including ignition/delay neighbors,
  exact1% extinction boundary, signed sources and unusual flag/latch values.
- Authenticated original curve initializer compared exactly with the Rust default.
- Eight composed steps and two sixteen-update native-slice chains, including a
  conflicting shared schedule. Each chain ignites, burns ten times and extinguishes.
- Six new Rust tests cover native parity, default loading, unused-state branches,
  invalid inputs, full burn cycles, shared timestamps, save/resume and rollback.
- An additional live-reading/history test checks the selected meter, positive
  then zero heat, missing-producer behavior and Reset.

**194 Rust tests and GUI/all-target Clippy pass.** The selected CLI report has
**345 cases / 26,830 output checks, all passing**. Final evidence is recorded in
`latest-validation.json` and
`SESSION_HANDOFF.md`; logs are `containment-thermal-*.log`. The small
[comparison table](containment-thermal-comparison/results.html) and
[recorded history](containment-thermal-history/history.html) are separate from
previous full reports and package evidence.

```sh
.tools/python/bin/python scripts/containment_thermal_oracle.py
.tools/python/bin/python scripts/recovered_thermal_sources_oracle.py
cargo test --manifest-path rusttran/Cargo.toml --features gui
cargo clippy --manifest-path rusttran/Cargo.toml --features gui --all-targets -- -D warnings
cargo build --manifest-path rusttran/Cargo.toml --bin rusttran-cli
.tools/python/bin/python scripts/compare_components.py --rust-cli rusttran/target/debug/rusttran-cli --families containment_thermal recovered_thermal_sources_step recovered_thermal_sources_session --output analysis/containment-thermal-comparison
.tools/python/bin/python scripts/run_session_report.py --state rusttran/examples/gui-hydrogen-session.json --steps 16 --cli rusttran/target/debug/rusttran-cli --output analysis/containment-thermal-history
```

Rust comparisons require integer/Boolean/iteration decisions exact, burn time
exact as binary32 and remaining numerical outputs within4 float32 ULP. They prove
these recovered blocks and their supplied-state composition, not whole PCTran.

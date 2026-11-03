# Containment spray: recovered controls and cooling

Validated 2026-11-03 against PCTran.exe SHA-256
`b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389`.

## Implemented scope

`rusttran/src/containment_spray.rs` translates the numerical/control body
0x50252b–0x5032be of procedure 0x502480. The original caller's sixteen pointer
arguments at 0x523306–0x523378 are replayed by the native reference harness.
Recovered behavior includes pressure/time activation, the activation latch,
manual pump overrides, checked I16 command addition, isolation command,
PSAT/HFLD properties, mode-dependent cooling and outlet-temperature clamp.

The optional `controls.containment_spray` stage executes before containment fans,
stream balance and integration. Sessions retain the returned actuator commands;
failed steps preserve the original state. CLI: `containment-spray-step INPUT.json`.
Existing sessions omit this optional stage and keep their previous JSON shape.

Three COM properties are shared with existing producers: auxiliary command
0x4a4[0].9 with primary devices, mode 0x51c.15 with supply, and exchanger command
0x554[0].0 with containment fans. The stage uses current preceding producer
outputs and the shared exchanger command, rather than stale duplicated inputs.
Collection 0x4f4's physical identity has not been established.

The returned temperature and flow are original caller locals EBP-0x34 and
EBP-0x2c. They are explicit output fields, not invented global aliases. In
particular, spray flow does not overwrite the combined source sum 0x54ba24.

## Evidence and repeatable validation

- 192 standalone original-instruction cases; threshold/time neighbors, latch
  values, manual controls, negative/partial commands, modes and cooling clamps.
- Eight composed native-slice steps with deliberately conflicting shared inputs.
- Two retained-state native-slice chains of four steps each, clocks within 0–300 s.
- All **202 cases / 10,424 output checks pass** through the debug CLI.
- **181 Rust tests pass**, including five spray tests covering native equality,
  atomic failures, unused-input branches, shared bindings and save/resume.
- Clippy with GUI/all targets and `-D warnings` passes.

Native instructions run in Unicorn with explicit COM reads/setters and x87
53-bit precision. PSAT/HFLD values come from independent native property slices.
Text/log formatting, COM callbacks, cleanup and original error UI are excluded.
Integer/Boolean outputs match exactly; Rust tests require activation time exact,
heat within 2 float32 ULP and other floating outputs within 4 ULP.

```sh
.tools/python/bin/python scripts/containment_spray_oracle.py
.tools/python/bin/python scripts/recovered_spray_oracle.py
cargo test --manifest-path rusttran/Cargo.toml --features gui
cargo clippy --manifest-path rusttran/Cargo.toml --features gui --all-targets -- -D warnings
cargo build --manifest-path rusttran/Cargo.toml --bin rusttran-cli
.tools/python/bin/python scripts/compare_components.py --rust-cli rusttran/target/debug/rusttran-cli --families containment_spray recovered_spray_step recovered_spray_session --output analysis/containment-spray-comparison
```

Small color table: [results.html](containment-spray-comparison/results.html).
Logs: `containment-spray-tests.log`, `containment-spray-clippy.log`,
`containment-spray-comparison.log`. The earlier full report remains unchanged
at 24,672 cases / 653,483 checks; the new targeted report is separate.

## Remaining boundary

This is source/debug-CLI work; installers and installed binaries were not rebuilt.
Spray does not yet have dedicated classic GUI controls. Full containment source
and mass/energy balance 0x5233c5–0x523f36 and binding of the recovered vessel solver
0x5011b0 remain open. Spray/fan heat alone does not produce a complete containment
pressure/temperature trajectory. Full initialization, event/protection dispatch,
alternate-model evolution and whole Windows application comparisons remain open.

# Containment fan cooling connected — 2026-11-03

This closes the recovered numerical/control body of `0x5034b0`, not the complete containment model or a complete PCTran scenario.

## Original evidence

- Source: `analysis/program/PCTran.exe`, SHA-256 `b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389`.
- REA/Ghidra evidence: [fan-cooling-decompile.json](rea/fan-cooling-decompile.json). The decompiler has type/flow warnings and includes subsequent control flow; the assembly and explicit emulation boundaries define this port, not assumed pseudocode function boundaries.
- Original caller pushes, `0x523383–0x5233c0`, independently authenticate nine pointers: pressure `0x54b544`, pressure threshold `0x54b2c4`, clock `0x54b40c`, activation time `0x54b450`, heat `0x54b750`, ambient temperature `0x54b160`, design temperature `0x54b2d0`, rated heat `0x54b2cc`, current containment temperature `0x54b548`.
- `seed_bindings.rs` identifies TFCL/PRB/TRB; `model_bindings.rs` identifies PFCL/QCL0/TDSN. No unbound containment temperatures are invented.
- `scripts/containment_fans_oracle.py` executes original instructions `0x503564–0x503cf2`. Only the text/log section `0x5035a0–0x50373f` is skipped, after the activation-time store. Numerical decisions, COM property reads, two automatic setters and all heat arithmetic run unchanged. It uses explicit COM property state and 53-bit x87 precision.

## Recovered behavior

Activation requires **pressure >= threshold and clock < saved activation time**. The timestamp becomes the current clock. Only fans 0 and 1 auto-start, only at exactly zero command and with their manual flag false. Fans 2 and 3 remain unchanged in this body. The four commands are summed with checked signed I16 arithmetic in native order 1,0,2,3.

The original calculates `(current-ambient)/(design-ambient) * rated_heat * fan_sum / 100`, rounds to Single, then applies the exchanger command `/100` and rounds again. Negative heat and commands outside 0–100 are preserved; the mathematical port does not impose new clamps. Singular temperatures, nonfinite values and I16 overflow fail transactionally in RustTran. The old Windows error UI is not replicated.

The optional `containment_fans` producer runs after the recovered primary/loop stages, before stream balance and integration. It returns its activation time and heat in shared globals. `RecoveredSession` retains automatic commands for subsequent steps and save/resume. Existing sessions without this producer keep their prior boundaries and JSON output shape.

**The full containment mass/energy balance and vessel call are still missing. Fan heat is produced and recorded, but this change alone does not evolve containment pressure or temperature.**

## GUI and data

- Classic fan symbols show authenticated `ICFanData` values in the stored IC view and retained fan properties in a supplied live session. Unavailable states remain unknown.
- Clicking a fan provides manual/percent commands; clicking its Heat readout controls the exchanger. The Simulation workspace has the same controls.
- The Heat readout uses `0x54b750 / HEAT_FACTOR` in MW only when the producer is selected; there is no stored-IC fallback.
- The history now has 17 series, adding native Btu/s heat as the last column so previous series order is preserved.
- `File → Load containment-cooling example` loads a separate explicitly synthetic sample. `gui-containment-fans-session.json` combines the previous synthetic supplied session with explicit inputs from the original-slice fan fixtures; it is not a fresh reactor start.

## Validation

- 720 standalone original-slice cases: pressure/time neighbors and equality, four signed commands, manual flags, partial/excess exchanger percentages, zero/negative heat.
- 32 composed original-slice steps before stream balance/integration, with the same recovered primary/supply/accumulator/SG pipeline.
- Eight eight-step native-slice chains, retaining automatic fan properties and activation times. All 816 new native evaluation samples (standalone + composed + chain steps) are within 0–300 seconds. [Clock bounds](containment-fans-clock-range.json).
- Five new Rust tests: standalone and composed/chain comparisons, late failure rollback, retained commands, live heat conversion/source gating and authenticated stored fan values.
- Full Rust suite: **176 tests passed**; Clippy with `-D warnings` passed.
- Full packaged CLI comparison: **24,672 cases / 653,483 output checks passed**, including the previous blocks. This is **760 cases / 44,976 checks added**. [Comparison log](containment-fans-component-comparison.log), [colour table](component-comparison/results.html).
- Actual X11/XTest interaction: classic fan command 75% + Step matches CLI exactly and produces positive computed heat. Setting the fan exchanger to zero stops heat removal and matches CLI. Existing heater/RCP/run/pause/reset/IC interactions still pass. [GUI results](gui-interaction/results.json).
- Linux glibc 2.28 portable build and Windows GNU EXE cross-build passed. Windows runtime GUI and complete original scenarios remain unvalidated.

- Packaged release smoke tests passed, including fan command retention, exact 3+5 versus 8-step resume and all 17 CSV series. [Smoke results](containment-fans-release-smoke.log). [Synthetic 75% fan history](containment-fans-history/history.html).

## Next dependency

Continue with containment spray `0x502480`, source/balance calculations around `0x5233c5–0x523f36`, and the authenticated binding to already recovered vessel solver `0x5011b0`. Auxiliary flow locals, gas/thermal state and remaining model inputs must retain explicit provenance. Do not label fan cooling `0x5034b0` as entirely unported again; COM callbacks, logs and original error UI remain excluded.

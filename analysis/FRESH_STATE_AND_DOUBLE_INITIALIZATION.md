# Recovered fresh state and six-node Double initialization

Validated 2026-10-21. This closes the previously omitted numeric initializer
`0x526200` through `0x5269d2`; its later COM/UI branch is excluded. Evolution
`0x526b40`, complete startup/restore dispatch and whole-plant validation remain open.

## What is connected

`alternate_init.rs` preserves Double precision independently of Single globals.
Original conversion slices `0x4ce082–0x4ce0ae` and `0x4ce3a8–0x4ce3d4` produce
`0x54bd40` and `0x54bd30` without an intermediate Single cast. Four model Doubles
supply the remaining masses. The original six-node initializer creates:

- 33 Double scalar writes, one Single reset, and four I16 writes;
- 12 owned eight-element Double arrays, including six active nodes and two
  boundary slots; all slots are written and compared against original execution;
- the original zero Variant as type 5 (Double), separately represented;
- two fresh temperature stores at original pointer `0x54bd20` offsets 0x30/0x38,
  executing the original Fahrenheit-to-Celsius conversion after initialization.

`scripts/alternate_init_oracle.py` runs the original continuous body, loops and
constant writes with 53-bit x87 precision, seeded with nonzero sentinel array
storage. Only the known Double-zero Variant move is bridged. Native instructions
after the numerical body (COM/UI) are not executed. 240 varied cases pass exact
binary64/array comparisons in Rust. Complete Windows floating-point context is
still unverified.

`startup_clock` implements `DT / 0.001`, floor, and signed I16 `0x54b700`, with
explicit range errors. The oracle executes actual `msvbvm60!__vbaR8IntI2` code
in 240 valid-input cases, including negative fractions and I16 boundary values.
The DLL restores x87 control word 0x133f; this side effect is documented, not
emulated as process-wide Rust floating-point state. Subsequent arithmetic is
outside that isolated clock test. Existing numeric slices retain their stated
precision contexts, and this is not a whole-initializer instruction replay.

## Fresh state assembly and GUI

The former thermal startup API still returns its 130 Singles/15 flags for
compatibility. A new shared assembly preserves the complete recovered store:
290 Singles and 28 integer fields for each of the 110 source model/IC pairs,
plus the owned Double initializer state and untouched model Double inputs.
Loop reference outputs formerly used only as temporary initialization operands
are retained. Fresh control histories and the integrator alias are included.
The fault flag remains an explicit input; it is not inferred from unrelated IC
fields. The complete runtime histories and remaining upstream models are not
filled with zeros or copied from synthetic fixtures.

The GUI's **Initialize thermal systems** uses this assembly. **Initial SG failure
selected** explicitly selects the recovered fresh-history branch. **Save
initialized state** exports the typed state, including Double arrays. The window
states that this is not a runnable session or original PCTran save file. Existing
IC snapshot values are preserved. A real Linux window was captured at
[fresh-state-gui.png](fresh-state-gui.png). Actual Simulation widget tests were
rerun and still match CLI state after manual heater control.

JSON decoding now enables serde_json `float_roundtrip`. Without it, some Double
inputs/array values differed by one binary64 ULP after decoding. Tests verify
that saved/reloaded Double state is unchanged; it is never converted to f32.

## Reproduction

```sh
.tools/python/bin/python scripts/alternate_init_oracle.py
.tools/python/bin/python scripts/startup_clock_oracle.py
.tools/python/bin/python scripts/fresh_initialized_state_oracle.py
cargo test --manifest-path rusttran/Cargo.toml --features gui
rusttran-cli alternate-init rusttran/examples/alternate-init.json
rusttran-cli fresh-initial-state rusttran/examples/fresh-initial-state.json
rusttran-cli native-stages rusttran/examples/startup-clock.json
```

The composed-state oracle checks all 110 model/IC combinations using authenticated
field conversion/reference/thermal fixtures and independent executions of the
history and Double initializer. These are component/composed comparisons, not
original Windows scenario runs. Current validation: 170 Rust tests,
23,912 component/composed cases, 608,507 output checks. The colored report is
[component-comparison/results.html](component-comparison/results.html).

## Acceptance boundaries still open

A complete fresh/restored dispatcher, original save loading, remaining runtime
histories/arrays, five unresolved IC field bindings, model evolution, remaining
source/containment paths, full fault/protection scheduling and complete Windows
0–300-second scenarios still require work. Saving initialized state is not
presented as full simulator readiness. `Kiedy_skonczysz` remains unopened.


## Live readings on the original-style mimic

With a session loaded, choose **View → Live simulation mimic…**. This keeps the
Simulation workspace active and draws the familiar layout from computed session
state. `live_readings.rs` adapts nine pressure/temperature/level/flow fields using
inverse conversions from authenticated IC bindings. Missing fields, reactor
power/rod/containment values and unconnected device states have no IC fallback;
they render as —. Units remain those of the original schematic. A dedicated test
checks unit conversion, updates and absence of unrelated stored IC values.

The same diagram renderer consumes either the snapshot Presentation or the live
adapter; opening the live window never replaces the stored snapshot. Details
identify live vs stored values. XTest clicks open the actual window, captured at
[gui-interaction/live-mimic.png](gui-interaction/live-mimic.png). Existing run,
pause, reset and manual-control equivalence checks still pass.

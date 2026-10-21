# Fresh primary startup and control-cycle connection — 2026-10-20

New-start branch `0x51b357–0x51b432`: 11 Single outputs and ten I16 flags. Initializes loop flows from reference fractions, clock and flow state, vessel volumes, temperature, pressure and specific volumes. Zero flag stores are backed by original `EDI=0` at `0x51b00c`. This explicitly selected branch must not overwrite restored IC history implicitly.

Connected inventory `0x51b357–0x51b6cf`: the same original machine continues into the previously ported level, vapor fraction and mass calculations. Specific volumes come from original property prefixes. 240 standalone branch and 240 connected cases pass (2 ULP maximum).

Shared GUI/CLI primary startup backend: model/operating-point reference inputs → new-start primary branch → level/mass → pressure-reference/level-interlock initialization. All 110 model/operating-point pairs pass against original numerical slices. This computes a fresh primary-system result; it does not claim complete plant initialization. It does not silently replace the displayed IC schematic.

GUI: Code Control → Initialize primary system; choose the model and calculate. The window displays pressure, temperature, loop flows, liquid/vapor fractions, inventory and pressure reference. CLI `--initialize-primary MODEL` opens the populated window. Screenshot smoke test ran on the available Linux display and exited successfully: `primary-initialization-gui.png`. GUI screenshots do not validate transient evolution.

Control-cycle connection: coordinator pressure signal → primary numerical core with spray/heaters → original post-balance feedback. The original frame still contains the phase-updated local `-0x78`; it is used directly for feedback, removing the earlier manually supplied local at this connection. 160 composed original-slice cases check 38 outputs each. Late feedback failure rolls back pressure signal, controls, balance and feedback together. Other plant updates and integration are deliberately outside the cycle.

CLI commands: `fresh-primary-init`, `fresh-primary-inventory-init`, `fresh-primary-startup`, `primary-control-cycle`. Explicit recovered stages expose the corresponding numerical constructors/cycle. Examples are under `rusttran/examples`.

Remaining: full initializer/restore dispatcher, history and remaining upstream properties, device/event/protection producers, complete timestep coordinator and full GUI trajectories. See `END_TO_END_VALIDATION.md` for final validation scope. Existing component counts are not a whole-plant completion percentage.

# Pressure-control initialization and feedback — 2026-10-14

Correction to earlier evidence: `0x51b9d4` does **not** write zero to `0x54ba4c`. ECX is loaded from model nominal pressure `0x54b124` at `0x51b988`. Fresh-start reference is nominal model pressure. Therefore the authenticated coordinator signal is actual pressure minus this reference. Dynamic changes of the reference remain separate event/UI work.

Fresh initialization numerical slices:

- `0x51b988–0x51b98e`, `0x51b9d4–0x51b9da`: exact copy of nominal model pressure into the reference.
- `0x51c0ec–0x51c0f8`, `0x51c10b–0x51c111`: Single(liquid level * 100) into the spray level interlock. The constant at `0x4028c8` is exactly 100.

Post-balance feedback slices:

- `0x50d113–0x50d137`: copy exchange local `-0x78` to `0x54b738` and refresh level percent `0x54b6c0`.
- `0x50d1be–0x50d1f8`: floor coolant temperature at model `0x54b160`, then floor negative level percent to zero. Original floor does not cap values above 100.

300 initializer and 320 feedback cases execute the original stores/comparisons. All outputs match binary32 bits exactly. Initialization commit is atomic on invalid/overflow operands. Fresh model-pressure/level assignments are not used to overwrite restored IC histories implicitly.

CLI: `pressure-control-init`, `primary-control-feedback`. Shared-state recovered stages: `pressure_control_init`, `primary_control_feedback` (explicit authenticated upstream `local_78`), followed/preceded by appropriate stages in caller-defined order. These are construction APIs; the full original coordinator is still incomplete. Feedback is not silently added to old primary-core reference behavior.

Remaining: recover all initializer branches and histories, dynamic reference changes, attach exchange trace to feedback in the complete timestep, verify coordinator ordering and connect complete simulation to GUI. No whole-plant or Windows GUI trajectory is claimed.

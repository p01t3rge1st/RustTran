# Connected numerical updates — 2026-10-20

Implemented and checked:

- Original coordinator `0x51dfdd–0x51e09f`: source-flow sum gated at Single(g54b6e0 - 10), and phase-1/phase-2 critical fluxes. 300 native-prefix cases.
- Relief numerical caller binding: original argument pointers map the global pressure/areas/level/phase/fluxes to the recovered discharge, writing `0x54b6a8`, `0x54b73c`, `0x54b4d0`. The mixture threshold is the unconditional native `0x50f6db` literal, bits `0x3f7ae148`. 300 composed source/discharge cases. Automatic valve commands are still explicit, not reconstructed by this binding.
- Post-discharge `0x5103d3–0x510689`: below cumulative-state threshold 5000, clear the downstream flow/control state. Otherwise copy current discharge and select the original command/log branch only when the previous flow is strictly > 1 and the signed-I16 UI state is zero. 240 boundary cases. The controlled UI object's physical identity remains unresolved. `opened_event` reports entry into the original logging branch; the original UI/log COM calls are not replayed.
- Connected update: current pressure properties → sources/relief/tail → both SG numerical exchanges (or explicitly supplied six SG derivatives) → primary pressure/control/balance/feedback → stream derivative pair → all 14 integrator states, previous derivatives and event update. Missing data or late errors roll back the whole update.
- Explicit runs require contiguous Single timestamps and commit atomically across every update. They do not implement the original scenario scheduler or all device/source producers.

Reference coverage: 32 updates with supplied SG derivatives; 32 updates computing both original SG exchanges; eight three-update history chains with supplied derivatives; four three-update chains computing SG exchange each time. Chain clocks are 99.75, 99.875 and 100 seconds with step 0.125; the timed-event boundary and persistent control/history state are exercised. Remaining transfer/control/device/source inputs are explicit. These are composed native numerical-slice comparisons, not original application trajectories or a validated whole-plant model.

Reference machines independently execute original source, relief, primary, SG, stream and coordinator integration slices. Scalar state passes between machines where documented. The Windows application FPU/runtime context remains unverified. Existing property/helper and DLL arithmetic qualifications still apply.

APIs/examples:

- `primary-sources examples/primary-sources.json`
- `primary-relief-step examples/primary-relief-step.json`
- `relief-tail-state examples/relief-tail-state.json`
- `recovered-primary-step examples/recovered-primary-step.json`
- `recovered-primary-step examples/recovered-exchange-step.json`
- `recovered-primary-run examples/recovered-primary-run.json`
- `recovered-primary-run examples/recovered-exchange-run.json`

Exactly one SG producer is required: `steam_derivatives` (six current values) or `steam_phase_flags` (two flags selecting the recovered exchange calculation). Stale current derivative fields in the store cannot silently replace the explicit producer. Both branches still require the appropriate upstream inputs.

# Process-birth storage is a separate layer

`process_storage_fixtures.json` records original loader-mapped PE bytes for 18 Single fields: 14 previous derivatives, accumulators `0x54bba0`/`0x54bf98`, and flow-history fields `0x54b6d8`/`0x54bf9c`. All are zero in this image. This check reads mapped bytes; it does not execute application initialization and does not prove fresh-start/Reset/restored-IC values.

Stage `new_process_storage` initializes this explicit layer and refuses to overwrite any existing field. Stage `integrator_alias` executes the authenticated final alias semantics `0x54b4f0` → `0x54b688` (original `0x51c0f8`/`0x51c12e`). Across all 22 condition records, image storage plus loaded IC values and the alias supplies 14 integrator values/history slots. This is a construction test, not a replacement for the remaining startup and restoration dispatcher. The thermal GUI calculation is unchanged and does not silently apply process-birth storage to existing scenarios.

Next: connect remaining pump/valve/feedwater automation and thermal-transfer/event/source producers; finish original fresh/restored initialization paths; only then use the complete timestep for GUI transient controls and compare full 0–300 second PCTran trajectories.

Current extension: optional `references` and `devices` producers now execute
before primary source/relief preparation, following the native coordinator order.
They calculate dynamic references, letdown, charging and high-pressure injection
instead of requiring those fresh flows as seed inputs. Device controls returned
in `primary_devices` must be retained by the caller. The actual RCP, supply-tank,
accumulator and feedwater/event dispatch between these calls remains incomplete;
its scalar inputs are still explicit. See `PRIMARY_DEVICE_CONNECTIONS.md` for
32 additional composed checks and the expanded 79-Single thermal initializer.


Optional `rcp` now connects RCP switch/target/timestamp production and both flow
updates before source/relief/SG calculations. The event time remains explicit.
See `RCP_CONTROL_CONNECTIONS.md`; RCP control production is no longer a required
external scalar producer when this option is selected.


## Optional SG initial control producer

`steam_controls` runs the recovered initial control prefix before each computed
SG exchange, in A-then-B order. Use `steam_phase_flags: [0,1]`: despite the legacy
field name these are the caller's SG selectors, not mixture phase flags. The
returned two control outputs carry the checkbox state for the next update. Both
calls share one failure time, the native transition timestamp and checkbox.
Fresh `0x54ba90/0x54ba94` HGAS values are produced in the update and consumed by
the stream balance; they need not be supplied as cached inputs.

32 additional composed references run reference/device/RCP/SG/primary/integration
slices. Failure during B or final integration rolls back all changes. The optional valve/outflow producer below now covers 0x509213–0x50a8a6;
auxiliary feedwater control 0x50a8a6–0x50ac31 is now another optional producer
(see the latest section below). This
is not a continuous native full timestep. Example:
`recovered-primary-step examples/recovered-steam-control-step.json`.
[Source bindings and limitations](STEAM_CONTROL_CONNECTIONS.md).


## Optional SG valve/outflow producer

`steam_valves` adds 0x509213–0x50a8a6 before each final exchange, preserving
A-before-B shared controls, fault flow, opposite crossflow sign, safety-valve
hysteresis and inventory/heat corrections. Both base flows are now calculated
inside the update; 32 additional native-slice comparisons exercise this producer
with initial SG controls and primary/integration. When both producers are
enabled, `steam_valves.feedwater` supplies the initial prefix's command value.
Returned command state must be retained for the next update.

The later auxiliary SG producer below closes the feedwater gap. Continuous
execution also corrects the earlier inference about a different ESI pointer:
0x50a7ff already selects total outflow. Both branches use that total flow.
This is still not a complete original plant timestep.


## Auxiliary SG stage and continuous body validation

Optional `steam_auxiliary_percent: [A,B]` now closes the remaining SG gap after
valves and before each exchange. It requires `steam_valves` and native computed
selectors [0,1]. Both active and skipped auxiliary branches use total outflow;
the earlier inference about retaining a base-flow ESI pointer was incorrect
because 0x50a7ff already updates ESI. Continuous native execution verifies this.
32 more composed updates check primary/integration connection and rollback.
The full SG stage is also available separately via `steam-system-step` and
`steam_system`, with 320 continuous body references. Other plant producers and
complete initialization/events remain incomplete. See STEAM_SYSTEM_CONNECTIONS.md.


## Late startup producers

The shared `fresh-thermal-startup` / Presentation backend now includes late
reference/property initialization, returning 105 Singles and 14 flags for all
110 model/IC pairs. This supplies more authenticated inputs to subsequent steps;
it does not automatically initialize every missing state or command. Separate
`fresh_control_history` handles the 11 original fresh control-history stores
with an explicit fault flag. The integrator's previous derivatives, external
Double state, restored/event/array dispatch and complete plant initialization
remain separate. See LATE_THERMAL_INITIALIZATION.md.


## Optional native event-array bindings

`event_schedule` supplies event times +0x18/+0x20 to optional RCP/SG producers
and the original SG malfunction entries +0x10 and +4/+6. Standalone duplicated
inputs are overridden in a local control copy. Bound values are returned as
`event_bindings`; unrelated shutdown/protection inputs remain explicit. 32
additional references restore controls/times first, then bind those arrays
through the recovered numerical update. Final integration failure rolls back
the update; restoration is a separate atomic operation. Full saved-file loading
and original event dispatch remain incomplete. See RESTORED_CONTROLS_AND_EVENTS.md.

## Current normal thermal transfer producer

Optional `normal_thermal` closes the cached heat/level boundary for native mode 0.
After source/relief and before the SGs it executes thermal driving, the original
A-reference-to-B copy, and A/B transfers in order. Event flag 7 and time 8 bind
this producer when a schedule is supplied. External modes are rejected; omitted
options retain the existing explicit-input API. Missing B operands and later
failures roll back the whole step. The fresh backend also now returns the early
thermal-driving coefficient and factor (107 Singles/14 flags for 110 pairs).
See [CONNECTED_THERMAL_TRANSFER.md](CONNECTED_THERMAL_TRANSFER.md).

## Accumulator source producer

Optional `accumulator` runs the joined activation/discharge update after RCP and
before primary sources. It supplies current `0x54b804` rather than requiring a
cached accumulator flow. Five Single states, the I16 latch and explicit valve
properties are returned; caller valve state must be retained. Atomicity includes
post-activation numerical and later integration errors. The supply-tank dispatcher
between the original RCP/accumulator calls remains incomplete and explicit.
See [ACCUMULATOR_SYSTEM_CONNECTIONS.md](ACCUMULATOR_SYSTEM_CONNECTIONS.md).

## Supply modes and stateful command feedback

Optional `supply` executes original injection/recirculation/cooling before the
accumulator and source sum, returning current heat/flow/enthalpy and mode commands.
`RecoveredSession` retains all implemented actuator writes across steps. Primary
heater/spray commands are captured in the primary phase before corrections and
integration; optional `capture_control_commands` exposes them without changing
old single-step responses. History export runs the actual engine and records
outputs. Full initialization, remaining source/transport routines and GUI are
still separate. See SUPPLY_SYSTEM_CONNECTIONS.md and RECOVERED_SESSION_CONNECTIONS.md.

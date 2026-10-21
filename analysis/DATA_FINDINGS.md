# PCTran database and document recovery

Evidence is the supplied installation, not a substitute physics model. Run `python3 scripts/export_databases.py` after unpacking the three downloaded mdbtools packages into `.tools/mdb` with `dpkg-deb -x`. The script only reads the source databases. CSVs retain original headers, table names and numeric text produced by mdbtools. Empty fields may represent NULL or empty text; CSV export alone does not distinguish those cases. Binary fields use hexadecimal output.

## Extraction completeness

| Database | Tables | Rows |
|---|---:|---:|
| BackData.mdb | 23 | 438 |
| DoseData.mdb | 1 | 0 |
| ListData.mdb | 23 | 1024 |
| OptData.mdb | 4 | 14 |
| PlotData.mdb | 2 | 93 |

All 53 tables exported with successful exit codes. `mdb-schema` emitted `No MSysRelationships` for DoseData and PlotData, with exit code zero; those warnings are retained verbatim under `failures` in the metadata, even though no table export failed. The two empty time-series tables (DoseData/ListDS and PlotData/PlotData) provide columns but no behavioral traces. Every source MDB and exported CSV has a SHA-256 in `data/manifest.json`; each database directory also has `schema.sql` and `metadata.json`. Total recovered table rows: 1569.

## Configuration and initial conditions

`ListData/BasicData.csv` contains five configurations: SET 1 `W 3-Loop TPC #3`, SET 2 `Chasma NPP1`, SET 3 `Chasma NPP2`, SET 4 `Chasma NPP2 PNRA`, SET 5 `W 2-Loop`. SET 1 stores POWER=2705, P0=158.2, T0=309.14, WTR0=85, CHG=45 and PSV=85. Row order is 4, 2, 3, 1, 5: always select using SET, never row index. Units of every BasicData field require tracing the executable; names alone are insufficient.

`ListIC` has 13 menu records. `ICThermoData`, `ICCoreData`, and the equipment/control tables have 22 IC records: keys 1 through 20, 22 and 23. Thus menu records are not a complete inventory of recoverable snapshots. IC 21 is absent. BackData has different and partly empty contents and must not be treated as an identical copy of ListData. In particular BackData/ListIC and BackData/ICThermoData are empty while several other tables have 36 records.

All 22 ListData/ICThermoData records store DT=0.5. TimeStep varies and can be 31457, so it is not safe to equate that field with DT. IC1 stores POWR=PWR0=1, P=158.2, TAVG=309.1, BETA=0.0075, PPM=2100. IC3 stores BETA=0.0055. State flags must preserve their raw values until executable interpretation is established.

There are discrepancies between menu summaries and actual state: ListIC IC1 RC Press=155 and Tavg=306.9, while ICThermoData IC1 P=158.2 and TAVG=309.1. ListIC IC6 has Description `75% POWER EOC` but Power=100.33 and TimeInLife=BOC. These are source inconsistencies; do not silently correct them.

## Malfunctions, replay and freeze

`ListMalf` lists 20 malfunctions and their criteria. IDs 1–4 are coolant/steam line breaks with `% of 100 cm^2`; IDs 10–11 are tube ruptures with `% of 1 full tube rupture`; IDs 12–13 describe rod withdrawal/insertion; IDs 17–19 cover fuel failure/handling. IDs 5–9 have `(Not Used)` criteria despite distinct descriptions. Preserve all descriptions and source spellings.

`ICMalfData` contains 440 rows (22 ICs × 20 malfunctions), with DelayTime, RampTime, FailureFraction and Status. Status is 0 in 404 rows and 1 in 36. FailureFraction includes -100, 100, 500, 600, 1000, 2000 and 3000; assuming a universal 0–100 range would discard real source values. RampTime is 0 in 427 rows and 3 in 13 rows. These fields establish scheduling inputs, but do not establish how the executable integrates failure ramps.

`ReplayData` has 52 saved UI actions with target control, index, capacity, disable state, time and delay/ramp inputs. It is useful for recovering scenario workflows, not numerical output comparison. `PresetFreeze` has 140 saved predicates: 80 use `>` and 60 use `<`. Example: IC16 TIME > 30000 and P > 200. `TempPresetFreeze` adds Active and Met fields. A strict numeric predicate evaluator can be independently ported; exact evaluation timing and handling of missing variables still need executable evidence.

## Variables and radiological data

`PlotData/ListPlotVariables.csv` contains 93 labels, symbols and units, including TIME/sec, TAVG/°C, WRCA/t/hr, PSGA/bar and QMWT/MW. Use these as grounded UI variable labels. They do not prove equivalence with every similarly named database column. `PlotData/PlotData.csv` is empty, so no simulation trajectories were recovered.

`IsotopeData` contains 52 rows with ISTP, FSIV, GAP, HL, EG, CONV, CNRC0, CNSG0 and beta. For example I131 has HL=193.2. Units and the implemented decay/transport equations must be established from executable code or other explicit documentation before porting. `DoseData/ListDS.csv` is empty.

`OptData/PCTran Options.csv` has three settings rows. Each TimeScreenOut is 0.5 and TimePlotOut is 1; TimeBackOut is 120 for set1 and 60 for sets2/3. Saved preferences are available for faithful output scheduling once scheduler semantics are traced.

## Verification document limits

`docs/Verification_U3LP.txt` identifies a PCTRAN/U 3-LP verification report, version 4.0.4, February 2001. It describes a steam generator tube rupture case with WTR0=114.5 t/hr and CHG=45 t/hr, PSV=81 kg/cm² and an approximate reactor trip near 300 seconds. The printed transient report records low pressure at 278.0 sec (132.2 kg/cm²) and reactor scram at 278.5 sec. The current database SET1 has WTR0=85 and PSV=85: the document case is not the current default configuration. The report itself says its DNBR correlation is invalid after reactor coolant pump trip/natural circulation. These details are validation leads, not a complete model specification. The text extraction does not recover plotted curve samples.

## Small grounded Rust functionality

1. Import and expose complete configuration, IC, malfunction and plot-variable records with preserved keys and units. Validate recovered counts and selected known values against CSV fixtures.
2. Evaluate the observed freeze predicates with strict `<` and `>` and report which predicate matched; keep dispatch/timing unspecified until traced.
3. Load replay action records in numerical Time/ActionID order while preserving control identities and values. Do not infer plant response from replay inputs.

A reactor dynamics solver, steam property correlation, isotope decay step or malfunction ramp equation cannot be claimed recovered from these databases alone.

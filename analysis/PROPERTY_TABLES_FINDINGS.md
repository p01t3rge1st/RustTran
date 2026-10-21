# Native property tables

Extracted from straight-line native MOV initialization, without executing PCTran. Values preserve original IEEE754 binary32 bit patterns. Array descriptors contain the data-pointer field at +0x0c. Scientific labels and imperial units are inferred from values and callers.

| Name | Descriptor VA | Data pointer VA | Count | First | Last |
|---|---|---|---:|---:|---:|
| saturation_temperature | 0x54b374 | 0x54b380 | 44 | 60 | 680 |
| saturation_pressure_44 | 0x54b390 | 0x54b39c | 44 | 0.256099999 | 2708.6001 |
| saturation_pressure_68 | 0x54b358 | 0x54b364 | 68 | 0.256099999 | 2700 |
| saturated_vapor_specific_volume | 0x54b33c | 0x54b348 | 68 | 1207 | 0.111939996 |
| auxiliary_grid | 0x54b3ac | 0x54b3b8 | 16 | 0 | 2800 |
| auxiliary_curve_1 | 0x54b3c8 | 0x54b3d4 | 16 | 0 | 11560 |
| auxiliary_curve_2 | 0x54b3e4 | 0x54b3f0 | 16 | 0 | 6940 |

`0x49bde0` interpolates temperature44 → pressure44. `0x49beb0` interpolates pressure44 → temperature44 (TLIQ inference). `0x49be30` interpolates specific-volume68 → pressure68; `0x49c190` interpolates pressure68 → specific-volume68. Directions follow actual INTP argument order confirmed by reverse-order stack pushes and REA pseudocode in analysis/rea/property-wrappers.json. Address 0x49c180 is within VFLD tail/padding, not the inverse wrapper entry. HFLD, HGAS and VFLD themselves use polynomial coefficients, rather than these tables.

Each JSON entry includes initializer instruction VA, data-pointer load VA, source instruction VA, exact store instruction bytes, and float bits. Register constants reused across stores are tracked through MOV instructions. All 272 table slots must be assigned exactly once in index order coverage; missing values fail extraction.

Run `python3 scripts/extract_property_tables.py`. The native initializer disassembly is preserved in `analysis/property_tables_disassembly.txt`.

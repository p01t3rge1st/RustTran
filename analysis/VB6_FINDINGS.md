# VB6 metadata findings

Binary SHA256: `b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389`.

VB5! header file offset `0x4e38`, ProjectData `0x404eec`, ObjectTable `0x419e08`. 41 objects.

## Procedure addresses from name literals

Names below are UTF16 BSTR literals, referenced from code that assigns the current procedure name. Entry addresses are the nearest preceding native VB6 stack-frame prologue; confirm against disassembly before treating these as full signatures.

| Name | BSTR VA | Reference instruction | Entry candidate |
|---|---|---|---|
| DECAY | 0x41f484 | 0x49a6f8 | 0x49a4f0 |
| EULER | 0x41f494 | 0x49aa35 | 0x49a830 |
| HFLD | 0x41f4a4 | 0x49acfd | 0x49ab70 |
| HGAS | 0x41f4b4 | 0x49b02c | 0x49ae10 |
| HLIQ | 0x41f4c4 | 0x49b25c | 0x49b140 |
| INTP | 0x41f4d4 | 0x49bcb3 | 0x49b430 |
| VFLD | 0x41f500 | 0x49c072 | 0x49bf00 |

## Objects

| Object | Declared methods | Retained names |
|---|---:|---:|
| frmError | 2 | 2 |
| frmMalf | 5 | 5 |
| frmOptions | 5 | 5 |
| frmPlot | 39 | 39 |
| frmPlotFormat | 7 | 7 |
| frmPlotTitle | 3 | 3 |
| frmPlotVarSel | 5 | 5 |
| frmPrintReports | 7 | 7 |
| frmReport | 11 | 11 |
| frmReportOptions | 6 | 6 |
| frmSavePlotData | 4 | 4 |
| frmSplash | 13 | 13 |
| MainModule | 3 | 0 |
| CommonCalculations | 17 | 0 |
| frmDemandEntry | 4 | 4 |
| frmSaveDoseData | 4 | 4 |
| frmBackTrack | 5 | 5 |
| frmInitCond | 6 | 6 |
| PlotControl | 6 | 0 |
| frmPlotScales | 9 | 9 |
| frmPlotDisplayOptions | 4 | 4 |
| DatabaseControl | 10 | 0 |
| frmPTPlot | 17 | 17 |
| frmEditData | 11 | 11 |
| frmPTPlotOptions | 8 | 8 |
| frmAbout | 8 | 8 |
| frmReplay | 5 | 5 |
| frmReplayNew | 7 | 7 |
| Common | 1 | 0 |
| ICActions | 14 | 0 |
| modReplay | 11 | 0 |
| Mimic | 24 | 0 |
| SystemCalculations | 24 | 0 |
| frmPresetFreeze | 10 | 10 |
| PresetFreeze | 3 | 0 |
| Computations | 4 | 0 |
| frmMalfEdit | 4 | 4 |
| CoreMelt | 10 | 0 |
| frmDose | 32 | 32 |
| frmMain | 104 | 104 |
| frmNewIC | 8 | 8 |

Module method names are absent (`lpMethodNames=0`). Most `ObjectInfo.lpMethods` values are non-file-backed runtime heap pointers and method counts are zero, so a descriptor-only procedure address mapping would be misleading. Form names are retained in public descriptors. Native names above instead use independently observed BSTR references.

## Source and reproducibility

[python-vb structure definitions](https://github.com/williballenthin/python-vb/blob/master/vb/__init__.py); a snapshot is preserved at `analysis/sources/python-vb-structures.py`.

Run `python3 scripts/inspect_vb6.py`. The extractor reads the executable and writes only analysis artifacts; no target modifications.

## Optimized helpers

TLIQ and REG literals have no absolute references. Actual INTP arguments were confirmed by reverse-order x86 stack pushes and REA pseudocode in analysis/rea/property-wrappers.json. Helper 0x49bde0 interpolates temperature -> pressure (x descriptor 0x54b374, y 0x54b390), and is called by HLIQ before HFLD. Helper 0x49beb0 interpolates pressure -> temperature and is the inferred TLIQ. Helper 0x49be30 interpolates specific volume -> pressure (x 0x54b33c, y 0x54b358); helper 0x49c190 reverses this mapping. Address 0x49c180 is within the preceding VFLD tail jump/padding, not the wrapper entry. Helper 0x49be80 returns a threshold-dependent 0 or 1.

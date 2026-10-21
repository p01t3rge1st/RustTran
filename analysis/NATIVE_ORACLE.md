# Original numerical prefix oracle

Run `.tools/python/bin/python scripts/native_math_oracle.py`. Local dependencies: `unicorn`, `pefile` installed only in `.tools/python`. Output: `native_math_fixtures.json` with 98 cases, source executable SHA-256, original instruction address traces, helper-call records, input and mutated arguments.

This runs the original mapped PCTran.exe x86 instructions for DECAY (0x49a4f0 through the numerical prefix ending at 0x49a69a) and EULER (0x49a830 through 0x49a9dd). The instructions selecting coefficients, branching at thresholds, performing x87 conversion/comparison/division, and dispatching Variant operations come from the actual binary. Numeric MSVBVM60 Variant helpers and OnError setup are modeled. Execution stops before Err.Number and cleanup; it is not a full original-function or Windows execution oracle. Finite VT_R4/VT_R8 numeric cases only; Python binary64 models helper arithmetic and power, so runtime subtype precision and exceptional inputs are not established.

DECAY cases exercise both sides and equality at 10, 150 and 4000000. The original branch chooses the upper interval on equality and has discontinuities. Results include t=0 → 0.06985818594694138, t=10 → 0.05040186643600464, t=150 → 0.03147948533296585 and t=4000000 → 0.0016337721608579159.

EULER cases exercise unchanged and changing derivative values, negative new values, and both sides of the original strict ratio > 2 branch. Inputs `[new, old, dt, accumulator]` of `[1,3.002,2,3]` produce 5; `[1,3.003,2,3]` produce 3.9995007514953613. The original prefix overwrites the old derivative argument with the new derivative.

Validation: all 20 emulated results were independently checked against formulas using decoded float32 constants, float32 rounding for DECAY output and EULER ratio/reciprocal, and binary64 Variant operations. No discrepancies were observed. This agreement checks translation and original prefix paths; it does not establish full reactor simulation parity.

## Scalar polynomial prefixes

The oracle also executes HFLD 0x49ab70–0x49acab, HGAS 0x49ae10–0x49afda, and VFLD 0x49bf00–0x49c020. Stops occur at the call to imported ordinal 685 immediately before error-object handling. Note that 0x49afd6 falls inside a conditional jump instruction and is not a valid HGAS stop. These functions take a float32 scalar by reference. The ordinal 587 helper is modeled as natural logarithm of its float64 stack input; `__vbaPowerR8` is modeled using Python power. `__vbaFpR4` executes an x87 float32 store/reload trampoline to preserve rounding. All other numerical polynomial x87 instructions and branch decisions execute from the original binary. No unit conversion is applied to these raw return values.

Cases include 0.1, 1, 10, 70, 158.2 and 220 plus exactly one float32 ULP below, equal to and above every observed threshold: HFLD=265 (raw constant 0x401ad8), HGAS=450 and 2190 (0x401bb0 and 0x401b68), VFLD=450 (0x401bb0). The strict branch comparison keeps equality in the lower interval.

| Function | At threshold | One ULP above |
|---|---:|---:|
| HFLD, 265 | 381.23455810546875 | 382.0069274902344 |
| HGAS, 450 | 1204.64208984375 | 1204.923583984375 |
| HGAS, 2190 | 1116.390869140625 | 1118.7645263671875 |
| VFLD, 450 | 0.01954476907849312 | 0.019488252699375153 |

The 30 scalar cases execute the original numerical prefixes successfully and preserve the observed discontinuities. The earlier 20-case independent formula comparison applies only to DECAY and EULER; scalar polynomial correctness is grounded in emulated original instructions with the stated runtime-helper assumptions.

## INTP interpolation prefix

INTP executes original instructions 0x49b430 through 0x49bc50, after its zero clamp and before the error-object path. The test harness injects two standard one-dimensional, one-based SafeArray descriptors with 4-byte float elements: pvData at +0x0c, element count +0x10, lower bound +0x14. The five arguments are pointers to the x descriptor pointer, y descriptor pointer, int16 length, float32 query and float32 output. SafeArray search/index/bounds, increasing/decreasing branches, interpolation, endpoint selection and negative output clamp all run from original code. The helper `__vbaFpI2` executes native x87 FISTP16 then MOVSX, preserving default nearest/even rounding when selecting its initial index from length/2.

There are 36 cases: increasing/decreasing 4-element tables; a table crossing negative-to-positive y; and an odd-length 5-element table. Queries include knots, between knots, and both sides outside the range. All 36 agree exactly with an independent endpoint-clamped piecewise-linear reference with final clamp to zero. Example: x=[1,2,3,4], y=[-10,-5,5,10] gives 0 at query=2.5 and 5 at query=3; descending x=[4,3,2,1], y=[40,30,20,10] gives 15 at query=1.5, 10 below range and 40 above range. Equal/nonmonotonic x and malformed descriptors are not covered.

## HLIQ composed numerical prefix

HLIQ runs original instructions 0x49b140 through 0x49b20a, stopping after the local return Variant is constructed and before error-object handling. Arguments are output Variant, pressure float32, temperature float32. The temperature-to-pressure wrapper at 0x49bde0 is intercepted: the original INTP numerical prefix executes separately using the recovered 44-element saturation temperature/pressure arrays. Likewise HFLD executes its original numerical prefix separately. Their scalar return sequences and omitted runtime cleanup are modeled with native FLD/RET trampolines in the HLIQ instance. These independent callee instruction traces are included under `independently_executed_callees`. Wrapper setup/cleanup instructions are not claimed executed.

Twelve cases combine pressures 500 and 2200 with temperatures one float32 ULP below/equal/above 220 and 300, 500, 680. At T<=220 the original local Variant is VT_R4 and holds T−32. At T>220 it is VT_R8 and holds HFLD(saturationPressure(T))−(P−saturationPressure(T))×0.00167. P=500,T=220 gives 188; the next float32 temperature gives 187.72244502779006. P=500,T=300 gives 270.31922749450683; P=2200,T=300 gives 267.48022749450683. A float64 public return preserves the upper branch's original numeric type.

All 12 HLIQ cases pass an independent expression check using the separately executed callee outputs and the raw decoded float64 coefficient. The generator now checks 68 references overall (DECAY/EULER/INTP/HLIQ) at absolute tolerance 1e-12. Nonfinite inputs and exceptional runtime paths remain outside coverage.

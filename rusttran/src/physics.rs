//! Recovered numerical helpers, not a complete reactor simulation.
//!
//! Source: PCTran.exe SHA-256 b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389.
//! REA/Ghidra pseudocode is retained in analysis/rea/math-evidence.json;
//! constants and calling conventions were checked against native instructions.
//! Pressure is psia, temperature °F, enthalpy Btu/lb, volume ft³/lb.
//! Original Single stores are reproduced; portable binary64 arithmetic replaces
//! x87 extended intermediates. VB Variant coercions and GUI error handlers are
//! outside this API. Invalid numeric inputs return an error.
use crate::Result;
use serde::Serialize;
#[path = "property_tables.rs"]
mod tables;

fn finite(value: f64) -> Result<()> {
    if value.is_finite() {
        Ok(())
    } else {
        Err("input must be finite".into())
    }
}
fn result(value: f32) -> Result<f32> {
    if value.is_finite() {
        Ok(value)
    } else {
        Err("numerical result is not finite".into())
    }
}
fn log_pressure(pressure: f32) -> Result<f32> {
    finite(f64::from(pressure))?;
    if pressure <= 0.0 {
        return Err("pressure must be positive for logarithmic correlation".into());
    }
    Ok(f64::from(pressure).ln() as f32)
}
fn polynomial(x: f32, coefficients: &[f64]) -> f32 {
    let x = f64::from(x);
    coefficients
        .iter()
        .copied()
        .reduce(|value, coefficient| value * x + coefficient)
        .unwrap_or(0.0) as f32
}

/// DECAY, native entry 0x49a4f0. Time breakpoints are strict `<` comparisons.
/// The exponent and multiplier are stored as binary32 in the original.
pub fn decay(time: f64) -> Result<f32> {
    finite(time)?;
    if time + 0.1 <= 0.0 {
        return Err("DECAY requires time + 0.1 > 0".into());
    }
    let (coefficient, exponent) = if time < 10.0 {
        (f32::from_bits(0x3d76fd22), f32::from_bits(0x3d82de01))
    } else if time < 150.0 {
        (f32::from_bits(0x3d9ce076), f32::from_bits(0x3e395810))
    } else if time < 4_000_000.0 {
        (f32::from_bits(0x3e051eb8), f32::from_bits(0x3e90e560))
    } else {
        (f32::from_bits(0x3e883127), f32::from_bits(0x3eab851f))
    };
    result((f64::from(coefficient) * (time + 0.1).powf(-f64::from(exponent))) as f32)
}

#[derive(Debug, Serialize)]
pub struct EulerUpdate {
    pub state: f64,
    pub previous_derivative: f64,
    pub scale: f32,
}
/// EULER, 0x49a830: the original damps an update when the derivative ratio > 2.
/// Numeric VT_R8 arguments; the ratio and damping scale are rounded to Single.
/// The old derivative argument is overwritten with the current derivative.
pub fn euler(current: f64, previous: f64, step: f64, state: f64) -> Result<EulerUpdate> {
    for value in [current, previous, step, state] {
        finite(value)?;
    }
    if current + 0.001 == 0.0 {
        return Err("EULER derivative denominator is zero".into());
    }
    let ratio = ((current - previous) / (current + 0.001)).abs() as f32;
    let scale = if ratio > 2.0 {
        (1.0 / f64::from(ratio)) as f32
    } else {
        1.0
    };
    result(ratio)?;
    let next = state + (current * step) * f64::from(scale);
    finite(next)?;
    Ok(EulerUpdate {
        state: next,
        previous_derivative: current,
        scale,
    })
}

/// HFLD, 0x49ab70: saturated liquid enthalpy as a function of pressure.
pub fn hfld(pressure: f32) -> Result<f32> {
    let logarithm = log_pressure(pressure)?;
    let value = if pressure > 265.0 {
        polynomial(
            (f64::from(logarithm) - 7.0) as f32,
            &[
                -0.58728711,
                1.1490811,
                7.4153448,
                10.8019,
                13.891584,
                37.492429,
                160.78158,
                557.15337,
            ],
        )
    } else {
        polynomial(
            logarithm,
            &[
                -4.771e-05,
                0.00084618,
                -0.00533926,
                0.01203737,
                0.00908507,
                -0.06628012,
                0.041031089,
                0.28766511,
                2.2225855,
                33.320422,
                69.795537,
            ],
        )
    };
    result(value)
}

/// HGAS, 0x49ae10: saturated vapor enthalpy, with three original branches.
pub fn hgas(pressure: f32) -> Result<f32> {
    let logarithm = log_pressure(pressure)?;
    let value = if pressure <= 450.0 {
        polynomial(
            logarithm,
            &[
                -3.674e-05,
                -0.0005862,
                0.0043507598,
                -0.01453504,
                0.022775919,
                0.85550917,
                14.228318,
                1105.9625,
            ],
        )
    } else if pressure <= 2190.0 {
        let p = f64::from(pressure);
        (((p * 0.06416805 + 1192.51) - p.powf(2.0) * 9.9871952e-05) + p.powf(3.0) * 4.5502391e-08
            - p.powf(4.0) * 9.3721615e-12) as f32
    } else {
        polynomial(
            (f64::from(logarithm) - 7.0) as f32,
            &[
                3.7170416, -9.1118126, -24.44781, -27.217176, -44.206896, -46.351642, 1187.6082,
            ],
        )
    };
    result(value)
}

/// VFLD, 0x49bf00: saturated liquid specific volume.
pub fn vfld(pressure: f32) -> Result<f32> {
    let logarithm = log_pressure(pressure)?;
    let value = if pressure > 450.0 {
        polynomial(
            (f64::from(logarithm) - 7.0) as f32,
            &[
                -0.00026381,
                0.00142678,
                0.0021252,
                0.00119227,
                0.00197421,
                0.00404696,
                0.02196328,
            ],
        )
    } else {
        polynomial(
            logarithm,
            &[
                4.68e-09,
                -7.47e-08,
                3.9696e-07,
                -3.6945e-07,
                -2.04944e-06,
                6.7462798e-06,
                3.3132739e-05,
                0.00010394514,
                0.016140836,
            ],
        )
    };
    result(value)
}

/// INTP, 0x49b430: interpolate ascending or descending tables; clamp endpoints
/// and negative outputs. Reject malformed tables rather than model VB errors.
pub fn interpolate(x: &[f32], y: &[f32], input: f32) -> Result<f32> {
    finite(f64::from(input))?;
    if x.len() != y.len() || x.len() < 2 {
        return Err("interpolation needs equal tables of at least two values".into());
    }
    for value in x.iter().chain(y) {
        finite(f64::from(*value))?;
    }
    let ascending = x[0] < x[1];
    if !x.windows(2).all(|pair| {
        if ascending {
            pair[0] < pair[1]
        } else {
            pair[0] > pair[1]
        }
    }) {
        return Err("interpolation abscissae must be strictly monotone".into());
    }
    let last = x.len() - 1;
    if (ascending && input <= x[0]) || (!ascending && input >= x[0]) {
        return result(y[0].max(0.0));
    }
    if (ascending && input >= x[last]) || (!ascending && input <= x[last]) {
        return result(y[last].max(0.0));
    }
    let i = x
        .windows(2)
        .position(|pair| {
            if ascending {
                pair[0] <= input && input <= pair[1]
            } else {
                pair[1] <= input && input <= pair[0]
            }
        })
        .ok_or("no interpolation interval")?;
    let slope = (f64::from(y[i + 1]) - f64::from(y[i])) / (f64::from(x[i + 1]) - f64::from(x[i]));
    result(((f64::from(input) - f64::from(x[i])) * slope + f64::from(y[i])) as f32)
        .map(|value| value.max(0.0))
}

/// Wrapper 0x49beb0. TLIQ name is inferred from behavior, not a retained symbol.
pub fn saturation_temperature(pressure: f32) -> Result<f32> {
    interpolate(
        &tables::SATURATION_PRESSURE,
        &tables::SATURATION_TEMPERATURE,
        pressure,
    )
}
/// Wrapper 0x49bde0: the inverse table lookup.
pub fn saturation_pressure(temperature: f32) -> Result<f32> {
    interpolate(
        &tables::SATURATION_TEMPERATURE,
        &tables::SATURATION_PRESSURE,
        temperature,
    )
}
/// Wrapper 0x49c190; shares the original 68-point lookup table.
pub fn vapor_specific_volume(pressure: f32) -> Result<f32> {
    interpolate(
        &tables::VAPOR_PRESSURE,
        &tables::VAPOR_SPECIFIC_VOLUME,
        pressure,
    )
}
/// HLIQ, 0x49b140: temperature-based enthalpy, with a pressure correction.
/// Keeps the original low-temperature `T - 32` branch at and below 220°F.
/// That branch returns a Single-valued Variant; the upper branch keeps Double.
pub fn liquid_enthalpy(pressure: f32, temperature: f32) -> Result<f64> {
    finite(f64::from(pressure))?;
    finite(f64::from(temperature))?;
    let saturation = saturation_pressure(temperature)?;
    if temperature <= 220.0 {
        Ok(f64::from((f64::from(temperature) - 32.0) as f32))
    } else {
        let value =
            f64::from(hfld(saturation)?) - (f64::from(pressure) - f64::from(saturation)) * 0.00167;
        finite(value)?;
        Ok(value)
    }
}

/// Wrapper 0x49be30: inverse of the 68-point vapor-volume table.
pub fn pressure_from_vapor_volume(volume: f32) -> Result<f32> {
    interpolate(
        &tables::VAPOR_SPECIFIC_VOLUME,
        &tables::VAPOR_PRESSURE,
        volume,
    )
}
/// Wrapper 0x49c1e0. Original uses VFLD(pressure), not VFLD(PSAT(T)).
pub fn liquid_specific_volume(pressure: f32, temperature: f32) -> Result<f32> {
    let saturation = saturation_pressure(temperature)?;
    let volume = vfld(pressure)?;
    result((f64::from(volume) - (f64::from(pressure) - f64::from(saturation)) * 5e-7) as f32)
}

#[derive(Debug, Serialize)]
pub struct EulerSingleUpdate {
    pub state: f32,
    pub previous_derivative: f32,
    pub scale: f32,
}
/// EULER with native VT_BYREF|VT_R4 inputs, as used by the plant coordinator.
/// Original Variant arithmetic retains Single for R4/R4 subtraction, products
/// and addition. The denominator uses the original Double literal .001.
pub fn euler_single(
    current: f32,
    previous: f32,
    step: f32,
    state: f32,
) -> Result<EulerSingleUpdate> {
    for value in [current, previous, step, state] {
        finite(f64::from(value))?;
    }
    let difference = result((f64::from(current) - f64::from(previous)) as f32)?;
    let denominator = f64::from(current) + 0.001;
    if denominator == 0. {
        return Err("EULER derivative denominator is zero".into());
    }
    let ratio = result((f64::from(difference) / denominator).abs() as f32)?;
    let scale = if ratio > 2. {
        (1. / f64::from(ratio)) as f32
    } else {
        1.
    };
    let product = result((f64::from(current) * f64::from(step)) as f32)?;
    let increment = result((f64::from(product) * f64::from(scale)) as f32)?;
    let state = result((f64::from(state) + f64::from(increment)) as f32)?;
    Ok(EulerSingleUpdate {
        state,
        previous_derivative: current,
        scale,
    })
}

/// Native 0x49b3a0: phase 2 selects the vapor discharge table; all other
/// signed-I16 values select the liquid table. Endpoint/clamp behavior is INTP.
/// Flux units are inferred as lb/(s ft²) from the relief flow caller.
pub fn critical_discharge_flux(pressure: f32, phase: i16) -> Result<f32> {
    interpolate(
        &tables::DISCHARGE_PRESSURE,
        if phase == 2 {
            &tables::VAPOR_DISCHARGE_FLUX
        } else {
            &tables::LIQUID_DISCHARGE_FLUX
        },
        pressure,
    )
}

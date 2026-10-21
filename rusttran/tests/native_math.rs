//! Fixtures execute original x86 numerical prefixes under Unicorn with modeled
//! VB6 helpers. They do not execute original Windows/MSVBVM60 runtime behavior.
use rusttran::physics;
use serde_json::Value;

fn ordered_bits(value: f32) -> i64 {
    let bits = value.to_bits();
    if bits & 0x8000_0000 != 0 {
        i64::from(!bits)
    } else {
        i64::from(bits | 0x8000_0000)
    }
}

#[test]
fn recovered_property_knots_and_endpoint_clamps() {
    let path = rusttran::default_data_root().join("../property_tables.json");
    let fixture: Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let array = |name: &str| {
        fixture["arrays"]
            .as_array()
            .unwrap()
            .iter()
            .find(|array| array["name"] == name)
            .unwrap()["values"]
            .as_array()
            .unwrap()
            .iter()
            .map(|value| value.as_f64().unwrap() as f32)
            .collect::<Vec<_>>()
    };
    let temperatures = array("saturation_temperature");
    let pressures = array("saturation_pressure_44");
    assert_eq!(temperatures.len(), 44);
    for (&temperature, &pressure) in temperatures.iter().zip(&pressures) {
        assert_eq!(
            physics::saturation_temperature(pressure).unwrap(),
            temperature
        );
        assert_eq!(physics::saturation_pressure(temperature).unwrap(), pressure);
    }
    assert_eq!(
        physics::saturation_temperature(0.0).unwrap(),
        temperatures[0]
    );
    assert_eq!(
        physics::saturation_temperature(10000.0).unwrap(),
        *temperatures.last().unwrap()
    );
    assert_eq!(physics::saturation_pressure(0.0).unwrap(), pressures[0]);
    assert_eq!(
        physics::saturation_pressure(1000.0).unwrap(),
        *pressures.last().unwrap()
    );
    let pressures = array("saturation_pressure_68");
    let volumes = array("saturated_vapor_specific_volume");
    assert_eq!(volumes.len(), 68);
    for (&pressure, &volume) in pressures.iter().zip(&volumes) {
        assert_eq!(physics::vapor_specific_volume(pressure).unwrap(), volume);
    }
    assert_eq!(physics::vapor_specific_volume(0.0).unwrap(), volumes[0]);
    assert_eq!(
        physics::vapor_specific_volume(10000.0).unwrap(),
        *volumes.last().unwrap()
    );
    for temperature in [32.0, 100.0, 220.0] {
        assert_eq!(
            physics::liquid_enthalpy(100.0, temperature).unwrap(),
            f64::from(temperature - 32.0)
        );
    }
}

#[test]
fn numerical_prefix_fixtures_match_modeled_runtime_oracle() {
    let path = rusttran::default_data_root().join("../native_math_fixtures.json");
    let fixture: Value = serde_json::from_slice(&std::fs::read(path).unwrap()).unwrap();
    let cases = fixture["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 98);
    for case in cases {
        let function = case["function"].as_str().unwrap();
        if function == "INTP" {
            let array = |name: &str| {
                case["inputs"][name]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|value| value.as_f64().unwrap() as f32)
                    .collect::<Vec<_>>()
            };
            let actual = physics::interpolate(
                &array("x"),
                &array("y"),
                case["inputs"]["query"].as_f64().unwrap() as f32,
            )
            .unwrap();
            let expected = case["output"].as_f64().unwrap() as f32;
            assert!(
                (ordered_bits(actual) - ordered_bits(expected)).abs() <= 2,
                "INTP {}: {actual} != {expected}",
                case["inputs"]
            );
            continue;
        }
        let input: Vec<_> = case["inputs"]
            .as_array()
            .unwrap()
            .iter()
            .map(|value| value.as_f64().unwrap())
            .collect();
        let expected = case["output"].as_f64().unwrap();
        if function == "HLIQ" {
            let actual = physics::liquid_enthalpy(input[0] as f32, input[1] as f32).unwrap();
            assert!(
                (actual - expected).abs() <= expected.abs().max(1.0) * 1e-10,
                "{function} {input:?}: {actual} != {expected}"
            );
            continue;
        }
        if function == "EULER" {
            let actual = physics::euler(input[0], input[1], input[2], input[3]).unwrap();
            assert!(
                (actual.state - expected).abs() <= expected.abs().max(1.0) * 1e-7,
                "{function} {input:?}: {} != {expected}",
                actual.state
            );
            assert_eq!(
                actual.previous_derivative,
                case["post_arguments"][1].as_f64().unwrap()
            );
            continue;
        }
        let actual = match function {
            "DECAY" => physics::decay(input[0]).unwrap(),
            "HFLD" => physics::hfld(input[0] as f32).unwrap(),
            "HGAS" => physics::hgas(input[0] as f32).unwrap(),
            "VFLD" => physics::vfld(input[0] as f32).unwrap(),
            _ => panic!("unrecognized fixture {function}"),
        };
        assert!(actual.is_finite());
        let distance = (ordered_bits(actual) - ordered_bits(expected as f32)).abs();
        assert!(
            distance <= 2,
            "{function} {input:?}: {actual} != {expected}, {distance} ULP"
        );
    }
}

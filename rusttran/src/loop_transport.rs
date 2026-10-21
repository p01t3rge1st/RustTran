//! Original late primary thermal feedback 0x50d1f8-0x50d867.
use crate::{Result, native_globals::NativeGlobals};
use std::collections::BTreeMap;
fn single(v: f64) -> Result<f32> {
    let v = v as f32;
    if v.is_finite() {
        Ok(v)
    } else {
        Err("loop thermal feedback Single overflow".into())
    }
}
impl NativeGlobals {
    pub fn advance_loop_transport(&mut self) -> Result<BTreeMap<String, f32>> {
        let d = |a| self.single(a).map(f64::from);
        let volume = d(0x54b1a0)?;
        let step = d(0x54b414)?;
        let flows = [self.single(0x54b530)?, self.single(0x54b534)?];
        if volume == 0. || step <= 0. || flows.contains(&0.) {
            return Err("invalid loop transport volume, step or zero pump flow".into());
        }
        let fraction = single(1. - (d(0x54b6ac)? - d(0x54b6c0)? / 100. * d(0x54b19c)?) / volume)?;
        let inlet = self.single(0x54b498)?;
        let core = self.single(0x54b690)?;
        let delta = [self.single(0x54b6e4)?, self.single(0x54b6e8)?];
        let outlet = [self.single(0x54b6b8)?, self.single(0x54b6bc)?];
        let mut cold = [
            single(f64::from(inlet) - f64::from(delta[0]) / 2.)?,
            single(f64::from(inlet) - f64::from(delta[1]) / 2.)?,
        ];
        for i in 0..2 {
            if cold[i] < outlet[i] && inlet > outlet[i] {
                cold[i] = outlet[i];
            }
        }
        let mut hot = [
            single(f64::from(inlet) + f64::from(delta[0]) / 2.)?,
            single(f64::from(inlet) + f64::from(delta[1]) / 2.)?,
        ];
        if flows[0] < 0. {
            cold[0] = cold[1];
            hot[0] = single(f64::from(cold[1]) + f64::from(delta[0]))?;
            if hot[0] < outlet[0] && inlet > outlet[0] {
                hot[0] = outlet[0];
            }
        }
        if flows[1] < 0. {
            cold[1] = cold[0];
            hot[1] = single(f64::from(cold[0]) + f64::from(delta[1]))?;
            if hot[1] < outlet[1] && inlet > outlet[1] {
                hot[1] = outlet[1];
            }
        }
        hot[0] = hot[0].min(core);
        hot[1] = hot[1].min(core);
        let tau = [
            single(d(0x54b740)? * d(0x54b12c)? / f64::from(flows[0]).abs())?.max(5.),
            single(d(0x54b744)? * d(0x54b12c)? / f64::from(flows[1]).abs())?.max(5.),
        ];
        let addresses = [0x54b694, 0x54b698, 0x54b69c, 0x54b6a0];
        let history = [0x54bab4, 0x54bab8, 0x54babc, 0x54bac0];
        let current = [hot[0], hot[1], cold[0], cold[1]];
        let fresh = self.single(0x54b40c)? <= self.single(0x54b418)?;
        let mut out = BTreeMap::from([("0x54ba34".into(), fraction)]);
        for i in 0..4 {
            let old = if fresh {
                current[i]
            } else {
                self.single(history[i])?
            };
            let factor = f64::from(tau[i % 2]) / step;
            let filtered =
                single((factor * f64::from(old) + f64::from(current[i])) / (factor + 1.))?;
            out.insert(format!("0x{:x}", addresses[i]), filtered);
            out.insert(format!("0x{:x}", history[i]), filtered);
        }
        self.singles.extend(out.clone());
        Ok(out)
    }
}

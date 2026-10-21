//! Original loader-mapped storage BEFORE application initialization.
//! Process-birth zeros are source bytes, not invented simulation defaults.
//! Application startup/Reset may execute additional writes; this is not a
//! complete scenario initializer and must not overwrite restored histories.
use crate::{Result, integration::BINDINGS, native_globals::NativeGlobals};
use std::collections::BTreeMap;
impl NativeGlobals {
    pub fn initialize_new_process_storage(&mut self) -> Result<BTreeMap<String, f32>> {
        let mut addresses: BTreeMap<String, f32> = BINDINGS
            .iter()
            .map(|b| (format!("0x{:x}", b.previous), f32::from_bits(0)))
            .collect();
        for a in [0x54bba0, 0x54bf98, 0x54b6d8, 0x54bf9c] {
            addresses.insert(format!("0x{a:x}"), f32::from_bits(0));
        }
        if let Some(key) = addresses
            .keys()
            .find(|key| self.singles.contains_key(*key) || self.integers.contains_key(*key))
        {
            return Err(
                format!("new-process storage cannot overwrite existing state {key}").into(),
            );
        }
        self.singles.extend(addresses.clone());
        Ok(addresses)
    }
    /// Original initializer alias instructions 0x51c0f8 and 0x51c12e.
    /// Execute at the end of the chosen state-loading path, after its writes.
    pub fn initialize_integrator_alias(&mut self) -> Result<BTreeMap<String, f32>> {
        let value = self.single(0x54b4f0)?;
        let out = BTreeMap::from([("0x54b688".into(), value)]);
        self.singles.extend(out.clone());
        Ok(out)
    }
}

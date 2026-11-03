# Recovered component comparison

345/345 cases passed; 26830/26830 output checks.

- Original x86 branches run in Unicorn. COM reads/writes are explicit state; setter callbacks, log formatting and UI cleanup are excluded where documented. Process-birth storage checks compare mapped PE bytes only, before application initialization.
- Property callees use independently executed prefixes with modeled VB numeric helpers. Accumulator power is modeled with Python libm.
- Alternate decay heat executes original VB6 Exp/Sqr; loop power executes the original VB6 DLL with a scratch errno cell and explicit x87 53-bit precision; the Windows app precision context has not been established.
- Windows floating-point context, whole-plant dispatch and original error handling are not replayed.
- Agreement in these cases is evidence for the translated blocks only; it does not validate complete PCTran scenarios.

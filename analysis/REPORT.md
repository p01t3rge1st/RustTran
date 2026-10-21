# Raport odtwarzania PCTran

## Tożsamość celu

Źródło: lokalny `PC-Tran (program).zip`. SHA-256 poszczególnych plików zachowano w `artifact_manifest.json`. Główne EXE: SHA-256 `b3b2965e745d5ae03e3e0668c7e8d60006896b09ea4f8a96799a254e99602389`.

SETUP.LST podaje PCTran PWR 3LP i wersję 6.0.0.1. Obserwacje PE: x86, baza obrazu 0x400000, brak nagłówka CLR, import MSVBVM60.DLL; metadane `VB5!` i natywne prologi potwierdzają skompilowany kod Visual Basic 6. Archiwum zawiera instalator, CAB i trzy dokumenty Word. CAB rozpakowano do 69 plików; instalatora nie uruchomiono.

## Rzeczywiste użycie REA

NPM REA 6.4.0, Ghidra 12.1.4, JDK 21, Node.js 24.15.0. Użyto CLI do przeglądu i trwałej sesji MCP do procedur, dekompilacji i referencji. Analiza Ghidry działała na prywatnych kopiach/tymczasowym projekcie. Nie poprawiano bajtów oryginału ani kodu REA.

| Dowód | Operacja | Wynik |
|---|---|---|
| `ev_154a540f119d7b56a5e3c70cc3b66850eebeeba84b8c78184197d480b241ab9e` | binary_overview | 624 procedury, 3448 zdefiniowanych napisów, 5 segmentów |
| `ev_78ce0ab04897bc009cb5ba4dd323fd0c4cead1a4e270439b0f204b97ecd7283e` | list_procedures | pełna lista rozpoznanych procedur |
| `ev_d9085317cdf22bad3648afdae99347329c69407248340ee2a91f3153eff3d5d0` | batch_decompile | siedem funkcji matematycznych, pseudokod |
| `ev_aa3ed404a716474507549f9a358357bea1ddfdf86cd1dc25172133f137d2cb11` | batch_decompile | pomocnicze funkcje tabel i inicjalizator |
| `ev_b3338745fb865090b0c307bb264d9fa87ddfa41f89cb17716c5b4ff2cfcd8ebb` | batch_decompile | poprawna granica procedury 0x49c190 |
| `ev_420503704baccc28f4680ff88d8ea09f9e510dc694fadf6fbad7d9d76b1cb4b7` | procedure_references | 14 wywołań EULER z 0x51d3d0 |
| `ev_6006750019fbf981be190a1cb039a08303ac119243c2af81538127a1bd5cc90a` | procedure_references | dwa wywołania DECAY z 0x51d3d0 |
| `ev_a5b0251783976f28157ea24d62ee1aca1c5afa83e388614be2fe293f2ed3fded` | analyze_function | główna integracja: 7594 instrukcje, 807 bloków, 62 callees; pełny eksport sesji |

Pełna analiza0x51d3d0 przekroczyła budżet odpowiedzi MCP. Wynik był zachowany przez REA; wyeksportowano7 rekordów do13.5MB `rea/session-evidence.json`, bez ponownego liczenia i bez obcięcia. Czytelny pseudokod głównej funkcji to `rea/0x51d3d0.c` (210874 znaki).

Surowe wyniki w `rea/*.json`; przegląd CLI w `rea-overview.json`. Obserwacje z objdump, parserów własnych i MDB tools opisano oddzielnie; nie są to wyniki REA. Liczba procedur oznacza pokrycie rozpoznania Ghidry, nie odzyskanie kompletnej logiki programu.

## Implementacja Rust

| Kod / VA | API Rust | Status |
|---|---|---|
| DECAY / 0x49a4f0 | decay | odtworzone progi 10,150,4000000 i stałe binary32 |
| EULER / 0x49a830 | euler | odtworzone tłumienie gdy abs((new-old)/(new+0.001))>2; aktualizacja starej pochodnej |
| HFLD / 0x49ab70 | hfld | wielomiany z log(P), próg P>265, dokładne stałe binary64 |
| HGAS / 0x49ae10 | hgas | trzy gałęzie przy P=450 i2190 |
| VFLD / 0x49bf00 | vfld | dwa wielomiany przy P=450 |
| INTP / 0x49b430 | interpolate | tabele rosnące/malejące, ograniczenie do końców i zera |
| 0x49bde0 | saturation_pressure | tablica44: temperatura→ciśnienie |
| 0x49beb0 | saturation_temperature | tablica44: ciśnienie→temperatura; nazwa TLIQ wnioskowana |
| 0x49c190 | vapor_specific_volume | tablica68: ciśnienie→objętość właściwa pary |
| HLIQ / 0x49b140 | liquid_enthalpy | T<=220: T-32; powyżej HFLD(Psat(T))-(P-Psat(T))*0.00167 |
| Bazy Access | Database/Table | wszystkie53 tabele dostępne, stany IC łączone według identyfikatora |
| PresetFreeze | evaluate_freeze | tylko ścisłe porównania zapisanych danych; bez maszyny zdarzeń |

Wnioskowanie jednostek wynika z wartości i struktury korelacji: °F, psia, Btu/lb, ft³/lb. Ghidra błędnie rozpoznała część sygnatur/zwrotów i nie pokazuje parametrów niektórych funkcji Variant. Kolejność parametrów została sprawdzona w instrukcjach stosu. Adres0x49c180 jest wnętrzem końcówki VFLD; właściwy początek odwrotnego lookupu to0x49c190. Tablice wyciągnięto jako dokładne wzorce binary32.

Oryginalne nieciągłości na granicach wielomianów zachowano. Portable Rust używa binary64 zamiast x87 extended dla pośrednich działań, z odtworzonymi zapisami Single; nie obiecuje bitowej równości wszystkich wejść i wariantów typów VB6. Brakujące i niepoprawne dane powodują błędy, bez fikcyjnych domyślnych parametrów. HLIQ zachowuje wynik Double powyżej220°F; niższa gałąź ma wartość Single.

## Walidacja i pozostały zakres

Testy danych sprawdzają realne rekordy, rozbieżności menu/snapshotów, brakujące ID/pola oraz nietypowe wartości awarii. 98 przypadków funkcji liczbowych porównano z oryginalnymi instrukcjami x86 wykonywanymi w Unicorn przy modelowanych pomocnikach VB6; pełnego Windows/MSVBVM60 nie uruchomiono. Szczegóły i ograniczenia oracle: `NATIVE_ORACLE.md`. Sprawdzono44 i68 węzłów odzyskanych tablic oraz ograniczenia końców.

Odtworzenie całego programu pozostaje otwarte:

1. Główna integracja stanu: procedura0x51d3d0 zawiera wszystkie14 rozpoznanych wywołań EULER i oba DECAY. Odzyskano wszystkie14 wiązań stanu/pochodnych/kroku z instrukcji stosu; `integration_states.json` i `CORE_FINDINGS.md` oddzielają adresy od wnioskowanych nazw fizycznych. Trzeba odzyskać równania pochodnych, w pierwszej kolejności pomocnik0x4fa8e0 wywoływany tuż przed integracją, oraz prześledzić zależności. Oryginalne argumenty integracji to Varianty by-reference binary32; obecny niezależny API EULER sprawdzono dla liczbowych VT_R8, nie pełnej semantyki tych globalnych Single.
2. SystemCalculations, Computations, CoreMelt i sterowanie pompami/zaworami: metadane wskazują obiekty, ale nazwy metod modułów są usunięte. Niezbędne jest mapowanie pól baz danych na stan obliczeń i kolejność wywołań.
3. Pierwotne przeliczenia jednostek, warunki trip/interlock, rozkład czasowy awarii, zapisy/restart/replay, dawki i raporty.
4. GUI Rust odtwarzające ekrany i obsługę operatora; kontrolki OCX są osobnymi artefaktami do analizy.
5. Porównanie pełnych przebiegów z działającym oryginałem w zgodnym środowisku Windows/VB6. W dostarczonych bazach brak gotowych przebiegów czasowych do takiej walidacji, a dokumentacja zawiera przykłady starszej wersji.

Projekt jest częściowym portem opartym na dowodach, nie kompletną zgodną kopią PCTran.

Końcowe sprawdzenia:7 testów Rust (98 przypadków oracle i112 węzłów właściwości), Clippy bez ostrzeżeń, formatowanie zgodne. Zbudowano wersję release i sprawdzono odczyt menu, parametrów SET1, nieopisanego stanu IC12, DECAY, HLIQ oraz odrzucenie nieistniejącego IC21. Gotowy lokalny pakiet Linux: `../dist/pctran-rs/run`. Sesję REA zamknięto poprawnie (`rea/close.json`).

## Native GUI update

Added English-language native eframe/egui0.33.3 desktop presentation,
using the NSSS layout extracted from the shipped Word document. Reference:
`reference-ui/PWR Severe Accidents_html_44050c8d.png`. The vector diagram
retains left-side ECCS, a central reactor flanked by 1+2 steam-generator groups,
right-side operating panels, and lower instrumentation. Graphite gray and
amber replace the original saturated colors.

GUI snapshots use actual ICThermoData/ICPumpData/ICValveData/ICCoreData values;
missing fields stay unknown. Equipment inspection uses the same displayed
units and percentage scaling as its readout. The scene supports22 recovered
initial conditions, including conditions absent from the original menu.
Scenario malfunction editing/export is separate from stored plant values.
The presentation clock has no demo timeout; tests cross301,3601 and86401seconds.
No license checks or bytes in the original executable were modified.
As requested, no time-limit messaging is displayed in the application.

Verified native screenshots at1440×1020 and1024×760; the DECAY curve view is
also captured in `previews/pctran-decay.png`. The original full transient
engine remains unresolved. Native GUI launch: `../dist/pctran-rs/gui`.

Final GUI validation:10 Rust tests pass (including98 numerical oracle cases), Clippy with GUI/all-targets reports no warnings, and rustfmt is clean. Both optimized native binaries and their launch scripts are packaged under `dist/pctran-rs`. All application labels, dialogs and messages are English. Additional property-view screenshot uses recovered IC7.

Screenshot capture was moved to a settled-frame, pre-swap viewport request after the framework's early post-swap capture intermittently produced black images. The property view on X11 and the IC12 state-data view on Wayland were visually verified using the corrected capture path. Capture support is compiled only for the development `gui-screenshot` feature.

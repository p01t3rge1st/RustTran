# RustTran — PWR 3LP w Rust

Repozytorium robocze analizy programu z `PC-Tran (program).zip` przy użyciu [REA](https://github.com/morluto/rea) i Ghidry. Rozpoznany cel: PCTran PWR 3LP, 32-bitowy natywny Visual Basic 6; instalator podaje wersję 6.0.0.1 i datę pliku EXE 23 listopada 2010.

**Stan: częściowy port, nie pełny zamiennik PCTran.** Angielskie GUI w szarościach i żółtych akcentach udostępnia schemat IC oraz widok **Simulation**, który wykonuje rzeczywiste kroki odzyskanego silnika z dostarczonej sesji. Działają Start/Pause/Step/Reset, przeniesione sterowanie urządzeniami, wykresy i zapis sesji/CSV. Pełny start reaktora bezpośrednio z IC, pozostałe modele i automatyka oraz zgodność całych scenariuszy nadal wymagają pracy.

Aktualna walidacja: **170 testów Rust, 23 912 porównań komponentów/połączonych fragmentów i 608 507 sprawdzeń wyjść**. To nie jest walidacja całych przebiegów oryginalnej aplikacji. [Postęp i otwarte zadania](analysis/CONVERSION_PROGRESS.md).

## Interfejs graficzny

```sh
dist/rusttran-linux-x86_64/rusttran
# Z kodu źródłowego:
cargo run --manifest-path rusttran/Cargo.toml --features gui --bin rusttran
```

[Podgląd interfejsu](analysis/previews/rusttran-gray-amber.png).
Interfejs zachowuje układ ECCS, dwóch grup SG (1 + 2), reaktora, paneli sterowania i wskaźników. Wybór IC oraz odczyt urządzeń działają na odzyskanych danych. Widoki IC zachowują osobny zegar podglądu. Aby wykonać odzyskane obliczenia, otwórz **Simulation → Load sample session → Start**. Wbudowany przykład jest syntetycznym stanem referencyjnym, nie pełnym scenariuszem reaktora. **View → Live simulation mimic** pokazuje obliczone ciśnienia, temperaturę, poziomy i przepływy w układzie schematu; brakujące wskazania pozostają oznaczone „—”.

## Uruchomienie Rust

```sh
cargo run --manifest-path rusttran/Cargo.toml -- conditions
cargo run --manifest-path rusttran/Cargo.toml -- condition 1
cargo run --manifest-path rusttran/Cargo.toml -- parameters 1
cargo run --manifest-path rusttran/Cargo.toml -- malfunctions
cargo run --manifest-path rusttran/Cargo.toml -- math DECAY 150
cargo run --manifest-path rusttran/Cargo.toml -- math EULER 1 10 2 3
cargo run --manifest-path rusttran/Cargo.toml -- math HFLD 158.2
```

Gotowy lokalny pakiet Linux jest w `dist/rusttran-linux-x86_64`; uruchomienie bez Cargo:

```sh
dist/rusttran-linux-x86_64/rusttran-cli conditions
dist/rusttran-linux-x86_64/rusttran-cli math DECAY 150
```

Pakiet można odbudować przez `python3 scripts/package_release.py`.

Interfejs CLI i biblioteka: [rusttran/README.md](rusttran/README.md). Funkcje właściwości pracują w jednostkach oryginalnych korelacji: psia, °F, Btu/lb, ft³/lb. Parametry wyświetlane w bazach i GUI mogą mieć inne jednostki; nie należy podstawiać ich do tych funkcji bez prześledzenia konwersji.

## Materiały i dowody

- [Raport analizy](analysis/REPORT.md): zakres odzyskania, adresy funkcji, dowody REA i pozostałe zadania.
- [Dane Access](analysis/DATA_FINDINGS.md): 53 tabele / 1569 rekordów z pięciu MDB; pełne CSV, schematy i sumy SHA-256 w `analysis/data`.
- [Metadane VB6](analysis/VB6_FINDINGS.md): 41 obiektów i mapowanie nazw na kod.
- [Główna integracja](analysis/CORE_FINDINGS.md): 14 wiązań EULER oraz mapa pól wymagających dalszego odtworzenia.
- [Tablice właściwości](analysis/PROPERTY_TABLES_FINDINGS.md): 272 odzyskane wartości wraz z instrukcjami inicjalizacji.
- [Walidacja kodu x86](analysis/NATIVE_ORACLE.md): emulator oryginalnych fragmentów obliczeniowych z opisem modelowanych funkcji VB6.
- `analysis/rea`: zachowane wyniki rzeczywistych wywołań REA oraz pseudokod Ghidry.
- `analysis/artifact_manifest.json`: tożsamość ZIP-a i rozpakowanych plików.

Bazy i dokumenty zawierają rozbieżności: SET1 ma POWER=2705; dokumentacja opisuje także starsze modele i inne ustawienia. Menu warunków początkowych różni się od zapisanych stanów. Wszystkie wartości źródłowe są zachowane.

## Powtarzanie analizy

Wersje narzędzi zapisano w `analysis/tools-lock.json`. Lokalne narzędzia są w `.tools`; źródła REA w `rea-tools`. Nie zmieniono globalnej konfiguracji klienta ani instalacji systemowych.

```sh
scripts/rea --version
scripts/rea providers --json
python3 scripts/export_databases.py
python3 scripts/inspect_vb6.py
python3 scripts/extract_property_tables.py
python3 scripts/generate_property_tables.py
python3 scripts/extract_integration_states.py
.tools/python/bin/python scripts/native_math_oracle.py
cargo test --manifest-path rusttran/Cargo.toml
cargo clippy --manifest-path rusttran/Cargo.toml --all-targets -- -D warnings
```

`scripts/rea_session.py` utrzymuje sesję MCP REA na czas kilku zapytań. Czyta wiersze JSON ze stdin; parametr `save` zachowuje pełny wynik. Najpierw użyj `open_binary` z absolutną ścieżką do EXE i `provider_id: "ghidra"`, potem zapytań analizy, na końcu `close_binary`. Pseudokod nie jest odzyskanym oryginalnym źródłem VB6: wymagane jest sprawdzenie sygnatur, kolejności parametrów i stałych w instrukcjach.

## Instalacja Linux

```bash
bash dist/rusttran-linux-x86_64/install.sh
# Alternatywnie pakiet systemowy na Debian/Ubuntu:
sudo apt install ./dist/rusttran_0.1.0_amd64.deb
```

Instalacja użytkownika dodaje RustTran do menu Plasma/GNOME z własną ikoną.
Dane są wbudowane w pliki wykonywalne. Nazwa oryginału w dokumentacji analizy
oznacza źródło danych, a nie nazwę nowej aplikacji.

Windows: `dist/RustTran.exe`. Pełny silnik symulacji nadal wymaga rekonstrukcji.

## Porównania funkcji liczbowych

```bash
.tools/python/bin/python scripts/compare_numeric.py
```

[Kolorowa tabela HTML](analysis/comparison/results.html) zawiera 253 przypadki,
w tym 93 punkty DECAY w zakresie 0–300 s, funkcje HFLD/HGAS/VFLD/HLIQ
i pojedyncze aktualizacje EULER. Dostępne są filtry, drukowanie/PDF,
[CSV](analysis/comparison/results.csv) i [JSON z dowodami wykonania](analysis/comparison/results.json).
Porównanie wykonuje fragmenty oryginalnego kodu x86 z modelowanymi helperami VB6,
a nie pełną aplikację Windows ani przebiegi reaktora.

## Odtwarzanie silnika symulacji

Przeniesiono etap integracji 14 zmiennych i wszystkie 14 końcowych równań zmian stanu.
Dodano 100 przypadków integracji i 400 przypadków bilansów porównywanych
z oryginalnymi instrukcjami x86. Dalsze sprawdzone bloki opisano poniżej.
Pełny przebieg instalacji, sterowanie
i skutki awarii nadal wymagają odzyskania pozostałych zależności.
Szczegóły i dowody: [stan silnika](analysis/ENGINE_STATUS.md).

[Rejestr postępu i pozostałych prac](analysis/CONVERSION_PROGRESS.md)
([JSON](analysis/conversion_progress.json)). Aktualizacja liczników:

```bash
python3 scripts/update_conversion_progress.py
```

## Kolejne bloki obliczeniowe

Przeniesiono końcowe bilanse obu wytwornic pary, wypływ przez zawory,
regulator PI, siedmiopunktowe krzywe pomp, aktywację zbiornika chłodzenia
oraz ubytek zbiornika zasilającego z warunkiem recyrkulacji. Wszystkie
14 końcowych wejść integratora ma sprawdzone równania, lecz obliczenia
poprzedzające te równania i pełna obsługa instalacji pozostają nieukończone.

[Nowa kolorowa tabela porównań komponentów](analysis/component-comparison/results.html)
obejmuje 23 912 odrębnych przypadków. Jest to porównanie bloków oryginalnego
kodu x86 z RustTran, z ograniczeniami opisanymi w tabeli — nie pełnych aplikacji.
Odtworzenie raportu z gotowej paczki:

```sh
python3 scripts/compare_components.py
```


Przeniesiono również automatykę upustu, uzupełniania i wtrysku, regulator
uzupełniania, dynamiczne odniesienia temperatury/poziomu oraz 25 kolejnych
zapisów inicjalizacji. Bloki są połączone z oboma SG, bilansem i integratorem.
[Dowód źródłowy i granice tej konwersji](analysis/PRIMARY_DEVICE_CONNECTIONS.md).
Pełne scenariusze sterowane z GUI nadal wymagają ukończenia pozostałej automatyki,
inicjalizacji/odtwarzania i dyspozytora zdarzeń.


Początkowe sterowanie obu wytwornic pary obejmuje teraz rozruch zasilania,
regulację poziomu i ciśnienia oraz gałęzie awarii. Sprawdzono 960 przypadków
oryginalnego bloku i 32 dodatkowe połączone aktualizacje. Dalsza regulacja
zasilania SG jest teraz przeniesiona (opis poniżej); pełnych przebiegów z GUI jeszcze
nie ma. [Zakres i dowody](analysis/STEAM_CONTROL_CONNECTIONS.md).


Przeniesiono też zamykanie zasilania i zaworów SG, histerezę zaworów
bezpieczeństwa oraz produkcję wypływu z ograniczeniem dostępnej masy i korektą
ciepła: 1200 nowych przypadków i 32 połączone aktualizacje. Dalsza regulacja
zasilania SG jest teraz przeniesiona (opis poniżej). [Dowody](analysis/STEAM_VALVE_CONNECTIONS.md).


Zamknięto pozostałą lukę regulacji zasilania SG. Cały odzyskany blok obliczeń
i sterowania wytwornicy pary porównano teraz z ciągłym wykonaniem oryginalnych
instrukcji: 320 przypadków, dodatkowo 640 regulacji pomocniczych i 32 połączone
aktualizacje instalacji. Pełna inicjalizacja i przebiegi z GUI nadal wymagają pracy.
[Zakres i weryfikacja](analysis/STEAM_SYSTEM_CONNECTIONS.md).


Rozszerzono inicjalizację używaną przez GUI i CLI do 105 wartości i 14 flag dla
110 kombinacji modelu i warunków początkowych. Dodano późne odniesienia poziomów
i przepływów, właściwości cieplne oraz osobny etap początkowych historii
sterowania: łącznie 640 nowych przypadków porównawczych. Pełny Reset,
odtwarzanie i przebiegi całej instalacji nadal wymagają pracy.
[Dowody](analysis/LATE_THERMAL_INITIALIZATION.md).


Przeniesiono gałąź odtwarzania zegara i odniesień sterowania oraz przeliczanie
20 czasów zdarzeń (400 porównań). Odzyskane czasy i flagi z tablic zdarzeń
przekazujemy teraz do RCP i SG przed bilansem i integracją (32 porównania).
Pełne wczytywanie zapisów i działający Resume/Reset z GUI pozostają nieukończone.
[Zakres i dowody](analysis/RESTORED_CONTROLS_AND_EVENTS.md).

Odzyskany krok może już sam obliczać normalną wymianę ciepła obu pętli przed
wytwornicami pary i integracją; uwzględnia właściwą flagę i wspólny czas zdarzenia.
Inicjalizacja GUI/CLI obejmuje teraz również współczynnik tej wymiany
(107 wartości Single i 14 flag). [Dowody i pozostałe ograniczenia](analysis/CONNECTED_THERMAL_TRANSFER.md).

Połączono też akumulator wtrysku awaryjnego: aktywację, zawory, opróżnianie i
ciśnienie gazu. Jego aktualny wypływ zasila dalszy bilans odzyskanego kroku.
[Zakres i porównania z oryginałem](analysis/ACCUMULATOR_SYSTEM_CONNECTIONS.md).

Dalsze połączenia silnika obejmują już tryby zasilania, chłodzenia i recyrkulacji.
Sesja CLI zachowuje wyliczone polecenia pomp, zaworów, grzałek i natrysku pomiędzy
krokami; można ją zapisać i wznowić. Dla dostarczonego stanu działa eksport
rzeczywistych próbek do CSV/JSON i [raportu z wykresami](analysis/session-history/history.html).
To nadal odzyskana część silnika z jawnymi brakującymi wejściami, nie pełny
scenariusz oryginalnej aplikacji ani gotowe sterowanie przebiegiem z GUI.

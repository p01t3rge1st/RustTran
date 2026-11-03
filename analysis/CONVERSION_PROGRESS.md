# Postęp konwersji RustTran

Aktualizacja: 3 listopada 2026.

**Program nie jest jeszcze pełnym zamiennikiem PCTran. Pozostała znaczna praca.** Nie podajemy procentu całości ani liczby godzin bez zamkniętej listy zachowań i zależności oryginału. Wysokie pokrycie pól danych i liczba testów nie oznaczają gotowości aplikacji.

## Co działa i czego użytkownik jeszcze nie może zrobić

Widok **Simulation** wykonuje rzeczywiste kroki odzyskanego silnika: Start/Pause/Step/Reset, sterowanie urządzeniami, wykresy, zapis/odczyt sesji i eksport CSV. Wbudowany syntetyczny przykład uruchamia się przyciskiem **Load sample session**; można też dostarczyć JSON sesji. Kliknięcia i zgodność stanu GUI/CLI sprawdzono automatycznie. Panel inicjalizacji zachowuje także Double i tablice oraz zapisuje złożony stan JSON. Okno Live simulation mimic pokazuje bieżące odzyskane odczyty w układzie oryginalnego schematu; brakujące źródła mają znak —. Klasyczny główny NSSS odwzorowuje geometrię/paletę handbooka; po wczytaniu sesji obsługuje rzeczywiste sterowanie grzałką, RCP i kroki. Cztery temperatury gałęzi są bieżące. Przeniesione wentylatory obudowy działają w sesji i klasycznym GUI, z obliczanym ciepłem; numeryczny bilans obudowy i warunkowy solver są już połączone z natryskiem/wentylatorami, z bieżącym przepływem powrotnym zasilania. Ciśnienie, temperatura i poziom ewoluują i są widoczne na klasycznym schemacie. Producent energii reakcji oraz zapłon/spalanie/wygaszenie wodoru są już połączone, z oryginalną tabelą progów i zachowaniem czasu zdarzenia. Hydrogen pokazuje obliczone stężenie; historia ma 25 serii. Połączono także transfer BFB4 i jego historie; adapter korzysta z typowanych wartości początkowych Double. Pozostaje ewolucja węzłów/produkcji wodoru w modelu Double i pełny stan awarii. FCO2/FH2O/FDEC są już wczytywanymi parametrami, nie brakującymi producentami. Natrysk obudowy jest już przeniesiony i połączony w silniku sesji: automatyka, pompy, właściwości i chłodzenie; dedykowane sterowanie nim z klasycznego GUI pozostaje otwarte. Pełna identyczność wszystkich okien pozostaje otwarta. Widoki IC nadal pokazują zapisane warunki i podgląd zegara. **Pełny start reaktora z IC i zgodność całych scenariuszy PCTran pozostają nieukończone.**

## Stałe etapy do pełnej funkcjonalności

Poniższe identyfikatory są stałe. Kolejne odkryte podproblemy zapisujemy pod właściwym etapem. Siedem pozycji nie oznacza siedmiu równych ani pojedynczych zadań.

| ID | Etap | Stan | Co konkretnie pozostało |
|---|---|---|---|
| INIT | Pełna inicjalizacja i odtwarzanie | Częściowo wykonany | Pełny wybór ścieżki świeżej/odtworzonej i odczyt oryginalnych zapisów, pozostałe historie/tablice oraz kompletne Reset/restore; pięć nierozstrzygniętych pól IC. Numeryczna inicjalizacja modelu Double jest przeniesiona; jego ewolucja pozostaje w STEP. |
| AUTO | Automatyka urządzeń i zabezpieczeń | Częściowo wykonany | Pozostałe zabezpieczenia i skutki zdarzeń, pełny harmonogram oraz kompletna zgodność callbacków oryginału. Kontrolki odzyskanych urządzeń działają w widoku Simulation; wskazania na oryginalnym schemacie nadal dotyczą zapisanych IC. |
| STEP | Kompletny krok całej instalacji | Częściowo wykonany | Ewolucja stanu Double/węzłów i wytwarzanie wodoru w 0x526b40, w tym źródła BF7C/BDF4; pełny blok 0x503f50, inne ścieżki transportu i dispatcher. Transfer BFB4/historie, BFB8, zapłon/spalanie B754 i bilans obudowy są już podłączone. C000/BFFC/C004 to już wczytywane FCO2/FH2O/FDEC, a BB08 jest stałą startową; nie są oddzielnymi nieprzeniesionymi producentami. |
| EVENTS | Awarie i scenariusze w czasie | Częściowo wykonany | Pełny harmonogram awarii, opóźnienia, rampy, sekwencje zabezpieczeń i ich powiązanie z krokiem. |
| GUI | Przebiegi i sterowanie z GUI | Częściowo wykonany | Kompletny start scenariusza bezpośrednio z IC, odczyt oryginalnych zapisów oraz brakujące źródła odczytów/urządzeń i scenariusze awarii. Odrębny widok IC pozostaje zapisanym stanem; Live simulation mimic pokazuje odzyskane bieżące zmienne. Przykład Simulation nie zastępuje pełnego uruchomienia reaktora. Pełna zgodność wizualna wszystkich okien klasycznego interfejsu, pozostałe ikony/geometria/czcionki oraz pełny zestaw callbacków. |
| HISTORY | Historia, wykresy i raporty przebiegów | Częściowo wykonany | Historie i końcowe raporty kompletnych scenariuszy, pełny zakres zmiennych instalacji oraz porównanie z oryginałem. Historia odzyskanej sesji z dostarczonego stanu i syntetycznego przykładu nie stanowi pełnego przebiegu PCTran. |
| E2E | Porównanie całych scenariuszy z PCTran | Całe przebiegi niesprawdzone | Uruchomienia oryginalnej aplikacji Windows, zgodne warunki i próbki 0–300 s: stan ustalony, sterowanie, awarie i zadania z handbooka. |

## Co faktycznie ubyło w ostatnich zmianach

- **2026-11-03-post-model-reaction-transfer** (INIT, STEP): Przeniesiono producenta transferu BFB4 i jego historie po modelu, przed energią reakcji/wodorem/bilansem. 216 przypadków/20542 sprawdzenia oraz osobny oryginalny błąd osobliwy; 200 testów Rust i Clippy przechodzą. Adapter zachowuje Double dla 110 stanów startowych. Uściślono backlog: FCO2/FH2O/FDEC były już wczytywane; pozostaje wcześniejsza zależność ewolucji węzłów modelu, nie ponowny port BFB4. Bez nowych instalatorów i testu Windows. Status: validated_partial. [Dowód](REACTION_TRANSFER_CONNECTIONS.md).
- **2026-11-03-containment-thermal-hydrogen** (INIT, AUTO, STEP, EVENTS, GUI, HISTORY): Przeniesiono energię reakcji BFB8 i zapłon/opóźnione spalanie/wygaszenie wodoru B754, z odzyskaną oryginalną krzywą progów. Czas zapłonu trafia do wspólnego zdarzenia4, a bieżące ciepło do bilansu. Dwa 16-krokowe łańcuchy obejmują cały odzyskany cykl spalania; 345 przypadków/26830 sprawdzeń i 194 testy Rust. Klasyczny Hydrogen oraz 25 serii historii korzystają z wyników. Nadal brakuje pełnych upstreamowych stanów reakcji/produkcji wodoru i całych scenariuszy. Bez przebudowy instalatorów. Status: validated_partial. [Dowód](CONTAINMENT_THERMAL_CONNECTIONS.md).
- **2026-11-03-containment-balance** (STEP, GUI, HISTORY): Połączono bilans obudowy, sprzężenie ścian i warunkowy solver równowagi: ewoluują ciśnienie/temperatura/poziom, widoczne na klasycznym schemacie i w 23 seriach historii. Aktualne przepływy powrotne zasilania/natrysku, polecenia i czasy zdarzeń są wiązane bez starych kopii. 154 przypadki/11359 sprawdzeń; 187 testów Rust i Clippy przechodzą. Pozostałe źródła cieplne/Double/stan awarii i pełna inicjalizacja nadal jawne. Bez przebudowy instalatorów. Status: validated_partial. [Dowód](CONTAINMENT_BALANCE_CONNECTIONS.md).
- **2026-11-03-containment-spray** (AUTO, STEP): Przeniesiono automatykę i chłodzenie natrysku obudowy 0x502480; połączono bieżące wspólne polecenia i zachowanie stanu sesji. Osobny mały raport: 202 przypadki/10424 sprawdzenia; 181 testów Rust i Clippy przechodzą. Pełny bilans obudowy oraz sterowanie natryskiem z klasycznego GUI pozostają otwarte. Instalatorów nie przebudowano. Status: validated. [Dowód](CONTAINMENT_SPRAY_CONNECTIONS.md).
- **2026-11-03-containment-fans** (AUTO, STEP, GUI, HISTORY): Przeniesiono cały odzyskany blok wentylatorów obudowy 0x5034b0 i jego automatykę. 720 przypadków, 32 połączone kroki i osiem ośmiokrokowych łańcuchów; sterowanie 75% z klasycznego GUI zgadza się z CLI i daje obliczone ciepło. Łącznie 24672 przypadki/653483 sprawdzenia i 176 testów Rust. Pełny bilans obudowy oraz pozostałe układy pozostają otwarte. Status: validated. [Dowód](CONTAINMENT_FAN_CONNECTIONS.md).
- **2026-11-03-classic-live-interface** (GUI, AUTO): Zastąpiono nowoczesny schemat klasycznym układem z dokumentacji; sesja może działać w głównym NSSS. Bezpośrednie polecenia grzałki i RCP oraz Step dają identyczny stan jak CLI; sprawdzono Start/Pause/Reset i wybór IC. Podłączono cztery obliczane temperatury gałęzi. Pełna identyczność okien i całe scenariusze nadal otwarte. Status: validated_partial. [Dowód](CLASSIC_INTERFACE_PARITY.md).
- **2026-10-21-live-simulation-mimic** (GUI): Podłączono obliczone ciśnienia/temperaturę/poziomy/przepływy do schematu podobnego do oryginału. Brakujące wskazania pozostają nieznane, bez podstawiania danych IC. Test mapowania i rzeczywiste kliknięcia otwierające Live simulation mimic przeszły. Status: validated. [Dowód](FRESH_STATE_AND_DOUBLE_INITIALIZATION.md).
- **2026-10-21-assembled-fresh-state** (INIT, GUI): Połączono wszystkie przeniesione zapisy i zachowano odniesienia: 290 Singles/28 pól całkowitych oraz Double/tablice dla 110 par źródłowych. GUI oblicza i zapisuje ten stan. Włączono dokładny odczyt Double z JSON. Pełny start i odtworzenie scenariuszy pozostają otwarte. Status: validated. [Dowód](FRESH_STATE_AND_DOUBLE_INITIALIZATION.md).
- **2026-10-21-double-model-initialization** (INIT): Przeniesiono ciągły numeryczny inicjalizator sześciowęzłowego modelu: 33 Double, 12 tablic, dwa początkowe zapisy temperatur i Variant Double zero. 240 przypadków; ewolucja pozostaje otwarta. Status: validated. [Dowód](FRESH_STATE_AND_DOUBLE_INITIALIZATION.md).
- **2026-10-21-startup-clock** (INIT): Odzyskano oryginalne DT/0.001 i floor do I16, z 240 porównaniami rzeczywistej biblioteki VB6 oraz odrzucaniem przepełnienia. Status: validated. [Dowód](FRESH_STATE_AND_DOUBLE_INITIALIZATION.md).
- **2026-10-21-simulation-workspace** (GUI, AUTO, HISTORY): Podłączono odzyskane kroki do rzeczywistego Start/Pause/Step/Reset, kontrolek urządzeń, wykresów i zapisu sesji. Wbudowany syntetyczny przykład; rzeczywiste kliknięcia i identyczny stan ręcznej grzałki w GUI/CLI. Pełny start IC i całe scenariusze pozostają otwarte. Status: validated. [Dowód](SIMULATION_WORKSPACE_CONNECTIONS.md).
- **2026-10-21-loop-thermal-feedback** (STEP): Połączono późne temperatury obu gałęzi i historie filtrów po bilansie pierwotnym, przed bilansem strumieni/integracją: 640 ciągłych przypadków i 16 ośmiokrokowych łańcuchów. Status: validated. [Dowód](SIMULATION_WORKSPACE_CONNECTIONS.md).
- **2026-10-21-startup-primitives** (INIT): Odzyskano stałe początkowe oraz geometrię (321 przypadków); backend świeżego startu dostarcza 130 Singles i 15 flag dla wszystkich 110 par model/IC. Status: validated. [Dowód](SIMULATION_WORKSPACE_CONNECTIONS.md).
- **2026-10-21-session-history** (HISTORY): Dodano wykonanie sesji z eksportem faktycznych próbek do JSON/CSV i interaktywnego raportu HTML. Pełna inicjalizacja, GUI i długie scenariusze pozostają otwarte. Status: validated. [Dowód](RECOVERED_SESSION_CONNECTIONS.md).
- **2026-10-21-stateful-sessions** (AUTO, STEP): Dodano sesję zachowującą polecenia wszystkich przeniesionych urządzeń, w tym grzałek i natrysku w ich właściwej fazie obliczeń. 12 ośmiokrokowych łańcuchów oryginalnych fragmentów; zapis/wznowienie i wycofanie całej serii przy błędzie. Status: validated. [Dowód](RECOVERED_SESSION_CONNECTIONS.md).
- **2026-10-21-supply-system** (AUTO, STEP): Przeniesiono cały odzyskany blok zasilania/wtrysku/recyrkulacji/chłodzenia: 960 ciągłych przypadków x86 i 96 połączonych aktualizacji. Sterowanie, ciepło, przepływ i entalpia trafiają do dalszych obliczeń. Status: validated. [Dowód](SUPPLY_SYSTEM_CONNECTIONS.md).
- **2026-10-21-accumulator-system** (AUTO, STEP): Połączono aktywację, zawory, opróżnianie i ciśnienie gazu akumulatora z oryginalnymi globalnymi stanami: 640 ciągłych przypadków x86 oraz 64 połączone aktualizacje. Aktualny wypływ trafia do sumy źródeł i bilansu; ręczne zamknięcia oraz wycofanie przy błędzie są zachowane. Status: validated. [Dowód](ACCUMULATOR_SYSTEM_CONNECTIONS.md).
- **2026-10-20-connected-normal-thermal** (INIT, STEP, EVENTS): Podłączono normalne obliczenia cieplne obu pętli przed SG/bilansem/integracją, wraz z oryginalnym wspólnym czasem zdarzenia i kopią odniesienia A do B: 128 porównań bez zapisanych wyników ciepła/poziomów. Backend inicjalizacji rozszerzono o odzyskany współczynnik i przelicznik: 107 Singles i 14 flag dla wszystkich 110 par. Zewnętrzny model i pełny dispatcher nadal pozostają otwarte. Status: validated. [Dowód](CONNECTED_THERMAL_TRANSFER.md).
- **2026-10-20-restored-controls-events** (INIT, EVENTS, AUTO, STEP): Odzyskano przywrócenie zegara/odniesień oraz przeliczanie 20 czasów zdarzeń (400 przypadków), zachowując zapisany bor i historie. Czasy i flagi z tablic zdarzeń połączono z RCP/SG i integratorem (32 dodatkowe porównania). Pełny odczyt zapisów, Reset/restore i dispatcher pozostają otwarte. Status: validated. [Dowód](RESTORED_CONTROLS_AND_EVENTS.md).
- **2026-10-20-late-thermal-initialization** (INIT, AUTO, STEP): Przeniesiono 28 późnych wartości i trzy flagi inicjalizacji (320 przypadków); backend GUI/CLI rozszerzono do 105 Singles i 14 flag dla 110 par model/IC. Dodano osobny etap 11 początkowych historii sterowania z jawną flagą awarii (320 przypadków). Pełny Reset/restore i zewnętrzny model pozostają otwarte. Status: validated. [Dowód](LATE_THERMAL_INITIALIZATION.md).
- **2026-10-20-steam-auxiliary-system** (AUTO, STEP): Zamknięto pozostałą lukę regulacji zasilania SG: 640 przypadków pomocniczych, 320 ciągłych wykonań oryginalnego bloku SG i 32 dodatkowe połączone aktualizacje. Zweryfikowano też, że obie ścieżki końcowego bilansu korzystają z przepływu całkowitego; skorygowano wcześniejszą notatkę. Status: validated. [Dowód](STEAM_SYSTEM_CONNECTIONS.md).
- **2026-10-20-steam-valves** (AUTO, STEP): Przeniesiono decyzje urządzeń/zaworów SG i połączono produkcję wypływu z bilansem/integratorem: 1200 przypadków i 32 dodatkowe połączone aktualizacje. Pozostała granica SG zawęża się do 0x50a8a6–0x50ac31; etapy i kryteria odbioru pozostają te same. Status: validated. [Dowód](STEAM_VALVE_CONNECTIONS.md).
- **2026-10-20-steam-control-prefix** (AUTO, STEP): Przeniesiono początkowy blok sterowania obu SG (960 przypadków) i podłączono go do odzyskanego kroku (32 dodatkowe porównania). Entalpie SG są obliczane w kroku; wspólny czas i stan awarii przechodzą z A do B. Dalsza automatyka SG pozostaje w dotychczasowych etapach. Status: validated. [Dowód](STEAM_CONTROL_CONNECTIONS.md).
- **2026-10-20-rcp-control** (AUTO, STEP): Zamknięto producent przełączeń/celów przepływu RCP i podłączono go do odzyskanego kroku: 768 przypadków oraz 32 połączone aktualizacje. Pozostałe zadania zostają pod dotychczasowymi etapami. Status: validated. [Dowód](RCP_CONTROL_CONNECTIONS.md).
- **2026-10-20-primary-devices** (INIT, AUTO, STEP): Dodano automatykę upustu/uzupełniania/wtrysku, dynamiczne odniesienia i 25 zapisów inicjalizacji; połączono je z odzyskanym krokiem. Status: validated. [Dowód](PRIMARY_DEVICE_CONNECTIONS.md).

## Ostatni zweryfikowany zestaw

- Przypadki komponentów i połączonych fragmentów: **24672**.
- Sprawdzenia wyjść: **653483**.
- Testy Rust: **200**.
- Osobny raport natrysku obudowy: **202 przypadki / 10424 sprawdzenia**. [Tabela](containment-spray-comparison/results.html).
- Osobny raport bilansu obudowy/solvera: **154 przypadki / 11359 sprawdzeń**. [Tabela](containment-balance-comparison/results.html).
- Osobny raport źródeł cieplnych i wodoru: **345 przypadków / 26830 sprawdzeń**. [Tabela](containment-thermal-comparison/results.html).
- Nowy raport transferu i historii: **216 przypadków / 20542 sprawdzenia**, plus osobny oryginalny przypadek błędu. [Tabela](reaction-transfer-comparison/results.html). Pełnego starego raportu i instalatorów nie przebudowano.
- Całe scenariusze oryginalnej aplikacji Windows kontra RustTran: **jeszcze niezweryfikowane**.

[Kolorowa tabela porównań](component-comparison/results.html) · [Szczegóły ostatniej walidacji](latest-validation.json).

## Pokrycie wybranych fragmentów — osobno od gotowości programu

| Zakres | Sprawdzone | Pozostało w tym zakresie |
|---|---:|---:|
| Primary phase-flag branch numerical bodies | 4/4 | 0 |
| Primary core connected derivative outputs | 5/5 | 0 |
| IC thermodynamic field loading | 104/109 | 5 |
| Basic model field loading | 135/135 | 0 |
| Main integration stage | 14/14 | 0 |
| Main derivative output equations | 14/14 | 0 |

Pozostałe pola IC: FWERA0, FWERB0, PERA0, PERB0, ERL0. Wszystkie 135 pól modelu ma konwersję, ale pełna inicjalizacja po wczytaniu nadal wymaga pracy.

## Dlaczego wcześniej lista wyglądała na rosnącą

Poprzednie wpisy łączyły zakończone porty liczbowe, integrację i gotowe funkcje użytkowe. Określenie „pozostało połączenie układów” było zbyt ogólne: obejmowało też nieodtworzone sterowanie i inicjalizację. Kolejne analizy odsłaniają szczegóły tych zależności; mogą też ujawnić rzeczywiście dodatkowy zakres. Nowe, niezależne wymagania będą zapisane w scope_discoveries, zamiast po cichu zmieniać mianownik postępu.

Inwentarz procedur jest zachowany w JSON do audytu, ale nie jest licznikiem zadań ani procentem ukończenia: obejmuje także obsługę starego GUI i VB6.

Pełne kryteria odbioru i rejestr zmian: [CONVERSION_MILESTONES.json](CONVERSION_MILESTONES.json). Wcześniejsze szczegółowe notatki: [CONVERSION_HISTORY.md](CONVERSION_HISTORY.md). Kolejność zależności technicznych: [NEXT_ENGINE_WORK.md](NEXT_ENGINE_WORK.md).

Aktualizacja obu plików postępu: `python3 scripts/update_conversion_progress.py`.

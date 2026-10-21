# Wcześniejsze notatki konwersji

Zapis przeniesiony z pliku postępu podczas jego uporządkowania 20 października 2026. Bieżący stan i kryteria odbioru są w CONVERSION_PROGRESS.md.

# Postęp konwersji RustTran

Aktualizacja: 20 października 2026.

**Pełny zamiennik PCTran: jeszcze nieukończony.** Ogólny procent nie jest wyliczany, ponieważ lista zachowań oryginału nie została jeszcze w pełni ustalona. Każdy procent poniżej dotyczy tylko wskazanego, policzalnego zakresu.

| Zakres | Przepisane i sprawdzone | Pozostało | Procent tego zakresu |
|---|---:|---:|---:|
| Primary phase-flag branch numerical bodies | 4/4 | 0 | 100.0% |
| Primary core connected derivative outputs | 5/5 | 0 | 100.0% |
| IC thermodynamic field loading | 104/109 | 5 | 95.4% |
| Basic model field loading | 135/135 | 0 | 100.0% |
| Main integration stage | 14/14 | 0 | 100.0% |
| Main derivative output equations | 14/14 | 0 | 100.0% |
| Complete end-to-end requested features | 0/4 | 4 | 0.0% |

Nowy etap: połączony fragment obiegu pierwotnego przeszedł 160 porównań wykonywanych w jednej maszynie i ramce oryginału. Przeniesiono cztery gałęzie flag (640), aktualizację stanu fazy (640), przepływy i zatrzask ciśnienia (400), pojemność cieplną (240) oraz końcową korektę bilansu (240). Dodano sterowanie grzałkami: 800 porównań gałęzi liczbowych oraz 160 połączonych przypadków bilansu z grzałkami. Następnie przeniesiono wybór natrysku, blokady pomp i przepływ (640), wspólny sygnał ciśnienia (300) oraz połączony bilans z natryskiem i grzałkami (160). Grzałki wykorzystują aktualny poziom i obliczają ciepło przed końcową korektą energii. Sygnał ciśnienia można obliczyć jako ciśnienie minus korekta; świeży start ma już potwierdzone odniesienie równe nominalnemu ciśnieniu modelu oraz blokadę równą poziomowi razy 100 (300 porównań). Aktualizacja stanu po bilansie ma 320 porównań; sygnał ciśnienia, sterowanie, bilans i aktualizacja stanu są teraz połączone (160 porównań). Gałąź nowego startu obiegu ma 240 porównań, połączona inicjalizacja z masą i poziomem 240, a wspólny kod inicjalizacji dla GUI/CLI został porównany dla 110 par model/punkt pracy. GUI ma działający panel obliczania stanu początkowego obiegu i obu wytwornic pary. Dodano inicjalizację fazy/poziomów SG (320), przepływów zasilania (300), połączoną inicjalizację cieplną dla 110 par model/punkt pracy oraz integrator we wspólnym stanie wraz ze zdarzeniem czasowym (36 porównań całego fragmentu oryginału). Wyzerowanie 14 bieżących wyjść inicjalizatora ma potwierdzone instrukcje; nie oznacza to inicjalizacji historii pochodnych. Dodano dopływy i strumienie fazowe (300), powiązanie upustu ze wspólnym stanem (300), stan po upuście (240), połączone aktualizacje obiegu (32), w tym z obliczaniem obu SG (32), i sekwencje trzech aktualizacji (8 + 4 sekwencje). Osobno potwierdzono 18 wartości z obrazu procesu przed inicjalizacją aplikacji: historię pochodnych, dwa akumulatory i dwa pola poprzedniego przepływu. Te wartości obrazu nie zastępują odtwarzania zapisów ani semantyki Reset. Pełny przebieg instalacji pozostaje nieprzeniesiony. Dodano dynamiczne odniesienia temperatury/poziomu (320), automatykę upustu, uzupełniania i wtrysku z regulatorem PI oraz krzywą pomp (960), 25 zapisów stanu początkowego (320) i rozszerzono połączoną inicjalizację wszystkich 110 par do 79 wartości Single i 11 flag. Automatyka i odniesienia są połączone z oboma SG, bilansem i integratorem (32 przypadki). Nadal wymagane są kompletna inicjalizacja/odtwarzanie scenariuszy, pozostałe układy i dyspozytor GUI. Szczegóły: PRIMARY_DEVICE_CONNECTIONS.md.
Inwentarz: 473 natywne procedury bez importów i trampolin. 17 ma sprawdzony port funkcji liczbowych, 17 jest częściowe, 0 ma tylko odzyskane dane analizy, a 439 nie ma jeszcze odnotowanego portu. Różne procedury mają bardzo różną wielkość, a część jest obsługą VB6 zastępowaną nowym interfejsem — te liczby nie są procentem gotowości programu.

Dodano liczbową procedurę wymiany ciepła obu pętli (300 przypadków), 15 wartości referencyjnych (110 par model/IC) i 9 właściwości obiegu pierwotnego (240 przypadków). Modyfikator 0x54ba68 ma teraz sprawdzony port zwykłej gałęzi pracy (320 przypadków); połączona inicjalizacja i obie pętle przeszły 330 porównań. Zegar i czasy awarii są jawne. Przeniesiono także wybór gałęzi cieplnej i jej obliczenia dla dodatkowego modelu (400 przypadków), alternatywne ciepło powyłączeniowe (300), regulator wytwornic pary (350 + 180 z połączeniem stanu), obliczenia przed głównym bilansem (300), połączone aktualizacje pomp (320) i właściwości cieczy (200) i masę czynnika oraz pięć wielkości głównego bilansu (300) oraz gałąź bez zmiany fazy z trzema brakującymi wielkościami bilansu ciśnienia (300). Dane dodatkowego modelu i flagi są nadal jawne; jego cały silnik oraz dyspozytor zdarzeń wymagają dalszej pracy. Dodano wypływ przez zawory, końcowe bilanse wytwornic pary, regulator PI, krzywe pomp, aktywację zbiornika chłodzenia i ubytek zbiornika zasilającego. Wszystkie 14 końcowych wejść integratora ma sprawdzone równania; nadal brakuje części obliczeń poprzedzających te równania oraz kompletnej inicjalizacji i obsługi zdarzeń. Dodano limit wypływu pary, obliczenia początkowej masy stabilizatora ciśnienia i ciepła pętli; 12 stanów integratora można odtworzyć z IC, a dwa pozostałe i historię pochodnych trzeba dostarczyć jawnie.

## Pozostałe pola inicjalizacji IC

- FWERA0: no field-name reference located
- FWERB0: no field-name reference located
- PERA0: no field-name reference located
- PERB0: no field-name reference located
- ERL0: no field-name reference located

## Pozostałe pola modelu

Brak — wszystkie 135 pól źródłowych ma sprawdzoną konwersję. Inicjalizacja po wczytaniu nadal wymaga pracy.

## Pozostałe funkcje użytkowe

- Pełne obliczenia instalacji wraz z inicjalizacją i wszystkimi zależnościami.
- Działające sterowanie urządzeniami podłączone do obliczeń.
- Awaria, opóźnienie/rampa i reakcje zabezpieczeń.
- Historia zmiennych, wykresy i raporty z rzeczywistych przebiegów.

Przy każdej kolejnej konwersji aktualizuj status, dowód źródłowy i test porównawczy. Nie oznaczaj funkcji jako ukończonej na podstawie samego podobnego wyglądu GUI.

# Odzyskanie kodu i danych Lotus Turbo Challenge II

Źródło: `C:\gregor\gry\Lotus Trilogy PC Port\2\disk1.adf`, 901120 bajtów. SHA-256 przed i po analizie: `82dc1faf56823653cd3b0b299e179932c1fae117b03cae220e121d96ae8b3a06`. Nie zmieniono obrazu.

## Metoda

REA 6.8.0 w poprzednim etapie odrzuciło ADF oraz raw m68k na Windows. Nie przypisujemy mu odzyskanej dekompilacji. W tym etapie użyto Capstone 5.0.9 do dezasemblacji i Unicorn 2.1.4 do wykonania kodu m68k. Próba dostępu do znalezionego w wyszukiwarce repozytorium `CrownParkComputing/Lotus2-Native` zakończyła się 404; nie pobrano ani nie wykorzystano z niego kodu. Nie wykorzystano kodu Nelumbo.

1. Bootblock ustawia odczyt `0x7600` bajtów z offsetu dysku `0xd3200` pod adres `0x60000`. Wykonano ten blok od `0x60008` w odizolowanej pamięci procesora M68000.
2. Oryginalny loader przenosi swój dekompresor pod `0x7f500`, rozpakowuje kod i wraca do `0x104`. W próbie odzyskania wykonał 2 284 529 instrukcji. Na tym etapie nie uruchamiano pełnej gry; późniejsze porównanie v2 opisano poniżej.
3. Końcowy blok pod `0x5f10c` opisuje relokację: `0x50000..0x51800` do `0x200..0x1a00`, następnie dalszy kod do `0x727d8..0x80000`. Wykonano równoważne kopiowanie pamięci i zachowano `assets/resident.bin`.
4. Istotny szczegół: bootstrap zapisuje `0x10964` pod `0x100`, a następnie wstawia tę wartość do argumentu odejmowania loadera. Tabela zasobów ma offsety logiczne z bazą `0x10d64`, więc zasób 0 zaczyna się fizycznie w ADF pod 1024, a nie pod zero.
5. Tabela 257 offsetów jest pod `0x2c4`, a tabela kolejnych indeksów pod `0x6c8`. Odzyskano **201 niepustych zasobów**. Procedura oryginalnego dekompresora pod `0x11bc` rozpakowała formaty SA/SC/SP/SF. Każde wywołanie musiało wrócić, a rozmiar wyniku był kontrolowany. Raport indeksów, offsetów, rozmiarów i SHA-256: `asset-index.json`.

## Kod wykonywany podczas jazdy

| Adres m68k | Rola ustalona z instrukcji i kontrolowanych prób |
|---|---|
| `0x771f8` | przygotowanie skumulowanych wartości krzywizny i wysokości w rekordach trasy |
| `0x78a04` | integracja pozycji i ruchu poprzecznego, granice pobocza i powierzchnia |
| `0x78692` | odczyt obiektów checkpointu i przyznanie czasu, z ograniczeniem do 99 sekund |
| `0x7864e` | zegar oparty na 50 taktach na sekundę |
| `0x78bb6` | odczyt lokalnych wartości drogi dla samochodu |
| `0x7871c..0x78a02` | wejścia kierowcy, bezwładność skrętu, silnik, hamowanie i biegi |

Adapter zachowuje oddzielny rekord samochodu dla każdego z czterech graczy. Kod procedur pozostaje oryginalny. Jedyny lokalny stub w odzyskanym obrazie roboczym to `0x73740`: zwraca -1 zamiast przydzielać kanał DMA Amigi. Dźwięk obsługuje nowy host, a nie emulowane układy Paula. Nie nadpisuje to pliku `resident.bin` na dysku.

Oryginalne tabele osiągów i przełożeń są pod `0x74f8e..0x751f8`. Zasób 35 zawiera wspólne parametry, szerokości drogi, mapy powierzchni i palety. Zastosowano mapy powierzchni od offsetu `0xf50 + 64*nr_trasy` tego zasobu. Rekord wejściowy trasy ma 12 bajtów; adapter rozszerza go do 16 bajtów tak jak oryginalna pętla `0x77116`, potem wykonuje `0x771f8`.

Nie przeniesiono całej głównej pętli, wszystkich wywołań, blittera, przerwań, serial linku ani wszystkich oryginalnych podsystemów. Jest to **wykorzystanie oryginalnych podsystemów**, nie dowód zgodności całego gameplayu 1:1.

## Muzyka, efekty i grafika

Zasoby 36, 37, 38 oraz 40–47 zawierają nagłówki MOD i patterny, ale sample są osobno, w banku 48–87. Długość każdego niepustego instrumentu pasuje do dokładnie jednego sampla w tym banku. Rekonstrukcja dopisuje te bajty w kolejności instrumentów. Kontrole porównują każdy dopisany fragment bajt po bajcie z odzyskanym samplem i sprawdzają rozmiar całego MOD. Powiązania zapisano w `music-sources.json`. Jest 11 kompletnych plików, z których `title.mod` pochodzi z zasobu 38 (`new`).

Efekty mają 14-bajtowy nagłówek: długość, okres i parametry odtwarzania. Pierwotny adapter używał sampla 96 jako silnika, 104 dla wszystkich zderzeń, 88/89/90 dla sygnałów startowych i 91 dla checkpointu. W v3.2 routing dźwięków i sterowanie silnikiem poprawiono zgodnie z sekcją poniżej. Źródłowe sample są oryginalne; mikser, głośności, wybór kanałów i zmiany wysokości silnika należą do adaptera.

W SA ostatnia płaszczyzna jest maską, a pozostałe zawierają kolor. Paleta obiektów jest w zasobie 35 pod `0x1a0 + 32*nr_trasy`. Sprite samochodu z zasobu 126 ma dziewięć dużych klatek skrętu, po których następują mniejsze warianty. Tła 16–23 są bitmapami 160×100 z własnymi paletami SC. Oryginalne piksele są skalowane na ekran HD.

`resident-disassembly.asm` to liniowa dezasemblacja regionu rezydentnego. Zawiera także tablice i inne dane odczytane jako instrukcje, więc nie należy traktować jej jako odtworzonego źródła asemblerowego gotowego do ponownej kompilacji.

## Odtwarzalność

Z folderu gry: `python prepare_original.py "C:\gregor\gry\Lotus Trilogy PC Port\2\disk1.adf"`.

Wymagania przygotowania: Python, Unicorn 2.1.4, Capstone 5.0.9, NumPy i Pillow. Skrypt tworzy ponownie `assets` i manifesty w `analysis` na podstawie obrazu. Nie zapisuje do ADF.

## Pakowanie Windows

Próba zwykłego EXE PyInstaller 6.20.0 kończyła się `0xc0000409` w VCRUNTIME140. Jest to opisany konflikt Unicorn z CFG w standardowym bootloaderze: [zgłoszenie Unicorn](https://github.com/unicorn-engine/unicorn/issues/2281), [obsługiwana opcja budowania bootloadera PyInstaller](https://github.com/pyinstaller/pyinstaller/pull/9390).

Zbudowano osobny lokalny bootloader PyInstaller v6.20.0 (`8a6172796b56aa428980c3628663ba08e77ad81e`) poleceniem `python waf all --no-cfg` i użyto go do tego programu. Nie zmieniano ustawień zabezpieczeń Windows ani globalnej instalacji PyInstaller. `build.ps1` odtwarza tę procedurę z narzędziami MSVC. Wynik uruchomienia finalnego EXE znajduje się w `release-verification.json`.


## Porównanie z działającym oryginałem i poprawki v2

Oryginalny ADF uruchomiono w oficjalnym rdzeniu PUAE libretro (5.3.1, c1d1d49), model A500, PAL, CPU exact, z istniejącym lokalnie ROM-em Kickstart 1.3. Obraz dysku kopiowano do katalogu roboczego; źródłowy ADF pozostał niezmieniony. ROM-u ani rdzenia emulatora nie dołączono do dystrybucji. Dokumentacja rdzenia: https://docs.libretro.com/library/puae/ .

Porównanie obejmowało ekran startowy, odliczanie, początek Forest i przejazd z trzymanym gazem oraz ręcznymi zmianami biegów w klatkach 100, 250, 400 i 550. Zrzuty obrazu i telemetria są w `reference`. Licznik klatek ma częstotliwość 50 Hz. W adapterze skompensowano trzy początkowe takty odliczania. W klatce 201 prędkość wewnętrzna wyniosła 2499 w obu wersjach; położenie 8.87010 i 8.82718 rekordu trasy. W klatce 601 prędkości wyniosły 4154 i 4159. Dalszy przejazd rozbiega się wskutek sterowania i kontaktów. Te wyniki potwierdzają wybrane podsystemy, nie całą grę ani identyczność obrazu.

Dodatkowo włączono następujące oryginalne procedury:

| Adres | Zastosowanie |
|---|---|
| `0x7724c` | przygotowanie granic ruchu na drodze |
| `0x77fd4` | kolizje z obiektami otoczenia |
| `0x78442` | kolizje z samochodami przeciwników |
| `0x78600` | reakcja na kontakt samochodów graczy połączonych linkiem |
| `0x7afb6` | ruch dziesięciu samochodów AI |

`assets/reference-npc-start.bin` zawiera 120 bajtów początkowych rekordów AI odczytanych ze stanu działającej gry przed startem. To osobna próbka stanu wykonania, a nie kolejny zasób dysku; skrypt przygotowania zapisuje również tę utrwaloną próbkę. Identyfikatory żądanych efektów są przechwytywane przy `0x73740`; odtwarzanie dźwięku nadal realizuje host.

Przyczyną spadku szybkości były przede wszystkim zapytania o pliki sprite’ów podczas każdej klatki oraz przeglądanie całej listy scenerii. Dodatkowo ograniczenie dt do 0.05 s przy około 5 FPS powodowało zwolnienie czasu symulacji. W v2 użyto pamięci podręcznej i lokalnych koszyków obiektów, a symulacja wykonuje kroki 50 Hz z nadrabianiem zaległości do 0.25 s. Szczegółowy wynik bieżącego pomiaru jest w `../playability-verification.json`; jest to pomiar poza ekranem, nie gwarancja FPS na każdym monitorze.

Poprzednie połówkowe wychylenie drążka niemal znosiło się z natywnym centrowaniem. Adapter pośrednich wychyleń ustawia teraz proporcjonalny cel przechyłu i dochodzi do niego z natywną szybkością skrętu; skrajne wychylenia i neutralny drążek zachowują oryginalną logikę. Gaz analogowy jest modulowany w taktach 50 Hz, a hamulec ma proporcjonalną siłę. Testowane cele dla 0/25/50/75/100% drążka to 0/8/16/24/32.

Host nadal określa obwiednię spotkania czterech lokalnych graczy, a po jej przekroczeniu wywołuje natywną reakcję `0x78600` dla obu samochodów. Nie emuluje protokołu serial link. Pełne pogodowe efekty, tunele i wszystkie szczególne mechanizmy przeszkód pozostają niekompletne.


## Kalibracja obrazu i sterowania v3

Porównanie 750 kolejnych klatek ujawniło błędy renderera v2 pomimo użycia natywnego silnika. W v3 wspólna szerokość samochodu w świecie wynosi 64, połowa szerokości jezdni 256, ogniskowa 0.9. Kamera znajduje się 64 jednostki (0.35556 rekordu) za graczem, a oś głębokości ma mnożnik 2.25 i wysokość kamery 96. Horyzont leży na 68% wysokości obrazu, a płaszczyzna kontaktu gracza na 98%. Daje to 20% szerokości ekranu dla auta na wysokości gracza. Wcześniejsza kamera była odsunięta o około 1326 jednostek (7.37 rekordu), powodując zbyt wolny przepływ najbliższego odcinka drogi.

Dla rzeczywistej klatki 400 najbliższy przeciwnik jest około 1.508 rekordu przed graczem. Zmierzona orientacyjnie szerokość w oryginalnym kadrze 320 px to około 12 px; nowa projekcja daje 12.21 px. W identycznej odległości inne auto ma teraz dokładnie rozmiar gracza zamiast 66% jego szerokości. Głębokość obiektów jest projektowana bezpośrednio, a nie zaokrąglana do próbki drogi. Skala krzywizny wynosi 2.5 zamiast 20, a profil wysokości rozwijany jest bez przeskoku przy przepełnieniu bajtu. Są to parametry adaptera dopasowane do materiału odniesienia, nie odzyskany w całości renderer Amigi.

Przykładowe klatki i film `v3-comparison/amiga-vs-v3-15s.mp4` pokazują obraz z Amigi i nowy renderer przy dokładnie tych samych pozycjach gracza i dziesięciu aut AI. To izoluje poprawę grafiki od przebiegu niezależnej fizyki. Nadal nie ma dowodu identyczności pełnej gry.

Grafika `racing-sky-0.png` pochodzi z mediany obrazów oryginalnego nieba Forest dla klatek 50..450 co dziesięć klatek; usunięto HUD z górnych 45 wierszy. Jest osobną próbką obrazu wykonania gry, podobnie jak próbka startowych rekordów AI. Utrwalono ją w skrypcie przygotowania, aby czyste odtworzenie zasobów działało. Tła 16..23 to obrazy 160×100; wcześniejsze dekodowanie 320×50 tworzyło dwa widoczne sąsiadujące obrazy.

Zmieniono początkowe pozycje lokalnych graczy na cztery różne pasy przy tej samej pozycji wzdłuż trasy. Poprzedni start części graczy wewnątrz siatki AI prowokował szybkie przypadkowe kontakty. Poprawiono także błąd adaptera proporcjonalnego hamulca: kompensacja cyfrowego hamowania działa tylko wtedy, gdy rzeczywiście wciśnięto natywny bit hamulca. Sygnał poniżej martwej strefy nie może zwiększać prędkości. Nie zmieniano oryginalnych tablic przyspieszenia i przyczepności.

Weryfikacja v3 obejmuje 34 kontrole bazowe, 23 kontrole grywalności i 14 nowych regresji perspektywy oraz zachowania (łącznie 71). Wyniki i ograniczenia są w JSON-ach obok gry. Kontrole nie zastępują oceny użytkownika ani porównania pełnej kampanii. Fizyczny pad nie był podłączony.


## Audio i zdarzenia v3.2

Na rzeczywistym urządzeniu Windows poprzednia prośba o mikser 22050 Hz mono kończyła się formatem `(22050, -16, 2)`. Bufor pojedynczej próbki mono był więc czytany jako stereo, z dwukrotnie krótszą długością i podniesionym tonem. Obecny kod prosi o 44100 Hz stereo i zawsze sprawdza rzeczywisty format, resampluje do jego częstotliwości i powiela kanały w układzie interleaved. Próbki nadal pochodzą z zasobów 88..111, z 14-bajtowym nagłówkiem; długość w słowach, okres Paula i głośność są odczytywane z nagłówka. Głosy, po poprawieniu mapowania w v3.3: 88 Marks, 89 Set, 90 Go, 91 Checkpoint; okres 214. Ich czasy w poprawionym stereo (Marks, Set, Go, Checkpoint) to około 0.572, 0.459, 0.404, 0.698 sekundy. Mikser przy uruchamianiu na urządzeniu był stereo; testy obejmują też mono oraz 22050/44100/48000 Hz.

Procedura `0x732d2` dzieli `0xFCC3A` przez natywne obroty i ogranicza okres do minimum 124. Kod `0x7331e` wybiera źródło 96 lub 97 według flagi samochodu. Host używa tych samych sampli i okresów, a 40-ms bufory resamplera zachowują fazę między zmianami obrotów. Reakcje na zderzenia nie są już mapowane zbiorczo na sample 104: host odtwarza rzeczywisty identyfikator otrzymany przy `0x73740`. Pozostaje to miksowanie w SDL, nie pełna emulacja Paula/filtru.

Błąd komunikatu checkpointu miał dwie przyczyny: niewidoczne obiekty 120/121/122 oraz warunek `remaining_time > previous_time + 1`, który rozpoznawał także natywny bonus czasu jako checkpoint. Wyzwalanie korzysta teraz z pola latch `car+0x18` ustawianego przez `0x78692` oraz indeksu odczytu `car+0x08`, sprawdzonego w liście checkpointów trasy. Odnotowane bramki są deduplikowane osobno dla każdego kierowcy. Obiekty START/CHECK/FINISH mają teraz widoczną belkę i słupki w odpowiedniej pozycji świata.

Belki Forest mają identyfikator 131. Procedura `0x78326` ustawia prędkość pionową `car+0x3E` i flagę lotu `car+0x40`, a `0x78746` wykonuje trajektorię. Wyjściowa wysokość `car+0x3C` jest dodatnia podczas lotu. Poprzedni renderer dodawał tę wysokość do ekranowego Y, chowając auto pod drogą. Obecnie odejmuje ją od Y; analogicznie renderuje skok innych lokalnych graczy. Próba na belce przy rekordzie 428 wykazała dodatnią wysokość, maksimum 74.421875 jednostki adaptera oraz powrót na ziemię. Nie dodawano sztucznego wybicia omijającego oryginalne warunki.

Odtwarzany podczas wyścigu `title.mod` jest odzyskanym oryginalnym utworem tytułowym, włączonym tam zgodnie z życzeniem użytkownika. Nie oznacza to, że oryginał Amigi odtwarzał ten utwór w czasie każdej trasy. Źródła patternów i sampli są w `music-sources.json`.


## Dopasowanie do wskazanego longplaya — v3.3

Podany film YouTube `JLlWlsb9GpQ` ma tytuł „Lotus Turbo Challenge 2 Longplay (Amiga) [50 FPS]”, autor AL82 Retrogaming Longplays (metadane oEmbed). Na początku oryginalnego programu procedura `0x731b0` pobiera zasób 36; nagłówek modułu brzmi `bootup`. Moduł 38 ma tytuł `new` i jest innym utworem. Menu adaptera przełączono na zasób 36. Nie pobierano ani nie dołączano filmu z YouTube: źródłem modułu pozostaje przekazany dysk ADF i udokumentowana rekonstrukcja.

Ostateczne mapowanie startu sprawdzono bezpośrednio z instrukcji: `0x73472 = MOVEQ #$58,D0`, `0x7347c = MOVEQ #$59,D0`, `0x73486 = MOVEQ #$5A,D0`. Licznik `g+0x2F8A` przechodzi przez -150, -75, 0; to odpowiednio Marks (88), Set (89), Go (90). Poprzednie zapewnienie o odwrotnej kolejności bazowało na błędnym opisie nazw próbek w teście. W v3.3 test niezależnie odczytuje te trzy instrukcje i sprawdza kolejność oraz momenty 0/1.5/3 sekundy.

Oryginalny sygnał poślizgu obejmuje też buksowanie podczas przyspieszania. Na życzenie użytkownika host dopuszcza pisk wyłącznie przy niezerowej krzywiźnie drogi, skręcie ponad 0.12 zakresu, prędkości ponad 200 jednostek adaptera i na ziemi. Powrót na prostą zatrzymuje kanał. Fizyka nadal wykonuje natywny kod.

Checkpoint ma lokalny efekt dwóch półprzezroczystych jasnych błysków przez 0.72 s; inne widoki pozostają bez błysku. Timer gry wyłączono przez pominięcie `0x7864E` w adapterze używanym przez Game oraz zablokowanie zakończenia wyścigu na podstawie zerowego czasu. Osobne bezpośrednie próby OriginalCore domyślnie nadal mogą uruchamiać natywny zegar do porównania. Przejazd przez metę zachowuje zakończenie ukończonej trasy.


## Obraz i prowadzenie v3.4

Cyfry odliczania zastąpiono napisami MARKS/SET/GO!, zgodnie z etapami startu (3..1.5 s, 1.5..0 s i pierwsze 0.75 s jazdy). Przegląd kolejnych klatek oryginału (`v34-original-wheel-frames.png`) pokazuje ruch przez drobne zmiany cieniowania opon, nie obracanie całego sprite’a auta. W adapterze czterofazowy wzór bieżnika dotyczy dolnych ciemnych obszarów oryginalnej opony, rozpoznawanych przed nałożeniem koloru karoserii. Faza wynika z przebytej drogi. Przy zerowej prędkości wzór pozostaje statyczny. Jest to animacja hosta inspirowana oryginałem, nie deklaracja zgodności jej pikseli klatka po klatce.

Strefa natywnego kontaktu aut wynosi 0x2000/65536 = 0.125 rekordu, czyli 22.5 jednostki adaptera. W obrębie tej strefy renderowany przeciwnik zachowuje bazową skalę gracza. Dalsza perspektywa jest liczona z efektywnej odległości `max(0, relative_z - 22.5)`. Pozostawiono widoczne nadwozie podczas mijania, nawet gdy punkt styku kół wypada poniżej dolnej krawędzi ekranu. Fizyczne obwiednie nie zostały z tego powodu powiększone.

Natywne `0x78BCA` ustawia siłę krzywizny skokowo jako podwojony bajt 0 rekordu. W Game włączono opcjonalny ramping wejścia: przed natywną integracją `0x78A04` adapter podaje interpolację krzywizny poprzedniego i bieżącego rekordu z funkcją smoothstep u²(3−2u). To zmienia narastanie siły, zachowując pełną wartość w ustalonym zakręcie. Rejestrowany maksymalny skok bocznego przyrostu w izolowanej próbie spadł z 0.010809 do 0.001603 jednostki znormalizowanej na takt. Renderowanie dodatkowo interpoluje stan poprzedni/bieżący przy 50 Hz fizyki, nie modyfikując stanu kolizji. Jest to zamierzona adaptacja prowadzenia, a nie pełna identyczność z oryginalnym silnikiem.

Nowe tła wszystkich ośmiu tras wygenerowano narzędziem image_gen, osobno dla każdej sceny. Mają rozdzielczość źródłową 1672×941 i są skalowane oraz kadrowane z zachowaniem proporcji do renderowanego widoku 1920×1080. Nie są one odzyskanymi zasobami Amigi. Prompty i ścieżki finalnych plików zapisano w `background-generation.json`.

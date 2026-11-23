# Lotus 2 — Amiga HD v3.8

Pobierz [wydanie v3.8 z EXE i ZIP](https://github.com/grzegorzmusial/lotus2-amiga-hd/releases/tag/v3.8). Uruchom **Lotus2-Amiga-HD-v3.8.exe** lub **Start.cmd**. EXE nie wymaga instalowania Pythona. Gra startuje od razu na pełnym ekranie 1920×1080; F11 przełącza do okna.

Ta wersja zastępuje wcześniejszy, całkowicie autorski model jazdy adapterem wykonującym odzyskane procedury m68k z Twojego obrazu Amigi. Ma osiem oryginalnych tras, oryginalne sprite’y, tła, muzykę i sample efektów. Obraz całego okna ma 1920×1080, a czterech graczy korzysta z układu 2×2. Dostępne są też układy dla jednej i dwóch osób.

## Poprawki v3.8 — widoczne toczenie opon i ulewa z dźwiękiem

Toczenie opon ma osiem faz z przesuwającymi się pasami bieżnika. Obszar animacji dopasowano do kół nowych grafik HD we wszystkich dziewięciu ujęciach. Zmiany pozostają widoczne po zmniejszeniu auta do rozmiaru używanego podczas jazdy. Tempo wynika z przebytej drogi. Nieruchomy samochód ma nieruchome opony.

Storm ma czterokrotnie więcej kropli, dłuższe i jaśniejsze smugi oraz szybszy ruch opadów. Ulewa korzysta ze wspólnej klatki pogody dla widoków o tym samym rozmiarze.

W tle słychać oryginalną próbkę deszczu 81, wskazaną przez procedurę Amigi pod adresem 0x73252. Błyskawicom towarzyszy oryginalny grzmot 109 z wywołania pod 0x73690. Zachowano oryginalne okresy odtwarzania próbek. Wyciszenie i pauza obejmują pogodę, a wyjście z etapu zatrzymuje oba kanały.

## Poprawki v3.7 — płynne wyprzedzanie, auta HD, burza i kolejne etapy

Pozycje przeciwników są interpolowane między krokami symulacji 50 Hz. Przy wyprzedzaniu auto pozostaje rysowane aż do wyjazdu poza widok. Próba przejazdu z początkową prędkością około 176 mph wykazała spadek nierównomierności ruchu między klatkami z 1,668 do 0,377 jednostki.

Samochód ma dziewięć szczegółowych ujęć o rozmiarach od 512×312 do 576×312, z płynnym skalowaniem i kolorami graczy. Grafiki przygotowano wbudowanym image_gen na podstawie oryginalnego sprite'a. Koła zachowują animację bieżnika. Pliki i prompt są opisane w `analysis/car-generation.json`.

Storm ma padający deszcz, przesuwające się chmury, błyskawice i krótkie rozświetlenie sceny. Ruch deszczu wzorowano na obserwacji oryginału w PUAE. Chmury i błyskawice otrzymały nową animację HD.

Po ukończeniu etapu przez wszystkich lokalnych graczy wyniki są widoczne przez cztery sekundy, po czym rozpoczyna się kolejny tor. ENTER/A przechodzi dalej od razu. Ostatni tor kończy się ekranem wyników. Gracz 1 używa strzałek, a gracz 2 WSAD. Menu pokazuje nowe przypisania.

## Poprawki v3.6 — pionowy podział dla dwóch graczy

W trybie dla dwóch osób gracz 1 ma widok po lewej, a gracz 2 po prawej. Każdy widok zajmuje 957×1080 pikseli, z pionową przerwą 6 pikseli.

## Poprawki v3.5 — turbo na Storm, tunele na Night

Na Storm jest pięć czerwonych przycisków (sprite 118). Najechanie na przycisk wykonuje oryginalną procedurę przyspieszenia przez 500 kroków po 20 ms i odtwarza głos **TURBO!** (próbka 93). Prędkość rośnie zgodnie z krzywą przyspieszenia Amigi. Każdy gracz może zebrać własne doładowanie, a jego wskaźnik zapala się na odpowiednim widoku.

Night ma 34 wjazdy i wyjazdy w miejscach oznaczonych w danych Amigi. Wnętrza z dwoma rzędami świateł i betonowe portale odtworzono w perspektywie HD na podstawie klatek oryginału uruchomionego w PUAE. `verify_v35.py` sprawdza przejazd przez przyciski, prędkość, dźwięk, geometrię tuneli i niezależne widoki graczy.

## Poprawki v3.4 — napisy startu, koła, mijanie, nowe tła i zakręty

Na środku widoku startowego są **MARKS → SET → GO!**, zsynchronizowane z poprawionymi głosami, zamiast cyfr 3/2/1. Koła mają cztery fazy animowanego bieżnika, zależne od przebytej drogi; zatrzymany samochód ma nieruchome opony. Animacja dotyczy też przeciwników i lokalnych graczy, z zachowaniem koloru karoserii.

Auta w strefie mijania osiągają rozmiar auta gracza. Poprawiono też odrzucanie pojazdu, którego koła znalazły się poniżej dolnej krawędzi ekranu: widoczna część nadwozia pozostaje rysowana podczas wyprzedzania. Dalsze pojazdy zachowują perspektywę.

Osiem tras otrzymało nowe szczegółowe tła wygenerowane wbudowanym narzędziem image_gen: Forest, Night, Fog, Snow, Desert, Motorway, Marsh i Storm. To nowe grafiki, nie powiększenie bitmap Amigi. Źródła mają 1672×941; gra składa je z drogą i obiektami w widoku **1920×1080**, z płynnym skalowaniem. `analysis/background-generation.json` zawiera finalne ścieżki, komplet promptów, tryb generowania i wymiary. Tła te należy zachować przy ponownym odzyskiwaniu danych ADF; generator dysku nie tworzy ponownie nowej grafiki AI.

Wejście bocznej siły zakrętu jest teraz płynnie narastające przez pierwszy rekord krzywizny. To celowa korekta adaptera dla łagodniejszego prowadzenia — bezpośredni OriginalCore nadal może wykonywać oryginalne siły bez korekty. Dodatkowo obraz interpoluje położenia między krokami fizyki 50 Hz a klatkami ekranu. Reakcje na rzeczywiste kolizje pozostają aktywne.

`v34-verification.json` obejmuje napisy, animację opon, mijanie przed/z boku/za graczem, tła wszystkich tras, wygładzenie wejścia zakrętu i interpolację bez zmiany fizycznej pozycji. Poprzednie poprawki muzyki, głosów, checkpointów oraz wyłączony limit czasu pozostają w tej wersji.

## Poprawki v3.3 — właściwy utwór, start, pisk, checkpoint i brak limitu czasu

Menu od uruchomienia odtwarza oryginalny otwierający utwór **bootup** (zasób 36, `intro.mod`), zamiast użytego wcześniej utworu wyboru `new` (zasób 38). To temat otwierający oryginał przedstawiony w podanym nagraniu: https://www.youtube.com/watch?v=JLlWlsb9GpQ . Wykorzystano muzykę odzyskaną z ADF, bez ścieżki z efektami i nagraniem rozgrywki.

Poprawiono błędne podpisanie sampli startowych: **88 = Marks, 89 = Set, 90 = Go**. Potwierdzają to wywołania oryginalnego kodu pod `0x73472`, `0x7347c`, `0x73486`. Marks gra natychmiast po rozpoczęciu odliczania, Set po 1.5 sekundy, Go po 3 sekundach — zgodnie z oryginalnymi 150/75/0 taktami do startu. Wcześniejszy test błędnie zakładał odwrotne znaczenie sampli; poprawiono go i dodano sprawdzenie względem instrukcji m68k.

Pisk opon odtwarza się tylko podczas szybszego skręcania w zakręcie, przy kontakcie z ziemią i oryginalnym żądaniu poślizgu. Prosta, samo przyspieszanie i lot nie uruchamiają pisku. Prawdziwy checkpoint wyzwala dwa krótkie jasne błyski widoku gracza, który go przejechał; efekt wygasa sam.

**Limit czasu jest wyłączony.** Zegar natywny nie jest odliczany, HUD pokazuje FREE DRIVE / NO TIME LIMIT, a zerowy czas nie kończy jazdy. Meta trasy nadal kończy ukończony wyścig.

Nowy plik EXE ma numer wersji w nazwie. `menu-bootup-preview.wav` to odsłuch początku muzyki menu, a `voices-v33.wav` zawiera poprawną kolejność głosów. `feedback-verification.json` sprawdza utwór, wywołania i momenty startowe, pisk na prostej i w zakręcie, błyski checkpointu oraz brak końca jazdy po upływie czasu.

## Poprawki v3.2 — muzyka, dźwięki, checkpointy i skoki

- Oryginalny `title.mod` odtwarza się automatycznie także podczas wyścigu. F2 wyłącza/włącza muzykę, M wycisza dźwięk. Muzyka jest ciszej niż komunikaty.
- Naprawiono format próbek: mikser Windows otwierał stereo, lecz dostawał bufor mono. Głosy i efekty grały około dwa razy szybciej. Teraz są konwertowane do rzeczywistej częstotliwości i liczby kanałów miksera. Kolejność sampli startowych w tej wersji nadal wymagała poprawki v3.3 opisanej powyżej, a równoczesne checkpointy czterech osób nie nakładają czterech identycznych głosów.
- Silnik korzysta z sampli 96/97 i oryginalnej reguły tonu zależnej od RPM (`max(124, 0xFCC3A // RPM)`), także przy zmianie biegu. Strumień zachowuje fazę próbki zamiast rozpoczynać ją od nowa przy każdej zmianie tonu. Każdy gracz ma własny silnik; dostępny jest też oryginalny pisk opon.
- Kolizje odtwarzają sample wskazane przez oryginalny kod: m.in. 98 dla kontaktu z autem i 105 dla drzewa. Wcześniej wszystkie podmieniano na ten sam dźwięk 104.
- „Checkpoint” jest wyzwalany wyłącznie przez natywną bramkę, a nie każdy wzrost czasu (np. bonus +3 sekundy). Bramy START, CHECK i FINISH są teraz widoczne w oryginalnych miejscach trasy.
- Nad belkami Forest działa natywna trajektoria skoku i lądowania. Naprawiono odwrócony znak wysokości obrazu: auto jest podnoszone, a pod nim zostaje cień. Warunki wybicia, w tym prędkość i ustawienie auta, nadal pochodzą z oryginalnej procedury.

Sprawdzono 119 kontroli: dotychczasowe 71, 35 kontroli audio oraz 13 regresji silnika, kolizji, checkpointów i belek. `audio-verification.json` i `race-events-verification.json` zawierają wyniki. `voices-v32.wav` to odsłuch poprawionych oryginalnych głosów, a `engine-v32.wav` pokazuje zmianę tonu i zmianę biegu. Host miksuje oryginalne sample; pełny układ Paula i jego filtr analogowy nie są emulowane.

## Poprawka v3.1 — boczne przeskoki na zakrętach

Usunięto błąd geometrii kamery: przy przejściu między segmentami zakrętu droga i inne auta przeskakiwały na bok o około 16 pikseli. Krzywizna jest teraz całkowana raz we współrzędnych całej trasy, a położenie i kierunek drogi pozostają ciągłe na granicach segmentów. Nie zmieniano fizyki ani reakcji zderzeń.

Regresja sprawdza 4965 widocznych granic na ośmiu trasach. Maksymalny skok w tej próbie spadł z 15.825 px do mniej niż 0.001 px. Wynik: `corner-continuity-verification.json`. Dodatkowo ponownie przeszło 71 dotychczasowych kontroli i sprawdzono finalny EXE. Film kalibracyjny w `analysis/v3-comparison` przedstawia poprzednią wersję v3; ta poprawka usuwa jej przeskoki.

## Poprawki v3

Przebudowano projekcję drogi po porównaniu 750 klatek z działającą Amigą. Kamera znajduje się teraz około 0.356 rekordu za graczem zamiast 7.37. Droga i pobocze przesuwają się szybciej w obrazie przy zachowaniu natywnego tempa symulacji. Zmniejszono wyprzedzający widok zakrętów i poprawiono profil wysokości, kierunek jazdy oraz przelicznik prędkości w HUD.

Wszystkie auta korzystają z jednej szerokości w świecie i tej samej perspektywy. Samochód na wysokości gracza ma taki sam rozmiar, a przy zbliżaniu rośnie płynnie zamiast przeskakiwać między punktami siatki drogi. Reakcje kierownicy, silnik i zderzenia nadal wykonują kod Amigi; naprawiono wpływ szumu małego sygnału hamulca na prędkość. Klatki skrętu zachowują wysokość auta, bez ściskania karoserii. Czterech graczy startuje na oddzielnych pasach za siatką AI.

Forest ma teraz niełączone tło chmur odzyskane z obrazu działającego oryginału, zamiast gór z ekranu prezentacji trasy. Pozostałe tła poprawnie zdekodowano jako 160×100, usuwając podwójny obraz. Auta AI mają czerwone i zielone karoserie. Kolory graczy: **P1 biały, P2 czarny, P3 czerwony, P4 niebieski**.

Film `analysis/v3-comparison/amiga-vs-v3-15s.mp4` zestawia oryginał i nowy renderer przez 750 klatek, podając obu te same pozycje aut. To kontrola perspektywy, nie dowód identycznego przebiegu dwóch niezależnych symulacji. Obecny model pozostaje adaptacją podsystemów oryginału; nie potwierdzono pełnej zgodności gameplayu.

## Co pochodzi z gry

- Kod m68k przyspieszania, skrętu z bezwładnością, automatycznej skrzyni biegów, hamowania, integracji położenia, odczytu krzywizny i wysokości trasy, zegara oraz checkpointów. Kod wykonuje Unicorn; nie jest to nowa formuła nazwana „oryginalną”.
- Osiem zestawów danych tras: Forest, Night, Fog, Snow, Desert, Motorway, Marsh, Storm. Są zachowane rozmieszczenia obiektów i premie czasowe checkpointów.
- Sprite’y samochodów i otoczenia, ich maski i palety oraz osiem teł prezentacji tras z ADF. Forest używa dodatkowo grafiki tła odczytanej z działającej gry.
- Oryginalne próbki silnika, zderzeń i głosów startowych/checkpointów.
- Jedenaście kompletnych modułów MOD, złożonych z odzyskanych wzorców nutowych i osobnych sampli: intro, utwór tytułowy, game over i osiem jingli.

## Sterowanie i muzyka

Menu: strzałki i Enter albo krzyżak i A. Wybierz PLAYERS, COURSE i RACE.

Pad SDL GameController: lewy drążek — skręt, RT — gaz, LT — hamulec; A/B są dodatkowymi przyciskami gazu/hamulca. Start — pauza. Sterowanie analogowe jest adaptowane do oryginalnej logiki joysticka w takcie 50 Hz. Martwą strefę można zmienić w menu. Pady otrzymują kolejno numery graczy; odłączenie urządzenia może zmienić przypisania.

| Gracz | Skręt | Gaz | Hamulec |
|---|---|---|---|
| P1 | A / D | W | S |
| P2 | lewo / prawo | góra | dół |
| P3 | J / L | I | K |
| P4 | numeryczne 4 / 6 | numeryczne 8 | numeryczne 5 |

F11 — pełny ekran / okno (domyślnie pełny ekran). P/Start — pauza. R — restart. Esc — menu. M — wyciszenie. **F2 podczas wyścigu włącza/wyłącza oryginalny utwór tytułowy.** Muzyka bootup domyślnie gra w menu i podczas wyścigu razem z efektami. Oryginalne pliki MOD znajdują się również w `assets`.

## Zakres zgodności

Warstwa HD renderuje drogę, zarządza czterema graczami i wykrywa kontakt między nimi. Oryginalne procedury odpowiadają za ruch przeciwników oraz reakcje zderzeń. Przejazdy pod ciężarówkami i część animacji nadal wymagają odtworzenia. Podział ekranu obsługuje lokalną grę dla czterech osób.

Wszystkie osiem tras można wybrać w menu i przechodzić kolejno po ukończeniu wyścigu. Perspektywa należy do adaptera HD; skalę aut dopasowano do klatek oryginału. Pozostałe trasy nadal korzystają z teł prezentacji zamiast pełnego oryginalnego renderera pogody. Nie potwierdzono zgodności klatka po klatce z uruchomioną Amigą.

## Weryfikacja i źródła

W `verification.json` zapisano 34 kontrole bazowe. `v3-verification.json` dodaje 14 kontroli perspektywy, skalowania aut, reakcji kierownicy, szumu hamulca, ponownego kontaktu i 20-sekundowej jazdy czterech osób. `playability-verification.json` zawiera dodatkowe 23 kontrole skrętu analogowego, wejść SDL pada, kolizji i bliskich minięć, oryginalnej AI, czasu symulacji, ośmiu tras, kolorów i wydajności. Pomiar 180 klatek z czterema graczami przy 1920×1080 odbywa się poza ekranem, bez limitera; gra na ekranie ma limit 60 FPS. Wyniki zależą od komputera.

Uruchomiono również rzeczywisty oryginał z podanego ADF w PUAE i porównano telemetrię przy identycznych momentach zmiany biegów. Przykładowo w klatce 201 natywna prędkość wynosiła 2499 w obu wersjach, a w klatce 601: 4154 i 4159. Materiał porównawczy znajduje się w `analysis/reference`, a opis w `analysis/ODZYSKANIE.md`. Nie jest to dowód zgodności całej gry klatka po klatce.

**Fizyczny pad nie był podłączony.** Sprawdzono syntetyczne wartości osi SDL i działanie adaptera analogowego; zgodność konkretnego urządzenia wymaga próby na tym padzie. Standardowo mapowane pady SDL mają analogowy skręt i oba spusty; nierozpoznane joysticki mają oś skrętu oraz przyciski gazu i hamulca.

`game.py` — nowa warstwa gry. `amiga_core.py` — adapter oryginalnego kodu. `verify.py` — kontrole. `analysis/ODZYSKANIE.md` — adresy procedur i pochodzenie danych. `prepare_original.py` — powtarzalne odzyskanie plików z podanego ADF.

Uruchomienie ze źródeł: `python -m pip install -r requirements.txt`, potem `python game.py`. Ponowne odzyskanie danych wymaga dodatkowo `capstone==5.0.9` i `Pillow`; polecenie opisano w raporcie.

Oryginalną grę stworzyli Magnetic Fields / Gremlin Graphics; muzykę Lotus 2 — Barry Leitch. Pakiet zawiera lokalnie odzyskane dane z przekazanego przez Ciebie dysku. Nie jest oficjalnym wydaniem autorów gry.

# Boczny przeskok na zakrętach — v3.1

Powtórzenie: ustaw samochód na stałej pozycji poprzecznej i przesuwaj kamerę przez granicę segmentu w zakręcie. Obserwuj rywala sześć rekordów dalej. W v3 przejście przez granice 33 i 34 w Forest zmieniało pozycję rywala o 15.8252 px przy zmianie pozycji gracza o zaledwie 0.00002 rekordu. Na przeciwnym zakręcie kierunek przeskoku odwracał się. Nie był to ruch wynikający ze sterowania lub zderzenia.

Przyczyna: całkowanie krzywizny rozpoczynało się od nowa przy najbliższym segmencie kamery. Zmiana początku całkowania nie zachowywała przesunięcia i kierunku tej samej krzywej. Korekta obrotu kamery nie usuwała tej nieciągłości.

Poprawka przechowuje skumulowane położenia i kierunki dla całej trasy. Dla części u segmentu i liczy położenie X(i+u)=X(i)+D(i)*u+C(i)*u²/2 oraz kierunek D(i+u)=D(i)+C(i)*u. Są one ciągłe na granicach. Droga i obiekty korzystają z tej samej krzywej, zakotwiczonej w położeniu gracza. Zmiana segmentu kamery nie przestawia już wspólnego układu współrzędnych.

Weryfikacja `verify_corner_continuity.py`: 4965 widocznych granic zakrętów, osiem tras, maksymalna różnica położenia rywala 0.000381 px. Próg to 0.01 px. Dane sprzed poprawki: `corner-jumps-before.json`; pełny wynik po poprawce: `../corner-continuity-verification.json`.

Nie zmieniano silnika m68k, wejść pada ani fizycznych reakcji na zderzenie. Wynik dotyczy usuniętej nieciągłości geometrii, nie wszystkich możliwych przyczyn ruchu samochodu w bok. Dotychczasowe 71 kontroli przeszło ponownie.

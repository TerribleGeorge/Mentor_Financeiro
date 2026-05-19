# Bezpieczeństwo - Mentor Financeiro

**Ostatnia aktualizacja:** 19 maja 2026 r

Ta strona wyjaśnia praktyki bezpieczeństwa Mentor Financeiro w prostym języku. Stanowi uzupełnienie Polityki Prywatności i Regulaminu.

## 1. Zobowiązanie do bezpieczeństwa

Mentor Financeiro został opracowany, aby pomóc w organizacji finansów bez pytania o bezpośredni dostęp do konta bankowego, bez konieczności podawania hasła bankowego i bez pełnienia funkcji banku, brokera lub metody płatności.

Aplikacja może przechowywać wprowadzone przez Ciebie dane finansowe lub zidentyfikowane za pomocą opcjonalnych funkcji, dlatego bezpieczeństwo traktujemy jako centralną część produktu.

## 2. Czego aplikacja nie robi

- Nie pyta o hasło bankowe, kartę ani portfel cyfrowy.
- Nie ma dostępu do Twojego konta bankowego.
- Nie przenosi pieniędzy.
- Nie dokonuje płatności, Pix, przelewów ani inwestycji w Twoim imieniu.
- Nie żąda kodu zabezpieczającego karty.
- Nie żąda kodu banku OTP.
- Nie sprzedaje Twoich danych osobowych.

## 3. Zastosowane środki techniczne

W zależności od wykorzystywanego zasobu aplikacja może korzystać z:

- Zaloguj się przez Firebase Authentication.
- Cloud Firestore z danymi powiązanymi z uwierzytelnionym użytkownikiem.
- Zasady bezpieczeństwa ograniczające dostęp do własnych danych użytkownika.
- Komunikacja szyfrowana przez używane pakiety SDK i usługi.
- Firebase Crashlytics w celu identyfikacji usterek technicznych i naprawienia problemów.
- Android uprawnienia wymagane tylko w przypadku funkcji aplikacji.
- Lokalne przechowywanie preferencji, motywów, pamięci podręcznej i danych urządzenia.

## 4. Monitorowanie powiadomień

Monitorowanie powiadomień jest opcjonalne i wymaga ręcznej aktywacji na Android.

Po włączeniu aplikacja może czytać obsługiwane powiadomienia, aby rozpoznać wydatki, zakupy, płatności, subskrypcje i przelewy. Celem jest ograniczenie pracy ręcznej przy rejestrowaniu wydatków.

Aby zmniejszyć ryzyko:

- Aplikacja poinformuje Cię o powodzie zezwolenia, zanim skieruje Cię do ustawień.
- Dostęp można cofnąć w dowolnym momencie w ustawieniach Android.
- Filtr wyszukuje zgodne zdarzenia finansowe, a nie rozmowy osobiste.
- Aplikacja próbuje ignorować kody, hasła, kody zabezpieczające i wiadomości uwierzytelniające OTP.
- Aplikacja nie korzysta z tej funkcji w celu uzyskania dostępu do banków, kart ani portfeli cyfrowych.

Mimo to powiadomienia mogą zawierać wrażliwe dane. Korzystaj z tej funkcji tylko wtedy, gdy wyrażasz zgodę na tego typu przetwarzanie.

## 5. Wrażliwe uprawnienia

Aplikacja może zażądać:

- **Internet:** połączenie z Firebase, Google Play, interfejsami API i zasobami online.
- **Powiadomienia:** wysyłanie alertów z samej aplikacji.
- **Lokalizacja:** dostosowanie treści lub porównania do kraju/regionu, jeśli jest to dozwolone.
- **Dostęp do powiadomień Android:** opcjonalna identyfikacja wydatków ze zgodnych powiadomień.
- **Zakupy w aplikacji:** Premium subskrypcja przez Google Play.

Kontrolujesz te uprawnienia w ustawieniach Android.

## 6. Twój udział w bezpieczeństwie

Aby chronić swoje dane:

- Użyj blokady ekranu na urządzeniu.
- Nie udostępniaj swojego konta.
- Aktualizuj aplikację i Android.
- Cofnij uprawnienia, których nie chcesz już używać.
- Sprawdź automatycznie zidentyfikowane transakcje przed podjęciem decyzji.
- Nie rejestruj informacji, których nie chcesz przechowywać w aplikacji.
- Anuluj subskrypcję bezpośrednio w Google Play, jeśli nie chcesz odnawiać.

## 7. Ograniczenia

Żadna aplikacja, serwer, system operacyjny ani usługa w chmurze nie jest w 100% bezpieczna. Pomimo zastosowanych środków mogą wystąpić awarie, niedostępność, błędy synchronizacji, utrata dostępu, problemy osób trzecich lub zewnętrzne próby nadużyć.

Mentor Financeiro stara się w rozsądny sposób ograniczać ryzyko, ale musisz zachować kopie lub posiadać kontrolę nad istotnymi informacjami finansowymi.

## 8. Incydenty i kontakt

Jeśli zauważysz dziwne zachowanie, niewłaściwy dostęp, nieprawidłowe dane, podejrzenie naruszenia bezpieczeństwa lub problem z wrażliwymi uprawnieniami, skontaktuj się z:

**george.guimares@gmail.com**

Jeśli to możliwe, uwzględnij:

- Model urządzenia.
- Wersja Android.
- Wersja aplikacji.
- Opis problemu.
- Zrzuty ekranu bez ujawniania haseł, kodów i nadmiernych danych.

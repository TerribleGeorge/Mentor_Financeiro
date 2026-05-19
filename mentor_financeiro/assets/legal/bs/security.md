# Sigurnost - Mentor Financeiro

**Posljednje ažuriranje:** 19. maja 2026

Ova stranica objašnjava Mentor Financeiro sigurnosne prakse jednostavnim jezikom. Dopunjuje Politiku privatnosti i Uslove korištenja.

## 1. Sigurnosna obaveza

Mentor Financeiro je razvijen da pomogne u finansijskoj organizaciji bez traženja direktnog pristupa bankovnom računu, bez traženja lozinke banke i bez funkcioniranja kao banka, broker ili način plaćanja.

Aplikacija može pohraniti financijske podatke koje ste unijeli ili identificirane opcijskim funkcijama, zbog čega sigurnost tretiramo kao središnji dio proizvoda.

## 2. Šta aplikacija ne radi

- Ne traži bankovnu lozinku, karticu ili digitalni novčanik.
- Ne pristupa vašem bankovnom računu.
- Ne pomera novac.
- Ne vrši plaćanja, Pix, transfere ili ulaganja na vaše ime.
- Ne traži sigurnosni kod kartice.
- Ne traži bankovni kod OTP.
- Ne prodaje vaše lične podatke.

## 3. Korištene tehničke mjere

Ovisno o korištenom resursu, aplikacija može koristiti:

- Prijava putem Firebase Authentication.
- Cloud Firestore s podacima pridruženim autentificiranom korisniku.
- Sigurnosna pravila za ograničavanje pristupa vlastitim podacima korisnika.
- Komunikacija šifrirana pomoću SDK-ova i korištenih usluga.
- Firebase Crashlytics za identifikaciju tehničkih grešaka i rješavanje problema.
- Android dozvole se traže samo kada se odnose na funkcije aplikacije.
- Lokalna pohrana za postavke, temu, keš memoriju i podatke uređaja.

## 4. Nadgledanje obavještenja

Nadgledanje obavijesti je opciono i zahtijeva ručnu aktivaciju na Android.

Kada je omogućena, aplikacija može čitati podržana obavještenja kako bi prepoznala potrošnju, kupovine, plaćanja, pretplate i transfere. Cilj je smanjiti ručni rad prilikom evidentiranja troškova.

Da biste smanjili rizike:

- Aplikacija vas obavještava o razlogu za dozvolu prije nego što vas uputi na postavke.
- Pristup se može opozvati u bilo kojem trenutku u postavkama Android.
- Filter traži kompatibilne finansijske događaje, a ne lične razgovore.
- Aplikacija pokušava ignorirati OTP kodove, lozinke, sigurnosne kodove i poruke o autentifikaciji.
- Aplikacija ne koristi ovu funkciju za pristup bankama, karticama ili digitalnim novčanicima.

Uprkos tome, obavještenja mogu sadržavati osjetljive podatke. Koristite ovu funkciju samo ako se slažete s ovom vrstom obrade.

## 5. Osjetljive dozvole

Aplikacija može zahtijevati:

- **Internet:** veza sa Firebase, Google Play, API-jima i online resursima.
- **Obavijesti:** slanje upozorenja iz same aplikacije.
- **Lokacija:** prilagođavanje sadržaja ili poređenja sa zemljom/regionom, kada je to odobreno.
- **Pristup Android obavještenjima:** opcionalna identifikacija troškova iz kompatibilnih obavijesti.
- **Kupovine unutar aplikacije:** Premium pretplata od strane Google Play.

Ovim dozvolama upravljate u postavkama Android.

## 6. Vaša uloga u sigurnosti

Da zaštitite svoje podatke:

- Koristite zaključavanje ekrana na uređaju.
- Nemojte dijeliti svoj račun.
- Održavajte aplikaciju i Android ažuriranim.
- Opozovite dozvole koje više ne želite koristiti.
- Provjerite automatski identificirane transakcije prije donošenja odluka.
- Ne registrujte informacije koje ne želite da zadržite u aplikaciji.
- Otkažite pretplatu direktno na Google Play kada ne želite da je obnovite.

## 7. Ograničenja

Nijedna aplikacija, server, operativni sistem ili usluga u oblaku nisu 100% sigurni. Uprkos usvojenim mjerama, mogu se pojaviti kvarovi, nedostupnost, greške u sinhronizaciji, gubitak pristupa, problemi trećih strana ili vanjski pokušaji zloupotrebe.

Mentor Financeiro nastoji razumno smanjiti rizike, ali morate zadržati kopije ili vlastite kontrole bitnih finansijskih informacija.

## 8. Incidenti i kontakt

Ako primijetite čudno ponašanje, nepravilan pristup, netačne podatke, sumnju na kršenje sigurnosti ili problem s osjetljivim dozvolama, kontaktirajte:

**george.guimares@gmail.com**

Uključite, ako je moguće:

- Model uređaja.
- Verzija Android.
- Verzija aplikacije.
- Opis problema.
- Snimke ekrana bez otkrivanja lozinki, kodova ili prevelikih podataka.

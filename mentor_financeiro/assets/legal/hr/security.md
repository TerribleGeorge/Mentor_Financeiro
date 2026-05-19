# Sigurnost - Mentor Financeiro

**Zadnje ažuriranje:** 19. svibnja 2026

Ova stranica objašnjava Mentor Financeiro sigurnosne prakse na jednostavnom jeziku. Nadopunjuje Politiku privatnosti i Uvjete korištenja.

## 1. Sigurnosna obveza

Mentor Financeiro razvijen je za pomoć pri financijskoj organizaciji bez traženja izravnog pristupa bankovnom računu, bez traženja bankovne lozinke i bez funkcioniranja kao banka, broker ili način plaćanja.

Aplikacija može pohraniti financijske podatke koje ste unijeli ili identificirali opcijskim značajkama, zbog čega sigurnost smatramo središnjim dijelom proizvoda.

## 2. Što aplikacija ne radi

- Ne traži bankovnu lozinku, karticu ili digitalni novčanik.
- Ne pristupa vašem bankovnom računu.
- Ne pomiče novac.
- Ne vrši plaćanja, Pix, transfere ili ulaganja u vaše ime.
- Ne traži sigurnosni kod kartice.
- Ne zahtijeva kod banke OTP.
- Ne prodaje Vaše osobne podatke.

## 3. Upotrijebljene tehničke mjere

Ovisno o korištenom resursu, aplikacija može koristiti:

- Prijava putem Firebase Authentication.
- Cloud Firestore s podacima povezanim s autentificiranim korisnikom.
- Sigurnosna pravila za ograničavanje pristupa vlastitim podacima korisnika.
- Komunikacija šifrirana SDK-ovima i korištenim uslugama.
- Firebase Crashlytics za prepoznavanje tehničkih grešaka i rješavanje problema.
- Android dopuštenja tražena samo kada su povezana sa značajkama aplikacije.
- Lokalna pohrana za postavke, temu, predmemoriju i podatke uređaja.

## 4. Praćenje obavijesti

Praćenje obavijesti nije obavezno i zahtijeva ručnu aktivaciju na Android.

Kada je omogućena, aplikacija može čitati podržane obavijesti kako bi prepoznala potrošnju, kupnje, plaćanja, pretplate i prijenose. Cilj je smanjiti ručni rad prilikom evidentiranja troškova.

Za smanjenje rizika:

- Aplikacija vas obavještava o razlogu dopuštenja prije nego što vas uputi na postavke.
- Pristup se može opozvati u bilo kojem trenutku u postavkama Android.
- Filtar traži kompatibilne financijske događaje, a ne osobne razgovore.
- Aplikacija pokušava ignorirati OTP kodove, lozinke, sigurnosne kodove i autentifikacijske poruke.
- Aplikacija ne koristi ovu značajku za pristup bankama, karticama ili digitalnim novčanicima.

Unatoč tome, obavijesti mogu sadržavati osjetljive podatke. Koristite ovu značajku samo ako se slažete s ovom vrstom obrade.

## 5. Osjetljive dozvole

Aplikacija može zahtijevati:

- **Internet:** veza s Firebase, Google Play, API-jima i mrežnim resursima.
- **Obavijesti:** slanje upozorenja iz same aplikacije.
- **Lokacija:** prilagodba sadržaja ili usporedbe sa zemljom/regijom, ako je ovlašteno.
- **Pristup Android obavijestima:** izborna identifikacija troškova iz kompatibilnih obavijesti.
- **Kupnje putem aplikacije:** Premium pretplata od Google Play.

Ovim dopuštenjima upravljate u postavkama Android.

## 6. Vaš dio sigurnosti

Kako biste zaštitili svoje podatke:

- Koristite zaključavanje zaslona na uređaju.
- Nemojte dijeliti svoj račun.
- Održavajte aplikaciju i Android ažuriranima.
- Opozovite dozvole koje više ne želite koristiti.
- Provjerite automatski identificirane transakcije prije donošenja odluka.
- Ne registrirajte podatke koje ne želite zadržati u aplikaciji.
- Otkažite pretplate izravno na Google Play kada ih ne želite obnoviti.

## 7. Ograničenja

Nijedna aplikacija, poslužitelj, operativni sustav ili usluga u oblaku nije 100% sigurna. Unatoč poduzetim mjerama, mogu se pojaviti kvarovi, nedostupnost, pogreške u sinkronizaciji, gubitak pristupa, problemi trećih strana ili vanjski pokušaji zlouporabe.

Mentor Financeiro nastoji razumno smanjiti rizike, ali morate održavati kopije ili vlastite kontrole bitnih financijskih podataka.

## 8. Incidenti i kontakt

Ako primijetite čudno ponašanje, neodgovarajući pristup, netočne podatke, sumnju na kršenje sigurnosti ili problem s osjetljivim dozvolama, kontaktirajte:

**george.guimares@gmail.com**

Uključite, ako je moguće:

- Model uređaja.
- Verzija Android.
- Verzija aplikacije.
- Opis problema.
- Snimke zaslona bez izlaganja lozinki, kodova ili prekomjernih podataka.

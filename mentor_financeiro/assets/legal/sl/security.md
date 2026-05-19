# Varnost - Mentor Financeiro

**Nazadnje posodobljeno:** 19. maj 2026

Na tej strani so razložene varnostne prakse Mentor Financeiro v preprostem jeziku. Dopolnjuje Politiko zasebnosti in Pogoje uporabe.

## 1. Varnostna zaveza

Mentor Financeiro je bil razvit za pomoč pri finančni organizaciji, ne da bi zahteval neposreden dostop do bančnega računa, ne da bi zahteval bančno geslo in ne da bi deloval kot banka, posrednik ali način plačila.

Aplikacija lahko shranjuje finančne podatke, ki ste jih vnesli ali prepoznali z izbirnimi funkcijami, zato varnost obravnavamo kot osrednji del izdelka.

## 2. Česa aplikacija ne počne

- Ne zahteva bančnega gesla, kartice ali digitalne denarnice.
- Ne dostopa do vašega bančnega računa.
- Ne premika denarja.
- Ne izvaja plačil, Pixov, prenosov ali naložb v vašem imenu.
- Ne zahteva varnostne kode kartice.
- Ne zahteva kode banke OTP.
- Ne prodaja vaših osebnih podatkov.

## 3. Uporabljeni tehnični ukrepi

Odvisno od uporabljenega vira lahko aplikacija uporablja:

- Prijava z Firebase Authentication.
- Cloud Firestore s podatki, povezanimi z overjenim uporabnikom.
- Varnostna pravila za omejitev dostopa do lastnih podatkov uporabnika.
- Komunikacija, šifrirana s SDK-ji in uporabljenimi storitvami.
- Firebase Crashlytics za prepoznavanje tehničnih napak in odpravljanje težav.
- Dovoljenja Android so zahtevana le, če so povezana s funkcijami aplikacije.
- Lokalna shramba za nastavitve, temo, predpomnilnik in podatke o napravi.

## 4. Spremljanje obvestil

Spremljanje obvestil je neobvezno in zahteva ročno aktivacijo na Android.

Ko je omogočena, lahko aplikacija bere podprta obvestila za prepoznavanje porabe, nakupov, plačil, naročnin in prenosov. Cilj je zmanjšati ročno delo pri evidentiranju stroškov.

Za zmanjšanje tveganj:

- Aplikacija vas obvesti o razlogu za dovoljenje, preden vas usmeri na nastavitve.
- Dostop lahko kadar koli prekličete v nastavitvah Android.
- Filter išče združljive finančne dogodke, ne osebnih pogovorov.
- Aplikacija poskuša prezreti kode OTP, gesla, varnostne kode in sporočila za preverjanje pristnosti.
- Aplikacija ne uporablja te funkcije za dostop do bank, kartic ali digitalnih denarnic.

Kljub temu lahko obvestila vsebujejo občutljive podatke. To funkcijo uporabite samo, če se strinjate s to vrsto obdelave.

## 5. Občutljiva dovoljenja

Aplikacija lahko zahteva:

- **Internet:** povezava z Firebase, Google Play, API-ji in spletnimi viri.
- **Obvestila:** pošiljanje opozoril iz same aplikacije.
- **Lokacija:** prilagoditev vsebine ali primerjave z državo/regijo, če je dovoljeno.
- **Dostop do obvestil Android:** izbirna identifikacija stroškov iz združljivih obvestil.
- **Nakupi v aplikaciji:** Premium naročnina avtorja Google Play.

Ta dovoljenja nadzirate v nastavitvah Android.

## 6. Vaš del pri varnosti

Za zaščito vaših podatkov:

- Uporabite zaklepanje zaslona na napravi.
- Ne delite svojega računa.
- Aplikacijo in Android posodabljajte.
- Prekličite dovoljenja, ki jih ne želite več uporabljati.
- Pred odločitvijo preverite samodejno identificirane transakcije.
- Ne registrirajte podatkov, ki jih ne želite hraniti v aplikaciji.
- Prekličite naročnine neposredno na Google Play, če jih ne želite podaljšati.

## 7. Omejitve

Nobena aplikacija, strežnik, operacijski sistem ali storitev v oblaku ni 100 % varna. Kljub sprejetim ukrepom lahko pride do napak, nedosegljivosti, napak pri sinhronizaciji, izgube dostopa, težav tretjih oseb ali zunanjih poskusov zlorabe.

Mentor Financeiro poskuša razumno zmanjšati tveganja, vendar morate vzdrževati kopije ali lastne kontrole bistvenih finančnih informacij.

## 8. Incidenti in kontakt

Če opazite nenavadno vedenje, neustrezen dostop, napačne podatke, domnevno kršitev varnosti ali težavo z občutljivimi dovoljenji, se obrnite na:

**george.guimares@gmail.com**

Če je mogoče, vključite:

- Model naprave.
- Različica Android.
- Različica aplikacije.
- Opis težave.
- Posnetki zaslona brez razkrivanja gesel, kod ali odvečnih podatkov.

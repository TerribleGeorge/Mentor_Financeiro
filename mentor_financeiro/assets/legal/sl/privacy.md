# Politika zasebnosti - Mentor Financeiro

**Nazadnje posodobljeno:** 19. maj 2026

**Prijava:** Mentor Financeiro

**Paket Android:** `com.georgeguimares.mentorfinanceiro`

**Pravilnik objavljen dne:** https://terriblegeorge.github.io/Mentor_Financeiro/

Ta pravilnik o zasebnosti jasno pojasnjuje, do katerih podatkov lahko Mentor Financeiro dostopa, jih zbira, uporablja, shranjuje, deli in varuje. Napisan je tako, da odraža trenutno delovanje aplikacije in ga je treba brati skupaj s stranjo Pogoji uporabe in Varnost.

Mentor Financeiro je aplikacija za finančno organizacijo, finančno izobraževanje, cilje, evidenco stroškov, grafe, poročila, naložbene vsebine in izbirne funkcije naročnine Premium. Aplikacija ni banka, posrednik, finančna institucija, registrirani investicijski svetovalec, zavarovalnica ali način plačila.

## 1. Kdo je odgovoren

Mentor Financeiro ponuja razvijalec, odgovoren za objavo aplikacije na Google Play.

Če želite uveljavljati pravice v zvezi z vašimi podatki, postavljati vprašanja ali zahtevati izbris, nas kontaktirajte po e-pošti:

**george.guimares@gmail.com**

## 2. Povzetek v preprostem jeziku

- Aplikacija vam pomaga organizirati stroške, cilje, omejitve, finančno zgodovino, naložbe in izobraževalne vsebine.
- Za uporabo določenih funkcij se lahko prijavite z e-pošto/geslom, računom Google, računom Apple ali načinom brez beleženja zgodovine prek Firebase Authentication.
- Finančne podatke, ki jih posredujete, kot so stroški, cilji, omejitve, profil in nastavitve, lahko shranite v Firebase/Cloud Firestore za sinhronizacijo in delovanje računa.
- Aplikacija uporablja storitve Google/Firebase za prijavo, bazo podatkov, potisna obvestila, analitiko in diagnozo napak.
- Aplikacija lahko uporablja Google AdMob za prikazovanje oglasov.
- Premium obdeluje Google Play Billing znotraj same aplikacije.
- Lokacija ni obvezna in se uporablja le, če jo odobrite, na primer za prilagoditev naložbenih primerjav državi ali lokalnemu kontekstu.
- Funkcija spremljanja obvestil ni obvezna. Če omogočite dostop do obvestil na Android, lahko aplikacija prebere naslov in besedilo podprtih obvestil, da prepozna nakupe, plačila in prenose ter jih spremeni v finančne evidence. Aplikacija ne dostopa do vašega bančnega računa in ne zahteva gesla.
- Slike, ki jih izberete za personalizacijo, lahko shranite lokalno v napravi.
- Izbris računa in podatkov lahko zahtevate prek e-pošte, navedene v tem pravilniku.

## 3. Podatki, ki jih lahko obdelujemo

Odvisno od tega, kako uporabljate aplikacijo, lahko obdelujemo naslednje kategorije podatkov.

### 3.1 Račun in identifikacijski podatki

- Ime, navedeno v registraciji.
- E-pošta.
- Firebase (UID) identifikator uporabnika.
- Uporabljen način prijave.
- Profilna fotografija, če jo zagotovi ponudnik prijave.
- status naročnine Premium, povezan s profilom.
- Tehnični podatki, potrebni za vzdrževanje seje in sinhronizacijo informacij.

### 3.2 Finančni podatki, ki ste jih vnesli

- Odhodki, izdatki, prihodki, kategorije, finančna zgodovina in transakcije.
- Cilji, omejitve, načrtovanje, finančne sanje in preference.
- Informacije, uporabljene v grafih, poročilih, analizah in samodejnem mentorstvu v aplikaciji.
- Profil vlagatelja, cilji in odgovori v vprašalnikih ali zaslonih za načrtovanje.

Ti podatki so lahko občutljivi v praktičnem smislu, saj razkrivajo vidike vašega finančnega življenja. Zato morate registrirati le tiste podatke, ki jih želite obdržati v aplikaciji.

### 3.3 Podatki o naročnini in nakupu

- Kupljen izdelek, stanje naročnine, obdobje, podaljšanje, obnovitev nakupa in tehnični identifikatorji, potrebni za potrditev Premium.
- Nakupe, preklice, podaljšanja, povračila in bremenitve obdeluje Google Play v skladu z Google Računom in pravili trgovine.

Aplikacija ne zbira ali shranjuje številk kartic, varnostnih kod kartic ali podatkov o bančnih plačilih.

### 3.4 Podatki o uporabi, diagnostiki in zmogljivosti- Dogodki uporabe in interakcije v aplikaciji, na primer dostopani zasloni, uporabljeni viri in zaključeni tokovi.
- Združeni ali tehnični podatki za razumevanje stabilnosti, učinkovitosti in izboljšav izdelka.
- Poročila o napakah in diagnostika Firebase Crashlytics, kadar je primerno, vključno s tehničnimi informacijami o napravi, različico aplikacije, operacijskim sistemom, dnevniki napak in identifikatorjem uporabnika, ko je konfiguriran.

### 3.5 Podatki o potisnih obvestilih

Če dovolite obvestila iz aplikacije, lahko obravnavamo:

- žeton Firebase Cloud Messaging (FCM).
- Nastavitve v zvezi s prejemanjem obvestil.
- Teme ali segmenti, potrebni za pošiljanje sporočil iz same aplikacije.

V nastavitvah Android lahko nadzorujete, ali so obvestila dovoljena.

### 3.6 Prebrani podatki obvestila v Android

Spremljanje obvestil je izbirna funkcija. Deluje le, če ročno omogočite dostop do obvestil v nastavitvah Android.

Ko je omogočeno, lahko aplikacija prejme naslov, besedilo, ime izvornega paketa aplikacije, čas in tehnične metapodatke iz obvestil, prikazanih v vaši napravi. Cilj je prepoznati obvestila, združljiva s stroški, nakupi, plačili, naročninami in prenosi, da se ustvarijo finančni zapisi.

Pomembni ukrepi te funkcije:

- Aplikacija nima dostopa do vašega bančnega računa.
- Aplikacija se ne prijavlja v banke, kartice ali digitalne denarnice.
- Aplikacija ne zahteva bančnega gesla.
- Aplikacija uporablja filtre, da prepreči zajemanje varnostnih kod, OTP, gesel in sporočil za preverjanje pristnosti.
- Filter se osredotoča na prepoznavanje združljivih nakupov, plačil, poslanih prenosov in finančnih gibanj.
- Funkcijo lahko onemogočite v aplikaciji ali prekličete dovoljenje v nastavitvah Android.

Tudi s filtri lahko obvestila vsebujejo občutljive informacije. To funkcijo omogočite samo, če razumete in sprejemate to vrsto obdelave.

### 3.7 Lokacija

Aplikacija lahko zahteva približno ali natančno lokacijo v skladu z dovoljenjem, ki ga izda Android, da prilagodi primerjave, vsebino ali naložbeni kontekst državi/regiji.

Lokacija ni potrebna za vse funkcije. Če zavrnete dovoljenje, so lahko nekatere primerjave ali prilagoditve omejene.

### 3.8 Lokalne slike in datoteke

Ko izberete sliko za vizualno prilagoditev aplikacije, jo lahko shranite lokalno v napravi. Te personalizacijske slike ne bodo poslane našim strežnikom, razen če bodo v prihodnosti posebej implementirane.

### 3.9 Oglaševanje

Aplikacija lahko prikazuje oglase prek Google AdMob. Google lahko obdeluje identifikatorje naprav, podatke o uporabi, tehnične informacije in oglaševalske signale v skladu z Googlovimi pravilniki in nastavitvami oglasov uporabnika.

### 3.10 Podatki API-jev zunanjega trga

Aplikacija se lahko obrne na zunanje API-je za menjalne tečaje, kotacije, indekse ali tržne informacije. Te poizvedbe običajno vključujejo parametre, kot so valuta, sredstvo, država ali simbol, ki se išče. Za pridobitev teh informacij vam ni treba pošiljati registriranih osebnih finančnih podatkov.

## 4. Za kaj uporabljamo podatke

Podatke uporabljamo za:

- Ustvarite in vzdržujte svoj račun.
- Sinhronizirajte stroške, cilje, nastavitve, zgodovino in nastavitve.
- Prikažite nadzorne plošče, grafe, poročila, omejitve in prilagojeno vsebino.
- Dovoli nakupe, obnovo in potrditev Premium.
- Pošljite obvestila iz same aplikacije, ko je to dovoljeno.
- Obdelajte podprta finančna obvestila, če omogočite to funkcijo.
- Prilagajanje naložbene vsebine lokalnemu kontekstu, ko je lokalizacija avtorizirana.
- Izboljšajte stabilnost, zmogljivost, varnost in uporabniško izkušnjo.
- Izpolnjevanje zakonskih obveznosti, odgovarjanje na zahteve in preprečevanje zlorab.
- Prikažite oglase, kjer je primerno.

## 5. Pravne podlage

Kadar velja LGPD, lahko obdelava temelji na eni ali več pravnih podlagah, vključno z:- Izvedba pogodbe ali predhodnih postopkov za dostavo aplikacijskih virov.
- Soglasje za izbirna dovoljenja, kot so lokacija, potisna obvestila in dostop do obvestil Android.
- Zakonit interes za varnost, diagnozo, izboljšanje izdelkov, preprečevanje zlorab in sorazmerno statistiko.
- Skladnost z zakonskimi ali regulativnimi obveznostmi, kadar je to potrebno.
- Redno uveljavljanje pravic, v upravnem, sodnem ali izvensodnem postopku.

Izbirna soglasja lahko prekličete v nastavitvah aplikacije ali operacijskega sistema, vendar to lahko omeji funkcionalnost.

## 6. Deljenje s tretjimi osebami

Vaših osebnih podatkov ne prodajamo.

Ponudnikom lahko delimo ali dovolimo obdelavo podatkov, ki so potrebni za delovanje aplikacije, vključno z:

- **Google Firebase**: Firebase Authentication, Cloud Firestore, Firebase Cloud Messaging, Firebase Analytics in Firebase Crashlytics.
- **Prijava v Google / Prijava v Apple**: prijava prek računa tretje osebe, če izberete sami.
- **Google Play Billing**: obdelava naročnin, nakupov, odpovedi, obnovitev in status Premium.
- **Google AdMob**: prikazovanje in merjenje oglasov.
- **API-ji za trg, valuto ali kotacijo**: pregledovanje javnih ali tržnih finančnih informacij, ki se uporabljajo v aplikaciji.
- **Android sistemske storitve**: dovoljenja, obvestila in viri naprave.

Te tretje osebe lahko obdelujejo podatke v skladu s svojimi pogoji, politikami in nastavitvami.

## 7. Mednarodni prenos

Storitve, kot so Firebase, Google Play, AdMob in drugi ponudniki, lahko obdelujejo podatke na strežnikih zunaj Brazilije. Z uporabo aplikacije potrjujete, da lahko pride do te mednarodne obdelave v skladu z veljavnimi pravili o varstvu podatkov in pogoji ponudnikov.

## 8. Zadrževanje

Podatke hranimo toliko časa, kolikor je potrebno za dostavo aplikacije, izpolnjevanje namenov, opisanih v tej politiki, izpolnjevanje zakonskih obveznosti, reševanje sporov, preprečevanje goljufij in ohranjanje varnosti.

Na splošno:

- Podatki o računu in finančni podatki v oblaku ostanejo, dokler račun obstaja ali do veljavne zahteve za izbris.
- Lokalni podatki lahko ostanejo v napravi, dokler ne izbrišete, počistite podatkov aplikacije ali odstranite aplikacije.
- Diagnostični podatki, analitika in dnevniki se lahko hranijo za obdobja, ki jih določijo ponudniki.
- Informacije o nakupu lahko ostanejo v Google Play v skladu z davčnimi, trgovinskimi in trgovinskimi pravili.
- Anonimizirani ali združeni podatki se lahko hranijo brez vaše identifikacije.

## 9. Varnost

Sprejemamo razumne tehnične in organizacijske ukrepe za zaščito podatkov, vključno z:

- Preverjanje Firebase.
- Pravila dostopa v bazi podatkov za omejitev podatkov na ustreznega uporabnika.
- Komunikacija, šifrirana z uporabljenimi SDK-ji in API-ji.
- Uporaba dovoljenj Android samo v povezavi z viri aplikacije.
- Filtri pri spremljanju obvestil, da se izognete varnostnim kodam, OTP, geslom in sporočilom za preverjanje pristnosti.
- Diagnoza napak za odpravo napak in izboljšanje stabilnosti.

Noben sistem ni 100 % varen. Zaščitite tudi svojo napravo, uporabite zaklepanje zaslona, ​​imejte močno geslo, izogibajte se skupni rabi računa in posodobite aplikacijo, ko je izdana nova različica.

## 10. Vaše kontrole

Lahko:

- Uredite ali izbrišite informacije v aplikaciji, če ta funkcija obstaja.
- Onemogočite potisna obvestila v nastavitvah Android.
- Preklic lokacije v nastavitvah Android.
- Prekličite dostop do obvestil v nastavitvah Android.
- Prekličite ali upravljajte naročnino prek Google Play.
- Počistite lokalne podatke aplikacije ali odstranite aplikacijo.
- Zahtevajte dostop, popravek ali izbris prek kontaktne e-pošte.

## 11. Izbris računa in podatkov

Če želite zahtevati izbris računa in podatkov:1. Pošljite e-pošto na **george.guimares@gmail.com**.
2. Uporabite zadevo **"Izbris podatkov - Mentor Financeiro"** ali **"LGPD - Mentor Financeiro"**.
3. Vnesite e-poštni naslov računa, način prijave ali drug identifikator, ki pomaga najti profil.
4. Označite, ali želite popoln izbris računa/podatkov v oblaku ali izbris določenih kategorij, ko je to tehnično mogoče.

Morda bomo zahtevali potrditev identitete, da se izognemo nepotrebnim izbrisom.

Naslednje je lahko izključeno ali prekinjeno, kot je primerno:

- Uporabniški profil in dokumenti v Cloud Firestore.
- Poraba, cilji, nastavitve, finančna zgodovina in nastavitve, shranjene v oblaku.
- FCM žeton, povezan s profilom, ko je shranjen.
- Račun v Firebase Authentication, ko se zahteva popoln in tehnično uporaben izbris.

Lahko ostanejo dlje:

- Anonimizirani ali združeni podatki.
- Zapisi, potrebni za skladnost z zakonodajo, preprečevanje goljufij, varnost ali obrambo pravic.
- Zgodovino nakupov, plačil in naročnin vzdržuje Google Play.
- Podatki, ki jih neposredno obdelujejo tretji ponudniki v skladu z njihovimi politikami.

Na veljavne zahteve bomo skušali odgovoriti v 30 delovnih dneh, razen če so zahtevne, zakonske obveznosti ali potrebe po dodatnem preverjanju.

## 12. Pravice imetnika

V skladu z veljavno zakonodajo lahko zahtevate:

- Potrdilo o obstoju zdravljenja.
- Dostop do podatkov.
- Popravek nepopolnih, netočnih ali zastarelih podatkov.
- Anonimizacija, blokiranje ali brisanje nepotrebnih, prevelikih ali neskladnih podatkov.
- Informacije o skupni rabi.
- Preklic soglasja.
- Izbris podatkov, obdelanih na podlagi privolitve, kadar je to primerno.
- Prenosljivost, če je to predpisano in tehnično izvedljivo.
- Pregled avtomatiziranih odločitev, če je primerno.

Za uveljavljanje teh pravic pošljite e-pošto na **george.guimares@gmail.com**.

## 13. Otroci in mladostniki

Aplikacija ni namenjena otrokom mlajšim od 13 let. Če zakoniti skrbnik razume, da je otrok posredoval podatke aplikaciji, naj nas kontaktira, da lahko ocenimo izbris.

## 14. Spremembe tega pravilnika

Ta pravilnik o zasebnosti lahko posodobimo, da odraža spremembe aplikacije, ponudnikov, pravnih zahtev ali pravil Google Play. Datum na vrhu označuje trenutno različico. Ustrezne spremembe se lahko sporočijo znotraj aplikacije, na objavljeni strani ali na drug primeren način.

## 15. Kontakt

**Prijava:** Mentor Financeiro

**E-pošta:** george.guimares@gmail.com

**Pravilnik objavljen dne:** https://terriblegeorge.github.io/Mentor_Financeiro/

# Pravila privatnosti - Mentor Financeiro

**Zadnje ažuriranje:** 19. svibnja 2026

**Primjena:** Mentor Financeiro

**Paket Android:** `com.georgeguimares.mentorfinanceiro`

**Pravila objavljena:** https://terriblegeorge.github.io/Mentor_Financeiro/

Ova Pravila privatnosti jasno objašnjavaju kojim podacima Mentor Financeiro može pristupiti, prikupljati, koristiti, pohranjivati, dijeliti i štititi. Napisana je tako da odražava trenutni rad aplikacije i treba je čitati zajedno sa stranicom Uvjeti korištenja i Sigurnost.

Mentor Financeiro je aplikacija za financijsku organizaciju, financijsko obrazovanje, ciljeve, evidenciju troškova, grafikone, izvješća, investicijski sadržaj i izborne značajke pretplate Premium. Aplikacija nije banka, broker, financijska institucija, registrirani investicijski savjetnik, osiguravajuće društvo ili način plaćanja.

## 1. Tko je odgovoran

Mentor Financeiro nudi programer odgovoran za objavljivanje aplikacije na Google Play.

Za ostvarivanje prava vezanih uz vaše podatke, postavljanje pitanja ili zahtjev za brisanje, kontaktirajte nas putem e-pošte:

**george.guimares@gmail.com**

## 2. Sažetak na jednostavnom jeziku

- Aplikacija vam pomaže organizirati troškove, ciljeve, ograničenja, financijsku povijest, ulaganja i obrazovni sadržaj.
- Za korištenje određenih značajki, možete se prijaviti s e-poštom/lozinkom, Google računom, Apple računom ili anonimnim načinom, putem Firebase Authentication.
- Financijski podaci koje navedete, kao što su troškovi, ciljevi, ograničenja, profil i postavke, mogu se spremiti u Firebase/Cloud Firestore za sinkronizaciju i rad računa.
- Aplikacija koristi usluge Google/Firebase za prijavu, bazu podataka, push obavijesti, analitiku i dijagnozu kvarova.
- Aplikacija može koristiti Google AdMob za prikazivanje oglasa.
- Premium obrađuje Google Play Billing unutar same aplikacije.
- Lokacija nije obavezna i koristi se samo ako je odobrite, na primjer za prilagodbu usporedbi ulaganja zemlji ili lokalnom kontekstu.
- Značajka praćenja obavijesti nije obavezna. Ako omogućite pristup obavijestima na Android, aplikacija može čitati naslov i tekst podržanih obavijesti kako bi identificirala kupnje, plaćanja i prijenose te ih pretvorila u financijske zapise. Aplikacija ne pristupa vašem bankovnom računu i ne traži lozinku.
- Slike koje odaberete za personalizaciju mogu se pohraniti lokalno na uređaju.
- Možete zatražiti brisanje računa i podataka putem e-pošte navedene u ovim pravilima.

## 3. Podaci koje možemo obrađivati

Ovisno o tome kako koristite aplikaciju, možemo obrađivati sljedeće kategorije podataka.

### 3.1 Račun i identifikacijski podaci

- Ime navedeno u registraciji.
- E-mail.
- Firebase (UID) identifikator korisnika.
- Korištena metoda prijave.
- Profilnu sliku, ako je osigura davatelj usluge prijave.
- Premium status pretplate povezan s profilom.
- Tehnički podaci potrebni za održavanje sesije i sinkronizaciju informacija.

### 3.2 Financijski podaci koje ste unijeli

- Rashodi, izdaci, prihodi, kategorije, financijska povijest i transakcije.
- Ciljevi, ograničenja, planiranje, financijski snovi i preferencije.
- Informacije koje se koriste u grafikonima, izvješćima, analizama i automatskom mentorstvu unutar aplikacije.
- Profil investitora, ciljevi i odgovori navedeni u upitnicima ili ekranima za planiranje.

Ovi podaci mogu biti osjetljivi u praktičnom smislu jer otkrivaju aspekte vašeg financijskog života. Stoga biste trebali registrirati samo one podatke koje želite zadržati u aplikaciji.

### 3.3 Podaci o pretplati i kupnji

- Kupljeni proizvod, status pretplate, razdoblje, obnova, obnova kupnje i tehnički identifikatori potrebni za potvrdu Premium.
- Kupnje, otkazivanja, obnove, povrate i naknade obrađuje Google Play, u skladu s Google računom i pravilima trgovine.

Aplikacija ne prikuplja niti pohranjuje brojeve kartica, sigurnosne kodove kartica ili podatke o bankovnom plaćanju.

### 3.4 Podaci o upotrebi, dijagnostici i izvedbi- Događaji upotrebe i interakcije u aplikaciji, na primjer zasloni kojima se pristupa, korišteni resursi i dovršeni tokovi.
- Skupni ili tehnički podaci za razumijevanje stabilnosti, performansi i poboljšanja proizvoda.
- Izvješća o pogreškama i dijagnostika od strane Firebase Crashlytics, kada je primjenjivo, uključujući tehničke informacije o uređaju, verziju aplikacije, operativni sustav, zapisnike pogrešaka i identifikator korisnika kada je konfiguriran.

### 3.5 Podaci o push obavijestima

Ako dopustite obavijesti iz aplikacije, možemo obraditi sljedeće:

- Firebase Cloud Messaging žeton (FCM).
- Postavke vezane uz primanje obavijesti.
- Teme ili segmenti potrebni za slanje komunikacije iz same aplikacije.

Možete kontrolirati jesu li obavijesti dopuštene u postavkama Android.

### 3.6 Podaci obavijesti pročitani u Android

Praćenje obavijesti je izborna značajka. Radi samo ako ručno omogućite pristup obavijestima u postavkama Android.

Kada je omogućeno, aplikacija može primiti naslov, tekst, naziv izvornog paketa aplikacije, vrijeme i tehničke metapodatke iz obavijesti prikazanih na vašem uređaju. Cilj je identificirati obavijesti kompatibilne s troškovima, kupnjama, plaćanjima, pretplatama i prijenosima radi generiranja financijskih zapisa.

Važne mjere ove značajke:

- Aplikacija ne pristupa vašem bankovnom računu.
- Aplikacija se ne prijavljuje u banke, kartice ili digitalne novčanike.
- Aplikacija ne traži lozinku banke.
- Aplikacija primjenjuje filtre kako bi se izbjeglo snimanje sigurnosnih kodova, OTP, lozinki i autentifikacijskih poruka.
- Fokus filtra je identificirati kompatibilne kupnje, plaćanja, poslane transfere i financijska kretanja.
- Možete onemogućiti značajku u aplikaciji ili opozvati dopuštenje u postavkama Android.

Čak i uz filtre, obavijesti mogu sadržavati osjetljive informacije. Omogućite ovu značajku samo ako razumijete i prihvaćate ovu vrstu obrade.

### 3.7 Lokacija

Aplikacija može zatražiti približnu ili točnu lokaciju, prema dopuštenju koje je dao Android, kako bi prilagodila usporedbe, sadržaj ili kontekst ulaganja zemlji/regiji.

Lokacija nije potrebna za sve značajke. Ako odbijete dopuštenje, neke usporedbe ili prilagodbe mogu biti ograničene.

### 3.8 Lokalne slike i datoteke

Kada odaberete sliku za vizualnu prilagodbu aplikacije, ona se može pohraniti lokalno na uređaju. Osim ako se to posebno ne implementira u budućnosti, ove personalizacijske slike ne šalju se našim poslužiteljima.

### 3.9 Oglašavanje

Aplikacija može prikazivati reklame putem Google AdMob. Google može obrađivati ​​identifikatore uređaja, podatke o korištenju, tehničke informacije i oglašivačke signale u skladu s vlastitim Googleovim pravilima i korisničkim postavkama oglasa.

### 3.10 Podaci s API-ja vanjskog tržišta

Aplikacija može konzultirati vanjske API-je za tečajeve, kotacije, indekse ili tržišne informacije. Ovi upiti obično uključuju parametre kao što su valuta, imovina, država ili simbol koji se pretražuju. Nije potrebno slati svoje registrirane osobne financijske podatke da biste dobili ove informacije.

## 4. Za što koristimo podatke

Koristimo podatke za:

- Izradite i održavajte svoj račun.
- Sinkronizirajte troškove, ciljeve, postavke, povijest i postavke.
- Prikaz nadzornih ploča, grafikona, izvješća, ograničenja i personaliziranog sadržaja.
- Dopusti kupnju, restauraciju i provjeru valjanosti Premium.
- Šaljite obavijesti iz same aplikacije, kada je to dopušteno.
- Obrada podržanih financijskih obavijesti, ako omogućite ovu značajku.
- Prilagodite investicijski sadržaj lokalnom kontekstu, kada je lokalizacija odobrena.
- Poboljšajte stabilnost, performanse, sigurnost i iskustvo primjene.
- Ispoštovati zakonske obveze, odgovoriti na zahtjeve i spriječiti zlouporabu.
- Prikažite reklame gdje je to moguće.

## 5. Pravne osnove

Kada se primjenjuje LGPD, obrada se može oslanjati na jednu ili više pravnih osnova, uključujući:- Izvršenje ugovora ili preliminarnih postupaka, za isporuku resursa aplikacije.
- Pristanak, za izborna dopuštenja kao što su lokacija, push obavijesti i pristup Android obavijestima.
- Legitimni interes za sigurnost, dijagnozu, poboljšanje proizvoda, prevenciju zlouporabe i proporcionalnu statistiku.
- Usklađenost sa zakonskim ili regulatornim obvezama, kada je to potrebno.
- Redovito ostvarivanje prava, u upravnom, sudskom ili izvanparničnom postupku.

Neobavezne privole možete opozvati u postavkama aplikacije ili operativnog sustava, ali to može ograničiti funkcionalnost.

## 6. Dijeljenje s trećim stranama

Ne prodajemo vaše osobne podatke.

Možemo podijeliti ili dopustiti obradu podataka od strane pružatelja usluga potrebnih za rad aplikacije, uključujući:

- **Google Firebase**: Firebase Authentication, Cloud Firestore, Firebase Cloud Messaging, Firebase Analytics i Firebase Crashlytics.
- **Prijava na Google / Prijava na Apple**: prijava putem računa treće strane, ako to odaberete.
- **Google Play Billing**: obrada pretplata, kupnji, otkazivanja, obnova i status Premium.
- **Google AdMob**: prikaz i mjerenje oglasa.
- **API-ji za tržište, devizne tečajeve ili kotacije**: konzultacije o javnim ili tržišnim financijskim informacijama koje se koriste u aplikaciji.
- **Android usluge sustava**: dopuštenja, obavijesti i resursi uređaja.

Ove treće strane mogu obrađivati ​​podatke u skladu sa svojim uvjetima, pravilima i postavkama.

## 7. Međunarodni transfer

Usluge kao što su Firebase, Google Play, AdMob i drugi pružatelji mogu obrađivati podatke na poslužiteljima koji se nalaze izvan Brazila. Korištenjem aplikacije prihvaćate da se ova međunarodna obrada može dogoditi, podložno važećim pravilima o zaštiti podataka i uvjetima pružatelja usluga.

## 8. Zadržavanje

Podatke čuvamo onoliko dugo koliko je potrebno za isporuku aplikacije, ispunjavanje svrha opisanih u ovoj politici, poštivanje zakonskih obveza, rješavanje sporova, sprječavanje prijevara i održavanje sigurnosti.

općenito:

- Podaci o računu i financijski podaci u oblaku ostaju sve dok račun postoji ili do valjanog zahtjeva za brisanje.
- Lokalni podaci mogu ostati na uređaju dok ne obrišete, izbrišete podatke aplikacije ili deinstalirate aplikaciju.
- Dijagnostički podaci, analitika i zapisnici mogu se čuvati za razdoblja definirana od strane pružatelja usluga.
- Podaci o kupnji mogu ostati u Google Play prema poreznim, komercijalnim i trgovinskim pravilima.
- Anonimizirani ili skupni podaci mogu se čuvati bez vaše identifikacije.

## 9. Sigurnost

Usvajamo razumne tehničke i organizacijske mjere za zaštitu podataka, uključujući:

- Autentifikacija od strane Firebase.
- Pravila pristupa u bazi podataka za ograničavanje podataka na odgovarajućeg korisnika.
- Komunikacija šifrirana korištenim SDK-ovima i API-jima.
- Upotreba dopuštenja Android samo kada su povezana s resursima aplikacije.
- Filtri prilikom praćenja obavijesti kako bi se izbjegli sigurnosni kodovi, OTP, lozinke i autentifikacijske poruke.
- Dijagnostika kvarova za ispravljanje grešaka i poboljšanje stabilnosti.

Nijedan sustav nije 100% siguran. Također biste trebali zaštititi svoj uređaj, koristiti zaključavanje zaslona, ​​držati jaku zaporku, izbjegavati dijeljenje računa i ažurirati aplikaciju kada se objavi nova verzija.

## 10. Vaše kontrole

Možete:

- Uredite ili izbrišite podatke unutar aplikacije, ako ova funkcija postoji.
- Onemogućite push obavijesti u postavkama Android.
- Opozovite lokaciju u postavkama Android.
- Opozovite pristup obavijestima u postavkama Android.
- Otkažite ili upravljajte pretplatom putem Google Play.
- Obrišite lokalne podatke aplikacije ili deinstalirajte aplikaciju.
- Zatražite pristup, ispravak ili brisanje putem kontakt e-pošte.

## 11. Brisanje računa i podataka

Da biste zatražili brisanje računa i podataka:1. Pošaljite e-poštu na **george.guimares@gmail.com**.
2. Koristite predmet **"Brisanje podataka - Mentor Financeiro"** ili **"LGPD - Mentor Financeiro"**.
3. Unesite e-poštu računa, način prijave ili drugi identifikator koji pomaže u lociranju profila.
4. Naznačite želite li potpuno brisanje računa/podataka u oblaku ili brisanje određenih kategorija, kada je to tehnički moguće.

Možemo zatražiti potvrdu identiteta kako bismo izbjegli neopravdano brisanje.

Sljedeće se može isključiti ili prekinuti vezu, prema potrebi:

- Korisnički profil i dokumenti u Cloud Firestore.
- Potrošnja, ciljevi, postavke, financijska povijest i postavke spremljene u oblaku.
- FCM token povezan s profilom, kada je pohranjen.
- Račun u Firebase Authentication, kada se traži potpuno i tehnički primjenjivo brisanje.

Mogu ostati duže:

- Anonimizirani ili agregirani podaci.
- Zapisi potrebni za zakonsku usklađenost, sprječavanje prijevara, sigurnost ili obranu prava.
- Povijest kupnji, plaćanja i pretplata održava Google Play.
- Podaci koje izravno obrađuju dobavljači trećih strana u skladu s njihovim politikama.

Nastojat ćemo odgovoriti na važeće zahtjeve u roku od 30 radnih dana, osim u slučaju složenosti, zakonske obveze ili potrebe za dodatnom provjerom.

## 12. Prava nositelja

U skladu s primjenjivim zakonom, možete zatražiti:

- Potvrda o postojanju liječenja.
- Pristup podacima.
- Ispravak nepotpunih, netočnih ili zastarjelih podataka.
- Anonimizacija, blokiranje ili brisanje nepotrebnih, prekomjernih ili nesukladnih podataka.
- Informacije o dijeljenju.
- Opoziv privole.
- Brisanje podataka koji se obrađuju na temelju privole, kada je to primjenjivo.
- Prenosivost, kada je propisano i tehnički moguće.
- Pregled automatiziranih odluka, ako je primjenjivo.

Za ostvarivanje ovih prava pošaljite e-poruku na **george.guimares@gmail.com**.

## 13. Djeca i adolescenti

Aplikacija nije namijenjena djeci mlađoj od 13 godina. Ako zakonski skrbnik shvati da je dijete dalo podatke aplikaciji, trebao bi nas kontaktirati kako bismo mogli procijeniti brisanje.

## 14. Promjene ove politike

Možemo ažurirati ova Pravila o privatnosti kako bi odražavala promjene aplikacije, pružatelja usluga, pravnih zahtjeva ili pravila Google Play. Datum na vrhu označava trenutnu verziju. Relevantne promjene mogu se priopćiti unutar aplikacije, na objavljenoj stranici ili drugim razumnim sredstvima.

## 15. Kontakt

**Primjena:** Mentor Financeiro

**E-mail:** george.guimares@gmail.com

**Pravila objavljena:** https://terriblegeorge.github.io/Mentor_Financeiro/

# Turvalisus – Mentor Financeiro

**Viimati värskendatud:** 19. mai 2026

Sellel lehel selgitatakse Mentor Financeiro turvatavasid arusaadavas keeles. See täiendab privaatsuspoliitikat ja kasutustingimusi.

## 1. Turvakohustus

Mentor Financeiro töötati välja finantskorralduse abistamiseks ilma pangakontole otsejuurdepääsu küsimata, pangaparooli nõudmata ja panga, maaklerina või makseviisina töötamata.

Rakendus võib salvestada teie sisestatud või valikuliste funktsioonide abil tuvastatud finantsandmeid, mistõttu käsitleme turvalisust toote keskse osana.

## 2. Mida rakendus ei tee

- Ei küsi panga parooli, kaarti ega digitaalset rahakotti.
- Ei pääse teie pangakontole juurde.
- Ei liiguta raha.
- Ei tee teie nimel makseid, Pixi, ülekandeid ega investeeringuid.
- Ei nõua kaardi turvakoodi.
- Ei nõua pangakoodi OTP.
- Ei müü teie isikuandmeid.

## 3. Kasutatud tehnilised meetmed

Olenevalt kasutatavast ressursist saab rakendus kasutada:

- Logige sisse Firebase Authentication kaudu.
- Cloud Firestore autentitud kasutajaga seotud andmetega.
- Turvareeglid kasutaja enda andmetele juurdepääsu piiramiseks.
- SDK-de ja kasutatavate teenustega krüpteeritud side.
- Firebase Crashlytics tehniliste vigade tuvastamiseks ja probleemide lahendamiseks.
- Android lubasid taotletakse ainult siis, kui need on seotud rakenduse funktsioonidega.
- Kohalik salvestusseade eelistuste, teema, vahemälu ja seadme andmete jaoks.

## 4. Teavituste jälgimine

Teavituste jälgimine on valikuline ja nõuab seadmel Android käsitsi aktiveerimist.

Kui see on lubatud, saab rakendus lugeda toetatud teatisi, et tuvastada kulutusi, oste, makseid, tellimusi ja ülekandeid. Eesmärk on vähendada käsitsi tööd kulude kajastamisel.

Riskide vähendamiseks:

- Rakendus teavitab teid enne seadetesse suunamist loa andmise põhjusest.
- Juurdepääsu saab igal ajal Android seadetes tühistada.
- Filter otsib ühilduvaid finantssündmusi, mitte isiklikke vestlusi.
- Rakendus püüab ignoreerida OTP koode, paroole, turvakoode ja autentimissõnumeid.
- Rakendus ei kasuta seda funktsiooni pankadele, kaartidele või digitaalsetele rahakottidele juurdepääsuks.

Sellest hoolimata võivad teatised sisaldada tundlikke andmeid. Kasutage seda funktsiooni ainult siis, kui nõustute seda tüüpi töötlemisega.

## 5. Tundlikud load

Rakendus võib nõuda:

- **Internet:** ühendus Firebase, Google Play, API-de ja võrguressurssidega.
- **Teavitused:** märguannete saatmine rakendusest endast.
- **Asukoht:** sisu kohandamine või võrdlused riigi/piirkonnaga, kui see on lubatud.
- **Juurdepääs Android teavitustele:** kulude valikuline tuvastamine ühilduvate teatiste kaudu.
- **Rakendusesisesed ostud:** Premium tellimus Google Play.

Saate neid õigusi juhtida Android seadetes.

## 6. Sinu osa turvalisuses

Oma andmete kaitsmiseks tehke järgmist.

- Kasutage seadme ekraanilukku.
- Ärge jagage oma kontot.
- Hoidke rakendust ja Android värskendatuna.
- tühistage load, mida te enam kasutada ei soovi.
- Enne otsuste tegemist kontrollige automaatselt tuvastatud tehinguid.
- Ärge registreerige rakenduses teavet, mida te ei soovi säilitada.
- Kui te ei soovi uuendada, tühistage tellimus otse aadressil Google Play.

## 7. Piirangud

Ükski rakendus, server, operatsioonisüsteem ega pilveteenus pole 100% turvaline. Vaatamata võetud meetmetele võib esineda tõrkeid, kättesaamatust, sünkroonimisvigu, juurdepääsu kadumist, kolmandate isikute probleeme või väliseid kuritarvitamise katseid.

Mentor Financeiro püüab riske mõistlikult vähendada, kuid peate säilitama olulise finantsteabe koopiad või oma kontrolli.

## 8. Juhtumid ja kontakt

Kui märkate kummalist käitumist, ebaõiget juurdepääsu, ebaõigeid andmeid, kahtlustatavat turvarikkumist või probleeme tundlike lubadega, võtke ühendust:

**george.guimares@gmail.com**

Võimalusel lisage:

- Seadme mudel.
- Android versioon.
- Rakenduse versioon.
- Probleemi kirjeldus.
- Ekraanipildid ilma paroolide, koodide või liigsete andmete paljastamiseta.

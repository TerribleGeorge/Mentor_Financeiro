# Sekuriteit - Mentor Financeiro

**Laas opgedateer:** 19 Mei 2026

Hierdie bladsy verduidelik Mentor Financeiro sekuriteitspraktyke in eenvoudige taal. Dit komplementeer die Privaatheidsbeleid en Gebruiksvoorwaardes.

## 1. Sekuriteitsverbintenis

Mentor Financeiro is ontwikkel om te help met finansiële organisasie sonder om direkte toegang tot die bankrekening te vra, sonder om 'n bankwagwoord te versoek en sonder om as 'n bank, makelaar of betaalmetode te funksioneer.

Die toepassing kan finansiële data stoor wat deur u ingevoer is of deur opsionele kenmerke geïdentifiseer is, en daarom hanteer ons sekuriteit as 'n sentrale deel van die produk.

## 2. Wat die toepassing nie doen nie

- Vra nie vir bankwagwoord, kaart of digitale beursie nie.
- Het nie toegang tot jou bankrekening nie.
- Verskuif nie geld nie.
- Maak nie betalings, Pix, oordragte of beleggings in jou naam nie.
- Versoek nie kaartsekuriteitskode nie.
- Versoek nie bankkode OTP nie.
- Verkoop nie jou persoonlike data nie.

## 3. Tegniese maatreëls gebruik

Afhangende van die hulpbron wat gebruik word, kan die toepassing:

- Teken in deur Firebase Authentication.
- Cloud Firestore met data wat verband hou met die geverifieerde gebruiker.
- Sekuriteitsreëls om toegang tot die gebruiker se eie data te beperk.
- Kommunikasie geïnkripteer deur die SDK's en dienste wat gebruik word.
- Firebase Crashlytics om tegniese foute te identifiseer en probleme op te los.
- Android-toestemmings word slegs versoek wanneer dit met toepassingskenmerke verband hou.
- Plaaslike berging vir voorkeure, tema, kas en toesteldata.

## 4. Kennisgewingmonitering

Kennisgewingmonitering is opsioneel en vereis handaktivering op die Android.

Wanneer dit geaktiveer is, kan die toepassing ondersteunde kennisgewings lees om besteding, aankope, betalings, intekeninge en oordragte te herken. Die doel is om handwerk te verminder wanneer uitgawes aangeteken word.

Om risiko's te verminder:

- Die toepassing stel jou in kennis van die rede vir toestemming voordat jy na die instellings verwys.
- Toegang kan enige tyd in die Android instellings herroep word.
- Die filter soek versoenbare finansiële gebeure, nie persoonlike gesprekke nie.
- Die toepassing probeer om OTP-kodes, wagwoorde, sekuriteitskodes en verifikasieboodskappe te ignoreer.
- Die toepassing gebruik nie hierdie kenmerk om toegang tot banke, kaarte of digitale beursies te verkry nie.

Desondanks kan kennisgewings sensitiewe data bevat. Gebruik hierdie kenmerk slegs as jy instem tot hierdie tipe verwerking.

## 5. Sensitiewe toestemmings

Die toepassing kan versoek:

- **Internet:** verbinding met Firebase, Google Play, API's en aanlyn hulpbronne.
- **Kennisgewings:** stuur waarskuwings vanaf die toepassing self.
- **Ligging:** aanpassing van inhoud of vergelykings met die land/streek, wanneer gemagtig.
- **Toegang tot Android-kennisgewings:** opsionele identifikasie van uitgawes vanaf versoenbare kennisgewings.
- **Inprogram-aankope:** Premium-intekening deur Google Play.

Jy beheer hierdie toestemmings in die Android instellings.

## 6. Jou aandeel in sekuriteit

Om jou data te beskerm:

- Gebruik skermslot op die toestel.
- Moenie jou rekening deel nie.
- Hou die toepassing en Android opgedateer.
- Herroep toestemmings wat jy nie meer wil gebruik nie.
- Gaan outomaties geïdentifiseerde transaksies na voordat besluite geneem word.
- Moenie inligting registreer wat jy nie in die aansoek wil hou nie.
- Kanselleer intekeninge direk by Google Play wanneer jy nie wil hernu nie.

## 7. Beperkings

Geen toepassing, bediener, bedryfstelsel of wolkdiens is 100% veilig nie. Ten spyte van die maatreëls wat aangeneem is, kan mislukkings, onbeskikbaarheid, sinchronisasiefoute, verlies aan toegang, derdeparty-probleme of eksterne pogings tot misbruik voorkom.

Mentor Financeiro poog om risiko's redelik te verminder, maar jy moet kopieë of eie kontroles van noodsaaklike finansiële inligting onderhou.

## 8. Voorvalle en kontak

As jy vreemde gedrag, onbehoorlike toegang, verkeerde data, vermoedelike sekuriteitsbreuk of probleem met sensitiewe toestemmings opmerk, kontak asseblief:

**george.guimares@gmail.com**

Sluit in, indien moontlik:

- Toestelmodel.
- Weergawe van Android.
- App weergawe.
- Beskrywing van die probleem.
- Skermkiekies sonder om wagwoorde, kodes of oormatige data bloot te lê.

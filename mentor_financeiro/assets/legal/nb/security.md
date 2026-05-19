# Sikkerhet - Mentor Financeiro

**Sist oppdatert:** 19. mai 2026

Denne siden forklarer Mentor Financeiro sikkerhetspraksis på et enkelt språk. Det utfyller personvernreglene og vilkårene for bruk.

## 1. Sikkerhetsforpliktelse

Mentor Financeiro ble utviklet for å hjelpe med finansiell organisering uten å be om direkte tilgang til bankkontoen, uten å be om bankpassord og uten å fungere som bank, megler eller betalingsmetode.

Appen kan lagre økonomiske data som er lagt inn av deg eller identifisert av valgfrie funksjoner, og det er derfor vi behandler sikkerhet som en sentral del av produktet.

## 2. Hva appen ikke gjør

- Ber ikke om bankpassord, kort eller digital lommebok.
- Får ikke tilgang til bankkontoen din.
– Flytter ikke penger.
- Foretar ikke betalinger, Pix, overføringer eller investeringer i ditt navn.
- Ber ikke om kortsikkerhetskode.
- Ber ikke om bankkode OTP.
- Selger ikke personopplysningene dine.

## 3. Tekniske tiltak brukt

Avhengig av ressursen som brukes, kan appen bruke:

- Logg på med Firebase Authentication.
- Cloud Firestore med data knyttet til den autentiserte brukeren.
- Sikkerhetsregler for å begrense tilgangen til brukerens egne data.
- Kommunikasjon kryptert av SDK-ene og tjenestene som brukes.
- Firebase Crashlytics for å identifisere tekniske feil og fikse problemer.
- Android tillatelser forespurt bare når de er relatert til appfunksjoner.
- Lokal lagring for preferanser, tema, cache og enhetsdata.

## 4. Varslingsovervåking

Varslingsovervåking er valgfritt og krever manuell aktivering på Android.

Når den er aktivert, kan appen lese støttede varsler for å gjenkjenne utgifter, kjøp, betalinger, abonnementer og overføringer. Målet er å redusere manuelt arbeid ved utgiftsføring.

For å redusere risiko:

- Appen informerer deg om årsaken til tillatelsen før du dirigerer deg til innstillingene.
- Tilgang kan tilbakekalles når som helst i Android-innstillingene.
- Filteret søker etter kompatible økonomiske hendelser, ikke personlige samtaler.
- Appen prøver å ignorere OTP-koder, passord, sikkerhetskoder og autentiseringsmeldinger.
– Appen bruker ikke denne funksjonen for å få tilgang til banker, kort eller digitale lommebøker.

Allikevel kan varsler inneholde sensitive data. Bruk denne funksjonen bare hvis du godtar denne typen behandling.

## 5. Sensitive tillatelser

Appen kan be om:

- **Internett:** tilkobling til Firebase, Google Play, APIer og nettressurser.
- **Varsler:** sender varsler fra selve appen.
- **Sted:** tilpasning av innhold eller sammenligninger til landet/regionen, når autorisert.
- **Tilgang til Android-varsler:** valgfri identifikasjon av utgifter fra kompatible varsler.
- **Kjøp i appen:** Premium abonnement av Google Play.

Du kontrollerer disse tillatelsene i Android-innstillingene.

## 6. Din del i sikkerheten

For å beskytte dataene dine:

- Bruk skjermlås på enheten.
- Ikke del kontoen din.
- Hold appen og Android oppdatert.
- Tilbakekall tillatelser du ikke lenger vil bruke.
- Sjekk automatisk identifiserte transaksjoner før du tar beslutninger.
– Ikke registrer opplysninger du ikke ønsker å beholde i søknaden.
- Avbryt abonnementer direkte på Google Play når du ikke vil fornye.

## 7. Begrensninger

Ingen applikasjoner, servere, operativsystemer eller skytjenester er 100 % sikre. Til tross for vedtatte tiltak, kan feil, utilgjengelighet, synkroniseringsfeil, tap av tilgang, tredjepartsproblemer eller eksterne forsøk på misbruk forekomme.

Mentor Financeiro søker å redusere risikoen på en rimelig måte, men du må opprettholde kopier eller egne kontroller av viktig finansiell informasjon.

## 8. Hendelser og kontakt

Hvis du oppdager merkelig oppførsel, feil tilgang, feil data, mistenkt sikkerhetsbrudd eller problem med sensitive tillatelser, vennligst kontakt:

**george.guimares@gmail.com**

Ta med, hvis mulig:

- Enhetsmodell.
- Versjon av Android.
- Appversjon.
- Beskrivelse av problemet.
- Skjermbilder uten å avsløre passord, koder eller overdreven data.

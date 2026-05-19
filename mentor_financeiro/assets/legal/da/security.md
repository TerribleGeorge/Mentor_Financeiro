# Sikkerhed - Mentor Financeiro

**Sidst opdateret:** 19. maj 2026

Denne side forklarer Mentor Financeiro sikkerhedspraksis i et enkelt sprog. Det supplerer privatlivspolitikken og vilkårene for brug.

## 1. Sikkerhedsforpligtelse

Mentor Financeiro blev udviklet til at hjælpe med finansiel organisering uden at bede om direkte adgang til bankkontoen, uden at anmode om en bankadgangskode og uden at fungere som en bank, mægler eller betalingsmetode.

Appen kan gemme økonomiske data indtastet af dig eller identificeret ved valgfri funktioner, hvorfor vi behandler sikkerhed som en central del af produktet.

## 2. Hvad app'en ikke gør

- Den beder ikke om en bankadgangskode, kort eller digital tegnebog.
- Får ikke adgang til din bankkonto.
- Flytter ikke penge.
- Det foretager ikke betalinger, Pix, overførsler eller investeringer i dit navn.
- Anmoder ikke om kortsikkerhedskode.
- Anmoder ikke om bankkode OTP.
- Sælger ikke dine personlige data.

## 3. Anvendte tekniske foranstaltninger

Afhængigt af den anvendte ressource kan appen bruge:

- Log ind med Firebase Authentication.
- Cloud Firestore med data knyttet til den godkendte bruger.
- Sikkerhedsregler for at begrænse adgangen til brugerens egne data.
- Kommunikation krypteret af de anvendte SDK'er og tjenester.
- Firebase Crashlytics for at identificere tekniske fejl og rette problemer.
- Android-tilladelser anmodes kun om, når de er relateret til appfunktioner.
- Lokal lagring til præferencer, tema, cache og enhedsdata.

## 4. Underretningsovervågning

Notifikationsovervågning er valgfri og kræver manuel aktivering på Android.

Når den er aktiveret, kan appen læse understøttede meddelelser for at genkende udgifter, køb, betalinger, abonnementer og overførsler. Målet er at reducere manuelt arbejde ved registrering af udgifter.

For at reducere risici:

- Appen informerer dig om årsagen til tilladelsen, før den dirigerer dig til indstillingerne.
- Adgang kan til enhver tid tilbagekaldes i indstillingerne for Android.
- Filteret leder efter kompatible økonomiske begivenheder, ikke personlige samtaler.
- Appen forsøger at ignorere OTP-koder, adgangskoder, sikkerhedskoder og godkendelsesmeddelelser.
- Appen bruger ikke denne funktion til at få adgang til banker, kort eller digitale tegnebøger.

Alligevel kan meddelelser indeholde følsomme data. Brug kun denne funktion, hvis du accepterer denne type behandling.

## 5. Følsomme tilladelser

Appen kan anmode om:

- **Internet:** forbindelse til Firebase, Google Play, API'er og onlineressourcer.
- **Meddelelser:** sender advarsler fra selve appen.
- **Placering:** tilpasning af indhold eller sammenligninger til landet/regionen, når det er godkendt.
- **Adgang til Android meddelelser:** valgfri identifikation af udgifter fra kompatible meddelelser.
- **Køb i appen:** Premium abonnement af Google Play.

Du kontrollerer disse tilladelser i indstillingerne for Android.

## 6. Din del i sikkerheden

For at beskytte dine data:

- Brug skærmlås på din enhed.
- Del ikke din konto.
- Hold appen og Android opdateret.
- Tilbagekald tilladelser, du ikke længere ønsker at bruge.
- Tjek automatisk identificerede transaktioner, før du træffer beslutninger.
- Registrer ikke oplysninger, du ikke ønsker at beholde i ansøgningen.
- Annuller abonnementer direkte på Google Play, når du ikke ønsker at forny.

## 7. Begrænsninger

Ingen applikation, server, operativsystem eller cloud-tjeneste er 100 % sikker. På trods af de vedtagne foranstaltninger kan der forekomme fejl, utilgængelighed, synkroniseringsfejl, tab af adgang, tredjepartsproblemer eller eksterne forsøg på misbrug.

Mentor Financeiro søger at reducere risici med rimelighed, men du skal bevare kopier eller egen kontrol af væsentlige økonomiske oplysninger.

## 8. Hændelser og kontakt

Hvis du bemærker mærkelig adfærd, ukorrekt adgang, forkerte data, formodet sikkerhedsbrud eller problemer med følsomme tilladelser, bedes du kontakte:

**george.guimares@gmail.com**

Medtag, hvis det er muligt:

- Enhedsmodel.
- Android version.
- App version.
- Beskrivelse af problemet.
- Skærmbilleder uden at afsløre adgangskoder, koder eller overdreven data.

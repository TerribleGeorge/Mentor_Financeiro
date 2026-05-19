# Säkerhet - Mentor Financeiro

**Senast uppdaterad:** 19 maj 2026

Den här sidan förklarar Mentor Financeiro säkerhetspraxis på ett enkelt språk. Det kompletterar integritetspolicyn och användarvillkoren.

## 1. Säkerhetsåtagande

Mentor Financeiro har utvecklats för att hjälpa till med finansiell organisation utan att be om direkt tillgång till bankkontot, utan att begära ett banklösenord och utan att fungera som bank, mäklare eller betalningsmetod.

Appen kan lagra finansiell data som du har skrivit in eller identifierad av valfria funktioner, varför vi behandlar säkerhet som en central del av produkten.

## 2. Vad appen inte gör

- Ber inte om banklösenord, kort eller digital plånbok.
- Kommer inte åt ditt bankkonto.
– Flyttar inte pengar.
- Gör inga betalningar, Pix, överföringar eller investeringar i ditt namn.
- Begär inte kortets säkerhetskod.
- Begär inte bankkod OTP.
- Säljer inte dina personuppgifter.

## 3. Använda tekniska åtgärder

Beroende på vilken resurs som används kan appen använda:

- Logga in med Firebase Authentication.
- Cloud Firestore med data kopplade till den autentiserade användaren.
- Säkerhetsregler för att begränsa åtkomsten till användarens egna data.
- Kommunikation krypterad av SDK:er och tjänster som används.
- Firebase Crashlytics för att identifiera tekniska fel och åtgärda problem.
- Android-behörigheter begärs endast när de är relaterade till appfunktioner.
- Lokal lagring för inställningar, tema, cache och enhetsdata.

## 4. Meddelandeövervakning

Aviseringsövervakning är valfritt och kräver manuell aktivering på Android.

När den är aktiverad kan appen läsa aviseringar som stöds för att känna igen utgifter, köp, betalningar, prenumerationer och överföringar. Målet är att minska det manuella arbetet vid bokföring av utgifter.

För att minska riskerna:

- Appen informerar dig om orsaken till tillståndet innan du hänvisar dig till inställningarna.
- Åtkomst kan återkallas när som helst i Android-inställningarna.
- Filtret söker efter kompatibla ekonomiska händelser, inte personliga konversationer.
- Appen försöker ignorera OTP-koder, lösenord, säkerhetskoder och autentiseringsmeddelanden.
– Appen använder inte den här funktionen för att komma åt banker, kort eller digitala plånböcker.

Trots detta kan meddelanden innehålla känsliga uppgifter. Använd den här funktionen endast om du samtycker till denna typ av bearbetning.

## 5. Känsliga behörigheter

Appen kan begära:

- **Internet:** anslutning till Firebase, Google Play, API:er och onlineresurser.
- **Meddelanden:** skickar varningar från själva appen.
- **Plats:** anpassning av innehåll eller jämförelser till landet/regionen, när det är tillåtet.
- **Tillgång till Android-aviseringar:** valfri identifiering av utgifter från kompatibla meddelanden.
- **Köp i appar:** Premium prenumeration av Google Play.

Du styr dessa behörigheter i Android-inställningarna.

## 6. Din del i säkerheten

Så här skyddar du din data:

- Använd skärmlås på enheten.
- Dela inte ditt konto.
- Håll appen och Android uppdaterade.
- Återkalla behörigheter som du inte längre vill använda.
- Kontrollera automatiskt identifierade transaktioner innan du fattar beslut.
– Registrera inte uppgifter som du inte vill behålla i ansökan.
- Avsluta prenumerationer direkt på Google Play när du inte vill förnya.

## 7. Begränsningar

Ingen applikation, server, operativsystem eller molntjänst är 100 % säker. Trots vidtagna åtgärder kan fel, otillgänglighet, synkroniseringsfel, förlust av åtkomst, problem med tredje part eller externa missbruksförsök förekomma.

Mentor Financeiro strävar efter att minska riskerna på ett rimligt sätt, men du måste behålla kopior eller egna kontroller av viktig finansiell information.

## 8. Incidenter och kontakt

Om du upptäcker konstigt beteende, felaktig åtkomst, felaktig data, misstänkt säkerhetsintrång eller problem med känsliga behörigheter, vänligen kontakta:

**george.guimares@gmail.com**

Inkludera, om möjligt:

- Enhetsmodell.
- Version av Android.
- Appversion.
- Beskrivning av problemet.
- Skärmdumpar utan att avslöja lösenord, koder eller överdriven data.

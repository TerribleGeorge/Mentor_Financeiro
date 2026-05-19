# Drošība — Mentor Financeiro

**Pēdējoreiz atjaunināts:** 2026. gada 19. maijā

Šajā lapā ir izskaidrota Mentor Financeiro drošības prakse vienkāršā valodā. Tas papildina Privātuma politiku un Lietošanas noteikumus.

## 1. Drošības saistības

Mentor Financeiro tika izstrādāts, lai palīdzētu ar finanšu organizēšanu, neprasot tiešu piekļuvi bankas kontam, nepieprasot bankas paroli un nefunkcionējot kā banka, brokeris vai maksāšanas veids.

Lietojumprogramma var saglabāt jūsu ievadītos vai pēc izvēles funkciju identificētos finanšu datus, tāpēc mēs uzskatām drošību par produkta centrālo daļu.

## 2. Ko lietotne nedara

- Neprasa bankas paroli, karti vai digitālo maku.
- Nepiekļūst jūsu bankas kontam.
- Nepārvieto naudu.
- Neveic maksājumus, Pix, pārskaitījumus vai ieguldījumus uz jūsu vārda.
- Nepieprasa kartes drošības kodu.
- Nepieprasa bankas kodu OTP.
- Nepārdod jūsu personas datus.

## 3. Izmantotie tehniskie pasākumi

Atkarībā no izmantotā resursa lietotne var izmantot:

- Piesakieties, izmantojot Firebase Authentication.
- Cloud Firestore ar datiem, kas saistīti ar autentificēto lietotāju.
- Drošības noteikumi, lai ierobežotu piekļuvi paša lietotāja datiem.
- Saziņa, ko šifrē SDK un izmantotie pakalpojumi.
- Firebase Crashlytics, lai identificētu tehniskas kļūdas un novērstu problēmas.
- Android atļaujas tiek pieprasītas tikai tad, ja tās ir saistītas ar lietotņu funkcijām.
- Vietējā krātuve preferencēm, motīvam, kešatmiņai un ierīces datiem.

## 4. Paziņojumu uzraudzība

Paziņojumu pārraudzība nav obligāta, un ierīcei Android ir nepieciešama manuāla aktivizēšana.

Kad tas ir iespējots, lietotne var lasīt atbalstītos paziņojumus, lai atpazītu tēriņus, pirkumus, maksājumus, abonementus un pārskaitījumus. Mērķis ir samazināt roku darbu, ierakstot izdevumus.

Lai samazinātu riskus:

- Lietotne informē jūs par atļaujas iemeslu, pirms tiek novirzīts uz iestatījumiem.
- Piekļuvi jebkurā laikā var atsaukt Android iestatījumos.
- Filtrs meklē saderīgus finanšu notikumus, nevis personiskas sarunas.
- Lietotne mēģina ignorēt OTP kodus, paroles, drošības kodus un autentifikācijas ziņojumus.
- Lietotne neizmanto šo funkciju, lai piekļūtu bankām, kartēm vai digitālajiem makiem.

Tomēr paziņojumos var būt ietverti sensitīvi dati. Izmantojiet šo funkciju tikai tad, ja piekrītat šāda veida apstrādei.

## 5. Sensitīvas atļaujas

Lietotne var pieprasīt:

- **Internets:** savienojums ar Firebase, Google Play, API un tiešsaistes resursiem.
- **Paziņojumi:** brīdinājumu sūtīšana no pašas lietotnes.
- **Atrašanās vieta:** satura pielāgošana vai salīdzinājumi valstij/reģionam, ja tas ir atļauts.
- **Piekļuve Android paziņojumiem:** izvēles izdevumu identifikācija no saderīgiem paziņojumiem.
- **Pirkumi lietotnē:** Premium abonements līdz Google Play.

Šīs atļaujas jūs kontrolējat Android iestatījumos.

## 6. Jūsu daļa drošībā

Lai aizsargātu savus datus:

- Izmantojiet ierīces ekrāna bloķēšanu.
- Nekopīgojiet savu kontu.
- Atjauniniet lietotni un Android.
- Atsauciet atļaujas, kuras vairs nevēlaties izmantot.
- Pirms lēmumu pieņemšanas pārbaudiet automātiski identificētos darījumus.
- Nereģistrējiet informāciju, kuru nevēlaties paturēt pieteikumā.
- Ja nevēlaties atjaunot abonementus, atceliet abonementus tieši vietnē Google Play.

## 7. Ierobežojumi

Neviena lietojumprogramma, serveris, operētājsistēma vai mākoņpakalpojums nav 100% drošs. Neskatoties uz veiktajiem pasākumiem, var rasties kļūmes, nepieejamība, sinhronizācijas kļūdas, piekļuves zudums, trešās puses problēmas vai ārēji ļaunprātīgas izmantošanas mēģinājumi.

Mentor Financeiro cenšas saprātīgi samazināt riskus, taču jums ir jāsaglabā būtiskas finanšu informācijas kopijas vai pašam kontrole.

## 8. Incidenti un kontakti

Ja pamanāt dīvainu uzvedību, nepareizu piekļuvi, nepareizus datus, aizdomas par drošības pārkāpumu vai problēmu ar sensitīvām atļaujām, lūdzu, sazinieties ar:

**george.guimares@gmail.com**

Ja iespējams, iekļaujiet:

- Ierīces modelis.
- Android versija.
- Lietotnes versija.
- Problēmas apraksts.
- Ekrānuzņēmumi, neatklājot paroles, kodus vai pārmērīgus datus.

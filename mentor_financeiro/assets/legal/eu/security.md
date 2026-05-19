# Segurtasuna - Mentor Financeiro

**Azken eguneraketa:** 2026ko maiatzaren 19a

Orrialde honek Mentor Financeiro segurtasun praktikak hizkuntza sinplean azaltzen ditu. Pribatutasun-politika eta Erabilera-baldintzak osatzen ditu.

## 1. Segurtasun Konpromisoa

Mentor Financeiro finantza-antolakuntzan laguntzeko garatu zen, banku-kontura zuzeneko sarbidea eskatu gabe, bankuko pasahitzik eskatu gabe eta banku, broker edo ordainketa-metodo gisa funtzionatu gabe.

Aplikazioak zuk sartutako edo aukerako eginbideek identifikatutako finantza-datuak gorde ditzake, horregatik segurtasuna produktuaren erdiko zati gisa hartzen dugu.

## 2. Aplikazioak egiten ez duena

- Ez du bankuko pasahitzik, txartelik edo zorro digitalik eskatzen.
- Ez da zure banku-kontura sartzen.
- Ez du dirua mugitzen.
- Ez du ordainketarik, Pix, transferentzia edo inbertsiorik egiten zure izenean.
- Ez du txartelaren segurtasun-koderik eskatzen.
- Ez du banku-koderik eskatzen OTP.
- Ez ditu zure datu pertsonalak saltzen.

## 3. Erabilitako neurri teknikoak

Erabilitako baliabidearen arabera, aplikazioak erabil ditzake:

- Hasi saioa Firebase Authentication-k.
- Cloud Firestore autentifikatutako erabiltzailearekin lotutako datuekin.
- Erabiltzailearen datuetarako sarbidea mugatzeko segurtasun-arauak.
- Erabilitako SDK eta zerbitzuek enkriptatutako komunikazioa.
- Firebase Crashlytics akats teknikoak identifikatzeko eta arazoak zuzentzeko.
- Android baimenak aplikazioen eginbideekin erlazionatuta daudenean soilik eskatzen dira.
- Hobespenak, gaia, cachea eta gailuaren datuak tokiko biltegiratzea.

## 4. Jakinarazpenen Jarraipena

Jakinarazpenen jarraipena hautazkoa da eta eskuz aktibatzea eskatzen du Android gailuan.

Gaituta dagoenean, aplikazioak onartzen diren jakinarazpenak irakur ditzake gastuak, erosketak, ordainketak, harpidetzak eta transferentziak ezagutzeko. Helburua eskuzko lana murriztea da gastuak erregistratzean.

Arriskuak murrizteko:

- Aplikazioak baimenaren arrazoiaren berri ematen dizu ezarpenetara zuzendu aurretik.
- Sarbidea edozein unetan ezezta daiteke Android ezarpenetan.
- Iragazkiak finantza-gertaera bateragarriak bilatzen ditu, ez elkarrizketa pertsonalak.
- Aplikazioa OTP kodeak, pasahitzak, segurtasun kodeak eta autentifikazio-mezuak alde batera uzten saiatzen da.
- Aplikazioak ez du funtzio hori erabiltzen banku, txartel edo zorro digitaletara sartzeko.

Hala ere, jakinarazpenek datu sentikorrak izan ditzakete. Erabili funtzio hau prozesatzeko mota hau onartzen baduzu soilik.

## 5. Baimen sentikorrak

Aplikazioak eska ditzake:

- **Internet:** Firebase, Google Play, API eta lineako baliabideetarako konexioa.
- **Jakinarazpenak:** alertak bidaltzea aplikaziotik bertatik.
- **Kokapena:** edukiak herrialde/eskualdera egokitzea edo konparaketak, baimenduta dagoenean.
- ** Android jakinarazpenetarako sarbidea:** jakinarazpen bateragarrietatik gastuen aukerako identifikazioa.
- **Aplikazio barruko erosketak:** Premium harpidetza Google Play.

Baimen hauek kontrolatzen dituzu Android ezarpenetan.

## 6. Zure zatia segurtasunean

Zure datuak babesteko:

- Erabili pantailaren blokeoa zure gailuan.
- Ez partekatu zure kontua.
- Mantendu aplikazioa eta Android eguneratuta.
- Ezeztatu gehiago erabili nahi ez dituzun baimenak.
- Egiaztatu automatikoki identifikatutako transakzioak erabakiak hartu aurretik.
- Ez erregistratu aplikazioan gorde nahi ez duzun informazioa.
- Utzi harpidetzak zuzenean Google Play helbidean berritu nahi ez duzunean.

## 7. Mugak

Ez dago aplikazio, zerbitzari, sistema eragile edo hodeiko zerbitzurik %100 seguru. Hartutako neurriak gorabehera, hutsegiteak, erabilgarritasunik eza, sinkronizazio akatsak, sarbidea galtzea, hirugarrenen arazoak edo kanpoko gehiegikeria saiakerak gerta daitezke.

Mentor Financeiro arriskuak arrazoiz murriztea bilatzen du, baina funtsezko finantza-informazioaren kopiak edo kontrolak mantendu behar dituzu.

## 8. Gorabeherak eta kontaktua

Jokaera arraroa, sarbide desegokia, datu okerrak, ustezko segurtasun-urraketa edo baimen sentikorren arazoa nabaritzen baduzu, jarri harremanetan:

**george.guimares@gmail.com**

Sartu, ahal bada:

- Gailuaren eredua.
- Android bertsioa.
- Aplikazioaren bertsioa.
- Arazoaren deskribapena.
- Pantaila-argazkiak pasahitzak, kodeak edo gehiegizko datuak agerian utzi gabe.

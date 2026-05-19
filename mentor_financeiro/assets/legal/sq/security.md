# Siguria - Mentor Financeiro

**Përditësimi i fundit:** 19 maj 2026

Kjo faqe shpjegon praktikat e sigurisë Mentor Financeiro në gjuhë të drejtpërdrejtë. Ai plotëson Politikën e Privatësisë dhe Kushtet e Përdorimit.

## 1. Angazhimi për sigurinë

Mentor Financeiro u zhvillua për të ndihmuar me organizatat financiare pa kërkuar qasje të drejtpërdrejtë në llogarinë bankare, pa kërkuar fjalëkalim bankar dhe pa funksionuar si bankë, ndërmjetës apo mënyrë pagese.

Aplikacioni mund të ruajë të dhënat financiare të futura nga ju ose të identifikuara nga veçoritë opsionale, prandaj ne e trajtojmë sigurinë si një pjesë qendrore të produktit.

## 2. Çfarë nuk bën aplikacioni

- Nuk kërkon fjalëkalim bankar, kartë apo portofol dixhital.
- Nuk hyn në llogarinë tuaj bankare.
- Nuk lëviz para.
- Nuk kryen pagesa, Pix, transferta apo investime në emrin tuaj.
- Nuk kërkon kod sigurie të kartës.
- Nuk kërkon kodin bankar OTP.
- Nuk i shet të dhënat tuaja personale.

## 3. Masat teknike të përdorura

Në varësi të burimit të përdorur, aplikacioni mund të përdorë:

- Hyni nga Firebase Authentication.
- Cloud Firestore me të dhëna të lidhura me përdoruesin e vërtetuar.
- Rregullat e sigurisë për të kufizuar aksesin në të dhënat e vetë përdoruesit.
- Komunikimi i koduar nga SDK-të dhe shërbimet e përdorura.
- Firebase Crashlytics për të identifikuar defektet teknike dhe për të rregulluar problemet.
- Lejet Android kërkohen vetëm kur lidhen me veçoritë e aplikacionit.
- Ruajtja lokale për preferencat, temën, cache-in dhe të dhënat e pajisjes.

## 4. Monitorimi i njoftimeve

Monitorimi i njoftimeve është opsional dhe kërkon aktivizim manual në Android.

Kur aktivizohet, aplikacioni mund të lexojë njoftimet e mbështetura për të njohur shpenzimet, blerjet, pagesat, abonimet dhe transferimet. Qëllimi është të zvogëlohet puna manuale gjatë regjistrimit të shpenzimeve.

Për të reduktuar rreziqet:

- Aplikacioni ju informon për arsyen e lejes përpara se t'ju drejtojë te cilësimet.
- Qasja mund të revokohet në çdo kohë në cilësimet Android.
- Filtri kërkon për ngjarje të përputhshme financiare, jo për biseda personale.
- Aplikacioni përpiqet të injorojë kodet OTP, fjalëkalimet, kodet e sigurisë dhe mesazhet e vërtetimit.
- Aplikacioni nuk e përdor këtë veçori për të hyrë në banka, karta ose kuleta dixhitale.

Megjithatë, njoftimet mund të përmbajnë të dhëna të ndjeshme. Përdoreni këtë veçori vetëm nëse jeni dakord me këtë lloj përpunimi.

## 5. Lejet e ndjeshme

Aplikacioni mund të kërkojë:

- **Interneti:** lidhje me Firebase, Google Play, API dhe burime online.
- **Njoftimet:** dërgimi i sinjalizimeve nga vetë aplikacioni.
- **Vendndodhja:** përshtatja e përmbajtjes ose krahasimet me vendin/rajonin, kur autorizohet.
- **Qasja në njoftimet Android:** identifikimi opsional i shpenzimeve nga njoftimet e përputhshme.
- **Blerjet përmes aplikacionit:** Abonim Premium nga Google Play.

Ju i kontrolloni këto leje në cilësimet Android.

## 6. Pjesa juaj në siguri

Për të mbrojtur të dhënat tuaja:

- Përdorni kyçjen e ekranit në pajisje.
- Mos e ndani llogarinë tuaj.
- Mbani të përditësuar aplikacionin dhe Android.
- Anuloni lejet që nuk dëshironi të përdorni më.
- Kontrolloni transaksionet e identifikuara automatikisht përpara se të merrni vendime.
- Mos regjistroni informacione që nuk dëshironi t'i mbani në aplikacion.
- Anuloni abonimet direkt në Google Play kur nuk dëshironi të rinovoni.

## 7. Kufizimet

Asnjë aplikacion, server, sistem operativ apo shërbim cloud nuk është 100% i sigurt. Pavarësisht masave të miratuara, mund të ndodhin dështime, mosdisponueshmëri, gabime sinkronizimi, humbje të aksesit, probleme të palëve të treta ose përpjekje të jashtme për abuzim.

Mentor Financeiro kërkon të reduktojë rreziqet në mënyrë të arsyeshme, por ju duhet të mbani kopje ose kontrolle të vetë informacionit financiar thelbësor.

## 8. Incidentet dhe kontaktet

Nëse vëreni sjellje të çuditshme, qasje të pahijshme, të dhëna të pasakta, shkelje të dyshuar të sigurisë ose problem me lejet e ndjeshme, ju lutemi kontaktoni:

**george.guimares@gmail.com**

Përfshini, nëse është e mundur:

- Modeli i pajisjes.
- Versioni i Android.
- Versioni i aplikacionit.
- Përshkrimi i problemit.
- Pamjet e ekranit pa ekspozuar fjalëkalime, kode ose të dhëna të tepërta.

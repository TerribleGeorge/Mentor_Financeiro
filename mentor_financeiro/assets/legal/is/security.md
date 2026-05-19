# Öryggi - Mentor Financeiro

**Síðast uppfært:** 19. maí 2026

Þessi síða útskýrir Mentor Financeiro öryggisaðferðir á einföldu máli. Það er viðbót við persónuverndarstefnu og notkunarskilmála.

## 1. Öryggisskuldbinding

Mentor Financeiro var þróað til að aðstoða við skipulagningu fjármála án þess að biðja um beinan aðgang að bankareikningnum, án þess að biðja um lykilorð banka og án þess að virka sem banki, miðlari eða greiðslumáti.

Forritið getur geymt fjárhagsgögn sem þú hefur slegið inn eða auðkennd með valkvæðum eiginleikum, þess vegna lítum við á öryggi sem miðlægan hluta vörunnar.

## 2. Það sem appið gerir ekki

- Biður ekki um lykilorð banka, kort eða stafrænt veski.
- Hefur ekki aðgang að bankareikningnum þínum.
- Færir ekki peninga.
- Framkvæmir ekki greiðslur, Pix, millifærslur eða fjárfestingar í þínu nafni.
- Biður ekki um öryggiskóða kortsins.
- Óskar ekki eftir bankakóða OTP.
- Selur ekki persónulegar upplýsingar þínar.

## 3. Tæknilegar ráðstafanir notaðar

Það fer eftir því hvaða úrræði er notað, appið getur notað:

- Innskráning með Firebase Authentication.
- Cloud Firestore með gögnum sem tengjast auðkennda notandanum.
- Öryggisreglur til að takmarka aðgang að eigin gögnum notandans.
- Samskipti dulkóðuð af SDK og þjónustu sem notuð eru.
- Firebase Crashlytics til að bera kennsl á tæknilegar bilanir og laga vandamál.
- Aðeins beðið um Android heimildir þegar þær tengjast appeiginleikum.
- Staðbundin geymsla fyrir óskir, þema, skyndiminni og tækisgögn.

## 4. Vöktun tilkynninga

Vöktun tilkynninga er valfrjálst og krefst handvirkrar virkjunar á Android.

Þegar það er virkt getur forritið lesið studdar tilkynningar til að þekkja eyðslu, kaup, greiðslur, áskrift og millifærslur. Markmiðið er að draga úr handavinnu við skráningu útgjalda.

Til að draga úr áhættu:

- Forritið upplýsir þig um ástæðu leyfisins áður en þú vísar þér í stillingarnar.
- Hægt er að afturkalla aðgang hvenær sem er í stillingum Android.
- Sían leitar að samhæfðum fjármálaviðburðum, ekki persónulegum samtölum.
- Forritið reynir að hunsa OTP kóða, lykilorð, öryggiskóða og auðkenningarskilaboð.
- Forritið notar ekki þennan eiginleika til að fá aðgang að bönkum, kortum eða stafrænum veski.

Þrátt fyrir það geta tilkynningar innihaldið viðkvæm gögn. Notaðu þennan eiginleika aðeins ef þú samþykkir þessa tegund vinnslu.

## 5. Viðkvæmar heimildir

Forritið gæti beðið um:

- **Internet:** tenging við Firebase, Google Play, API og auðlindir á netinu.
- **Tilkynningar:** sendir tilkynningar frá forritinu sjálfu.
- **Staðsetning:** aðlögun efnis eða samanburður við landið/svæðið, þegar leyfi er fyrir hendi.
- **Aðgangur að Android tilkynningum:** valfrjáls auðkenning kostnaðar frá samhæfum tilkynningum.
- **Kaup í forriti:** Premium áskrift frá Google Play.

Þú stjórnar þessum heimildum í Android stillingunum.

## 6. Þinn þáttur í öryggismálum

Til að vernda gögnin þín:

- Notaðu skjálás á tækinu.
- Ekki deila reikningnum þínum.
- Haltu appinu og Android uppfærðum.
- Afturkalla heimildir sem þú vilt ekki lengur nota.
- Athugaðu sjálfkrafa auðkennd viðskipti áður en þú tekur ákvarðanir.
- Ekki skrá upplýsingar sem þú vilt ekki geyma í umsókninni.
- Hættaðu áskriftum beint á Google Play þegar þú vilt ekki endurnýja.

## 7. Takmarkanir

Ekkert forrit, þjónn, stýrikerfi eða skýjaþjónusta er 100% örugg. Þrátt fyrir þær ráðstafanir sem gripið hefur verið til geta bilanir, óaðgengi, samstillingarvillur, aðgangsmissir, vandamál þriðja aðila eða ytri tilraunir til misnotkunar komið upp.

Mentor Financeiro leitast við að draga úr áhættu á sanngjarnan hátt, en þú verður að viðhalda afritum eða eigin stjórn á nauðsynlegum fjárhagsupplýsingum.

## 8. Atvik og snerting

Ef þú tekur eftir undarlegri hegðun, óviðeigandi aðgangi, röngum gögnum, grun um öryggisbrot eða vandamál með viðkvæmar heimildir, vinsamlegast hafðu samband við:

**george.guimares@gmail.com**

Látið fylgja með, ef mögulegt er:

- Gerð tækis.
- Útgáfa af Android.
- App útgáfa.
- Lýsing á vandamálinu.
- Skjáskot án þess að afhjúpa lykilorð, kóða eða of mikið af gögnum.

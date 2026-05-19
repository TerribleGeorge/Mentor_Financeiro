# Adatvédelmi szabályzat - Mentor Financeiro

**Utolsó frissítés:** 2026. május 19

**Jelentkezés:** Mentor Financeiro

**Csomag Android:** `com.georgeguimares.mentorfinanceiro`

**Az irányelv közzététele:** https://terriblegeorge.github.io/Mentor_Financeiro/

Ez az adatvédelmi szabályzat egyértelműen elmagyarázza, hogy az Mentor Financeiro mely adatokhoz férhet hozzá, gyűjthet, használhat, tárolhat, oszthat meg és védhet. Úgy írták, hogy tükrözze az alkalmazás jelenlegi működését, és a Használati feltételek és biztonság oldallal együtt kell olvasni.

Az Mentor Financeiro egy alkalmazás pénzügyi szervezéshez, pénzügyi oktatáshoz, célokhoz, költségnyilvántartásokhoz, grafikonokhoz, jelentésekhez, befektetési tartalmakhoz és opcionális Premium előfizetési funkciókhoz. Az alkalmazás nem bank, bróker, pénzintézet, bejegyzett befektetési tanácsadó, biztosító vagy fizetési mód.

## 1. Ki a felelős

Az Mentor Financeiro-t az alkalmazás Google Play-on való közzétételéért felelős fejlesztő kínálja.

Az adataival kapcsolatos jogok gyakorlásához, kérdés feltevéséhez vagy törlés kéréséhez vegye fel velünk a kapcsolatot e-mailben:

**george.guimares@gmail.com**

## 2. Összefoglalás közérthető nyelven

- Az alkalmazás segít a kiadások, célok, korlátok, pénzügyi előzmények, befektetések és oktatási tartalmak megszervezésében.
- Bizonyos funkciók használatához e-mail-címmel/jelszóval, Google-fiókkal, Apple-fiókkal vagy inkognitómóddal jelentkezhet be a Firebase Authentication-on keresztül.
- Az Ön által megadott pénzügyi adatok, mint például a költségek, a célok, a limitek, a profil és a preferenciák, a Firebase/Cloud Firestore-ba menthetők szinkronizálás és számlakezelés céljából.
- Az alkalmazás a Google/Firebase szolgáltatásokat használja a bejelentkezéshez, az adatbázishoz, a push értesítésekhez, az elemzésekhez és a hibadiagnosztikához.
- Az alkalmazás használhatja a Google AdMob-t a hirdetések megjelenítéséhez.
- Az Premium-t az Google Play Billing dolgozza fel magában az alkalmazásban.
- A hely megadása nem kötelező, és csak akkor használható, ha Ön engedélyezi, például a befektetések összehasonlításának az országhoz vagy a helyi környezethez igazítása érdekében.
- Az értesítésfigyelő funkció nem kötelező. Ha engedélyezi az értesítésekhez való hozzáférést az Android eszközön, az alkalmazás elolvashatja a támogatott értesítések címét és szövegét, hogy azonosítsa a vásárlásokat, fizetéseket és átutalásokat, és ezeket pénzügyi nyilvántartásokká alakítsa. Az alkalmazás nem fér hozzá a bankszámlájához, és nem kér jelszót.
- Az Ön által személyre szabott képek helyben tárolhatók a készüléken.
- Fiók és adatok törlését a jelen szabályzatban megjelölt email címen kérheti.

## 3. Adatok, amelyeket feldolgozhatunk

Attól függően, hogy Ön hogyan használja az alkalmazást, a következő adatkategóriákat dolgozhatjuk fel.

### 3.1 Számla- és azonosító adatok

- A regisztrációnál megadott név.
- E-mail.
- Firebase (UID) felhasználói azonosító.
- Használt bejelentkezési mód.
- Profilfotó, ha a bejelentkezési szolgáltató megadja.
- A profilhoz társított Premium előfizetési állapot.
- A munkamenet fenntartásához és az információk szinkronizálásához szükséges technikai adatok.

### 3.2 Az Ön által megadott pénzügyi adatok

- Kiadások, kiadások, bevételek, kategóriák, pénzügyi előzmények és tranzakciók.
- Célok, korlátok, tervezés, pénzügyi álmok és preferenciák.
- Az alkalmazáson belüli grafikonokban, jelentésekben, elemzésekben és automatikus mentorálásban használt információk.
- Befektetői profil, kérdőíveken vagy tervezési képernyőkön megadott célok és válaszok.

Ezek az adatok gyakorlati értelemben érzékenyek lehetnek, mert feltárják pénzügyi életének aspektusait. Ezért csak azokat az információkat szabad regisztrálnia, amelyeket meg szeretne őrizni az alkalmazásban.

### 3.3 Előfizetési és vásárlási adatok

- Vásárolt termék, előfizetés állapota, időszak, megújítás, vásárlás helyreállítása és műszaki azonosítók szükségesek a megerősítéshez Premium.
- A vásárlásokat, lemondásokat, megújításokat, visszatérítéseket és terheléseket a Google Play dolgozza fel a Google-fiókra és az üzletre vonatkozó szabályokkal összhangban.

Az alkalmazás nem gyűjt és nem tárol kártyaszámokat, kártyabiztonsági kódokat vagy banki fizetési adatokat.

### 3.4 Használati, diagnosztikai és teljesítményadatok- Használati és interakciós események az alkalmazásban, például elért képernyők, felhasznált erőforrások és befejezett folyamatok.
- Összesített vagy műszaki adatok a termék stabilitásának, teljesítményének és fejlesztésének megértéséhez.
- A Firebase Crashlytics hibajelentések és -diagnosztika, ha alkalmazható, beleértve az eszköz műszaki adatait, az alkalmazás verzióját, az operációs rendszert, a hibanaplókat és a felhasználói azonosítót, ha konfigurálva van.

### 3.5 Push értesítési adatok

Ha engedélyezi az értesítéseket az alkalmazásból, a következőket tudjuk kezelni:

- Firebase Cloud Messaging token (FCM).
- Az értesítések fogadásával kapcsolatos beállítások.
- Magából az alkalmazásból történő kommunikációhoz szükséges témák vagy szegmensek.

Az Android beállításaiban szabályozhatja, hogy engedélyezhetők-e az értesítések.

### 3.6 Az értesítési adatok beolvasása a Android-ban

Az értesítések figyelése opcionális funkció. Csak akkor működik, ha manuálisan engedélyezi az értesítésekhez való hozzáférést az Android beállításaiban.

Ha engedélyezve van, az alkalmazás megkaphatja a címet, a szöveget, a forrásalkalmazás-csomag nevét, az időt és a technikai metaadatokat az eszközön megjelenő értesítésekből. A cél a kiadásokkal, vásárlásokkal, kifizetésekkel, előfizetésekkel és átutalással kompatibilis értesítések azonosítása a pénzügyi nyilvántartások létrehozásához.

A funkció fontos intézkedései:

- Az alkalmazás nem fér hozzá a bankszámlájához.
- Az alkalmazás nem jelentkezik be bankokba, kártyákba vagy digitális pénztárcákba.
- Az alkalmazás nem kér banki jelszót.
- Az alkalmazás szűrőket alkalmaz, hogy elkerülje a biztonsági kódok, OTP, jelszavak és hitelesítési üzenetek rögzítését.
- A szűrő célja a kompatibilis vásárlások, fizetések, átutalások és pénzügyi mozgások azonosítása.
- Letilthatja a funkciót az alkalmazásban, vagy visszavonhatja az engedélyt az Android beállításaiban.

Az értesítések még szűrőkkel együtt is érzékeny információkat tartalmazhatnak. Csak akkor engedélyezze ezt a funkciót, ha megérti és elfogadja az ilyen típusú feldolgozást.

### 3.7 Hely

Az alkalmazás kérhet hozzávetőleges vagy pontos helyet az Android engedélyének megfelelően, hogy az összehasonlításokat, a tartalmat vagy a befektetési környezetet az országhoz/régióhoz igazítsa.

A hely megadása nem minden funkcióhoz szükséges. Ha megtagadja az engedélyt, bizonyos összehasonlítások vagy testreszabások korlátozottak lehetnek.

### 3.8 Helyi képek és fájlok

Ha kiválaszt egy képet az alkalmazás vizuális személyre szabásához, azt helyben tárolhatja az eszközön. Ezeket a személyre szabott képeket nem küldjük el szervereinkre, hacsak a jövőben nem valósítják meg kifejezetten.

### 3.9 Reklámozás

Az alkalmazás hirdetéseket jeleníthet meg a Google AdMob segítségével. A Google az eszközazonosítókat, használati adatokat, műszaki információkat és hirdetési jeleket a Google saját irányelveinek és a felhasználó hirdetési beállításainak megfelelően dolgozhatja fel.

### 3.10 Adatok külső piaci API-któl

Az alkalmazás külső API-kat kereshet árfolyamok, jegyzések, indexek vagy piaci információk tekintetében. Ezek a lekérdezések általában olyan paramétereket tartalmaznak, mint a keresett pénznem, eszköz, ország vagy szimbólum. Ezen információk megszerzéséhez nem szükséges elküldeni regisztrált személyes pénzügyi adatait.

## 4. Mire használjuk az adatokat

Az adatokat a következőkre használjuk:

- Fiók létrehozása és karbantartása.
- Szinkronizálja a kiadásokat, célokat, preferenciákat, előzményeket és beállításokat.
- Irányítópultok, grafikonok, jelentések, korlátok és személyre szabott tartalmak megjelenítése.
- Engedélyezze a Premium vásárlását, helyreállítását és érvényesítését.
- Értesítések küldése magából az alkalmazásból, ha engedélyezett.
- A támogatott pénzügyi értesítések feldolgozása, ha engedélyezi ezt a funkciót.
- A befektetési tartalom hozzáigazítása a helyi környezethez, ha a lokalizáció engedélyezett.
- A stabilitás, a teljesítmény, a biztonság és az alkalmazási élmény javítása.
- Törvényi kötelezettségek betartása, megkeresések megválaszolása és visszaélések megelőzése.
- Adott esetben hirdetések megjelenítése.

## 5. Jogalapok

Amikor az LGPD vonatkozik, a feldolgozás egy vagy több jogi alapon alapulhat, beleértve:- Szerződések vagy előzetes eljárások lebonyolítása, pályázati források szállítása.
- Hozzájárulás az opcionális engedélyekhez, például a helymeghatározáshoz, a push értesítésekhez és az Android értesítésekhez való hozzáféréshez.
- Jogos érdek a biztonsághoz, a diagnózishoz, a termékfejlesztéshez, a visszaélések megelőzéséhez és az arányos statisztikákhoz.
- Szükség esetén a jogi vagy szabályozási kötelezettségek betartása.
- Jogok rendszeres gyakorlása közigazgatási, bírósági vagy bíróságon kívüli eljárásokban.

Az opcionális hozzájárulásokat visszavonhatja az alkalmazás vagy az operációs rendszer beállításaiban, de ez korlátozhatja a funkcionalitást.

## 6. Megosztás harmadik felekkel

Személyes adatait nem adjuk el.

Megoszthatjuk vagy engedélyezhetjük az alkalmazás működéséhez szükséges adatok szolgáltatók általi feldolgozását, beleértve:

- **Google Firebase**: Firebase Authentication, Cloud Firestore, Firebase Cloud Messaging, Firebase Analytics és Firebase Crashlytics.
- **Google Bejelentkezés / Apple Bejelentkezés**: bejelentkezés harmadik fél fiókján keresztül, ha Ön választja.
- **Google Play Billing**: előfizetések, vásárlások, lemondások feldolgozása, az Premium visszaállítása és állapota.
- **Google AdMob**: hirdetések megjelenítése és mérése.
- **Piac-, deviza- vagy jegyzési API-k**: az alkalmazásban használt nyilvános vagy piaci pénzügyi információk megtekintése.
- **Android rendszerszolgáltatások**: engedélyek, értesítések és eszközerőforrások.

Ezek a harmadik felek az adatokat saját feltételeik, szabályzataik és beállításaik szerint dolgozhatják fel.

## 7. Nemzetközi átutalás

Az olyan szolgáltatások, mint a Firebase, Google Play, az AdMob és más szolgáltatók Brazílián kívüli szervereken dolgozhatnak fel adatokat. Az alkalmazás használatával Ön tudomásul veszi, hogy erre a nemzetközi adatkezelésre sor kerülhet, a vonatkozó adatvédelmi szabályok és a szolgáltatók feltételei szerint.

## 8. Megtartás

Az adatokat addig őrizzük meg, ameddig az alkalmazás kézbesítéséhez, a jelen szabályzatban leírt célok teljesítéséhez, a jogi kötelezettségek betartásához, a viták rendezéséhez, a csalások megelőzéséhez és a biztonság fenntartásához szükséges.

Általánosságban:

- A számlaadatok és a pénzügyi adatok a felhőben mindaddig megmaradnak, amíg a fiók létezik, vagy érvényes törlési kérésig.
- A helyi adatok mindaddig az eszközön maradhatnak, amíg nem törli, törli az alkalmazásadatokat vagy eltávolítja az alkalmazást.
- A diagnosztikai adatok, elemzések és naplók a szolgáltatók által meghatározott ideig tárolhatók.
- A vásárlási információk az adózási, kereskedelmi és bolti szabályok értelmében az Google Play-ban maradhatnak.
- Az anonimizált vagy összesített adatok az Ön azonosítása nélkül is tárolhatók.

## 9. Biztonság

Ésszerű technikai és szervezési intézkedéseket teszünk az adatok védelme érdekében, beleértve:

- Hitelesítés: Firebase.
- Hozzáférés szabályai az adatbázisban, hogy korlátozzák az adatokat a megfelelő felhasználóra.
- A használt SDK-k és API-k által titkosított kommunikáció.
- Az Android engedélyek csak alkalmazás-erőforrásokhoz kapcsolódóan használhatók.
- Szűrések az értesítések figyelésekor a biztonsági kódok, OTP, jelszavak és hitelesítési üzenetek elkerülése érdekében.
- Hibadiagnosztika a hibák kijavításához és a stabilitás javításához.

Egyetlen rendszer sem 100%-ig biztonságos. Ezenkívül védje meg eszközét, használjon képernyőzárat, őrizzen meg erős jelszót, kerülje fiókja megosztását, és frissítse az alkalmazást, amikor új verzió jelenik meg.

## 10. Az Ön kezelőszervei

A következőket teheti:

- Információk szerkesztése vagy törlése az alkalmazáson belül, ha ez a funkció létezik.
- Tiltsa le a push értesítéseket az Android beállításaiban.
- A hely visszavonása az Android beállításaiban.
- Az értesítésekhez való hozzáférés visszavonása az Android beállításaiban.
- Törölje vagy kezelje az előfizetést a Google Play segítségével.
- Törölje a helyi alkalmazásadatokat, vagy távolítsa el az alkalmazást.
- Kérjen hozzáférést, javítást vagy törlést kapcsolatfelvételi e-mailben.

## 11. Fiók és adatok törlése

Fiók és adatok törlésének kérése:1. Küldjön e-mailt a **george.guimares@gmail.com** címre.
2. Használja a **"Adattörlés - Mentor Financeiro"** vagy a **"LGPD - Mentor Financeiro"** tárgyat.
3. Adja meg a fiók e-mail-címét, a bejelentkezési módot vagy más azonosítót, amely segít megtalálni a profilt.
4. Jelezze, hogy a fiók/felhőadatok teljes törlését vagy bizonyos kategóriák törlését kívánja-e, ha ez technikailag lehetséges.

Az indokolatlan törlés elkerülése érdekében személyazonosság megerősítését kérhetjük.

A következők kizárhatók vagy leválaszthatók, adott esetben:

- Felhasználói profil és dokumentumok a Cloud Firestore-ban.
- Költések, célok, preferenciák, pénzügyi előzmények és beállítások a felhőben mentve.
- Tároláskor a profilhoz társított FCM token.
- Számla a Firebase Authentication-ban, amikor a teljes és technikailag alkalmazható törlést kérik.

Hosszabb ideig maradhatnak:

- Anonimizált vagy összesített adatok.
- A jogszabályok betartásához, a csalás megelőzéséhez, a biztonsághoz vagy a jogok védelméhez szükséges nyilvántartások.
- A Google Play által karbantartott vásárlások, fizetések és előfizetések története.
- A harmadik fél szolgáltatók által közvetlenül feldolgozott adatok az irányelveiknek megfelelően.

Az érvényes kérésekre 30 munkanapon belül igyekszünk válaszolni, kivéve, ha bonyolult, jogi kötelezettség vagy további ellenőrzés szükséges.

## 12. A jogosult jogai

Az alkalmazandó jogszabályoktól függően kérheti:

- A kezelés meglétének megerősítése.
- Hozzáférés az adatokhoz.
- Hiányos, pontatlan vagy elavult adatok javítása.
- A szükségtelen, túlzott vagy nem megfelelő adatok anonimizálása, blokkolása vagy törlése.
- Információ a megosztásról.
- A hozzájárulás visszavonása.
- A hozzájárulás alapján kezelt adatok törlése adott esetben.
- Hordozhatóság, ha szabályozzák és műszakilag lehetséges.
- Adott esetben az automatizált döntések felülvizsgálata.

E jogok gyakorlásához küldjön egy e-mailt a **george.guimares@gmail.com** címre.

## 13. Gyermekek és serdülők

Az alkalmazás nem vonatkozik 13 éven aluli gyermekekre. Ha a törvényes gyám megérti, hogy egy gyermek adott adatokat az alkalmazásnak, vegye fel velünk a kapcsolatot, hogy értékelni tudjuk a törlést.

## 14. A szabályzat változásai

Frissíthetjük ezt az adatvédelmi szabályzatot, hogy tükrözze az alkalmazás, a szolgáltatók, a jogi követelmények vagy az Google Play szabályok változásait. A felül lévő dátum az aktuális verziót jelzi. A vonatkozó változásokat az alkalmazáson belül, a közzétett oldalon vagy más ésszerű módon közölni lehet.

## 15. Kapcsolat

**Jelentkezés:** Mentor Financeiro

**E-mail:** george.guimares@gmail.com

**Az irányelv közzététele:** https://terriblegeorge.github.io/Mentor_Financeiro/

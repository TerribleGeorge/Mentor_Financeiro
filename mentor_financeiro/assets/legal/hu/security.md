# Biztonság - Mentor Financeiro

**Utolsó frissítés:** 2026. május 19

Ez az oldal az Mentor Financeiro biztonsági gyakorlatait magyarázza el egyszerű nyelvezeten. Kiegészíti az Adatvédelmi szabályzatot és a Felhasználási feltételeket.

## 1. Biztonsági kötelezettségvállalás

Az Mentor Financeiro a pénzügyi szervezés segítésére lett kifejlesztve anélkül, hogy közvetlen hozzáférést kérne a bankszámlához, banki jelszó kérése nélkül, és anélkül, hogy bankként, brókerként vagy fizetési módként működne.

Az alkalmazás képes tárolni az Ön által megadott vagy opcionális funkciókkal azonosított pénzügyi adatokat, ezért a biztonságot a termék központi részeként kezeljük.

## 2. Mit nem csinál az alkalmazás

- Nem kér banki jelszót, kártyát vagy digitális pénztárcát.
- Nem fér hozzá a bankszámlájához.
- Nem mozgatja a pénzt.
- Nem végez fizetést, Pixet, átutalást vagy befektetést az Ön nevében.
- Nem kér kártya biztonsági kódot.
- Nem kéri a OTP bankkódot.
- Nem értékesíti az Ön személyes adatait.

## 3. Alkalmazott technikai intézkedések

A használt erőforrástól függően az alkalmazás a következőket használhatja:

- Bejelentkezés Firebase Authentication.
- Cloud Firestore a hitelesített felhasználóhoz tartozó adatokkal.
- Biztonsági szabályok a felhasználó saját adataihoz való hozzáférés korlátozására.
- Az SDK-k és a használt szolgáltatások által titkosított kommunikáció.
- Firebase Crashlytics a műszaki hibák azonosításához és a problémák megoldásához.
- Android engedélyek csak akkor kérhetők, ha az alkalmazás funkcióihoz kapcsolódnak.
- Helyi tárhely a beállítások, a téma, a gyorsítótár és az eszközadatok számára.

## 4. Értesítés figyelése

Az értesítések figyelése nem kötelező, és manuális aktiválást igényel az Android eszközön.

Ha engedélyezve van, az alkalmazás elolvashatja a támogatott értesítéseket, hogy felismerje a kiadásokat, vásárlásokat, fizetéseket, előfizetéseket és átutalásokat. A cél a kézi munka csökkentése a kiadások rögzítésekor.

A kockázatok csökkentése érdekében:

- Az alkalmazás tájékoztatja Önt az engedély okáról, mielőtt a beállításokhoz irányítaná.
- A hozzáférés bármikor visszavonható az Android beállításaiban.
- A szűrő kompatibilis pénzügyi eseményeket keres, nem személyes beszélgetéseket.
- Az alkalmazás megpróbálja figyelmen kívül hagyni az OTP kódokat, jelszavakat, biztonsági kódokat és hitelesítési üzeneteket.
- Az alkalmazás nem használja ezt a funkciót bankok, kártyák vagy digitális pénztárcák eléréséhez.

Ennek ellenére az értesítések érzékeny adatokat tartalmazhatnak. Csak akkor használja ezt a funkciót, ha beleegyezik az ilyen típusú feldolgozásba.

## 5. Érzékeny engedélyek

Az alkalmazás kérheti:

- **Internet:** csatlakozás Firebase, Google Play, API-khoz és online erőforrásokhoz.
- **Értesítések:** riasztások küldése magából az alkalmazásból.
- **Helyszín:** a tartalom hozzáigazítása vagy összehasonlítása az országhoz/régióhoz, ha engedélyezett.
- **Hozzáférés az Android értesítésekhez:** a költségek opcionális azonosítása a kompatibilis értesítésekből.
- **Alkalmazáson belüli vásárlások:** Premium előfizetés Google Play-ig.

Ezeket az engedélyeket az Android beállításaiban szabályozhatja.

## 6. Az Ön része a biztonságban

Az adatok védelme érdekében:

- Használja a képernyőzárat az eszközön.
- Ne ossza meg fiókját.
- Tartsa az alkalmazást és az Android frissítést.
- Visszavonja azokat az engedélyeket, amelyeket már nem szeretne használni.
- Döntéshozatal előtt ellenőrizze az automatikusan azonosított tranzakciókat.
- Ne regisztráljon az alkalmazásban olyan információkat, amelyeket nem szeretne megtartani.
- Törölje le az előfizetéseket közvetlenül a Google Play címen, ha nem kívánja megújítani.

## 7. Korlátozások

Egyetlen alkalmazás, szerver, operációs rendszer vagy felhőszolgáltatás sem 100%-ban biztonságos. Az elfogadott intézkedések ellenére előfordulhatnak hibák, elérhetetlenség, szinkronizálási hibák, hozzáférés elvesztése, harmadik féltől származó problémák vagy külső visszaélési kísérletek.

Az Mentor Financeiro a kockázatok ésszerű csökkentésére törekszik, de Önnek meg kell őriznie a lényeges pénzügyi információk másolatait vagy saját vezérlőelemeit.

## 8. Incidensek és kapcsolatfelvétel

Ha furcsa viselkedést, helytelen hozzáférést, hibás adatokat, feltételezett biztonsági rést vagy érzékeny engedélyekkel kapcsolatos problémát észlel, forduljon:

**george.guimares@gmail.com**

Lehetőség szerint tartalmazza:

- Készülék modell.
- A Android verziója.
- App verzió.
- A probléma leírása.
- Képernyőképek jelszavak, kódok vagy túl sok adat felfedése nélkül.

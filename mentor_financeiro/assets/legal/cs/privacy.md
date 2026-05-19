# Zásady ochrany osobních údajů – Mentor Financeiro

**Poslední aktualizace:** 19. května 2026

**Aplikace:** Mentor Financeiro

**Balík Android:** `com.georgeguimares.mentorfinanceiro`

**Zásady zveřejněny dne:** https://terriblegeorge.github.io/Mentor_Financeiro/

Tyto zásady ochrany osobních údajů jasně vysvětlují, k jakým údajům může Mentor Financeiro přistupovat, shromažďovat je, používat, ukládat, sdílet a chránit. Je napsán tak, aby odrážel aktuální provoz aplikace a měl by být čten ve spojení se stránkou Podmínky použití a zabezpečení.

Mentor Financeiro je aplikace pro finanční organizaci, finanční vzdělávání, cíle, záznamy o výdajích, grafy, zprávy, investiční obsah a volitelné funkce předplatného Premium. Aplikace není banka, makléř, finanční instituce, registrovaný investiční poradce, pojišťovna ani platební metoda.

## 1. Kdo je zodpovědný

Mentor Financeiro nabízí vývojář odpovědný za publikování aplikace na Google Play.

Chcete-li uplatnit práva související s vašimi údaji, položit otázky nebo požádat o vymazání, kontaktujte nás e-mailem:

**george.guimares@gmail.com**

## 2. Shrnutí v jednoduchém jazyce

- Aplikace vám pomůže organizovat výdaje, cíle, limity, finanční historii, investice a vzdělávací obsah.
- Chcete-li používat určité funkce, můžete se přihlásit pomocí e-mailu/hesla, účtu Google, účtu Apple nebo režimu inkognito prostřednictvím Firebase Authentication.
- Vámi poskytnuté finanční údaje, jako jsou výdaje, cíle, limity, profil a preference, lze uložit do Firebase/Cloud Firestore pro synchronizaci a provoz účtu.
- Aplikace využívá služby Google/Firebase pro přihlášení, databázi, push notifikace, analýzu a diagnostiku chyb.
- Aplikace může k zobrazování reklam používat Google AdMob.
- Premium zpracovává Google Play Billing v rámci samotné aplikace.
- Umístění je nepovinné a používá se pouze v případě, že jej povolíte, například k přizpůsobení srovnání investic zemi nebo místnímu kontextu.
- Funkce sledování upozornění je volitelná. Pokud povolíte přístup k oznámením na Android, aplikace může číst název a text podporovaných oznámení, aby identifikovala nákupy, platby a převody a převedla je na finanční záznamy. Aplikace nemá přístup k vašemu bankovnímu účtu a nepožaduje heslo.
- Obrázky, které si vyberete pro personalizaci, mohou být uloženy lokálně v zařízení.
- Můžete požádat o vymazání účtu a dat prostřednictvím e-mailu uvedeného v těchto zásadách.

## 3. Údaje, které můžeme zpracovávat

V závislosti na tom, jak aplikaci používáte, můžeme zpracovávat následující kategorie údajů.

### 3.1 Účet a identifikační údaje

- Jméno uvedené v registraci.
- E-mail.
- Firebase (UID) identifikátor uživatele.
- Použitý způsob přihlášení.
- Profilová fotka, pokud ji poskytne poskytovatel přihlášení.
- Premium stav předplatného přidružený k profilu.
- Technická data nezbytná k udržení relace a synchronizaci informací.

### 3.2 Vámi zadané finanční údaje

- Náklady, výdaje, příjmy, kategorie, finanční historie a transakce.
- Cíle, limity, plánování, finanční sny a preference.
- Informace používané v grafech, zprávách, analýzách a automatickém mentoringu v rámci aplikace.
- Profil investora, cíle a odpovědi poskytnuté v dotaznících nebo plánovacích obrazovkách.

Tyto údaje mohou být v praktickém smyslu citlivé, protože odhalují aspekty vašeho finančního života. Proto byste měli v aplikaci registrovat pouze informace, které chcete zachovat.

### 3.3 Údaje o předplatném a nákupu

- Zakoupený produkt, stav předplatného, období, obnovení, obnovení nákupu a technické identifikátory potřebné k potvrzení Premium.
- Nákupy, zrušení, obnovení, vrácení peněz a poplatky zpracovává Google Play v souladu s pravidly účtu a obchodu Google.

Aplikace neshromažďuje ani neukládá čísla karet, bezpečnostní kódy karet ani údaje o bankovních platbách.

### 3.4 Údaje o využití, diagnostice a výkonu- Události použití a interakce v aplikaci, například zobrazené obrazovky, použité zdroje a dokončené toky.
- Souhrnná nebo technická data pro pochopení stability produktu, výkonu a zlepšení.
- Hlášení poruch a diagnostika od Firebase Crashlytics, pokud je to možné, včetně technických informací o zařízení, verze aplikace, operačního systému, protokolů chyb a identifikátoru uživatele, pokud je nakonfigurován.

### 3.5 Data oznámení push

Pokud povolíte oznámení z aplikace, můžeme zpracovat:

- Firebase Cloud Messaging token (FCM).
- Předvolby související s přijímáním oznámení.
- Témata nebo segmenty nezbytné pro odesílání komunikace ze samotné aplikace.

V nastavení Android můžete určit, zda jsou oznámení povolena.

### 3.6 Data oznámení načtená v Android

Sledování oznámení je volitelná funkce. Funguje pouze v případě, že ručně povolíte přístup k oznámení v nastavení Android.

Když je tato možnost povolena, může aplikace přijímat název, text, název balíčku zdrojové aplikace, čas a technická metadata z oznámení zobrazených na vašem zařízení. Cílem je identifikovat oznámení kompatibilní s výdaji, nákupy, platbami, předplatnými a převody za účelem generování finančních záznamů.

Důležitá opatření této funkce:

- Aplikace nemá přístup k vašemu bankovnímu účtu.
- Aplikace se nepřihlašuje do bank, karet nebo digitálních peněženek.
- Aplikace nepožaduje heslo banky.
- Aplikace používá filtry, aby se zabránilo zachycení bezpečnostních kódů, OTP, hesel a ověřovacích zpráv.
- Zaměřením filtru je identifikovat kompatibilní nákupy, platby, odeslané převody a finanční pohyby.
- Funkci můžete v aplikaci zakázat nebo zrušit oprávnění v nastavení Android.

I přes filtry mohou oznámení obsahovat citlivé informace. Tuto funkci povolte pouze v případě, že rozumíte tomuto typu zpracování a souhlasíte s ním.

### 3.7 Umístění

Aplikace může požadovat přibližnou nebo přesnou polohu podle povolení uděleného Android, aby přizpůsobila srovnání, obsah nebo investiční kontext dané zemi/oblasti.

Umístění není vyžadováno pro všechny funkce. Pokud povolení odepřete, některá srovnání nebo přizpůsobení mohou být omezena.

### 3.8 Místní obrázky a soubory

Když si vyberete obrázek pro vizuální přizpůsobení aplikace, může být uložen lokálně v zařízení. Pokud nebudou v budoucnu specificky implementovány, nebudou tyto personalizační obrázky odesílány na naše servery.

### 3.9 Reklama

Aplikace může zobrazovat reklamy prostřednictvím Google AdMob. Google může zpracovávat identifikátory zařízení, údaje o používání, technické informace a reklamní signály v souladu s vlastními zásadami společnosti Google a nastavením reklam uživatele.

### 3.10 Data z externích tržních API

Aplikace může konzultovat externí API pro směnné kurzy, kotace, indexy nebo informace o trhu. Tyto dotazy obvykle zahrnují parametry, jako je hledaná měna, aktivum, země nebo symbol. K získání těchto informací není nutné zasílat vaše registrované osobní finanční údaje.

## 4. K čemu data používáme

Údaje používáme k:

- Vytvořte a udržujte svůj účet.
- Synchronizujte výdaje, cíle, preference, historii a nastavení.
- Zobrazte řídicí panely, grafy, zprávy, limity a personalizovaný obsah.
- Povolit nákupy, obnovení a ověření Premium.
- Odesílat upozornění ze samotné aplikace, pokud je to povoleno.
- Zpracovávat podporovaná finanční oznámení, pokud tuto funkci povolíte.
- Když je lokalizace povolena, přizpůsobte investiční obsah místnímu kontextu.
- Zlepšení stability, výkonu, zabezpečení a aplikačního zážitku.
- Dodržujte zákonné povinnosti, reagujte na žádosti a zabraňte zneužití.
- Zobrazujte reklamy tam, kde je to možné.

## 5. Právní základy

Když se použije LGPD, zpracování se může opírat o jeden nebo více právních základů, včetně:- Uskutečnění smlouvy nebo předběžných postupů pro dodání aplikačních zdrojů.
- Souhlas pro volitelná oprávnění, jako je poloha, oznámení push a přístup k oznámením Android.
- Oprávněný zájem o bezpečnost, diagnostiku, zlepšování produktů, prevenci zneužívání a proporcionální statistiky.
- V případě potřeby dodržování zákonných nebo regulačních povinností.
- Pravidelný výkon práv ve správním, soudním nebo mimosoudním řízení.

Volitelné souhlasy můžete odvolat v nastavení aplikace nebo operačního systému, ale může to omezit funkčnost.

## 6. Sdílení s třetími stranami

Vaše osobní údaje neprodáváme.

Můžeme sdílet nebo povolit zpracování údajů poskytovateli nezbytnými pro provoz aplikace, včetně:

- **Google Firebase**: Firebase Authentication, Cloud Firestore, Firebase Cloud Messaging, Firebase Analytics a Firebase Crashlytics.
- **Přihlášení přes Google / Přihlášení přes Apple**: přihlaste se prostřednictvím účtu třetí strany, pokud si to zvolíte.
- **Google Play Billing**: zpracování předplatných, nákupů, zrušení, obnovení a stavu Premium.
- **Google AdMob**: zobrazování a měření reklam.
- **Tržní, devizové nebo kotační API**: konzultace veřejných nebo tržních finančních informací používaných v aplikaci.
- **Android systémové služby**: oprávnění, upozornění a prostředky zařízení.

Tyto třetí strany mohou zpracovávat údaje v souladu se svými vlastními podmínkami, zásadami a nastavením.

## 7. Mezinárodní převod

Služby jako Firebase, Google Play, AdMob a další poskytovatelé mohou zpracovávat data na serverech umístěných mimo Brazílii. Používáním aplikace berete na vědomí, že k tomuto mezinárodnímu zpracování může dojít v souladu s platnými pravidly ochrany údajů a podmínkami poskytovatelů.

## 8. Udržení

Údaje uchováváme tak dlouho, jak je to nutné k doručení aplikace, splnění účelů popsaných v těchto zásadách, dodržování zákonných povinností, řešení sporů, zabránění podvodům a zachování bezpečnosti.

Obecně:

- Údaje o účtu a finanční údaje v cloudu zůstávají, dokud účet existuje nebo dokud není platný požadavek na smazání.
- Místní data mohou v zařízení zůstat, dokud aplikaci nevymažete, nevymažete nebo neodinstalujete.
- Diagnostická data, analýzy a protokoly mohou být uchovávány po dobu definovanou poskytovateli.
- Informace o nákupu mohou zůstat v Google Play podle daňových, obchodních a obchodních pravidel.
- Anonymizovaná nebo agregovaná data mohou být uchovávána bez vaší identifikace.

## 9. Bezpečnost

Přijímáme přiměřená technická a organizační opatření k ochraně údajů, včetně:

- Ověření pomocí Firebase.
- Pravidla přístupu v databázi pro omezení dat na příslušného uživatele.
- Komunikace je šifrována použitými sadami SDK a API.
- Použití oprávnění Android pouze v souvislosti se zdroji aplikace.
- Filtry při sledování oznámení, aby se zabránilo bezpečnostním kódům, OTP, heslům a ověřovacím zprávám.
- Diagnostika chyb pro opravu chyb a zlepšení stability.

Žádný systém není 100% bezpečný. Měli byste také chránit své zařízení, používat zámek obrazovky, udržovat silné heslo, nesdílet svůj účet a aktualizovat aplikaci, když je vydána nová verze.

## 10. Vaše ovládání

Můžete:

- Upravte nebo odstraňte informace v aplikaci, pokud tato funkce existuje.
- Zakažte oznámení push v nastavení Android.
- Zrušit umístění v nastavení Android.
- Zrušit přístup k oznámením v nastavení Android.
- Zrušte nebo spravujte předplatné prostřednictvím Google Play.
- Vymažte data místní aplikace nebo aplikaci odinstalujte.
- Žádost o přístup, opravu nebo smazání prostřednictvím kontaktního e-mailu.

## 11. Smazání účtu a dat

Chcete-li požádat o smazání účtu a dat:1. Pošlete e-mail na adresu **george.guimares@gmail.com**.
2. Použijte předmět **"Smazání dat - Mentor Financeiro"** nebo **"LGPD - Mentor Financeiro"**.
3. Zadejte e-mail účtu, způsob přihlášení nebo jiný identifikátor, který pomůže najít profil.
4. Uveďte, zda chcete úplné smazání dat účtu/cloudu nebo odstranění konkrétních kategorií, je-li to technicky možné.

Můžeme požádat o potvrzení identity, abychom se vyhnuli nepatřičnému smazání.

Následující položky mohou být podle potřeby vyloučeny nebo odpojeny:

- Uživatelský profil a dokumenty v Cloud Firestore.
- Výdaje, cíle, preference, finanční historie a nastavení uložené v cloudu.
- FCM token přidružený k profilu, když je uložen.
- Účet v Firebase Authentication, pokud je požadováno úplné a technicky použitelné vymazání.

Mohou zůstat déle:

- Anonymizovaná nebo agregovaná data.
- Záznamy nezbytné pro dodržování právních předpisů, prevenci podvodů, zabezpečení nebo obranu práv.
- Historie nákupů, plateb a předplatných spravovaná Google Play.
- Údaje zpracovávané přímo poskytovateli třetích stran v souladu s jejich zásadami.

Budeme se snažit odpovědět na platné žádosti do 30 pracovních dnů, pokud to nebude složité, právní povinnost nebo potřeba dodatečného ověření.

## 12. Práva držitele

V souladu s platnými zákony můžete požádat:

- Potvrzení o existenci léčby.
- Přístup k datům.
- Oprava neúplných, nepřesných nebo zastaralých údajů.
- Anonymizace, blokování nebo mazání nepotřebných, nadměrných nebo nevyhovujících údajů.
- Informace o sdílení.
- Odvolání souhlasu.
- Případné vymazání údajů zpracovávaných na základě souhlasu.
- Přenositelnost, je-li regulována a technicky možná.
- Přezkoumání automatizovaných rozhodnutí, je-li to vhodné.

Chcete-li tato práva uplatnit, zašlete e-mail na adresu **george.guimares@gmail.com**.

## 13. Děti a dospívající

Aplikace není zaměřena na děti do 13 let. Pokud zákonný zástupce pochopí, že dítě do aplikace poskytlo data, měl by nás kontaktovat, abychom mohli smazání vyhodnotit.

## 14. Změny těchto zásad

Tyto zásady ochrany osobních údajů můžeme aktualizovat, aby odrážely změny aplikace, poskytovatelů, právních požadavků nebo pravidel Google Play. Datum v horní části označuje aktuální verzi. Relevantní změny mohou být sděleny v rámci aplikace, na publikované stránce nebo jinými přiměřenými prostředky.

## 15. Kontakt

**Aplikace:** Mentor Financeiro

**E-mail:** george.guimares@gmail.com

**Zásady zveřejněny dne:** https://terriblegeorge.github.io/Mentor_Financeiro/

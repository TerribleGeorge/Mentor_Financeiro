# Zásady ochrany osobných údajov – Mentor Financeiro

**Posledná aktualizácia:** 19. mája 2026

**Aplikácia:** Mentor Financeiro

**Balík Android:** `com.georgeguimares.mentorfinanceiro`

**Pravidlá zverejnené dňa:** https://terriblegeorge.github.io/Mentor_Financeiro/

Tieto zásady ochrany osobných údajov jasne vysvetľujú, ku ktorým údajom môže Mentor Financeiro pristupovať, zhromažďovať ich, používať, ukladať, zdieľať a chrániť. Je napísaný tak, aby odrážal aktuálnu prevádzku aplikácie a mal by sa čítať v spojení so stránkou Podmienky používania a Zabezpečenie.

Mentor Financeiro je aplikácia pre finančnú organizáciu, finančné vzdelávanie, ciele, záznamy o výdavkoch, grafy, správy, investičný obsah a voliteľné funkcie predplatného Premium. Aplikácia nie je banka, maklér, finančná inštitúcia, registrovaný investičný poradca, poisťovňa ani spôsob platby.

## 1. Kto je zodpovedný

Mentor Financeiro ponúka vývojár zodpovedný za publikovanie aplikácie na Google Play.

Ak chcete uplatniť práva súvisiace s vašimi údajmi, položiť otázky alebo požiadať o vymazanie, kontaktujte nás e-mailom:

**george.guimares@gmail.com**

## 2. Zhrnutie v jednoduchom jazyku

- Aplikácia vám pomáha organizovať výdavky, ciele, limity, finančnú históriu, investície a vzdelávací obsah.
- Ak chcete používať určité funkcie, môžete sa prihlásiť pomocou e-mailu/hesla, účtu Google, účtu Apple alebo režimu inkognito prostredníctvom Firebase Authentication.
- Finančné údaje, ktoré poskytnete, ako sú výdavky, ciele, limity, profil a preferencie, možno uložiť do Firebase/Cloud Firestore na synchronizáciu a prevádzku účtu.
- Aplikácia využíva služby Google/Firebase na prihlásenie, databázu, upozornenia push, analýzu a diagnostiku porúch.
- Aplikácia môže na zobrazovanie reklám používať Google AdMob.
- Premium spracováva Google Play Billing v samotnej aplikácii.
- Poloha je voliteľná a používa sa iba vtedy, keď ju povolíte, napríklad na prispôsobenie porovnania investícií krajine alebo miestnemu kontextu.
- Funkcia monitorovania upozornení je voliteľná. Ak povolíte prístup k upozorneniam na Android, aplikácia môže čítať názov a text podporovaných upozornení, aby identifikovala nákupy, platby a prevody a previedla ich na finančné záznamy. Aplikácia nemá prístup k vášmu bankovému účtu a nepožaduje heslo.
- Obrázky, ktoré ste si vybrali na prispôsobenie, môžu byť uložené lokálne v zariadení.
- Môžete požiadať o vymazanie účtu a údajov prostredníctvom e-mailu uvedeného v týchto zásadách.

## 3. Údaje, ktoré môžeme spracovávať

V závislosti od toho, ako aplikáciu používate, môžeme spracovávať nasledujúce kategórie údajov.

### 3.1 Účet a identifikačné údaje

- Meno uvedené v registrácii.
- E-mail.
- identifikátor používateľa Firebase (UID).
- Použitý spôsob prihlásenia.
- Profilová fotografia, ak ju poskytne poskytovateľ prihlásenia.
- Stav predplatného Premium priradený k profilu.
- Technické údaje potrebné na udržiavanie relácie a synchronizáciu informácií.

### 3.2 Vami zadané finančné údaje

- Výdavky, výdavky, príjmy, kategórie, finančná história a transakcie.
- Ciele, limity, plánovanie, finančné sny a preferencie.
- Informácie používané v grafoch, správach, analýzach a automatickom mentoringu v rámci aplikácie.
- Profil investora, ciele a odpovede poskytnuté v dotazníkoch alebo plánovacích obrazovkách.

Tieto údaje môžu byť v praktickom zmysle citlivé, pretože odhaľujú aspekty vášho finančného života. V aplikácii by ste preto mali registrovať len tie informácie, ktoré chcete ponechať.

### 3.3 Údaje o predplatnom a nákupe

- Zakúpený produkt, stav predplatného, obdobie, obnovenie, obnovenie nákupu a technické identifikátory potrebné na potvrdenie Premium.
- Nákupy, zrušenie, obnovenie, vrátenie peňazí a poplatky spracováva Google Play v súlade s pravidlami účtu a obchodu Google.

Aplikácia nezhromažďuje ani neukladá čísla kariet, bezpečnostné kódy kariet ani bankové platobné údaje.

### 3.4 Údaje o používaní, diagnostike a výkone- Udalosti používania a interakcie v aplikácii, napríklad zobrazené obrazovky, použité zdroje a dokončené toky.
- Súhrnné alebo technické údaje na pochopenie stability produktu, výkonu a zlepšenia.
- Hlásenia chýb a diagnostika podľa Firebase Crashlytics, ak je to možné, vrátane technických informácií o zariadení, verzie aplikácie, operačného systému, protokolov chýb a identifikátora používateľa, ak je nakonfigurovaný.

### 3.5 Údaje upozornení push

Ak povolíte upozornenia z aplikácie, môžeme spracovať:

- Firebase Cloud Messaging token (FCM).
- Predvoľby súvisiace s prijímaním upozornení.
- Témy alebo segmenty potrebné na odosielanie komunikácie zo samotnej aplikácie.

V nastaveniach Android môžete ovládať, či sú upozornenia povolené.

### 3.6 Údaje upozornení načítané v Android

Monitorovanie upozornení je voliteľná funkcia. Funguje to iba vtedy, ak manuálne povolíte prístup k upozorneniam v nastaveniach Android.

Keď je táto možnosť povolená, aplikácia môže prijímať názov, text, názov balíka zdrojovej aplikácie, čas a technické metadáta z upozornení zobrazených na vašom zariadení. Cieľom je identifikovať oznámenia kompatibilné s výdavkami, nákupmi, platbami, predplatnými a prevodmi na generovanie finančných záznamov.

Dôležité opatrenia tejto funkcie:

- Aplikácia nemá prístup k vášmu bankovému účtu.
- Aplikácia sa neprihlasuje do bánk, kariet alebo digitálnych peňaženiek.
- Aplikácia nepožaduje bankové heslo.
- Aplikácia používa filtre, aby sa zabránilo zachytávaniu bezpečnostných kódov, OTP, hesiel a overovacích správ.
- Cieľom filtra je identifikovať kompatibilné nákupy, platby, odoslané prevody a finančné pohyby.
- Funkciu môžete zakázať v aplikácii alebo odvolať povolenie v nastaveniach Android.

Aj s filtrami môžu upozornenia obsahovať citlivé informácie. Túto funkciu povoľte iba vtedy, ak rozumiete a akceptujete tento typ spracovania.

### 3.7 Umiestnenie

Aplikácia môže požadovať približnú alebo presnú polohu v súlade s povolením udeleným Android, aby prispôsobila porovnania, obsah alebo investičný kontext krajine/regiónu.

Umiestnenie nie je potrebné pre všetky funkcie. Ak povolenie odmietnete, niektoré porovnania alebo prispôsobenia môžu byť obmedzené.

### 3.8 Miestne obrázky a súbory

Keď si vyberiete obrázok na vizuálne prispôsobenie aplikácie, môže byť uložený lokálne v zariadení. Pokiaľ nebudú v budúcnosti špecificky implementované, tieto prispôsobené obrázky sa nebudú odosielať na naše servery.

### 3.9 Reklama

Aplikácia môže zobrazovať reklamy prostredníctvom Google AdMob. Google môže spracovávať identifikátory zariadení, údaje o používaní, technické informácie a reklamné signály v súlade s vlastnými pravidlami spoločnosti Google a nastaveniami reklamy používateľa.

### 3.10 Údaje z externých trhových API

Aplikácia môže konzultovať s externými API výmenné kurzy, kotácie, indexy alebo informácie o trhu. Tieto dopyty zvyčajne zahŕňajú parametre, ako je mena, aktívum, krajina alebo symbol, ktoré sa hľadajú. Na získanie týchto informácií nie je potrebné posielať vaše registrované osobné finančné údaje.

## 4. Na čo údaje používame

Údaje používame na:

- Vytvorte a spravujte svoj účet.
- Synchronizujte výdavky, ciele, preferencie, históriu a nastavenia.
- Zobrazenie informačných panelov, grafov, správ, limitov a prispôsobeného obsahu.
- Povoliť nákupy, obnovenie a overenie Premium.
- Ak je to povolené, posielajte upozornenia zo samotnej aplikácie.
- Ak povolíte túto funkciu, spracujte podporované finančné oznámenia.
- Ak je lokalizácia povolená, prispôsobte investičný obsah miestnemu kontextu.
- Zlepšite stabilitu, výkon, bezpečnosť a skúsenosti s aplikáciami.
- Dodržiavať zákonné povinnosti, reagovať na žiadosti a predchádzať zneužívaniu.
- V prípade potreby zobrazujte reklamy.

## 5. Právne základy

Keď sa uplatňuje LGPD, spracovanie môže vychádzať z jedného alebo viacerých právnych základov vrátane:- Vykonávanie zmlúv alebo predbežných postupov na dodanie zdrojov aplikácie.
- Súhlas s voliteľnými povoleniami, ako je poloha, upozornenia push a prístup k upozorneniam Android.
- Oprávnený záujem o bezpečnosť, diagnostiku, zlepšovanie produktov, prevenciu zneužívania a proporcionálne štatistiky.
- Súlad s právnymi alebo regulačnými povinnosťami, ak je to potrebné.
- Pravidelný výkon práv v správnom, súdnom alebo mimosúdnom konaní.

Voliteľné súhlasy môžete odvolať v nastaveniach aplikácie alebo operačného systému, čo však môže obmedziť funkčnosť.

## 6. Zdieľanie s tretími stranami

Vaše osobné údaje nepredávame.

Môžeme zdieľať alebo povoliť spracovanie údajov poskytovateľom nevyhnutným na prevádzku aplikácie, vrátane:

- **Google Firebase**: Firebase Authentication, Cloud Firestore, Firebase Cloud Messaging, Firebase Analytics a Firebase Crashlytics.
- **Prihlásenie cez Google / Prihlásenie cez Apple**: ak si to zvolíte, prihláste sa prostredníctvom účtu tretej strany.
- **Google Play Billing**: spracovanie predplatného, ​​nákupov, zrušení, obnovenia a stavu Premium.
- **Google AdMob**: zobrazovanie a meranie reklám.
- ** Trhové, devízové ​​alebo kotačné API**: konzultácia verejných alebo trhových finančných informácií používaných v aplikácii.
- **Android systémové služby**: povolenia, upozornenia a prostriedky zariadenia.

Tieto tretie strany môžu spracovávať údaje v súlade s ich vlastnými podmienkami, zásadami a nastaveniami.

## 7. Medzinárodný transfer

Služby ako Firebase, Google Play, AdMob a ďalší poskytovatelia môžu spracovávať údaje na serveroch umiestnených mimo Brazílie. Používaním aplikácie beriete na vedomie, že k tomuto medzinárodnému spracovaniu môže dôjsť v súlade s platnými pravidlami ochrany údajov a podmienkami poskytovateľov.

## 8. Zadržanie

Údaje uchovávame tak dlho, ako je potrebné na doručenie aplikácie, splnenie účelov popísaných v týchto zásadách, dodržiavanie zákonných povinností, riešenie sporov, predchádzanie podvodom a zachovanie bezpečnosti.

Vo všeobecnosti:

- Údaje o účte a finančné údaje v cloude zostávajú, kým účet existuje alebo kým nebude platná žiadosť o odstránenie.
- Miestne údaje môžu zostať v zariadení, kým nevymažete, nevymažete údaje aplikácie alebo neodinštalujete aplikáciu.
- Diagnostické údaje, analýzy a protokoly môžu byť uchovávané počas období definovaných poskytovateľmi.
- Informácie o nákupe môžu zostať v Google Play podľa daňových, obchodných a obchodných pravidiel.
- Anonymizované alebo agregované údaje môžu byť uchovávané bez vašej identifikácie.

## 9. Bezpečnosť

Prijímame primerané technické a organizačné opatrenia na ochranu údajov vrátane:

- Overenie Firebase.
- Pravidlá prístupu v databáze na obmedzenie údajov na príslušného používateľa.
- Komunikácia je šifrovaná pomocou súprav SDK a použitých rozhraní API.
- Povolenia Android používajte iba vtedy, keď súvisia so zdrojmi aplikácie.
- Filtre pri monitorovaní upozornení, aby sa vyhli bezpečnostným kódom, OTP, heslám a overovacím správam.
- Diagnostika chýb na opravu chýb a zlepšenie stability.

Žiadny systém nie je 100% bezpečný. Mali by ste tiež chrániť svoje zariadenie, používať zámok obrazovky, udržiavať silné heslo, vyhýbať sa zdieľaniu svojho účtu a aktualizovať aplikáciu, keď bude vydaná nová verzia.

## 10. Vaše ovládacie prvky

Môžete:

- Upravte alebo odstráňte informácie v aplikácii, ak táto funkcia existuje.
- Zakázať upozornenia push v nastaveniach Android.
- Zrušte umiestnenie v nastaveniach Android.
- Zrušte prístup k upozorneniam v nastaveniach Android.
- Zrušte alebo spravujte predplatné prostredníctvom Google Play.
- Vymažte údaje miestnej aplikácie alebo odinštalujte aplikáciu.
- Požiadať o prístup, opravu alebo vymazanie prostredníctvom kontaktného e-mailu.

## 11. Vymazanie účtu a údajov

Ak chcete požiadať o vymazanie účtu a údajov:1. Pošlite e-mail na adresu **george.guimares@gmail.com**.
2. Použite predmet **"Vymazanie údajov - Mentor Financeiro"** alebo **"LGPD - Mentor Financeiro"**.
3. Zadajte e-mail účtu, spôsob prihlásenia alebo iný identifikátor, ktorý pomôže nájsť profil.
4. Uveďte, či chcete úplné vymazanie údajov účtu/cloudu alebo vymazanie špecifických kategórií, ak je to technicky možné.

Môžeme požiadať o potvrdenie totožnosti, aby sme predišli zbytočnému vymazaniu.

Nasledujúce položky môžu byť podľa potreby vylúčené alebo odpojené:

- Používateľský profil a dokumenty v Cloud Firestore.
- Výdavky, ciele, preferencie, finančná história a nastavenia uložené v cloude.
- FCM token priradený k profilu, keď je uložený.
- Účet v Firebase Authentication, ak sa požaduje úplné a technicky použiteľné vymazanie.

Môžu zostať dlhšie:

- Anonymizované alebo agregované údaje.
- Záznamy potrebné na dodržiavanie právnych predpisov, predchádzanie podvodom, bezpečnosť alebo ochranu práv.
- História nákupov, platieb a predplatného udržiavaná Google Play.
- Údaje spracovávané priamo poskytovateľmi tretích strán v súlade s ich zásadami.

Budeme sa snažiť odpovedať na platné žiadosti do 30 pracovných dní, pokiaľ to nebude zložité, zákonná povinnosť alebo potreba dodatočného overenia.

## 12. Práva držiteľa

V súlade s platnými zákonmi môžete požiadať:

- Potvrdenie o existencii liečby.
- Prístup k údajom.
- Oprava neúplných, nepresných alebo neaktuálnych údajov.
- Anonymizácia, blokovanie alebo vymazanie nepotrebných, nadmerných alebo nevyhovujúcich údajov.
- Informácie o zdieľaní.
- Odvolanie súhlasu.
- V prípade potreby vymazanie údajov spracúvaných na základe súhlasu.
- Prenosnosť, ak je regulovaná a technicky možná.
- V prípade potreby preskúmanie automatizovaných rozhodnutí.

Na uplatnenie týchto práv pošlite e-mail na adresu **george.guimares@gmail.com**.

## 13. Deti a dospievajúci

Aplikácia nie je zameraná na deti do 13 rokov. Ak zákonný zástupca pochopí, že údaje do aplikácie poskytlo dieťa, mal by nás kontaktovať, aby sme mohli vyhodnotiť vymazanie.

## 14. Zmeny v týchto zásadách

Tieto Zásady ochrany osobných údajov môžeme aktualizovať, aby odrážali zmeny aplikácie, poskytovateľov, právnych požiadaviek alebo pravidiel Google Play. Dátum v hornej časti označuje aktuálnu verziu. Relevantné zmeny môžu byť oznámené v rámci aplikácie, na zverejnenej stránke alebo inými primeranými prostriedkami.

## 15. Kontakt

**Aplikácia:** Mentor Financeiro

**E-mail:** george.guimares@gmail.com

**Pravidlá zverejnené dňa:** https://terriblegeorge.github.io/Mentor_Financeiro/

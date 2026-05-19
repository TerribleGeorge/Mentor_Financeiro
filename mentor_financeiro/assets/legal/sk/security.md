# Bezpečnosť - Mentor Financeiro

**Posledná aktualizácia:** 19. mája 2026

Táto stránka vysvetľuje postupy zabezpečenia Mentor Financeiro jednoduchým jazykom. Dopĺňa Zásady ochrany osobných údajov a Podmienky používania.

## 1. Bezpečnostný záväzok

Mentor Financeiro bol vyvinutý na pomoc s finančnou organizáciou bez žiadania o priamy prístup k bankovému účtu, bez vyžiadania bankového hesla a bez fungovania ako banka, maklér alebo platobná metóda.

Aplikácia môže ukladať finančné údaje, ktoré ste zadali alebo identifikovali voliteľnými funkciami, a preto považujeme bezpečnosť za ústrednú súčasť produktu.

## 2. Čo aplikácia nerobí

- Nevyžaduje bankové heslo, kartu alebo digitálnu peňaženku.
- Nemá prístup k vášmu bankovému účtu.
- Nehýbe peniazmi.
- Neuskutočňuje platby, Pix, prevody ani investície vo vašom mene.
- Nevyžaduje bezpečnostný kód karty.
- Nevyžaduje kód banky OTP.
- Nepredáva vaše osobné údaje.

## 3. Použité technické opatrenia

V závislosti od použitého zdroja môže aplikácia použiť:

- Prihláste sa pomocou Firebase Authentication.
- Cloud Firestore s údajmi spojenými s overeným používateľom.
- Bezpečnostné pravidlá na obmedzenie prístupu k vlastným údajom používateľa.
- Komunikácia je šifrovaná pomocou súprav SDK a používaných služieb.
- Firebase Crashlytics na identifikáciu technických porúch a opravu problémov.
- Povolenia Android sa vyžadujú iba v súvislosti s funkciami aplikácie.
- Miestne úložisko pre preferencie, tému, vyrovnávaciu pamäť a údaje o zariadení.

## 4. Monitorovanie upozornení

Monitorovanie upozornení je voliteľné a vyžaduje manuálnu aktiváciu na Android.

Keď je táto možnosť povolená, aplikácia môže čítať podporované upozornenia, aby rozpoznala výdavky, nákupy, platby, predplatné a prevody. Cieľom je znížiť manuálnu prácu pri evidencii výdavkov.

Na zníženie rizík:

- Aplikácia vás informuje o dôvode povolenia predtým, ako vás presmeruje na nastavenia.
- Prístup je možné kedykoľvek odvolať v nastaveniach Android.
- Filter vyhľadáva kompatibilné finančné udalosti, nie osobné rozhovory.
- Aplikácia sa pokúša ignorovať OTP kódy, heslá, bezpečnostné kódy a overovacie správy.
- Aplikácia túto funkciu nepoužíva na prístup k bankám, kartám alebo digitálnym peňaženkám.

Napriek tomu môžu oznámenia obsahovať citlivé údaje. Túto funkciu používajte iba vtedy, ak súhlasíte s týmto typom spracovania.

## 5. Citlivé povolenia

Aplikácia môže požadovať:

- **Internet:** pripojenie k Firebase, Google Play, rozhraniam API a online zdrojom.
- **Upozornenia:** odosielanie upozornení zo samotnej aplikácie.
- **Umiestnenie:** prispôsobenie obsahu alebo porovnania krajine/regiónu, ak je to povolené.
- **Prístup k oznámeniam Android:** voliteľná identifikácia výdavkov z kompatibilných oznámení.
- **Nákupy v aplikácii:** Predplatné Premium od Google Play.

Tieto povolenia ovládate v nastaveniach Android.

## 6. Váš podiel na bezpečnosti

Ak chcete chrániť svoje údaje:

- Použite zámok obrazovky na zariadení.
- Nezdieľajte svoj účet.
- Udržujte aplikáciu a Android aktualizované.
- Zrušte povolenia, ktoré už nechcete používať.
- Pred prijatím rozhodnutí skontrolujte automaticky identifikované transakcie.
- Neregistrujte informácie, ktoré nechcete v aplikácii uchovávať.
- Zrušte predplatné priamo na Google Play, ak nechcete obnoviť.

## 7. Obmedzenia

Žiadna aplikácia, server, operačný systém alebo cloudová služba nie je 100% bezpečná. Napriek prijatým opatreniam môže dôjsť k poruchám, nedostupnosti, chybám synchronizácie, strate prístupu, problémom tretích strán alebo externým pokusom o zneužitie.

Mentor Financeiro sa snaží primerane znížiť riziká, ale musíte udržiavať kópie alebo vlastné kontroly základných finančných informácií.

## 8. Incidenty a kontakt

Ak si všimnete zvláštne správanie, nesprávny prístup, nesprávne údaje, podozrenie na porušenie bezpečnosti alebo problém s citlivými povoleniami, kontaktujte:

**george.guimares@gmail.com**

Ak je to možné, zahrňte:

- Model zariadenia.
- Verzia Android.
- Verzia aplikácie.
- Popis problému.
- Snímky obrazovky bez odhalenia hesiel, kódov alebo nadmerného množstva údajov.

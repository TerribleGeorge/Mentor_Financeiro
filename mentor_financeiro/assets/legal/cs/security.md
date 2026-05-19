# Zabezpečení – Mentor Financeiro

**Poslední aktualizace:** 19. května 2026

Tato stránka vysvětluje postupy zabezpečení Mentor Financeiro jednoduchým jazykem. Doplňuje Zásady ochrany osobních údajů a Podmínky použití.

## 1. Bezpečnostní závazek

Mentor Financeiro byl vyvinut, aby pomohl s finanční organizací bez požadavku na přímý přístup k bankovnímu účtu, bez požadavku na bankovní heslo a bez fungování jako banka, makléř nebo platební metoda.

Aplikace může ukládat finanční údaje, které jste zadali nebo identifikovali volitelnými funkcemi, a proto považujeme zabezpečení za ústřední součást produktu.

## 2. Co aplikace nedělá

- Nežádá o bankovní heslo, kartu nebo digitální peněženku.
- Nemá přístup k vašemu bankovnímu účtu.
- Nepřesouvá peníze.
- Neprovádí platby, Pix, převody ani investice vaším jménem.
- Nevyžaduje bezpečnostní kód karty.
- Nevyžaduje kód banky OTP.
- Neprodává vaše osobní údaje.

## 3. Použitá technická opatření

V závislosti na použitém zdroji může aplikace používat:

- Přihlaste se pomocí Firebase Authentication.
- Cloud Firestore s daty spojenými s ověřeným uživatelem.
- Bezpečnostní pravidla pro omezení přístupu k vlastním datům uživatele.
- Komunikace je šifrována pomocí sad SDK a používaných služeb.
- Firebase Crashlytics k identifikaci technických závad a opravě problémů.
- Oprávnění Android jsou požadována pouze v souvislosti s funkcemi aplikace.
- Místní úložiště pro předvolby, téma, mezipaměť a data zařízení.

## 4. Sledování oznámení

Sledování oznámení je volitelné a vyžaduje ruční aktivaci na Android.

Když je tato možnost povolena, může aplikace číst podporovaná oznámení, aby rozpoznávala výdaje, nákupy, platby, předplatná a převody. Cílem je omezit manuální práci při evidenci výdajů.

Ke snížení rizik:

- Aplikace vás informuje o důvodu povolení, než vás přesměruje do nastavení.
- Přístup lze kdykoli zrušit v nastavení Android.
- Filtr vyhledává kompatibilní finanční události, nikoli osobní konverzace.
- Aplikace se snaží ignorovat OTP kódy, hesla, bezpečnostní kódy a ověřovací zprávy.
- Aplikace tuto funkci nepoužívá pro přístup k bankám, kartám nebo digitálním peněženkám.

I tak mohou oznámení obsahovat citlivá data. Tuto funkci používejte pouze v případě, že souhlasíte s tímto typem zpracování.

## 5. Citlivá oprávnění

Aplikace může vyžadovat:

- **Internet:** připojení k Firebase, Google Play, rozhraním API a online zdrojům.
- **Oznámení:** odesílání upozornění ze samotné aplikace.
- **Umístění:** přizpůsobení obsahu nebo srovnání zemi/oblasti, pokud je to povoleno.
- **Přístup k oznámením Android:** volitelná identifikace výdajů z kompatibilních oznámení.
- **Nákupy v aplikaci:** Předplatné Premium od Google Play.

Tato oprávnění ovládáte v nastavení Android.

## 6. Vaše role v bezpečnosti

Chcete-li chránit svá data:

- Použijte zámek obrazovky na zařízení.
- Nesdílejte svůj účet.
- Udržujte aplikaci a Android aktualizované.
- Zrušte oprávnění, která již nechcete používat.
- Před rozhodnutím zkontrolujte automaticky identifikované transakce.
- Neregistrujte informace, které nechcete v aplikaci uchovávat.
- Zrušte předplatné přímo na Google Play, pokud je nechcete obnovit.

## 7. Omezení

Žádná aplikace, server, operační systém nebo cloudová služba není 100% bezpečná. I přes přijatá opatření může docházet k poruchám, nedostupnosti, chybám synchronizace, ztrátě přístupu, problémům třetích stran nebo externím pokusům o zneužití.

Mentor Financeiro se snaží přiměřeně snížit rizika, ale musíte udržovat kopie nebo vlastní kontroly základních finančních informací.

## 8. Incidenty a kontakt

Pokud zaznamenáte podivné chování, nesprávný přístup, nesprávná data, podezření na porušení zabezpečení nebo problém s citlivými oprávněními, kontaktujte:

**george.guimares@gmail.com**

Pokud je to možné, zahrňte:

- Model zařízení.
- Verze Android.
- Verze aplikace.
- Popis problému.
- Snímky obrazovky bez odhalení hesel, kódů nebo nadměrného množství dat.

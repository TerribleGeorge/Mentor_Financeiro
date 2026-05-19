# Tietosuojakäytäntö - Mentor Financeiro

**Viimeksi päivitetty:** 19. toukokuuta 2026

**Sovellus:** Mentor Financeiro

**Paketti Android:** `com.georgeguimares.mentorfinanceiro`

**Käytäntö julkaistu:** https://terriblegeorge.github.io/Mentor_Financeiro/

Tämä tietosuojakäytäntö selittää selkeästi, mitä tietoja Mentor Financeiro voi käyttää, kerätä, käyttää, tallentaa, jakaa ja suojata. Se on kirjoitettu kuvastamaan sovelluksen nykyistä toimintaa, ja se tulee lukea yhdessä Käyttöehdot ja turvallisuus -sivun kanssa.

Mentor Financeiro on sovellus talousorganisaatioon, talouskoulutukseen, tavoitteisiin, kulukirjauksiin, kaavioihin, raportteihin, sijoitussisältöön ja valinnaisiin Premium-tilausominaisuuksiin. Hakemus ei ole pankki, välittäjä, rahoituslaitos, rekisteröity sijoitusneuvoja, vakuutusyhtiö tai maksutapa.

## 1. Kuka on vastuussa

Mentor Financeiro tarjoaa kehittäjä, joka on vastuussa sovelluksen julkaisemisesta Google Play.

Jos haluat käyttää tietoihisi liittyviä oikeuksia, esittää kysymyksiä tai pyytää poistamista, ota meihin yhteyttä sähköpostitse:

**george.guimares@gmail.com**

## 2. Yhteenveto selkeällä kielellä

- Sovellus auttaa järjestämään kuluja, tavoitteita, rajoja, taloushistoriaa, sijoituksia ja koulutussisältöä.
- Voit käyttää tiettyjä ominaisuuksia kirjautumalla sisään sähköpostilla/salasanalla, Google-tilillä, Apple-tilillä tai incognito-tilassa Firebase Authentication:n kautta.
- Antamasi taloustiedot, kuten kulut, tavoitteet, rajoitukset, profiili ja mieltymykset, voidaan tallentaa kansioon Firebase/Cloud Firestore synkronointia ja tilin käyttöä varten.
- Sovellus käyttää Google/Firebase-palveluita kirjautumiseen, tietokantaan, push-ilmoituksiin, analytiikkaan ja vikadiagnostiikkaan.
- Sovellus voi käyttää Google AdMob-merkkiä mainosten näyttämiseen.
- Premium käsittelee Google Play Billing itse sovelluksessa.
- Sijainti on valinnainen ja sitä käytetään vain, kun annat sille luvan, esimerkiksi mukauttaaksesi sijoitusvertailuja maan tai paikallisen kontekstin mukaan.
- Ilmoitusten valvontaominaisuus on valinnainen. Jos otat käyttöön ilmoitusten käytön Android-laitteessa, sovellus voi lukea tuettujen ilmoitusten otsikot ja tekstit tunnistaakseen ostot, maksut ja siirrot ja muuttaa ne taloustietueiksi. Sovellus ei pääse pankkitilillesi eikä kysy salasanaa.
- Räätälöintiäsi valitsemasi kuvat voidaan tallentaa paikallisesti laitteeseen.
- Voit pyytää tilin ja tietojen poistamista tässä käytännössä mainitulla sähköpostilla.

## 3. Tiedot, joita saatamme käsitellä

Riippuen siitä, miten käytät sovellusta, saatamme käsitellä seuraavia tietoluokkia.

### 3.1 Tili- ja tunnistetiedot

- Rekisteröinnin yhteydessä ilmoitettu nimi.
- Sähköposti.
- Firebase (UID) käyttäjätunnus.
- Käytetty kirjautumistapa.
- Profiilikuva, jos kirjautumispalvelu tarjoaa.
- profiiliin liittyvä Premium tilaustila.
- Tekniset tiedot, joita tarvitaan istunnon ylläpitämiseen ja tietojen synkronointiin.

### 3.2 Antamasi taloudelliset tiedot

- Kulut, kulut, tulot, luokat, taloushistoria ja tapahtumat.
- Tavoitteet, rajat, suunnittelu, taloudelliset unelmat ja mieltymykset.
- Sovelluksen kaavioissa, raporteissa, analyyseissä ja automaattisessa mentoroinnissa käytettävät tiedot.
- Sijoittajaprofiili, tavoitteet ja vastaukset kyselylomakkeissa tai suunnittelunäytöissä.

Nämä tiedot voivat olla arkaluonteisia käytännön mielessä, koska ne paljastavat talouselämäsi näkökohtia. Siksi sinun tulee rekisteröidä vain tiedot, jotka haluat säilyttää sovelluksessa.

### 3.3 Tilaus- ja ostotiedot

- Ostettu tuote, tilauksen tila, kausi, uusiminen, oston palautus ja tekniset tunnisteet vaaditaan vahvistamaan Premium.
- Google Play käsittelee ostot, peruutukset, uusimiset, hyvitykset ja veloitukset Google-tilin ja kaupan sääntöjen mukaisesti.

Sovellus ei kerää tai tallenna korttinumeroita, kortin turvakoodeja tai pankkimaksutietoja.

### 3.4 Käyttö-, diagnostiikka- ja suorituskykytiedot- Sovelluksen käyttö- ja vuorovaikutustapahtumat, esimerkiksi käytetyt näytöt, käytetyt resurssit ja suoritetut virrankulut.
- Koottuja tai teknisiä tietoja tuotteen vakauden, suorituskyvyn ja parannusten ymmärtämiseksi.
- Firebase Crashlytics:n vikaraportit ja -diagnostiikka tarvittaessa, mukaan lukien laitteen tekniset tiedot, sovellusversio, käyttöjärjestelmä, virhelokit ja käyttäjän tunniste, kun ne on määritetty.

### 3.5 Push-ilmoitustiedot

Jos sallit ilmoitukset sovelluksesta, voimme käsitellä:

- Firebase Cloud Messaging tunnus (FCM).
- Ilmoitusten vastaanottamiseen liittyvät asetukset.
- Aiheet tai segmentit, joita tarvitaan viestien lähettämiseen itse sovelluksesta.

Voit hallita, sallitaanko ilmoitukset Android-asetuksissa.

### 3.6 Ilmoitustiedot luetaan Android

Ilmoitusten valvonta on valinnainen ominaisuus. Se toimii vain, jos otat ilmoitusten käyttöoikeuden manuaalisesti käyttöön Android-asetuksissa.

Kun tämä on käytössä, sovellus voi vastaanottaa otsikon, tekstin, lähdesovelluspaketin nimen, ajan ja tekniset metatiedot laitteellasi näkyvistä ilmoituksista. Tavoitteena on tunnistaa kulujen, ostojen, maksujen, tilausten ja siirtojen kanssa yhteensopivia ilmoituksia taloustietueiden luomiseksi.

Tämän ominaisuuden tärkeät toimenpiteet:

- Sovellus ei pääse pankkitilillesi.
- Sovellus ei kirjaudu pankkiin, kortteihin tai digitaalisiin lompakoihin.
- Sovellus ei kysy pankin salasanaa.
- Sovellus käyttää suodattimia suojakoodien, OTP, salasanojen ja todennusviestien sieppaamisen välttämiseksi.
- Suodattimen painopiste on tunnistaa yhteensopivia ostoja, maksuja, lähetettyjä siirtoja ja rahaliikkeitä.
- Voit poistaa ominaisuuden käytöstä sovelluksessa tai peruuttaa luvan Android-asetuksista.

Jopa suodattimilla ilmoitukset voivat sisältää arkaluonteisia tietoja. Ota tämä ominaisuus käyttöön vain, jos ymmärrät ja hyväksyt tämän tyyppisen käsittelyn.

### 3.7 Sijainti

Sovellus voi pyytää likimääräistä tai tarkkaa sijaintia Android:n myöntämän luvan mukaisesti mukauttaakseen vertailuja, sisältöä tai sijoituskontekstia maan/alueen mukaan.

Sijaintia ei vaadita kaikille ominaisuuksille. Jos kiellät luvan, jotkin vertailut tai mukautukset voivat olla rajoitettuja.

### 3.8 Paikalliset kuvat ja tiedostot

Kun valitset kuvan sovelluksen visuaaliseksi mukauttamiseksi, se voidaan tallentaa paikallisesti laitteeseen. Ellei niitä erikseen oteta käyttöön tulevaisuudessa, näitä personointikuvia ei lähetetä palvelimillemme.

### 3.9 Mainonta

Sovellus voi näyttää mainoksia Google AdMob:n kautta. Google voi käsitellä laitetunnisteita, käyttötietoja, teknisiä tietoja ja mainossignaaleja Googlen omien käytäntöjen ja käyttäjän mainosasetusten mukaisesti.

### 3.10 Tiedot ulkoisista markkinoiden sovellusliittymistä

Sovellus voi hakea ulkopuolisia sovellusliittymiä valuuttakursseihin, noteerauksiin, indekseihin tai markkinatietoihin. Nämä kyselyt sisältävät yleensä haettavia parametreja, kuten valuutta, omaisuus, maa tai symboli. Rekisteröityjä henkilökohtaisia ​​taloustietojasi ei tarvitse lähettää näiden tietojen saamiseksi.

## 4. Mihin käytämme tietoja

Käytämme tietoja:

- Luo ja ylläpidä tiliäsi.
- Synkronoi kulut, tavoitteet, mieltymykset, historia ja asetukset.
- Näytä kojelaudat, kaaviot, raportit, rajoitukset ja personoitu sisältö.
- Salli Premium:n ostot, palauttaminen ja validointi.
- Lähetä ilmoituksia itse sovelluksesta, kun se on sallittua.
- Käsittele tuetut talousilmoitukset, jos otat tämän ominaisuuden käyttöön.
- Mukauta sijoitussisältöä paikalliseen kontekstiin, kun lokalisointi on sallittu.
- Paranna vakautta, suorituskykyä, turvallisuutta ja sovelluskokemusta.
- Noudata lakisääteisiä velvoitteita, vastaa pyyntöihin ja ehkäise väärinkäyttöä.
- Näytä mainoksia tarvittaessa.

## 5. Oikeusperustat

Kun LGPD sovelletaan, käsittely voi perustua yhteen tai useampaan oikeusperustaan, mukaan lukien:- Sopimuksen toteuttaminen tai alustavat menettelyt hakemusresurssien toimittamiseksi.
- Suostumus valinnaisille luville, kuten sijainti, push-ilmoitukset ja pääsy Android-ilmoituksiin.
- Perusteltu etu turvallisuuteen, diagnoosiin, tuotteiden parantamiseen, väärinkäytösten ehkäisyyn ja suhteellisiin tilastoihin.
- Lakisääteisten velvoitteiden noudattaminen tarvittaessa.
- Säännöllinen oikeuksien käyttö hallinnollisissa, oikeudellisissa tai oikeuden ulkopuolisissa menettelyissä.

Voit peruuttaa valinnaiset suostumukset sovelluksen tai käyttöjärjestelmän asetuksista, mutta tämä voi rajoittaa toimivuutta.

## 6. Jakaminen kolmansien osapuolten kanssa

Emme myy henkilötietojasi.

Voimme jakaa tai sallia palveluntarjoajien tietojen käsittelyn, jotka ovat tarpeen sovelluksen toiminnan kannalta, mukaan lukien:

- **Google Firebase**: Firebase Authentication, Cloud Firestore, Firebase Cloud Messaging, Firebase Analytics ja Firebase Crashlytics.
- **Google-sisäänkirjautuminen / Apple-sisäänkirjautuminen**: kirjaudu sisään kolmannen osapuolen tilin kautta, kun valitset sen.
- **Google Play Billing**: tilausten, ostosten, peruutusten, Premium:n palauttamisen ja tilan käsittely.
- **Google AdMob**: mainosten näyttäminen ja mittaaminen.
- **Markkina-, valuutta- tai hintatarjoussovellusliittymät**: sovelluksessa käytettyjen julkisten tai markkinataloudellisten tietojen tarkastelu.
- **Android-järjestelmäpalvelut**: käyttöoikeudet, ilmoitukset ja laiteresurssit.

Nämä kolmannet osapuolet voivat käsitellä tietoja omien ehtojensa, käytäntöjensä ja asetustensa mukaisesti.

## 7. Kansainvälinen siirto

Palvelut, kuten Firebase, Google Play, AdMob ja muut palveluntarjoajat voivat käsitellä tietoja Brasilian ulkopuolella sijaitsevilla palvelimilla. Käyttämällä sovellusta hyväksyt, että tätä kansainvälistä käsittelyä voi tapahtua sovellettavien tietosuojasääntöjen ja palveluntarjoajien ehtojen mukaisesti.

## 8. Säilyttäminen

Säilytämme tietoja niin kauan kuin on tarpeen sovelluksen toimittamiseksi, tässä käytännössä kuvattujen tarkoitusten täyttämiseksi, lakisääteisten velvoitteiden noudattamiseksi, riitojen ratkaisemiseksi, petosten estämiseksi ja turvallisuuden ylläpitämiseksi.

Yleisesti:

- Tilitiedot ja taloustiedot pilvessä säilyvät niin kauan kuin tili on olemassa tai voimassa olevaan poistopyyntöön asti.
- Paikalliset tiedot voivat jäädä laitteeseen, kunnes poistat, tyhjennät sovellustiedot tai poistat sovelluksen.
- Diagnostiikkatiedot, analytiikka ja lokit voidaan säilyttää palveluntarjoajien määrittämiä ajanjaksoja.
- Ostotiedot voivat jäädä tiedostoon Google Play vero-, kauppa- ja kauppasääntöjen mukaisesti.
- Anonymisoituja tai koottuja tietoja voidaan säilyttää ilman, että sinua tunnistetaan.

## 9. Turvallisuus

Käytämme kohtuullisia teknisiä ja organisatorisia toimenpiteitä tietojen suojaamiseksi, mukaan lukien:

- Todennus: Firebase.
- Pääsysäännöt tietokantaan rajoittamaan tiedot vastaavalle käyttäjälle.
- Käytetyillä SDK:illa ja API:illa salattu viestintä.
- Android-oikeuksien käyttö vain, kun se liittyy sovellusresursseihin.
- Suodattaa ilmoituksia valvottaessa suojakoodien, OTP, salasanojen ja todennusviestien välttämiseksi.
- Vikadiagnoosi virheiden korjaamiseksi ja vakauden parantamiseksi.

Mikään järjestelmä ei ole 100 % turvallinen. Sinun tulee myös suojata laitteesi, käyttää näytön lukitusta, säilyttää vahva salasana, välttää tilisi jakamista ja päivittää sovellus, kun uusi versio julkaistaan.

## 10. Säätimet

Voit:

- Muokkaa tai poista tietoja sovelluksessa, kun tämä toiminto on olemassa.
- Poista push-ilmoitukset käytöstä Android-asetuksissa.
- Peruuta sijainti Android-asetuksissa.
- Peruuta ilmoitusten käyttöoikeus Android-asetuksissa.
- Peruuta tai hallinnoi tilausta Google Play:n kautta.
- Tyhjennä paikalliset sovellustiedot tai poista sovellus.
- Pyydä pääsyä, korjausta tai poistamista sähköpostilla.

## 11. Tilin ja tietojen poistaminen

Tilin ja tietojen poistamisen pyytäminen:1. Lähetä sähköposti osoitteeseen **george.guimares@gmail.com**.
2. Käytä aihetta **"Tietojen poistaminen - Mentor Financeiro"** tai **"LGPD - Mentor Financeiro"**.
3. Anna tilin sähköpostiosoite, kirjautumistapa tai muu tunniste, joka auttaa paikantamaan profiilin.
4. Ilmoita, haluatko tilin/pilvitietojen täydellisen poistamisen vai tiettyjen luokkien poistamisen, jos se on teknisesti mahdollista.

Voimme pyytää henkilöllisyyden vahvistusta tarpeettomien poistojen välttämiseksi.

Seuraavat voidaan tarvittaessa sulkea pois tai poistaa linkittämättä:

- Käyttäjäprofiili ja asiakirjat kohteessa Cloud Firestore.
- Kulutus, tavoitteet, mieltymykset, taloushistoria ja asetukset tallennettu pilveen.
- profiiliin liitetty FCM -tunnus, kun se on tallennettu.
- Tili Firebase Authentication:ssa, kun täydellistä ja teknisesti soveltuvaa poistamista pyydetään.

Ne voivat viipyä pidempään:

- Anonymisoitu tai koostettu data.
- Lainmukaisuuden, petosten ehkäisemisen, turvallisuuden tai oikeuksien puolustamisen edellyttämät tiedot.
- Google Play:n ylläpitämä osto-, maksu- ja tilaushistoria.
- Kolmannen osapuolen palveluntarjoajien suoraan käsittelemät tiedot käytäntöjensä mukaisesti.

Pyrimme vastaamaan kelvollisiin pyyntöihin 30 arkipäivän kuluessa, ellei monimutkainen, lakisääteinen velvoite tai lisävahvistuksen tarvetta ole.

## 12. Haltijan oikeudet

Sovellettavan lain mukaisesti voit pyytää:

- Hoidon olemassaolon vahvistus.
- Pääsy tietoihin.
- Puutteellisten, epätarkkojen tai vanhentuneiden tietojen korjaaminen.
- Tarpeettomien, liiallisten tai vaatimustenvastaisten tietojen anonymisointi, estäminen tai poistaminen.
- Tietoa jakamisesta.
- Suostumuksen peruuttaminen.
- Suostumuksen perusteella käsiteltyjen tietojen poistaminen soveltuvin osin.
- Siirrettävyys, kun se on säänneltyä ja teknisesti mahdollista.
- Automaattisten päätösten tarkistaminen tarvittaessa.

Käytä näitä oikeuksia lähettämällä sähköpostia osoitteeseen **george.guimares@gmail.com**.

## 13. Lapset ja nuoret

Hakemus ei ole tarkoitettu alle 13-vuotiaille lapsille. Jos laillinen huoltaja ymmärtää, että lapsi on antanut tietoja sovellukseen, hänen tulee ottaa meihin yhteyttä, jotta voimme arvioida poiston.

## 14. Muutokset tähän käytäntöön

Saatamme päivittää tämän tietosuojakäytännön vastaamaan sovelluksen, palveluntarjoajien, lakivaatimusten tai Google Play-sääntöjen muutoksia. Päivämäärä yläreunassa osoittaa nykyisen version. Asiaankuuluvista muutoksista voidaan ilmoittaa sovelluksen sisällä, julkaistulla sivulla tai muilla kohtuullisilla tavoilla.

## 15. Ota yhteyttä

**Sovellus:** Mentor Financeiro

**Sähköposti:** george.guimares@gmail.com

**Käytäntö julkaistu:** https://terriblegeorge.github.io/Mentor_Financeiro/

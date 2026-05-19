# Turvallisuus - Mentor Financeiro

**Viimeksi päivitetty:** 19. toukokuuta 2026

Tällä sivulla selitetään Mentor Financeiro-tietoturvakäytännöt selkeällä kielellä. Se täydentää tietosuojakäytäntöä ja käyttöehtoja.

## 1. Turvallisuussitoumus

Mentor Financeiro on kehitetty auttamaan rahoituksen järjestämisessä pyytämättä suoraa pääsyä pankkitilille, pyytämättä pankin salasanaa ja toimimatta pankkina, välittäjänä tai maksuvälineenä.

Sovellus voi tallentaa syöttämiäsi tai valinnaisilla ominaisuuksilla tunnistettuja taloustietoja, minkä vuoksi pidämme turvallisuutta tuotteen keskeisenä osana.

## 2. Mitä sovellus ei tee

- Se ei kysy pankin salasanaa, korttia tai digitaalista lompakkoa.
- Ei pääse pankkitilillesi.
- Ei liikuta rahaa.
- Se ei suorita maksuja, Pixiä, siirtoja tai sijoituksia sinun nimissäsi.
- Ei pyydä kortin turvakoodia.
- Ei pyydä pankkitunnusta OTP.
- Ei myy henkilötietojasi.

## 3. Käytetyt tekniset toimenpiteet

Käytetystä resurssista riippuen sovellus voi käyttää:

- Kirjaudu sisään Firebase Authentication.
- Cloud Firestore todennettuun käyttäjään liittyvillä tiedoilla.
- Turvasäännöt, joilla rajoitetaan pääsyä käyttäjän omiin tietoihin.
- Viestintä on salattu käytettyjen SDK:iden ja palveluiden avulla.
- Firebase Crashlytics teknisten vikojen tunnistamiseen ja ongelmien korjaamiseen.
- Android käyttöoikeuksia pyydetään vain, kun ne liittyvät sovelluksen ominaisuuksiin.
- Paikallinen tallennustila asetuksille, teemalle, välimuistille ja laitetiedoille.

## 4. Ilmoitusten valvonta

Ilmoitusten valvonta on valinnainen ja vaatii manuaalisen aktivoinnin Android-laitteessa.

Kun tämä on käytössä, sovellus voi lukea tuettuja ilmoituksia tunnistaakseen kulutuksen, ostot, maksut, tilaukset ja siirrot. Tavoitteena on vähentää käsityötä kulujen kirjaamisessa.

Riskien vähentämiseksi:

- Sovellus ilmoittaa sinulle luvan syyn ennen kuin ohjaa sinut asetuksiin.
- Käyttöoikeus voidaan peruuttaa milloin tahansa Android-asetuksissa.
- Suodatin etsii yhteensopivia taloustapahtumia, ei henkilökohtaisia ​​keskusteluja.
- Sovellus yrittää ohittaa OTP-koodit, salasanat, suojakoodit ja todennusviestit.
- Sovellus ei käytä tätä ominaisuutta pankkien, korttien tai digitaalisten lompakoiden käyttämiseen.

Siitä huolimatta ilmoitukset voivat sisältää arkaluonteisia tietoja. Käytä tätä ominaisuutta vain, jos hyväksyt tämän tyyppisen käsittelyn.

## 5. Arkaluonteiset käyttöoikeudet

Sovellus voi pyytää:

- **Internet:** yhteys Firebase-, Google Play-, sovellusliittymiin ja verkkoresursseihin.
- **Ilmoitukset:** lähettää hälytyksiä itse sovelluksesta.
- **Sijainti:** sisällön mukauttaminen tai vertailut maahan/alueeseen, jos se on sallittua.
- **Pääsy Android-ilmoituksiin:** valinnainen kulujen tunnistaminen yhteensopivista ilmoituksista.
- **Sovelluksen sisäiset ostot:** Premium tilaus Google Play.

Voit hallita näitä käyttöoikeuksia Android-asetuksissa.

## 6. Sinun osasi turvallisuudesta

Tietojesi suojaaminen:

- Käytä laitteesi näytön lukitusta.
- Älä jaa tiliäsi.
- Pidä sovellus ja Android päivitettyinä.
- Peruuta käyttöoikeudet, joita et enää halua käyttää.
- Tarkista automaattisesti tunnistetut tapahtumat ennen päätöksentekoa.
- Älä rekisteröi hakemukseen tietoja, joita et halua säilyttää.
- Peruuta tilaukset suoraan numerosta Google Play, kun et halua uusia.

## 7. Rajoitukset

Mikään sovellus, palvelin, käyttöjärjestelmä tai pilvipalvelu ei ole 100 % turvallinen. Toteutetuista toimenpiteistä huolimatta saattaa esiintyä epäonnistumisia, käytettävyyttä, synkronointivirheitä, pääsyn menetyksiä, kolmannen osapuolen ongelmia tai ulkoisia väärinkäyttöyrityksiä.

Mentor Financeiro pyrkii vähentämään riskejä kohtuullisesti, mutta sinun on säilytettävä kopiot tai omat kontrollit olennaisista taloudellisista tiedoista.

## 8. Tapahtumat ja yhteydenotot

Jos huomaat outoa käyttäytymistä, epäasianmukaista pääsyä, vääriä tietoja, epäiltyä tietoturvaloukkausta tai ongelmia arkaluontoisissa käyttöoikeuksissa, ota yhteyttä:

**george.guimares@gmail.com**

Sisällytä, jos mahdollista:

- Laitteen malli.
- Android versio.
- Sovelluksen versio.
- Kuvaus ongelmasta.
- Kuvakaappaukset paljastamatta salasanoja, koodeja tai liikaa tietoja.

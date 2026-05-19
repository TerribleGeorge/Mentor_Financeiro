# Seguretat - Mentor Financeiro

**Darrera actualització:** 19 de maig de 2026

Aquesta pàgina explica les pràctiques de seguretat Mentor Financeiro en un llenguatge senzill. Complementa la Política de privadesa i les Condicions d'ús.

## 1. Compromís de seguretat

Mentor Financeiro va ser desenvolupat per ajudar amb l'organització financera sense demanar accés directe al compte bancari, sense demanar una contrasenya bancària i sense funcionar com a banc, corredor o mètode de pagament.

L'aplicació pot emmagatzemar les dades financeres introduïdes per vostè o identificades per funcions opcionals, per això tractem la seguretat com una part central del producte.

## 2. Què no fa l'aplicació

- No demana contrasenya bancària, targeta o cartera digital.
- No accedeix al teu compte bancari.
- No mou diners.
- No realitza pagaments, Pix, transferències o inversions al teu nom.
- No demana el codi de seguretat de la targeta.
- No demana el codi bancari OTP.
- No ven les vostres dades personals.

## 3. Mesures tècniques utilitzades

Segons el recurs utilitzat, l'aplicació pot utilitzar:

- Inicieu sessió per Firebase Authentication.
- Cloud Firestore amb dades associades a l'usuari autenticat.
- Normes de seguretat per restringir l'accés a les dades pròpies de l'usuari.
- Comunicació xifrada pels SDK i serveis utilitzats.
- Firebase Crashlytics per identificar avaries tècniques i corregir problemes.
- Els permisos Android només es demanen quan estan relacionats amb les funcions de l'aplicació.
- Emmagatzematge local per a preferències, tema, memòria cau i dades del dispositiu.

## 4. Seguiment de notificacions

La supervisió de notificacions és opcional i requereix l'activació manual al Android.

Quan està activada, l'aplicació pot llegir les notificacions compatibles per reconèixer despeses, compres, pagaments, subscripcions i transferències. L'objectiu és reduir el treball manual a l'hora de registrar les despeses.

Per reduir els riscos:

- L'aplicació us informa del motiu del permís abans de dirigir-vos a la configuració.
- L'accés es pot revocar en qualsevol moment a la configuració de Android.
- El filtre cerca esdeveniments financers compatibles, no converses personals.
- L'aplicació intenta ignorar els codis OTP, les contrasenyes, els codis de seguretat i els missatges d'autenticació.
- L'aplicació no utilitza aquesta funció per accedir a bancs, targetes o carteres digitals.

Tot i així, les notificacions poden contenir dades sensibles. Utilitzeu aquesta funció només si accepteu aquest tipus de processament.

## 5. Permisos sensibles

L'aplicació pot demanar:

- **Internet:** connexió a Firebase, Google Play, API i recursos en línia.
- **Notificacions:** enviant alertes des de la pròpia aplicació.
- **Ubicació:** adaptació del contingut o comparacions al país/regió, quan s'autoritzi.
- **Accés a les notificacions Android:** identificació opcional de despeses a partir de notificacions compatibles.
- **Compres des de l'aplicació:** subscripció a Premium per Google Play.

Controleu aquests permisos a la configuració de Android.

## 6. La teva part en la seguretat

Per protegir les vostres dades:

- Utilitza el bloqueig de pantalla al teu dispositiu.
- No compartiu el vostre compte.
- Manteniu l'aplicació i Android actualitzats.
- Revoca els permisos que ja no vulguis utilitzar.
- Comproveu les transaccions identificades automàticament abans de prendre decisions.
- No registreu informació que no voleu conservar a l'aplicació.
- Cancel·la les subscripcions directament a Google Play quan no vulguis renovar-les.

## 7. Limitacions

Cap aplicació, servidor, sistema operatiu o servei al núvol és 100% segur. Malgrat les mesures adoptades, es poden produir falles, indisponibilitats, errors de sincronització, pèrdua d'accés, problemes de tercers o intents d'abús externs.

Mentor Financeiro pretén reduir els riscos de manera raonable, però heu de mantenir còpies o controls propis de la informació financera essencial.

## 8. Incidències i contacte

Si observeu un comportament estrany, accés inadequat, dades incorrectes, sospita d'incompliment de seguretat o problemes amb permisos sensibles, poseu-vos en contacte amb:

**george.guimares@gmail.com**

Incloeu, si és possible:

- Model de dispositiu.
- Versió Android.
- Versió de l'aplicació.
- Descripció del problema.
- Captures de pantalla sense exposar contrasenyes, codis o dades excessives.

# Sicurezza - Mentor Financeiro

**Ultimo aggiornamento:** 19 maggio 2026

Questa pagina spiega le pratiche di sicurezza di Mentor Financeiro in un linguaggio semplice. Integra l'Informativa sulla privacy e i Termini di utilizzo.

## 1. Impegno per la sicurezza

Mentor Financeiro è stato sviluppato per aiutare con l'organizzazione finanziaria senza richiedere l'accesso diretto al conto bancario, senza richiedere una password bancaria e senza funzionare come banca, intermediario o metodo di pagamento.

L'app può memorizzare i dati finanziari inseriti da te o identificati tramite funzionalità opzionali, motivo per cui consideriamo la sicurezza una parte centrale del prodotto.

## 2. Cosa non fa l'app

- Non richiede password bancaria, carta o portafoglio digitale.
- Non accede al tuo conto bancario.
- Non sposta i soldi.
- Non effettua pagamenti, Pix, trasferimenti o investimenti a tuo nome.
- Non richiede il codice di sicurezza della carta.
- Non richiede il codice bancario OTP.
- Non vende i tuoi dati personali.

## 3. Misure tecniche utilizzate

A seconda della risorsa utilizzata, l'app può utilizzare:

- Accedi tramite Firebase Authentication.
- Cloud Firestore con i dati associati all'utente autenticato.
- Regole di sicurezza per limitare l'accesso ai propri dati dell'utente.
- Comunicazione crittografata dagli SDK e dai servizi utilizzati.
- Firebase Crashlytics per identificare guasti tecnici e risolvere problemi.
- Autorizzazioni Android richieste solo se correlate alle funzionalità dell'app.
- Archiviazione locale per preferenze, temi, cache e dati del dispositivo.

## 4. Monitoraggio delle notifiche

Il monitoraggio delle notifiche è facoltativo e richiede l'attivazione manuale su Android.

Se abilitata, l'app può leggere le notifiche supportate per riconoscere spese, acquisti, pagamenti, abbonamenti e trasferimenti. L'obiettivo è ridurre il lavoro manuale durante la registrazione delle spese.

Per ridurre i rischi:

- L'app ti informa del motivo dell'autorizzazione prima di indirizzarti alle impostazioni.
- L'accesso può essere revocato in qualsiasi momento nelle impostazioni Android.
- Il filtro cerca eventi finanziari compatibili, non conversazioni personali.
- L'app tenta di ignorare codici OTP, password, codici di sicurezza e messaggi di autenticazione.
- L'app non utilizza questa funzionalità per accedere a banche, carte o portafogli digitali.

Anche così, le notifiche potrebbero contenere dati sensibili. Utilizza questa funzionalità solo se accetti questo tipo di trattamento.

## 5. Autorizzazioni sensibili

L'app potrebbe richiedere:

- **Internet:** connessione a Firebase, Google Play, API e risorse online.
- **Notifiche:** invio di avvisi dall'app stessa.
- **Posizione:** adattamento dei contenuti o confronti con il paese/regione, quando autorizzato.
- **Accesso alle notifiche Android:** identificazione opzionale delle spese dalle notifiche compatibili.
- **Acquisti in-app:** Premium abbonamento di Google Play.

Puoi controllare queste autorizzazioni nelle impostazioni Android.

## 6. Il tuo ruolo nella sicurezza

Per proteggere i tuoi dati:

- Utilizza il blocco schermo sul dispositivo.
- Non condividere il tuo account.
- Mantieni aggiornati l'app e Android.
- Revoca i permessi che non desideri più utilizzare.
- Controlla le transazioni identificate automaticamente prima di prendere decisioni.
- Non registrare le informazioni che non desideri conservare nell'applicazione.
- Annulla gli abbonamenti direttamente su Google Play quando non desideri rinnovarli.

## 7. Limitazioni

Nessuna applicazione, server, sistema operativo o servizio cloud è sicuro al 100%. Nonostante le misure adottate potrebbero verificarsi guasti, indisponibilità, errori di sincronizzazione, perdita di accesso, problemi di terze parti o tentativi di abuso esterni.

Mentor Financeiro cerca di ridurre ragionevolmente i rischi, ma è necessario conservare copie o controlli propri delle informazioni finanziarie essenziali.

## 8. Incidenti e contatti

Se noti comportamenti strani, accessi impropri, dati errati, sospetta violazione della sicurezza o problemi con autorizzazioni sensibili, contatta:

**george.guimares@gmail.com**

Includere, se possibile:

- Modello del dispositivo.
- Versione di Android.
- Versione dell'app.
- Descrizione del problema.
- Screenshot senza esporre password, codici o dati eccessivi.

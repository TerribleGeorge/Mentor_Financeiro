# Sicherheit – Mentor Financeiro

**Letzte Aktualisierung:** 19. Mai 2026

Auf dieser Seite werden die Sicherheitspraktiken von Mentor Financeiro in einfacher Sprache erläutert. Es ergänzt die Datenschutzerklärung und Nutzungsbedingungen.

## 1. Sicherheitsverpflichtung

Mentor Financeiro wurde entwickelt, um bei der Finanzorganisation zu helfen, ohne einen direkten Zugriff auf das Bankkonto anzufordern, ohne ein Bankpasswort anzufordern und ohne als Bank, Broker oder Zahlungsmethode zu fungieren.

Die App kann von Ihnen eingegebene oder durch optionale Funktionen identifizierte Finanzdaten speichern, weshalb wir Sicherheit als zentralen Bestandteil des Produkts betrachten.

## 2. Was die App nicht macht

- Fragt nicht nach einem Bankpasswort, einer Karte oder einer digitalen Geldbörse.
- Greift nicht auf Ihr Bankkonto zu.
- Bewegt kein Geld.
- Führt keine Zahlungen, Pix, Überweisungen oder Investitionen in Ihrem Namen durch.
- Fordert keinen Kartensicherheitscode an.
- Bankleitzahl OTP wird nicht angefordert.
- Verkauft Ihre persönlichen Daten nicht.

## 3. Verwendete technische Maßnahmen

Abhängig von der verwendeten Ressource kann die App Folgendes verwenden:

- Anmeldung per Firebase Authentication.
– Cloud Firestore mit Daten, die dem authentifizierten Benutzer zugeordnet sind.
- Sicherheitsregeln zur Einschränkung des Zugriffs auf die eigenen Daten des Benutzers.
- Durch die verwendeten SDKs und Dienste verschlüsselte Kommunikation.
- Firebase Crashlytics zur Identifizierung technischer Störungen und zur Behebung von Problemen.
- Android-Berechtigungen werden nur angefordert, wenn sie sich auf App-Funktionen beziehen.
- Lokaler Speicher für Einstellungen, Theme, Cache und Gerätedaten.

## 4. Benachrichtigungsüberwachung

Die Benachrichtigungsüberwachung ist optional und erfordert eine manuelle Aktivierung auf dem Android.

Wenn die App aktiviert ist, kann sie unterstützte Benachrichtigungen lesen, um Ausgaben, Käufe, Zahlungen, Abonnements und Überweisungen zu erkennen. Ziel ist es, den manuellen Aufwand bei der Spesenerfassung zu reduzieren.

Um Risiken zu reduzieren:

- Die App informiert Sie über den Grund der Erlaubnis, bevor sie Sie zu den Einstellungen weiterleitet.
- Der Zugriff kann jederzeit in den Android-Einstellungen widerrufen werden.
- Der Filter sucht nach kompatiblen Finanzereignissen, nicht nach persönlichen Gesprächen.
- Die App versucht, OTP-Codes, Passwörter, Sicherheitscodes und Authentifizierungsnachrichten zu ignorieren.
- Die App nutzt diese Funktion nicht für den Zugriff auf Banken, Karten oder digitale Geldbörsen.

Dennoch können Benachrichtigungen sensible Daten enthalten. Nutzen Sie diese Funktion nur, wenn Sie mit dieser Art der Verarbeitung einverstanden sind.

## 5. Sensible Berechtigungen

Die App kann Folgendes anfordern:

- **Internet:** Verbindung zu Firebase, Google Play, APIs und Online-Ressourcen.
- **Benachrichtigungen:** Senden von Benachrichtigungen von der App selbst.
- **Standort:** Anpassung von Inhalten oder Vergleichen an das Land/die Region, sofern genehmigt.
- **Zugriff auf Android-Benachrichtigungen:** optionale Identifizierung von Ausgaben aus kompatiblen Benachrichtigungen.
- **In-App-Käufe:** Premium-Abonnement von Google Play.

Sie steuern diese Berechtigungen in den Android-Einstellungen.

## 6. Ihr Beitrag zur Sicherheit

Um Ihre Daten zu schützen:

- Verwenden Sie die Bildschirmsperre auf dem Gerät.
- Geben Sie Ihr Konto nicht weiter.
- Halten Sie die App und Android auf dem neuesten Stand.
- Widerrufen Sie Berechtigungen, die Sie nicht mehr verwenden möchten.
- Überprüfen Sie automatisch identifizierte Transaktionen, bevor Sie Entscheidungen treffen.
- Registrieren Sie keine Informationen, die Sie nicht in der Anwendung behalten möchten.
- Kündigen Sie Abonnements direkt bei Google Play, wenn Sie sie nicht verlängern möchten.

## 7. Einschränkungen

Keine Anwendung, kein Server, kein Betriebssystem und kein Cloud-Dienst ist 100 % sicher. Trotz der getroffenen Maßnahmen kann es zu Ausfällen, Nichtverfügbarkeit, Synchronisationsfehlern, Zugangsverlusten, Problemen Dritter oder externen Missbrauchsversuchen kommen.

Mentor Financeiro ist bestrebt, Risiken angemessen zu reduzieren, Sie müssen jedoch Kopien oder eigene Kontrollen über wesentliche Finanzinformationen aufbewahren.

## 8. Vorfälle und Kontakt

Wenn Sie seltsames Verhalten, unzulässigen Zugriff, falsche Daten, vermutete Sicherheitsverletzungen oder Probleme mit sensiblen Berechtigungen bemerken, wenden Sie sich bitte an:

**george.guimares@gmail.com**

Fügen Sie, wenn möglich, Folgendes hinzu:

- Gerätemodell.
- Version von Android.
- App-Version.
- Beschreibung des Problems.
- Screenshots, ohne Passwörter, Codes oder übermäßige Daten preiszugeben.

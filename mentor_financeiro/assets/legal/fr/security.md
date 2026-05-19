# Sécurité - Mentor Financeiro

**Dernière mise à jour :** 19 mai 2026

Cette page explique les pratiques de sécurité de Mentor Financeiro dans un langage simple. Il complète la Politique de Confidentialité et les Conditions d’Utilisation.

## 1. Engagement de sécurité

Mentor Financeiro a été développé pour aider à l'organisation financière sans demander d'accès direct au compte bancaire, sans demander de mot de passe bancaire et sans fonctionner comme une banque, un courtier ou un moyen de paiement.

L'application peut stocker des données financières saisies par vous ou identifiées par des fonctionnalités optionnelles, c'est pourquoi nous traitons la sécurité comme un élément central du produit.

## 2. Ce que l'application ne fait pas

- Ne demande pas de mot de passe bancaire, de carte ou de portefeuille numérique.
- N'accède pas à votre compte bancaire.
- Ne déplace pas d'argent.
- N'effectue pas de paiements, Pix, transferts ou investissements en votre nom.
- Ne demande pas le code de sécurité de la carte.
- Ne demande pas le code bancaire OTP.
- Ne vend pas vos données personnelles.

## 3. Mesures techniques utilisées

Selon la ressource utilisée, l'application peut utiliser :

- Connectez-vous par Firebase Authentication.
- Cloud Firestore avec les données associées à l'utilisateur authentifié.
- Règles de sécurité pour restreindre l'accès aux propres données de l'utilisateur.
- Communication cryptée par les SDK et services utilisés.
- Firebase Crashlytics pour identifier les défauts techniques et résoudre les problèmes.
- Autorisations Android demandées uniquement lorsqu'elles sont liées aux fonctionnalités de l'application.
- Stockage local pour les préférences, le thème, le cache et les données de l'appareil.

## 4. Surveillance des notifications

La surveillance des notifications est facultative et nécessite une activation manuelle sur le Android.

Lorsqu'elle est activée, l'application peut lire les notifications prises en charge pour reconnaître les dépenses, les achats, les paiements, les abonnements et les transferts. L’objectif est de réduire le travail manuel lors de l’enregistrement des dépenses.

Pour réduire les risques :

- L'application vous informe du motif de l'autorisation avant de vous diriger vers les paramètres.
- L'accès peut être révoqué à tout moment dans les paramètres Android.
- Le filtre recherche les événements financiers compatibles, pas les conversations personnelles.
- L'application essaie d'ignorer les codes, mots de passe, codes de sécurité et messages d'authentification OTP.
- L'application n'utilise pas cette fonctionnalité pour accéder aux banques, aux cartes ou aux portefeuilles numériques.

Néanmoins, les notifications peuvent contenir des données sensibles. Utilisez cette fonctionnalité uniquement si vous acceptez ce type de traitement.

## 5. Autorisations sensibles

L'application peut demander :

- **Internet :** connexion à Firebase, Google Play, API et ressources en ligne.
- **Notifications :** envoi d'alertes depuis l'application elle-même.
- **Localisation :** adaptation du contenu ou des comparaisons au pays/région, lorsqu'autorisé.
- **Accès aux notifications Android :** identification optionnelle des dépenses à partir des notifications compatibles.
- **Achats intégrés :** abonnement Premium par Google Play.

Vous contrôlez ces autorisations dans les paramètres Android.

## 6. Votre rôle dans la sécurité

Pour protéger vos données :

- Utilisez le verrouillage de l'écran sur l'appareil.
- Ne partagez pas votre compte.
- Gardez l'application et Android à jour.
- Révoquer les autorisations que vous ne souhaitez plus utiliser.
- Vérifiez les transactions automatiquement identifiées avant de prendre des décisions.
- N'enregistrez pas les informations que vous ne souhaitez pas conserver dans l'application.
- Annulez les abonnements directement sur Google Play lorsque vous ne souhaitez pas renouveler.

## 7. Limites

Aucune application, serveur, système d'exploitation ou service cloud n'est sécurisé à 100 %. Malgré les mesures adoptées, des pannes, indisponibilités, erreurs de synchronisation, perte d'accès, problèmes de tiers ou tentatives d'abus externes peuvent survenir.

Mentor Financeiro cherche à réduire les risques de manière raisonnable, mais vous devez conserver des copies ou posséder vos propres contrôles des informations financières essentielles.

## 8. Incidents et contacts

Si vous remarquez un comportement étrange, un accès inapproprié, des données incorrectes, une violation présumée de la sécurité ou un problème avec les autorisations sensibles, veuillez contacter :

**george.guimares@gmail.com**

Incluez, si possible :

- Modèle d'appareil.
-Version de Android.
- Version de l'application.
- Description du problème.
- Captures d'écran sans exposer les mots de passe, les codes ou les données excessives.

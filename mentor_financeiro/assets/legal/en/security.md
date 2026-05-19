# Security - Mentor Financeiro

**Last updated:** May 19, 2026

This page explains Mentor Financeiro security practices in straightforward language. It complements the Privacy Policy and Terms of Use.

## 1. Security Commitment

Mentor Financeiro was developed to help with financial organization without asking for direct access to the bank account, without requesting a bank password and without functioning as a bank, broker or payment method.

The app can store financial data entered by you or identified by optional features, which is why we treat security as a central part of the product.

## 2. What the app doesn't do

- It does not ask for a bank password, card or digital wallet.
- Does not access your bank account.
- Does not move money.
- It does not make payments, Pix, transfers or investments in your name.
- Does not request card security code.
- Does not request bank code OTP.
- Does not sell your personal data.

## 3. Technical measures used

Depending on the resource used, the app can use:

- Login by Firebase Authentication.
- Cloud Firestore with data associated with the authenticated user.
- Security rules to restrict access to the user's own data.
- Communication encrypted by the SDKs and services used.
- Firebase Crashlytics to identify technical faults and correct problems.
- Android permissions requested only when related to app features.
- Local storage for preferences, theme, cache and device data.

## 4. Notification Monitoring

Notification monitoring is optional and requires manual activation on the Android.

When enabled, the app can read supported notifications to recognize spending, purchases, payments, subscriptions, and transfers. The goal is to reduce manual work when recording expenses.

To reduce risks:

- The app informs you of the reason for permission before directing you to the settings.
- Access can be revoked at any time in the Android settings.
- The filter looks for compatible financial events, not personal conversations.
- The app attempts to ignore OTP codes, passwords, security codes, and authentication messages.
- The app does not use this feature to access banks, cards or digital wallets.

Even so, notifications may contain sensitive data. Use this feature only if you agree to this type of processing.

## 5. Sensitive permissions

The app may request:

- **Internet:** connection to Firebase, Google Play, APIs and online resources.
- **Notifications:** sending alerts from the app itself.
- **Location:** adaptation of content or comparisons to the country/region, when authorized.
- **Access to Android notifications:** optional identification of expenses from compatible notifications.
- **In-app purchases:** Premium subscription by Google Play.

You control these permissions in the Android settings.

## 6. Your part in security

To protect your data:

- Use screen lock on your device.
- Do not share your account.
- Keep the app and Android updated.
- Revoke permissions you no longer want to use.
- Check automatically identified transactions before making decisions.
- Do not register information that you do not want to keep in the application.
- Cancel subscriptions directly at Google Play when you do not want to renew.

## 7. Limitations

No application, server, operating system or cloud service is 100% secure. Despite the measures adopted, failures, unavailability, synchronization errors, loss of access, third-party problems or external attempts at abuse may occur.

Mentor Financeiro seeks to reduce risks reasonably, but you must maintain copies or own controls of essential financial information.

## 8. Incidents and contact

If you notice strange behavior, improper access, incorrect data, suspected security breach or problem with sensitive permissions, please contact:

**george.guimares@gmail.com**

Include, if possible:

- Device model.
- Android version.
- App version.
- Description of the problem.
- Screenshots without exposing passwords, codes or excessive data.

/// Identificadores alinhados ao dashboard RevenueCat (Products, Entitlements, Offerings).
///
/// **Entitlement**
/// O entitlement que desbloqueia assinatura e temas Cyber / Grimm / Hive deve chamar-se
/// exactamente **[premiumEntitlementId]** no RevenueCat (`premium`), em sincronia com o código.
///
/// **Pacotes → mesmo entitlement**
/// Todos os produtos (mensal, anual, vitalício) devem estar ligados ao entitlement `premium`.
/// Identificadores típicos de pacote na offering (alinhar com Play Console + RC):
/// | Identificador pacote (custom ou RC) | Função |
/// |-------------------------------------|--------|
/// | `monthly`, `$rc_monthly`            | Mensal → `premium` |
/// | `yearly`, `annual`, `$rc_annual`    | Anual → `premium` |
/// | `lifetime`, `$rc_lifetime`         | Vitalício → `premium` |
///
/// Os **temas** (Cyber, Grimm, Hive) são apenas UI após `premium` activo; não há pacote por tema.
abstract final class RevenueCatConstants {
  /// **Nome exacto** do entitlement no RevenueCat Dashboard (não alterar sem actualizar o dashboard).
  static const String premiumEntitlementId = 'premium';

  /// Paywalls que exigem um único id devem usar o mesmo [premiumEntitlementId].
  static const String paywallTargetEntitlementId = premiumEntitlementId;

  static const String defaultOfferingIdentifier = 'default';

  /// Ordem ao resolver a offering com pacotes: `current`, depois estes [Offering.identifier].
  /// Inclui `premium_offering` (nome frequente no dashboard / versões antigas do projecto).
  static const List<String> offeringLookupIdentifiers = <String>[
    defaultOfferingIdentifier,
    'premium_offering',
  ];

  /// Identificadores de pacote aceites na resolução automática (custom ou `$rc_*`).
  static const Set<String> monthlyPackageIds = {'monthly', r'$rc_monthly'};
  static const Set<String> yearlyPackageIds = {'yearly', 'annual', r'$rc_annual'};
  static const Set<String> lifetimePackageIds = {'lifetime', r'$rc_lifetime'};
}

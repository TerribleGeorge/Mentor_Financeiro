/// Identificadores alinhados ao dashboard RevenueCat (Products, Entitlements, Offerings).
///
/// **Dashboard — checklist**
/// 1. Criar produtos na Play Console (ex.: `monthly`, `yearly`, `lifetime`) e ligá-los aos produtos RevenueCat.
/// 2. Criar entitlements **`premium`** e/ou **`cyber`** (ou manter **Mentor Financeiro Android Pro**) e associar produtos.
/// 3. Criar uma *Offering* (ex.: `default`) com pacotes que usem os tipos/preços monthly, annual, lifetime
///    (ou identificadores personalizados `monthly` / `yearly` / `lifetime`).
abstract final class RevenueCatConstants {
  /// Identificador legado (dashboard); continua aceite em [premiumEntitlementIds].
  static const String mentorProEntitlementId = 'Mentor Financeiro Android Pro';

  /// Qualquer um destes entitlements ativos → utilizador tratado como premium (ex.: tema Cyber).
  static const List<String> premiumEntitlementIds = <String>[
    'premium',
    'cyber',
    mentorProEntitlementId,
  ];

  /// Usado em paywalls que exigem um único id (ex. [RevenueCatUI.presentPaywallIfNeeded]).
  /// Alinhe com um entitlement que exista no RevenueCat ou altere para `'cyber'` / o legado.
  static const String paywallTargetEntitlementId = 'premium';

  /// Offering por defeito (RevenueCat usa frequentemente `current` em [Offerings.current]).
  /// Se usar outro ID no dashboard, os pacotes continuam a ser resolvidos por tipo/nome abaixo.
  static const String defaultOfferingIdentifier = 'default';

  /// Identificadores de pacote aceites (custom identifiers no RC ou `$rc_*`).
  static const Set<String> monthlyPackageIds = {'monthly', r'$rc_monthly'};
  static const Set<String> yearlyPackageIds = {'yearly', 'annual', r'$rc_annual'};
  static const Set<String> lifetimePackageIds = {'lifetime', r'$rc_lifetime'};
}

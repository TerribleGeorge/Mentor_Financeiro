/// Ligações para compras e gestão de subscrições na Google Play (sem SDK terceiro).
abstract final class PlayStoreBilling {
  static const String androidApplicationId =
      'com.georgeguimares.mentorfinanceiro';

  static const String premiumProductId = 'premium_assinatura';
  static const String monthlyBasePlanId = 'a-premium';
  static const String yearlyBasePlanId = 'premium-anual';

  /// Página da app na Play Store (subscrições configuradas na Play Console).
  static final Uri appListing = Uri.parse(
    'https://play.google.com/store/apps/details?id=$androidApplicationId',
  );

  /// Subscrições desta app na conta Play (cancelar / alterar plano).
  static final Uri manageAppSubscriptions = Uri.parse(
    'https://play.google.com/store/account/subscriptions?package=$androidApplicationId',
  );
}

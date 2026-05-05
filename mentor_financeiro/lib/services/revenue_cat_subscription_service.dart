import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../constants/revenue_cat_constants.dart';
import 'revenue_cat_bootstrap.dart';

/// Operações de compra, [CustomerInfo] e resolução de pacotes — só após [Purchases.configure].
abstract final class RevenueCatSubscriptionService {
  /// Verifica se o entitlement **Mentor Financeiro Android Pro** está ativo.
  static bool customerHasMentorPro(CustomerInfo info) {
    final id = RevenueCatConstants.mentorProEntitlementId;
    final ent = info.entitlements.all[id];
    return ent?.isActive ?? false;
  }

  static Future<CustomerInfo?> getCustomerInfoSafe() async {
    if (!RevenueCatBootstrap.isSdkReady) return null;
    try {
      return await Purchases.getCustomerInfo();
    } catch (e, st) {
      debugPrint('RevenueCatSubscriptionService.getCustomerInfoSafe: $e\n$st');
      return null;
    }
  }

  static Future<Offerings?> getOfferingsSafe() async {
    if (!RevenueCatBootstrap.isSdkReady) return null;
    try {
      return await Purchases.getOfferings();
    } catch (e, st) {
      debugPrint('RevenueCatSubscriptionService.getOfferingsSafe: $e\n$st');
      return null;
    }
  }

  /// Mesma prioridade que o paywall: `current`, offering `default`, ou primeira em [Offerings.all].
  static Offering? resolvePrimaryOffering(Offerings? offerings) {
    if (offerings == null) return null;
    return offerings.current ??
        offerings.getOffering(RevenueCatConstants.defaultOfferingIdentifier) ??
        (offerings.all.isNotEmpty ? offerings.all.values.first : null);
  }

  /// Resolve pacote mensal: identificadores configurados ou [PackageType.monthly].
  static Package? resolveMonthly(Offering? offering) {
    if (offering == null) return null;
    return _findByIds(offering, RevenueCatConstants.monthlyPackageIds) ??
        _findByType(offering, PackageType.monthly);
  }

  /// Resolve pacote anual: `yearly`/`annual` ou [PackageType.annual].
  static Package? resolveYearly(Offering? offering) {
    if (offering == null) return null;
    return _findByIds(offering, RevenueCatConstants.yearlyPackageIds) ??
        _findByType(offering, PackageType.annual);
  }

  /// Resolve lifetime: identificadores ou [PackageType.lifetime].
  static Package? resolveLifetime(Offering? offering) {
    if (offering == null) return null;
    return _findByIds(offering, RevenueCatConstants.lifetimePackageIds) ??
        _findByType(offering, PackageType.lifetime);
  }

  static Package? _findByIds(Offering offering, Set<String> ids) {
    final lower = ids.map((e) => e.toLowerCase()).toSet();
    for (final p in offering.availablePackages) {
      if (lower.contains(p.identifier.toLowerCase())) return p;
    }
    return null;
  }

  static Package? _findByType(Offering offering, PackageType type) {
    for (final p in offering.availablePackages) {
      if (p.packageType == type) return p;
    }
    return null;
  }
}

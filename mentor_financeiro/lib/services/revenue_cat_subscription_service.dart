import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../constants/revenue_cat_constants.dart';
import 'revenue_cat_bootstrap.dart';

/// Operações de compra, [CustomerInfo] e resolução de pacotes — só após [Purchases.configure].
abstract final class RevenueCatSubscriptionService {
  /// Mesmo critério que `customerInfo.entitlements.all['premium']?.isActive == true`
  /// com [RevenueCatConstants.premiumEntitlementId].
  static bool isPremiumEntitlementActive(CustomerInfo info) {
    final id = RevenueCatConstants.premiumEntitlementId;
    return info.entitlements.all[id]?.isActive ?? false;
  }

  /// Alias para compatibilidade (desbloqueio de temas / espelho Firestore).
  static bool customerHasPremiumAccess(CustomerInfo info) =>
      isPremiumEntitlementActive(info);

  /// Entitlement activo para expiração / debug (só [premiumEntitlementId]).
  static EntitlementInfo? activePremiumEntitlement(CustomerInfo info) {
    final id = RevenueCatConstants.premiumEntitlementId;
    final ent = info.entitlements.all[id];
    if (ent?.isActive ?? false) return ent;
    return null;
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

  /// Prioridade: `current` com pacotes → offering por [RevenueCatConstants.offeringLookupIdentifiers]
  /// → qualquer offering com [Offering.availablePackages] não vazio → primeira da lista.
  static Offering? resolvePrimaryOffering(Offerings? offerings) {
    if (offerings == null) return null;

    bool hasPackages(Offering o) => o.availablePackages.isNotEmpty;

    final current = offerings.current;
    if (current != null && hasPackages(current)) return current;

    for (final id in RevenueCatConstants.offeringLookupIdentifiers) {
      final o = offerings.getOffering(id);
      if (o != null && hasPackages(o)) return o;
    }

    for (final o in offerings.all.values) {
      if (hasPackages(o)) return o;
    }

    return current ??
        (offerings.all.isNotEmpty ? offerings.all.values.first : null);
  }

  /// Resolve pacote mensal: identificadores configurados ou [PackageType.monthly].
  static Package? resolveMonthly(Offering? offering) {
    if (offering == null) return null;
    return _findByIds(offering, RevenueCatConstants.monthlyPackageIds) ??
        _findByType(offering, PackageType.monthly) ??
        _singlePackageFallback(offering);
  }

  /// Resolve pacote anual: `yearly`/`annual` ou [PackageType.annual].
  static Package? resolveYearly(Offering? offering) {
    if (offering == null) return null;
    return _findByIds(offering, RevenueCatConstants.yearlyPackageIds) ??
        _findByType(offering, PackageType.annual) ??
        _singlePackageFallback(offering);
  }

  /// Resolve lifetime: identificadores ou [PackageType.lifetime].
  static Package? resolveLifetime(Offering? offering) {
    if (offering == null) return null;
    return _findByIds(offering, RevenueCatConstants.lifetimePackageIds) ??
        _findByType(offering, PackageType.lifetime) ??
        _singlePackageFallback(offering);
  }

  /// Quando a offering tem um único pacote com identifier custom, usa-o para compra.
  static Package? _singlePackageFallback(Offering offering) {
    if (offering.availablePackages.length == 1) {
      return offering.availablePackages.first;
    }
    return null;
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

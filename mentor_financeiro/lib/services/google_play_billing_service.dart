import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

/// Implementação mínima de Google Play Billing (assinatura).
///
/// - Carrega [productId] (ex.: `premium_assinatura`)
/// - Resolve o offerToken do base plan (ex.: `a-premium`) quando disponível
/// - Escuta o purchase stream e completa/acknowledge quando necessário
class GooglePlayBillingService extends ChangeNotifier {
  GooglePlayBillingService._();
  static final GooglePlayBillingService instance = GooglePlayBillingService._();

  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _sub;

  bool _available = false;
  bool get isAvailable => _available;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _hasActivePurchase = false;
  bool get hasActivePurchase => _hasActivePurchase;

  ProductDetails? _product;
  ProductDetails? get product => _product;

  String? formattedPriceForBasePlan(String basePlanId) {
    final p = _product;
    if (p is! GooglePlayProductDetails) return null;
    final offers = p.productDetails.subscriptionOfferDetails;
    if (offers == null || offers.isEmpty) return null;

    for (final offer in offers) {
      if (offer.basePlanId != basePlanId) continue;
      if (offer.pricingPhases.isEmpty) return null;
      final paidPhases = offer.pricingPhases
          .where((phase) => phase.priceAmountMicros > 0)
          .toList();
      final phase = paidPhases.isNotEmpty
          ? paidPhases.last
          : offer.pricingPhases.last;
      return phase.formattedPrice;
    }
    return null;
  }

  /// Inicializa listener e tenta carregar detalhes do produto.
  Future<void> initialize({
    required String productId,
    String? basePlanId,
  }) async {
    if (kIsWeb) return;

    _setLoading(true);
    _error = null;
    _hasActivePurchase = false;

    _available = await _iap.isAvailable();
    if (!_available) {
      _error =
          'As compras da Google Play não estão disponíveis neste dispositivo.';
      _setLoading(false);
      return;
    }

    _sub ??= _iap.purchaseStream.listen(
      (purchases) => _handlePurchases(purchases),
      onError: (e) {
        _error = e.toString();
        notifyListeners();
      },
    );

    final response = await _iap.queryProductDetails({productId});
    if (response.error != null) {
      _error = response.error!.message;
      _product = null;
      _setLoading(false);
      return;
    }

    if (response.productDetails.isEmpty) {
      _error =
          'Não foi possível carregar as opções de assinatura. Tente novamente em instantes.';
      _product = null;
      _setLoading(false);
      return;
    }

    _product = response.productDetails.first;

    // Pré-seleção do base plan (não obrigatório, só valida que existe)
    if (basePlanId != null) {
      final token = _tryResolveOfferToken(_product!, basePlanId: basePlanId);
      if (token == null) {
        _error =
            'Não foi possível carregar este plano. Tente novamente em instantes.';
      }
    }

    _setLoading(false);
  }

  /// Inicia compra da assinatura para o produto carregado.
  Future<void> buySubscription({
    String? basePlanId,
    bool preferFreeTrial = false,
  }) async {
    if (!_available) {
      _error =
          'As compras da Google Play não estão disponíveis neste dispositivo.';
      notifyListeners();
      return;
    }
    final p = _product;
    if (p == null) {
      _error =
          'As opções de assinatura ainda estão carregando. Tente novamente em alguns segundos.';
      notifyListeners();
      return;
    }

    _error = null;
    notifyListeners();

    final offerToken = basePlanId == null
        ? _tryResolveOfferToken(p, preferFreeTrial: preferFreeTrial)
        : _tryResolveOfferToken(
            p,
            basePlanId: basePlanId,
            preferFreeTrial: preferFreeTrial,
          );
    if (basePlanId != null &&
        p is GooglePlayProductDetails &&
        offerToken == null) {
      _error =
          'Não foi possível abrir este plano. Tente novamente em instantes.';
      notifyListeners();
      return;
    }

    final param = PurchaseParam(productDetails: p, applicationUserName: null);

    // Para assinaturas no Android, o offerToken é essencial quando existe.
    // O plugin aceita via GooglePlayPurchaseParam.
    final purchaseParam = (offerToken == null)
        ? param
        : GooglePlayPurchaseParam(
            productDetails: p,
            offerToken: offerToken,
            applicationUserName: null,
          );

    try {
      _setLoading(true);
      final ok = await _iap.buyNonConsumable(purchaseParam: purchaseParam);
      if (!ok) {
        _error = 'Não foi possível iniciar a compra.';
        _setLoading(false);
      }
    } on PlatformException {
      _error =
          'Não foi possível abrir a compra na Google Play. Tente novamente em instantes.';
      _setLoading(false);
    } catch (e) {
      _error =
          'Não foi possível abrir a compra agora. Tente novamente em instantes.';
      _setLoading(false);
    }
  }

  Future<void> restore() async {
    if (!_available) return;
    _setLoading(true);
    await _iap.restorePurchases();
    _setLoading(false);
  }

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }

  Future<void> _handlePurchases(List<PurchaseDetails> purchases) async {
    for (final p in purchases) {
      if (p.status == PurchaseStatus.error) {
        _error = p.error?.message ?? 'Erro de compra.';
      }

      if (p.status == PurchaseStatus.purchased ||
          p.status == PurchaseStatus.restored) {
        _hasActivePurchase = true;
        // O app pode validar no backend, mas para teste interno vamos apenas concluir.
        if (p.pendingCompletePurchase) {
          await _iap.completePurchase(p);
        }
      }

      if (p.status == PurchaseStatus.canceled) {
        _error = 'Compra cancelada na Play Store.';
      }
    }
    _setLoading(false);
  }

  void _setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  /// Resolve o offerToken da Play (Android). Se [basePlanId] for fornecido,
  /// tenta casar. Quando pedido, prioriza a oferta que contém fase gratuita.
  String? _tryResolveOfferToken(
    ProductDetails product, {
    String? basePlanId,
    bool preferFreeTrial = false,
  }) {
    if (product is! GooglePlayProductDetails) return null;
    final offers = product.productDetails.subscriptionOfferDetails;
    if (offers == null || offers.isEmpty) return null;

    final matchingOffers = basePlanId == null
        ? offers
        : offers.where((o) => o.basePlanId == basePlanId).toList();

    if (matchingOffers.isEmpty) return null;

    if (preferFreeTrial) {
      for (final offer in matchingOffers) {
        final hasFreePhase = offer.pricingPhases.any(
          (phase) => phase.priceAmountMicros == 0,
        );
        if (hasFreePhase) return offer.offerIdToken;
      }
    }

    if (basePlanId != null) {
      return matchingOffers.first.offerIdToken;
    }

    return matchingOffers.first.offerIdToken;
  }
}

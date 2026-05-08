import 'dart:async';

import 'package:flutter/foundation.dart';
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
      _error = 'Google Play Billing indisponível neste dispositivo.';
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
          'Produto não encontrado. Confirme se o app instalado é da Play Store (teste interno) '
          'e se o ID `$productId` está ativo.';
      _product = null;
      _setLoading(false);
      return;
    }

    _product = response.productDetails.first;

    // Pré-seleção do base plan (não obrigatório, só valida que existe)
    if (basePlanId != null) {
      final token = _tryResolveOfferToken(_product!, basePlanId: basePlanId);
      if (token == null) {
        // Não bloqueia compra; apenas ajuda no debug.
        _error =
            'Oferta do base plan `$basePlanId` não encontrada no produto `$productId`. '
            'Vou tentar comprar com a 1ª oferta disponível.';
      }
    }

    _setLoading(false);
  }

  /// Inicia compra da assinatura para o produto carregado.
  Future<void> buySubscription({String? basePlanId}) async {
    if (!_available) {
      _error = 'Billing indisponível.';
      notifyListeners();
      return;
    }
    final p = _product;
    if (p == null) {
      _error = 'Produto ainda não carregou.';
      notifyListeners();
      return;
    }

    _error = null;
    notifyListeners();

    final offerToken = basePlanId == null
        ? _tryResolveOfferToken(p)
        : _tryResolveOfferToken(p, basePlanId: basePlanId) ??
            _tryResolveOfferToken(p);

    final param = PurchaseParam(
      productDetails: p,
      applicationUserName: null,
    );

    // Para assinaturas no Android, o offerToken é essencial quando existe.
    // O plugin aceita via GooglePlayPurchaseParam.
    final purchaseParam = (offerToken == null)
        ? param
        : GooglePlayPurchaseParam(
            productDetails: p,
            offerToken: offerToken,
            applicationUserName: null,
          );

    _setLoading(true);
    final ok = await _iap.buyNonConsumable(purchaseParam: purchaseParam);
    if (!ok) {
      _error = 'Não foi possível iniciar a compra.';
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
    }
    _setLoading(false);
  }

  void _setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  /// Resolve o offerToken da Play (Android). Se [basePlanId] for fornecido, tenta casar.
  String? _tryResolveOfferToken(ProductDetails product, {String? basePlanId}) {
    if (product is! GooglePlayProductDetails) return null;
    final offers = product.productDetails.subscriptionOfferDetails;
    if (offers == null || offers.isEmpty) return null;

    if (basePlanId != null) {
      for (final o in offers) {
        if (o.basePlanId == basePlanId) return o.offerIdToken;
      }
    }

    return offers.first.offerIdToken;
  }
}


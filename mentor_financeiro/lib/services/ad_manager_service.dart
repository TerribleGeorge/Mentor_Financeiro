import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'subscription_provider.dart';

/// Centraliza AdMob e **nunca** carrega anúncios para Premium.
class AdManagerService {
  AdManagerService._();

  static final AdManagerService instance = AdManagerService._();

  bool _initialized = false;
  InterstitialAd? _interstitial;
  bool get isInterstitialReady => _interstitial != null;

  // IDs reais (Release)
  static const String _bannerIdAndroidRelease =
      'ca-app-pub-7012055621802916/7741318864';
  static const String _interstitialIdAndroidRelease =
      'ca-app-pub-7012055621802916/6192318462';

  // IDs de teste oficiais do Google (Debug)
  static const String _testBannerIdAndroid =
      'ca-app-pub-3940256099942544/6300978111';
  static const String _testInterstitialIdAndroid =
      'ca-app-pub-3940256099942544/1033173712';
  static const String _testNativeIdAndroid =
      'ca-app-pub-3940256099942544/2247696110';

  String get bannerUnitId =>
      kReleaseMode ? _bannerIdAndroidRelease : _testBannerIdAndroid;
  String get interstitialUnitId =>
      kReleaseMode ? _interstitialIdAndroidRelease : _testInterstitialIdAndroid;
  String get nativeUnitId => _testNativeIdAndroid; // manter teste até termos ID real nativo

  Future<void> initializeIfNeeded(SubscriptionProvider subscription) async {
    if (_initialized) return;
    if (subscription.isPremium) return;
    try {
      await MobileAds.instance.initialize();
      _initialized = true;
    } catch (e, st) {
      // Segurança técnica: falha de ads nunca pode quebrar o app.
      if (kDebugMode) {
        // Em produção, manter logs limpos.
        // ignore: avoid_print
        print('AdMob init failed: $e\n$st');
      }
      _initialized = false;
    }
  }

  Future<void> preloadInterstitial(SubscriptionProvider subscription) async {
    if (subscription.isPremium) return;
    await initializeIfNeeded(subscription);
    if (!_initialized) return;
    if (_interstitial != null) return;

    try {
      await InterstitialAd.load(
        adUnitId: interstitialUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitial = ad;
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                _interstitial = null;
                // carrega o próximo assim que fechar
                preloadInterstitial(subscription);
              },
              onAdFailedToShowFullScreenContent: (ad, err) {
                ad.dispose();
                _interstitial = null;
                preloadInterstitial(subscription);
              },
            );
          },
          onAdFailedToLoad: (err) {
            _interstitial = null;
          },
        ),
      );
    } catch (_) {
      _interstitial = null;
    }
  }

  /// Mostra intersticial **se houver** (momento de pausa).
  /// Falhas: ignora silenciosamente.
  Future<void> showInterstitialIfAvailable(
    SubscriptionProvider subscription, {
    VoidCallback? onDismissed,
  }) async {
    if (subscription.isPremium) {
      onDismissed?.call();
      return;
    }
    await initializeIfNeeded(subscription);
    if (!_initialized) {
      onDismissed?.call();
      return;
    }

    final ad = _interstitial;
    if (ad == null) {
      // fire-and-forget
      preloadInterstitial(subscription);
      onDismissed?.call();
      return;
    }

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _interstitial = null;
        onDismissed?.call();
        preloadInterstitial(subscription);
      },
      onAdFailedToShowFullScreenContent: (ad, err) {
        ad.dispose();
        _interstitial = null;
        onDismissed?.call();
        preloadInterstitial(subscription);
      },
    );

    try {
      await ad.show();
    } catch (_) {
      _interstitial = null;
      onDismissed?.call();
    }
  }
}


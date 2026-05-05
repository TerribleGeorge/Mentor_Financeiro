import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../services/ad_manager_service.dart';
import '../../services/subscription_provider.dart';
import 'ad_conversion_cta.dart';

class NativeAdCard extends StatefulWidget {
  const NativeAdCard({super.key});

  @override
  State<NativeAdCard> createState() => _NativeAdCardState();
}

class _NativeAdCardState extends State<NativeAdCard> {
  NativeAd? _ad;
  bool _loaded = false;
  bool _failed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _load();
  }

  Future<void> _load() async {
    if (_ad != null || _failed) return;
    final subscription = context.read<SubscriptionProvider>();
    if (subscription.isPremium) return;
    await AdManagerService.instance.initializeIfNeeded(subscription);

    final ad = NativeAd(
      adUnitId: AdManagerService.instance.nativeUnitId,
      factoryId: 'mentorNative',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;
          setState(() {
            _loaded = true;
            _ad = ad as NativeAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          if (!mounted) return;
          setState(() => _failed = true);
        },
      ),
    );

    try {
      await ad.load();
    } catch (_) {
      ad.dispose();
      if (mounted) setState(() => _failed = true);
    }
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subscription = context.watch<SubscriptionProvider>();
    if (subscription.isPremium) return const SizedBox.shrink();
    if (_failed || !_loaded || _ad == null) return const SizedBox.shrink();

    // O layout real vem da NativeAdFactory (Android) / PlatformView. Caso falhe, shrink.
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardTheme.color?.withValues(alpha: 0.85) ??
            const Color(0xFF1E293B),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 110, child: AdWidget(ad: _ad!)),
          const AdConversionCta(),
        ],
      ),
    );
  }
}


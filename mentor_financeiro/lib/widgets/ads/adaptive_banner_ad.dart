import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../services/ad_manager_service.dart';
import '../../services/subscription_provider.dart';
import 'ad_conversion_cta.dart';

class AdaptiveBannerAd extends StatefulWidget {
  const AdaptiveBannerAd({super.key});

  @override
  State<AdaptiveBannerAd> createState() => _AdaptiveBannerAdState();
}

class _AdaptiveBannerAdState extends State<AdaptiveBannerAd> {
  BannerAd? _banner;
  AdSize? _size;
  bool _failed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ensureLoaded();
  }

  Future<void> _ensureLoaded() async {
    if (_banner != null || _failed) return;
    final subscription = context.read<SubscriptionProvider>();
    if (!subscription.isPremium) {
      // ok
    } else {
      return;
    }

    await AdManagerService.instance.initializeIfNeeded(subscription);

    if (!mounted) return;
    final width = MediaQuery.sizeOf(context).width.truncate();
    final orientation = MediaQuery.orientationOf(context);
    final anchored = await AdSize.getAnchoredAdaptiveBannerAdSize(
      orientation,
      width,
    );
    if (!mounted) return;
    if (anchored == null) {
      setState(() => _failed = true);
      return;
    }

    late final BannerAd banner;
    banner = BannerAd(
      adUnitId: AdManagerService.instance.bannerUnitId,
      size: anchored,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (!mounted) return;
          setState(() {
            _banner = banner;
            _size = anchored;
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
      await banner.load();
    } catch (_) {
      banner.dispose();
      if (mounted) setState(() => _failed = true);
    }
  }

  @override
  void dispose() {
    _banner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subscription = context.watch<SubscriptionProvider>();
    if (!subscription.isPremium) {
      // ok
    } else {
      return const SizedBox.shrink();
    }
    if (_failed) return const SizedBox.shrink();
    final banner = _banner;
    final size = _size;
    if (banner == null || size == null) return const SizedBox.shrink();

    final fill = Theme.of(context).cardTheme.color ?? const Color(0xFF0A0A0A);
    return Container(
      color: fill,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size.width.toDouble(),
              height: size.height.toDouble(),
              child: AdWidget(ad: banner),
            ),
            const AdConversionCta(),
          ],
        ),
      ),
    );
  }
}


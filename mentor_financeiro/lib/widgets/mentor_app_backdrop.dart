import 'dart:ui';

import 'package:flutter/material.dart';

import '../services/app_theme_controller.dart';

/// Fundo global: imagem → blur (glass) → gradientes por tema → conteúdo.
class MentorAppBackdrop extends StatelessWidget {
  const MentorAppBackdrop({super.key, required this.child});

  final Widget? child;

  /// Estética universal DevVoid (Void): fundo preto absoluto + arte 4K cover.
  static const String _preferredBgAsset = 'assets/images/image_5.png';
  static const String _fallbackBgAsset = 'assets/images/bg_cyber.png';

  static Future<String> _resolveBgAsset(BuildContext context) async {
    try {
      final manifest =
          await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
      if (manifest.contains(_preferredBgAsset)) return _preferredBgAsset;
    } catch (_) {
      // ignore: fallback below
    }
    return _fallbackBgAsset;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppThemeController.instance,
      builder: (context, _) {
        return FutureBuilder<String>(
          future: _resolveBgAsset(context),
          builder: (context, snap) {
            final asset = snap.data ?? _fallbackBgAsset;
            return Stack(
              fit: StackFit.expand,
              children: [
                const Positioned.fill(child: ColoredBox(color: Colors.black)),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(asset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                      child: Container(
                        // Nunca clarear o fundo: só escurece e dá contraste para texto neon.
                        color: Colors.black.withValues(alpha: 0.28),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF000000).withValues(alpha: 0.65),
                          const Color(0xFF07121B).withValues(alpha: 0.25),
                          const Color(0xFF000000).withValues(alpha: 0.55),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: child ?? const SizedBox.shrink(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

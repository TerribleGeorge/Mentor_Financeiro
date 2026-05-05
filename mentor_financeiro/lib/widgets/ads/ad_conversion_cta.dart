import 'package:flutter/material.dart';

import '../../pages/paywall_screen.dart';

class AdConversionCta extends StatelessWidget {
  const AdConversionCta({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Align(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
          ),
          child: Text(
            'Remova os anúncios e libere a Mentoria Completa. Seja Premium.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: scheme.primary.withValues(alpha: 0.95),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}


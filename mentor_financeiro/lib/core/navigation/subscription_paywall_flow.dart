import 'package:flutter/material.dart';

import '../../pages/paywall_screen.dart';
import '../../services/subscription_provider.dart';

/// Abre [PaywallScreen] e sincroniza estado via [SubscriptionProvider.refreshStatus].
///
/// Devolve `true` se [SubscriptionProvider.hasUnlockedPremium] após sincronizar.
Future<bool> presentPaywallAndRefresh(
  BuildContext context,
  SubscriptionProvider subscription,
) async {
  try {
    subscription.clearErrorMessage();
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
    );
    if (!context.mounted) return false;
    await subscription.refreshStatus();
    if (!context.mounted) return false;
    return subscription.hasUnlockedPremium;
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível abrir a assinatura agora.'),
        ),
      );
    }
    return false;
  }
}

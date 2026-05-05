import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/paywall_screen.dart';
import '../services/revenue_cat_bootstrap.dart';
import '../services/subscription_provider.dart';

/// Modal para o tema Cyber: paywall + compra mensal (sandbox Google Play) via RevenueCat.
abstract final class PremiumCyberPaywallDialog {
  static Future<void> show(BuildContext context) async {
    if (!RevenueCatBootstrap.isSdkReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Compras indisponíveis. Confirme REVENUECAT_ANDROID_API_KEY no .env e reinicie o app.',
          ),
        ),
      );
      return;
    }

    context.read<SubscriptionProvider>().clearErrorMessage();

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return Consumer<SubscriptionProvider>(
          builder: (context, sub, _) {
            final scheme = Theme.of(context).colorScheme;
            return AlertDialog(
              icon: Icon(Icons.hub_outlined, color: scheme.primary, size: 32),
              title: const Text('Tema Cyber — Premium'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'O tema Cyber faz parte da assinatura. Ao subscrever o plano '
                      'mensal, o entitlement premium é activado no RevenueCat (teste '
                      'no sandbox da Play Store).',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (sub.isLoading) ...[
                      const SizedBox(height: 20),
                      const Center(child: CircularProgressIndicator()),
                    ],
                    if (sub.errorMessage != null &&
                        sub.errorMessage!.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        sub.errorMessage!,
                        style: TextStyle(
                          color: scheme.error,
                          fontSize: 13,
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: sub.isLoading
                          ? null
                          : () async {
                              final ok = await sub.purchaseMonthly();
                              if (!dialogContext.mounted) return;
                              Navigator.of(dialogContext).pop();
                              if (!context.mounted) return;
                              if (ok) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Assinatura activa. Escolha o tema Cyber acima.',
                                    ),
                                  ),
                                );
                              }
                            },
                      icon: const Icon(Icons.shopping_cart_checkout_outlined),
                      label: const Text('Subscrever plano mensal'),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: sub.isLoading
                          ? null
                          : () {
                              Navigator.of(dialogContext).pop();
                              Navigator.of(context).push<void>(
                                MaterialPageRoute<void>(
                                  builder: (_) => const PaywallScreen(),
                                ),
                              );
                            },
                      child: const Text('Ver todos os planos (paywall completo)'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed:
                      sub.isLoading ? null : () => Navigator.of(dialogContext).pop(),
                  child: const Text('Fechar'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/paywall_screen.dart';
import '../services/subscription_provider.dart';

/// Modal para o tema Cyber: atalho para paywall / Play Store.
abstract final class PremiumCyberPaywallDialog {
  static Future<void> show(BuildContext context) async {
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
                      'O tema Cyber faz parte da assinatura Premium. A subscrição é feita na '
                      'Google Play; depois o estado Premium deve estar reflectido no teu perfil.',
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
                        style: TextStyle(color: scheme.error, fontSize: 13),
                      ),
                    ],
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: sub.isLoading
                          ? null
                          : () async {
                              final ok = await sub.openPlayStoreListing();
                              if (!dialogContext.mounted) return;
                              Navigator.of(dialogContext).pop();
                              if (!context.mounted) return;
                              if (ok) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Na Play Store, subscreve o Premium. Depois actualiza o perfil ou reinicia o app.',
                                    ),
                                  ),
                                );
                              }
                            },
                      icon: const Icon(Icons.storefront_outlined),
                      label: const Text('Abrir Play Store'),
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
                      child: const Text('Ver ecrã de assinatura'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: sub.isLoading
                      ? null
                      : () => Navigator.of(dialogContext).pop(),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/subscription_provider.dart';

/// Gestão de subscrição via Google Play (sem RevenueCat).
class CustomerCenterScreen extends StatelessWidget {
  const CustomerCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Gerir assinatura')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Consumer<SubscriptionProvider>(
            builder: (context, sub, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    sub.isPremium
                        ? 'Conta com Premium activo neste perfil.'
                        : 'Sem Premium neste perfil. Subscrições são tratadas na Google Play.',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () => sub.openManageSubscriptions(),
                    icon: const Icon(Icons.subscriptions_outlined),
                    label: const Text('Gerir subscrições na Play'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: sub.isLoading
                        ? null
                        : () => sub.purchaseMonthly(),
                    icon: const Icon(Icons.workspace_premium_outlined),
                    label: const Text('Assinar Premium mensal'),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.tonal(
                    onPressed: sub.isLoading
                        ? null
                        : () async {
                            await sub.restorePurchases();
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  sub.isPremium
                                      ? 'Estado actualizado.'
                                      : 'Perfil recarregado.',
                                ),
                              ),
                            );
                          },
                    child: sub.isLoading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Actualizar estado no app'),
                  ),
                  if (sub.errorMessage != null &&
                      sub.errorMessage!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      sub.errorMessage!,
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

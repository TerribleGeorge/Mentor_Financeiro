import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/locale_ui_strings.dart';
import '../services/subscription_provider.dart';

/// Gestão de subscrição via Google Play (sem RevenueCat).
class CustomerCenterScreen extends StatelessWidget {
  const CustomerCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = LocaleUiStrings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings.text(
            'Gerir assinatura',
            en: 'Manage subscription',
            es: 'Gestionar suscripción',
          ),
        ),
      ),
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
                        ? strings.text(
                            'Conta com Premium activo neste perfil.',
                            en: 'Premium is active on this profile.',
                            es: 'Premium está activo en este perfil.',
                          )
                        : strings.text(
                            'Sem Premium neste perfil. Subscrições são tratadas na Google Play.',
                            en: 'No Premium on this profile. Subscriptions are handled by Google Play.',
                            es: 'Sin Premium en este perfil. Las suscripciones se gestionan en Google Play.',
                          ),
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () => sub.openManageSubscriptions(),
                    icon: const Icon(Icons.subscriptions_outlined),
                    label: Text(
                      strings.text(
                        'Gerir subscrições na Play',
                        en: 'Manage subscriptions on Play',
                        es: 'Gestionar suscripciones en Play',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: sub.isLoading
                        ? null
                        : () => sub.purchaseMonthly(),
                    icon: const Icon(Icons.workspace_premium_outlined),
                    label: Text(
                      strings.text(
                        'Assinar Premium mensal',
                        en: 'Subscribe monthly Premium',
                        es: 'Suscribir Premium mensual',
                      ),
                    ),
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
                                      ? strings.text(
                                          'Estado actualizado.',
                                          en: 'Status updated.',
                                          es: 'Estado actualizado.',
                                        )
                                      : strings.text(
                                          'Perfil recarregado.',
                                          en: 'Profile refreshed.',
                                          es: 'Perfil recargado.',
                                        ),
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
                        : Text(
                            strings.text(
                              'Actualizar estado no app',
                              en: 'Refresh app status',
                              es: 'Actualizar estado en la app',
                            ),
                          ),
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

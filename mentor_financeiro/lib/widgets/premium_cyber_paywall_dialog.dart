import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/paywall_screen.dart';
import '../services/locale_ui_strings.dart';
import '../services/subscription_provider.dart';

/// Modal para o tema Cyber: atalho para paywall / Google Play Billing.
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
            final strings = LocaleUiStrings.of(context);
            return AlertDialog(
              icon: Icon(Icons.hub_outlined, color: scheme.primary, size: 32),
              title: Text(
                strings.text(
                  'Tema Cyber — Premium',
                  en: 'Cyber Theme — Premium',
                  es: 'Tema Cyber — Premium',
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      strings.text(
                        'O tema Cyber faz parte da assinatura Premium. A subscrição é feita pela Google Play dentro do app.',
                        en: 'The Cyber theme is part of the Premium subscription. Subscription is handled by Google Play inside the app.',
                        es: 'El tema Cyber forma parte de la suscripción Premium. La suscripción se realiza por Google Play dentro de la app.',
                      ),
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
                              final ok = await sub.purchaseMonthly();
                              if (!dialogContext.mounted) return;
                              Navigator.of(dialogContext).pop();
                              if (!context.mounted) return;
                              if (ok) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'A compra foi enviada para a Google Play.',
                                    ),
                                  ),
                                );
                              }
                            },
                      icon: const Icon(Icons.workspace_premium_outlined),
                      label: Text(
                        strings.text(
                          'Assinar mensal',
                          en: 'Subscribe monthly',
                          es: 'Suscribir mensual',
                        ),
                      ),
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
                      child: Text(
                        strings.text(
                          'Ver ecrã de assinatura',
                          en: 'View subscription screen',
                          es: 'Ver pantalla de suscripción',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: sub.isLoading
                      ? null
                      : () => Navigator.of(dialogContext).pop(),
                  child: Text(
                    strings.text('Fechar', en: 'Close', es: 'Cerrar'),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

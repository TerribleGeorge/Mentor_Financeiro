import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/subscription_constants.dart';
import '../services/subscription_provider.dart';

/// Assinatura: benefícios locais + abertura da Play Store (produtos na Play Console).
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localeTag = Localizations.localeOf(context).languageCode;

    return Scaffold(
      appBar: AppBar(title: const Text('Assinatura')),
      body: SafeArea(
        child: Consumer<SubscriptionProvider>(
          builder: (context, sub, _) {
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              children: [
                Text(
                  'O Premium inclui período de teste gratuito quando a Google Play o oferecer para novos subscritores. '
                  'Preços e datas de cobrança aparecem na loja.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 18),
                _PremiumBenefitsCard(
                  benefits: SubscriptionConstants.getBenefitsForLocale(
                    localeTag,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Referência na app (fallback)',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Mensal: ${sub.getFormattedPrice('monthly')}',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  'Anual: ${sub.getFormattedPrice('yearly')}',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Os valores cobrados são sempre os da Play Store na tua região.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                  ),
                ),
                const SizedBox(height: 28),
                FilledButton.icon(
                  onPressed: () async {
                    final ok = await sub.openPlayStoreListing();
                    if (!context.mounted || !ok) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Depois de subscrever na Play, toca em «Actualizar perfil» ou reinicia o app.',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: const Text('Abrir Play Store — Mentor Financeiro'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () async {
                    await sub.openManageSubscriptions();
                  },
                  icon: const Icon(Icons.manage_accounts_outlined),
                  label: const Text('Gerir subscrições na conta Google'),
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
                                    ? 'Estado actualizado: Premium activo.'
                                    : 'Perfil actualizado. Se já pagaste na Play, o servidor precisa marcar isPremium (Firestore / backend).',
                              ),
                            ),
                          );
                          if (sub.isPremium && context.mounted) {
                            Navigator.of(context).maybePop();
                          }
                        },
                  child: sub.isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Actualizar perfil / estado Premium'),
                ),
                if (sub.errorMessage != null &&
                    sub.errorMessage!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    sub.errorMessage!,
                    style: TextStyle(
                      color: theme.colorScheme.error,
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PremiumBenefitsCard extends StatelessWidget {
  const _PremiumBenefitsCard({required this.benefits});

  final List<String> benefits;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.22),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'O que o Premium liberta',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            ...benefits.map(
              (benefit) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(benefit, style: theme.textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Sem promessa de consultoria individual, suporte 24h ou resultado financeiro garantido.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.68),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

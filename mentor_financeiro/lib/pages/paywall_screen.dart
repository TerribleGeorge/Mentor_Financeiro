import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/subscription_constants.dart';
import '../services/subscription_provider.dart';

/// Assinatura: benefícios locais + compra pelo Google Play Billing.
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localeTag = Localizations.localeOf(context).languageCode;
    final trialHeadline = SubscriptionConstants.freeTrialHeadlineForLocale(
      localeTag,
    );
    final trialDisclaimer = SubscriptionConstants.freeTrialDisclaimerForLocale(
      localeTag,
    );
    final trialCta = SubscriptionConstants.freeTrialCtaForLocale(localeTag);

    return Scaffold(
      appBar: AppBar(title: const Text('Assinatura')),
      body: SafeArea(
        child: Consumer<SubscriptionProvider>(
          builder: (context, sub, _) {
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              children: [
                Text(
                  'O Premium é processado pela Google Play. A confirmação da compra acontece dentro do app.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 14),
                _FreeTrialCard(
                  title: trialHeadline,
                  disclaimer: trialDisclaimer,
                ),
                const SizedBox(height: 18),
                _PremiumBenefitsCard(
                  benefits: SubscriptionConstants.getBenefitsForLocale(
                    localeTag,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Valores da assinatura',
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
                  onPressed: sub.isLoading
                      ? null
                      : () async {
                          final ok = await sub.purchaseMonthly();
                          if (!context.mounted) return;
                          _showPurchaseResult(
                            context,
                            ok,
                            fallbackMessage:
                                'Não foi possível abrir a compra mensal agora.',
                          );
                        },
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: Text(trialCta),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: sub.isLoading
                      ? null
                      : () async {
                          final ok = await sub.purchaseYearly();
                          if (!context.mounted) return;
                          _showPurchaseResult(
                            context,
                            ok,
                            fallbackMessage:
                                'Não foi possível abrir a compra anual agora.',
                          );
                        },
                  icon: const Icon(Icons.workspace_premium_outlined),
                  label: const Text('Assinar plano anual por R\$ 99,90'),
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
                                    : 'Nenhuma assinatura ativa foi encontrada na Google Play.',
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

  void _showPurchaseResult(
    BuildContext context,
    bool ok, {
    required String fallbackMessage,
  }) {
    if (!context.mounted) return;
    final sub = context.read<SubscriptionProvider>();
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            ok
                ? 'A compra foi enviada para a Google Play.'
                : (sub.errorMessage?.trim().isNotEmpty == true
                      ? sub.errorMessage!.trim()
                      : fallbackMessage),
          ),
        ),
      );
  }
}

class _FreeTrialCard extends StatelessWidget {
  const _FreeTrialCard({required this.title, required this.disclaimer});

  final String title;
  final String disclaimer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.redeem_outlined, color: scheme.primary, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  disclaimer,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.72),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
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

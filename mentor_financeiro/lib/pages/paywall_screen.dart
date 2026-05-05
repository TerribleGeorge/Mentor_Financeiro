import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import '../constants/revenue_cat_constants.dart';
import '../services/revenue_cat_bootstrap.dart';
import '../services/revenue_cat_subscription_service.dart';
import '../services/subscription_provider.dart';

/// Paywall nativo RevenueCat ([PaywallView]) + opção de modal [RevenueCatUI.presentPaywallIfNeeded].
class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  Future<Offerings?>? _offeringsFuture;

  @override
  void initState() {
    super.initState();
    _offeringsFuture = _loadOfferings();
  }

  Future<Offerings?> _loadOfferings() async {
    if (!RevenueCatBootstrap.isSdkReady) return null;
    try {
      return await Purchases.getOfferings();
    } catch (e, st) {
      debugPrint('PaywallScreen offerings: $e\n$st');
      return null;
    }
  }

  Future<void> _presentModalPaywall() async {
    if (!RevenueCatBootstrap.isSdkReady) return;
    final result = await RevenueCatUI.presentPaywallIfNeeded(
      RevenueCatConstants.paywallTargetEntitlementId,
    );
    if (!mounted) return;
    if (result == PaywallResult.purchased || result == PaywallResult.restored) {
      await context.read<SubscriptionProvider>().refreshFromRevenueCat();
      if (mounted) Navigator.of(context).maybePop();
    }
    if (result == PaywallResult.error && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível apresentar o paywall.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!RevenueCatBootstrap.isSdkReady) {
      return Scaffold(
        appBar: AppBar(title: const Text('Mentor Pro')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Compras indisponíveis: configure REVENUECAT_ANDROID_API_KEY no .env '
              'e crie no RevenueCat os entitlements (ex.: premium, cyber) ou ajuste '
              'RevenueCatConstants.paywallTargetEntitlementId.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      );
    }

    return FutureBuilder<Offerings?>(
      future: _offeringsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final offerings = snapshot.data;
        final offering =
            RevenueCatSubscriptionService.resolvePrimaryOffering(offerings);

        if (snapshot.hasError || offerings == null || offering == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Mentor Pro')),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.hasError
                          ? 'Erro ao carregar ofertas: ${snapshot.error}'
                          : 'Nenhuma offering "current" no RevenueCat. Crie uma offering '
                              'com pacotes monthly / yearly / lifetime.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          _offeringsFuture = _loadOfferings();
                        });
                      },
                      child: const Text('Tentar novamente'),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: _presentModalPaywall,
                      child: const Text('Abrir paywall modal (nativo)'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Mentor Pro'),
            actions: [
              TextButton(
                onPressed: _presentModalPaywall,
                child: const Text('Modal'),
              ),
            ],
          ),
          body: SafeArea(
            child: PaywallView(
              offering: offering,
              displayCloseButton: true,
              onPurchaseCompleted: (customerInfo, storeTransaction) async {
                await context.read<SubscriptionProvider>().refreshFromRevenueCat();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Compra concluída. Obrigado!'),
                    ),
                  );
                  Navigator.of(context).maybePop();
                }
              },
              onPurchaseError: (PurchasesError error) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error.message.isNotEmpty ? error.message : 'Erro na compra',
                    ),
                  ),
                );
              },
              onRestoreCompleted: (customerInfo) async {
                await context.read<SubscriptionProvider>().refreshFromRevenueCat();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Restauro concluído.')),
                );
                Navigator.of(context).maybePop();
              },
              onRestoreError: (error) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error.message.isNotEmpty ? error.message : 'Erro ao restaurar',
                    ),
                  ),
                );
              },
              onDismiss: () => Navigator.of(context).maybePop(),
            ),
          ),
        );
      },
    );
  }
}

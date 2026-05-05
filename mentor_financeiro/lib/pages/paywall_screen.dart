import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../services/revenue_cat_bootstrap.dart';
import '../services/revenue_cat_subscription_service.dart';
import '../services/subscription_provider.dart';

/// Assinatura: carrega [Purchases.getOfferings] no arranque e lista pacotes com preço da loja.
class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  late Future<Offerings?> _offeringsFuture;

  /// Evita toques repetidos no mesmo pacote.
  String? _purchasingPackageIdentifier;

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
      debugPrint('PaywallScreen.getOfferings: $e\n$st');
      return null;
    }
  }

  void _reloadOfferings() {
    setState(() {
      _offeringsFuture = _loadOfferings();
    });
  }

  int _packageOrder(Package p) {
    return switch (p.packageType) {
      PackageType.weekly => 0,
      PackageType.monthly => 1,
      PackageType.twoMonth => 2,
      PackageType.threeMonth => 3,
      PackageType.sixMonth => 4,
      PackageType.annual => 5,
      PackageType.lifetime => 6,
      _ => 99,
    };
  }

  Future<void> _purchase(Package pkg) async {
    if (!RevenueCatBootstrap.isSdkReady || !mounted) return;
    setState(() => _purchasingPackageIdentifier = pkg.identifier);
    try {
      await Purchases.purchase(PurchaseParams.package(pkg));
      if (!mounted) return;
      await context.read<SubscriptionProvider>().refreshFromRevenueCat();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Compra concluída. Obrigado!')),
      );
      Navigator.of(context).maybePop();
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (!mounted) return;
      if (code != PurchasesErrorCode.purchaseCancelledError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message?.isNotEmpty == true ? e.message! : 'Erro na compra.',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _purchasingPackageIdentifier = null);
      }
    }
  }

  Future<void> _restore() async {
    final messenger = ScaffoldMessenger.of(context);
    await context.read<SubscriptionProvider>().restorePurchases();
    if (!mounted) return;
    final sub = context.read<SubscriptionProvider>();
    if (sub.hasPremiumEntitlementFromRevenueCat) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Compras restauradas.')),
      );
      Navigator.of(context).maybePop();
    } else if (sub.errorMessage != null && sub.errorMessage!.isNotEmpty) {
      messenger.showSnackBar(SnackBar(content: Text(sub.errorMessage!)));
    }
  }

  static const String _emptyOfferingsMessage =
      'Não foi possível carregar as ofertas no momento. Verifique sua conexão';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!RevenueCatBootstrap.isSdkReady) {
      return Scaffold(
        appBar: AppBar(title: const Text('Assinatura')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Compras indisponíveis: configure REVENUECAT_ANDROID_API_KEY no .env '
              'e o entitlement `premium` no RevenueCat.',
              textAlign: TextAlign.center,
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assinatura'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reloadOfferings,
            tooltip: 'Atualizar',
          ),
        ],
      ),
      body: FutureBuilder<Offerings?>(
        future: _offeringsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(
                    'A carregar ofertas…',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            );
          }

          final offerings = snapshot.data;
          final offering =
              RevenueCatSubscriptionService.resolvePrimaryOffering(offerings);
          final packages = offering?.availablePackages ?? const <Package>[];

          if (packages.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_off_outlined,
                      size: 56,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _emptyOfferingsMessage,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: _reloadOfferings,
                      child: const Text('Tentar novamente'),
                    ),
                  ],
                ),
              ),
            );
          }

          final sorted = List<Package>.from(packages)
            ..sort((a, b) => _packageOrder(a).compareTo(_packageOrder(b)));

          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    itemCount: sorted.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                final pkg = sorted[index];
                final product = pkg.storeProduct;
                final title = product.title.trim().isNotEmpty
                    ? product.title
                    : 'Plano Premium';
                final description = product.description.trim().isNotEmpty
                    ? product.description
                    : 'Inclui todos os temas premium e benefícios Mentor Pro.';
                final busy = _purchasingPackageIdentifier == pkg.identifier;

                return Card(
                  elevation: 0,
                  color: theme.colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.35,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.priceString,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.85,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: busy
                              ? null
                              : () => _purchase(pkg),
                          child: busy
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Subscrever'),
                        ),
                      ],
                    ),
                  ),
                );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: Consumer<SubscriptionProvider>(
                    builder: (context, sub, _) {
                      return TextButton(
                        onPressed: sub.isLoading ? null : _restore,
                        child: const Text('Restaurar compras'),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

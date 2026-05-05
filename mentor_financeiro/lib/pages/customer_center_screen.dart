import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/models/purchases_error.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import '../services/revenue_cat_bootstrap.dart';
import '../services/subscription_provider.dart';

/// Customer Center RevenueCat (gestão de subscrição, restauro, suporte).
///
/// Requer SDK configurado e Customer Center ativado no dashboard RevenueCat.
class CustomerCenterScreen extends StatelessWidget {
  const CustomerCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!RevenueCatBootstrap.isSdkReady) {
      return Scaffold(
        appBar: AppBar(title: const Text('Assinatura')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Centro de cliente indisponível: RevenueCat não está configurado.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerir assinatura'),
        actions: [
          TextButton(
            onPressed: () async {
              await RevenueCatUI.presentCustomerCenter(
                onRestoreCompleted: (CustomerInfo customerInfo) {
                  context.read<SubscriptionProvider>().refreshFromRevenueCat();
                },
                onRestoreFailed: (PurchasesError error) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error.message)),
                  );
                },
              );
            },
            child: const Text('Modal nativo'),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomerCenterView(
          onDismiss: () => Navigator.of(context).maybePop(),
          onRestoreCompleted: (customerInfo) {
            context.read<SubscriptionProvider>().refreshFromRevenueCat();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Restauro concluído.')),
            );
          },
          onRestoreFailed: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.message)),
            );
          },
        ),
      ),
    );
  }
}

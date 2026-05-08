import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/investment_category_provider.dart';
import '../services/subscription_provider.dart';

/// Mantém [SubscriptionProvider] e país do catálogo alinhados ao login Firebase,
/// sem RevenueCat.
class AuthSubscriptionSync extends StatefulWidget {
  const AuthSubscriptionSync({required this.child, super.key});

  final Widget child;

  @override
  State<AuthSubscriptionSync> createState() => _AuthSubscriptionSyncState();
}

class _AuthSubscriptionSyncState extends State<AuthSubscriptionSync> {
  StreamSubscription<User?>? _authSub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(
        context.read<InvestmentCategoryProvider>().syncStorefrontFromDeviceLocale(),
      );
      unawaited(context.read<SubscriptionProvider>().refreshStatus());
      _authSub = FirebaseAuth.instance.authStateChanges().listen((_) async {
        if (!mounted) return;
        await context
            .read<InvestmentCategoryProvider>()
            .syncStorefrontFromDeviceLocale();
        if (!mounted) return;
        await context.read<SubscriptionProvider>().refreshStatus();
      });
    });
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

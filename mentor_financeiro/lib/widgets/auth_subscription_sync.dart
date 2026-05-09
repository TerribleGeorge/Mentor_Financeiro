import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/investment_category_provider.dart';
import '../services/subscription_provider.dart';
import '../services/user_data_retention_service.dart';

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
      final investmentProvider = context.read<InvestmentCategoryProvider>();
      final subscriptionProvider = context.read<SubscriptionProvider>();
      unawaited(investmentProvider.syncStorefrontFromDeviceLocale());
      unawaited(subscriptionProvider.refreshStatus());
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        unawaited(_syncRetentionForUser(reason: 'initial_auth'));
      }
      _authSub = FirebaseAuth.instance.authStateChanges().listen((user) async {
        if (!mounted) return;
        if (user != null) {
          await UserDataRetentionService.instance.restoreIfNeeded();
        }
        await investmentProvider.syncStorefrontFromDeviceLocale();
        if (!mounted) return;
        await subscriptionProvider.refreshStatus();
        if (user != null) {
          unawaited(
            UserDataRetentionService.instance.backupNow(reason: 'auth_state'),
          );
        }
      });
    });
  }

  Future<void> _syncRetentionForUser({required String reason}) async {
    await UserDataRetentionService.instance.restoreIfNeeded();
    await UserDataRetentionService.instance.backupNow(reason: reason);
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

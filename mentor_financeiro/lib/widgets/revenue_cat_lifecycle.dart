import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:provider/provider.dart';

import '../services/revenue_cat_bootstrap.dart';
import '../services/subscription_provider.dart';

/// Liga [FirebaseAuth.authStateChanges] a [Purchases.logIn]/[Purchases.logOut] e regista
/// o listener de [CustomerInfo] para atualizar [SubscriptionProvider] e o tema em tempo real.
class RevenueCatLifecycle extends StatefulWidget {
  const RevenueCatLifecycle({required this.child, super.key});

  final Widget child;

  @override
  State<RevenueCatLifecycle> createState() => _RevenueCatLifecycleState();
}

class _RevenueCatLifecycleState extends State<RevenueCatLifecycle> {
  StreamSubscription<User?>? _authSub;
  CustomerInfoUpdateListener? _customerListener;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _attach());
  }

  void _attach() {
    if (!mounted || !RevenueCatBootstrap.isSdkReady) return;

    final subscription = context.read<SubscriptionProvider>();

    _customerListener = (CustomerInfo info) {
      unawaited(subscription.applyCustomerInfo(info));
    };
    Purchases.addCustomerInfoUpdateListener(_customerListener!);

    if (Firebase.apps.isEmpty) return;

    _authSub = FirebaseAuth.instance.authStateChanges().listen((user) async {
      await RevenueCatBootstrap.syncFirebaseUser(user?.uid);
      if (!mounted) return;
      await context.read<SubscriptionProvider>().refreshFromRevenueCat();
    });
  }

  @override
  void dispose() {
    _authSub?.cancel();
    if (_customerListener != null) {
      Purchases.removeCustomerInfoUpdateListener(_customerListener!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

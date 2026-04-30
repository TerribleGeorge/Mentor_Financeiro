import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/paywall_screen.dart';
import '../services/subscription_provider.dart';

class PremiumWrapper extends StatelessWidget {
  final Widget child;
  final String feature;
  final bool requiresPremium;

  const PremiumWrapper({
    super.key,
    required this.child,
    required this.feature,
    this.requiresPremium = true,
  });

  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    if (!subscriptionProvider.isPremium && requiresPremium) {
      return _buildLockedFeature(context);
    }

    return child;
  }

  Widget _buildLockedFeature(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPremiumDialog(context),
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A).withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF00D9FF).withValues(alpha: 0.55),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock, color: Color(0xFF00D9FF), size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Premium',
                    style: TextStyle(
                      color: Color(0xFF00D9FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPremiumDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.diamond, color: Color(0xFF00D9FF)),
            SizedBox(width: 12),
            Text('Recurso Premium', style: TextStyle(color: Colors.white)),
          ],
        ),
        content: Text(
          'Para acessar "$feature", você precisa ser assinante Premium.',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Agora não',
              style: TextStyle(color: Colors.white54),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PaywallScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D9FF),
            ),
            child: const Text(
              'Ver Planos',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/subscription_provider.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  bool _isYearlySelected = true;

  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);
    final benefits = subscriptionProvider.getLocalizedBenefits();
    final monthlyPrice = subscriptionProvider.getFormattedPrice('monthly');
    final yearlyPrice = subscriptionProvider.getFormattedPrice('yearly');

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1A1A2E),
                  const Color(0xFF16213E),
                  const Color(0xFF0F3460),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  _buildHeader(),
                  const SizedBox(height: 40),
                  _buildBenefitsList(benefits),
                  const SizedBox(height: 40),
                  _buildPricingSection(
                    monthlyPrice,
                    yearlyPrice,
                    subscriptionProvider,
                  ),
                  const SizedBox(height: 30),
                  _buildPurchaseButton(subscriptionProvider),
                  const SizedBox(height: 16),
                  _buildRestoreButton(subscriptionProvider),
                  const SizedBox(height: 30),
                  _buildCloseButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00D9FF).withValues(alpha: 0.4),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Icon(Icons.diamond, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 24),
        const Text(
          'MENTOR PRO',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Desbloqueie todo o potencial',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildBenefitsList(List<String> benefits) {
    return Column(
      children: benefits.asMap().entries.map((entry) {
        final index = entry.key;
        final benefit = entry.value;
        return _buildBenefitItem(benefit, index);
      }).toList(),
    );
  }

  Widget _buildBenefitItem(String text, int index) {
    final icons = [
      Icons.palette,
      Icons.image,
      Icons.candlestick_chart,
      Icons.analytics,
      Icons.psychology,
      Icons.block,
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icons[index % icons.length],
              color: const Color(0xFF00D9FF),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingSection(
    String monthlyPrice,
    String yearlyPrice,
    SubscriptionProvider provider,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildPriceCard(monthlyPrice, 'monthly', false, provider),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildPriceCard(yearlyPrice, 'yearly', true, provider),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          _isYearlySelected
              ? 'Economize 17% com o plano anual'
              : 'Faça upgrade para o anual e economize',
          style: TextStyle(
            color: const Color(0xFF00D9FF).withValues(alpha: 0.8),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceCard(
    String price,
    String type,
    bool isRecommended,
    SubscriptionProvider provider,
  ) {
    final isSelected = (type == 'yearly') == _isYearlySelected;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isYearlySelected = type == 'yearly';
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF00D9FF).withValues(alpha: 0.2)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF00D9FF)
                : Colors.white.withValues(alpha: 0.1),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            if (isRecommended)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Melhor Valor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              type == 'monthly' ? '/mês' : '/ano',
              style: const TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseButton(SubscriptionProvider provider) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D9FF).withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: provider.isLoading ? null : () => _handlePurchase(provider),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: provider.isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                _isYearlySelected ? 'Assinar Anual' : 'Assinar Mensal',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Future<void> _handlePurchase(SubscriptionProvider provider) async {
    bool success;
    if (_isYearlySelected) {
      success = await provider.purchaseYearly();
    } else {
      success = await provider.purchaseMonthly();
    }

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Assinatura ativada com sucesso!'),
          backgroundColor: const Color(0xFF00D9FF),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      Navigator.pop(context);
    } else if (provider.errorMessage != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.errorMessage!),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  Widget _buildRestoreButton(SubscriptionProvider provider) {
    return TextButton(
      onPressed: provider.isLoading ? null : () => provider.restorePurchases(),
      child: Text(
        'Restaurar compras',
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.6),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        'Agora não, talvez depois',
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.4),
          fontSize: 14,
        ),
      ),
    );
  }
}

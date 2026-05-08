import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/subscription_constants.dart';
import '../services/google_play_billing_service.dart';
import '../services/subscription_provider.dart';

class TelaUpgrade extends StatefulWidget {
  const TelaUpgrade({super.key});

  @override
  State<TelaUpgrade> createState() => _TelaUpgradeState();
}

class _TelaUpgradeState extends State<TelaUpgrade> {
  static const String _productId = 'premium_assinatura';
  static const String _basePlanId = 'a-premium';

  final GooglePlayBillingService _billing = GooglePlayBillingService.instance;

  String? _pendingPlan;
  bool _handledSuccess = false;

  @override
  void initState() {
    super.initState();
    _billing.addListener(_onBillingChanged);
    _billing.initialize(productId: _productId, basePlanId: _basePlanId);
  }

  @override
  void dispose() {
    _billing.removeListener(_onBillingChanged);
    super.dispose();
  }

  void _onBillingChanged() {
    if (!mounted) return;
    if (_billing.hasActivePurchase && !_handledSuccess) {
      _handledSuccess = true;
      unawaited(_finalizePremiumActivation(_pendingPlan ?? 'mensal'));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white70),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Mentor Premium",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.workspace_premium,
              size: 80,
              color: Color(0xFFFFD700),
            ),
            const SizedBox(height: 24),
            const Text(
              "Premium para organizar melhor seu dinheiro",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              "Recursos extras para acompanhar gastos, relatórios e gráficos com mais clareza.",
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            _beneficiosPremium(),
            const SizedBox(height: 28),
            _planoMensal(),
            const SizedBox(height: 16),
            _planoAnual(),
            if (_billing.error != null &&
                _billing.error!.trim().isNotEmpty) ...[
              const SizedBox(height: 14),
              Text(
                _billing.error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.redAccent, fontSize: 13),
              ),
            ],
            const SizedBox(height: 32),
            _botaoContinuarGratis(),
            const SizedBox(height: 24),
            _garantias(),
          ],
        ),
      ),
    );
  }

  Widget _planoMensal() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00D9FF), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Plano Mensal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Popular",
                  style: TextStyle(
                    color: Color(0xFF00D9FF),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Para quem quer acompanhar o mês com mais detalhes",
            style: TextStyle(color: Colors.white60, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("R\$", style: TextStyle(color: Colors.white, fontSize: 20)),
              const Text(
                "9",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                ",90",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const Text(
                "/mês",
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D9FF),
                foregroundColor: const Color(0xFF0F172A),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _billing.isLoading
                  ? null
                  : () => _contratarPlano("mensal"),
              child: const Text(
                "Começar Agora",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _planoAnual() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFFD700), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Plano Anual",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "MELHOR VALOR",
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Mesmos recursos premium com melhor custo no ano",
            style: TextStyle(color: Colors.white60, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("R\$", style: TextStyle(color: Colors.white, fontSize: 20)),
              const Text(
                "79",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                ",90",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const Text(
                "/ano",
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "-30%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Menos de R\$7 por mês",
            style: TextStyle(color: Colors.greenAccent, fontSize: 14),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: const Color(0xFF0F172A),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _billing.isLoading
                  ? null
                  : () => _contratarPlano("anual"),
              child: const Text(
                "Economizar 30%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoContinuarGratis() {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text(
        "Continuar com versão gratuita",
        style: TextStyle(color: Colors.white60, fontSize: 14),
      ),
    );
  }

  Widget _garantias() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _itemGarantia(Icons.lock, "Pagamento processado pela Play Store"),
          const SizedBox(height: 12),
          _itemGarantia(Icons.weekend, "Cancele quando quiser"),
          const SizedBox(height: 12),
          _itemGarantia(
            Icons.info_outline,
            "Sem consultoria individual ou promessa de resultado",
          ),
        ],
      ),
    );
  }

  Widget _beneficiosPremium() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF00D9FF).withValues(alpha: 0.35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "O que está incluso",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          ...SubscriptionConstants.premiumBenefits.map(
            (benefit) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF00D9FF),
                    size: 19,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      benefit,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
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

  Widget _itemGarantia(IconData icon, String texto) {
    return Row(
      children: [
        Icon(icon, color: Colors.white60, size: 20),
        const SizedBox(width: 12),
        Text(
          texto,
          style: const TextStyle(color: Colors.white60, fontSize: 14),
        ),
      ],
    );
  }

  Future<void> _contratarPlano(String plano) async {
    _pendingPlan = plano;
    _handledSuccess = false;
    await _billing.buySubscription(basePlanId: _basePlanId);
  }

  Future<void> _finalizePremiumActivation(String plano) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('plano_contratado', plano);
    await prefs.setBool('is_premium', true);

    // Mantém compatibilidade com o restante do app (temas/premium gate).
    if (mounted) {
      await context.read<SubscriptionProvider>().updatePremiumStatus(true);
    }

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          plano == "mensal"
              ? "Assinatura ativa! Bem-vindo ao Premium!"
              : "Assinatura ativa! Premium liberado.",
        ),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }
}

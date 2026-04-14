import 'package:flutter/material.dart';

class TesouroDiretoDetailPage extends StatelessWidget {
  const TesouroDiretoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Guia: Tesouro Direto',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildSection(
              icon: Icons.info_outline,
              title: 'O que é?',
              content:
                  'É um programa do Tesouro Nacional para compra de títulos públicos por pessoas físicas. Você empresta dinheiro ao Governo Federal em troca de juros. É o investimento de menor risco de crédito no Brasil.',
            ),
            _buildSection(
              icon: Icons.list_alt,
              title: 'Tipos de Títulos',
              content:
                  '• Tesouro Selic: Ideal para Reserva de Emergência (pós-fixado).\n\n• Tesouro IPCA+: Proteção contra inflação (híbrido).\n\n• Tesouro Prefixado: Taxa fixa garantida.\n\n• Tesouro RendA+ e EdukA+: Focados em aposentadoria e educação.',
            ),
            _buildSection(
              icon: Icons.speed,
              title: 'Rentabilidade e Liquidez',
              content:
                  'Rentabilidade varia por título.\n\nLiquidez é D+0 (resgate no mesmo dia em horário comercial).',
            ),
            _buildSection(
              icon: Icons.security,
              title: 'Riscos e Segurança',
              content:
                  'Risco Soberano (baixíssimo).\n\nAtenção à "Marcação a Mercado" nos títulos IPCA e Prefixados se resgatar antes do vencimento.',
            ),
            _buildSection(
              icon: Icons.local_atm,
              title: 'Custos e Impostos',
              content:
                  '• Tabela Regressiva de IR (22,5% a 15% conforme o tempo).\n\n• IOF (apenas se resgatar antes de 30 dias).\n\n• Taxa de Custódia B3: 0,20% ao ano (Isento para Selic até R\$ 10 mil).',
            ),
            _buildSection(
              icon: Icons.play_circle_outline,
              title: 'Como Começar',
              content:
                  '1. Abrir conta em corretora.\n\n2. Transferir recursos.\n\n3. Escolher o título (mínimo de ~R\$ 30,00).',
            ),
            const SizedBox(height: 24),
            _buildBanner(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.withAlpha(40), Colors.indigo.withAlpha(15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.indigo.withAlpha(75), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tesouro Direto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'O investimento mais seguro do Brasil',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        collapsedIconColor: Colors.indigo,
        iconColor: Colors.indigo,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.indigo.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.indigo, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        children: [
          Text(
            content,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.withAlpha(60), Colors.indigo.withAlpha(30)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.indigo.withAlpha(100), width: 1),
      ),
      child: const Row(
        children: [
          Icon(Icons.tips_and_updates, color: Colors.white, size: 28),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Lembre-se: O Tesouro Selic é o melhor lugar para sua Reserva de Emergência.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

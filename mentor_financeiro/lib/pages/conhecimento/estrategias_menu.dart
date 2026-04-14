import 'package:flutter/material.dart';

class EstrategiasMenu extends StatelessWidget {
  const EstrategiasMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Estratégias',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExpansionTile(
            icon: Icons.shield,
            titulo: 'Reserva de Emergência',
            conteudo: _buildReservaEmergencia(),
          ),
          _buildExpansionTile(
            icon: Icons.shopping_bag,
            titulo: 'Buy & Hold',
            conteudo: _buildBuyHold(),
          ),
          _buildExpansionTile(
            icon: Icons.inventory_2,
            titulo: 'Diversificação',
            conteudo: _buildDiversificacao(),
          ),
          _buildExpansionTile(
            icon: Icons.sync,
            titulo: 'Aportes Constantes',
            conteudo: _buildAportesConstantes(),
          ),
          _buildExpansionTile(
            icon: Icons.flag,
            titulo: 'Metas SMART',
            conteudo: _buildMetasSmart(),
          ),
          _buildExpansionTile(
            icon: Icons.balance,
            titulo: 'Regra 50-30-20',
            conteudo: _buildRegra503020(),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required IconData icon,
    required String titulo,
    required Widget conteudo,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1).withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF6366F1), size: 20),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        children: [conteudo],
      ),
    );
  }

  Widget _buildReservaEmergencia() {
    return const Text(
      'É o seu escudo financeiro. Deve cobrir de 6 a 12 meses do seu custo de vida. O dinheiro deve estar em ativos de liquidez diária e baixo risco (como Tesouro Selic ou CDB 100% CDI).',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }

  Widget _buildBuyHold() {
    return const Text(
      'Estratégia de comprar bons ativos e mantê-los por longo prazo. O foco é se tornar sócio de boas empresas e fundos, aproveitando o poder dos juros compostos e dividendos ao longo dos anos.',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }

  Widget _buildDiversificacao() {
    return const Text(
      'Nunca coloque todos os ovos na mesma cesta. Distribua seu capital entre Renda Fixa, Ações, FIIs e ativos internacionais para reduzir riscos e potencializar retornos.',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }

  Widget _buildAportesConstantes() {
    return const Text(
      'A constância vence a genialidade. Investir um pouco todos os meses é mais eficiente para o acúmulo de riqueza do que tentar adivinhar o momento certo de entrar no mercado.',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }

  Widget _buildMetasSmart() {
    return const Text(
      'Suas metas devem ser: Específicas, Mensuráveis, Atingíveis, Relevantes e com Prazo definido (ex: Juntar R\$ 10 mil em 12 meses para viagem).',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }

  Widget _buildRegra503020() {
    return const Text(
      'Um método de organização: 50% para necessidades básicas, 30% para desejos pessoais e 20% para investimentos/quitação de dívidas.',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }
}

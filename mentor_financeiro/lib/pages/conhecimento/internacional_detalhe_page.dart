import 'package:flutter/material.dart';

class InternacionalDetalhePage extends StatelessWidget {
  const InternacionalDetalhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Investimento Internacional',
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
              icon: Icons.public,
              titulo: '1. Por que sair do Brasil?',
              conteudo: _buildPorQueSair(),
            ),
            _buildSection(
              icon: Icons.flag,
              titulo: '2. BDRs: O Caminho Fácil',
              conteudo: _buildBDRs(),
            ),
            _buildSection(
              icon: Icons.bar_chart,
              titulo: '3. ETFs Internacionais',
              conteudo: _buildETFs(),
            ),
            _buildSection(
              icon: Icons.account_balance,
              titulo: '4. Conta Direta no Exterior',
              conteudo: _buildContaDireta(),
            ),
            _buildSection(
              icon: Icons.gavel,
              titulo: '5. Tributação e Cuidados',
              conteudo: _buildTributacao(),
            ),
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
          colors: [Colors.blue.withAlpha(40), Colors.blue.withAlpha(15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withAlpha(75), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.language, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Investimento Internacional',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Diversifique além das fronteiras',
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
    required String titulo,
    required Widget conteudo,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
            color: Colors.blue.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue, size: 20),
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

  Widget _buildPorQueSair() {
    return const Text(
      'Investir fora protege contra a desvalorização do Real e dá acesso às maiores empresas do planeta (Big Techs, Luxo, Saúde). Principais motivos:\n\n'
      '• Diversificação de moeda\n'
      '• Acesso a empresas globais inovadoras\n'
      '• Proteção contra crises locais',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }

  Widget _buildBDRs() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BDRs são recibos de ações estrangeiras negociados na B3.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Vantagem: Praticidade (compra na corretora brasileira)',
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.warning, color: Colors.amber, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Desvantagem: Não possui dólar físico, apenas título atrelado',
                  style: TextStyle(color: Colors.amber, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildETFs() {
    return const Text(
      'Investir em índices inteiros através de ETFs. Exemplos:\n\n'
      '• S&P 500: As 500 maiores empresas dos EUA\n'
      '• Nasdaq 100: Principais empresas de tecnologia\n'
      '• MSCI World: Ações globais\n\n'
      'É possível comprar через corretoras brasileiras.',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }

  Widget _buildContaDireta() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withAlpha(75)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.verified_user, color: Colors.green, size: 20),
              SizedBox(width: 12),
              Text(
                'Vantagens:',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '• Patrimônio em jurisdição estrangeira\n'
            '• Moeda forte (Dólar/Euro)\n'
            '• Proteção contra crises locais no Brasil\n'
            '• Acesso a mais produtos de investimento',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildTributacao() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.withAlpha(75)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning, color: Colors.red, size: 20),
              SizedBox(width: 12),
              Text(
                'ATENÇÃO:',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '• BDRs NÃO têm isenção de R\$ 20 mil\n'
            '• Retenção de imposto sobre dividendos no exterior\n'
            '• Risco da variação cambial (valor em R\$ oscila)',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }
}

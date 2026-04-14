import 'package:flutter/material.dart';

class CriptoDetalhePage extends StatelessWidget {
  const CriptoDetalhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Criptoativos',
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
              icon: Icons.currency_bitcoin,
              titulo: '1. O Mundo das Criptos',
              conteudo: _buildMundoCriptos(),
            ),
            _buildSection(
              icon: Icons.hub,
              titulo: '2. Bitcoin e Ethereum',
              conteudo: _buildBitcoinEthereum(),
            ),
            _buildSection(
              icon: Icons.shield,
              titulo: '3. Como Investir com Segurança',
              conteudo: _buildComoInvestir(),
            ),
            _buildSection(
              icon: Icons.warning,
              titulo: '4. Alerta de Volatilidade',
              conteudo: _buildVolatilidade(),
            ),
            _buildSection(
              icon: Icons.policy,
              titulo: '5. Cuidados com Golpes',
              conteudo: _buildCuidadosGolpes(),
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
          colors: [Colors.orange.withAlpha(40), Colors.orange.withAlpha(15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withAlpha(75), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.currency_bitcoin,
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
                  'Criptoativos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Ativos digitais descentralizados',
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
            color: Colors.orange.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.orange, size: 20),
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

  Widget _buildMundoCriptos() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Criptomoedas são dinheiro digital descentralizado, sem controle de bancos ou governos.',
          style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
        ),
        SizedBox(height: 12),
        Text(
          'Blockchain é a tecnologia por trás: um registro público e seguro que todos podem verificar, mas ninguém pode alterar facilmente.',
          style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildBitcoinEthereum() {
    return Column(
      children: [
        _buildMoeda(
          'Bitcoin (BTC)',
          'Reserva de valor digital. Similar ao ouro digital. Limitado a 21 milhões de unidades.',
          Icons.arrow_upward,
        ),
        const SizedBox(height: 12),
        _buildMoeda(
          'Ethereum (ETH)',
          'Plataforma de tecnologia. Permite contratos inteligentes e aplicativos descentralizados.',
          Icons.hub,
        ),
      ],
    );
  }

  Widget _buildMoeda(String nome, String descricao, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.orange, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                descricao,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComoInvestir() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOpcao(
          'Comprar em Exchanges',
          'Plataformas como Binance, Coinbase. Mais opções, mas requer mais conhecimento.',
        ),
        const SizedBox(height: 12),
        _buildOpcao(
          'Investir via ETFs na B3',
          'Mais simples para iniciantes. Taxas menores e praticidade.',
        ),
      ],
    );
  }

  Widget _buildOpcao(String titulo, String descricao) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            descricao,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVolatilidade() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.warning, color: Colors.red, size: 24),
              SizedBox(width: 12),
              Text(
                'ALTA VOLATILIDADE',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'O preço pode subir ou cair drasticamente em pouco tempo. Em 2022, o Bitcoin perdeu mais de 60% do valor.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Invista apenas dinheiro que não fará falta no curto prazo.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCuidadosGolpes() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.withAlpha(75)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.policy, color: Colors.amber, size: 20),
              SizedBox(width: 12),
              Text(
                'Dicas de Segurança:',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildDica('🔒', 'Nunca partilhe suas chaves privadas'),
          _buildDica('🚫', 'Desconfie de promessas de lucros fixos'),
          _buildDica('✅', 'Use apenas plataformas conhecidas'),
          _buildDica('📱', 'Ative autenticação em duas etapas'),
        ],
      ),
    );
  }

  Widget _buildDica(String emoji, String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        '$emoji $texto',
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }
}

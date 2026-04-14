import 'package:flutter/material.dart';

class DicionarioPage extends StatelessWidget {
  const DicionarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Dicionário',
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
          _buildTermo(
            'Selic',
            'Taxa Básica de Juros da economia brasileira. Definida pelo Banco Central. Influencia o rendimento de quase todos os investimentos de renda fixa.',
            Icons.trending_up,
          ),
          _buildTermo(
            'CDI',
            'Certificado de Depósito Interbancário. Taxa usada pelos bancos para emprestar entre si. O benchmark mais comum para investimentos de renda fixa.',
            Icons.account_balance,
          ),
          _buildTermo(
            'IPCA',
            'Índice de Preços ao Consumidor Amplo. É a medida oficial da inflação no Brasil. Usado para corrigir investimentos e manter o poder de compra.',
            Icons.show_chart,
          ),
          _buildTermo(
            'Liquidez',
            'Facilidade de transformar um investimento em dinheiro. Pode ser D+0 (mesmo dia), D+1 (próximo dia útil) ou com data de vencimento definida.',
            Icons.sync_alt,
          ),
          _buildTermo(
            'Volatilidade',
            'O quanto o preço de um ativo varia ao longo do tempo. Quanto maior, maior o risco e maior o potencial de ganho ou perda.',
            Icons.shuffle,
          ),
          _buildTermo(
            'Dividendos',
            'Parcela do lucro distribuído aos acionistas de empresas. Isento de IR para pessoa física (no caso de ações).',
            Icons.payments,
          ),
          _buildTermo(
            'P/L',
            'Preço sobre Lucro. Indicador que mostra se uma ação está cara ou barata. Quanto menor, melhor.',
            Icons.analytics,
          ),
          _buildTermo(
            'Yield',
            'Rendimento percentual de um ativo. Dividend Yield mostra quanto o fundo ou ação paga em dividendos proporcional ao preço.',
            Icons.percent,
          ),
        ],
      ),
    );
  }

  Widget _buildTermo(String termo, String definicao, IconData icone) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.teal.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icone, color: Colors.teal, size: 20),
        ),
        title: Text(
          termo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            definicao,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

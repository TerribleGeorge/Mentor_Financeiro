import 'package:flutter/material.dart';

class FundosDetalhePage extends StatelessWidget {
  const FundosDetalhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Fundos de Investimento',
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
              icon: Icons.business,
              titulo: '1. O que é um Fundo?',
              conteudo: _buildConceitoContent(),
            ),
            _buildSection(
              icon: Icons.attach_money,
              titulo: '2. Taxas e Custos',
              conteudo: _buildTaxasContent(),
            ),
            _buildSection(
              icon: Icons.calendar_month,
              titulo: '3. O Come-Cotas',
              conteudo: _buildComeCotasContent(),
            ),
            _buildSection(
              icon: Icons.pie_chart,
              titulo: '4. Tipos de Fundos',
              conteudo: _buildTiposContent(),
            ),
            _buildSection(
              icon: Icons.shield,
              titulo: '5. Vantagens e Riscos',
              conteudo: _buildVantagensRiscosContent(),
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
          colors: [Colors.purple.withAlpha(40), Colors.purple.withAlpha(15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purple.withAlpha(75), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.withAlpha(50),
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
                  'Fundos de Investimento',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Gestão Profissional Coletiva',
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
            color: Colors.purple.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.purple, size: 20),
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

  Widget _buildConceitoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Um Fundo de Investimento é como um "condomínio" de investidores. Todos os participantes colocam dinheiro juntos, e um profissional (Gestor) cuida de onde investir esse dinheiro coletivo.',
          style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.6),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.purple.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(Icons.person, color: Colors.purple, size: 20),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'O Gestor é responsável por tomar todas as decisões de investimento em nome dos cotistas, seguindo a estratégia definida no regulamento do fundo.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaxasContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTaxaItem(
          'Taxa de Administração',
          'Custo anual para manter o fundo. Geralmente entre 0,5% e 2% ao ano. É cobrada independentemente do resultado.',
          Icons.receipt,
        ),
        const SizedBox(height: 12),
        _buildTaxaItem(
          'Taxa de Performance',
          'Cobrada apenas quando o fundo supera seu benchmark (ex: CDI ou Ibovespa). Geralmente 10% a 20% do excesso de rentabilidade.',
          Icons.trending_up,
        ),
      ],
    );
  }

  Widget _buildTaxaItem(String titulo, String descricao, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.purple, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
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

  Widget _buildComeCotasContent() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.withAlpha(75)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.warning, color: Colors.red, size: 20),
              SizedBox(width: 12),
              Text(
                'O que é o Come-Cotas?',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'É um antecipação do Imposto de Renda que ocorre duas vezes por ano: em maio e novembro. O IR é calculado sobre os ganhos de todos os meses anteriores e descontado automaticamente.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.white54, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Se você rescindir em maio ou novembro, o IR já foi pago. Nos outros meses, o IR é retido apenas no resgate.',
                    style: TextStyle(color: Colors.white54, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTiposContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTipoItem(
          'Renda Fixa',
          'Investe em títulos de renda fixa (Tesouro, CDB, Debêntures). Mais conservador.',
          Icons.account_balance_wallet,
        ),
        const SizedBox(height: 12),
        _buildTipoItem(
          'Ações',
          'Investe majoritariamente em ações na Bolsa. Maior risco, maior potencial de retorno.',
          Icons.show_chart,
        ),
        const SizedBox(height: 12),
        _buildTipoItem(
          'Multimercado',
          'Mistura várias classes (ações, juros, câmbio).flexível e pode usar estratégias sophisticated.',
          Icons.donut_large,
        ),
        const SizedBox(height: 12),
        _buildTipoItem(
          'Cambiais',
          'Investe em moedas estrangeiras (Dólar, Euro). Proteção contra variação cambial.',
          Icons.currency_exchange,
        ),
      ],
    );
  }

  Widget _buildTipoItem(String titulo, String descricao, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.purple, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
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

  Widget _buildVantagensRiscosContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.withAlpha(75)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 12),
                  Text(
                    'Vantagens',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildPonto(
                'Gestão profissional',
                'Experts decidem onde investir por você',
              ),
              _buildPonto(
                'Diversificação',
                'Acesso a vários ativos com pouco dinheiro',
              ),
              _buildPonto('Liquidez', 'Resgate geralmente rápido'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.withAlpha(75)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.warning, color: Colors.red, size: 20),
                  SizedBox(width: 12),
                  Text(
                    'Riscos',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildPonto(
                'Sem controle',
                'Você não escolhe os ativos específicos',
              ),
              _buildPonto('Taxas', 'Custos podem comer o rendimento'),
              _buildPonto('Risco do gestor', 'Decisões ruins afetam todos'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPonto(String titulo, String descricao) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Expanded(
            child: Text(
              '$titulo: $descricao',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

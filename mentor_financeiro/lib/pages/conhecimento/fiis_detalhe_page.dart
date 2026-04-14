import 'package:flutter/material.dart';

class FIISDetalhePage extends StatelessWidget {
  const FIISDetalhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'FIIs',
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
              icon: Icons.domain,
              titulo: '1. O que é um FII?',
              conteudo: _buildOQueEContent(),
            ),
            _buildSection(
              icon: Icons.savings,
              titulo: '2. Aluguel Isento de Imposto',
              conteudo: _buildAluguelContent(),
            ),
            _buildSection(
              icon: Icons.pie_chart,
              titulo: '3. Tijolo vs. Papel',
              conteudo: _buildTijoloContent(),
            ),
            _buildSection(
              icon: Icons.warning,
              titulo: '4. Principais Riscos',
              conteudo: _buildRiscosContent(),
            ),
            _buildSection(
              icon: Icons.rocket_launch,
              titulo: '5. Vantagens sobre Imóvel Físico',
              conteudo: _buildVantagensContent(),
            ),
            _buildSection(
              icon: Icons.search,
              titulo: '6. Como escolher?',
              conteudo: _buildEscolherContent(),
            ),
            _buildSection(
              icon: Icons.warning,
              titulo: '7. Imposto na Venda de Cotas',
              conteudo: _buildImpostoVendaContent(),
            ),
            _buildSection(
              icon: Icons.people,
              titulo: '8. A Regra dos 100 Cotistas',
              conteudo: _buildRegra100Content(),
            ),
            _buildSection(
              icon: Icons.flag,
              titulo: '9. Cuidado com o Yield Trap',
              conteudo: _buildYieldTrapContent(),
            ),
            _buildSection(
              icon: Icons.tune,
              titulo: '10. Gestão Ativa vs. Passiva',
              conteudo: _buildGestaoContent(),
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
          colors: [Colors.cyan.withAlpha(40), Colors.cyan.withAlpha(15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyan.withAlpha(75), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.cyan.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.apartment, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FIIs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Fundos Imobiliários',
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
            color: Colors.cyan.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.cyan, size: 20),
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

  Widget _buildOQueEContent() {
    return const Text(
      'O investidor adquire cotas de grandes empreendimentos imobiliários e recebe parte dos aluguéis proporcionalmente ao número de cotas que possui.',
      style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.6),
    );
  }

  Widget _buildAluguelContent() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withAlpha(75)),
      ),
      child: const Row(
        children: [
          Icon(Icons.money_off, color: Colors.green, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Os rendimentos mensais são isentos de IR para pessoa física, o que torna os FIIs excelentes para gerar renda passiva.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTijoloContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(
          Icons.apartment,
          'Tijolo',
          'Imóveis reais como Shoppings, Galpões logísticos e Escritórios.',
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.description,
          'Papel',
          'Títulos de dívida do setor imobiliário como CRI e LCI.',
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String titulo, String valor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.cyan, size: 20),
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
                valor,
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

  Widget _buildRiscosContent() {
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
                'Principais Riscos:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildRiscoItem('Vacância', 'O imóvel ficar vazio sem inquilino'),
          _buildRiscoItem('Inadimplência', 'Inquilino não pagar o aluguel'),
          _buildRiscoItem(
            'Risco de Mercado',
            'Oscilação do preço da cota na Bolsa',
          ),
        ],
      ),
    );
  }

  Widget _buildRiscoItem(String titulo, String descricao) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: Colors.red, fontSize: 12)),
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

  Widget _buildVantagensContent() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withAlpha(75)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildVantagemItem(
            Icons.attach_money,
            'Investimento inicial baixo',
            'Muitos FIIs custam cerca de R\$ 10,00 ou R\$ 100,00',
          ),
          const SizedBox(height: 8),
          _buildVantagemItem(
            Icons.speed,
            'Sem burocracia',
            'Sem escrituras e sem necessidade de cobrar inquilinos',
          ),
          const SizedBox(height: 8),
          _buildVantagemItem(
            Icons.diversity_3,
            'Diversificação imediata',
            'Vários imóveis ao mesmo tempo com pouco capital',
          ),
        ],
      ),
    );
  }

  Widget _buildVantagemItem(IconData icon, String titulo, String descricao) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.green, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                descricao,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEscolherContent() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Indicadores básicos:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildIndicador(
            'Dividend Yield',
            'Quanto o fundo paga de dividendo mensal',
          ),
          _buildIndicador('P/VP', 'Preço sobre valor patrimonial'),
          _buildIndicador(
            'Qualidade dos Ativos',
            'Tipo de imóveis e localização',
          ),
          _buildIndicador('Vacância', 'Percentual de imóveis vagos'),
          _buildIndicador('Taxa de Administração', 'Custo anual do fundo'),
        ],
      ),
    );
  }

  Widget _buildIndicador(String titulo, String descricao) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  descricao,
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImpostoVendaContent() {
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
                'ATENÇÃO: IR NA VENDA',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Embora os dividendos sejam isentos, o lucro na venda da cota paga ',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const Text(
            '20% DE IR',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'NÃO existe isenção de R\$ 20 mil para FIIs.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegra100Content() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.withAlpha(75)),
      ),
      child: const Row(
        children: [
          Icon(Icons.people, color: Colors.amber, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Para os dividendos serem isentos de IR, o fundo deve ter pelo menos 100 cotistas e ser negociado em bolsa. Isso protege o investidor de fundos com baixa liquidez.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYieldTrapContent() {
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
              Icon(Icons.flag, color: Colors.red, size: 20),
              SizedBox(width: 12),
              Text(
                'CUIDADO:',
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
            'Um rendimento mensal muito acima da média pode esconder riscos. O investidor deve analisar se o pagamento é sustentável ou se foi apenas um evento extraordinário (venda de ativos).',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildGestaoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(
          Icons.build,
          'Gestão Ativa',
          'O gestor compra e vende imóveis para buscar lucro. Taxa de administração costuma ser maior.',
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.view_list,
          'Gestão Passiva',
          'O fundo apenas mantém os mesmos imóveis e distribui o aluguel. Taxa menor.',
        ),
      ],
    );
  }
}

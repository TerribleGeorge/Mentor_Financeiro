import 'package:flutter/material.dart';

class CDBDetalhePage extends StatelessWidget {
  const CDBDetalhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'CDB',
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
              icon: Icons.account_balance,
              titulo: '1. O Conceito',
              conteudo: _buildConceitoContent(),
            ),
            _buildSection(
              icon: Icons.shield,
              titulo: '2. A Garantia do FGC',
              conteudo: _buildGarantiaContent(),
            ),
            _buildSection(
              icon: Icons.bar_chart,
              titulo: '3. Modelos de Rentabilidade',
              conteudo: _buildRentabilidadeContent(),
            ),
            _buildSection(
              icon: Icons.access_time,
              titulo: '4. Liquidez e Prazos',
              conteudo: _buildLiquidezContent(),
            ),
            _buildSection(
              icon: Icons.receipt_long,
              titulo: '5. Tributação e Vantagem de Custo',
              conteudo: _buildTributacaoContent(),
            ),
            _buildSection(
              icon: Icons.psychology,
              titulo: '6. Detalhes Avançados',
              conteudo: _buildAvancadosContent(),
            ),
            _buildSection(
              icon: Icons.checklist,
              titulo: '7. Estratégia de Escolha',
              conteudo: _buildEstrategiaContent(),
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
          colors: [
            Colors.blueGrey.withAlpha(40),
            Colors.blueGrey.withAlpha(15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blueGrey.withAlpha(75), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withAlpha(50),
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
                  'Guia Completo: CDB',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Certificado de Depósito Bancário',
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
            color: Colors.blueGrey.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blueGrey.shade300, size: 20),
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
    return const Text(
      'O CDB é um título de renda fixa emitido pelos bancos para captar recursos. Você empresta dinheiro ao banco e ele te devolve com juros. É a porta de entrada para quem quer render mais que a poupança com a mesma segurança.',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
    );
  }

  Widget _buildGarantiaContent() {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.verified_user, color: Colors.green, size: 20),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Segurança Máxima: Proteção do Fundo Garantidor de Crédito.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Cobertura: Até R\$ 250 mil por CPF e por instituição. Se o banco quebrar, o FGC te ressarce.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildRentabilidadeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(
          Icons.trending_up,
          'Pós-fixado',
          'Atrelado ao CDI (ex: 100% do CDI). O rendimento sobe se a Selic subir.',
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.calendar_today,
          'Prefixado',
          'Taxa travada (ex: 11% ao ano). Ideal para quando os juros estão em queda.',
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.show_chart,
          'Híbrido (IPCA+)',
          'Ganho real. Garante a inflação + uma taxa fixa.',
        ),
      ],
    );
  }

  Widget _buildLiquidezContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(
          Icons.sync_alt,
          'Liquidez Diária',
          'Resgate a qualquer momento. Essencial para Reserva de Emergência.',
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.event,
          'Liquidez no Vencimento',
          'O dinheiro fica aplicado por um prazo fixo (ex: 2 anos). Geralmente oferece taxas muito superiores.',
        ),
      ],
    );
  }

  Widget _buildTributacaoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Imposto de Renda:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white12),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(
                Colors.blueGrey.withAlpha(25),
              ),
              dataRowColor: WidgetStateProperty.all(Colors.transparent),
              columnSpacing: 24,
              columns: const [
                DataColumn(
                  label: Text(
                    'Período',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Alíquota',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Até 180 dias',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    DataCell(
                      Text(
                        '22,5%',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        '181 a 360 dias',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    DataCell(
                      Text(
                        '20%',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        '361 a 720 dias',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    DataCell(
                      Text(
                        '17,5%',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Acima de 720 dias',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    DataCell(
                      Text(
                        '15%',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'IOF: Cobrado apenas se regsatar antes de 30 dias.',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Vantagem: Ao contrário do Tesouro Direto, o CDB NÃO possui taxa de custódia da B3. Todo o rendimento líquido é seu.',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvancadosContent() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rating (Nota de Crédito):',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Bancos têm notas (AAA, AA, B). Quanto menor a nota, maior deve ser a taxa paga ao investidor pelo risco.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
          SizedBox(height: 12),
          Text(
            'Mercado Secundário:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'É possível tentar vender um CDB "preso" antes do vencimento em caso de emergência, mas pode haver perda de rentabilidade (deságio).',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
          SizedBox(height: 12),
          Text(
            'Spread:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'O banco capta de você a 10% e empresta a terceiros a 100%. Por isso ele te paga juros.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildEstrategiaContent() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.withAlpha(75)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estratégia de Escolha:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '• CDBs de bancos grandes (Itaú, Bradesco) costumam pagar menos (próximo a 100% do CDI).\n\n'
            '• Bancos médios/digitais costumam oferecer 110%, 120% do CDI ou mais para atrair capital.\n\n'
            '• Avalie sempre o Rating vs. Rentabilidade.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String titulo, String valor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blueGrey.shade300, size: 20),
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
}

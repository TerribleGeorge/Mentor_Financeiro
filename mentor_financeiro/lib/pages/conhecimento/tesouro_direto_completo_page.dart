import 'package:flutter/material.dart';

class TesouroDiretoCompletoPage extends StatelessWidget {
  const TesouroDiretoCompletoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Tesouro Direto',
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
              icon: Icons.shield,
              titulo: '1. O que é o Tesouro Direto?',
              conteudo: _buildConceitoContent(),
            ),
            _buildSection(
              icon: Icons.list_alt,
              titulo: '2. O Cardápio de Títulos',
              conteudo: _buildCardapioContent(),
            ),
            _buildSection(
              icon: Icons.warning_amber,
              titulo: '3. Marcação a Mercado',
              conteudo: _buildMarcacaoContent(),
              destacar: true,
            ),
            _buildSection(
              icon: Icons.access_time,
              titulo: '4. Liquidez e Horários',
              conteudo: _buildLiquidezContent(),
            ),
            _buildSection(
              icon: Icons.attach_money,
              titulo: '5. Tributação e Custos',
              conteudo: _buildTributacaoContent(),
            ),
            _buildSection(
              icon: Icons.rocket_launch,
              titulo: '6. Como Começar',
              conteudo: _buildComoComecarContent(),
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
                  'Guia Completo',
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
    required String titulo,
    required Widget conteudo,
    bool destacar = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: destacar
            ? Border.all(color: Colors.amber.withAlpha(128), width: 1)
            : null,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (destacar ? Colors.amber : Colors.indigo).withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: destacar ? Colors.amber : Colors.indigo,
            size: 20,
          ),
        ),
        title: Text(
          titulo,
          style: TextStyle(
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
          'É um programa do Tesouro Nacional que permite a pessoas físicas comprarem títulos públicos. Você empresta dinheiro ao Governo Federal em troca de juros.',
          style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.withAlpha(75)),
          ),
          child: const Row(
            children: [
              Icon(Icons.verified_user, color: Colors.green, size: 20),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'É o investimento de menor risco de crédito do Brasil (Risco Soberano).',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
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

  Widget _buildCardapioContent() {
    return Column(
      children: [
        _buildTituloItem(
          'Tesouro Selic (LFT)',
          'O preferido para reserva de emergência. Rende a taxa básica de juros e não sofre oscilação negativa.',
          Icons.trending_up,
        ),
        const Divider(color: Colors.white12, height: 20),
        _buildTituloItem(
          'Tesouro Reserva 24h',
          'Liquidez imediata, permitindo resgates em fins de semana e feriados. Excelente para quem precisa de agilidade total.',
          Icons.flash_on,
        ),
        const Divider(color: Colors.white12, height: 20),
        _buildTituloItem(
          'Tesouro IPCA+',
          'Híbrido. Protege seu poder de compra contra a inflação (IPCA) + uma taxa fixa.',
          Icons.show_chart,
        ),
        const Divider(color: Colors.white12, height: 20),
        _buildTituloItem(
          'Tesouro Prefixado',
          'Você sabe exatamente quanto vai receber se levar até o vencimento.',
          Icons.calendar_today,
        ),
        const Divider(color: Colors.white12, height: 20),
        _buildTituloItem(
          'Tesouro RendA+',
          'Título focado em previdência. Acumula por anos e paga mensalmente por 20 anos.',
          Icons.elderly,
        ),
        const Divider(color: Colors.white12, height: 20),
        _buildTituloItem(
          'Tesouro EdukA+',
          'Título focado em educação. Acumula e paga mensalmente por 5 anos.',
          Icons.school,
        ),
      ],
    );
  }

  Widget _buildTituloItem(String titulo, String descricao, IconData icone) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.indigo.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icone, color: Colors.indigo, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                descricao,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMarcacaoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.redAccent.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.redAccent.withAlpha(75)),
          ),
          child: const Row(
            children: [
              Icon(Icons.warning, color: Colors.redAccent, size: 20),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Os títulos Prefixados e IPCA+ variam de preço diariamente. Se resgatar antes do vencimento, você pode ganhar mais ou perder dinheiro.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.withAlpha(75)),
          ),
          child: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 20),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Se levar até o final, a taxa contratada é garantida.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
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

  Widget _buildLiquidezContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(
          Icons.access_time,
          'Investimento/Resgate',
          'Dias úteis, das 09h30 às 18h00',
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.sync_alt,
          'Liquidez',
          'D+0 (dinheiro no dia) para solicitações até às 13h00, ou D+1.',
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String titulo, String valor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.indigo, size: 20),
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

  Widget _buildTributacaoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(
          Icons.receipt_long,
          'Imposto de Renda',
          'Tabela regressiva (22,5% a 15% conforme o tempo)',
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.money_off,
          'IOF',
          'Apenas para resgates em menos de 30 dias',
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.account_balance,
          'Taxa B3',
          '0,20% ao ano (Isento para Tesouro Selic até R\$ 10 mil)',
        ),
      ],
    );
  }

  Widget _buildComoComecarContent() {
    return Column(
      children: [
        _buildPasso(
          1,
          'Ter conta em corretora',
          'Escolha uma de sua confiança',
        ),
        const SizedBox(height: 12),
        _buildPasso(2, 'Transferir saldo', 'Via PIX/TED para a corretora'),
        const SizedBox(height: 12),
        _buildPasso(3, 'Escolher o título', 'Pelo app da corretora'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline, color: Colors.green, size: 20),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Mínimo de ~R\$ 30,00 para começar a investir.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasso(int numero, String passo, String detalhe) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              '$numero',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                passo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                detalhe,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

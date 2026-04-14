import 'package:flutter/material.dart';

class TelaInvestimentos extends StatelessWidget {
  const TelaInvestimentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: const Text(
          'Investimentos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ExpansionTopico(
            icone: Icons.savings_outlined,
            titulo: 'Poupança',
            descricao:
                'A forma mais simples de investir. Rendimento baixo, mas sem risco de perda do capital investido. Ideal paraEmergency fund.',
          ),
          _ExpansionTopico(
            icone: Icons.trending_up,
            titulo: 'Tesouro Direto',
            descricao:
                'Títulos de renda fixa emitidos pelo governo. Considerado o investimento mais seguro do Brasil. Existem opções prefixadas, pós-fixadas e indexadas ao IPCA.',
          ),
          _ExpansionTopico(
            icone: Icons.account_balance,
            titulo: 'CDB (Certificado de Depósito Bancário)',
            descricao:
                'Título de renda fixa emitido por bancos. Rende mais que a poupança, e o capital é garantido pelo FGC até R\$250 mil por CPF/banco.',
          ),
          _ExpansionTopico(
            icone: Icons.pie_chart_outline,
            titulo: 'Fundos de Investimento',
            descricao:
                'Colecione investimentosgeridos por profissionais. Variam em nível de risco: conservador, moderado ou agressivo. Taxas de administração e performance.',
          ),
          _ExpansionTopico(
            icone: Icons.show_chart,
            titulo: 'Ações',
            descricao:
                'Compra de partes de empresas listadas na bolsa. Alto potencial de retorno, mas com risco de perda. Requer conhecimento e tolerância à volatilidade.',
          ),
          _ExpansionTopico(
            icone: Icons.currency_bitcoin,
            titulo: 'Criptomoedas',
            descricao:
                'Ativos digitais descentralizados. Alta volatilidade e risco. Não possui garantia do FGC. Indicação apenas para investidores com perfil agressivo.',
          ),
          _ExpansionTopico(
            icone: Icons.insights,
            titulo: 'LCI e LCA',
            descricao:
                'Letras de Crédito do Agronegócioda Imobiliário. Isentas de IR para pessoa física. Rendimento atrelado ao CDI. Boas opções para diversificar com menor risco.',
          ),
          _ExpansionTopico(
            icone: Icons.diamond_outlined,
            titulo: 'Debêntures',
            descricao:
                'Títulos de dívida de empresas. Pode ter rendimento fixo ou variable. Risco maior que títulos governamentais, mas geralmente melhor remuneração.',
          ),
        ],
      ),
    );
  }
}

class _ExpansionTopico extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;

  const _ExpansionTopico({
    required this.icone,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        collapsedIconColor: const Color(0xFF00D9FF),
        iconColor: const Color(0xFF00D9FF),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF00D9FF).withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icone, color: const Color(0xFF00D9FF), size: 20),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        children: [
          Text(
            descricao,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TelaEstrategias extends StatelessWidget {
  const TelaEstrategias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
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
        children: const [
          _ExpansionTopico(
            icone: Icons.water_drop_outlined,
            titulo: 'Regra 50-30-20',
            descricao:
                'Divida sua renda: 50% para necessidades (aluguel, contas, alimentação), 30% para desejos (lazer, entretenimento), e 20% para economia e investimentos. Simples e eficiente.',
          ),
          _ExpansionTopico(
            icone: Icons.savings,
            titulo: 'Pagando-se Primeiro',
            descricao:
                'Reserve para investimentos antes de gastar em necessidades. Configure transferência automática para investimento no dia do recebimento. Treat sua economia como uma conta a pagar.',
          ),
          _ExpansionTopico(
            icone: Icons.workspace_premium,
            titulo: 'Regra dos 90 Dias',
            descricao:
                'Antes de comprar algo não essencial, aguarde 90 dias. Se ainda quiser após esse período, compre. Evita compras por impulso e regret.',
          ),
          _ExpansionTopico(
            icone: Icons.trending_down,
            titulo: 'Metas SMART',
            descricao:
                'Defina metas: Específica, Mensurável, Alcançável, Relevante e com Prazo. Ex: "Guardar R\$5.000 para viagem em 12 meses" = R\$417/mês.',
          ),
          _ExpansionTopico(
            icone: Icons.account_balance_wallet,
            titulo: 'Orçamento Base Zero',
            descricao:
                'Cada real tem um destino. Allocate toda a renda antes do mês começar. Nada fica "sem destino". O restante vai para economias.',
          ),
          _ExpansionTopico(
            icone: Icons.pie_chart,
            titulo: 'Diversificação de Investimentos',
            descricao:
                'Não coloque todos os ovos na mesma cesta. Diversifique entre renda fixa e variável para reduzir riscos e aumentar a resiliência.',
          ),
          _ExpansionTopico(
            icone: Icons.sports_score,
            titulo: 'Método Acelerado',
            descricao:
                'Pague primeiras as dívidas com juros mais altos. Depois, redirecione esse pagamento para investimentos.',
          ),
          _ExpansionTopico(
            icone: Icons.calendar_month,
            titulo: 'Revisão Mensal',
            descricao:
                'No mesmo dia todo mês, revise seu orçamento. Compare o planejado com o realizado e aja para o próximo mês.',
          ),
          _ExpansionTopico(
            icone: Icons.security,
            titulo: 'Reserva de Emergência',
            descricao:
                'Guarde 3-6 meses de despesas em renda fixa de alta liquidez. Use apenas em emergências reais como perda de emprego ou despesas médicas.',
          ),
          _ExpansionTopico(
            icone: Icons.graphic_eq,
            titulo: 'Juros Compostos',
            descricao:
                'Os juros rendem juros. Os rendimentos são reinvestidos. Pequenas quantias se tornam grandes valores no longo prazo. O tempo é seu maior aliado.',
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
        collapsedIconColor: const Color(0xFF6366F1),
        iconColor: const Color(0xFF6366F1),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1).withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icone, color: const Color(0xFF6366F1), size: 20),
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

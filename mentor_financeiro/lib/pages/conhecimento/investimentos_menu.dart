import 'package:flutter/material.dart';
import 'tesouro_direto_completo_page.dart';
import 'acoes_detalhe_page.dart';
import 'fiis_detalhe_page.dart';
import 'fundos_detalhe_page.dart';
import 'internacional_detalhe_page.dart';
import 'cripto_detalhe_page.dart';

class InvestimentosMenu extends StatelessWidget {
  const InvestimentosMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
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
        children: [
          _buildItem(
            context,
            'Tesouro Direto',
            Icons.account_balance,
            const TesouroDiretoCompletoPage(),
          ),
          _buildItem(context, 'FIIs', Icons.apartment, const FIISDetalhePage()),
          _buildItem(
            context,
            'Fundos',
            Icons.account_balance,
            const FundosDetalhePage(),
          ),
          _buildItem(
            context,
            'Ações',
            Icons.show_chart,
            const AcoesDetalhePage(),
          ),
          _buildItem(
            context,
            'Internacional',
            Icons.public,
            const InternacionalDetalhePage(),
          ),
          _buildItem(
            context,
            'Cripto',
            Icons.currency_bitcoin,
            const CriptoDetalhePage(),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String titulo,
    IconData icone,
    Widget pagina,
  ) {
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
            color: Colors.indigo.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icone, color: Colors.indigo, size: 20),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white38),
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => pagina)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../content/content_repository.dart';
import '../../l10n/app_localizations.dart';
import 'tesouro_direto_completo_page.dart';
import 'acoes_detalhe_page.dart';
import 'cdb_detalhe_page.dart';
import 'fiis_detalhe_page.dart';
import 'fundos_detalhe_page.dart';
import 'internacional_detalhe_page.dart';
import 'cripto_detalhe_page.dart';

class InvestimentosMenu extends StatelessWidget {
  const InvestimentosMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isBrazil = ContentRepository.isPtBrLocale(Localizations.localeOf(context));
    final items = ContentRepository.investmentMenuItems(
      l10n: l10n,
      isBrazil: isBrazil,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.investimentos,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: items.map((i) => _buildItem(context, i.title, i.icon, i.id))
            .toList(),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String titulo,
    IconData icone,
    String id,
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
        onTap: () => _openPage(context, id),
      ),
    );
  }

  void _openPage(BuildContext context, String id) {
    final page = switch (id) {
      'tesouro' => const TesouroDiretoCompletoPage(),
      'cdb' => const CDBDetalhePage(),
      'etfs' => const InternacionalDetalhePage(),
      'sp500' => const InternacionalDetalhePage(),
      'reits_fiis' => const FIISDetalhePage(),
      'funds' => const FundosDetalhePage(),
      'stocks' => const AcoesDetalhePage(),
      'international' => const InternacionalDetalhePage(),
      'crypto' => const CriptoDetalhePage(),
      _ => const InternacionalDetalhePage(),
    };
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}

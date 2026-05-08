import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../content/content_repository.dart';
import '../../l10n/app_localizations.dart';
import '../../services/investment_category_provider.dart';
import 'tesouro_direto_completo_page.dart';
import 'acoes_detalhe_page.dart';
import 'cdb_detalhe_page.dart';
import 'fiis_detalhe_page.dart';
import 'fundos_detalhe_page.dart';
import 'internacional_detalhe_page.dart';
import 'cripto_detalhe_page.dart';
import '../../widgets/mentor_menu_card.dart';

class InvestimentosMenu extends StatelessWidget {
  const InvestimentosMenu({super.key});

  static Color _accentForId(String id) {
    switch (id) {
      case 'tesouro':
        return const Color(0xFF00D9FF);
      case 'cdb':
        return const Color(0xFF26DE81);
      case 'reits_fiis':
        return const Color(0xFFFECA57);
      case 'funds':
        return const Color(0xFF6366F1);
      case 'stocks':
        return const Color(0xFFFF4D4D);
      case 'international':
      case 'etfs':
      case 'sp500':
        return const Color(0xFF00D9FF);
      case 'crypto':
        return const Color(0xFF6366F1);
      default:
        return const Color(0xFF00D9FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isBrazil = context.watch<InvestmentCategoryProvider>().isBrazilMarket;
    final items = ContentRepository.investmentMenuItems(
      l10n: l10n,
      isBrazil: isBrazil,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          l10n.investimentos,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: items
            .map(
              (i) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: MentorMenuCard(
                  icon: i.icon,
                  title: i.title,
                  subtitle: l10n.confirmarTransacao,
                  accent: _accentForId(i.id),
                  onTap: () => _openPage(context, i.id),
                ),
              ),
            )
            .toList(),
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

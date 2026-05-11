import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../content/investing_transition_strategy_content.dart';

/// Conteúdo educativo: investimentos conservadores sem renda fixa / em transição.
class InvestimentoSemRendaFixaPage extends StatelessWidget {
  const InvestimentoSemRendaFixaPage({super.key});

  static const Color _bg = Color(0xFF0F172A);
  static const Color _card = Color(0xFF1E293B);
  static const Color _accent = Color(0xFF00D9FF);
  static const Color _warn = Color(0xFFFECA57);
  static const Color _danger = Color(0xFFFF6B6B);

  /// Deve coincidir com `ListView.padding` horizontal (16 + 16).
  static const double _listHorizontalInset = 32;

  /// Deve coincidir com o padding horizontal do card do comparativo (12 + 12).
  static const double _comparisonCardHorizontalInset = 24;

  /// Largura mínima da tabela para caber nas 4 colunas sem layout inválido.
  static const double _comparisonTableMinWidth = 520;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          InvestingTransitionStrategyContent.pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            height: 1.25,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          _introCard(),
          const SizedBox(height: 16),
          _sectionCard(
            icon: InvestingTransitionStrategyContent.section1Icon,
            iconColor: _accent,
            title: InvestingTransitionStrategyContent.section1Title,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bodyText(InvestingTransitionStrategyContent.section1Paragraph1),
                const SizedBox(height: 10),
                _bodyText(InvestingTransitionStrategyContent.section1Paragraph2),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            icon: InvestingTransitionStrategyContent.section2Icon,
            iconColor: const Color(0xFF26DE81),
            title: InvestingTransitionStrategyContent.section2Title,
            child: Column(
              children: [
                for (var i = 0;
                    i < InvestingTransitionStrategyContent.recommendedAssets.length;
                    i++) ...[
                  if (i > 0) Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      InvestingTransitionStrategyContent.recommendedAssets[i].icon,
                      color: _accent,
                      size: 28,
                    ),
                    title: Text(
                      InvestingTransitionStrategyContent.recommendedAssets[i].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        InvestingTransitionStrategyContent.recommendedAssets[i].subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.72),
                          fontSize: 13,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            icon: InvestingTransitionStrategyContent.section3Icon,
            iconColor: _warn,
            title: InvestingTransitionStrategyContent.section3Title,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.trending_down, color: _danger, size: 22),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Evite expor o que não pode perder a estes riscos:',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.88),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                for (final line in InvestingTransitionStrategyContent.highRiskBullets)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.chevron_right, color: _danger.withValues(alpha: 0.9), size: 20),
                        Expanded(child: _bodyText(line)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _comparisonCard(),
          const SizedBox(height: 16),
          _tipsCard(),
        ],
      ),
    );
  }

  Widget _introCard() {
    return Card(
      color: _card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: _accent.withValues(alpha: 0.35)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.shield_moon_outlined, color: _accent, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    InvestingTransitionStrategyContent.pageTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      height: 1.25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _bodyText(InvestingTransitionStrategyContent.introLead),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required Widget child,
  }) {
    return Card(
      color: _card,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: iconColor.withValues(alpha: 0.4)),
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }

  Widget _comparisonCard() {
    final rows = InvestingTransitionStrategyContent.comparisonRows;
    return Card(
      color: _card,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.table_chart, color: _accent, size: 24),
                const SizedBox(width: 10),
                const Text(
                  'Comparativo rápido',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Segurança, liquidez e recomendação nesta fase',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 12),
            ),
            const SizedBox(height: 12),
            LayoutBuilder(
              builder: (context, constraints) {
                // Largura real do card (evita MediaQuery ≠ largura útil). DataTable
                // falhava aqui; Table + SizedBox com largura finita é estável.
                var inner = constraints.maxWidth;
                if (!inner.isFinite || inner <= 0) {
                  inner = MediaQuery.sizeOf(context).width -
                      _listHorizontalInset -
                      _comparisonCardHorizontalInset;
                }
                if (!inner.isFinite || inner <= 0) {
                  inner = _comparisonTableMinWidth;
                }
                final tableWidth = math.max(inner, _comparisonTableMinWidth);
                return Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: tableWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1.05),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                            3: FlexColumnWidth(1.1),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(
                            color: Colors.white.withValues(alpha: 0.12),
                          ),
                          children: <TableRow>[
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Color(0xFF0D1320),
                              ),
                              children: <Widget>[
                                _comparisonHeaderCell('Ativo'),
                                _comparisonHeaderCell('Segurança'),
                                _comparisonHeaderCell('Liquidez'),
                                _comparisonHeaderCell('Recomendação'),
                              ],
                            ),
                            for (final r in rows)
                              TableRow(
                                children: <Widget>[
                                  _comparisonBodyCell(r.ativo, bold: true),
                                  _comparisonBodyCell(r.seguranca),
                                  _comparisonBodyCell(r.liquidez),
                                  _comparisonBodyCell(r.recomendacao),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Text(
              InvestingTransitionStrategyContent.comparisonFootnote,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55),
                fontSize: 11,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _comparisonHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  static Widget _comparisonBodyCell(String text, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: bold ? Colors.white : Colors.white.withValues(alpha: 0.85),
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            fontSize: 11.5,
            height: 1.35,
          ),
        ),
      ),
    );
  }

  Widget _tipsCard() {
    return Card(
      color: _card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.green.withValues(alpha: 0.35)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(InvestingTransitionStrategyContent.tipsIcon, color: Colors.greenAccent, size: 26),
                const SizedBox(width: 10),
                Text(
                  InvestingTransitionStrategyContent.tipsTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            for (var i = 0; i < InvestingTransitionStrategyContent.tips.length; i++) ...[
              if (i > 0) const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  InvestingTransitionStrategyContent.tips[i].icon,
                  color: Colors.greenAccent.withValues(alpha: 0.95),
                ),
                title: Text(
                  InvestingTransitionStrategyContent.tips[i].title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    InvestingTransitionStrategyContent.tips[i].body,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.72),
                      fontSize: 13,
                      height: 1.45,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  static Widget _bodyText(String s) {
    return Text(
      s,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.78),
        fontSize: 14,
        height: 1.5,
      ),
    );
  }
}

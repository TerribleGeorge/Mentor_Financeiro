import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../content/content_repository.dart';
import '../../content/content_models.dart';
import '../../l10n/app_localizations.dart';
import '../../services/app_theme_controller.dart';

class EstrategiasMenu extends StatelessWidget {
  const EstrategiasMenu({super.key});

  Color _auraColor(PremiumThemeAura aura) {
    return switch (aura) {
      PremiumThemeAura.grimm => const Color(0xFFFF3B30),
      PremiumThemeAura.hive => const Color(0xFFFFD166),
      PremiumThemeAura.cyber => const Color(0xFF00E5FF),
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Regionalização por Locale (pt_BR vs != pt_BR).
    final isBrazil = ContentRepository.isPtBrLocale(Localizations.localeOf(context));
    final theme = context.watch<AppThemeController>();
    final isPremium = ContentRepository.isPremiumForContent(theme);

    final sections = ContentRepository.investmentStrategies(
      l10n: l10n,
      isBrazil: isBrazil,
      isPremium: isPremium,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.estrategias,
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
          for (final section in sections) ...[
            _buildSectionHeader(section.title),
            const SizedBox(height: 10),
            ...section.blocks.map((b) {
              final locked = b.premiumOnly && !isPremium;
              final aura = (locked ? b.premiumAura : null);
              final auraColor = aura != null ? _auraColor(aura) : null;
              return _buildExpansionTile(
                icon: locked ? Icons.lock_outline : b.icon,
                titulo: b.title,
                auraColor: auraColor,
                locked: locked,
                conteudo: Text(
                  locked ? l10n.strategy_premiumLockedBody : b.body,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
              );
            }),
            const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildExpansionTile({
    required IconData icon,
    required String titulo,
    required Widget conteudo,
    required bool locked,
    Color? auraColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: auraColor != null
            ? Border.all(color: auraColor.withValues(alpha: 0.55), width: 1.2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
          if (auraColor != null)
            BoxShadow(
              color: auraColor.withValues(alpha: 0.22),
              blurRadius: 26,
              spreadRadius: 2,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (auraColor ?? const Color(0xFF6366F1)).withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: auraColor ?? const Color(0xFF6366F1), size: 20),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        trailing: locked
            ? Icon(Icons.lock, color: (auraColor ?? Colors.white38).withValues(alpha: 0.9))
            : const Icon(Icons.expand_more, color: Colors.white38),
        children: [conteudo],
      ),
    );
  }
}

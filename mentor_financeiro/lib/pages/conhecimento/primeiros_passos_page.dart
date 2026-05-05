import 'package:flutter/material.dart';

import '../../content/content_repository.dart';
import '../../l10n/app_localizations.dart';

class PrimeirosPassosPage extends StatelessWidget {
  const PrimeirosPassosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final isBrazil = ContentRepository.isPtBrLocale(locale);
    final passos = ContentRepository.investmentFirstSteps(
      l10n: l10n,
      isBrazil: isBrazil,
    );
    final dica = ContentRepository.investmentFirstStepsTip(
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
          l10n.investFirstSteps_title,
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
          ...List.generate(passos.length, (i) {
            final p = passos[i];
            return Column(
              children: [
                _buildPasso(i + 1, p.title, p.body, p.icon),
                if (i != passos.length - 1) const SizedBox(height: 12),
              ],
            );
          }),
          const SizedBox(height: 24),
          _buildDica(dica.title, dica.body),
        ],
      ),
    );
  }

  Widget _buildPasso(
    int numero,
    String titulo,
    String descricao,
    IconData icone,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF00D9FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '$numero',
                style: const TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icone, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  descricao,
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
      ),
    );
  }

  Widget _buildDica(String titulo, String corpo) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.withAlpha(40), Colors.green.withAlpha(15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withAlpha(75), width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb, color: Colors.green, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  corpo,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

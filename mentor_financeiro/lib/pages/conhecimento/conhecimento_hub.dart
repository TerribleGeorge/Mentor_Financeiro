import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/subscription_provider.dart';
import '../../widgets/ads/native_ad_card.dart';

class ConhecimentoHub extends StatelessWidget {
  const ConhecimentoHub({super.key});

  static const _bgCard = Color(0xFF0D1118);

  static Color _cardAccentForRoute(String rota) {
    switch (rota) {
      case '/conhecimento/investimentos':
        return const Color(0xFF00D9FF);
      case '/conhecimento/estrategias':
        return const Color(0xFF6366F1);
      case '/conhecimento/dicionario':
        return const Color(0xFF00D9FF);
      case '/conhecimento/primeiros-passos':
        return const Color(0xFF26DE81);
      case '/conhecimento/impostos':
        return const Color(0xFFFECA57);
      case '/conhecimento/perigos':
        return const Color(0xFFFF4D4D);
      case '/conhecimento/ferramentas':
        return const Color(0xFF6366F1);
      case '/conhecimento/golpes':
        return const Color(0xFFFF4D4D);
      default:
        return const Color(0xFF00D9FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Conhecimento',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            icone: Icons.trending_up,
            titulo: 'Tipos de Investimento',
            subtitulo: 'Entenda as opções do mercado',
            rota: '/conhecimento/investimentos',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.psychology,
            titulo: 'Tipos de Estratégias',
            subtitulo: 'Aprenda a investir melhor',
            rota: '/conhecimento/estrategias',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.menu_book,
            titulo: 'Dicionário do Investidor',
            subtitulo: 'Termos e conceitos essenciais',
            rota: '/conhecimento/dicionario',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.play_arrow,
            titulo: 'Primeiros Passos',
            subtitulo: 'Guia para começar a investir',
            rota: '/conhecimento/primeiros-passos',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.receipt_long,
            titulo: 'Impostos e Declaração',
            subtitulo: 'Entenda a tributação',
            rota: '/conhecimento/impostos',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.dangerous,
            titulo: 'Onde NÃO Investir',
            subtitulo: 'Cuidado com armadilhas',
            rota: '/conhecimento/perigos',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.build,
            titulo: 'Melhores Ferramentas',
            subtitulo: 'Apps e sites essenciais',
            rota: '/conhecimento/ferramentas',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.shield_outlined,
            titulo: 'Golpes',
            subtitulo: 'Como se proteger no dia a dia',
            rota: '/conhecimento/golpes',
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/quiz-conhecimento'),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _bgCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF00D9FF).withValues(alpha: 0.78),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00D9FF).withValues(alpha: 0.14),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D9FF).withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF00D9FF).withValues(alpha: 0.42),
                      ),
                    ),
                    child: const Icon(
                      Icons.quiz,
                      color: Color(0xFF00D9FF),
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Simulado de Conhecimento',
                          style: TextStyle(
                            color: Color(0xFF00D9FF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Teste seus conhecimentos',
                          style: TextStyle(color: Colors.white54, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Color(0xFF00D9FF)),
                ],
              ),
            ),
          ),
          if (!context.watch<SubscriptionProvider>().isPremium)
            const NativeAdCard(),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icone,
    required String titulo,
    required String subtitulo,
    required String rota,
  }) {
    final accent = _cardAccentForRoute(rota);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, rota),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _bgCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: accent.withValues(alpha: 0.78), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: 0.14),
              blurRadius: 18,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: accent.withValues(alpha: 0.42)),
              ),
              child: Icon(icone, color: accent, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.95),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitulo,
                    style: const TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: accent.withValues(alpha: 0.85)),
          ],
        ),
      ),
    );
  }
}

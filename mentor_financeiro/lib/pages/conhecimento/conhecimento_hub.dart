import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/locale_ui_strings.dart';
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
    final strings = LocaleUiStrings.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          strings.text('Conhecimento', en: 'Knowledge', es: 'Conocimiento'),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            icone: Icons.trending_up,
            titulo: strings.text(
              'Tipos de Investimento',
              en: 'Investment types',
              es: 'Tipos de inversión',
            ),
            subtitulo: strings.text(
              'Entenda as opções do mercado',
              en: 'Understand market options',
              es: 'Entiende las opciones del mercado',
            ),
            rota: '/conhecimento/investimentos',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.psychology,
            titulo: strings.text(
              'Tipos de Estratégias',
              en: 'Strategy types',
              es: 'Tipos de estrategias',
            ),
            subtitulo: strings.text(
              'Aprenda a investir melhor',
              en: 'Learn to invest with more clarity',
              es: 'Aprende a invertir con más claridad',
            ),
            rota: '/conhecimento/estrategias',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.menu_book,
            titulo: strings.text(
              'Dicionário do Investidor',
              en: 'Investor dictionary',
              es: 'Diccionario del inversor',
            ),
            subtitulo: strings.text(
              'Termos e conceitos essenciais',
              en: 'Essential terms and concepts',
              es: 'Términos y conceptos esenciales',
            ),
            rota: '/conhecimento/dicionario',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.play_arrow,
            titulo: strings.text(
              'Primeiros Passos',
              en: 'First steps',
              es: 'Primeros pasos',
            ),
            subtitulo: strings.text(
              'Guia para começar a investir',
              en: 'Guide to start investing',
              es: 'Guía para empezar a invertir',
            ),
            rota: '/conhecimento/primeiros-passos',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.receipt_long,
            titulo: strings.text(
              'Impostos e Declaração',
              en: 'Taxes and reporting',
              es: 'Impuestos y declaración',
            ),
            subtitulo: strings.text(
              'Entenda a tributação',
              en: 'Understand local tax rules',
              es: 'Entiende las reglas fiscales locales',
            ),
            rota: '/conhecimento/impostos',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.dangerous,
            titulo: strings.text(
              'Onde NÃO Investir',
              en: 'Where not to invest',
              es: 'Dónde no invertir',
            ),
            subtitulo: strings.text(
              'Cuidado com armadilhas',
              en: 'Watch out for traps',
              es: 'Cuidado con trampas',
            ),
            rota: '/conhecimento/perigos',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.build,
            titulo: strings.text(
              'Melhores Ferramentas',
              en: 'Best tools',
              es: 'Mejores herramientas',
            ),
            subtitulo: strings.text(
              'Apps e sites essenciais',
              en: 'Useful apps and sites',
              es: 'Apps y sitios útiles',
            ),
            rota: '/conhecimento/ferramentas',
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icone: Icons.shield_outlined,
            titulo: strings.text('Golpes', en: 'Scams', es: 'Estafas'),
            subtitulo: strings.text(
              'Como se proteger no dia a dia',
              en: 'How to protect yourself day to day',
              es: 'Cómo protegerte en el día a día',
            ),
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
                      children: [
                        Text(
                          strings.text(
                            'Simulado de Conhecimento',
                            en: 'Knowledge quiz',
                            es: 'Simulado de conocimiento',
                          ),
                          style: const TextStyle(
                            color: Color(0xFF00D9FF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          strings.text(
                            'Teste seus conhecimentos',
                            en: 'Test your knowledge',
                            es: 'Pon a prueba tus conocimientos',
                          ),
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
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

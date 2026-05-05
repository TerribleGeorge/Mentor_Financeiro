import 'package:flutter/material.dart';
import '../../widgets/ads/native_ad_card.dart';

class ConhecimentoHub extends StatelessWidget {
  const ConhecimentoHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Conhecimento',
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/quiz-conhecimento'),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF00D9FF).withAlpha(40),
                    const Color(0xFF00D9FF).withAlpha(15),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF00D9FF).withAlpha(128),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D9FF).withAlpha(40),
                      borderRadius: BorderRadius.circular(12),
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
                        const Text(
                          'Simulado de Conhecimento',
                          style: TextStyle(
                            color: Color(0xFF00D9FF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
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
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, rota),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.indigo.withAlpha(25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icone, color: Colors.indigo, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.white,
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
            const Icon(Icons.chevron_right, color: Colors.white38),
          ],
        ),
      ),
    );
  }
}

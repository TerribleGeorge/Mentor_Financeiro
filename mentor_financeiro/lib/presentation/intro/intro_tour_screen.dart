import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_routes.dart';
import '../../theme/mentor_adaptive_visuals.dart';
import '../../widgets/mentor_readable_layer.dart';

/// Chave em [SharedPreferences]: introdução motivacional + dicas já concluída.
const String kIntroMentorTourCompletedKey = 'intro_mentor_tour_v1_done';

/// Tour de boas-vindas: apoio moral, regra das 3 perguntas e importância de preencher o app.
class IntroTourScreen extends StatefulWidget {
  const IntroTourScreen({super.key, this.fromSettings = false});

  /// `true` quando aberto a partir das Definições — ao terminar só dá [pop].
  final bool fromSettings;

  @override
  State<IntroTourScreen> createState() => _IntroTourScreenState();
}

class _IntroTourScreenState extends State<IntroTourScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  static const List<_IntroSlide> _slides = [
    _IntroSlide(
      title: 'Bem-vindo, campeão',
      body:
          'Você é um vencedor. Este app existe para te apoiar a não desistir dos seus sonhos — '
          'com organização, clareza e um passo de cada vez. Respira: você consegue.',
      icon: Icons.emoji_events_outlined,
    ),
    _IntroSlide(
      title: 'Valores e família',
      body:
          'Nunca abandone os princípios e valores que escolheu para a sua vida. '
          'A família que você constrói — seja de sangue ou de escolha — merece o melhor de você. '
          'Cuidar das finanças é também um gesto de cuidado com quem ama.',
      icon: Icons.favorite_outline,
    ),
    _IntroSlide(
      title: 'Dificuldade não é sentença',
      body:
          'As coisas são realmente difíceis às vezes. Mas nada é impossível de superar com calma, '
          'persistência e pequenas decisões certas, repetidas todos os dias.',
      icon: Icons.terrain_outlined,
    ),
    _IntroSlide(
      title: 'Cabeça fria, decisão melhor',
      body:
          'Muitas das piores escolhas financeiras acontecem quando estamos tristes, com raiva '
          '— e até quando estamos muito felizes demais. Mantenha a calma. Pense. Analise. '
          'É necessário. É importante.',
      icon: Icons.ac_unit_outlined,
    ),
    _IntroSlide(
      title: 'A regra das 3 verdades',
      body:
          'Antes de gastar, investir ou comprometer dinheiro, pergunte a si mesmo com honestidade: '
          '“Eu realmente quero isso?” Faça três perguntas equivalentes (três ângulos: necessidade, '
          'consequência, alinhamento com o que importa). Se as três forem verdadeiras, pode seguir. '
          'Se pelo menos uma for falsa, não faça — espere, revise ou escolha outro caminho.',
      icon: Icons.fact_check_outlined,
    ),
    _IntroSlide(
      title: 'Preencha o app para o Mentor agir',
      body:
          'Para notificações de gastos, limite diário, histórico, gráficos e relatórios funcionarem '
          'como devem, preencha os campos em Configurar finanças (renda, gastos fixos, saldo) e '
          'autorize o que o sistema pedir (ex.: leitor de notificações no Android). '
          'Quanto mais completo, mais o app cumpre o papel de mentor ao seu lado.',
      icon: Icons.tune_outlined,
    ),
    _IntroSlide(
      title: 'Estudar, empreender, investir',
      body:
          'Pode ser divertido aprender, testar ideias e ver o dinheiro como ferramenta — não como '
          'castigo. Explore o app com curiosidade: Conhecimento, metas, simulados. '
          'Cada clique consciente é um voto na vida que você quer construir.',
      icon: Icons.rocket_launch_outlined,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    if (!widget.fromSettings) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kIntroMentorTourCompletedKey, true);
    }
    if (!mounted) return;
    if (widget.fromSettings && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      return;
    }
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final v = context.mentorAdaptive;
    final last = _page == _slides.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF020617),
              Color(0xFF0F172A),
              Color(0xFF042f2e),
            ],
          ),
        ),
        child: SafeArea(
          child: MentorReadableLayer(
            child: Column(
              children: [
                Row(
                  children: [
                    if (widget.fromSettings)
                      IconButton(
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: Icon(Icons.close, color: v.secondaryTextColor),
                      ),
                    const Spacer(),
                    TextButton(
                      onPressed: _finish,
                      child: Text(
                        widget.fromSettings ? 'Fechar' : 'Pular',
                        style: TextStyle(color: v.secondaryTextColor),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _slides.length,
                    onPageChanged: (i) => setState(() => _page = i),
                    itemBuilder: (context, i) {
                      final s = _slides[i];
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            Icon(s.icon, size: 68, color: const Color(0xFF00D9FF)),
                            const SizedBox(height: 24),
                            Text(
                              s.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: v.textColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              s.body,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: v.secondaryTextColor,
                                height: 1.45,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _slides.length,
                    (i) => Container(
                      margin: const EdgeInsets.all(4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == _page
                            ? const Color(0xFF00D9FF)
                            : v.textColor.withValues(alpha: 0.22),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FilledButton(
                        onPressed: () {
                          if (!last) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 320),
                              curve: Curves.easeOutCubic,
                            );
                          } else {
                            _finish();
                          }
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF00D9FF),
                          foregroundColor: const Color(0xFF0F172A),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          last
                              ? (widget.fromSettings ? 'Concluir' : 'Começar no app')
                              : 'Continuar',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      if (last && !widget.fromSettings) ...[
                        const SizedBox(height: 10),
                        Text(
                          'Entendeu a ideia: apoio, calma, três perguntas honestas e dados completos no app. '
                          'Conte com o Mentor.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: v.secondaryTextColor.withValues(alpha: 0.9),
                            fontSize: 12,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IntroSlide {
  final String title;
  final String body;
  final IconData icon;

  const _IntroSlide({
    required this.title,
    required this.body,
    required this.icon,
  });
}

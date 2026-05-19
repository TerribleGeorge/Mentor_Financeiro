import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_routes.dart';
import '../../services/locale_ui_strings.dart';
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

  List<_IntroSlide> _slides(BuildContext context) {
    final strings = LocaleUiStrings.of(context);
    return [
      _IntroSlide(
        title: strings.text(
          'Bem-vindo, campeão',
          en: 'Welcome, champion',
          es: 'Bienvenido, campeón',
        ),
        body: strings.text(
          'Você é um vencedor. Este app existe para te apoiar a não desistir dos seus sonhos — '
          'com organização, clareza e um passo de cada vez. Respira: você consegue.',
          en:
              'You are a winner. This app exists to help you not give up on your dreams, '
              'with organization, clarity, and one step at a time. Breathe: you can do this.',
          es:
              'Eres un ganador. Esta app existe para ayudarte a no renunciar a tus sueños, '
              'con organización, claridad y un paso a la vez. Respira: puedes lograrlo.',
        ),
        icon: Icons.emoji_events_outlined,
      ),
      _IntroSlide(
        title: strings.text(
          'Valores e família',
          en: 'Values and family',
          es: 'Valores y familia',
        ),
        body: strings.text(
          'Nunca abandone os princípios e valores que escolheu para a sua vida. '
          'A família que você constrói — seja de sangue ou de escolha — merece o melhor de você. '
          'Cuidar das finanças é também um gesto de cuidado com quem ama.',
          en:
              'Never abandon the principles and values you chose for your life. '
              'The family you build, by blood or by choice, deserves your best. '
              'Caring for your finances is also caring for the people you love.',
          es:
              'Nunca abandones los principios y valores que elegiste para tu vida. '
              'La familia que construyes, de sangre o elegida, merece lo mejor de ti. '
              'Cuidar tus finanzas también es cuidar a quienes amas.',
        ),
        icon: Icons.favorite_outline,
      ),
      _IntroSlide(
        title: strings.text(
          'Dificuldade não é sentença',
          en: 'Difficulty is not a sentence',
          es: 'La dificultad no es una sentencia',
        ),
        body: strings.text(
          'As coisas são realmente difíceis às vezes. Mas nada é impossível de superar com calma, '
          'persistência e pequenas decisões certas, repetidas todos os dias.',
          en:
              'Things really are hard sometimes. But nothing is impossible to overcome with calm, '
              'persistence, and small right decisions repeated every day.',
          es:
              'A veces las cosas son realmente difíciles. Pero nada es imposible de superar con calma, '
              'persistencia y pequeñas decisiones correctas repetidas cada día.',
        ),
        icon: Icons.terrain_outlined,
      ),
      _IntroSlide(
        title: strings.text(
          'Cabeça fria, decisão melhor',
          en: 'Cool head, better decision',
          es: 'Cabeza fría, mejor decisión',
        ),
        body: strings.text(
          'Muitas das piores escolhas financeiras acontecem quando estamos tristes, com raiva '
          '— e até quando estamos muito felizes demais. Mantenha a calma. Pense. Analise. '
          'É necessário. É importante.',
          en:
              'Many of the worst financial choices happen when we are sad, angry, '
              'or even too excited. Stay calm. Think. Analyze. It is necessary. It matters.',
          es:
              'Muchas de las peores decisiones financieras ocurren cuando estamos tristes, con rabia '
              'o incluso demasiado felices. Mantén la calma. Piensa. Analiza. Es necesario. Es importante.',
        ),
        icon: Icons.ac_unit_outlined,
      ),
      _IntroSlide(
        title: strings.text(
          'A regra das 3 verdades',
          en: 'The 3 truths rule',
          es: 'La regla de las 3 verdades',
        ),
        body: strings.text(
          'Antes de gastar, investir ou comprometer dinheiro, pergunte a si mesmo com honestidade: '
          '“Eu realmente quero isso?” Faça três perguntas equivalentes (três ângulos: necessidade, '
          'consequência, alinhamento com o que importa). Se as três forem verdadeiras, pode seguir. '
          'Se pelo menos uma for falsa, não faça — espere, revise ou escolha outro caminho.',
          en:
              'Before spending, investing, or committing money, ask yourself honestly: '
              '“Do I really want this?” Ask three equivalent questions from need, consequence, '
              'and alignment with what matters. If all three are true, proceed. '
              'If at least one is false, wait, review, or choose another path.',
          es:
              'Antes de gastar, invertir o comprometer dinero, pregúntate con honestidad: '
              '“¿Realmente quiero esto?” Haz tres preguntas equivalentes desde necesidad, consecuencia '
              'y alineación con lo importante. Si las tres son verdaderas, avanza. '
              'Si al menos una es falsa, espera, revisa o elige otro camino.',
        ),
        icon: Icons.fact_check_outlined,
      ),
      _IntroSlide(
        title: strings.text(
          'Preencha o app para o Mentor agir',
          en: 'Fill in the app so Mentor can help',
          es: 'Completa la app para que Mentor actúe',
        ),
        body: strings.text(
          'Para notificações de gastos, limite diário, histórico, gráficos e relatórios funcionarem '
          'como devem, preencha os campos em Configurar finanças (renda, gastos fixos, saldo) e '
          'autorize o que o sistema pedir (ex.: leitor de notificações no Android). '
          'Quanto mais completo, mais o app cumpre o papel de mentor ao seu lado.',
          en:
              'For spending notifications, daily limits, history, charts, and reports to work '
              'properly, fill in Configure finances (income, fixed expenses, balance) and '
              'grant the permissions requested by the system, such as notification access on Android. '
              'The more complete it is, the better the app can act as your mentor.',
          es:
              'Para que las notificaciones de gastos, límite diario, historial, gráficos e informes '
              'funcionen bien, completa Configurar finanzas (ingresos, gastos fijos, saldo) y '
              'autoriza lo que el sistema pida, como acceso a notificaciones en Android. '
              'Cuanto más completo esté, mejor cumple la app su papel de mentor.',
        ),
        icon: Icons.tune_outlined,
      ),
      _IntroSlide(
        title: strings.text(
          'Estudar, empreender, investir',
          en: 'Learn, build, invest',
          es: 'Estudiar, emprender, invertir',
        ),
        body: strings.text(
          'Pode ser divertido aprender, testar ideias e ver o dinheiro como ferramenta — não como '
          'castigo. Explore o app com curiosidade: Conhecimento, metas, simulados. '
          'Cada clique consciente é um voto na vida que você quer construir.',
          en:
              'Learning, testing ideas, and seeing money as a tool can be enjoyable, not a punishment. '
              'Explore the app with curiosity: Knowledge, goals, simulations. '
              'Every conscious tap is a vote for the life you want to build.',
          es:
              'Aprender, probar ideas y ver el dinero como herramienta puede ser divertido, no un castigo. '
              'Explora la app con curiosidad: Conocimiento, metas, simulados. '
              'Cada toque consciente es un voto por la vida que quieres construir.',
        ),
        icon: Icons.rocket_launch_outlined,
      ),
    ];
  }

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
    final slides = _slides(context);
    final strings = LocaleUiStrings.of(context);
    final last = _page == slides.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF020617), Color(0xFF0F172A), Color(0xFF042f2e)],
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
                        widget.fromSettings
                            ? strings.text('Fechar', en: 'Close', es: 'Cerrar')
                            : strings.text('Pular', en: 'Skip', es: 'Saltar'),
                        style: TextStyle(color: v.secondaryTextColor),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: slides.length,
                    onPageChanged: (i) => setState(() => _page = i),
                    itemBuilder: (context, i) {
                      final s = slides[i];
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            Icon(
                              s.icon,
                              size: 68,
                              color: const Color(0xFF00D9FF),
                            ),
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
                    slides.length,
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
                              ? (widget.fromSettings
                                    ? strings.text(
                                        'Concluir',
                                        en: 'Done',
                                        es: 'Finalizar',
                                      )
                                    : strings.text(
                                        'Começar no app',
                                        en: 'Start in the app',
                                        es: 'Empezar en la app',
                                      ))
                              : strings.text(
                                  'Continuar',
                                  en: 'Continue',
                                  es: 'Continuar',
                                ),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      if (last && !widget.fromSettings) ...[
                        const SizedBox(height: 10),
                        Text(
                          strings.text(
                            'Entendeu a ideia: apoio, calma, três perguntas honestas e dados completos no app. '
                            'Conte com o Mentor.',
                            en:
                                'That is the idea: support, calm, three honest questions, and complete data in the app. '
                                'Count on Mentor.',
                            es:
                                'Esa es la idea: apoyo, calma, tres preguntas honestas y datos completos en la app. '
                                'Cuenta con Mentor.',
                          ),
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

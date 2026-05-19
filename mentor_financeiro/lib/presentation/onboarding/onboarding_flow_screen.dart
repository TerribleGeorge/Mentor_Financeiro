import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_routes.dart';
import '../../services/firebase_service.dart';
import '../../services/locale_ui_strings.dart';
import '../../services/user_persona_service.dart';
import '../../theme/mentor_adaptive_visuals.dart';
import '../../widgets/mentor_readable_layer.dart';

/// Três slides introdutórios do Mentor (fluxo v2).
class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  List<_SlideData> _slides(BuildContext context) {
    final strings = LocaleUiStrings.of(context);
    return [
      _SlideData(
        title: strings.text(
          'O Mentor não é corretora',
          en: 'Mentor is not a broker',
          es: 'Mentor no es una corredora',
        ),
        body: strings.text(
          'Somos orientação: dados de mercado, simulações e papo reto para você decidir com mais clareza — em qualquer país.',
          en: 'We provide guidance: market data, simulations, and straight talk so you can decide with more clarity in any country.',
          es: 'Somos orientación: datos de mercado, simulaciones y conversación directa para que decidas con más claridad en cualquier país.',
        ),
        icon: Icons.psychology_outlined,
      ),
      _SlideData(
        title: strings.text(
          'Perfil importa',
          en: 'Profile matters',
          es: 'El perfil importa',
        ),
        body: strings.text(
          'Iniciante, Estrategista, Arrojado ou Poupador: o tom das dicas muda para combinar com você.',
          en: 'Beginner, Strategist, Bold, or Saver: the tone of the tips changes to match you.',
          es: 'Principiante, Estratega, Arriesgado o Ahorrador: el tono de los consejos cambia para adaptarse a ti.',
        ),
        icon: Icons.tune,
      ),
      _SlideData(
        title: strings.text(
          'Próximo: seu perfil',
          en: 'Next: your profile',
          es: 'Siguiente: tu perfil',
        ),
        body: strings.text(
          'Em seguida, escolha como prefere ouvir o Mentor. Depois, o painel principal e a calculadora.',
          en: 'Next, choose how you prefer to hear from Mentor. Then comes the main dashboard and calculator.',
          es: 'Luego, elige cómo prefieres escuchar a Mentor. Después vienen el panel principal y la calculadora.',
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
    await UserPersonaService.instance.setMentorOnboardingComplete();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      try {
        await FirebaseService.completarOnboarding(uid);
      } catch (_) {}
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_completo', true);
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.personaSetup);
  }

  @override
  Widget build(BuildContext context) {
    final v = context.mentorAdaptive;
    final slides = _slides(context);
    final strings = LocaleUiStrings.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: MentorReadableLayer(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _finish(),
                  child: Text(
                    strings.text('Pular', en: 'Skip', es: 'Saltar'),
                    style: TextStyle(color: v.secondaryTextColor),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: slides.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (context, i) {
                    final s = slides[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            s.icon,
                            size: 72,
                            color: const Color(0xFF00D9FF),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            s.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: v.textColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            s.body,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: v.secondaryTextColor,
                              height: 1.4,
                            ),
                          ),
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
                          : v.textColor.withValues(alpha: 0.24),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (_page < slides.length - 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
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
                      _page < slides.length - 1
                          ? strings.text(
                              'Continuar',
                              en: 'Continue',
                              es: 'Continuar',
                            )
                          : strings.text(
                              'Definir perfil',
                              en: 'Set profile',
                              es: 'Definir perfil',
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SlideData {
  final String title;
  final String body;
  final IconData icon;

  const _SlideData({
    required this.title,
    required this.body,
    required this.icon,
  });
}

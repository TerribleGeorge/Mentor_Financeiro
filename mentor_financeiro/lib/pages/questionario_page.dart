import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/navigation/post_login_navigation.dart';
import '../services/firebase_service.dart';
import '../services/locale_ui_strings.dart';

class QuestionarioPage extends StatefulWidget {
  const QuestionarioPage({super.key});

  @override
  State<QuestionarioPage> createState() => _QuestionarioPageState();
}

class _QuestionarioPageState extends State<QuestionarioPage> {
  String _profissao = "";
  String _perfilInvestidor = "";
  String _objetivos = "";
  bool _salvando = false;

  static const List<String> _perfis = ["Conservador", "Moderado", "Arrojado"];

  String _perfilLabel(BuildContext context, String perfil) {
    final strings = LocaleUiStrings.of(context);
    return switch (perfil) {
      'Conservador' => strings.text(
        'Conservador',
        en: 'Conservative',
        es: 'Conservador',
      ),
      'Moderado' => strings.text('Moderado', en: 'Moderate', es: 'Moderado'),
      'Arrojado' => strings.text('Arrojado', en: 'Bold', es: 'Arriesgado'),
      _ => perfil,
    };
  }

  Future<void> _salvar() async {
    final strings = LocaleUiStrings.of(context);
    if (_profissao.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            strings.text(
              'Preencha sua profissão',
              en: 'Enter your profession',
              es: 'Completa tu profesión',
            ),
          ),
        ),
      );
      return;
    }
    if (_perfilInvestidor.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            strings.text(
              'Selecione um perfil de investidor (Conservador, Moderado ou Arrojado).',
              en: 'Select an investor profile (Conservative, Moderate, or Bold).',
              es: 'Selecciona un perfil de inversor (Conservador, Moderado o Arriesgado).',
            ),
          ),
        ),
      );
      return;
    }

    setState(() => _salvando = true);
    var ok = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      final uid = prefs.getString('uid') ?? FirebaseService.usuarioAtual?.uid;
      final profissao = _profissao.trim();
      final perfil = _perfilInvestidor.toLowerCase();
      final objetivos = _objetivos.trim();

      await prefs.setString('profissao', profissao);
      await prefs.setString('perfil_investidor', perfil);
      await prefs.setString('objetivos', objetivos);
      await prefs.setBool('perfil_completo', true);
      await prefs.setBool('onboarding_completo', true);
      if (uid != null) {
        await prefs.setString('uid', uid);
      }
      ok = true;

      // A entrada no app deve ser instantânea. A nuvem sincroniza depois,
      // sem prender o botão em carregamento quando rede/regras falham.
      if (uid != null) {
        unawaited(
          Future<void>(() async {
            await FirebaseService.salvarPerfilCompleto(
              uid: uid,
              profissao: profissao,
              perfilInvestidor: perfil,
              objetivos: objetivos,
            );
            await FirebaseService.completarOnboarding(uid);
            try {
              await FirebaseService.inscricaoTopico(perfil);
            } catch (_) {}
          }).catchError((Object e, StackTrace st) {
            debugPrint('QuestionarioPage sync: $e\n$st');
          }),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              strings.text(
                'Perfil salvo neste aparelho. Entre em uma conta para sincronizar.',
                en: 'Profile saved on this device. Sign in to sync.',
                es: 'Perfil guardado en este dispositivo. Inicia sesión para sincronizar.',
              ),
            ),
          ),
        );
      }
    } catch (e, st) {
      debugPrint('QuestionarioPage._salvar: $e\n$st');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              strings.text(
                'Não foi possível guardar o perfil. Verifique a ligação à internet e tente novamente.',
                en: 'Could not save the profile. Check your internet connection and try again.',
                es: 'No se pudo guardar el perfil. Revisa tu conexión a internet e inténtalo de nuevo.',
              ),
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _salvando = false);
    }

    if (mounted && ok) {
      await mentorReplaceWithIntroOrMain(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = LocaleUiStrings.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                strings.text(
                  'Conte-nos sobre você',
                  en: 'Tell us about yourself',
                  es: 'Cuéntanos sobre ti',
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                strings.text(
                  'Essas informações nos ajudam a personalizar sua experiência.',
                  en: 'This information helps us personalize your experience.',
                  es: 'Esta información nos ayuda a personalizar tu experiencia.',
                ),
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 40),
              TextField(
                onChanged: (v) => _profissao = v,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  labelText: strings.text(
                    'Qual é a sua profissão?',
                    en: 'What is your profession?',
                    es: '¿Cuál es tu profesión?',
                  ),
                  hintText: strings.text(
                    'Ex: Desenvolvedor, Professor, Empresário...',
                    en: 'Example: Developer, Teacher, Entrepreneur...',
                    es: 'Ej.: Desarrollador, Profesor, Empresario...',
                  ),
                  labelStyle: const TextStyle(color: Colors.white70),
                  hintStyle: TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: const Color(0xFF1E293B),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF00D9FF)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                strings.text(
                  'Qual é o seu perfil de investidor?',
                  en: 'What is your investor profile?',
                  es: '¿Cuál es tu perfil de inversor?',
                ),
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: List.generate(_perfis.length, (index) {
                  final perfil = _perfis[index];
                  final isSelected = _perfilInvestidor == perfil;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: index < 2 ? 8 : 0),
                      child: GestureDetector(
                        onTap: () => setState(() => _perfilInvestidor = perfil),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF00D9FF)
                                : const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF00D9FF)
                                  : Colors.white24,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                index == 0
                                    ? Icons.shield
                                    : index == 1
                                    ? Icons.balance
                                    : Icons.show_chart,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white70,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _perfilLabel(context, perfil),
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              TextField(
                onChanged: (v) => _objetivos = v,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: strings.text(
                    'Quais são os seus objetivos financeiros?',
                    en: 'What are your financial goals?',
                    es: '¿Cuáles son tus objetivos financieros?',
                  ),
                  hintText: strings.text(
                    'Ex: Aposentar cedo, comprar casa...',
                    en: 'Example: Retire early, buy a home...',
                    es: 'Ej.: Jubilarme temprano, comprar casa...',
                  ),
                  labelStyle: const TextStyle(color: Colors.white70),
                  hintStyle: TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: const Color(0xFF1E293B),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF00D9FF)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _salvando ? null : _salvar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: _salvando
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          strings.text(
                            'Continuar',
                            en: 'Continue',
                            es: 'Continuar',
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

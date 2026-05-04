import 'package:flutter/material.dart';

import '../../core/constants/app_routes.dart';
import '../../domain/entities/user_persona.dart';
import '../../services/user_persona_service.dart';

/// Escolha inicial do tom do Mentor.
class PersonaSetupScreen extends StatefulWidget {
  const PersonaSetupScreen({super.key});

  @override
  State<PersonaSetupScreen> createState() => _PersonaSetupScreenState();
}

class _PersonaSetupScreenState extends State<PersonaSetupScreen> {
  UserPersona _selected = UserPersona.novice;

  Future<void> _confirm() async {
    await UserPersonaService.instance.setPersona(_selected);
    await UserPersonaService.instance.setMentorPersonaSetupComplete();
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          'Seu perfil no Mentor',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Como você prefere receber orientações?',
            style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.35),
          ),
          const SizedBox(height: 20),
          ...UserPersona.values.map((p) {
            final sel = p == _selected;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Material(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () => setState(() => _selected = p),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: sel ? const Color(0xFF00D9FF) : Colors.white12,
                        width: sel ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          sel ? Icons.radio_button_checked : Icons.radio_button_off,
                          color: sel ? const Color(0xFF00D9FF) : Colors.white38,
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: Text(_label(p), style: const TextStyle(color: Colors.white))),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _confirm,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF00D9FF),
              foregroundColor: const Color(0xFF0F172A),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text('Ir para o painel', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  String _label(UserPersona p) {
    switch (p) {
      case UserPersona.novice:
        return 'Iniciante — linguagem simples e foco em segurança';
      case UserPersona.strategist:
        return 'Estrategista — dados, taxas e eficiência';
      case UserPersona.riskTaker:
        return 'Arrojado — papo direto e oportunidades';
      case UserPersona.conservative:
        return 'Poupador — preservação e previsibilidade';
    }
  }
}

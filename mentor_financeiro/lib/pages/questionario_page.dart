import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/firebase_service.dart';
import 'tela_home.dart';

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

  Future<void> _salvar() async {
    if (_profissao.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Preencha sua profissão")));
      return;
    }

    setState(() => _salvando = true);

    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');

    if (uid != null) {
      await FirebaseService.salvarPerfilCompleto(
        uid: uid,
        profissao: _profissao,
        perfilInvestidor: _perfilInvestidor.toLowerCase(),
        objetivos: _objetivos,
      );
      await FirebaseService.completarOnboarding(uid);
      await prefs.setBool('onboarding_completo', true);
      await prefs.setString(
        'perfil_investidor',
        _perfilInvestidor.toLowerCase(),
      );
      await FirebaseService.inscricaoTopico(_perfilInvestidor.toLowerCase());
    }

    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const TelaHome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                "Conte-nos sobre você",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Essas informações nos ajudam a personalizar sua experiência.",
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
              SizedBox(height: 40),
              TextField(
                onChanged: (v) => _profissao = v,
                style: TextStyle(color: Colors.grey[800], fontSize: 16),
                decoration: InputDecoration(
                  labelText: "Qual é a sua profissão?",
                  hintText: "Ex: Desenvolvedor, Professor, Empresário...",
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF00D9FF)),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Qual é o seu perfil de investidor?",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
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
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF00D9FF)
                                  : Colors.grey[300]!,
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
                                    : Colors.grey[600],
                              ),
                              SizedBox(height: 4),
                              Text(
                                perfil,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey[800],
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
              SizedBox(height: 24),
              TextField(
                onChanged: (v) => _objetivos = v,
                style: TextStyle(color: Colors.grey[800], fontSize: 16),
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: "Quais são os seus objetivos financeiros?",
                  hintText: "Ex: Aposentar cedo, comprar casa...",
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF00D9FF)),
                  ),
                ),
              ),
              const Spacer(),
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
                      : const Text(
                          "Continuar",
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

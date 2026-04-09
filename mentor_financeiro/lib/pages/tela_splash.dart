import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> with TickerProviderStateMixin {
  late AnimationController _controlador;
  late Animation<double> _animacaoOpacidade;
  late Animation<double> _animacaoEscala;

  @override
  void initState() {
    super.initState();
    _controlador = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _animacaoOpacidade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controlador,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _animacaoEscala = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controlador,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
      ),
    );
    _controlador.forward();
    _iniciarApp();
  }

  Future<void> _iniciarApp() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    final prefs = await SharedPreferences.getInstance();
    bool configurado = prefs.getBool('configurado') ?? false;
    if (mounted) {
      if (configurado) {
        Navigator.of(context).pushReplacementNamed('/principal');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    }
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF0F172A)],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controlador,
            builder: (context, child) {
              return Opacity(
                opacity: _animacaoOpacidade.value,
                child: Transform.scale(
                  scale: _animacaoEscala.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF00D9FF,
                              ).withValues(alpha: 0.4),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icon/app_icon.png',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "MENTOR FINANCEIRO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: 150,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white.withValues(alpha: 0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF00D9FF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "v1.0.5 • Carregando...",
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

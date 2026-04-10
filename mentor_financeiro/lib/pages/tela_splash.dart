// ==============================================================================
// TELA SPLASH - TELA DE ABERTURA
// ==============================================================================
// Tela inicial exibida ao abrir o app.
// Responsável por:
//
// - Exibir logo e nome do app
// - Animação de carregamento (2.5 segundos)
// - Verificar configuração inicial do usuário
// - Redirecionar para login ou tela principal
//
// Importance: Primeira impressão do app
// Impacto: Define tom profissional e confiável
// ==============================================================================

// Flutter Material - Widgets base
import 'package:flutter/material.dart';

// SharedPreferences - Armazenamento local
import 'package:shared_preferences/shared_preferences.dart';

// ==============================================================================
// WIDGET STATEFUL (COM ESTADO)
// ==============================================================================
// Precis de estado para animação
// ==============================================================================
class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

// ==============================================================================
// ESTADO DA TELA SPLASH
// ==============================================================================
class _TelaSplashState extends State<TelaSplash> with TickerProviderStateMixin {
  // ==============================================================================
  // CONTROLADORES DE ANIMAÇÃO
  // ==============================================================================

  // Controlador principal da animação
  // Gerencia tempo e progresso da animação
  late AnimationController _controlador;

  // Animação de opacidade (fade in)
  // Importância: Logo aparece suavemente
  late Animation<double> _animacaoOpacidade;

  // Animação de escala (zoom in)
  // Importância: Efeito visual impactante
  late Animation<double> _animacaoEscala;

  // ==============================================================================
  // CICLO DE VIDA: INIT STATE
  // ==============================================================================
  // Executado quando o widget é criado
  @override
  void initState() {
    super.initState();

    // Configura controlador com duração de 2.5 segundos
    // Por quê: Tempo suficiente para branding
    _controlador = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // ==============================================================================
    // ANIMAÇÃO DE OPACIDADE
    // ==============================================================================
    // De 0% (invisível) para 100% (visível)
    // Com curva easeOut: começa rápido, desacelera
    _animacaoOpacidade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controlador,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    // ==============================================================================
    // ANIMAÇÃO DE ESCALA
    // ==============================================================================
    // De 50% para 100% do tamanho
    // Com curva elasticOut: efeito de mola
    _animacaoEscala = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controlador,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
      ),
    );

    // Inicia a animação
    _controlador.forward();

    // Inicia verificação do app
    _iniciarApp();
  }

  // ==============================================================================
  // VERIFICAÇÃO INICIAL
  // ==============================================================================
  // Verifica se usuário já configurou o app
  // e redireciona para tela correta
  Future<void> _iniciarApp() async {
    // Espera 3 segundos para animação completar
    // Por quê: Branding - não pular logo
    await Future.delayed(const Duration(milliseconds: 3000));

    // Busca configuração no armazenamento local
    final prefs = await SharedPreferences.getInstance();
    bool configurado = prefs.getBool('configurado') ?? false;

    // Verifica se widget ainda está mounted
    if (mounted) {
      // Se já configurado: vai para tela principal
      // Se não configurado: vai para login
      if (configurado) {
        Navigator.of(context).pushReplacementNamed('/principal');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    }
  }

  // ==============================================================================
  // LIMPEZA DE RECURSOS
  // ==============================================================================
  // Dispose é executado quando widget é destruído
  // Importance: Evita memory leaks
  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  // ==============================================================================
  // BUILD (CONSTRUÇÃO DA UI)
  // ==============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo azul escuro
      backgroundColor: const Color(0xFF0F172A),

      // Container com gradiente
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Gradiente sutil: mais escuro nas pontas
            colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF0F172A)],
          ),
        ),

        // Centraliza conteúdo
        child: Center(
          // AnimatedBuilder reconstrói quando animado
          child: AnimatedBuilder(
            animation: _controlador,
            builder: (context, child) {
              return Opacity(
                // Aplica animação de opacidade
                opacity: _animacaoOpacidade.value,
                child: Transform.scale(
                  // Aplica animação de escala
                  scale: _animacaoEscala.value,
                  child: Column(
                    // Centraliza verticalmente
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ==============================================================================
                      // LOGO DO APP
                      // ==============================================================================
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          // Formato circular
                          shape: BoxShape.circle,
                          // Sutil Glow effect
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
                          // Imagem do ícone
                          child: Image.asset(
                            'assets/icon/app_icon.png',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // ==============================================================================
                      // NOME DO APP
                      // ==============================================================================
                      const Text(
                        "MENTOR FINANCEIRO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4, // Espaçamento entre letras
                        ),
                      ),
                      const SizedBox(height: 50),

                      // ==============================================================================
                      // INDICADOR DE CARREGAMENTO
                      // ==============================================================================
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

                      // ==============================================================================
                      // VERSÃO
                      // ==============================================================================
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

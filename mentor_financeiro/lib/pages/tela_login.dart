// ==============================================================================
// TELA LOGIN - TELA DE LOGIN/CADASTRO
// ==============================================================================
// Tela de onboarding e autenticação do app.
//
// Fluxo de páginas (PageView):
// 1. Boas vindas - Apresentação do app
// 2. Login - Escolha método de autenticação
// 3. Nome - Cadastro do nome do usuário
// 4. Plano - Escolha do plano (Free/Premium)
//
// Importance: Primeira autenticação e configuração
// Impacto: Taxa de conversão e engajamento inicial
// ==============================================================================

// Flutter Material
import 'package:flutter/material.dart';

// Armazenamento local
import 'package:shared_preferences/shared_preferences.dart';

// Firebase Auth
import 'package:firebase_auth/firebase_auth.dart';

// Serviço Firebase
import '../services/firebase_service.dart';

// Tela de configuração (próxima etapa)
import 'tela_configuracao.dart';

// ==============================================================================
// WIDGET STATEFUL
// ==============================================================================
class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

// ==============================================================================
// ESTADO DA TELA LOGIN
// ==============================================================================
class _TelaLoginState extends State<TelaLogin> {
  // ==============================================================================
  // CONTROLADORES
  // ==============================================================================

  // PageView: controlle de navegação entre páginas
  final PageController _pageController = PageController();

  // TextField: controlller para campo de nome
  final TextEditingController _nomeController = TextEditingController();

  // Página atual do PageView (0-3)
  int _paginaAtual = 0;

  // Estado de carregamento (bloqueia interação durante processo)
  bool _carregando = false;

  // Método de login escolhido (google, apple, celular, anonimo)
  String? _metodoLogin;

  // Usuário Firebase (se logado)
  User? _usuarioFirebase;

  // ==============================================================================
  // BUILD (CONSTRUÇÃO DA UI)
  // ==============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo azul escuro
      backgroundColor: const Color(0xFF0F172A),

      // SafeArea: avoid áreas do sistema (notch, etc)
      body: SafeArea(
        child: Column(
          children: [
            // ==============================================================================
            // PAGE VIEW (CONTEÚDO PRINCIPAL)
            // ==============================================================================
            Expanded(
              child: PageView(
                controller: _pageController,
                // Atualiza página atual ao navegar
                onPageChanged: (index) => setState(() => _paginaAtual = index),
                children: [
                  _paginaBoasVindas(),
                  _paginaLogin(),
                  _paginaNome(),
                  _paginaPlano(),
                ],
              ),
            ),

            // Indicadores de página (trimestres)
            _indicadores(),

            // Botões de navegação
            _botoesNavegacao(),
          ],
        ),
      ),
    );
  }

  // ==============================================================================
  // PÁGINA 1: BOAS VINDAS
  // ==============================================================================
  Widget _paginaBoasVindas() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(height: 40),

          // Logo "MF"
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF00D9FF), Color(0xFF3B82F6)],
              ),
            ),
            child: const Center(
              child: Text(
                "MF",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // "BEM-VINDO AO"
          const Text(
            "BEM-VINDO AO",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              letterSpacing: 4,
            ),
          ),

          // "MENTOR FINANCEIRO"
          const Text(
            "MENTOR FINANCEIRO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // tagline
          const Text(
            "O app que transforma sua vida!",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 40),

          // Cards de funcionalidades
          _cartaoFuncionalidade(
            Icons.auto_awesome,
            "Karine IA",
            "Sua mentora financeira pessoal",
          ),
          const SizedBox(height: 12),
          _cartaoFuncionalidade(
            Icons.account_balance_wallet,
            "Controle Total",
            "Acompanhe gastos e limites",
          ),
          const SizedBox(height: 12),
          _cartaoFuncionalidade(
            Icons.security,
            "Dados Seguros",
            "Privacidade em primeiro lugar",
          ),
          const SizedBox(height: 12),
          _cartaoFuncionalidade(
            Icons.trending_up,
            "Metas e Sonhos",
            "Planeje seu futuro financeiro",
          ),
        ],
      ),
    );
  }

  // ==============================================================================
  // PÁGINA 2: LOGIN
  // ==============================================================================
  Widget _paginaLogin() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "ENTRAR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Escolha como quer continuar",
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 40),

          // Botão login Google
          _botaoLogin(
            const Icon(Icons.g_mobiledata, color: Colors.white, size: 28),
            "Continuar com Google",
            const Color(0xFF4285F4),
            _loginGoogle,
          ),
          const SizedBox(height: 15),

          // Botão login Apple
          _botaoLogin(
            const Icon(Icons.apple, color: Colors.white),
            "Continuar com Apple",
            Colors.black,
            _loginApple,
          ),
          const SizedBox(height: 15),

          // Botão login Celular
          _botaoLogin(
            const Icon(Icons.phone_android, color: Colors.white),
            "Continuar com Celular",
            const Color(0xFF00D9FF),
            _loginCelular,
          ),
          const SizedBox(height: 15),

          // Botão anônimo
          _botaoLogin(
            const Icon(Icons.person_outline, color: Colors.white54),
            "Continuar sem conta",
            const Color(0xFF1E293B),
            _loginAnonimo,
          ),

          const SizedBox(height: 30),
          const Text(
            "Ao continuar, você aceita nossos Termos de Uso e Política de Privacidade.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, fontSize: 11),
          ),
        ],
      ),
    );
  }

  // Widget reutilizável para botão de login
  Widget _botaoLogin(
    Widget icone,
    String texto,
    Color cor,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(15),
          // Borda para modo anônimo
          border: cor == const Color(0xFF1E293B)
              ? Border.all(color: Colors.white24)
              : null,
        ),
        child: Row(
          children: [
            icone,
            const SizedBox(width: 15),
            Text(
              texto,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==============================================================================
  // PÁGINA 3: NOME
  // ==============================================================================
  Widget _paginaNome() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            "QUAL É O SEU NOME?",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Como você gostaria\nde ser chamado?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
              ),
            ),
            child: TextField(
              controller: _nomeController,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Seu nome",
                hintStyle: TextStyle(color: Colors.white38),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================================
  // PÁGINA 4: PLANO
  // ==============================================================================
  Widget _paginaPlano() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "ESCOLHA SEU PLANO",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 30),

          // Plano Free
          _planoCard("FREE", "R\$ 0/mês", const Color(0xFF00D9FF), [
            "✅ Configuração básica",
            "✅ Cálculo automático de limite",
            "✅ Karine IA (respostas limitadas)",
            "✅ Registro de gastos diário",
            "✅ Simulador de metas",
          ]),
          const SizedBox(height: 20),

          // Plano Premium
          _planoCard("PREMIUM", "R\$ 19,90/mês", Colors.amber, [
            "✨ Tudo do Free",
            "✨ Karine IA ILIMITADA",
            "✨ Análises personalizadas",
            "✨ Estratégias avançadas",
            "✨ Relatórios mensais",
            "✨ Suporte prioritário",
          ], isPro: true),
        ],
      ),
    );
  }

  // Card de funcionalidade (página inicial)
  Widget _cartaoFuncionalidade(
    IconData icone,
    String titulo,
    String descricao,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icone, color: const Color(0xFF00D9FF)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  descricao,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Card de plano
  Widget _planoCard(
    String titulo,
    String preco,
    Color cor,
    List<String> beneficios, {
    bool isPro = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: cor, width: isPro ? 2 : 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  color: cor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                preco,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...beneficios.map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(b, style: const TextStyle(color: Colors.white70)),
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================================
  // INDICADORES DE PÁGINA
  // ==============================================================================
  Widget _indicadores() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4, // 4 páginas
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          // Página atual: mais largo
          width: _paginaAtual == index ? 30 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: _paginaAtual == index
                ? const Color(0xFF00D9FF)
                : Colors.white24,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  // ==============================================================================
  // BOTÕES DE NAVEGAÇÃO
  // ==============================================================================
  Widget _botoesNavegacao() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          // Botão Voltar (exceto primeira página)
          if (_paginaAtual > 0)
            TextButton(
              onPressed: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              ),
              child: const Text(
                "Voltar",
                style: TextStyle(color: Colors.white54),
              ),
            )
          else
            const SizedBox(width: 80),

          const Spacer(),

          // Botão Continuar/Comenzar
          ElevatedButton(
            onPressed: _carregando ? null : _acaoContinuar,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D9FF),
              foregroundColor: const Color(0xFF0F172A),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: _carregando
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    _paginaAtual == 3 ? "COMEÇAR" : "Continuar",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }

  // ==============================================================================
  // AÇÃO DO BOTÃO CONTINUAR
  // ==============================================================================
  Future<void> _acaoContinuar() async {
    // Página 0: Vai para próxima
    if (_paginaAtual == 0) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
    // Página 1: Escolha método - apenas avanza
    else if (_paginaAtual == 1) {
      setState(() => _carregando = true);
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() => _carregando = false);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
    // Página 2: Valida nome
    else if (_paginaAtual == 2) {
      if (_nomeController.text.trim().isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Digite seu nome!")));
        return;
      }
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
    // Página 3: Finaliza login
    else if (_paginaAtual == 3) {
      await _finalizarLogin();
    }
  }

  // ==============================================================================
  // MÉTODOS DE LOGIN
  // ==============================================================================

  // Login Google
  Future<void> _loginGoogle() async {
    setState(() => _carregando = true);
    final user = await FirebaseService.loginGoogle();
    setState(() {
      _carregando = false;
      if (user != null) {
        _usuarioFirebase = user;
        _metodoLogin = "google";
        _nomeController.text = user.displayName ?? '';
        _pageController.jumpToPage(2); // Pula para página de nome
      }
    });
  }

  // Login Apple
  Future<void> _loginApple() async {
    setState(() => _metodoLogin = "apple");
    _pageController.jumpToPage(2);
  }

  // Login Celular
  Future<void> _loginCelular() async {
    setState(() => _metodoLogin = "celular");
    _pageController.jumpToPage(2);
  }

  // Login Anônimo
  Future<void> _loginAnonimo() async {
    setState(() => _carregando = true);
    final user = await FirebaseService.loginAnonimo();
    setState(() {
      _carregando = false;
      if (user != null) {
        _usuarioFirebase = user;
        _metodoLogin = "anonimo";
        _pageController.jumpToPage(2);
      }
    });
  }

  // ==============================================================================
  // FINALIZAR LOGIN
  // ==============================================================================
  Future<void> _finalizarLogin() async {
    setState(() => _carregando = true);

    // Salva no SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final nome = _nomeController.text.trim();
    await prefs.setString('nome_usuario', nome);
    await prefs.setString('metodo_login', _metodoLogin ?? "anonimo");
    await prefs.setBool('configurado', false);

    // Salva no Firestore se usuário logado
    if (_usuarioFirebase != null) {
      await FirebaseService.salvarDadosUsuario(
        uid: _usuarioFirebase!.uid,
        nome: nome,
        email: _usuarioFirebase!.email,
        metodoLogin: _metodoLogin ?? "anonimo",
      );
      await prefs.setString('uid', _usuarioFirebase!.uid);
    }

    // Navega para tela de configuração
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const TelaConfiguracao()),
      );
    }
  }

  // ==============================================================================
  // LIMPEZA
  // ==============================================================================
  @override
  void dispose() {
    _pageController.dispose();
    _nomeController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tela_configuracao.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final PageController _pageController = PageController();
  final TextEditingController _nomeController = TextEditingController();
  int _paginaAtual = 0;
  bool _carregando = false;
  String? _metodoLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _paginaAtual = index),
                children: [
                  _paginaBoasVindas(),
                  _paginaLogin(),
                  _paginaNome(),
                  _paginaPlano(),
                ],
              ),
            ),
            _indicadores(),
            _botoesNavegacao(),
          ],
        ),
      ),
    );
  }

  Widget _paginaBoasVindas() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(height: 40),
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
          const Text(
            "BEM-VINDO AO",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              letterSpacing: 4,
            ),
          ),
          const Text(
            "MENTOR FINANCEIRO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "O app que transforma sua vida!",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 40),
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

          // Login Google
          _botaoLogin(
            const Icon(Icons.g_mobiledata, color: Colors.white, size: 28),
            "Continuar com Google",
            const Color(0xFF4285F4),
            _loginGoogle,
          ),
          const SizedBox(height: 15),

          // Login Apple
          _botaoLogin(
            const Icon(Icons.apple, color: Colors.white),
            "Continuar com Apple",
            Colors.black,
            _loginApple,
          ),
          const SizedBox(height: 15),

          // Login Celular
          _botaoLogin(
            const Icon(Icons.phone_android, color: Colors.white),
            "Continuar com Celular",
            const Color(0xFF00D9FF),
            _loginCelular,
          ),
          const SizedBox(height: 15),

          // Login Anônimo
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
          _planoCard("FREE", "R\$ 0/mês", const Color(0xFF00D9FF), [
            "✅ Configuração básica",
            "✅ Cálculo automático de limite",
            "✅ Karine IA (respostas limitadas)",
            "✅ Registro de gastos diário",
            "✅ Simulador de metas",
          ]),
          const SizedBox(height: 20),
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

  Widget _indicadores() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
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

  Widget _botoesNavegacao() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
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

  Future<void> _acaoContinuar() async {
    if (_paginaAtual == 0) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else if (_paginaAtual == 1) {
      setState(() => _carregando = true);
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() => _carregando = false);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else if (_paginaAtual == 2) {
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
    } else if (_paginaAtual == 3) {
      await _finalizarLogin();
    }
  }

  Future<void> _loginGoogle() async {
    setState(() => _metodoLogin = "google");
    _pageController.jumpToPage(2);
  }

  Future<void> _loginApple() async {
    setState(() => _metodoLogin = "apple");
    _pageController.jumpToPage(2);
  }

  Future<void> _loginCelular() async {
    setState(() => _metodoLogin = "celular");
    _pageController.jumpToPage(2);
  }

  Future<void> _loginAnonimo() async {
    setState(() => _metodoLogin = "anonimo");
    _pageController.jumpToPage(2);
  }

  Future<void> _finalizarLogin() async {
    setState(() => _carregando = true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome_usuario', _nomeController.text.trim());
    await prefs.setString('metodo_login', _metodoLogin ?? "anonimo");
    await prefs.setBool('configurado', false);

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const TelaConfiguracao()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nomeController.dispose();
    super.dispose();
  }
}

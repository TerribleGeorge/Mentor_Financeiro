import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tela_login.dart';

class TelaOnboarding extends StatefulWidget {
  const TelaOnboarding({super.key});

  @override
  State<TelaOnboarding> createState() => _TelaOnboardingState();
}

class _TelaOnboardingState extends State<TelaOnboarding> {
  final PageController _pageController = PageController();
  int _paginaAtual = 0;

  final List<Map<String, String>> _paginas = [
    {
      'titulo': 'Sua jornada financeira começa aqui',
      'corpo':
          'Investir não é apenas para ricos. É para quem quer construir um futuro melhor. Comece com o que você tem, do seu jeito.',
      'icone': '💰',
    },
    {
      'titulo': 'Aprenda a investir do seu jeito',
      'corpo':
          'Sem termos complicados ou juros compostos misteriosos. Explicamos tudo de forma simples, clara e sem enrolação.',
      'icone': '📚',
    },
    {
      'titulo': 'Seu mentor financeiro pessoal',
      'corpo':
          'Tenha uma IA especializada para tirar suas dúvidas a qualquer momento. Investir nunca foi tão fácil.',
      'icone': '🤖',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _proximaPagina() {
    if (_paginaAtual < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _pular() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completo', true);
    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const TelaLogin()));
    }
  }

  void _irParaLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completo', true);
    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const TelaLogin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (index) => setState(() => _paginaAtual = index),
                itemBuilder: (context, index) => _construirPagina(index),
              ),
            ),
            _indicadores(),
            const SizedBox(height: 40),
            _botoes(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _construirPagina(int index) {
    final pagina = _paginas[index];
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                pagina['icone']!,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            pagina['titulo']!,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            pagina['corpo']!,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _indicadores() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _paginaAtual == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _paginaAtual == index ? Colors.grey[800] : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _botoes() {
    final isUltimaPagina = _paginaAtual == 2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          if (isUltimaPagina)
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _irParaLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Começar a Investir',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            )
          else
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _proximaPagina,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Próximo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          if (!isUltimaPagina) ...[
            const SizedBox(height: 16),
            TextButton(
              onPressed: _pular,
              child: Text(
                'Pular',
                style: TextStyle(color: Colors.grey[500], fontSize: 16),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

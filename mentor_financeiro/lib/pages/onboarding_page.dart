// LEGADO (Firestore): onboarding de 3 páginas exibido pelo `SplashScreen` quando
// `onboardingCompleto` ainda é falso no documento `usuarios` — grava prefs e chama
// `FirebaseService.completarOnboarding`. Não duplica `OnboardingFlowScreen` (Mentor v2):
// aquele fluxo é rota `/onboarding-mentor` com conteúdo e flags distintos.
// TODO(devvoid): fundir num único fluxo quando o legado `usuarios` for descontinuado.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/firebase_service.dart';
import 'tela_home.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _paginaAtual = 0;

  final List<Map<String, String>> _paginas = [
    {
      'titulo': 'Bem-vindo ao Mentor Financeiro.',
      'corpo':
          'A maioria das pessoas trabalha pelo dinheiro, mas nunca aprende a fazer o dinheiro trabalhar por elas. Investir é o único caminho real para blindar seu futuro financeiro.',
    },
    {
      'titulo': 'Nossa Missão.',
      'corpo':
          'Quero te pegar pela mão e mostrar que construir patrimônio é para qualquer um que tenha foco. Sem jargões de banco, sem letras miúdas. Apenas o caminho limpo.',
    },
    {
      'titulo': 'O Próximo Passo.',
      'corpo':
          'Filtramos o ruído e sugerimos apenas as plataformas em que confiamos. Seu primeiro passo começa agora.',
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

  void _irParaHome() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completo', true);

    final uid = prefs.getString('uid');
    if (uid != null) {
      await FirebaseService.completarOnboarding(uid);
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
          Text(
            pagina['titulo']!,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            pagina['corpo']!,
            style: TextStyle(
              color: Colors.grey[800],
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
                onPressed: _irParaHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Iniciar minha Jornada',
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
              onPressed: _irParaHome,
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

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'firebase_options.dart';
import 'services/firebase_service.dart';
import 'app_pages.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase ERRO: $e');
  }

  try {
    await FirebaseService.inicializarMessaging();
  } catch (e) {
    debugPrint('Messaging ERRO: $e');
  }

  runApp(const MentorFinanceiroApp());
}

class MentorFinanceiroApp extends StatelessWidget {
  const MentorFinanceiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mentor Financeiro',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00D9FF),
          brightness: Brightness.dark,
          surface: const Color(0xFF0F172A),
        ),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        useMaterial3: true,
        cardTheme: const CardThemeData(color: Color(0xFF1E293B), elevation: 0),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const TelaSplash());
          case '/login':
            return MaterialPageRoute(builder: (_) => const TelaLogin());
          case '/configuracao':
            return MaterialPageRoute(builder: (_) => const TelaConfiguracao());
          case '/principal':
            return MaterialPageRoute(builder: (_) => const TelaHome());
          case '/perfil':
            return MaterialPageRoute(builder: (_) => const TelaPerfil());
          case '/metas':
            return MaterialPageRoute(builder: (_) => const TelaMetas());
          case '/chat':
            return MaterialPageRoute(builder: (_) => const TelaChat());
          case '/investimentos':
            return MaterialPageRoute(builder: (_) => const TelaInvestimentos());
          case '/estrategias':
            return MaterialPageRoute(builder: (_) => const TelaEstrategias());
          case '/conhecimento':
            return MaterialPageRoute(builder: (_) => const ConhecimentoHub());
          case '/conhecimento/investimentos':
            return MaterialPageRoute(builder: (_) => const InvestimentosMenu());
          case '/conhecimento/estrategias':
            return MaterialPageRoute(builder: (_) => const EstrategiasMenu());
          case '/conhecimento/dicionario':
            return MaterialPageRoute(builder: (_) => const DicionarioPage());
          case '/conhecimento/primeiros-passos':
            return MaterialPageRoute(
              builder: (_) => const PrimeirosPassosPage(),
            );
          case '/conhecimento/impostos':
            return MaterialPageRoute(
              builder: (_) => const ImpostosDetalhePage(),
            );
          case '/conhecimento/perigos':
            return MaterialPageRoute(builder: (_) => const PerigosPage());
          case '/conhecimento/ferramentas':
            return MaterialPageRoute(builder: (_) => const FerramentasPage());
          case '/simulado':
            return MaterialPageRoute(builder: (_) => const SimuladoPage());
          case '/quiz-conhecimento':
            return MaterialPageRoute(
              builder: (_) => const QuizConhecimentoPage(),
            );
          case '/upgrade':
            return MaterialPageRoute(builder: (_) => const TelaUpgrade());
          default:
            return MaterialPageRoute(builder: (_) => const TelaSplash());
        }
      },
    );
  }
}

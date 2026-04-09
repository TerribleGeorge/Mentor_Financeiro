import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/tela_splash.dart';
import 'pages/tela_login.dart';
import 'pages/tela_configuracao.dart';
import 'pages/tela_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          default:
            return MaterialPageRoute(builder: (_) => const TelaSplash());
        }
      },
    );
  }
}

// ==============================================================================
// MENTOR FINANCEIRO - MAIN.DART
// ==============================================================================
// Este é o ponto de entrada principal do aplicativo Flutter Mentor Financeiro.
// Responsável por:
// - Inicializar o Firebase (autenticação, analytics, messaging)
// - Configurar o tema visual do app
// - Gerenciar a navegação entre telas
// ==============================================================================

// Importação dos pacotes Flutter necessários para criar a interface
import 'package:flutter/material.dart';

// Firebase Core: Inicializa todos os serviços Firebase no app
import 'package:firebase_core/firebase_core.dart';

// Firebase Analytics: Rastreia eventos e usage do app para análise
import 'package:firebase_analytics/firebase_analytics.dart';

// Servicios personalizados do app
import 'services/firebase_service.dart';

// Telas (páginas) do app
import 'pages/tela_splash.dart';
import 'pages/tela_login.dart';
import 'pages/tela_configuracao.dart';
import 'pages/tela_home.dart';

// ==============================================================================
// CONFIGURAÇÃO DO FIREBASE ANALYTICS
// ==============================================================================
// Instância global do Firebase Analytics para tracking de eventos em todo o app
// Importance: Permite analisar como usuários usam o app
// Impacto: Dados para melhoria contínua do produto
// ==============================================================================
FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// ==============================================================================
// FUNÇÃO PRINCIPAL (ENTRY POINT)
// ==============================================================================
// Ponto de entrada do app Flutter
// Execution: É a primeira função executada quando o app inicia
// ==============================================================================
void main() async {
  // Garante que o Flutterbinding está inicializado antes de operações async
  // Por quê? Necessário para usar async/await antes do runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase Core (Auth, Firestore, Analytics, etc)
  // Por quê? Todos os serviços Firebase precisam ser inicializados antes de usar
  // Impacto: Sem isso, o app não consegue autenticar nem salvar dados
  await Firebase.initializeApp();

  // Inicializa o Firebase Messaging (notificações push)
  // Por quê? Permite enviar notificações para engajar usuários
  // Impacto: Usuários recebem alertas sobre finanças e promoções
  await FirebaseService.inicializarMessaging();

  // Inicia o app Flutter com o widget raiz
  runApp(const MentorFinanceiroApp());
}

// ==============================================================================
// WIDGET PRINCIPAL DO APP (ROOT WIDGET)
// ==============================================================================
// Define a estrutura base do app: tema, rotas, configurações globais
// ==============================================================================
class MentorFinanceiroApp extends StatelessWidget {
  // Construtor const: Otimização para não recriar o widget desnecessariamente
  const MentorFinanceiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp: Widget base para apps que usam Material Design
    return MaterialApp(
      // Remove o banner "DEBUG" que aparece no modo desenvolvimento
      // Por quê? Melhora a aparência profissional do app
      // Impacto: Banner Debug pode confundir usuários em produção
      debugShowCheckedModeBanner: false,

      // Título do app (usado pelo sistema operacional)
      title: 'Mentor Financeiro',

      // ==============================================================================
      // CONFIGURAÇÃO DO TEMA VISUAL
      // ==============================================================================
      // Define a aparência visual do app: cores, fontes, estilos
      // Importance: Cria identidade visual consistente
      // Impacto: Usuários reconhecem o app pela aparência
      // ==============================================================================
      theme: ThemeData(
        // Tema escuro (dark mode)
        // Por quê: Reduces eye strain, popular em apps financeiros
        brightness: Brightness.dark,

        // Schema de cores base (cor primária do app)
        // Usamos Cyan (#00D9FF) como cor de destaque
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00D9FF),
          brightness: Brightness.dark,
          // Cor de fundo personalizada (azul escuro)
          surface: const Color(0xFF0F172A),
        ),

        // Cor de fundo principal da tela
        // Importância: Cria a atmosfera escura do app
        scaffoldBackgroundColor: const Color(0xFF0F172A),

        // Usa Material Design 3 (versão mais recente)
        // Por quê: Melhores recursos e consistency
        useMaterial3: true,

        // Configuração dos cards (cartões do app)
        cardTheme: const CardThemeData(
          color: Color(0xFF1E293B), // Fundo cinza escuro
          elevation: 0, // Sem sombra (estilo flat)
        ),
      ),

      // ==============================================================================
      // NAVEGAÇÃO DO APP (ROUTES)
      // ==============================================================================
      // Define qual tela abre primeiro e como navegar entre elas
      // ==============================================================================

      // Rota inicial (tela de abertura)
      initialRoute: '/',

      // Gerador de rotas: decide qual widget mostrar baseada na rota
      onGenerateRoute: (settings) {
        // Switch based no nome da rota
        switch (settings.name) {
          case '/':
            // Tela de abertura (splash screen)
            return MaterialPageRoute(builder: (_) => const TelaSplash());

          case '/login':
            // Tela de login/cadastro
            return MaterialPageRoute(builder: (_) => const TelaLogin());

          case '/configuracao':
            // Tela de configurações financeiras
            return MaterialPageRoute(builder: (_) => const TelaConfiguracao());

          case '/principal':
            // Tela principal (após login)
            return MaterialPageRoute(builder: (_) => const TelaHome());

          // Rota padrão: se não encontrar, mostra splash
          default:
            return MaterialPageRoute(builder: (_) => const TelaSplash());
        }
      },
    );
  }
}

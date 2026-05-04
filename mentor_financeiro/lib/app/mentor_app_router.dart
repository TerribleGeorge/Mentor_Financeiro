import 'package:flutter/material.dart';

import '../core/constants/app_routes.dart';
import '../pages/cambio_screen.dart';
import '../pages/conhecimento/conhecimento_hub.dart';
import '../pages/conhecimento/dicionario_page.dart';
import '../pages/conhecimento/estrategias_menu.dart';
import '../pages/conhecimento/ferramentas_page.dart';
import '../pages/conhecimento/impostos_detalhe_page.dart';
import '../pages/conhecimento/investimentos_menu.dart';
import '../pages/conhecimento/perigos_page.dart';
import '../pages/conhecimento/primeiros_passos_page.dart';
import '../pages/main_navigation.dart';
import '../pages/relatorios_screen.dart';
import '../pages/simulado_page.dart';
import '../pages/tela_configuracao.dart';
import '../pages/tela_estrategias.dart';
import '../pages/tela_investimentos.dart';
import '../pages/tela_login.dart';
import '../pages/tela_metas.dart';
import '../pages/tela_perfil.dart';
import '../pages/tela_upgrade.dart';
import '../pages/quiz_conhecimento_page.dart';
import '../pages/questionario_page.dart';
import '../presentation/calculator/calculadora_mentora_screen.dart';
import '../presentation/home/mentor_home_screen.dart';
import '../presentation/insight/insight_detail_screen.dart';
import '../presentation/onboarding/onboarding_flow_screen.dart';
import '../presentation/persona/persona_setup_screen.dart';
import '../presentation/splash/splash_screen.dart';

/// Rotas nomeadas do app (navegação nativa centralizada).
class MentorAppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case AppRoutes.questionario:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const QuestionarioPage(),
        );
      case AppRoutes.login:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TelaLogin(),
        );
      case AppRoutes.onboardingMentor:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const OnboardingFlowScreen(),
        );
      case AppRoutes.personaSetup:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const PersonaSetupScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const MentorHomeScreen(),
        );
      case AppRoutes.calculadoraMentora:
      case AppRoutes.ferramentasCalculadoraJuros:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const CalculadoraMentoraScreen(),
        );
      case AppRoutes.insightDetail:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const InsightDetailScreen(),
        );
      case AppRoutes.configuracao:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TelaConfiguracao(),
        );
      case AppRoutes.principal:
        final idx = (settings.arguments is int) ? (settings.arguments as int) : 0;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MainNavigation(initialIndex: idx),
        );
      case AppRoutes.perfil:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TelaPerfil(),
        );
      case AppRoutes.metas:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TelaMetas(),
        );
      case AppRoutes.investimentos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TelaInvestimentos(),
        );
      case AppRoutes.estrategias:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TelaEstrategias(),
        );
      case AppRoutes.conhecimento:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ConhecimentoHub(),
        );
      case AppRoutes.conhecimentoInvestimentos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const InvestimentosMenu(),
        );
      case AppRoutes.conhecimentoEstrategias:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const EstrategiasMenu(),
        );
      case AppRoutes.conhecimentoDicionario:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const DicionarioPage(),
        );
      case AppRoutes.conhecimentoPrimeirosPassos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const PrimeirosPassosPage(),
        );
      case AppRoutes.conhecimentoImpostos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ImpostosDetalhePage(),
        );
      case AppRoutes.conhecimentoPerigos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const PerigosPage(),
        );
      case AppRoutes.conhecimentoFerramentas:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const FerramentasPage(),
        );
      case AppRoutes.simulado:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SimuladoPage(),
        );
      case AppRoutes.quizConhecimento:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const QuizConhecimentoPage(),
        );
      case AppRoutes.upgrade:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TelaUpgrade(),
        );
      case AppRoutes.relatorios:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const DashboardScreen(
            title: 'Relatórios',
            showBackButton: true,
            chartsOnly: false,
          ),
        );
      case AppRoutes.graficos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const DashboardScreen(
            title: 'Gráficos',
            showBackButton: true,
            chartsOnly: true,
          ),
        );
      case AppRoutes.cambio:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const CambioScreen(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
    }
  }
}

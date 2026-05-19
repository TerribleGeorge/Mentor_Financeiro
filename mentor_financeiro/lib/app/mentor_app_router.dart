import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
import '../pages/conhecimento/golpes_page.dart';
import '../pages/conhecimento/localized_knowledge_page.dart';
import '../pages/main_navigation.dart';
import '../pages/historico_screen.dart';
import '../pages/relatorios_screen.dart';
import '../pages/graficos_screen.dart';
import '../widgets/premium_wrapper.dart';
import '../pages/simulado_page.dart';
import '../pages/tela_estrategias.dart';
import '../pages/adicionar_investimento_page.dart';
import '../pages/tela_investimentos.dart';
import '../pages/tela_login.dart';
import '../pages/finance_configuration_page.dart';
import '../pages/settings_page.dart';
import '../pages/tela_metas.dart';
import '../pages/tela_upgrade.dart';
import '../pages/quiz_conhecimento_page.dart';
import '../pages/questionario_page.dart';
import '../pages/home_screen.dart';
import '../pages/mentoria/mentoria_screen.dart';
import '../pages/mentoria/mentoria_lesson_screen.dart';
import '../presentation/calculator/calculadora_mentora_screen.dart';
import '../presentation/insight/insight_detail_screen.dart';
import '../presentation/intro/intro_tour_screen.dart';
import '../presentation/onboarding/onboarding_flow_screen.dart';
import '../presentation/persona/persona_setup_screen.dart';
import '../presentation/splash/splash_screen.dart';
import '../services/locale_ui_strings.dart';
import '../services/investment_category_provider.dart';

/// Rotas nomeadas do app (navegação nativa centralizada).
class MentorAppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
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
      case AppRoutes.introTour:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const IntroTourScreen(),
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
          builder: (_) => const MainNavigation(),
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
          builder: (_) => const FinanceConfigurationPage(),
        );
      case AppRoutes.settings:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SettingsPage(),
        );
      case AppRoutes.principal:
        final idx = (settings.arguments is int)
            ? (settings.arguments as int)
            : 0;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MainNavigation(initialIndex: idx),
        );
      case AppRoutes.perfil:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SettingsPage(),
        );
      case AppRoutes.historico:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const HistoricoScreen(),
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
      case AppRoutes.adicionarInvestimento:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const AdicionarInvestimentoPage(),
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
          builder: (context) => PremiumWrapper(
            feature: LocaleUiStrings.of(context).text(
              'Estratégias avançadas',
              en: 'Advanced strategies',
              es: 'Estrategias avanzadas',
            ),
            child: const EstrategiasMenu(),
          ),
        );
      case AppRoutes.conhecimentoDicionario:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => _regionalKnowledgePage(
            context,
            legacy: const DicionarioPage(),
            topic: KnowledgeTopic.dictionary,
          ),
        );
      case AppRoutes.conhecimentoPrimeirosPassos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const PrimeirosPassosPage(),
        );
      case AppRoutes.conhecimentoImpostos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => _regionalKnowledgePage(
            context,
            legacy: const ImpostosDetalhePage(),
            topic: KnowledgeTopic.taxes,
          ),
        );
      case AppRoutes.conhecimentoPerigos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => _regionalKnowledgePage(
            context,
            legacy: const PerigosPage(),
            topic: KnowledgeTopic.risks,
          ),
        );
      case AppRoutes.conhecimentoFerramentas:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => _regionalKnowledgePage(
            context,
            legacy: const FerramentasPage(),
            topic: KnowledgeTopic.tools,
          ),
        );
      case AppRoutes.conhecimentoGolpes:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => _regionalKnowledgePage(
            context,
            legacy: const GolpesPage(),
            topic: KnowledgeTopic.scams,
          ),
        );
      case AppRoutes.simulado:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SimuladoPage(),
        );
      case AppRoutes.quizConhecimento:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => _regionalKnowledgePage(
            context,
            legacy: const QuizConhecimentoPage(),
            topic: KnowledgeTopic.quiz,
          ),
        );
      case AppRoutes.upgrade:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TelaUpgrade(),
        );
      case AppRoutes.mentoria:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const MentoriaScreen(),
        );
      case AppRoutes.mentoriaLesson:
        final raw = settings.arguments;
        final args = raw is MentoriaLessonArgs ? raw : null;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => args == null
              ? Scaffold(
                  body: Center(
                    child: Text(
                      LocaleUiStrings.of(context).text(
                        'Lição inválida',
                        en: 'Invalid lesson',
                        es: 'Lección no válida',
                      ),
                    ),
                  ),
                )
              : MentoriaLessonScreen(args: args),
        );
      case AppRoutes.relatorios:
        final raw = settings.arguments;
        final title = raw is String && raw.trim().isNotEmpty
            ? raw.trim()
            : 'Relatórios';
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => PremiumWrapper(
            feature: title,
            child: DashboardScreen(
              title: title,
              showBackButton: true,
              chartsOnly: false,
            ),
          ),
        );
      case AppRoutes.graficos:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const GraficosScreen(),
        );
      case AppRoutes.cambio:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const CambioScreen(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
    }
  }

  static Widget _regionalKnowledgePage(
    BuildContext context, {
    required Widget legacy,
    required KnowledgeTopic topic,
  }) {
    final locale = Localizations.localeOf(context);
    final lang = locale.languageCode.toLowerCase();
    final isBrazil = Provider.of<InvestmentCategoryProvider>(
      context,
      listen: false,
    ).isBrazilMarket;
    if (isBrazil && lang == 'pt') return legacy;
    return LocalizedKnowledgePage(topic: topic, isBrazil: isBrazil);
  }
}

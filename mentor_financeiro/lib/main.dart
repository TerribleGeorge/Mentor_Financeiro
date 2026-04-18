import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'firebase_options.dart';
import 'services/firebase_service.dart';
import 'services/subscription_provider.dart';
import 'services/app_theme_controller.dart';
import 'app_pages.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

const String revenueCatApiKey = 'test_pibcZvswDiwSwzDHPGiRBKIKnLZ';
const String mentorProEntitlementId = 'Mentor Financeiro Pro';

Future<void> initializeRevenueCat(String? uid) async {
  await Purchases.setLogLevel(LogLevel.debug);

  final configuration = PurchasesConfiguration(revenueCatApiKey);
  await Purchases.configure(configuration);

  if (uid != null) {
    // Garante que o appUserID do RevenueCat seja igual ao UID do Firebase
    await Purchases.logIn(uid);
    debugPrint('RevenueCat ID: ${Purchases.appUserID}');
    debugPrint('Firebase UID: $uid');
  }
}

Future<void> verificarStatusAssinatura(
  SubscriptionProvider subscriptionProvider,
  AppThemeController themeController,
) async {
  try {
    final customerInfo = await Purchases.getCustomerInfo();
    final entitlements = customerInfo.entitlements;
    final allEntitlements = entitlements.all;

    bool isPro = false;
    for (final entry in allEntitlements.entries) {
      if (entry.key == mentorProEntitlementId && entry.value.isActive) {
        isPro = true;
        break;
      }
    }

    await subscriptionProvider.updatePremiumStatus(isPro);
    themeController.setPremiumStatus(isPro);

    debugPrint('Status Premium atualizado: $isPro');
  } catch (e) {
    debugPrint('Erro ao verificar assinatura: $e');
  }
}

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

  await initializeRevenueCat(null);

  runApp(const MentorFinanceiroApp());
}

final _themeController = AppThemeController();

class MentorFinanceiroApp extends StatelessWidget {
  const MentorFinanceiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeController,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mentor Financeiro',
          theme: _themeController.currentTheme,
          themeMode: _themeController.themeMode == AppThemeMode.light
              ? ThemeMode.light
              : _themeController.themeMode == AppThemeMode.medium
              ? ThemeMode.dark
              : ThemeMode.dark,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (_) => const TelaSplash());
              case '/login':
                return MaterialPageRoute(builder: (_) => const TelaLogin());
              case '/configuracao':
                return MaterialPageRoute(
                  builder: (_) => const TelaConfiguracao(),
                );
              case '/principal':
                return MaterialPageRoute(
                  builder: (_) => const MainNavigation(),
                );
              case '/perfil':
                return MaterialPageRoute(builder: (_) => const TelaPerfil());
              case '/metas':
                return MaterialPageRoute(builder: (_) => const TelaMetas());
              case '/investimentos':
                return MaterialPageRoute(
                  builder: (_) => const TelaInvestimentos(),
                );
              case '/estrategias':
                return MaterialPageRoute(
                  builder: (_) => const TelaEstrategias(),
                );
              case '/conhecimento':
                return MaterialPageRoute(
                  builder: (_) => const ConhecimentoHub(),
                );
              case '/conhecimento/investimentos':
                return MaterialPageRoute(
                  builder: (_) => const InvestimentosMenu(),
                );
              case '/conhecimento/estrategias':
                return MaterialPageRoute(
                  builder: (_) => const EstrategiasMenu(),
                );
              case '/conhecimento/dicionario':
                return MaterialPageRoute(
                  builder: (_) => const DicionarioPage(),
                );
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
                return MaterialPageRoute(
                  builder: (_) => const FerramentasPage(),
                );
              case '/simulado':
                return MaterialPageRoute(builder: (_) => const SimuladoPage());
              case '/quiz-conhecimento':
                return MaterialPageRoute(
                  builder: (_) => const QuizConhecimentoPage(),
                );
              case '/upgrade':
                return MaterialPageRoute(builder: (_) => const TelaUpgrade());
              case '/relatorios':
                return MaterialPageRoute(
                  builder: (_) => const DashboardScreen(),
                );
              default:
                return MaterialPageRoute(builder: (_) => const TelaSplash());
            }
          },
        );
      },
    );
  }
}

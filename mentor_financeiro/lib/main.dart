import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'services/firebase_service.dart';
import 'services/app_theme_controller.dart';
import 'services/locale_controller.dart';
import 'services/subscription_provider.dart';
import 'app_pages.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// Fallbacks caso .env não esteja configurado.
const String revenueCatAndroidApiKey = 'test_pibcZvswDiwSwzDHpGIrBKIkNLZ';
const String revenueCatIosApiKey = 'test_pibcZvswDiwSwzDHpGIrBKIkNLZ';
const String mentorProEntitlementId = 'Mentor Financeiro Pro';

final themeController = AppThemeController();
final localeController = LocaleController();

Future<void> initializeRevenueCat(String? uid) async {
  if (kIsWeb) {
    // RevenueCat não é suportado no Flutter Web neste app.
    return;
  }

  await Purchases.setLogLevel(LogLevel.debug);

  final envAndroid = dotenv.env['REVENUECAT_ANDROID_API_KEY']?.trim();
  final envIos = dotenv.env['REVENUECAT_IOS_API_KEY']?.trim();

  final apiKey = defaultTargetPlatform == TargetPlatform.iOS
      ? (envIos?.isNotEmpty == true ? envIos! : revenueCatIosApiKey)
      : (envAndroid?.isNotEmpty == true
            ? envAndroid!
            : revenueCatAndroidApiKey);

  final configuration = PurchasesConfiguration(apiKey);
  await Purchases.configure(configuration);

  if (uid != null) {
    await Purchases.logIn(uid);
    debugPrint('=== REVENUECAT DEBUG ===');
    debugPrint('Firebase UID: $uid');
    debugPrint('RevenueCat ID: ${Purchases.appUserID}');
    debugPrint('======================');
  }
}

Future<void> verificarStatusAssinatura() async {
  try {
    final customerInfo = await Purchases.getCustomerInfo();
    final entitlements = customerInfo.entitlements.all;

    bool isPremium = false;
    if (entitlements.containsKey(mentorProEntitlementId)) {
      isPremium = entitlements[mentorProEntitlementId]!.isActive;
    }

    await themeController.setPremiumStatus(isPremium);

    debugPrint('=== PREMIUM DEBUG ===');
    debugPrint('USUÁRIO É MESTRE? $isPremium');
    debugPrint('====================');
  } catch (e) {
    debugPrint('Erro ao verificar assinatura: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    debugPrint('dotenv ERRO: $e');
  }

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
  await verificarStatusAssinatura();

  await themeController.initialize();
  await localeController.initialize();

  debugPrint('=== TEMA DEBUG ===');
  debugPrint('O TEMA ATUAL É: ${themeController.themeMode}');
  debugPrint('================');

  runApp(const MentorFinanceiroApp());
}

class MentorFinanceiroApp extends StatelessWidget {
  const MentorFinanceiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SubscriptionProvider()..initialize(),
        ),
      ],
      child: ListenableBuilder(
        listenable: Listenable.merge([themeController, localeController]),
        builder: (context, _) {
          final modoTema = themeController.themeMode;
          ThemeMode flutterThemeMode;

          if (modoTema == AppThemeMode.light) {
            flutterThemeMode = ThemeMode.light;
          } else if (modoTema == AppThemeMode.medium) {
            flutterThemeMode = ThemeMode.dark;
          } else {
            flutterThemeMode = ThemeMode.dark;
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mentor Financeiro',
            theme: themeController.currentTheme,
            themeMode: flutterThemeMode,
            locale: localeController.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
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
                  final idx = (settings.arguments is int)
                      ? (settings.arguments as int)
                      : 0;
                  return MaterialPageRoute(
                    builder: (_) => MainNavigation(initialIndex: idx),
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
                  return MaterialPageRoute(
                    builder: (_) => const SimuladoPage(),
                  );
                case '/quiz-conhecimento':
                  return MaterialPageRoute(
                    builder: (_) => const QuizConhecimentoPage(),
                  );
                case '/upgrade':
                  return MaterialPageRoute(builder: (_) => const TelaUpgrade());
                case '/relatorios':
                  return MaterialPageRoute(
                    builder: (_) => const DashboardScreen(
                      title: 'Relatórios',
                      showBackButton: true,
                      chartsOnly: false,
                    ),
                  );
                case '/graficos':
                  return MaterialPageRoute(
                    builder: (_) => const DashboardScreen(
                      title: 'Gráficos',
                      showBackButton: true,
                      chartsOnly: true,
                    ),
                  );
                case '/cambio':
                  return MaterialPageRoute(
                    builder: (_) => const CambioScreen(),
                  );
                default:
                  return MaterialPageRoute(builder: (_) => const TelaSplash());
              }
            },
          );
        },
      ),
    );
  }
}

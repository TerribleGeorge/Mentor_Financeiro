import 'dart:async';
import 'dart:developer' show log;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

import 'core/constants/app_routes.dart';
import 'data/services/firebase_data_service.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'presentation/widgets/void_loading_screen.dart';
import 'services/firebase_service.dart';
import 'services/app_theme_controller.dart';
import 'services/currency_preference_controller.dart';
import 'services/locale_controller.dart';
import 'services/revenue_cat_bootstrap.dart';
import 'services/subscription_provider.dart';
import 'services/user_persona_service.dart';
import 'app/mentor_app_router.dart';
import 'widgets/mentor_app_backdrop.dart';
import 'tour/mentor_tour_coordinator.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

final GlobalKey<NavigatorState> mentorNavigatorKey = GlobalKey<NavigatorState>();

final themeController = AppThemeController();
final localeController = LocaleController();
final currencyPreferenceController = CurrencyPreferenceController.instance;
final userPersonaService = UserPersonaService.instance;

/// Evita que o arranque fique preso em SDKs externos (FCM, RevenueCat, health Firebase).
Future<void> _runWithBootTimeout(String label, Future<void> Function() work) async {
  try {
    await work().timeout(const Duration(seconds: 5));
  } on TimeoutException catch (_, st) {
    log(
      '[$label] timeout 5s — continuação do boot sem bloquear.',
      name: 'mentor.bootstrap',
      stackTrace: st,
    );
    if (label == 'revenuecat') {
      RevenueCatBootstrap.abort();
      try {
        await themeController.setPremiumStatus(false);
      } catch (_) {}
    }
  } catch (e, st) {
    log('[$label] $e', name: 'mentor.bootstrap', error: e, stackTrace: st);
    if (label == 'revenuecat') {
      RevenueCatBootstrap.abort();
      try {
        await themeController.setPremiumStatus(false);
      } catch (_) {}
    }
  }
}

/// Inicialização pesada antes do [MentorFinanceiroApp] (Firebase, prefs, etc.).
Future<void> _bootstrapApplication() async {
  try {
    await dotenv.load(fileName: '.env');
  } catch (e, st) {
    log('dotenv: $e', name: 'mentor.bootstrap', error: e, stackTrace: st);
  }

  var firebaseReady = false;
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    firebaseReady = true;
    log('Firebase Core inicializado.', name: 'mentor.bootstrap');
  } catch (e, st) {
    log('Firebase: $e', name: 'mentor.bootstrap', error: e, stackTrace: st);
  }

  if (firebaseReady) {
    await _runWithBootTimeout('firebase_ops', () async {
      await FirebaseDataService.instance.setupObservability();
      FirebaseDataService.instance.setCrashlyticsUser(
        FirebaseAuth.instance.currentUser?.uid,
      );

      final health = await FirebaseDataService.instance.runBootstrapHealthChecks();
      log(
        'Conexão Firestore (servidor): ${health.firestore ? "estabelecida" : "indisponível ou sem permissão"}.',
        name: 'mentor.health',
      );
      log(
        'APIs externas (probe HTTP): ${health.externalHttp ? "alcançáveis" : "indisponíveis"}.',
        name: 'mentor.health',
      );

      await FirebaseDataService.instance.logAnalyticsEvent(
        'mentor_bootstrap_health',
        <String, Object>{
          'firestore_ok': health.firestore ? 1 : 0,
          'http_ok': health.externalHttp ? 1 : 0,
        },
      );
    });
  } else {
    log(
      'Firebase indisponível: health checks e Crashlytics não ativados.',
      name: 'mentor.health',
    );
  }

  await _runWithBootTimeout('fcm', () async {
    try {
      await FirebaseService.inicializarMessaging();
    } catch (e, st) {
      log('Messaging: $e', name: 'mentor.bootstrap', error: e, stackTrace: st);
    }
  });

  await _runWithBootTimeout(
    'revenuecat',
    () => RevenueCatBootstrap.run(FirebaseAuth.instance.currentUser?.uid),
  );

  await _runWithBootTimeout('local_prefs', () async {
    await themeController.initialize();
    await currencyPreferenceController.initialize();
    await localeController.initialize();
    await userPersonaService.initialize();
  });

  if (kDebugMode) {
    debugPrint('=== TEMA DEBUG ===');
    debugPrint('O TEMA ATUAL É: ${themeController.themeMode}');
    debugPrint('================');
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() {
    runApp(const AppBootstrapShell());
  }, (error, stack) {
    log('Erro não tratado: $error', name: 'mentor.errors', error: error, stackTrace: stack);
    if (!kIsWeb && Firebase.apps.isNotEmpty) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
  });
}

/// Primeiro frame: [VoidLoadingScreen] durante [_bootstrapApplication]; depois fade para o app.
class AppBootstrapShell extends StatefulWidget {
  const AppBootstrapShell({super.key});

  @override
  State<AppBootstrapShell> createState() => _AppBootstrapShellState();
}

class _AppBootstrapShellState extends State<AppBootstrapShell> {
  bool _bootComplete = false;

  @override
  void initState() {
    super.initState();
    _startBootstrap();
  }

  Future<void> _startBootstrap() async {
    await _bootstrapApplication();
    if (mounted) {
      setState(() => _bootComplete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 720),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      child: _bootComplete
          ? const MentorFinanceiroApp(key: ValueKey<String>('mentor_app'))
          : MaterialApp(
              key: const ValueKey<String>('void_bootstrap'),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Colors.black,
                useMaterial3: true,
              ),
              home: const VoidLoadingScreen(),
            ),
    );
  }
}

class MentorFinanceiroApp extends StatelessWidget {
  const MentorFinanceiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeController),
        ChangeNotifierProvider(
          create: (_) => SubscriptionProvider()..initialize(),
        ),
        ChangeNotifierProvider<UserPersonaService>.value(
          value: userPersonaService,
        ),
      ],
      child: ListenableBuilder(
        listenable: Listenable.merge([
          themeController,
          localeController,
          currencyPreferenceController,
        ]),
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
            navigatorKey: mentorNavigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Mentor Financeiro',
            theme: themeController.currentTheme,
            themeMode: flutterThemeMode,
            locale: localeController.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: MentorAppRouter.onGenerateRoute,
            builder: (context, child) {
              return ShowCaseWidget(
                enableAutoScroll: true,
                blurValue: 4,
                globalTooltipActions: [
                  TooltipActionButton(
                    type: TooltipDefaultActionType.skip,
                    name: 'Pular Tour',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    backgroundColor: const Color(0xFF1E293B),
                    border: Border.all(color: const Color(0xFF00D9FF)),
                    onTap: MentorTourCoordinator.skipTour,
                  ),
                ],
                globalTooltipActionConfig: const TooltipActionConfig(
                  position: TooltipActionPosition.outside,
                  alignment: MainAxisAlignment.end,
                ),
                onComplete: (index, key) {
                  MentorTourCoordinator.onShowcaseStepCompleted(key, mentorNavigatorKey);
                },
                builder: (showcaseContext) => MentorAppBackdrop(child: child),
              );
            },
          );
        },
      ),
    );
  }
}

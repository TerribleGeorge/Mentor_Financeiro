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

import 'core/config/app_secrets.dart';
import 'core/constants/app_routes.dart';
import 'data/services/firebase_data_service.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'services/firebase_service.dart';
import 'services/app_theme_controller.dart';
import 'services/currency_preference_controller.dart';
import 'services/locale_controller.dart';
import 'services/investment_category_provider.dart';
import 'services/regional_context_controller.dart';
import 'presentation/splash/splash_asset_resolver.dart';
import 'services/revenue_cat_bootstrap.dart';
import 'services/revenue_cat_subscription_service.dart';
import 'services/subscription_provider.dart';
import 'services/user_persona_service.dart';
import 'app/mentor_app_router.dart';
import 'widgets/revenue_cat_lifecycle.dart';
import 'widgets/mentor_app_backdrop.dart';
import 'tour/mentor_tour_coordinator.dart';
import 'presentation/widgets/void_loading_screen.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

final GlobalKey<NavigatorState> mentorNavigatorKey =
    GlobalKey<NavigatorState>();

final themeController = AppThemeController();
final localeController = LocaleController();
final currencyPreferenceController = CurrencyPreferenceController.instance;
final userPersonaService = UserPersonaService.instance;
final regionalContextController = RegionalContextController();
final investmentCategoryProvider = InvestmentCategoryProvider(
  regionalContextController,
);

/// Evita que o arranque fique preso em SDKs externos (FCM, RevenueCat, health Firebase).
Future<void> _runWithBootTimeout(
  String label,
  Future<void> Function() work,
) async {
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

/// Fase 1 do boot: `.env`, Firebase Core, **RevenueCat** (`getCustomerInfo` via SDK),
/// prefs do tema — para escolher a arte da splash antes do resto.
Future<
    ({
      String splashAsset,
      Color splashBackground,
      Color splashProgress,
      Color splashParticles,
      bool firebaseReady
    })>
_bootstrapSplashContext() async {
  try {
    await dotenv.load(fileName: '.env');
  } catch (e, st) {
    log('dotenv: $e', name: 'mentor.bootstrap', error: e, stackTrace: st);
  }

  if (kDebugMode) {
    final keyOk =
        AppSecrets.revenueCatAndroid != null &&
        (AppSecrets.revenueCatAndroid ?? '').trim().isNotEmpty;
    log(
      'RevenueCat: REVENUECAT_ANDROID_API_KEY no .env ${keyOk ? "carregada" : "ausente (SDK não arranca)"}.',
      name: 'mentor.bootstrap',
    );
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

  await _runWithBootTimeout(
    'revenuecat',
    () => RevenueCatBootstrap.run(FirebaseAuth.instance.currentUser?.uid),
  );

  // Splash Standard / Cyber / Grimm / Hive: mesmo fluxo que Purchases.getCustomerInfo().
  final info = await RevenueCatSubscriptionService.getCustomerInfoSafe();
  final isPremium =
      info != null &&
      RevenueCatSubscriptionService.customerHasPremiumAccess(info);

  // Tema salvo nas prefs deve ser usado para branding premium.
  await themeController.initialize();
  await themeController.setPremiumStatus(isPremium);
  if (!isPremium && themeController.themeMode.requiresPremiumEntitlement) {
    await themeController.setThemeMode(AppThemeMode.voidTheme);
  }

  final branding = SplashAssetResolver.resolveBranding(
    isPremium: isPremium,
    theme: themeController.themeMode,
  );

  return (
    splashAsset: branding.asset,
    splashBackground: branding.background,
    splashProgress: branding.progress,
    splashParticles: branding.particles,
    firebaseReady: firebaseReady
  );
}

/// Durante os 10 s da splash: confirma [CustomerInfo] e actualiza premium no tema.
Future<void> _revenueCatSyncDuringSplashHold() async {
  if (!RevenueCatBootstrap.isSdkReady) return;
  final info = await RevenueCatSubscriptionService.getCustomerInfoSafe();
  if (info == null) return;
  final premium = RevenueCatSubscriptionService.isPremiumEntitlementActive(
    info,
  );
  await themeController.setPremiumStatus(premium);
}

/// Restante do boot depois da splash estar definida (observabilidade, messaging, prefs, lojas).
Future<void> _bootstrapApplicationRemainder({
  required bool firebaseReady,
}) async {
  if (firebaseReady) {
    await _runWithBootTimeout('firebase_ops', () async {
      await FirebaseDataService.instance.setupObservability();
      FirebaseDataService.instance.setCrashlyticsUser(
        FirebaseAuth.instance.currentUser?.uid,
      );

      final health = await FirebaseDataService.instance
          .runBootstrapHealthChecks();
      log(
        'Conexão Firestore (servidor): ${health.firestore ? "estabelecida" : "indisponível ou sem permissão"}.',
        name: 'mentor.health',
      );
      log(
        'APIs externas (probe HTTP): ${health.externalHttp ? "alcançáveis" : "indisponíveis"}.',
        name: 'mentor.health',
      );

      await FirebaseDataService.instance
          .logAnalyticsEvent('mentor_bootstrap_health', <String, Object>{
            'firestore_ok': health.firestore ? 1 : 0,
            'http_ok': health.externalHttp ? 1 : 0,
          });
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

  await _runWithBootTimeout('local_prefs', () async {
    await currencyPreferenceController.initialize();
    await localeController.initialize();
    await userPersonaService.initialize();
  });

  await _runWithBootTimeout(
    'regional',
    () => regionalContextController.initialize(),
  );

  await _runWithBootTimeout(
    'investment_categories',
    () => investmentCategoryProvider.syncStorefrontFromRevenueCat(),
  );

  if (kDebugMode) {
    debugPrint('=== TEMA DEBUG ===');
    debugPrint('O TEMA ATUAL É: ${themeController.themeMode}');
    debugPrint('================');
  }
}

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const AppBootstrapShell());
    },
    (error, stack) {
      log(
        'Erro não tratado: $error',
        name: 'mentor.errors',
        error: error,
        stackTrace: stack,
      );
      if (!kIsWeb && Firebase.apps.isNotEmpty) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
    },
  );
}

/// Depois de [_bootstrapSplashContext]: splash + barra 10 s + resto do boot —
/// só navega quando [Future.wait] termina (mínimo 10 s **e** remainder do bootstrap).
/// O hold de 10s antes da Home pós-login continua em [VoidLoadingScreen.minimumNavigationHold].
class AppBootstrapShell extends StatefulWidget {
  const AppBootstrapShell({super.key});

  @override
  State<AppBootstrapShell> createState() => _AppBootstrapShellState();
}

class _AppBootstrapShellState extends State<AppBootstrapShell> {
  bool _splashReady = false;
  String _splashAssetPath = SplashAssetResolver.devVoidLogo;
  Color _splashBackground = Colors.black;
  Color _splashProgress = const Color(0xFFE5E7EB);
  Color _splashParticles = const Color(0xFF0B0B0B);
  bool _bootComplete = false;

  @override
  void initState() {
    super.initState();
    _startBootstrap();
  }

  Future<void> _startBootstrap() async {
    try {
      final splashCtx = await _bootstrapSplashContext();
      if (mounted) {
        setState(() {
          _splashAssetPath = splashCtx.splashAsset;
          _splashBackground = splashCtx.splashBackground;
          _splashProgress = splashCtx.splashProgress;
          _splashParticles = splashCtx.splashParticles;
          _splashReady = true;
        });
      }
      await Future.wait<void>([
        _bootstrapApplicationRemainder(firebaseReady: splashCtx.firebaseReady),
        VoidLoadingScreen.waitBootstrapSynchronizationHold(),
        _revenueCatSyncDuringSplashHold(),
      ]);
    } catch (e, st) {
      log(
        'bootstrapSplashContext: $e',
        name: 'mentor.bootstrap',
        error: e,
        stackTrace: st,
      );
      if (mounted) {
        setState(() {
          _splashAssetPath = SplashAssetResolver.devVoidLogo;
          _splashBackground = Colors.black;
          _splashProgress = const Color(0xFFE5E7EB);
          _splashParticles = const Color(0xFF0B0B0B);
          _splashReady = true;
        });
      }
      await Future.wait<void>([
        _bootstrapApplicationRemainder(firebaseReady: Firebase.apps.isNotEmpty),
        VoidLoadingScreen.waitBootstrapSynchronizationHold(),
        _revenueCatSyncDuringSplashHold(),
      ]);
    }
    if (mounted) {
      setState(() => _bootComplete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_splashReady) {
      return const MaterialApp(
        key: ValueKey<String>('boot_placeholder'),
        debugShowCheckedModeBanner: false,
        home: ColoredBox(color: Colors.black),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1100),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
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
              home: VoidLoadingScreen(
                splashAsset: _splashAssetPath,
                backgroundColor: _splashBackground,
                progressColor: _splashProgress,
                particlesColor: _splashParticles,
              ),
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
        ChangeNotifierProvider<RegionalContextController>.value(
          value: regionalContextController,
        ),
        ChangeNotifierProvider<InvestmentCategoryProvider>.value(
          value: investmentCategoryProvider,
        ),
      ],
      child: RevenueCatLifecycle(
        child: ListenableBuilder(
          listenable: Listenable.merge([
            themeController,
            localeController,
            currencyPreferenceController,
          ]),
          builder: (context, _) {
            final modoTema = themeController.themeMode;
            ThemeMode flutterThemeMode;

            flutterThemeMode = modoTema == AppThemeMode.glacier
                ? ThemeMode.light
                : ThemeMode.dark;

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
                    MentorTourCoordinator.onShowcaseStepCompleted(
                      key,
                      mentorNavigatorKey,
                    );
                  },
                  builder: (showcaseContext) => MentorAppBackdrop(child: child),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

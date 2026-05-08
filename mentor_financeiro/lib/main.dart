import 'dart:async';
import 'dart:developer' show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app/mentor_app_router.dart';
import 'core/config/app_secrets.dart';
import 'core/constants/app_routes.dart';
import 'core/navigation/mentor_navigator.dart';
import 'core/navigation/splash_route_observer.dart';
import 'data/services/firebase_data_service.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations_fallback.dart';
import 'services/app_theme_controller.dart';
import 'services/currency_preference_controller.dart';
import 'services/investment_category_provider.dart';
import 'services/locale_controller.dart';
import 'services/regional_context_controller.dart';
import 'services/revenue_cat_bootstrap.dart';
import 'services/subscription_provider.dart';
import 'services/theme_controller.dart';
import 'services/user_persona_service.dart';
import 'widgets/mentor_app_backdrop.dart';
import 'widgets/revenue_cat_lifecycle.dart';

final RegionalContextController regionalContextController =
    RegionalContextController();
final InvestmentCategoryProvider investmentCategoryProvider =
    InvestmentCategoryProvider(regionalContextController);

Future<void> _bootstrapRevenueCat() async {
  try {
    await RevenueCatBootstrap.run(FirebaseAuth.instance.currentUser?.uid);
  } catch (e, st) {
    log(
      'RevenueCat bootstrap: $e',
      name: 'mentor.bootstrap',
      error: e,
      stackTrace: st,
    );
  }
}

/// Carrega variáveis antes de [AppSecrets] / RevenueCat / logs em debug.
Future<void> _loadDotEnv() async {
  try {
    await dotenv.load(fileName: '.env');
    return;
  } catch (e, st) {
    log('.env raiz: $e', name: 'mentor.bootstrap', error: e, stackTrace: st);
  }
  try {
    await dotenv.load(fileName: 'assets/.env');
  } catch (e, st) {
    log(
      'assets/.env: $e — RevenueCat e chaves .env ficam indisponíveis até existir ficheiro.',
      name: 'mentor.bootstrap',
      error: e,
      stackTrace: st,
    );
  }
}

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      if (!kIsWeb) {
        FlutterError.onError =
            FirebaseCrashlytics.instance.recordFlutterFatalError;
      }

      await _loadDotEnv();
      unawaited(MobileAds.instance.initialize());

      if (kDebugMode) {
        final keyOk =
            AppSecrets.revenueCatAndroid != null &&
            (AppSecrets.revenueCatAndroid ?? '').trim().isNotEmpty;
        log(
          'RevenueCat: REVENUECAT_ANDROID_API_KEY ${keyOk ? "carregada" : "ausente"}.',
          name: 'mentor.bootstrap',
        );
      }

      // Esperar o bootstrap para [RevenueCatLifecycle] ver [isSdkReady] ao primeiro frame
      // e registar listeners / authStateChanges; caso contrário o RC ficava “mudo”.
      await _bootstrapRevenueCat();

      unawaited(FirebaseDataService.instance.setupObservability());

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: ThemeController.instance),
            ChangeNotifierProvider.value(value: AppThemeController.instance),
            ChangeNotifierProvider.value(value: LocaleController.instance),
            ChangeNotifierProvider.value(
              value: CurrencyPreferenceController.instance,
            ),
            ChangeNotifierProvider.value(value: regionalContextController),
            ChangeNotifierProvider.value(value: investmentCategoryProvider),
            ChangeNotifierProvider(
              create: (_) => SubscriptionProvider()..initialize(),
            ),
            ChangeNotifierProvider<UserPersonaService>.value(
              value: UserPersonaService.instance,
            ),
          ],
          child: RevenueCatLifecycle(child: const MentorApp()),
        ),
      );
    },
    (error, stack) {
      if (!kIsWeb) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
      log('Erro fatal no main: $error');
    },
  );
}

class MentorApp extends StatelessWidget {
  const MentorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return ShowCaseWidget(builder: (context) => const MentorAppContent());
  }
}

class MentorAppContent extends StatelessWidget {
  const MentorAppContent({super.key});

  List<Locale> _effectiveSupportedLocales() {
    final device = WidgetsBinding.instance.platformDispatcher.locales;
    final out = <Locale>[];
    void add(Locale l) {
      if (out.any(
        (e) =>
            e.languageCode == l.languageCode && e.countryCode == l.countryCode,
      )) {
        return;
      }
      out.add(l);
    }

    for (final l in device) {
      add(Locale(l.languageCode, l.countryCode));
      add(Locale(l.languageCode));
    }

    // Garantir que nossos ARBs existam na lista.
    add(const Locale('pt'));
    add(const Locale('en'));
    add(const Locale('es'));
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ThemeController, AppThemeController, LocaleController>(
      builder:
          (
            context,
            themeController,
            appThemeController,
            localeController,
            child,
          ) {
            return MaterialApp(
              key: ValueKey<String>(
                '${themeController.themeMode.index}_'
                '${appThemeController.themeMode.index}',
              ),
              navigatorKey: mentorNavigatorKey,
              navigatorObservers: [splashRouteNavigatorObserver],
              debugShowCheckedModeBanner: false,
              title: 'Mentor Financeiro',
              theme: appThemeController.themeLight,
              darkTheme: appThemeController.themeDark,
              themeMode: themeController.themeMode,
              locale: localeController.locale,
              supportedLocales: _effectiveSupportedLocales(),
              localizationsDelegates: [
                const AppLocalizationsFallbackDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              initialRoute: AppRoutes.splash,
              onGenerateRoute: MentorAppRouter.onGenerateRoute,
              builder: (context, child) {
                final shellChild = child ?? const SizedBox.shrink();
                return PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) {
                    if (didPop) return;
                    final nav = mentorNavigatorKey.currentState;
                    if (nav != null && nav.canPop()) {
                      nav.pop();
                      return;
                    }
                    SystemNavigator.pop();
                  },
                  child: ValueListenableBuilder<bool>(
                    valueListenable: splashRouteVisibleNotifier,
                    builder: (context, onSplash, _) {
                      return onSplash
                          ? shellChild
                          : MentorAppBackdrop(child: shellChild);
                    },
                  ),
                );
              },
            );
          },
    );
  }
}

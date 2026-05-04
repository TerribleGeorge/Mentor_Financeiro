import 'dart:async';
import 'dart:developer' show log;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:provider/provider.dart';

import 'core/config/app_secrets.dart';
import 'data/services/firebase_data_service.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'services/firebase_service.dart';
import 'services/app_theme_controller.dart';
import 'services/currency_preference_controller.dart';
import 'services/locale_controller.dart';
import 'services/subscription_provider.dart';
import 'services/user_persona_service.dart';
import 'app/mentor_app_router.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

const String mentorProEntitlementId = 'Mentor Financeiro Pro';

final themeController = AppThemeController();
final localeController = LocaleController();
final currencyPreferenceController = CurrencyPreferenceController.instance;
final userPersonaService = UserPersonaService.instance;

Future<void> initializeRevenueCat(String? uid) async {
  if (kIsWeb) {
    return;
  }

  final apiKey = defaultTargetPlatform == TargetPlatform.iOS
      ? AppSecrets.revenueCatIos
      : AppSecrets.revenueCatAndroid;

  if (apiKey == null || apiKey.isEmpty) {
    log(
      'RevenueCat: defina REVENUECAT_ANDROID_API_KEY / REVENUECAT_IOS_API_KEY no .env.',
      name: 'mentor.bootstrap',
    );
    return;
  }

  await Purchases.setLogLevel(LogLevel.debug);

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
  } else {
    log(
      'Firebase indisponível: health checks e Crashlytics não ativados.',
      name: 'mentor.health',
    );
  }

  try {
    await FirebaseService.inicializarMessaging();
  } catch (e, st) {
    log('Messaging: $e', name: 'mentor.bootstrap', error: e, stackTrace: st);
  }

  await initializeRevenueCat(FirebaseAuth.instance.currentUser?.uid);
  await verificarStatusAssinatura();

  await themeController.initialize();
  await currencyPreferenceController.initialize();
  await localeController.initialize();
  await userPersonaService.initialize();

  if (kDebugMode) {
    debugPrint('=== TEMA DEBUG ===');
    debugPrint('O TEMA ATUAL É: ${themeController.themeMode}');
    debugPrint('================');
  }

  runZonedGuarded(() {
    runApp(const MentorFinanceiroApp());
  }, (error, stack) {
    log('Erro não tratado: $error', name: 'mentor.errors', error: error, stackTrace: stack);
    if (!kIsWeb && Firebase.apps.isNotEmpty) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
  });
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
            debugShowCheckedModeBanner: false,
            title: 'Mentor Financeiro',
            theme: themeController.currentTheme,
            themeMode: flutterThemeMode,
            locale: localeController.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            initialRoute: '/',
            onGenerateRoute: MentorAppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

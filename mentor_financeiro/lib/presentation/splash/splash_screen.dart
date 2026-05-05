import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_routes.dart';
import '../../core/navigation/fade_route.dart';
import '../widgets/void_loading_screen.dart';
import '../splash/splash_asset_resolver.dart';
import '../../services/firebase_service.dart';
import '../../services/user_persona_service.dart';
import '../../services/app_theme_controller.dart';
import '../../services/revenue_cat_subscription_service.dart';

/// Splash: integridade básica + autenticação + fluxo Mentor v2.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final DateTime _splashStartedAt;
  ({String asset, Color background, Color progress, Color particles})? _branding;

  @override
  void initState() {
    super.initState();
    _splashStartedAt = DateTime.now();
    // 1) Branding primeiro (CustomerInfo) para não dar "flash" de troca de logo.
    _loadBranding();
    // 2) Depois segue o fluxo de navegação/login.
    _iniciarApp();
  }

  Future<void> _loadBranding() async {
    try {
      final info = await RevenueCatSubscriptionService.getCustomerInfoSafe();
      final isPremium =
          info != null &&
          RevenueCatSubscriptionService.customerHasPremiumAccess(info);

      // Tema salvo nas prefs (AppThemeController já migra legacy e aplica gate).
      final theme = AppThemeController.instance;
      await theme.initialize();
      await theme.setPremiumStatus(isPremium);
      if (!isPremium && theme.themeMode.requiresPremiumEntitlement) {
        await theme.setThemeMode(AppThemeMode.voidTheme);
      }

      final branding = SplashAssetResolver.resolveBranding(
        isPremium: isPremium,
        theme: theme.themeMode,
      );
      if (!mounted) return;
      setState(() => _branding = branding);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _branding = SplashAssetResolver.resolveBranding(
          isPremium: false,
          theme: AppThemeMode.voidTheme,
        );
      });
    }
  }

  Future<void> _ensureHoldBeforeHome() async {
    final elapsed = DateTime.now().difference(_splashStartedAt);
    final min = VoidLoadingScreen.minimumNavigationHold;
    if (elapsed < min) {
      await Future<void>.delayed(min - elapsed);
    }
  }

  Future<void> _iniciarApp() async {
    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      if (mounted) {
        await pushReplacementNamedFade(context, AppRoutes.login);
      }
      return;
    }

    await prefs.setString('uid', user.uid);
    await prefs.setString('email_usuario', user.email ?? '');

    final dadosUsuario = await FirebaseService.buscarDadosUsuario(user.uid);
    var legacyOnboardingComplete = false;

    if (dadosUsuario != null) {
      await prefs.setString('nome_usuario', dadosUsuario['nome'] ?? 'Usuário');
      if (dadosUsuario['photoURL'] != null) {
        await prefs.setString('photo_url', dadosUsuario['photoURL']);
      }
      if (dadosUsuario['perfilInvestidor'] != null) {
        await prefs.setString(
          'perfil_investidor',
          dadosUsuario['perfilInvestidor'],
        );
      }

      final isAdmin = FirebaseService.verificarAdmin(user.email);
      final isPremium = isAdmin || (dadosUsuario['isPremium'] == true);
      await prefs.setBool('isPremium', isPremium);

      final onboardingCompleto = dadosUsuario['onboardingCompleto'] ?? false;
      legacyOnboardingComplete = onboardingCompleto == true;
      await prefs.setBool('onboarding_completo', onboardingCompleto);

      final perfilCompleto = dadosUsuario['perfilCompleto'] ?? false;

      if (!perfilCompleto) {
        if (mounted) {
          await pushReplacementNamedFade(context, AppRoutes.questionario);
        }
        return;
      } else if (!onboardingCompleto) {
        if (mounted) {
          await pushReplacementNamedFade(context, AppRoutes.onboardingMentor);
        }
        return;
      }
    } else {
      final photoUrl = user.photoURL;
      await FirebaseService.criarUsuarioPrimeiroLogin(
        uid: user.uid,
        nome: user.displayName ?? 'Usuário',
        email: user.email,
        metodoLogin: 'google',
        photoUrl: photoUrl,
      );

      if (mounted) {
        await pushReplacementNamedFade(context, AppRoutes.onboardingMentor);
      }
      return;
    }

    if (!mounted) return;

    await UserPersonaService.instance.migrateFromLegacyIfNeeded(
      legacyOnboardingComplete: legacyOnboardingComplete,
    );

    if (!mounted) return;

    if (!UserPersonaService.instance.mentorOnboardingDone) {
      await pushReplacementNamedFade(context, AppRoutes.onboardingMentor);
      return;
    }
    if (!UserPersonaService.instance.mentorPersonaSetupDone) {
      await pushReplacementNamedFade(context, AppRoutes.personaSetup);
      return;
    }
    if (!mounted) return;
    await _ensureHoldBeforeHome();
    if (!mounted) return;
    await pushReplacementNamedFade(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final branding = _branding;
    if (branding == null) {
      // Evita flash: mostra só o vazio até a decisão do branding.
      return const ColoredBox(color: Colors.black);
    }
    return VoidLoadingScreen(
      splashAsset: branding.asset,
      backgroundColor: branding.background,
      progressColor: branding.progress,
      particlesColor: branding.particles,
    );
  }
}

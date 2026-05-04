import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_routes.dart';
import '../../services/firebase_service.dart';
import '../../services/user_persona_service.dart';
import '../../pages/onboarding_page.dart';
import '../../pages/questionario_page.dart';

/// Splash: integridade básica + autenticação + fluxo Mentor v2.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _iniciarApp();
  }

  Future<void> _iniciarApp() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
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
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const QuestionarioPage()),
          );
        }
        return;
      } else if (!onboardingCompleto) {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const OnboardingPage()),
          );
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
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingPage()),
        );
      }
      return;
    }

    if (!mounted) return;

    await UserPersonaService.instance.migrateFromLegacyIfNeeded(
      legacyOnboardingComplete: legacyOnboardingComplete,
    );

    if (!mounted) return;

    if (!UserPersonaService.instance.mentorOnboardingDone) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingMentor);
      return;
    }
    if (!UserPersonaService.instance.mentorPersonaSetupDone) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.personaSetup);
      return;
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF00D9FF),
              ),
              child: const Icon(
                Icons.account_balance_wallet,
                size: 60,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'MENTOR FINANCEIRO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 80,
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Color(0xFF1E293B),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00D9FF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

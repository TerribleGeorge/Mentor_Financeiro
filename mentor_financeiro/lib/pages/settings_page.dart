import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_theme_controller.dart';
import '../services/theme_controller.dart';
import '../services/currency_preference_controller.dart';
import '../services/firebase_service.dart';
import '../services/locale_controller.dart';
import '../services/locale_ui_strings.dart';
import '../core/constants/app_routes.dart';
import '../core/navigation/mentor_navigation.dart';
import '../core/navigation/subscription_paywall_flow.dart';
import '../services/subscription_provider.dart';
import '../services/user_persona_service.dart';
import '../presentation/intro/intro_tour_screen.dart';
import 'currency_settings_page.dart';
import 'language_settings_page.dart';
import 'legal_documents_page.dart';
import 'tela_login.dart';
import 'notification_monitoring_page.dart';

/// Definições unificadas: perfil, senha, tema Void, moeda, localidade, assinatura, logout.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const Color voidBlack = Color(0xFF000000);
  static const Color voidCyan = Color(0xFF00E5FF);
  static const Color voidNeonGreen = Color(0xFF26DE81);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _nomeExibicao = 'Usuário';
  String? _photoUrl;

  Icon get _chevron => Icon(
    Icons.chevron_right,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );

  @override
  void initState() {
    super.initState();
    _carregarPerfil();
  }

  Future<void> _carregarPerfil() async {
    final user = FirebaseAuth.instance.currentUser;
    final prefs = await SharedPreferences.getInstance();
    final nomeSalvo = prefs.getString('nome_usuario');
    final photoSalva = prefs.getString('photo_url');

    final nome = (user?.displayName?.trim().isNotEmpty == true)
        ? user!.displayName!.trim()
        : (nomeSalvo ?? 'Usuário');
    final photo = (user?.photoURL?.trim().isNotEmpty == true)
        ? user!.photoURL!.trim()
        : (photoSalva?.trim().isNotEmpty == true ? photoSalva : null);

    if (!mounted) return;
    setState(() {
      _nomeExibicao = nome;
      _photoUrl = photo;
    });
  }

  bool get _podeAlterarSenha {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;
    return user.providerData.any(
      (p) => p.providerId == EmailAuthProvider.PROVIDER_ID,
    );
  }

  bool get _isDeveloperAccount {
    final e = FirebaseAuth.instance.currentUser?.email?.trim().toLowerCase();
    return e == 'george.guimares@gmail.com';
  }

  Future<void> _abrirPaywall() async {
    if (!mounted) return;
    await presentPaywallAndRefresh(
      context,
      context.read<SubscriptionProvider>(),
    );
  }

  Future<void> _mostrarAlterarSenha() async {
    final strings = LocaleUiStrings.of(context);
    if (!_podeAlterarSenha) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            strings.text(
              'Alteração de senha só está disponível para contas com e-mail e senha.',
              en: 'Password changes are only available for email and password accounts.',
              es: 'El cambio de contraseña solo está disponible para cuentas con correo y contraseña.',
            ),
          ),
        ),
      );
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email;
    if (user == null || email == null || email.isEmpty) return;

    final atualCtrl = TextEditingController();
    final novaCtrl = TextEditingController();
    final confirmaCtrl = TextEditingController();

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D1118),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: SettingsPage.voidCyan.withValues(alpha: 0.35),
          ),
        ),
        title: Text(
          strings.text(
            'Alterar senha',
            en: 'Change password',
            es: 'Cambiar contraseña',
          ),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: atualCtrl,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: strings.text(
                    'Senha atual',
                    en: 'Current password',
                    es: 'Contraseña actual',
                  ),
                  labelStyle: const TextStyle(color: Colors.white54),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: novaCtrl,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: strings.text(
                    'Nova senha',
                    en: 'New password',
                    es: 'Nueva contraseña',
                  ),
                  labelStyle: const TextStyle(color: Colors.white54),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: confirmaCtrl,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: strings.text(
                    'Confirmar nova',
                    en: 'Confirm new password',
                    es: 'Confirmar nueva',
                  ),
                  labelStyle: const TextStyle(color: Colors.white54),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              strings.text('Cancelar', en: 'Cancel', es: 'Cancelar'),
              style: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              strings.text('Salvar', en: 'Save', es: 'Guardar'),
              style: TextStyle(
                color: SettingsPage.voidCyan,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (ok != true || !mounted) {
      atualCtrl.dispose();
      novaCtrl.dispose();
      confirmaCtrl.dispose();
      return;
    }

    final atual = atualCtrl.text;
    final nova = novaCtrl.text;
    final conf = confirmaCtrl.text;
    atualCtrl.dispose();
    novaCtrl.dispose();
    confirmaCtrl.dispose();

    if (nova.length < 6) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              strings.text(
                'A nova senha deve ter pelo menos 6 caracteres.',
                en: 'The new password must have at least 6 characters.',
                es: 'La nueva contraseña debe tener al menos 6 caracteres.',
              ),
            ),
          ),
        );
      }
      return;
    }
    if (nova != conf) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              strings.text(
                'A confirmação não coincide.',
                en: 'The confirmation does not match.',
                es: 'La confirmación no coincide.',
              ),
            ),
          ),
        );
      }
      return;
    }

    try {
      final cred = EmailAuthProvider.credential(email: email, password: atual);
      await user.reauthenticateWithCredential(cred);
      await user.updatePassword(nova);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              strings.text(
                'Senha atualizada.',
                en: 'Password updated.',
                es: 'Contraseña actualizada.',
              ),
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message ??
                  strings.text(
                    'Falha ao alterar a senha.',
                    en: 'Failed to change password.',
                    es: 'No se pudo cambiar la contraseña.',
                  ),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              strings.text(
                'Não foi possível alterar a senha agora.',
                en: 'Could not change the password right now.',
                es: 'No se pudo cambiar la contraseña ahora.',
              ),
            ),
          ),
        );
      }
    }
  }

  Future<void> _logout() async {
    final strings = LocaleUiStrings.of(context);
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D1118),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: SettingsPage.voidCyan.withValues(alpha: 0.35),
          ),
        ),
        title: Text(
          strings.text('Terminar sessão', en: 'Sign out', es: 'Cerrar sesión'),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          strings.text(
            'Tem a certeza que pretende sair?',
            en: 'Are you sure you want to sign out?',
            es: '¿Seguro que quieres cerrar sesión?',
          ),
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              strings.text('Cancelar', en: 'Cancel', es: 'Cancelar'),
              style: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              strings.text('Sair', en: 'Sign out', es: 'Salir'),
              style: TextStyle(
                color: Color(0xFFFF6B6B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmar != true || !mounted) return;

    try {
      await FirebaseAuth.instance.signOut();
      await FirebaseService.logout();
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<void>(builder: (_) => const TelaLogin()),
        (route) => false,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              strings.text(
                'Não foi possível sair agora. Tente novamente.',
                en: 'Could not sign out right now. Try again.',
                es: 'No se pudo cerrar sesión ahora. Inténtalo de nuevo.',
              ),
            ),
          ),
        );
      }
    }
  }

  Future<void> _definirTema(AppThemeMode mode, AppThemeController theme) async {
    final sub = context.read<SubscriptionProvider>();
    final premiumOk = sub.hasUnlockedPremium;
    if (mode.requiresPremiumEntitlement && !premiumOk) {
      await _abrirPaywall();
      return;
    }
    await theme.setThemeMode(mode);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final subscription = context.watch<SubscriptionProvider>();
    final theme = context.watch<AppThemeController>();
    final brightnessTheme = context.watch<ThemeController>();
    final scheme = Theme.of(context).colorScheme;
    final textColor = scheme.onSurface;
    final mutedColor = scheme.onSurfaceVariant;
    final accentColor = scheme.primary;
    final successColor = scheme.secondary;
    final dividerColor = scheme.outlineVariant.withValues(alpha: 0.45);
    final strings = LocaleUiStrings.of(context);
    final user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email;
    final email = userEmail ?? strings.settingsNoSession;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: textColor,
        title: Text(
          strings.settingsTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: accentColor),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _secTitle(strings.settingsProfile),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: accentColor.withValues(alpha: 0.16),
              foregroundImage: _photoUrl != null && _photoUrl!.isNotEmpty
                  ? NetworkImage(_photoUrl!)
                  : null,
              child: (_photoUrl == null || _photoUrl!.isEmpty)
                  ? Icon(Icons.person, color: accentColor, size: 28)
                  : null,
            ),
            title: Text(
              _nomeExibicao,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                email,
                style: TextStyle(color: mutedColor, fontSize: 13),
              ),
            ),
          ),
          if (user == null) ...[
            const SizedBox(height: 4),
            ListTile(
              leading: Icon(Icons.login_rounded, color: successColor),
              title: Text(
                strings.text(
                  'Iniciar sessão',
                  en: 'Sign in',
                  es: 'Iniciar sesión',
                ),
                style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                strings.text(
                  'Ligue Google ou e-mail para sincronizar o perfil e dados na nuvem.',
                  en: 'Connect Google or email to sync your profile and data in the cloud.',
                  es: 'Conecta Google o correo para sincronizar tu perfil y datos en la nube.',
                ),
                style: TextStyle(color: mutedColor, fontSize: 12),
              ),
              trailing: _chevron,
              onTap: () => mentorPushNamed(context, AppRoutes.login),
            ),
          ],
          Divider(height: 24, color: dividerColor),
          ListTile(
            leading: Icon(Icons.lock_outline_rounded, color: accentColor),
            title: Text(
              strings.text(
                'Alterar palavra-passe',
                en: 'Change password',
                es: 'Cambiar contraseña',
              ),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              _podeAlterarSenha
                  ? strings.text(
                      'Atualizar palavra-passe da conta',
                      en: 'Update the account password',
                      es: 'Actualizar la contraseña de la cuenta',
                    )
                  : strings.text(
                      'Indisponível para login só com Google',
                      en: 'Unavailable for Google-only sign-in',
                      es: 'No disponible para inicio solo con Google',
                    ),
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            trailing: _chevron,
            onTap: _mostrarAlterarSenha,
          ),
          if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) ...[
            Divider(height: 1, color: dividerColor),
            ListTile(
              leading: Icon(
                Icons.notifications_active_outlined,
                color: successColor,
              ),
              title: Text(
                strings.text(
                  'Monitoramento por notificações',
                  en: 'Notification monitoring',
                  es: 'Monitoreo por notificaciones',
                ),
                style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                _isDeveloperAccount
                    ? strings.text(
                        'Permissões, diagnóstico de leitura e bateria',
                        en: 'Permissions, reading diagnostics, and battery',
                        es: 'Permisos, diagnóstico de lectura y batería',
                      )
                    : strings.text(
                        'Permissões, privacidade e bateria',
                        en: 'Permissions, privacy, and battery',
                        es: 'Permisos, privacidad y batería',
                      ),
                style: TextStyle(color: mutedColor, fontSize: 12),
              ),
              trailing: _chevron,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const NotificationMonitoringPage(),
                ),
              ),
            ),
          ],
          Divider(height: 24, color: dividerColor),
          _secTitle(
            strings.text(
              'Legal e segurança',
              en: 'Legal and security',
              es: 'Legal y seguridad',
            ),
          ),
          ListTile(
            leading: Icon(Icons.policy_outlined, color: accentColor),
            title: Text(
              strings.text(
                'Política, segurança e termos',
                en: 'Privacy, security, and terms',
                es: 'Privacidad, seguridad y términos',
              ),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              strings.text(
                'Textos exibidos conforme o idioma selecionado no app',
                en: 'Texts shown according to the selected app language',
                es: 'Textos mostrados según el idioma seleccionado en la app',
              ),
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            trailing: _chevron,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const LegalDocumentsPage(),
              ),
            ),
          ),
          Divider(height: 24, color: dividerColor),
          _secTitle(
            strings.text(
              'Brilho (Material)',
              en: 'Brightness (Material)',
              es: 'Brillo (Material)',
            ),
          ),
          const SizedBox(height: 4),
          ListTile(
            leading: Icon(
              Icons.brightness_auto_rounded,
              color: brightnessTheme.themeMode == ThemeMode.system
                  ? accentColor
                  : mutedColor,
            ),
            title: Text(
              strings.text(
                'Seguir sistema',
                en: 'Follow system',
                es: 'Seguir sistema',
              ),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              strings.text(
                'Usar claro ou escuro conforme o SO',
                en: 'Use light or dark according to the OS',
                es: 'Usar claro u oscuro según el sistema',
              ),
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            onTap: () => brightnessTheme.setThemeMode(ThemeMode.system),
          ),
          ListTile(
            leading: Icon(
              Icons.light_mode_outlined,
              color: brightnessTheme.themeMode == ThemeMode.light
                  ? accentColor
                  : mutedColor,
            ),
            title: Text(
              strings.text('Claro', en: 'Light', es: 'Claro'),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              strings.text(
                'Interface sempre clara',
                en: 'Always use light interface',
                es: 'Interfaz siempre clara',
              ),
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            onTap: () => brightnessTheme.setThemeMode(ThemeMode.light),
          ),
          ListTile(
            leading: Icon(
              Icons.dark_mode_outlined,
              color: brightnessTheme.themeMode == ThemeMode.dark
                  ? accentColor
                  : mutedColor,
            ),
            title: Text(
              strings.text('Escuro', en: 'Dark', es: 'Oscuro'),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              strings.text(
                'Interface sempre escura',
                en: 'Always use dark interface',
                es: 'Interfaz siempre oscura',
              ),
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            onTap: () => brightnessTheme.setThemeMode(ThemeMode.dark),
          ),
          Divider(height: 24, color: dividerColor),
          _secTitle(
            strings.text(
              'Aparência (Void)',
              en: 'Appearance (Void)',
              es: 'Apariencia (Void)',
            ),
          ),
          const SizedBox(height: 4),
          ...AppThemeMode.values.map((mode) {
            final premiumOk = subscription.hasUnlockedPremium;
            final locked = mode.requiresPremiumEntitlement && !premiumOk;
            final selected = theme.themeMode == mode;
            return ListTile(
              leading: Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: selected ? accentColor : mutedColor,
              ),
              title: Text(
                mode.displayName,
                style: TextStyle(
                  color: selected ? accentColor : textColor,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              subtitle: Text(
                locked
                    ? strings.text(
                        'Premium · toque para ver planos',
                        en: 'Premium · tap to view plans',
                        es: 'Premium · toca para ver planes',
                      )
                    : mode.settingsSubtitleText(strings),
                style: TextStyle(color: mutedColor, fontSize: 12),
              ),
              onTap: () => _definirTema(mode, theme),
            );
          }),
          Divider(height: 24, color: dividerColor),
          _secTitle(strings.settingsLanguageAndCurrency),
          ListenableBuilder(
            listenable: Listenable.merge([
              LocaleController.instance,
              CurrencyPreferenceController.instance,
            ]),
            builder: (context, _) {
              final lc = LocaleController.instance;
              final cc = CurrencyPreferenceController.instance;
              final languageCode = lc.locale.languageCode;
              final selectableLanguageCode =
                  LocaleController.isSelectableLanguageCode(languageCode)
                  ? languageCode
                  : 'en';
              final languageUsesFallback =
                  !LocaleController.isTranslatedLanguageCode(
                    selectableLanguageCode,
                  );
              return Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.language, color: accentColor),
                    title: Text(
                      strings.settingsAppLanguage,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      languageUsesFallback
                          ? strings.text(
                              '${LocaleController.languageLabel(selectableLanguageCode)} · textos em inglês',
                              en: '${LocaleController.languageLabel(selectableLanguageCode)} · English fallback',
                              es: '${LocaleController.languageLabel(selectableLanguageCode)} · textos en inglés',
                            )
                          : LocaleController.languageLabel(
                              selectableLanguageCode,
                            ),
                      style: TextStyle(color: mutedColor),
                    ),
                    trailing: _chevron,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const LanguageSettingsPage(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.payments_outlined, color: successColor),
                    title: Text(
                      strings.settingsDisplayCurrency,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      CurrencyPreferenceController.currencyLabel(cc.mode),
                      style: TextStyle(color: mutedColor),
                    ),
                    trailing: _chevron,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const CurrencySettingsPage(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Divider(height: 24, color: dividerColor),
          _secTitle(
            strings.text('Assinatura', en: 'Subscription', es: 'Suscripción'),
          ),
          ListTile(
            leading: Icon(
              subscription.isPremium
                  ? Icons.verified_outlined
                  : Icons.workspace_premium_outlined,
              color: subscription.isPremium ? successColor : accentColor,
            ),
            title: Text(
              strings.text(
                'Estado Premium',
                en: 'Premium status',
                es: 'Estado Premium',
              ),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: subscription.isPremium
                  ? Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: successColor.withValues(alpha: 0.95),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          strings.text(
                            'Assinante activo',
                            en: 'Active subscriber',
                            es: 'Suscriptor activo',
                          ),
                          style: TextStyle(
                            color: successColor.withValues(alpha: 0.92),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          strings.text(
                            'Plano Free · anúncios activos',
                            en: 'Free plan · ads active',
                            es: 'Plan Free · anuncios activos',
                          ),
                          style: TextStyle(color: mutedColor, fontSize: 13),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: subscription.isLoading
                                ? null
                                : _abrirPaywall,
                            style: TextButton.styleFrom(
                              foregroundColor: accentColor,
                              backgroundColor: accentColor.withValues(
                                alpha: 0.08,
                              ),
                              side: BorderSide(
                                color: accentColor.withValues(alpha: 0.85),
                                width: 1.2,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              strings.text(
                                'Upgrade para Pro',
                                en: 'Upgrade to Pro',
                                es: 'Mejorar a Pro',
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            trailing: subscription.isPremium ? _chevron : null,
            onTap: subscription.isPremium ? null : _abrirPaywall,
          ),
          ListTile(
            leading: Icon(Icons.explore_outlined, color: accentColor),
            title: Text(
              strings.text(
                'Ver tour novamente',
                en: 'View tour again',
                es: 'Ver tour de nuevo',
              ),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              strings.text(
                'O guia da home Mentor volta a iniciar na próxima vez que abrir esse painel.',
                en: 'The Mentor home guide will start again the next time you open that panel.',
                es: 'La guía de la home Mentor se iniciará de nuevo la próxima vez que abras ese panel.',
              ),
              style: TextStyle(color: mutedColor, fontSize: 13),
            ),
            trailing: _chevron,
            onTap: () async {
              await UserPersonaService.instance.resetGuidedTourForReplay();
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    strings.text(
                      'Tour reactivado. Abrimos a home Mentor — use Seguinte ou Saltar no guia.',
                      en: 'Tour reactivated. We opened Mentor home — use Next or Skip in the guide.',
                      es: 'Tour reactivado. Abrimos la home Mentor — usa Siguiente o Saltar en la guía.',
                    ),
                  ),
                ),
              );
              mentorPushNamed(context, AppRoutes.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.waving_hand_outlined, color: accentColor),
            title: Text(
              strings.text(
                'Introdução ao app',
                en: 'App introduction',
                es: 'Introducción a la app',
              ),
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              strings.text(
                'Mensagem do Mentor: apoio, calma, regra das 3 perguntas e por que preencher os dados.',
                en: 'Mentor message: support, calm, the 3-question rule, and why filling in data matters.',
                es: 'Mensaje del Mentor: apoyo, calma, regla de las 3 preguntas y por qué completar los datos.',
              ),
              style: TextStyle(color: mutedColor, fontSize: 13),
            ),
            trailing: _chevron,
            onTap: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  fullscreenDialog: true,
                  builder: (_) => const IntroTourScreen(fromSettings: true),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Color(0xFFFF6B6B)),
            title: Text(
              strings.text(
                'Terminar sessão',
                en: 'Sign out',
                es: 'Cerrar sesión',
              ),
              style: TextStyle(
                color: Color(0xFFFF6B6B),
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              strings.text(
                'Sair deste dispositivo',
                en: 'Sign out on this device',
                es: 'Salir de este dispositivo',
              ),
              style: TextStyle(color: mutedColor, fontSize: 13),
            ),
            trailing: _chevron,
            onTap: _logout,
          ),
          const SizedBox(height: 24),
          if (_isDeveloperAccount) ...[
            Divider(height: 1, color: dividerColor),
            ListTile(
              leading: Icon(Icons.bolt_rounded, color: successColor),
              title: Text(
                'Simular Premium (Admin)',
                style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'Bypass · apenas administrador',
                style: TextStyle(color: mutedColor),
              ),
              trailing: _chevron,
              onTap: subscription.isLoading
                  ? null
                  : () async {
                      // ignore: avoid_print
                      print('Simulando Premium para o George...');
                      await Provider.of<SubscriptionProvider>(
                        context,
                        listen: false,
                      ).simulatePremium();
                    },
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _secTitle(String t) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      t,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    ),
  );
}

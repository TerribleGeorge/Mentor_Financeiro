import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_theme_controller.dart';
import '../services/theme_controller.dart';
import '../services/currency_preference_controller.dart';
import '../services/firebase_service.dart';
import '../services/locale_controller.dart';
import '../core/navigation/subscription_paywall_flow.dart';
import '../services/subscription_provider.dart';
import 'currency_settings_page.dart';
import 'language_settings_page.dart';
import 'backup_restore_page.dart';
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

    final nome = (user?.displayName?.trim().isNotEmpty == true)
        ? user!.displayName!.trim()
        : (nomeSalvo ?? 'Usuário');
    final photo = user?.photoURL?.trim().isNotEmpty == true
        ? user!.photoURL!.trim()
        : null;

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

  Future<void> _abrirPaywall() async {
    if (!mounted) return;
    await presentPaywallAndRefresh(
      context,
      context.read<SubscriptionProvider>(),
    );
  }

  Future<void> _mostrarAlterarSenha() async {
    if (!_podeAlterarSenha) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Alteração de senha só está disponível para contas com e-mail e senha.',
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
        title: const Text(
          'Alterar senha',
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
                decoration: const InputDecoration(
                  labelText: 'Senha atual',
                  labelStyle: TextStyle(color: Colors.white54),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: novaCtrl,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Nova senha',
                  labelStyle: TextStyle(color: Colors.white54),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: confirmaCtrl,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Confirmar nova',
                  labelStyle: TextStyle(color: Colors.white54),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text(
              'Salvar',
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
          const SnackBar(
            content: Text('A nova senha deve ter pelo menos 6 caracteres.'),
          ),
        );
      }
      return;
    }
    if (nova != conf) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('A confirmação não coincide.')),
        );
      }
      return;
    }

    try {
      final cred = EmailAuthProvider.credential(email: email, password: atual);
      await user.reauthenticateWithCredential(cred);
      await user.updatePassword(nova);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Senha atualizada.')));
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Falha ao alterar a senha.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erro: $e')));
      }
    }
  }

  Future<void> _logout() async {
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
        title: const Text(
          'Terminar sessão',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Tem a certeza que pretende sair?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text(
              'Sair',
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erro ao sair: $e')));
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
    final user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email;
    final email = userEmail ?? 'Sem sessão iniciada';

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: textColor,
        title: Text(
          'Definições',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: accentColor),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _secTitle('Perfil'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    email,
                    style: TextStyle(color: mutedColor, fontSize: 13),
                  ),
                  if (user != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      'A foto de perfil é a da sua conta de início de sessão '
                      '(por exemplo Google).',
                      style: TextStyle(
                        color: mutedColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Divider(height: 24, color: dividerColor),
          ListTile(
            leading: Icon(Icons.lock_outline_rounded, color: accentColor),
            title: Text(
              'Alterar palavra-passe',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              _podeAlterarSenha
                  ? 'Atualizar credenciais do Firebase'
                  : 'Indisponível para login só com Google',
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            trailing: _chevron,
            onTap: _mostrarAlterarSenha,
          ),
          Divider(height: 1, color: dividerColor),
          ListTile(
            leading: Icon(
              Icons.notifications_active_outlined,
              color: successColor,
            ),
            title: Text(
              'Monitoramento por notificações',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Ler apenas notificações de gastos (sem acessar conta bancária)',
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            trailing: _chevron,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const NotificationMonitoringPage(),
              ),
            ),
          ),
          Divider(height: 24, color: dividerColor),
          _secTitle('Dados'),
          ListTile(
            leading: Icon(Icons.cloud_sync_outlined, color: accentColor),
            title: Text(
              'Backup e restauração',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Salvar preferências e restaurar dados da nuvem',
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            trailing: _chevron,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const BackupRestorePage(),
              ),
            ),
          ),
          Divider(height: 24, color: dividerColor),
          _secTitle('Brilho (Material)'),
          const SizedBox(height: 4),
          ListTile(
            leading: Icon(
              Icons.brightness_auto_rounded,
              color: brightnessTheme.themeMode == ThemeMode.system
                  ? accentColor
                  : mutedColor,
            ),
            title: Text(
              'Seguir sistema',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Usar claro ou escuro conforme o SO',
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
              'Claro',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Interface sempre clara',
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
              'Escuro',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Interface sempre escura',
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            onTap: () => brightnessTheme.setThemeMode(ThemeMode.dark),
          ),
          Divider(height: 24, color: dividerColor),
          _secTitle('Aparência (Void)'),
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
                    ? 'Premium · toque para ver planos'
                    : mode.settingsSubtitle,
                style: TextStyle(color: mutedColor, fontSize: 12),
              ),
              onTap: () => _definirTema(mode, theme),
            );
          }),
          Divider(height: 24, color: dividerColor),
          _secTitle('Idioma e moeda'),
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
                      'Idioma da app',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      languageUsesFallback
                          ? '${LocaleController.languageLabel(selectableLanguageCode)} · fallback em inglês'
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
                      'Moeda de exibição',
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
          _secTitle('Assinatura'),
          ListTile(
            leading: Icon(
              subscription.isPremium
                  ? Icons.verified_outlined
                  : Icons.workspace_premium_outlined,
              color: subscription.isPremium ? successColor : accentColor,
            ),
            title: Text(
              'Estado Premium',
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
                          'Assinante activo',
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
                          'Plano Free · anúncios activos',
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
                            child: const Text(
                              'Upgrade para Pro',
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
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Color(0xFFFF6B6B)),
            title: const Text(
              'Terminar sessão',
              style: TextStyle(
                color: Color(0xFFFF6B6B),
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Sair deste dispositivo',
              style: TextStyle(color: mutedColor, fontSize: 13),
            ),
            trailing: _chevron,
            onTap: _logout,
          ),
          const SizedBox(height: 24),
          if (userEmail?.trim().toLowerCase() ==
              'george.guimares@gmail.com') ...[
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

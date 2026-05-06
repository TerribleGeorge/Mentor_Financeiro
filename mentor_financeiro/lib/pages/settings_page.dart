import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_theme_controller.dart';
import '../services/theme_controller.dart';
import '../services/currency_preference_controller.dart';
import '../services/firebase_service.dart';
import '../services/locale_controller.dart';
import '../services/revenue_cat_bootstrap.dart';
import '../services/subscription_provider.dart';
import 'finance_configuration_page.dart';
import 'paywall_screen.dart';
import 'tela_login.dart';

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

  static const _chevron = Icon(Icons.chevron_right, color: Color(0x66FFFFFF));

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
    return user.providerData.any((p) => p.providerId == EmailAuthProvider.PROVIDER_ID);
  }

  Future<void> _abrirPaywall() async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
    );
    if (mounted) await context.read<SubscriptionProvider>().refreshStatus();
  }

  Future<void> _mostrarAlterarSenha() async {
    if (!_podeAlterarSenha) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Alteração de senha só está disponível para contas com e-mail e palavra-passe.',
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
          side: BorderSide(color: SettingsPage.voidCyan.withValues(alpha: 0.35)),
        ),
        title: const Text(
          'Alterar palavra-passe',
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
                  labelText: 'Palavra-passe actual',
                  labelStyle: TextStyle(color: Colors.white54),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: novaCtrl,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Nova palavra-passe',
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
              'Guardar',
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
          const SnackBar(content: Text('A nova palavra-passe deve ter pelo menos 6 caracteres.')),
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Palavra-passe actualizada.')),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Falha ao alterar a palavra-passe.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: $e')),
        );
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
          side: BorderSide(color: SettingsPage.voidCyan.withValues(alpha: 0.35)),
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
      await RevenueCatBootstrap.logOutIfConfigured();
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<void>(builder: (_) => const TelaLogin()),
        (route) => false,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao sair: $e')),
        );
      }
    }
  }

  Future<void> _definirTema(AppThemeMode mode, AppThemeController theme) async {
    final sub = context.read<SubscriptionProvider>();
    if (mode.requiresPremiumEntitlement && !sub.isPremium) {
      await _abrirPaywall();
      return;
    }
    await theme.setThemeMode(mode);
    if (mounted) setState(() {});
  }

  String _rotuloMoeda(String mode) {
    switch (mode.toUpperCase()) {
      case 'AUTO':
        return 'Automática (idioma)';
      case 'BRL':
        return 'Real (BRL)';
      case 'USD':
        return 'Dólar (USD)';
      case 'EUR':
        return 'Euro (EUR)';
      default:
        return mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    final subscription = context.watch<SubscriptionProvider>();
    final theme = context.watch<AppThemeController>();
    final brightnessTheme = context.watch<ThemeController>();
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? 'Sem sessão iniciada';

    return Scaffold(
      backgroundColor: SettingsPage.voidBlack,
      appBar: AppBar(
        backgroundColor: SettingsPage.voidBlack,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          'Definições',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: SettingsPage.voidCyan),
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
              backgroundColor: SettingsPage.voidCyan.withValues(alpha: 0.2),
              foregroundImage:
                  _photoUrl != null && _photoUrl!.isNotEmpty ? NetworkImage(_photoUrl!) : null,
              child: (_photoUrl == null || _photoUrl!.isEmpty)
                  ? const Icon(Icons.person, color: SettingsPage.voidCyan, size: 28)
                  : null,
            ),
            title: Text(
              _nomeExibicao,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                email,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.55),
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const Divider(height: 24, color: Color(0x14FFFFFF)),
          ListTile(
            leading: const Icon(Icons.lock_outline_rounded, color: SettingsPage.voidCyan),
            title: const Text(
              'Alterar palavra-passe',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              _podeAlterarSenha
                  ? 'Actualizar credenciais Firebase'
                  : 'Indisponível para login só com Google',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 12),
            ),
            trailing: _chevron,
            onTap: _mostrarAlterarSenha,
          ),
          const Divider(height: 1, color: Color(0x14FFFFFF)),
          ListTile(
            leading: const Icon(Icons.savings_outlined, color: SettingsPage.voidNeonGreen),
            title: const Text(
              'Renda e gastos fixos',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Configurar orçamento mensal',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 13),
            ),
            trailing: _chevron,
            onTap: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(builder: (_) => const FinanceConfigurationPage()),
              );
            },
          ),
          const Divider(height: 24, color: Color(0x14FFFFFF)),
          _secTitle('Brilho (Material)'),
          const SizedBox(height: 4),
          ListTile(
            leading: Icon(
              Icons.brightness_auto_rounded,
              color: brightnessTheme.themeMode == ThemeMode.system
                  ? SettingsPage.voidCyan
                  : Colors.white38,
            ),
            title: const Text(
              'Seguir sistema',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Usar claro ou escuro conforme o SO',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 12),
            ),
            onTap: () => brightnessTheme.setThemeMode(ThemeMode.system),
          ),
          ListTile(
            leading: Icon(
              Icons.light_mode_outlined,
              color: brightnessTheme.themeMode == ThemeMode.light
                  ? SettingsPage.voidCyan
                  : Colors.white38,
            ),
            title: const Text(
              'Claro',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Interface sempre clara',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 12),
            ),
            onTap: () => brightnessTheme.setThemeMode(ThemeMode.light),
          ),
          ListTile(
            leading: Icon(
              Icons.dark_mode_outlined,
              color: brightnessTheme.themeMode == ThemeMode.dark
                  ? SettingsPage.voidCyan
                  : Colors.white38,
            ),
            title: const Text(
              'Escuro',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Interface sempre escura',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 12),
            ),
            onTap: () => brightnessTheme.setThemeMode(ThemeMode.dark),
          ),
          const Divider(height: 24, color: Color(0x14FFFFFF)),
          _secTitle('Aparência (Void)'),
          const SizedBox(height: 4),
          ...AppThemeMode.values.map((mode) {
            final locked = mode.requiresPremiumEntitlement && !subscription.isPremium;
            final selected = theme.themeMode == mode;
            return ListTile(
              leading: Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: selected ? SettingsPage.voidCyan : Colors.white38,
              ),
              title: Text(
                themeLabel(mode),
                style: TextStyle(
                  color: selected ? SettingsPage.voidCyan : Colors.white,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              subtitle: Text(
                locked ? 'Premium · toque para ver planos' : themeSubtitle(mode),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.45),
                  fontSize: 12,
                ),
              ),
              onTap: () => _definirTema(mode, theme),
            );
          }),
          const Divider(height: 24, color: Color(0x14FFFFFF)),
          _secTitle('Idioma e moeda'),
          ListenableBuilder(
            listenable: Listenable.merge([
              LocaleController.instance,
              CurrencyPreferenceController.instance,
            ]),
            builder: (context, _) {
              final lc = LocaleController.instance;
              final cc = CurrencyPreferenceController.instance;
              return Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.language, color: SettingsPage.voidCyan),
                    title: const Text(
                      'Idioma da app',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      _languageLabel(lc.locale.languageCode),
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                    ),
                    trailing: DropdownButton<String>(
                      value: lc.locale.languageCode,
                      dropdownColor: const Color(0xFF0D1118),
                      underline: const SizedBox.shrink(),
                      style: const TextStyle(color: Colors.white),
                      items: LocaleController.supportedLanguageCodes
                          .map(
                            (code) => DropdownMenuItem(
                              value: code,
                              child: Text(_languageLabel(code)),
                            ),
                          )
                          .toList(),
                      onChanged: (code) {
                        if (code != null) lc.setLanguageCode(code);
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.payments_outlined, color: SettingsPage.voidNeonGreen),
                    title: const Text(
                      'Moeda de exibição',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      _rotuloMoeda(cc.mode),
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                    ),
                    trailing: DropdownButton<String>(
                      value: cc.mode,
                      dropdownColor: const Color(0xFF0D1118),
                      underline: const SizedBox.shrink(),
                      style: const TextStyle(color: Colors.white),
                      items: const [
                        DropdownMenuItem(value: 'AUTO', child: Text('Automática')),
                        DropdownMenuItem(value: 'BRL', child: Text('BRL')),
                        DropdownMenuItem(value: 'USD', child: Text('USD')),
                        DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                      ],
                      onChanged: (m) {
                        if (m != null) cc.setCurrencyMode(m);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const Divider(height: 24, color: Color(0x14FFFFFF)),
          _secTitle('Assinatura'),
          ListTile(
            leading: Icon(
              subscription.isPremium
                  ? Icons.verified_outlined
                  : Icons.workspace_premium_outlined,
              color: subscription.isPremium
                  ? SettingsPage.voidNeonGreen
                  : SettingsPage.voidCyan,
            ),
            title: const Text(
              'Estado RevenueCat',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: subscription.isPremium
                  ? Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: SettingsPage.voidNeonGreen.withValues(alpha: 0.95),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Assinante activo',
                          style: TextStyle(
                            color: SettingsPage.voidNeonGreen.withValues(alpha: 0.92),
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
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: subscription.isLoading ? null : _abrirPaywall,
                            style: TextButton.styleFrom(
                              foregroundColor: SettingsPage.voidCyan,
                              backgroundColor: SettingsPage.voidCyan.withValues(alpha: 0.08),
                              side: BorderSide(
                                color: SettingsPage.voidCyan.withValues(alpha: 0.85),
                                width: 1.2,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
              style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 13),
            ),
            trailing: _chevron,
            onTap: _logout,
          ),
          const SizedBox(height: 24),
          if (FirebaseAuth.instance.currentUser?.email?.trim().toLowerCase() ==
              'george.guimares@gmail.com') ...[
            const Divider(height: 1, color: Color(0x14FFFFFF)),
            ListTile(
              leading: Icon(Icons.bolt_rounded, color: SettingsPage.voidNeonGreen),
              title: const Text(
                'Simular Premium (Admin)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'Bypass · apenas administrador',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
              ),
              trailing: const Icon(Icons.chevron_right, color: Color(0x66FFFFFF)),
              onTap: subscription.isLoading
                  ? null
                  : () async {
                      // ignore: avoid_print
                      print('Simulando Premium para o George...');
                      await context.read<SubscriptionProvider>().simulatePremium();
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
            color: Colors.white.withValues(alpha: 0.42),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      );

  static String themeLabel(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.voidTheme:
        return 'Void';
      case AppThemeMode.cyber:
        return 'Cyber';
      case AppThemeMode.obsidian:
        return 'Grimm';
      case AppThemeMode.glacier:
        return 'Hive';
    }
  }

  static String themeSubtitle(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.voidTheme:
        return 'Preto absoluto · Hollow Knight';
      case AppThemeMode.cyber:
        return 'Néon roxo · premium';
      case AppThemeMode.obsidian:
        return 'Cinzento profundo · premium';
      case AppThemeMode.glacier:
        return 'Claro gelo · premium';
    }
  }

  static String _languageLabel(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        return 'Português';
    }
  }
}

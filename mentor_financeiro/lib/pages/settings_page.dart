import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../services/app_theme_controller.dart';
import '../services/subscription_provider.dart';
import 'paywall_screen.dart';
import '../services/currency_preference_controller.dart';
import '../services/locale_controller.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _idiomaSelecionado = 'pt';
  String _moedaSelecionada = 'BRL';
  final _themeController = AppThemeController();

  @override
  void initState() {
    super.initState();
    _carregarPreferencias();
  }

  Future<void> _carregarPreferencias() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _idiomaSelecionado = prefs.getString(LocaleController.prefsKey) ?? 'pt';
      _moedaSelecionada = prefs.getString('moeda') ?? 'AUTO';
    });
  }

  @override
  Widget build(BuildContext context) {
    final subscription = context.watch<SubscriptionProvider>();
    return ListenableBuilder(
      listenable: Listenable.merge([_themeController, subscription]),
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Configurações',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Aparência'),
                const SizedBox(height: 12),
                _buildCard([
                  _buildThemeSelector(subscription),
                ]),
                const SizedBox(height: 24),
                _buildSectionTitle('Conta'),
                const SizedBox(height: 12),
                _buildCard([
                  _buildListTile(
                    icon: Icons.email_outlined,
                    title: 'E-mail',
                    subtitle:
                        FirebaseAuth.instance.currentUser?.email ??
                        'Não conectado',
                    onTap: () {},
                  ),
                  const Divider(color: Colors.white12),
                  _buildListTile(
                    icon: Icons.lock_outline,
                    title: 'Alterar Senha',
                    subtitle: 'Redefinir sua senha',
                    onTap: _showTrocarSenha,
                  ),
                ]),
                const SizedBox(height: 24),
                _buildSectionTitle('Preferências'),
                const SizedBox(height: 12),
                _buildCard([
                  _buildListTile(
                    icon: Icons.language,
                    title: 'Idioma',
                    subtitle: _getIdiomaNome(_idiomaSelecionado),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.white38,
                    ),
                    onTap: _showSelectorIdioma,
                  ),
                  const Divider(color: Colors.white12),
                  _buildListTile(
                    icon: Icons.attach_money,
                    title: 'Unidade Monetária',
                    subtitle: _getMoedaNome(context, _moedaSelecionada),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.white38,
                    ),
                    onTap: _showSelectorMoeda,
                  ),
                ]),
                const SizedBox(height: 24),
                _buildSectionTitle('Jurídico'),
                const SizedBox(height: 12),
                _buildCard([
                  _buildListTile(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacidade',
                    subtitle: 'Nossa política de privacidade',
                    onTap: () {},
                  ),
                  const Divider(color: Colors.white12),
                  _buildListTile(
                    icon: Icons.description_outlined,
                    title: 'Termos de Uso',
                    subtitle: 'Termos e condições',
                    onTap: () {},
                  ),
                ]),
                const SizedBox(height: 24),
                _buildSectionTitle('Assinatura'),
                const SizedBox(height: 12),
                _buildCard([
                  ListTile(
                    leading: const Icon(
                      Icons.workspace_premium_outlined,
                      color: Colors.white70,
                    ),
                    title: const Text(
                      'Fazer teste de assinatura',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Oferta mensal (trial) via RevenueCat.',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                    onTap: subscription.isLoading
                        ? null
                        : () async {
                            final messenger = ScaffoldMessenger.of(context);
                            final sub = context.read<SubscriptionProvider>();
                            try {
                              sub.clearErrorMessage();
                              await Navigator.of(context).push<void>(
                                MaterialPageRoute<void>(
                                  builder: (_) => const PaywallScreen(),
                                ),
                              );
                              if (!mounted) return;
                              await sub.refreshFromRevenueCat();
                              if (!mounted) return;
                              if (sub.hasPremiumEntitlementFromRevenueCat) {
                                messenger.showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Assinatura activa — temas premium desbloqueados.',
                                    ),
                                  ),
                                );
                              } else if (sub.errorMessage != null &&
                                  sub.errorMessage!.isNotEmpty) {
                                messenger.showSnackBar(
                                  SnackBar(content: Text(sub.errorMessage!)),
                                );
                              }
                            } catch (e) {
                              if (mounted) {
                                messenger.showSnackBar(
                                  SnackBar(content: Text('Erro: $e')),
                                );
                              }
                            }
                          },
                  ),
                  if (kDebugMode) ...[
                    const Divider(color: Colors.white12),
                    ListTile(
                      leading: const Icon(Icons.science_outlined,
                          color: Colors.white70),
                      title: const Text(
                        'Simular premium (debug)',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () async {
                        final messenger = ScaffoldMessenger.of(context);
                        await context
                            .read<SubscriptionProvider>()
                            .debugSimulatePremiumPurchase();
                        if (!mounted) return;
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text('Premium simulado (debug).'),
                          ),
                        );
                      },
                    ),
                  ],
                ]),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF00D9FF),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return GlassCard(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(16),
      child: Column(children: children),
    );
  }

  Widget _buildThemeSelector(SubscriptionProvider subscription) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.palette, color: Colors.white70, size: 22),
              SizedBox(width: 16),
              Text(
                'Tema devvoid',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildTemaChip(subscription, 'Void', AppThemeMode.voidTheme),
              _buildTemaChip(subscription, 'Cyber', AppThemeMode.cyber),
              _buildTemaChip(subscription, 'Grimm', AppThemeMode.obsidian),
              _buildTemaChip(subscription, 'Hive', AppThemeMode.glacier),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTemaChip(
    SubscriptionProvider subscription,
    String nome,
    AppThemeMode mode,
  ) {
    final isSelected = _themeController.themeMode == mode;
    final locked = mode.requiresPremiumEntitlement &&
        !subscription.hasPremiumEntitlementFromRevenueCat;
    return GestureDetector(
      onTap: subscription.isLoading
          ? null
          : () async {
              final messenger = ScaffoldMessenger.of(context);
              if (!mode.requiresPremiumEntitlement) {
                await _themeController.setThemeMode(mode);
                return;
              }
              if (subscription.hasPremiumEntitlementFromRevenueCat) {
                await _themeController.setThemeMode(mode);
                return;
              }
              try {
                subscription.clearErrorMessage();
                await Navigator.of(context).push<void>(
                  MaterialPageRoute<void>(
                    builder: (_) => const PaywallScreen(),
                  ),
                );
                if (!mounted) return;
                await subscription.refreshFromRevenueCat();
                if (!mounted) return;
                if (subscription.hasPremiumEntitlementFromRevenueCat) {
                  await _themeController.setThemeMode(mode);
                  if (!mounted) return;
                  messenger.showSnackBar(
                    SnackBar(content: Text('$nome desbloqueado.')),
                  );
                } else if (subscription.errorMessage != null &&
                    subscription.errorMessage!.isNotEmpty) {
                  messenger.showSnackBar(
                    SnackBar(content: Text(subscription.errorMessage!)),
                  );
                }
              } catch (e) {
                if (mounted) {
                  messenger.showSnackBar(
                    SnackBar(content: Text('Erro: $e')),
                  );
                }
              }
            },
      child: Opacity(
        opacity: locked ? 0.45 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF00D9FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? const Color(0xFF00D9FF) : Colors.white30,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (locked) ...[
                const Icon(Icons.lock, size: 12, color: Colors.white60),
                const SizedBox(width: 4),
              ],
              Text(
                nome,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70, size: 22),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            )
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }

  String _getIdiomaNome(String codigo) {
    switch (codigo) {
      case 'pt':
        return 'Português';
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        return 'Português';
    }
  }

  String _getMoedaNome(BuildContext context, String codigo) {
    final l10n = AppLocalizations.of(context);
    switch (codigo) {
      case 'AUTO':
        return l10n?.currencyFollowLocale ?? 'Automático (idioma)';
      case 'BRL':
        return 'Real (R\$)';
      case 'USD':
        return 'Dólar (\$)';
      case 'EUR':
        return 'Euro (€)';
      default:
        return l10n?.currencyFollowLocale ?? 'Automático (idioma)';
    }
  }

  void _showSelectorIdioma() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecione o Idioma',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            ...['pt', 'en', 'es'].map(
              (cod) => ListTile(
                title: Text(
                  _getIdiomaNome(cod),
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: _idiomaSelecionado == cod
                    ? const Icon(Icons.check, color: Color(0xFF00D9FF))
                    : null,
                onTap: () async {
                  setState(() => _idiomaSelecionado = cod);
                  await LocaleController.instance.setLanguageCode(cod);
                  if (context.mounted) Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSelectorMoeda() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecione a Moeda',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            ...['AUTO', 'BRL', 'USD', 'EUR'].map(
              (cod) => ListTile(
                title: Text(
                  _getMoedaNome(context, cod),
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: _moedaSelecionada == cod
                    ? const Icon(Icons.check, color: Color(0xFF00D9FF))
                    : null,
                onTap: () async {
                  setState(() => _moedaSelecionada = cod);
                  await CurrencyPreferenceController.instance.setCurrencyMode(cod);
                  if (context.mounted) Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTrocarSenha() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text(
          'Alterar Senha',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Enviaremos um link para seu e-mail.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = FirebaseAuth.instance.currentUser?.email;
              if (email != null) {
                await FirebaseAuth.instance.sendPasswordResetEmail(
                  email: email,
                );
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Link enviado para $email')),
                  );
                }
              }
            },
            child: const Text(
              'Enviar',
              style: TextStyle(color: Color(0xFF00D9FF)),
            ),
          ),
        ],
      ),
    );
  }
}

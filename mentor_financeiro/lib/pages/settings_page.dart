import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../services/app_theme_controller.dart';
import '../services/subscription_provider.dart';
import 'paywall_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _idiomaSelecionado = 'pt';
  String _moedaSelecionada = 'BRL';
  int _temaSelecionado = 2;
  final _themeController = AppThemeController();

  @override
  void initState() {
    super.initState();
    _carregarPreferencias();
    _themeController.initialize();
  }

  Future<void> _carregarPreferencias() async {
    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (mounted) {
        setState(() {
          _idiomaSelecionado = prefs.getString('idioma') ?? 'pt';
          _moedaSelecionada = prefs.getString('moeda') ?? 'BRL';
          _temaSelecionado = _themeController.themeMode.index;
        });
      }
    }
  }

  Future<void> _salvarPreferencia(String chave, dynamic valor) async {
    final prefs = await SharedPreferences.getInstance();
    if (valor is int) {
      await prefs.setInt(chave, valor);
    } else {
      await prefs.setString(chave, valor.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPremium = context.watch<SubscriptionProvider>().isPremium;
    return ListenableBuilder(
      listenable: _themeController,
      builder: (context, _) {
        _temaSelecionado = _themeController.themeMode.index;

        return Scaffold(
          backgroundColor: const Color(0xFF0F172A),
          appBar: AppBar(
            backgroundColor: const Color(0xFF0F172A),
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
                  _buildThemeSelector(),
                  const Divider(color: Colors.white12),
                  _buildListTile(
                    icon: Icons.wallpaper,
                    title: 'Personalizar Fundo',
                    subtitle: isPremium ? 'Ativo' : 'Somente Premium',
                    trailing: isPremium
                        ? const Icon(
                            Icons.check_circle,
                            color: Color(0xFF26DE81),
                          )
                        : const Icon(Icons.lock, color: Colors.white38),
                    onTap: isPremium
                        ? () => _themeController.pickBackgroundImage()
                        : _showPremiumDialog,
                  ),
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
                    subtitle: _getMoedaNome(_moedaSelecionada),
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildThemeSelector() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.palette, color: Colors.white70, size: 22),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Tema',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          _buildTemaChip('Claro', 0),
          const SizedBox(width: 8),
          _buildTemaChip('Médio', 1),
          const SizedBox(width: 8),
          _buildTemaChip('Escuro', 2),
        ],
      ),
    );
  }

  Widget _buildTemaChip(String nome, int tema) {
    final isSelected = _temaSelecionado == tema;
    return GestureDetector(
      onTap: () {
        setState(() => _temaSelecionado = tema);
        _salvarPreferencia('tema', tema);
        _themeController.setThemeMode(AppThemeMode.values[tema]);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00D9FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF00D9FF) : Colors.white30,
          ),
        ),
        child: Text(
          nome,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white70,
            fontSize: 12,
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

  String _getMoedaNome(String codigo) {
    switch (codigo) {
      case 'BRL':
        return 'Real (R\$)';
      case 'USD':
        return 'Dólar (\$)';
      case 'EUR':
        return 'Euro (€)';
      default:
        return 'Real (R\$)';
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
                onTap: () {
                  setState(() => _idiomaSelecionado = cod);
                  _salvarPreferencia('idioma', cod);
                  Navigator.pop(context);
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
            ...['BRL', 'USD', 'EUR'].map(
              (cod) => ListTile(
                title: Text(
                  _getMoedaNome(cod),
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: _moedaSelecionada == cod
                    ? const Icon(Icons.check, color: Color(0xFF00D9FF))
                    : null,
                onTap: () {
                  setState(() => _moedaSelecionada = cod);
                  _salvarPreferencia('moeda', cod);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPremiumDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text(
          'Funcionalidade Premium',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Faça upgrade para Premium!',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Agora Não',
              style: TextStyle(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                this.context,
                MaterialPageRoute(builder: (_) => const PaywallScreen()),
              );
            },
            child: const Text(
              'Upgrade',
              style: TextStyle(color: Color(0xFF00D9FF)),
            ),
          ),
        ],
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

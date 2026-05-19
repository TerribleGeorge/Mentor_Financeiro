import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/classic_mode_style.dart';
import '../theme/mentor_adaptive_visuals.dart';
import '../services/firebase_service.dart';
import '../services/locale_ui_strings.dart';
import 'tela_login.dart';
import 'questionario_page.dart';
import 'settings_page.dart';
import 'customer_center_screen.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  Map<String, dynamic>? _dadosUsuario;
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final user = FirebaseAuth.instance.currentUser;
    final prefs = await SharedPreferences.getInstance();
    final dadosLocais = <String, dynamic>{
      'nome': prefs.getString('nome_usuario') ?? user?.displayName ?? 'Usuário',
      'email': user?.email,
      'photoURL': user?.photoURL,
      'profissao': prefs.getString('profissao') ?? '',
      'perfilInvestidor': prefs.getString('perfil_investidor') ?? '',
      'objetivos': prefs.getString('objetivos') ?? '',
    };

    if (mounted) {
      setState(() {
        _dadosUsuario = dadosLocais;
        _carregando = false;
      });
    }

    if (user != null) {
      final dados = await FirebaseService.buscarDadosUsuario(
        user.uid,
      ).timeout(const Duration(seconds: 3), onTimeout: () => null);
      if (mounted) {
        setState(() {
          _dadosUsuario = {...dadosLocais, if (dados != null) ...dados};
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final strings = LocaleUiStrings.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: _carregando
            ? Center(child: CircularProgressIndicator(color: scheme.primary))
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      strings.settingsProfile,
                      style: TextStyle(
                        color: scheme.onSurface,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: ClassicModeStyle.primaryTextShadows(context),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildProfileHeader(),
                    const SizedBox(height: 24),
                    _buildMenuItens(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    final user = FirebaseAuth.instance.currentUser;
    final strings = LocaleUiStrings.of(context);
    final nome =
        _dadosUsuario?['nome'] ??
        user?.displayName ??
        strings.text('Usuário', en: 'User', es: 'Usuario');
    final email =
        FirebaseAuth.instance.currentUser?.email ??
        strings.text(
          'Usuário não logado',
          en: 'User not signed in',
          es: 'Usuario sin sesión',
        );
    final photoUrl = FirebaseAuth.instance.currentUser?.photoURL;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.mentorAdaptive.widgetColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.mentorAdaptive.textColor.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color(0xFF00D9FF),
            backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
            child: photoUrl == null
                ? Text(
                    nome.isNotEmpty ? nome[0].toUpperCase() : 'U',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItens() {
    final strings = LocaleUiStrings.of(context);
    final itens = [
      {
        'icon': Icons.person_outline,
        'label': strings.text(
          'Editar Perfil',
          en: 'Edit Profile',
          es: 'Editar perfil',
        ),
        'action': 'edit_profile',
        'rota': '/perfil',
      },
      {
        'icon': Icons.settings_outlined,
        'label': strings.settingsTitle,
        'action': 'settings',
        'rota': '/config',
      },
      {
        'icon': Icons.notifications_outlined,
        'label': strings.text(
          'Notificações',
          en: 'Notifications',
          es: 'Notificaciones',
        ),
        'action': 'notifications',
        'rota': '/notif',
      },
      {
        'icon': Icons.workspace_premium_outlined,
        'label': strings.text(
          'Assinatura',
          en: 'Subscription',
          es: 'Suscripción',
        ),
        'action': 'subscription',
        'rota': '/assinatura',
      },
      {
        'icon': Icons.help_outline,
        'label': strings.text('Ajuda', en: 'Help', es: 'Ayuda'),
        'action': 'help',
        'rota': '/ajuda',
      },
      {
        'icon': Icons.logout,
        'label': strings.text('Sair', en: 'Sign out', es: 'Salir'),
        'action': 'sign_out',
        'rota': '/sair',
      },
    ];

    return Column(children: itens.map((item) => _buildMenuItem(item)).toList());
  }

  Widget _buildMenuItem(Map<String, dynamic> item) {
    final icon = item['icon'] as IconData;
    final label = item['label'] as String;
    final action = item['action'] as String;

    return GestureDetector(
      onTap: () => _onMenuItemTap(action),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white38),
          ],
        ),
      ),
    );
  }

  Future<void> _onMenuItemTap(String action) async {
    switch (action) {
      case 'edit_profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const QuestionarioPage()),
        );
        break;
      case 'settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SettingsPage()),
        );
        break;
      case 'notifications':
        _showNotificationSettings();
        break;
      case 'subscription':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CustomerCenterScreen()),
        );
        break;
      case 'sign_out':
        await _fazerLogout();
        break;
      case 'help':
        _showAjuda();
        break;
    }
  }

  void _showNotificationSettings() {
    final strings = LocaleUiStrings.of(context);
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
            Text(
              strings.text(
                'Notificações',
                en: 'Notifications',
                es: 'Notificaciones',
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.receipt_long, color: Color(0xFF00D9FF)),
              title: Text(
                strings.text(
                  'Leitura de Transações',
                  en: 'Transaction Reading',
                  es: 'Lectura de transacciones',
                ),
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                strings.text(
                  'Monitorar gastos via notifications',
                  en: 'Monitor expenses via notifications',
                  es: 'Monitorear gastos por notificaciones',
                ),
                style: TextStyle(color: Colors.white54),
              ),
              trailing: Switch(
                value: true,
                activeTrackColor: const Color(0xFF00D9FF),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _showAjuda() async {
    final strings = LocaleUiStrings.of(context);
    final info = await PackageInfo.fromPlatform();
    if (!mounted) return;
    final versionLine =
        'Mentor Financeiro v${info.version}+${info.buildNumber}';
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
            Text(
              strings.text('Ajuda', en: 'Help', es: 'Ayuda'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(versionLine, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            Text(
              strings.text(
                'Precisa de ajuda? Entre em contato pelo email: suporte@mentorfinanceiro.com',
                en: 'Need help? Contact us by email: support@mentorfinanceiro.com',
                es: '¿Necesitas ayuda? Contáctanos por email: soporte@mentorfinanceiro.com',
              ),
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fazerLogout() async {
    final strings = LocaleUiStrings.of(context);
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(
          strings.text('Sair', en: 'Sign out', es: 'Salir'),
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(
          strings.text(
            'Tem certeza que deseja sair?',
            en: 'Are you sure you want to sign out?',
            es: '¿Seguro que quieres salir?',
          ),
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              strings.text('Cancelar', en: 'Cancel', es: 'Cancelar'),
              style: TextStyle(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              strings.text('Sair', en: 'Sign out', es: 'Salir'),
              style: TextStyle(color: Color(0xFFFC5C65)),
            ),
          ),
        ],
      ),
    );

    if (confirmar == true && mounted) {
      try {
        await FirebaseService.logout();
        if (mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const TelaLogin()),
            (route) => false,
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                strings.text(
                  'Não foi possível sair agora. Tente novamente.',
                  en: 'Could not sign out right now. Try again.',
                  es: 'No se pudo salir ahora. Inténtalo de nuevo.',
                ),
              ),
            ),
          );
        }
      }
    }
  }
}

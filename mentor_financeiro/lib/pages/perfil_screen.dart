import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/classic_mode_style.dart';
import '../theme/mentor_adaptive_visuals.dart';
import '../services/firebase_service.dart';
import '../services/revenue_cat_bootstrap.dart';
import 'tela_login.dart';
import 'questionario_page.dart';
import 'settings_page.dart';

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
    if (user != null) {
      final dados = await FirebaseService.buscarDadosUsuario(user.uid);
      if (mounted) {
        setState(() {
          _dadosUsuario = dados;
          _carregando = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _carregando = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: _carregando
              ? Center(
                  child: CircularProgressIndicator(color: scheme.primary),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Perfil',
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
    final nome = _dadosUsuario?['nome'] ?? user?.displayName ?? 'Usuário';
    final email = _dadosUsuario?['email'] ?? user?.email ?? '';
    final photoUrl = _dadosUsuario?['photoURL'] as String? ?? user?.photoURL;

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
    final itens = [
      {
        'icon': Icons.person_outline,
        'label': 'Editar Perfil',
        'rota': '/perfil',
      },
      {
        'icon': Icons.settings_outlined,
        'label': 'Configurações',
        'rota': '/config',
      },
      {
        'icon': Icons.notifications_outlined,
        'label': 'Notificações',
        'rota': '/notif',
      },
      {'icon': Icons.help_outline, 'label': 'Ajuda', 'rota': '/ajuda'},
      {'icon': Icons.logout, 'label': 'Sair', 'rota': '/sair'},
    ];

    return Column(children: itens.map((item) => _buildMenuItem(item)).toList());
  }

  Widget _buildMenuItem(Map<String, dynamic> item) {
    final icon = item['icon'] as IconData;
    final label = item['label'] as String;

    return GestureDetector(
      onTap: () => _onMenuItemTap(label),
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

  Future<void> _onMenuItemTap(String label) async {
    switch (label) {
      case 'Editar Perfil':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const QuestionarioPage()),
        );
        break;
      case 'Configurações':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SettingsPage()),
        );
        break;
      case 'Notificações':
        _showNotificationSettings();
        break;
      case 'Sair':
        await _fazerLogout();
        break;
      case 'Ajuda':
        _showAjuda();
        break;
    }
  }

  void _showNotificationSettings() {
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
              'Notificações',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.receipt_long, color: Color(0xFF00D9FF)),
              title: const Text(
                'Leitura de Transações',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Monitorar gastos via notifications',
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

  void _showAjuda() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ajuda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Mentor Financeiro v1.0.0',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 8),
            Text(
              'Precisa de pomoc? Entre em contato pelo email: soport@mentorfinanceiro.com',
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fazerLogout() async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text('Sair', style: TextStyle(color: Colors.white)),
        content: const Text(
          'Tem certeza que deseja sair?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Sair',
              style: TextStyle(color: Color(0xFFFC5C65)),
            ),
          ),
        ],
      ),
    );

    if (confirmar == true && mounted) {
      try {
        await FirebaseService.logout();
        await RevenueCatBootstrap.logOutIfConfigured();
        if (mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const TelaLogin()),
            (route) => false,
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Erro ao sair: $e')));
        }
      }
    }
  }
}

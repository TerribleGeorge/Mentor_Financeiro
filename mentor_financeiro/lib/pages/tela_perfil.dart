import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/firebase_service.dart';
import 'tela_configuracao.dart';
import 'tela_login.dart';
import 'tela_upgrade.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  String _nomeUsuario = "";
  String _emailUsuario = "";
  String _photoURL = "";
  bool _planoPro = false;
  String _perfilInvestidor = "";

  static const String _emailAdmin = "george.guimares@gmail.com";
  static const List<String> _perfis = ["Conservador", "Moderado", "Arrojado"];

  bool get _isAdmin => _emailUsuario.toLowerCase() == _emailAdmin.toLowerCase();

  String get _statusPlano {
    if (_isAdmin) return "Desenvolvedor Mestre";
    if (_planoPro) return "Plano Pro";
    return "Plano Free";
  }

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nomeUsuario = prefs.getString('nome_usuario') ?? "Usuário";
      _emailUsuario = prefs.getString('email_usuario') ?? "";
      _photoURL = prefs.getString('photo_url') ?? "";
      _planoPro = prefs.getBool('plano_pro') ?? false;
      _perfilInvestidor = prefs.getString('perfil_investidor') ?? "";
    });
  }

  Future<void> _salvarPerfilInvestidor(String perfil) async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    await prefs.setString('perfil_investidor', perfil.toLowerCase());
    await FirebaseService.inscricaoTopico(perfil.toLowerCase());
    if (uid != null) {
      await FirebaseService.salvarPerfilInvestidor(uid, perfil);
    }
    setState(() {
      _perfilInvestidor = perfil.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          "MEU PERFIL",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white54),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TelaConfiguracao()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _avatarPerfil(),
            const SizedBox(height: 20),
            Text(
              _nomeUsuario,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            _planoBadge(),
            const SizedBox(height: 30),
            _cartaoPlano(),
            const SizedBox(height: 20),
            _listaOpcoes(),
          ],
        ),
      ),
    );
  }

  Widget _avatarPerfil() {
    if (_photoURL.isNotEmpty) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(_photoURL),
        ),
      );
    }
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF00D9FF), Color(0xFF3B82F6)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: const Icon(Icons.person, size: 50, color: Colors.white),
    );
  }

  Widget _planoBadge() {
    final isEspecial = _isAdmin || _planoPro;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: isEspecial
            ? Colors.amber.withValues(alpha: 0.2)
            : Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isEspecial ? Colors.amber : Colors.white24),
      ),
      child: Text(
        _statusPlano,
        style: TextStyle(
          color: isEspecial ? Colors.amber : Colors.white54,
          fontSize: 12,
          fontWeight: isEspecial ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _cartaoPlano() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF00D9FF).withValues(alpha: 0.1),
            const Color(0xFF3B82F6).withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.workspace_premium, color: Color(0xFF00D9FF)),
              SizedBox(width: 10),
              Text(
                "Deseja fazer upgrade?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _isAdmin
                ? "Obrigado por fazer parte!"
                : _planoPro
                ? "Obrigado por ser Pro!"
                : "O Mentor Financeiro está pronto para guiar sua jornada!",
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _mostrarPlanos(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D9FF),
                foregroundColor: const Color(0xFF0F172A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "CONHECER PLANOS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listaOpcoes() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _opcao(Icons.help_outline, "Ajuda e Suporte", () => _abrirAjuda()),
          _opcao(
            Icons.privacy_tip_outlined,
            "Política de Privacidade",
            () => _mostrarPrivacidade(),
          ),
          _opcao(Icons.info_outline, "Sobre o App", () => _mostrarSobre()),
          _opcao(
            Icons.trending_up,
            "Perfil de Investidor",
            () => _escolherPerfil(),
          ),
          _opcao(Icons.delete_outline, "Sair da Conta", () => _sair()),
        ],
      ),
    );
  }

  Widget _opcao(IconData icone, String texto, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icone, color: Colors.white54),
      title: Text(texto, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white24),
      onTap: onTap,
    );
  }

  void _mostrarPlanos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TelaUpgrade()),
    );
  }

  void _escolherPerfil() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Perfil de Investidor",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Escolha seu perfil para receber notifications personalizadas.",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            ...List.generate(_perfis.length, (index) {
              final perfil = _perfis[index];
              final isSelected =
                  _perfilInvestidor.toLowerCase() == perfil.toLowerCase();
              return ListTile(
                leading: Icon(
                  index == 0
                      ? Icons.shield
                      : index == 1
                      ? Icons.balance
                      : Icons.show_chart,
                  color: isSelected ? const Color(0xFF00D9FF) : Colors.white54,
                ),
                title: Text(
                  perfil,
                  style: TextStyle(
                    color: isSelected ? const Color(0xFF00D9FF) : Colors.white,
                  ),
                ),
                trailing: isSelected
                    ? const Icon(Icons.check, color: Color(0xFF00D9FF))
                    : null,
                onTap: () {
                  _salvarPerfilInvestidor(perfil);
                  Navigator.pop(ctx);
                },
              );
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _abrirAjuda() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        expand: false,
        builder: (_, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "❓ AJUDA E SUPORTE",
                style: TextStyle(
                  color: Color(0xFF00D9FF),
                  fontSize: 14,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              _pergunta(
                "Como configuro minha renda?",
                "Va em Perfil > Configurações e preencha sua renda fixa e extra.",
              ),
              _pergunta(
                "Como funciona o limite diário?",
                "É calculado: (Renda - Gastos Fixos) / Dias restantes do mês.",
              ),
              _pergunta(
                "Como explorar conhecimento?",
                "Acesse a aba Conhecimento no menu inferior para estudar.",
              ),
              _pergunta(
                "Como registrar um gasto?",
                "Na tela inicial, toque no botão SAÍDA e insira o valor.",
              ),
              _pergunta(
                "Como atualizar o app?",
                "O app verifica atualizações automaticamente ao iniciar.",
              ),
              const SizedBox(height: 20),
              const Text(
                "📧 Precisa de mais ajuda?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _enviarEmail(),
                  icon: const Icon(Icons.email),
                  label: const Text("ENVIAR EMAIL"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: const Color(0xFF0F172A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pergunta(String pergunta, String resposta) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pergunta,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              resposta,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _enviarEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'suporte@mentorfinanceiro.app',
      query: 'subject=Ajuda com o App',
    );
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  void _mostrarPrivacidade() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Row(
          children: [
            Icon(Icons.privacy_tip, color: Color(0xFF00D9FF)),
            SizedBox(width: 10),
            Text("Privacidade", style: TextStyle(color: Colors.white)),
          ],
        ),
        content: const SingleChildScrollView(
          child: Text("""
🛡️ POLÍTICA DE PRIVACIDADE

1. SEUS DADOS
Seus dados financeiros são armazenados apenas no seu dispositivo. Ninguém tem acesso às suas informações.

2. IA KARINE
As conversas com a Karine são processadas pela API do OpenRouter. Não armazenamos suas conversas em servidores externos.

3. SEGURANÇA
Utilizamos armazenamento seguro (SharedPreferences) para proteger suas configurações.

4. COMPARTILHAMENTO
Não compartilhamos seus dados com terceiros.

5. ATUALIZAÇÕES
O app pode verificar atualizações automaticamente.

6. CONTATO
Para dúvidas sobre privacidade: privacidade@mentorfinanceiro.app
            """, style: TextStyle(color: Colors.white70, fontSize: 13)),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D9FF),
            ),
            child: const Text(
              "FECHAR",
              style: TextStyle(color: Color(0xFF0F172A)),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarSobre() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Row(
          children: [
            Icon(Icons.info, color: Color(0xFF00D9FF)),
            SizedBox(width: 10),
            Text("Sobre", style: TextStyle(color: Colors.white)),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📱 Mentor Financeiro",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text("Versão: 1.0.0", style: TextStyle(color: Colors.white70)),
            SizedBox(height: 20),
            Text(
              "💡 O melhor app de organização financeira do Brasil!",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 15),
            Text(
              "🎯 Missão:",
              style: TextStyle(
                color: Color(0xFF00D9FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Ajudar brasileiros a alcançar liberdade financeira.",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 15),
            Text(
              "void main() => DevVoid();",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
            SizedBox(height: 4),
            Text(
              "💻 Desenvolvido por DevVoid",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D9FF),
            ),
            child: const Text(
              "FECHAR",
              style: TextStyle(color: Color(0xFF0F172A)),
            ),
          ),
        ],
      ),
    );
  }

  void _sair() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text(
          "Sair da Conta?",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "Seus dados ficarão salvos no dispositivo.",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("CANCELAR"),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseService.logout();
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              if (mounted && ctx.mounted) {
                Navigator.of(ctx).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const TelaLogin()),
                  (route) => false,
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("SAIR"),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/firebase_service.dart';
import '../core/config/app_secrets.dart';

class TelaMeuPerfil extends StatefulWidget {
  const TelaMeuPerfil({super.key});

  @override
  State<TelaMeuPerfil> createState() => _TelaMeuPerfilState();
}

class _TelaMeuPerfilState extends State<TelaMeuPerfil> {
  String _nomeUsuario = "";
  String _photoURL = "";
  String _profissao = "";
  String _perfilInvestidor = "";
  String _objetivos = "";
  String _tratamento = "neutro";
  bool _planoPro = false;
  bool _carregando = true;

  bool get _isAdmin {
    final email =
        FirebaseAuth.instance.currentUser?.email?.trim().toLowerCase() ?? '';
    if (email.isEmpty) return false;
    return AppSecrets.adminEmails.contains(email);
  }

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
    final user = FirebaseAuth.instance.currentUser;
    final uid = prefs.getString('uid') ?? user?.uid;

    _nomeUsuario =
        prefs.getString('nome_usuario') ?? user?.displayName ?? 'Usuário';
    _photoURL = user?.photoURL ?? '';
    _profissao = prefs.getString('profissao') ?? '';
    _perfilInvestidor = prefs.getString('perfil_investidor') ?? '';
    _objetivos = prefs.getString('objetivos') ?? '';
    _tratamento = prefs.getString('tratamento_usuario') ?? 'neutro';

    if (uid != null) {
      final dados = await FirebaseService.buscarDadosUsuario(
        uid,
      ).timeout(const Duration(seconds: 3), onTimeout: () => null);
      if (dados != null) {
        _nomeUsuario = dados['nome'] ?? _nomeUsuario;
        _photoURL = dados['photoURL'] ?? _photoURL;
        _profissao = dados['profissao'] ?? _profissao;
        _perfilInvestidor = dados['perfilInvestidor'] ?? _perfilInvestidor;
        _objetivos = dados['objetivos'] ?? _objetivos;
        _tratamento = dados['tratamento'] ?? _tratamento;
        _planoPro = dados['isPremium'] ?? false;
      }
    }

    if (!mounted) return;
    setState(() {
      _carregando = false;
    });
  }

  Future<void> _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    final uid =
        prefs.getString('uid') ?? FirebaseAuth.instance.currentUser?.uid;

    await prefs.setString('profissao', _profissao.trim());
    await prefs.setString('tratamento_usuario', _tratamento);
    await prefs.setString('perfil_investidor', _perfilInvestidor.toLowerCase());
    await prefs.setString('objetivos', _objetivos.trim());
    await prefs.setBool('perfil_completo', true);

    if (uid != null) {
      await prefs.setString('uid', uid);
      unawaited(
        FirebaseService.salvarPerfilCompleto(
          uid: uid,
          profissao: _profissao.trim(),
          perfilInvestidor: _perfilInvestidor,
          objetivos: _objetivos.trim(),
          tratamento: _tratamento,
        ).catchError((Object e, StackTrace st) {
          debugPrint('TelaMeuPerfil sync: $e\n$st');
        }),
      );
    }

    if (mounted) {
      Navigator.pop(context);
      _carregarDados();
    }
  }

  void _editarPerfil() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: SingleChildScrollView(
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
                "Editar Perfil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (v) => _profissao = v,
                controller: TextEditingController(text: _profissao),
                style: const TextStyle(color: Colors.white),
                decoration: _inputDecoration(
                  "Profissão",
                  "Ex: Desenvolvedor, Professor...",
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _tratamento.isEmpty ? 'neutro' : _tratamento,
                dropdownColor: const Color(0xFF1E293B),
                style: const TextStyle(color: Colors.white),
                decoration: _inputDecoration("Tratamento na mentoria", ""),
                items: const [
                  DropdownMenuItem(value: "neutro", child: Text("Neutro")),
                  DropdownMenuItem(value: "feminino", child: Text("Feminino")),
                  DropdownMenuItem(
                    value: "masculino",
                    child: Text("Masculino"),
                  ),
                ],
                onChanged: (v) => setState(() => _tratamento = v ?? "neutro"),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                // ignore: deprecated_member_use
                value: _perfilInvestidor.isEmpty ? null : _perfilInvestidor,
                dropdownColor: const Color(0xFF1E293B),
                style: const TextStyle(color: Colors.white),
                decoration: _inputDecoration("Perfil de Investidor", ""),
                items: const [
                  DropdownMenuItem(
                    value: "conservador",
                    child: Text("Conservador"),
                  ),
                  DropdownMenuItem(value: "moderado", child: Text("Moderado")),
                  DropdownMenuItem(value: "arrojado", child: Text("Arrojado")),
                ],
                onChanged: (v) => setState(() => _perfilInvestidor = v ?? ""),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (v) => _objetivos = v,
                controller: TextEditingController(text: _objetivos),
                style: const TextStyle(color: Colors.white),
                maxLines: 2,
                decoration: _inputDecoration(
                  "Objetivos",
                  "O que você quer alcançar?",
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _salvarDados,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: const Color(0xFF0F172A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Salvar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: TextStyle(color: Colors.white24),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white24),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF00D9FF)),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          "Meu Perfil",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _carregando
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _avatar(),
                  const SizedBox(height: 16),
                  Text(
                    _nomeUsuario,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _statusBadge(),
                  const SizedBox(height: 30),
                  _dadosPerfil(),
                  const SizedBox(height: 20),
                  _botaoEditar(),
                ],
              ),
            ),
    );
  }

  Widget _avatar() {
    if (_photoURL.isNotEmpty) {
      return CircleAvatar(radius: 50, backgroundImage: NetworkImage(_photoURL));
    }
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF00D9FF), Color(0xFF3B82F6)],
        ),
      ),
      child: const Icon(Icons.person, size: 50, color: Colors.white),
    );
  }

  Widget _statusBadge() {
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

  Widget _dadosPerfil() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Seus Dados",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _itemDado(
            Icons.work,
            "Profissão",
            _profissao.isEmpty ? "Não informado" : _profissao,
          ),
          const Divider(color: Colors.white12),
          _itemDado(
            Icons.badge_outlined,
            "Tratamento na mentoria",
            _tratamentoLabel,
          ),
          const Divider(color: Colors.white12),
          _itemDado(
            Icons.trending_up,
            "Perfil de Investidor",
            _perfilInvestidor.isEmpty ? "Não definido" : _perfilInvestidor,
          ),
          const Divider(color: Colors.white12),
          _itemDado(
            Icons.flag,
            "Objetivos",
            _objetivos.isEmpty ? "Não informado" : _objetivos,
          ),
        ],
      ),
    );
  }

  String get _tratamentoLabel {
    switch (_tratamento) {
      case 'feminino':
        return 'Feminino';
      case 'masculino':
        return 'Masculino';
      default:
        return 'Neutro';
    }
  }

  Widget _itemDado(IconData icone, String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icone, color: const Color(0xFF00D9FF), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                Text(
                  valor,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoEditar() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _editarPerfil,
        icon: const Icon(Icons.edit),
        label: const Text("Editar Perfil"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00D9FF),
          foregroundColor: const Color(0xFF0F172A),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

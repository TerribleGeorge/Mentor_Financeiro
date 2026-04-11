import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/karine_service.dart';

class TelaChat extends StatefulWidget {
  const TelaChat({super.key});

  @override
  State<TelaChat> createState() => _TelaChatState();
}

class _TelaChatState extends State<TelaChat> {
  late KarineService _karineService;
  final TextEditingController _mensagemController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<_Mensagem> _mensagens = [];
  bool _carregando = false;
  String _nomeUsuario = '';

  @override
  void initState() {
    super.initState();
    _iniciarKarine();
  }

  Future<void> _iniciarKarine() async {
    final prefs = await SharedPreferences.getInstance();
    _nomeUsuario = prefs.getString('nome_usuario') ?? '';
    _karineService = KarineService();
    _karineService.configurar(_nomeUsuario);
    _adicionarMensagem(
      _nomeUsuario.isEmpty
          ? "Olá! Sou a Karine, sua mentora financeira! 💕\n\nComo posso te ajudar hoje?"
          : "Olá, $_nomeUsuario! Sou a Karine, sua mentora financeira! 💕\n\nComo posso te ajudar hoje?",
    );
  }

  void _adicionarMensagem(String texto) {
    setState(() {
      _mensagens.add(_Mensagem(texto: texto, ehUsuario: false));
    });
    _rolarParaFim();
  }

  void _rolarParaFim() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _enviarMensagem() async {
    final texto = _mensagemController.text.trim();
    if (texto.isEmpty) return;

    _mensagemController.clear();
    setState(() {
      _mensagens.add(_Mensagem(texto: texto, ehUsuario: true));
      _carregando = true;
    });
    _rolarParaFim();

    final resposta = await _karineService.enviarMensagem(texto);

    setState(() {
      _carregando = false;
      _mensagens.add(_Mensagem(texto: resposta, ehUsuario: false));
    });
    _rolarParaFim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.person, color: Color(0xFF00D9FF)),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Karine",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Online",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white54),
            onPressed: () {
              _karineService.limparHistorico();
              setState(() {
                _mensagens.clear();
                _adicionarMensagem(
                  "Conversa reiniciada! Como posso te ajudar? 😊",
                );
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _mensagens.length + (_carregando ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _mensagens.length && _carregando) {
                  return _mensagemKarine("...");
                }
                if (index >= _mensagens.length) return const SizedBox();
                final msg = _mensagens[index];
                return msg.ehUsuario
                    ? _mensagemUsuario(msg.texto)
                    : _mensagemKarine(msg.texto);
              },
            ),
          ),
          _campoEnvio(),
        ],
      ),
    );
  }

  Widget _mensagemUsuario(String texto) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(
            20,
          ).copyWith(bottomRight: const Radius.circular(4)),
        ),
        child: Text(texto, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _mensagemKarine(String texto) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(
            20,
          ).copyWith(bottomLeft: const Radius.circular(4)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xFF00D9FF),
                size: 16,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(texto, style: const TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campoEnvio() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _mensagemController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Digite sua mensagem...",
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF0F172A),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onSubmitted: (_) => _enviarMensagem(),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF00D9FF),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Color(0xFF0F172A)),
              onPressed: _enviarMensagem,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mensagemController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

class _Mensagem {
  final String texto;
  final bool ehUsuario;
  _Mensagem({required this.texto, required this.ehUsuario});
}

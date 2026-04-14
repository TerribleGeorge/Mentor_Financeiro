import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _mostrarSugestoes = true;

  final List<String> _sugestoes = [
    "O que é investimento?",
    "Como começar a investir?",
    "Qual o melhor investimento para iniciantes?",
    "O que é renda fixa?",
    "O que é renda variável?",
    "Como definir minhas metas financeiras?",
  ];

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
          ? "Olá! Sou a Karine, sua mentora financeira!\n\nComo posso te ajudar hoje?"
          : "Olá, $_nomeUsuario! Sou a Karine, sua mentora financeira!\n\nComo posso te ajudar hoje?",
      false,
    );
  }

  void _adicionarMensagem(String texto, bool ehUsuario) {
    setState(() {
      _mensagens.add(
        _Mensagem(
          texto: texto,
          ehUsuario: ehUsuario,
          timestamp: DateTime.now(),
        ),
      );
      if (ehUsuario) {
        _mostrarSugestoes = false;
      }
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
      _mensagens.add(
        _Mensagem(texto: texto, ehUsuario: true, timestamp: DateTime.now()),
      );
      _carregando = true;
      _mostrarSugestoes = false;
    });
    _rolarParaFim();

    final resposta = await _karineService.enviarMensagem(texto);

    setState(() {
      _carregando = false;
      _mensagens.add(
        _Mensagem(texto: resposta, ehUsuario: false, timestamp: DateTime.now()),
      );
    });
    _rolarParaFim();
  }

  void _enviarSugestao(String texto) {
    _mensagemController.text = texto;
    _enviarMensagem();
  }

  void _copiarMensagem(String texto) {
    Clipboard.setData(ClipboardData(text: texto));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Mensagem copiada!"),
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xFF00D9FF),
      ),
    );
  }

  String _formatarTimestamp(DateTime timestamp) {
    final hora = timestamp.hour.toString().padLeft(2, '0');
    final minuto = timestamp.minute.toString().padLeft(2, '0');
    return "$hora:$minuto";
  }

  String _formatarMensagem(String texto) {
    String formatted = texto;
    formatted = formatted.replaceAll(RegExp(r'\*\*([^*]+)\*\*'), r'💡 $1');
    formatted = formatted.replaceAll(RegExp(r'\*([^*]+)\*'), r'• $1');
    return formatted;
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
                _mostrarSugestoes = true;
                _adicionarMensagem(
                  "Conversa reiniciada! Como posso te ajudar? 😊",
                  false,
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
                  return _indicadorDigitando();
                }
                if (index >= _mensagens.length) return const SizedBox();
                final msg = _mensagens[index];
                return msg.ehUsuario
                    ? _mensagemUsuario(msg.texto, msg.timestamp)
                    : _mensagemKarine(msg.texto, msg.timestamp);
              },
            ),
          ),
          if (_mostrarSugestoes && _mensagens.isNotEmpty) _sugestoesWidget(),
          _campoEnvio(),
        ],
      ),
    );
  }

  Widget _indicadorDigitando() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
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
            Row(
              children: [
                _pontoAnimado(0),
                const SizedBox(width: 4),
                _pontoAnimado(1),
                const SizedBox(width: 4),
                _pontoAnimado(2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pontoAnimado(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF00D9FF),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  Widget _sugestoesWidget() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _sugestoes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ActionChip(
              label: Text(
                _sugestoes[index],
                style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 12),
              ),
              backgroundColor: const Color(0xFF1E293B),
              side: const BorderSide(color: Color(0xFF00D9FF)),
              onPressed: () => _enviarSugestao(_sugestoes[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _mensagemUsuario(String texto, DateTime timestamp) {
    return GestureDetector(
      onLongPress: () => _copiarMensagem(texto),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(
                  20,
                ).copyWith(bottomRight: const Radius.circular(4)),
              ),
              child: Text(texto, style: const TextStyle(color: Colors.white)),
            ),
            Text(
              _formatarTimestamp(timestamp),
              style: const TextStyle(color: Colors.white38, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mensagemKarine(String texto, DateTime timestamp) {
    return GestureDetector(
      onLongPress: () => _copiarMensagem(texto),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
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
                    child: Text(
                      _formatarMensagem(texto),
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              _formatarTimestamp(timestamp),
              style: const TextStyle(color: Colors.white38, fontSize: 10),
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
  final DateTime timestamp;
  _Mensagem({
    required this.texto,
    required this.ehUsuario,
    required this.timestamp,
  });
}

import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KarineService {
  static const String _apiKey = 'AIzaSyBY0xYOxFk6VgqZVcsj79n9kK0ca-L0Vlo';

  GenerativeModel? _model;
  ChatSession? _chat;
  String _nomeUsuario = '';
  bool _modoOffline = false;

  KarineService() {
    _iniciarKarine();
  }

  void _iniciarKarine() {
    _model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: _apiKey);
    _chat = _model?.startChat(
      history: [
        Content.text('''
Você é a Karine, mentora do George.
George tem 32 anos, mora em Uberlândia-MG e tem diabetes tipo 1.
O limite diário dele é apertado por causa das despesas fixas (mínimo R\$ 50,00 por dia).
Seja humana, direta e firme.
Ajude ele a controlar o dinheiro para garantir a segurança financeira e a saúde dele.
Nunca diga que é uma IA.
Responda em português brasileiro, de forma curta e prática.
'''),
      ],
    );
  }

  Future<void> setNomeUsuario(String nome) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome_usuario', nome);
    _nomeUsuario = nome;
  }

  Future<String> enviarMensagem(
    String mensagem, {
    double? limiteDiario,
    double? gastosHoje,
    double? ganhosHoje,
  }) async {
    if (_chat == null) {
      _iniciarKarine();
    }

    String dadosFinancas = '';
    if (limiteDiario != null || gastosHoje != null || ganhosHoje != null) {
      dadosFinancas =
          '''
Situação financeira atual:
- Limite Diário: R\$ ${limiteDiario?.toStringAsFixed(2) ?? 'N/A'}
- Gastos Hoje: R\$ ${gastosHoje?.toStringAsFixed(2) ?? '0'}
- Ganhos Hoje: R\$ ${ganhosHoje?.toStringAsFixed(2) ?? '0'}
''';
    }

    String promptCompleto = dadosFinancas.isNotEmpty
        ? '$mensagem\n\n$dadosFinancas'
        : mensagem;

    try {
      final resposta = await _chat!.sendMessage(Content.text(promptCompleto));

      if (resposta.text != null && resposta.text!.isNotEmpty) {
        _modoOffline = false;
        return resposta.text!;
      } else {
        return 'George, não consegui resposta. Tente novamente.';
      }
    } on SocketException {
      _modoOffline = true;
      return 'George, estou sem sinal agora.';
    } on IOException {
      _modoOffline = true;
      return 'George, estou sem sinal agora.';
    } catch (e) {
      _modoOffline = true;
      return 'George, estou sem sinal agora.';
    }
  }

  void limparConversa() {
    _iniciarKarine();
  }

  void limparHistorico() {
    limparConversa();
  }

  String get nomeUsuario => _nomeUsuario;
  bool get modoOffline => _modoOffline;
}

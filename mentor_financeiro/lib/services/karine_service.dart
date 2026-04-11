import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'api_config.dart';

class KarineService {
  String _getApiKey() => ApiConfig.geminiApiKey;

  GenerativeModel? _model;
  ChatSession? _chat;
  bool _inicializado = false;
  String _nomeUsuario = '';

  KarineService() {
    debugPrint('[KARINE] Instanciado');
  }

  void configurar(String nomeUsuario) {
    if (_nomeUsuario != nomeUsuario) {
      _nomeUsuario = nomeUsuario;
      _inicializado = false;
      _chat = null;
    }
  }

  Future<String> enviarMensagem(
    String mensagem, {
    double? limiteDiario,
    double? gastosHoje,
    double? ganhosHoje,
  }) async {
    if (!_inicializado || _chat == null) {
      try {
        final key = _getApiKey();
        if (key.isEmpty) {
          return 'Karine offline: chave API não encontrada';
        }

        _model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: key);

        final saudacao = _nomeUsuario.isEmpty
            ? 'Bem-vindo(a)!'
            : 'Bem-vindo(a), $_nomeUsuario!';

        _chat = _model!.startChat(
          history: [
            Content.text(
              '''Você é a Karine, assistente financeira do app Mentor Financeiro.
$saudacao
Responda SEMPRE em português brasileiro (pt-BR).
Use linguagem friendly e casual.
Seja helpful e prática nas dicas.
Quando der números, use formato brasileiro (R\$ 1.000,00).
Foque em ajudar com finanças pessoais.''',
            ),
          ],
        );
        _inicializado = true;
        debugPrint('[KARINE] Iniciado com gemini-1.5-flash');
      } catch (e) {
        return 'Erro ao carregar Karine: $e';
      }
    }

    try {
      String contexto = '';
      if (limiteDiario != null || gastosHoje != null || ganhosHoje != null) {
        contexto =
            '''
Situação financeira de HOJE:
- Limite disponível: R\$ ${limiteDiario?.toStringAsFixed(2) ?? '0'}
- Gastos: R\$ ${gastosHoje?.toStringAsFixed(2) ?? '0'}
- Recebido: R\$ ${ganhosHoje?.toStringAsFixed(2) ?? '0'}
''';
      }

      final prompt = Content.text('$mensagem$contexto');
      final response = await _chat!.sendMessage(prompt);
      return response.text ?? "Sem resposta.";
    } catch (e) {
      return "Erro: ${e.toString()}";
    }
  }

  void limparHistorico() {
    if (_model != null) {
      _chat = _model!.startChat();
    }
  }
}

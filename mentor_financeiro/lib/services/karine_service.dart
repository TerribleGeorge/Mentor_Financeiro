import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class KarineService {
  static const String _apiKey = 'AIzaSyD_tOzL65bYP9z9qFlCgnjI9fBNqvvOYrg';

  late GenerativeModel _model;
  late ChatSession _chat;

  KarineService() {
    _model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: _apiKey);
    _chat = _model.startChat(
      history: [
        Content.text(
          '''Você é a Karine, assistente financeira do app Mentor Financeiro.
Responda SEMPRE em português brasileiro (pt-BR).
Use linguagem friendly e casual.
Seja helpful e prática nas dicas.
Quando der números, use formato brasileiro (R\$ 1.000,00).
Foque em ajudar com finanças pessoais.
''',
        ),
      ],
    );
    debugPrint("[KARINE] Modelo iniciado!");
  }

  Future<String> enviarMensagem(
    String mensagem, {
    double? limiteDiario,
    double? gastosHoje,
    double? ganhosHoje,
  }) async {
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
      debugPrint("[KARINE] Enviando...");

      final response = await _chat.sendMessage(prompt);

      if (response.text != null) {
        debugPrint("[KARINE] OK!");
        return response.text!;
      }

      return "Sem resposta.";
    } catch (e) {
      debugPrint("[KARINE] ERRO: $e");
      return "Erro: ${e.toString()}";
    }
  }

  void limparHistorico() {
    _chat = _model.startChat();
  }
}

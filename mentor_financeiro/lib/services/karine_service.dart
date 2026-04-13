import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KarineService {
  List<Map<String, String>> _history = [];
  String _nomeUsuario = '';

  KarineService() {
    debugPrint('[KARINE] Instanciado (Ollama)');
  }

  void configurar(String nomeUsuario) {
    _nomeUsuario = nomeUsuario;
  }

  Future<String> enviarMensagem(String mensagem) async {
    try {
      final prompt = _construirPrompt(mensagem);

      final response = await http.post(
        Uri.parse('http://10.0.2.2:11434/api/generate'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'model': 'llama3',
          'prompt': prompt,
          'stream': false,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final text = data['response'] ?? 'Entendi!';

        _history.add({'role': 'user', 'content': mensagem});
        _history.add({'role': 'assistant', 'content': text});

        debugPrint('[KARINE] OK');
        return text;
      } else {
        debugPrint('[KARINE] ERRO: ${response.statusCode} - ${response.body}');
        return 'Erro: ${response.statusCode}';
      }
    } catch (e) {
      debugPrint('[KARINE] ERRO: $e');
      return 'Erro: $e';
    }
  }

  String _construirPrompt(String mensagem) {
    final nome = _nomeUsuario.isEmpty ? 'amigo' : _nomeUsuario;
    final saudacao = 'Olá, $nome! Sou a Karine, sua assistente financeira.';
    final instruction =
        'IMPORTANTE: Sempre use o nome "$nome" ao cumprimentar. Responda em português brasileiro de forma friendly e útil.';

    if (_history.isEmpty) {
      return '$saudacao $instruction\n\nUsuário: $mensagem\nKarine:';
    }

    final chatHistory = _history
        .map((msg) {
          final role = msg['role'] == 'user' ? 'Usuário' : 'Karine';
          return '$role: ${msg['content']}';
        })
        .join('\n');

    return '$saudacao $instruction\n\n$chatHistory\n\nUsuário: $mensagem\nKarine:';
  }

  void limparHistorico() {
    _history = [];
  }
}

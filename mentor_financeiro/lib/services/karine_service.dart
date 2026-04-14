import 'package:flutter/material.dart';

class KarineService {
  KarineService() {
    debugPrint('[KARINE] Instanciado');
  }

  void configurar(String nomeUsuario) {}

  Future<String> enviarMensagem(String mensagem) async {
    return 'Olá! Estou passando por uma atualização para ficar 24h online. Em breve estarei pronta! 😊';
  }

  void limparHistorico() {}
}

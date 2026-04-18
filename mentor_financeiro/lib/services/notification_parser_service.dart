import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class TransacaoModel {
  final double valor;
  final String descricao;
  final DateTime data;
  final String metodo;

  TransacaoModel({
    required this.valor,
    required this.descricao,
    required this.data,
    required this.metodo,
  });

  Map<String, dynamic> toMap() {
    return {
      'valor': valor,
      'descricao': descricao,
      'data': Timestamp.fromDate(data),
      'metodo': metodo,
    };
  }
}

class TransacaoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> salvarTransacao(TransacaoModel transacao) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    }

    try {
      await _firestore
          .collection('usuarios')
          .doc(user.uid)
          .collection('transacoes')
          .add(transacao.toMap());
      return true;
    } catch (e) {
      debugPrint('Erro ao salvar transação: $e');
      return false;
    }
  }
}

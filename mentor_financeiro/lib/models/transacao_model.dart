import 'package:cloud_firestore/cloud_firestore.dart';

enum TipoPagamento { debito, credito }

class TransacaoModel {
  final double valor;
  final String descricao;
  final DateTime data;
  final String metodo;
  final String? categoria;
  final String? banco;
  final TipoPagamento tipoPagamento;
  final double? limiteDisponivel;

  TransacaoModel({
    required this.valor,
    required this.descricao,
    required this.data,
    required this.metodo,
    this.categoria,
    this.banco,
    this.tipoPagamento = TipoPagamento.debito,
    this.limiteDisponivel,
  });

  factory TransacaoModel.fromMap(Map<String, dynamic> map) {
    TipoPagamento tipo = TipoPagamento.debito;
    if (map['tipoPagamento'] != null) {
      final tipoStr = map['tipoPagamento'] as String;
      tipo = tipoStr == 'credito'
          ? TipoPagamento.credito
          : TipoPagamento.debito;
    }

    return TransacaoModel(
      valor: (map['valor'] as num?)?.toDouble() ?? 0.0,
      descricao: map['descricao'] as String? ?? '',
      data: map['data'] is Timestamp
          ? (map['data'] as Timestamp).toDate()
          : DateTime.now(),
      metodo: map['metodo'] as String? ?? '',
      categoria: map['categoria'] as String?,
      banco: map['banco'] as String?,
      tipoPagamento: tipo,
      limiteDisponivel: (map['limiteDisponivel'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'valor': valor,
      'descricao': descricao,
      'data': Timestamp.fromDate(data),
      'metodo': metodo,
      'categoria': categoria,
      'banco': banco,
      'tipoPagamento': tipoPagamento == TipoPagamento.credito
          ? 'credito'
          : 'debito',
      'limiteDisponivel': limiteDisponivel,
    };
  }

  bool get isCredito => tipoPagamento == TipoPagamento.credito;
  bool get isDebito => tipoPagamento == TipoPagamento.debito;
}

class CategoriaTransacao {
  static const String alimentacao = 'Alimentação';
  static const String transporte = 'Transporte';
  static const String compras = 'Compras';
  static const String utilities = 'Utilidades';
  static const String saude = 'Saúde';
  static const String entretenimento = 'Entretenimento';
  static const String transferencia = 'Transferência';
  static const String outros = 'Outros';

  static String categorize(String descricao) {
    final lower = descricao.toLowerCase();
    if (lower.contains('ifood') ||
        lower.contains('uber eats') ||
        lower.contains('delivery') ||
        lower.contains('restaurant') ||
        lower.contains('lanchonete') ||
        lower.contains('padaria') ||
        lower.contains('supermercado') ||
        lower.contains('market')) {
      return alimentacao;
    }
    if (lower.contains('uber') ||
        lower.contains('99') ||
        lower.contains('taxi') ||
        lower.contains('combustivel') ||
        lower.contains('posto') ||
        lower.contains('estacionamento') ||
        lower.contains('metro') ||
        lower.contains('onibus')) {
      return transporte;
    }
    if (lower.contains('amazon') ||
        lower.contains('shopee') ||
        lower.contains('magalu') ||
        lower.contains('mercadolivre') ||
        lower.contains('loja')) {
      return compras;
    }
    if (lower.contains('luz') ||
        lower.contains('agua') ||
        lower.contains('internet') ||
        lower.contains('telefone') ||
        lower.contains('netflix') ||
        lower.contains('assinatura')) {
      return utilities;
    }
    if (lower.contains('farmacia') ||
        lower.contains('hospital') ||
        lower.contains('medico') ||
        lower.contains('laboratorio') ||
        lower.contains('drogaria')) {
      return saude;
    }
    if (lower.contains('cinema') ||
        lower.contains('show') ||
        lower.contains('jogo') ||
        lower.contains('spotify') ||
        lower.contains('turma')) {
      return entretenimento;
    }
    if (lower.contains('transferencia') ||
        lower.contains('pix') ||
        lower.contains('ted') ||
        lower.contains('doc')) {
      return transferencia;
    }
    return outros;
  }
}

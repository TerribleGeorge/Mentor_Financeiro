import 'package:cloud_firestore/cloud_firestore.dart';

class InvestimentoModel {
  InvestimentoModel({
    required this.tipoId,
    required this.valor,
    required this.moeda,
    required this.data,
    this.notas,
    this.id,
    this.tickerInput,
    this.yahooSymbol,
    this.listedMarket,
  });

  final String? id;
  final String tipoId;
  final double valor;
  final String moeda;
  final DateTime data;
  final String? notas;

  /// Texto original na busca (ex.: AAPL, PETR4).
  final String? tickerInput;

  /// Símbolo Yahoo usado na cotação (ex.: AAPL, PETR4.SA).
  final String? yahooSymbol;

  /// `B3`, `US` ou `UNKNOWN`.
  final String? listedMarket;

  Map<String, dynamic> toFirestore() {
    return {
      'tipoId': tipoId,
      'valor': valor,
      'moeda': moeda,
      'data': Timestamp.fromDate(data),
      if (notas != null && notas!.trim().isNotEmpty) 'notas': notas!.trim(),
      if (tickerInput != null && tickerInput!.trim().isNotEmpty)
        'tickerInput': tickerInput!.trim().toUpperCase(),
      if (yahooSymbol != null && yahooSymbol!.trim().isNotEmpty)
        'yahooSymbol': yahooSymbol!.trim().toUpperCase(),
      if (listedMarket != null && listedMarket!.trim().isNotEmpty)
        'listedMarket': listedMarket!.trim().toUpperCase(),
      'criadoEm': FieldValue.serverTimestamp(),
    };
  }

  static InvestimentoModel fromDoc(String id, Map<String, dynamic> data) {
    final ts = data['data'];
    DateTime dataRef = DateTime.now();
    if (ts is Timestamp) {
      dataRef = ts.toDate();
    }
    return InvestimentoModel(
      id: id,
      tipoId: data['tipoId'] as String? ?? 'outros',
      valor: (data['valor'] as num?)?.toDouble() ?? 0,
      moeda: data['moeda'] as String? ?? 'BRL',
      data: dataRef,
      notas: data['notas'] as String?,
      tickerInput: data['tickerInput'] as String?,
      yahooSymbol: data['yahooSymbol'] as String?,
      listedMarket: data['listedMarket'] as String?,
    );
  }
}

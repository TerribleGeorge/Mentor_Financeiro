import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/transacao_model.dart';

class LocalTransactionStore {
  static const _key = 'local_confirmed_transactions_v1';
  static const _maxItems = 120;

  static String sourceIdFor({
    required String uid,
    required String packageName,
    required String texto,
    required int timestamp,
  }) {
    final normalized = texto.replaceAll(RegExp(r'\s+'), ' ').trim();
    return '$uid|$packageName|$timestamp|${normalized.hashCode}';
  }

  static Future<void> save(
    TransacaoModel transacao, {
    required String sourceId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await _readRaw(prefs);
    final exists = items.any((e) => e['sourceId'] == sourceId);
    if (exists) return;

    items.insert(0, {
      'sourceId': sourceId,
      'valor': transacao.valor,
      'descricao': transacao.descricao,
      'dataMillis': transacao.data.millisecondsSinceEpoch,
      'metodo': transacao.metodo,
      'categoria': transacao.categoria,
      'banco': transacao.banco,
      'tipoPagamento': transacao.tipoPagamento == TipoPagamento.credito
          ? 'credito'
          : 'debito',
      'limiteDisponivel': transacao.limiteDisponivel,
    });

    if (items.length > _maxItems) {
      items.removeRange(_maxItems, items.length);
    }
    await prefs.setString(_key, jsonEncode(items));
  }

  static Future<void> removeBySourceId(String sourceId) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await _readRaw(prefs);
    items.removeWhere((e) => e['sourceId'] == sourceId);
    if (items.isEmpty) {
      await prefs.remove(_key);
    } else {
      await prefs.setString(_key, jsonEncode(items));
    }
  }

  static Future<List<TransacaoModel>> load({
    DateTime? start,
    DateTime? end,
    int? limit,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await _readRaw(prefs);
    final transactions = <TransacaoModel>[];

    for (final item in items) {
      final tx = _fromRaw(item);
      if (tx == null) continue;
      if (start != null && tx.data.isBefore(start)) continue;
      if (end != null && tx.data.isAfter(end)) continue;
      transactions.add(tx);
    }

    transactions.sort((a, b) => b.data.compareTo(a.data));
    if (limit != null && transactions.length > limit) {
      return transactions.take(limit).toList();
    }
    return transactions;
  }

  static List<TransacaoModel> merge(
    List<TransacaoModel> cloud,
    List<TransacaoModel> local, {
    int? limit,
  }) {
    final merged = List<TransacaoModel>.from(cloud);
    for (final localTx in local) {
      final duplicate = merged.any((cloudTx) => _looksSame(cloudTx, localTx));
      if (!duplicate) merged.add(localTx);
    }
    merged.sort((a, b) => b.data.compareTo(a.data));
    if (limit != null && merged.length > limit) {
      return merged.take(limit).toList();
    }
    return merged;
  }

  static Future<List<Map<String, dynamic>>> _readRaw(
    SharedPreferences prefs,
  ) async {
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return <Map<String, dynamic>>[];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return <Map<String, dynamic>>[];
      return decoded
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    } catch (_) {
      return <Map<String, dynamic>>[];
    }
  }

  static TransacaoModel? _fromRaw(Map<String, dynamic> item) {
    final valor = (item['valor'] as num?)?.toDouble();
    final dataMillis = (item['dataMillis'] as num?)?.toInt();
    if (valor == null || dataMillis == null) return null;

    return TransacaoModel(
      valor: valor,
      descricao: item['descricao'] as String? ?? 'Gasto identificado',
      data: DateTime.fromMillisecondsSinceEpoch(dataMillis),
      metodo: item['metodo'] as String? ?? 'Notificação Bancária',
      categoria: item['categoria'] as String?,
      banco: item['banco'] as String?,
      tipoPagamento: item['tipoPagamento'] == 'credito'
          ? TipoPagamento.credito
          : TipoPagamento.debito,
      limiteDisponivel: (item['limiteDisponivel'] as num?)?.toDouble(),
    );
  }

  static bool _looksSame(TransacaoModel a, TransacaoModel b) {
    final sameValue = (a.valor - b.valor).abs() < 0.01;
    final sameDescription =
        a.descricao.trim().toLowerCase() == b.descricao.trim().toLowerCase();
    final sameDay =
        a.data.year == b.data.year &&
        a.data.month == b.data.month &&
        a.data.day == b.data.day;
    return sameValue && sameDescription && sameDay;
  }
}

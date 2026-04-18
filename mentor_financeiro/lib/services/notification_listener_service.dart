import 'dart:async';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/transacao_model.dart';

class CategoriaTransacao {
  static const String alimentacao = 'Alimentação';
  static const String transporte = 'Transporte';
  static const String lazer = 'Lazer';
  static const String saude = 'Saúde';
  static const String fixos = 'Fixos';
  static const String outros = 'Outros';

  static final Map<String, List<String>> _mapeamentoCategorias = {
    alimentacao: [
      'ifood',
      'uber eats',
      'restaurante',
      'burger',
      'pizza',
      'mercado',
      'padaria',
      'confeitaria',
      'zé delivery',
      'delivery',
      'hamburgueria',
      'pizzaria',
      'sushi',
      'lanchonete',
      'churrascaria',
      'bar',
      'supermercado',
      'carrefour',
      'extra',
      'pão de açucar',
      'wendy',
      'mcdonalds',
      'kfc',
      'subway',
      'domino',
      'habibs',
      'grill',
      'comidinhas',
      'goomer',
      'deliveryapp',
      'appfood',
    ],
    transporte: [
      'uber',
      '99',
      '99app',
      'cabify',
      'taxi',
      'estacionamento',
      'pedágio',
      'pedagio',
      'posto',
      'shell',
      'ipiranga',
      'autoposto',
      'br petrobras',
      'petrobras',
      'coskip',
      'ctba',
      ' gasolina',
      'diesel',
      'etanol',
      'combustível',
      'estacionar',
      'garagem',
      'shopping',
    ],
    lazer: [
      'netflix',
      'spotify',
      'steam',
      'disney',
      'hbo',
      'cinema',
      'show',
      'eventim',
      'ingresso',
      'teatro',
      'spect',
      'ticket',
      'game',
      'playstation',
      'xbox',
      'twitch',
      'youtube',
      'amazon prime',
      'globo play',
      'canal',
      'assistir',
      'streaming',
      'musica',
      'apple music',
      'deezer',
      'paramount',
      'telecine',
      'premiere',
    ],
    saude: [
      'droga raia',
      'drogasil',
      'farmácia',
      'farmacia',
      'unimed',
      'hospital',
      'dentista',
      'médico',
      'medico',
      'clínica',
      'clinica',
      'laboratório',
      'laboratorio',
      'raio x',
      'exame',
      'diagnóstico',
      'drogaria',
      'pague menos',
      'paguemenor',
      'aqui fennel',
      'onodera',
      'doutor',
      'consulta',
      'vacina',
      'UBS',
      'postão',
    ],
    fixos: [
      'enel',
      'sabesp',
      'copasa',
      'aluguel',
      'condomínio',
      'condominio',
      'internet',
      'vivo',
      'claro',
      'tim',
      'oi',
      'embratel',
      'net',
      'virtua',
      'speedtest',
      'tarifa',
      'conta de luz',
      'conta de água',
      'conta de luz',
      'conta d\'agua',
      'eletropaulo',
      'celg',
      'cemig',
      'copesp',
      'cosanpa',
      'sanasa',
      'saneamento',
      'ipva',
      'iptu',
      'boleto',
      'carnê',
      'carne',
      'parcelamento',
      'anuidade',
    ],
  };

  static String _limparNomeEstabelecimento(String texto) {
    final lower = texto.toLowerCase();

    final padroesRemocao = [
      r'compra\s+aprovada\s+no\s+',
      r'compra\s+aprovada\s+em\s+',
      r'pagamento\s+de\s+',
      r'pagamento\s+efetuado\s+',
      r'transferência\s+de\s+',
      r'transferencia\s+de\s+',
      r'débito\s+de\s+',
      r'debito\s+de\s+',
      r'compra\s+no\s+',
      r'compra\s+em\s+',
      r'compra\s+no\s+',
      r'pago\s+no\s+',
      r'pago\s+em\s+',
      r'compra\s+efetuada\s+',
      r'\s+\d+$',
    ];

    String limpo = lower;
    for (final padrao in padroesRemocao) {
      limpo = limpo.replaceAll(RegExp(padrao), '');
    }

    limpo = limpo.replaceAll(RegExp(r'[^\w\s]'), '');
    limpo = limpo.trim();
    limpo = limpo.replaceAll(RegExp(r'\s+'), ' ');

    if (limpo.length > 30) {
      limpo = limpo.substring(0, 30);
    }

    return limpo.toUpperCase();
  }

  static String definirCategoria(String texto) {
    final lower = texto.toLowerCase();

    for (final entry in _mapeamentoCategorias.entries) {
      final keywords = entry.value;
      for (final kw in keywords) {
        if (lower.contains(kw.toLowerCase())) {
          return entry.key;
        }
      }
    }

    return outros;
  }

  static String extrairNomeEstabelecimento(String texto) {
    return _limparNomeEstabelecimento(texto);
  }
}

class NotificationParserService {
  static const List<String> _bancosPermitidos = [
    'nubank',
    'caixa',
    'inter',
    'bradesco',
    'itau',
    'santander',
    'bb',
    'banco do brasil',
    'sicredi',
    'sicoob',
    'c6',
    'neon',
    'pagbank',
    'mercadopago',
    'picpay',
  ];

  static List<RegExp> _getRegexPorLocale(String currencyCode) {
    final patterns = <RegExp>[];

    if (currencyCode == 'BRL') {
      patterns.add(
        RegExp(
          r'R\$\s*(\d{1,3}(?:\.\d{3})*(?:,\d{2})?|\d+,\d{2})',
          caseSensitive: false,
        ),
      );
    } else if (currencyCode == 'USD') {
      patterns.add(
        RegExp(
          r'\$\s*(\d{1,3}(?:,\d{3})*(?:\.\d{2})?|\d+\.\d{2})',
          caseSensitive: false,
        ),
      );
    } else if (currencyCode == 'EUR') {
      patterns.add(
        RegExp(
          r'€\s*(\d{1,3}(?:\.\d{3})*(?:,\d{2})?|\d+,\d{2})',
          caseSensitive: false,
        ),
      );
    }

    patterns.add(
      RegExp(
        r'(?:R\$|\$|€|USD|EUR|BRL)\s*(\d+(?:[.,]\d{1,2})?)',
        caseSensitive: false,
      ),
    );

    return patterns;
  }

  static final RegExp _regexEstabelecimento = RegExp(
    r'(?:pagamento|pago|compra|debito|transferencia|transferência|recebimento|depósito|deposito)\s+(?:de\s+)?([A-Za-zÀ-ÖØ-öø-ÿ\s]+?)(?:\s+(?:no|em|para|atrás|realizado|aprovado|confirmado))?',
    caseSensitive: false,
  );

  static bool isNotificacaoBancaria(String texto) {
    final textoLower = texto.toLowerCase();
    return _bancosPermitidos.any((banco) => textoLower.contains(banco));
  }

  static double? extrairValor(String texto, {String currencyCode = 'BRL'}) {
    final regexList = _getRegexPorLocale(currencyCode);

    for (final regex in regexList) {
      final match = regex.firstMatch(texto);
      if (match != null) {
        final valorString = match.group(1);
        if (valorString == null) continue;

        final isDotDecimal = currencyCode == 'USD';
        String valorNormalizado;
        if (isDotDecimal) {
          valorNormalizado = valorString.replaceAll(',', '');
        } else {
          valorNormalizado = valorString
              .replaceAll('.', '')
              .replaceAll(',', '.');
        }

        final result = double.tryParse(valorNormalizado);
        if (result != null && result > 0) {
          return result;
        }
      }
    }
    return null;
  }

  static String? extrairEstabelecimento(String texto) {
    final match = _regexEstabelecimento.firstMatch(texto);
    if (match == null) return null;

    final estabelecimento = match.group(1)?.trim();
    if (estabelecimento == null || estabelecimento.isEmpty) return null;

    return estabelecimento;
  }

  static TransacaoData? parse(
    String notificationText, {
    String currencyCode = 'BRL',
  }) {
    if (!isNotificacaoBancaria(notificationText)) {
      return null;
    }

    final valor = extrairValor(notificationText, currencyCode: currencyCode);
    if (valor == null) return null;

    final descricao =
        extrairEstabelecimento(notificationText) ?? 'Transação bancária';

    final categoria = CategoriaTransacao.definirCategoria(notificationText);

    return TransacaoData(
      valor: valor,
      descricao: descricao,
      data: DateTime.now(),
      categoria: categoria,
    );
  }
}

class TransacaoData {
  final double valor;
  final String descricao;
  final DateTime data;
  final String? categoria;

  TransacaoData({
    required this.valor,
    required this.descricao,
    required this.data,
    this.categoria,
  });
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

class NotificationListenerService {
  static const MethodChannel _channel = MethodChannel(
    'mentor_financeiro/notifications',
  );
  static const EventChannel _eventChannel = EventChannel(
    'mentor_financeiro/notifications/stream',
  );

  StreamSubscription? _subscription;
  final TransacaoRepository _repository = TransacaoRepository();

  Future<bool> verificarPermissao() async {
    try {
      final bool result = await _channel.invokeMethod('checkPermission');
      return result;
    } on PlatformException catch (e) {
      debugPrint('Erro ao verificar permissão: ${e.message}');
      return false;
    }
  }

  Future<bool> solicitarPermissao() async {
    try {
      final bool result = await _channel.invokeMethod('requestPermission');
      return result;
    } on PlatformException catch (e) {
      debugPrint('Erro ao solicitar permissão: ${e.message}');
      return false;
    }
  }

  Future<bool> iniciar() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('Nenhum usuário logado. Serviço não iniciado.');
      return false;
    }

    final hasPermission = await verificarPermissao();
    if (!hasPermission) {
      final requested = await solicitarPermissao();
      if (!requested) {
        debugPrint('Permissão de notificações negada.');
        return false;
      }
    }

    _subscription = _eventChannel.receiveBroadcastStream().listen(
      _onNotificationReceived,
      onError: _onError,
    );

    debugPrint(
      'NotificationListenerService iniciado para usuário: ${user.uid}',
    );
    return true;
  }

  void _onNotificationReceived(dynamic event) {
    if (event is! Map) {
      return;
    }

    final title = event['title'] as String? ?? '';
    final text = event['text'] as String? ?? '';
    final packageName = event['package'] as String? ?? '';

    final notificationText = '$packageName $title $text';

    if (notificationText.trim().isEmpty) {
      return;
    }

    _processarNotificacao(notificationText);
  }

  Future<void> _processarNotificacao(String texto) async {
    final transacaoData = NotificationParserService.parse(texto);
    if (transacaoData == null) {
      return;
    }

    final transacao = TransacaoModel(
      valor: transacaoData.valor,
      descricao: transacaoData.descricao,
      data: transacaoData.data,
      metodo: 'Notificação Bancária',
      categoria: transacaoData.categoria,
    );

    final sucesso = await _repository.salvarTransacao(transacao);
    if (sucesso) {
      debugPrint(
        'Transação salva: ${transacaoData.descricao} - R\$ ${transacaoData.valor}',
      );
    }
  }

  void _onError(Object error) {
    debugPrint('Erro no stream de notificações: $error');
  }

  void parar() {
    _subscription?.cancel();
    _subscription = null;
    debugPrint('NotificationListenerService parado.');
  }
}

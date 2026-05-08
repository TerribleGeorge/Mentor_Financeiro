import 'dart:async';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  static TipoPagamento identificarTipoPagamento(String texto) {
    final lower = texto.toLowerCase();

    final keywordsCredito = [
      'cartão',
      'cartao',
      'crédito',
      'credito',
      'credit',
      'parcelado',
      'parcelamento',
      'x vezes',
      'débito parcelado',
      'fatura',
      'compra no crédito',
      'compra no cartao',
      'final',
      'valores Parc',
      'parcelas',
    ];

    if (keywordsCredito.any((kw) => lower.contains(kw))) {
      return TipoPagamento.credito;
    }

    return TipoPagamento.debito;
  }

  static double? extrairLimiteDisponivel(String texto) {
    final lower = texto.toLowerCase();

    final regexLimite = RegExp(
      r'(?:limite|disponível|disponivel|restante|saldo disponível|saldo disponivel)\s*(?:de\s*)?(?:R\$|€|\$)?\s*(\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    );

    final match = regexLimite.firstMatch(lower);
    if (match != null) {
      final valorStr = match.group(1)?.replaceAll('.', '').replaceAll(',', '.');
      if (valorStr != null) {
        return double.tryParse(valorStr);
      }
    }

    return null;
  }
}

class NotificationParserService {
  /// Palavras-chave (multi-idioma) que indicam **gasto/saída**.
  static const List<String> _spendKeywords = [
    // PT
    'compra aprovada',
    'compra realizada',
    'compra de',
    'pagamento aprovado',
    'pagamento realizado',
    'pagamento efetuado',
    'debito',
    'débito',
    'cartao',
    'cartão',
    'credito',
    'crédito',
    'saque',
    'transferencia enviada',
    'transferência enviada',
    'pix enviado',
    'transferencia realizada',
    'transferência realizada',
    'transferencia para',
    'transferência para',
    'pix para',
    'pix: enviado',
    'pix enviado para',
    'pix realizado',
    // EN
    'card purchase',
    'purchase',
    'payment',
    'card charged',
    'charged',
    'debit',
    'withdrawal',
    'transfer sent',
    'transfer to',
    'sent to',
    'money sent',
    'you sent',
    // ES
    'compra aprobada',
    'pago',
    'pago con',
    'pago en',
    'débito',
    'debito',
    'crédito',
    'credito',
    'retiro',
    'transferencia enviada',
    'transferencia realizada',
    'transferencia a',
    'enviado a',
    // FR
    'paiement',
    'achat',
    'débit',
    'retrait',
    'virement',
    'virement vers',
    // DE
    'zahlung',
    'kauf',
    'abbuchung',
    'abhebung',
    'überweisung',
    'ueberweisung',
    'gesendet an',
    // IT
    'pagamento',
    'acquisto',
    'addebito',
    'prelievo',
    'bonifico',
    'inviato a',
  ];

  /// Palavras-chave de segurança que nunca devem virar transação.
  static const List<String> _securityBlockKeywords = [
    // Segurança / login
    'código de verificação',
    'codigo de verificacao',
    'verification code',
    'security code',
    'otp',
    'token',
    '2fa',
    'código',
    'codigo',
    'senha',
    'password',
    'login',
  ];

  /// Palavras-chave de entrada/estorno que não são gastos.
  static const List<String> _incomingBlockKeywords = [
    'pix recebido',
    'transferência recebida',
    'transferencia recebida',
    'received',
    'credit received',
    'refund',
    'estorno',
    'reembolso',
    'chargeback',
  ];

  static String _sanitize(String texto) {
    var t = texto;

    // Remove pedaços comuns que assustam ou poluem (sem impedir a transação).
    t = t.replaceAll(
      RegExp(
        r'(autentica(?:ção|cao)|auth(?:entication)?|authorization)\s*[:\-]\s*[A-Za-z0-9\- ]{3,}',
        caseSensitive: false,
      ),
      '',
    );
    t = t.replaceAll(
      RegExp(r'comprovante\s+dispon[ií]vel.*$', caseSensitive: false),
      '',
    );

    // Normaliza espaços.
    t = t.replaceAll(RegExp(r'\s+'), ' ').trim();
    return t;
  }

  static final List<RegExp> _moneyPatterns = [
    // Símbolo antes (com separadores)
    RegExp(
      r'([€£¥₹$]|R\$)\s*(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    ),
    // Código ISO antes
    RegExp(
      r'\b(usd|eur|brl|gbp|jpy|inr|cad|aud|chf)\b\s*(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    ),
    // Valor antes do código (ex.: 12.34 USD)
    RegExp(
      r'(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)\s*\b(usd|eur|brl|gbp|jpy|inr|cad|aud|chf)\b',
      caseSensitive: false,
    ),
  ];

  static final RegExp _regexEstabelecimento = RegExp(
    r'(?:pagamento|pago|compra|debito|transferencia|transferência|recebimento|depósito|deposito)\s+(?:de\s+)?([A-Za-zÀ-ÖØ-öø-ÿ\s]+?)(?:\s+(?:no|em|para|atrás|realizado|aprovado|confirmado))?',
    caseSensitive: false,
  );

  // Padrões comuns: "Compra Aprovada: LOJA - R$ 12,34 ..."
  static final List<RegExp> _estabelecimentoStrongPatterns = [
    RegExp(
      r'compra\s+aprovad[ao]\s*[:\-]\s*(.+?)\s*-\s*(?:R\$|€|£|¥|₹|\$)',
      caseSensitive: false,
    ),
    RegExp(
      r'payment\s+(?:approved|successful)\s*[:\-]\s*(.+?)\s*-\s*(?:R\$|€|£|¥|₹|\$)',
      caseSensitive: false,
    ),
    RegExp(
      r'compra\s+aprobada\s*[:\-]\s*(.+?)\s*-\s*(?:R\$|€|£|¥|₹|\$)',
      caseSensitive: false,
    ),
    // Cartão: "NOME DO CARTÃO: Compra de R$ 10,00 em LOJA."
    RegExp(
      r'compra\s+de\s+(?:R\$|€|£|¥|₹|\$)\s*[\d.,]+\s+em\s+(.+?)(?:[.\n]|$)',
      caseSensitive: false,
    ),
    // Pagamento de boleto
    RegExp(
      r'\bboleto\b.*?\bvalor\b.*?(?:R\$|€|£|¥|₹|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    // PIX / transferência (destinatário)
    RegExp(
      r'\bpix\b.*?\b(?:enviado|enviada|realizado|realizada)\b.*?\b(?:para|to|a|vers|an)\b\s*([^\n\-–—:]+?)(?:\s*[-–—]\s*|\s+(?:R\$|€|£|¥|₹|\$|\b(?:usd|eur|brl|gbp|jpy|inr|cad|aud|chf)\b))',
      caseSensitive: false,
    ),
    RegExp(
      r'\btransfer(?:e|ê)ncia\b.*?\b(?:enviad[ao]|realizad[ao])\b.*?\b(?:para|to|a|vers|an)\b\s*([^\n\-–—:]+?)(?:\s*[-–—]\s*|\s+(?:R\$|€|£|¥|₹|\$|\b(?:usd|eur|brl|gbp|jpy|inr|cad|aud|chf)\b))',
      caseSensitive: false,
    ),
    RegExp(
      r'enviado\s+para\s+a\s+conta\s+de\s+([^\n\-–—:]+?)(?:[.\n]|$)',
      caseSensitive: false,
    ),
    RegExp(
      r'\btransfer\s+(?:sent|successful)\b.*?\b(?:to)\b\s*([^\n\-–—:]+?)(?:\s*[-–—]\s*|\s+(?:R\$|€|£|¥|₹|\$|\b(?:usd|eur|brl|gbp|jpy|inr|cad|aud|chf)\b))',
      caseSensitive: false,
    ),
  ];

  static bool isSpendingNotification(String texto) {
    final cleaned = _sanitize(texto);
    final t = cleaned.toLowerCase();
    if (_securityBlockKeywords.any((k) => t.contains(k))) return false;
    if (_incomingBlockKeywords.any((k) => t.contains(k))) return false;

    final hasSpendKeyword = _spendKeywords.any((k) => t.contains(k));
    final hasMoney = extrairValor(cleaned) != null;
    if (!hasMoney) return false;
    return hasSpendKeyword;
  }

  static double? extrairValor(String texto) {
    for (final r in _moneyPatterns) {
      final m = r.firstMatch(texto);
      if (m == null) continue;
      final raw = (m.groupCount >= 2 ? m.group(2) : null) ?? m.group(1);
      if (raw == null) continue;

      // Normalização:
      // - remove espaços
      // - tenta inferir decimal pelo último separador (',' ou '.')
      final cleaned = raw.replaceAll(' ', '');
      final lastComma = cleaned.lastIndexOf(',');
      final lastDot = cleaned.lastIndexOf('.');
      final lastSep = (lastComma > lastDot) ? ',' : '.';
      String normalized;
      if (cleaned.contains(',') && cleaned.contains('.')) {
        // Tem ambos: assume que o último separador é decimal.
        normalized = cleaned.replaceAll(lastSep == ',' ? '.' : ',', '');
        normalized = normalized.replaceAll(lastSep, '.');
      } else if (cleaned.contains(',') || cleaned.contains('.')) {
        // Só um tipo: se houver 2 casas no final, assume decimal; senão remove separadores.
        final sep = cleaned.contains(',') ? ',' : '.';
        final parts = cleaned.split(sep);
        if (parts.length == 2 && parts[1].length <= 2) {
          normalized = '${parts[0].replaceAll(RegExp(r"\\D"), '')}.${parts[1]}';
        } else {
          normalized = cleaned.replaceAll(RegExp(r'[.,]'), '');
        }
      } else {
        normalized = cleaned;
      }

      final v = double.tryParse(normalized);
      if (v != null && v > 0) return v;
    }
    return null;
  }

  static String? extrairEstabelecimento(String texto) {
    final cleaned = _sanitize(texto);
    for (final r in _estabelecimentoStrongPatterns) {
      final m = r.firstMatch(cleaned);
      final g = m?.group(1)?.trim();
      if (g != null && g.isNotEmpty) return g;
    }

    final match = _regexEstabelecimento.firstMatch(cleaned);
    if (match == null) return null;

    final estabelecimento = match.group(1)?.trim();
    if (estabelecimento == null || estabelecimento.isEmpty) return null;

    return estabelecimento;
  }

  static TipoPagamento identificarTipoPagamento(String texto) {
    final lower = texto.toLowerCase();
    final keywordsCredito = [
      'cartão',
      'cartão de crédito',
      'cartão final',
      'cartao final',
      'credito',
      'credit',
      'final',
      'visa',
      'mastercard',
      'hipercard',
      'elo crédito',
    ];
    for (final kw in keywordsCredito) {
      if (lower.contains(kw)) {
        return TipoPagamento.credito;
      }
    }
    return TipoPagamento.debito;
  }

  static double? extrairLimiteDisponivel(String texto) {
    final patterns = [
      RegExp(
        r'limite[sd]?[aio]?\s*(?:disponível|disponivel)?\s*:?\s*R\$\s*([\d.,]+)',
        caseSensitive: false,
      ),
      RegExp(
        r'R\$\s*([\d.,]+)\s*de\s*(?:limite|disponível)',
        caseSensitive: false,
      ),
      RegExp(r'disponível[sd]?\s*:?\s*R\$\s*([\d.,]+)', caseSensitive: false),
    ];
    for (final pattern in patterns) {
      final match = pattern.firstMatch(texto);
      if (match != null) {
        final valorStr = match
            .group(1)
            ?.replaceAll('.', '')
            .replaceAll(',', '.');
        if (valorStr != null) {
          final valor = double.tryParse(valorStr);
          if (valor != null && valor > 0) {
            return valor;
          }
        }
      }
    }
    return null;
  }

  static TransacaoData? parse(
    String notificationText, {
    String currencyCode = 'BRL',
  }) {
    final cleaned = _sanitize(notificationText);
    if (!isSpendingNotification(cleaned)) {
      return null;
    }

    final valor = extrairValor(cleaned);
    if (valor == null) return null;

    final descricao =
        extrairEstabelecimento(cleaned) ??
        (cleaned.toLowerCase().contains('boleto')
            ? 'Boleto pago'
            : 'Gasto identificado');

    final categoria = CategoriaTransacao.definirCategoria(cleaned);
    final tipoPagamento = identificarTipoPagamento(cleaned);
    final limiteDisponivel = extrairLimiteDisponivel(cleaned);

    return TransacaoData(
      valor: valor,
      descricao: descricao,
      data: DateTime.now(),
      categoria: categoria,
      tipoPagamento: tipoPagamento,
      limiteDisponivel: limiteDisponivel,
    );
  }
}

class TransacaoData {
  final double valor;
  final String descricao;
  final DateTime data;
  final String? categoria;
  final TipoPagamento tipoPagamento;
  final double? limiteDisponivel;

  TransacaoData({
    required this.valor,
    required this.descricao,
    required this.data,
    this.categoria,
    this.tipoPagamento = TipoPagamento.debito,
    this.limiteDisponivel,
  });
}

class TransacaoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> salvarTransacao(TransacaoModel transacao) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    }

    final validacao = await validarSaldo(user.uid, transacao);
    if (!validacao.podeSalvar) {
      debugPrint('Transação negada: ${validacao.mensagem}');
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

  Future<ResultadoValidacao> validarSaldo(
    String uid,
    TransacaoModel transacao,
  ) async {
    final snap = await _firestore.collection('usuarios').doc(uid).get();
    final data = snap.data() ?? const <String, dynamic>{};

    final saldoRaw = data['saldoConta'];
    final limiteRaw = data['limiteTotalCartao'];
    final utilizadoRaw = data['limiteUtilizado'];

    final saldoConta = (saldoRaw is num) ? saldoRaw.toDouble() : 0.0;
    final limiteCartao = (limiteRaw is num) ? limiteRaw.toDouble() : 0.0;
    final limiteUtilizado = (utilizadoRaw is num)
        ? utilizadoRaw.toDouble()
        : 0.0;

    // Se o utilizador ainda não configurou saldo/limite, não bloqueia o registo.
    final hasAnyConfig =
        saldoRaw != null || limiteRaw != null || utilizadoRaw != null;
    if (!hasAnyConfig) {
      return ResultadoValidacao(
        podeSalvar: true,
        mensagem: 'Configuração financeira ausente — registo permitido',
      );
    }

    if (transacao.tipoPagamento == TipoPagamento.debito) {
      if (saldoConta >= transacao.valor) {
        return ResultadoValidacao(
          podeSalvar: true,
          mensagem: 'Saldo suficiente',
        );
      }
      return ResultadoValidacao(
        podeSalvar: false,
        mensagem: 'Saldo insuficiente',
        saldoAtual: saldoConta,
        valorTransacao: transacao.valor,
        tipo: 'debito',
      );
    } else {
      final limiteDisponivel = limiteCartao - limiteUtilizado;
      if (limiteDisponivel >= transacao.valor) {
        return ResultadoValidacao(
          podeSalvar: true,
          mensagem: 'Limite suficiente',
        );
      }
      return ResultadoValidacao(
        podeSalvar: false,
        mensagem: 'Limite insuficiente',
        saldoAtual: limiteDisponivel,
        valorTransacao: transacao.valor,
        tipo: 'credito',
      );
    }
  }
}

class ResultadoValidacao {
  final bool podeSalvar;
  final String mensagem;
  final double saldoAtual;
  final double valorTransacao;
  final String tipo;

  ResultadoValidacao({
    required this.podeSalvar,
    required this.mensagem,
    this.saldoAtual = 0,
    this.valorTransacao = 0,
    this.tipo = 'debito',
  });
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
  static const _dedupeKey = 'notification_dedupe_ids';
  static const _dedupeMax = 80;
  static const _monitoringEnabledKey = 'notif_monitoring_enabled';

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

  /// Inicia o stream **sem** disparar pedido de permissão automaticamente.
  /// Retorna `false` se a permissão ainda não foi concedida.
  Future<bool> iniciar() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('Nenhum usuário logado. Serviço não iniciado.');
      return false;
    }

    final hasPermission = await verificarPermissao();
    if (!hasPermission) {
      debugPrint(
        'Permissão de notificações não concedida. Não iniciar automaticamente.',
      );
      return false;
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

  /// Fluxo manual (UX): solicita permissão e inicia se concedido.
  Future<bool> solicitarPermissaoEIniciar() async {
    final requested = await solicitarPermissao();
    if (!requested) {
      debugPrint('Permissão de notificações negada.');
      return false;
    }
    return iniciar();
  }

  void _onNotificationReceived(dynamic event) {
    if (event is! Map) {
      return;
    }

    final title = event['title'] as String? ?? '';
    final text = event['text'] as String? ?? '';
    final packageName = event['package'] as String? ?? '';
    final timestamp = (event['timestamp'] as num?)?.toInt() ?? 0;

    final notificationText = '$packageName $title $text';

    if (kDebugMode) {
      debugPrint('Notificação recebida [$packageName]: $title | $text');
    }

    if (notificationText.trim().isEmpty) {
      return;
    }

    _processarNotificacao(
      notificationText,
      packageName: packageName,
      timestamp: timestamp,
    );
  }

  String? _inferirBanco(String packageName, String texto) {
    final combined = '$packageName $texto'.toLowerCase();
    final bancos = <String, List<String>>{
      'Nubank': ['nubank', 'com.nu.'],
      'Inter': ['inter', 'bancointer', 'br.com.inter'],
      'Caixa': ['caixa', 'br.com.caixa'],
      'Itaú': ['itau', 'itaú', 'com.itau', 'br.com.itau'],
      'Bradesco': ['bradesco', 'br.com.bradesco'],
      'Banco do Brasil': [
        'banco do brasil',
        'bancodobrasil',
        ' bb ',
        'br.com.bb',
      ],
      'Santander': ['santander', 'br.com.santander'],
      'Sicredi': ['sicredi'],
      'Sicoob': ['sicoob'],
      'C6 Bank': ['c6', 'c6bank', 'com.c6bank'],
      'Neon': ['neon'],
      'PagBank': ['pagbank', 'pagseguro', 'com.pagseguro'],
      'Mercado Pago': ['mercadopago', 'mercado pago', 'com.mercadopago'],
      'PicPay': ['picpay', 'com.picpay'],
    };
    for (final entry in bancos.entries) {
      if (entry.value.any((k) => combined.contains(k))) return entry.key;
    }
    return null;
  }

  Future<bool> _jaProcessada({
    required String uid,
    required String packageName,
    required String texto,
    required int timestamp,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final id = '$uid|$timestamp|$packageName|$texto';
    final ids = prefs.getStringList(_dedupeKey) ?? <String>[];
    if (ids.contains(id)) return true;
    ids.add(id);
    if (ids.length > _dedupeMax) {
      ids.removeRange(0, ids.length - _dedupeMax);
    }
    await prefs.setStringList(_dedupeKey, ids);
    return false;
  }

  Future<void> _processarNotificacao(
    String texto, {
    required String packageName,
    required int timestamp,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final prefs = await SharedPreferences.getInstance();
    final enabled = prefs.getBool(_monitoringEnabledKey) ?? true;
    if (!enabled) return;

    final transacaoData = NotificationParserService.parse(texto);
    if (transacaoData == null) {
      if (kDebugMode) {
        debugPrint('Notificação ignorada pelo parser: $texto');
      }
      return;
    }

    if (await _jaProcessada(
      uid: user.uid,
      packageName: packageName,
      texto: texto,
      timestamp: timestamp,
    )) {
      return;
    }

    final transacao = TransacaoModel(
      valor: transacaoData.valor,
      descricao: transacaoData.descricao,
      data: transacaoData.data,
      metodo: 'Notificação Bancária',
      categoria: transacaoData.categoria,
      banco: _inferirBanco(packageName, texto),
      tipoPagamento: transacaoData.tipoPagamento,
      limiteDisponivel: transacaoData.limiteDisponivel,
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

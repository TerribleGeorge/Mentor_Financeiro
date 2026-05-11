import 'dart:async';
import 'dart:convert' show jsonDecode, jsonEncode;
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
    'você pagou',
    'voce pagou',
    'compra no valor',
    'compra',
    'compra de',
    'pagamento',
    'pagamento aprovado',
    'pagamento realizado',
    'pagamento efetuado',
    'transação',
    'transacao',
    'transação aprovada',
    'transacao aprovada',
    'debito',
    'débito',
    'cartao',
    'cartão',
    'compra no crédito',
    'compra no credito',
    'compra no débito',
    'compra no debito',
    'crédito aprovado',
    'credito aprovado',
    'cartão de crédito',
    'cartao de credito',
    'débito automático',
    'debito automatico',
    'pagamento automático',
    'pagamento automatico',
    'cobrança',
    'cobranca',
    'encargo',
    'tarifa',
    'recarga',
    'uso internacional',
    'pré-autorização',
    'pre-autorizacao',
    'pré autorização',
    'fatura paga',
    'parcela',
    'pago com sucesso',
    'débito realizado',
    'debito realizado',
    'pagamento de conta',
    'débito em conta',
    'debito em conta',
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
    'você gastou',
    'voce gastou',
    'gastou',
    'foi debitado',
    'foi debitada',
    'valor debitado',
    'lançamento',
    'lancamento',
    'descontou',
    'descontado',
    'compra identificada',
    'transação no cartão',
    'transacao no cartao',
    // EN
    'card purchase',
    'purchase',
    'you paid',
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
    'amount spent',
    'charged to',
    'paid with',
    'paid at',
    'card used',
    'transaction at',
    'merchant charge',
    'bill paid',
    'automatic payment',
    'recurring payment',
    'subscription renewed',
    'atm withdrawal',
    'wire sent',
    // ES
    'compra aprobada',
    'pago',
    'pago con',
    'pago en',
    'débito',
    'debito',
    'crédito consumido',
    'credito consumido',
    'cargo en tarjeta',
    'retiro',
    'transferencia enviada',
    'transferencia realizada',
    'transferencia a',
    'enviado a',
    'cargo realizado',
    'cobro',
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
  /// Importante: não usar só «código» — bloqueia «código de barras» em boletos/compras.
  static const List<String> _securityBlockKeywords = [
    'código de verificação',
    'codigo de verificacao',
    'código de segurança',
    'codigo de seguranca',
    'código de acesso',
    'codigo de acesso',
    'verification code',
    'security code',
    'authentication code',
    'otp',
    'token',
    '2fa',
    'senha',
    'password',
    'login',
    'novo acesso',
    'new login',
    'novo dispositivo',
    'new device',
    'tentativa de acesso',
    'unrecognized',
  ];

  /// Entradas de dinheiro / estorno — manter frases **específicas** (evitar «received» sozinho).
  static const List<String> _incomingBlockKeywords = [
    'pix recebido',
    'pix received',
    'transferência recebida',
    'transferencia recebida',
    'transfer received',
    'money received',
    'funds received',
    'payment received into',
    'you received a payment',
    'incoming payment',
    'deposit received',
    'credit received',
    'compra recebida',
    'crédito recebido',
    'credito recebido',
    'refund',
    'estorno',
    'reembolso',
    'chargeback',
    'ted recebida',
    'ted recebido',
    'doc recebido',
    'depósito identificado',
    'deposito identificado',
    'saldo creditado',
    'rendimento creditado',
    'dividendos',
    'cashback creditado',
    'cashback recebido',
    'você recebeu',
    'voce recebeu',
    'you were paid',
    'was deposited',
    'credited to your',
    'acaba de receber',
    'recebeu um pix',
    'pix recebido de',
    'transferência recebida de',
    'transferencia recibida',
  ];

  /// Padrões multilingues de **saída de dinheiro** (complementam palavras-chave).
  static final List<RegExp> _spendPhraseRegexes = [
    RegExp(
      r'\b(?:compra|purchase)\b.{0,100}?(?:r\$|€|£|\$|usd|eur|gbp)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'(?:r\$|€|£|\$|usd|eur|gbp)\s*[\d.,]{2,}.{0,100}?\b(?:compra|purchase|pagamento|payment)\b',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:pagamento|payment|pago|paid)\b.{0,100}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:débito|debito|debit)\b.{0,55}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'(?:r\$|€|£|\$)\s*[\d.,]{2,}.{0,75}?\b(?:débito|debito|debit)\b',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:saque|withdrawal)\b.{0,100}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:pix|ted|doc)\b.{0,28}?(?:enviad[oa]|sent|efetuad[oa]|realizad[oa])',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:transfer(?:ência|encia))\b.{0,32}?(?:enviad[oa]|efetuad[oa]|realizad[oa])\b',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:charged|debited|spent)\b.{0,100}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:authorized|authorised|autorizad[oa])\b.{0,110}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:boleto|payment\s+slip|bank\s+slip)\b.{0,70}?(?:pago|paid|liquidad)',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:tarifa|fee|service\s+charge|banking\s+charge)\b.{0,55}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:subscription|assinatura|renovação|renewal)\b.{0,90}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(r'\b(?:parcela|installment|instalment)\s*\d+\s*/\s*\d+', caseSensitive: false),
    RegExp(r'\bfinal\s*\*{0,4}\s*\d{4}\b', caseSensitive: false),
    RegExp(
      r'\b(?:nfc|contactless|tap\s+to\s+pay|google\s+pay|apple\s+pay|samsung\s+pay)\b',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:fatura|invoice)\b.{0,50}?(?:pago|paid|fechad[oa]|closed)',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:lanç(?:amento)?|lanc(?:amento)?)\b.{0,28}?(?:cartão|cartao|card)\b',
      caseSensitive: false,
    ),
  ];

  /// Valor + preposição de destino (Wallet, vários bancos); exclui aviso **só** de saldo/limite.
  static bool _universalMonetaryBridge(String t) {
    final bridge = RegExp(
      r'(?:r\$|€|£|\$)\s*[\d.,]{2,}\s+(?:com|con|em|na|no|para|por|to|at|from|von|chez)\s+\S{2,}',
      caseSensitive: false,
    );
    if (!bridge.hasMatch(t)) return false;

    final balanceNoticeOnly = RegExp(
      r'\b(?:saldo|balance)\b.{0,45}?\b(?:disponível|disponivel|atual|current)\b',
      caseSensitive: false,
    );
    if (balanceNoticeOnly.hasMatch(t) &&
        !RegExp(
          r'\b(?:compra|pagamento|débito|debito|purchase|payment|charge|pago|paid|autoriz|authorized|enviad|sent|saque|withdrawal)\b',
          caseSensitive: false,
        ).hasMatch(t)) {
      return false;
    }

    if (RegExp(
          r'\b(?:limite|limit)\b.{0,50}?\b(?:crédito|credito|credit)\b',
          caseSensitive: false,
        ).hasMatch(t) &&
        !RegExp(
          r'\b(?:compra|pagamento|débito|debito|purchase|payment|charge|autoriz)\b',
          caseSensitive: false,
        ).hasMatch(t)) {
      return false;
    }

    return true;
  }

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
    // "Valor: 12,34" / "Valor R$ 12,34" (comum em apps bancários)
    RegExp(
      r'\bvalor\b\s*[:\-]?\s*(?:R\$|€|£|\$)?\s*(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    ),
    // "no valor de R$ X" / "por R$ X" (PIX, faturas)
    RegExp(
      r'(?:no\s+valor\s+de|no valor de|por)\s+(?:R\$|€|£|\$)\s*(\d{1,3}(?:[.\s]\d{3})*(?:,\d{1,2})?|\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    ),
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
    // "12,34 reais" / "100 BRL"
    RegExp(
      r'\b(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)\s*(?:reais?|real|brl)\b',
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

  /// Pacote ou texto típico de app bancário BR — permite heurística mais branda.
  static bool _looksLikeKnownBankApp(String t) {
    const fragments = <String>[
      'com.nu.',
      'nubank',
      'bancointer',
      'br.com.inter',
      'intermedium',
      'br.com.itau',
      'itau',
      'itaú',
      'bradesco',
      'com.bb',
      'br.com.bb',
      'caixa',
      'santander',
      'c6bank',
      'c6 bank',
      'pagseguro',
      'pagbank',
      'picpay',
      'mercadopago',
      'mercado pago',
      'google.android',
      'wallet',
      'gpay',
      'sicredi',
      'sicoob',
      'neon',
      'stone',
      'getnet',
      'revolut',
      'wise',
      'transferwise',
      'paypal',
      'venmo',
      'zelle',
      'cashapp',
      'bancopan',
      'banrisul',
      'banestes',
      'xp investimentos',
      'btg',
      'safra',
      'willbank',
      'digio',
      'banco pan',
    ];
    final lower = t.toLowerCase();
    return fragments.any(lower.contains);
  }

  /// Sinais fracos de saída de dinheiro (combinados com valor + app de banco).
  static bool _hasWeakSpendSignal(String t) {
    const signals = <String>[
      'débito',
      'debito',
      'compra',
      'pagamento',
      'pago',
      'pix',
      'enviad',
      'cartão',
      'cartao',
      'saque',
      'gastou',
      'gasto',
      'spent',
      'charged',
      ' lanç',
      ' lanc',
      'aprovad',
      'approved',
      'debited',
      'withdrawal',
      'payment',
      'purchase',
      'transfer',
    ];
    return signals.any(t.contains);
  }

  /// Google Wallet / GPay no telemóvel: título = estabelecimento; texto = «R$ 25,00 com Nome».
  static final RegExp _walletValorComTitular = RegExp(
    r'r\$\s*\d{1,3}(?:[.\s]\d{3})*(?:,\d{2}|\.\d{2})\s+com\s+\S',
    caseSensitive: false,
  );

  static bool _looksLikeGoogleWalletTapPay(String t) {
    return _walletValorComTitular.hasMatch(t);
  }

  /// Texto antes do primeiro « R$…» (título do estabelecimento), removendo o pacote à frente.
  static String? _comercianteAntesDoValor(String texto) {
    final m = RegExp(
      r'\s+r\$\s*[\d.,]+',
      caseSensitive: false,
    ).firstMatch(texto);
    if (m == null || m.start <= 0) return null;
    var before = texto.substring(0, m.start).trim();
    if (before.isEmpty) return null;
    final firstSpace = before.indexOf(' ');
    if (firstSpace > 0) {
      final tok = before.substring(0, firstSpace);
      if (tok.contains('.') && !tok.contains(' ')) {
        before = before.substring(firstSpace + 1).trim();
      }
    }
    if (before.length < 2) return null;
    return before;
  }

  static bool isSpendingNotification(String texto) {
    final cleaned = _sanitize(texto);
    final t = cleaned.toLowerCase();
    if (_securityBlockKeywords.any((k) => t.contains(k))) return false;
    if (_incomingBlockKeywords.any((k) => t.contains(k))) return false;

    final hasSpendKeyword = _spendKeywords.any((k) => t.contains(k));
    final hasMoney = extrairValor(cleaned) != null;
    if (!hasMoney) return false;
    if (hasSpendKeyword) return true;
    if (_spendPhraseRegexes.any((r) => r.hasMatch(t))) return true;
    if (_looksLikeGoogleWalletTapPay(t)) return true;
    if (_looksLikeKnownBankApp(t) && _hasWeakSpendSignal(t)) return true;
    if (_universalMonetaryBridge(t)) return true;
    return false;
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
          normalized = '${parts[0].replaceAll(RegExp(r'\D'), '')}.${parts[1]}';
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
      if (m == null || m.groupCount < 1) continue;
      final g = m.group(1)?.trim();
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

    final walletTitulo = _comercianteAntesDoValor(cleaned);
    final descricao =
        extrairEstabelecimento(cleaned) ??
        walletTitulo ??
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
  NotificationListenerService._();
  static final NotificationListenerService _instance =
      NotificationListenerService._();
  factory NotificationListenerService() => _instance;

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
  static const _diagnosticsKey = 'notification_listener_diagnostics';
  static const _diagnosticsMax = 20;
  static const _pendingTxKey = 'notification_pending_tx_v1';
  static const _pendingTxMax = 40;

  static Future<List<String>> carregarDiagnosticos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_diagnosticsKey) ?? const <String>[];
  }

  static Future<void> limparDiagnosticos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_diagnosticsKey);
  }

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

  /// Abre os detalhes da app no Android (utilizador pode ajustar bateria / segundo plano).
  Future<bool> abrirDefinicoesBateriaApp() async {
    try {
      final result = await _channel.invokeMethod<bool>('openAppBatterySettings');
      return result ?? false;
    } on PlatformException catch (e) {
      debugPrint('Erro ao abrir definições de bateria: ${e.message}');
      return false;
    }
  }

  Future<void> _registrarDiagnostico(String status, String texto) async {
    final prefs = await SharedPreferences.getInstance();
    final cleaned = texto.replaceAll(RegExp(r'\s+'), ' ').trim();
    final snippet = cleaned.length > 280
        ? '${cleaned.substring(0, 280)}...'
        : cleaned;
    final entry = '${DateTime.now().toIso8601String()}|$status|$snippet';
    final items = prefs.getStringList(_diagnosticsKey) ?? <String>[];
    items.insert(0, entry);
    if (items.length > _diagnosticsMax) {
      items.removeRange(_diagnosticsMax, items.length);
    }
    await prefs.setStringList(_diagnosticsKey, items);
  }

  bool get estaAtivo => _subscription != null;

  /// Drena eventos guardados nativamente (ex. app em segundo plano sem EventSink).
  Future<void> sincronizarPendentes() => _drainPendingNotifications();

  /// Inicia o stream **sem** disparar pedido de permissão automaticamente.
  /// Retorna `false` se a permissão ainda não foi concedida.
  Future<bool> iniciar() async {
    if (_subscription != null) {
      return true;
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
      onError: (Object e, StackTrace _) {
        _onError(e);
        _subscription = null;
      },
      onDone: () {
        _subscription = null;
      },
    );

    await _drainPendingNotifications();

    final uid = FirebaseAuth.instance.currentUser?.uid ?? 'convidado';
    debugPrint('NotificationListenerService iniciado (uid: $uid)');
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

  Future<void> _drainPendingNotifications() async {
    try {
      final raw =
          await _channel.invokeMethod<dynamic>('drainPendingNotifications');
      if (raw is! List) return;

      for (final item in raw) {
        final map = _normalizeNotificationEvent(item);
        if (map != null) {
          _onNotificationReceived(map);
        }
      }
    } on PlatformException catch (e) {
      debugPrint('Erro ao recuperar notificações pendentes: ${e.message}');
    }
  }

  Map<String, dynamic>? _normalizeNotificationEvent(dynamic event) {
    if (event is! Map) return null;
    final out = <String, dynamic>{};
    for (final e in event.entries) {
      final key = e.key?.toString() ?? '';
      if (key.isEmpty) continue;
      final v = e.value;
      if (key == 'timestamp' && v is num) {
        out[key] = v.toInt();
      } else if (key == 'timestamp') {
        out[key] = int.tryParse(v?.toString() ?? '') ?? 0;
      } else {
        out[key] = v;
      }
    }
    return out;
  }

  void _onNotificationReceived(dynamic event) {
    final map = _normalizeNotificationEvent(event);
    if (map == null) return;

    final title = map['title']?.toString() ?? '';
    final text = map['text']?.toString() ?? '';
    final packageName = map['package']?.toString() ?? '';
    final rawTs = map['timestamp'];
    final timestamp = rawTs is num
        ? rawTs.toInt()
        : int.tryParse(rawTs?.toString() ?? '') ?? 0;

    final notificationText = '$packageName $title $text';

    if (kDebugMode) {
      debugPrint('Notificação recebida [$packageName]: $title | $text');
    }
    unawaited(_registrarDiagnostico('recebida', notificationText));

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

  String _dedupeId({
    required String uid,
    required String packageName,
    required String texto,
    required int timestamp,
  }) {
    return '$uid|$timestamp|$packageName|$texto';
  }

  Future<bool> _isDuplicate({
    required String uid,
    required String packageName,
    required String texto,
    required int timestamp,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final id = _dedupeId(
      uid: uid,
      packageName: packageName,
      texto: texto,
      timestamp: timestamp,
    );
    final ids = prefs.getStringList(_dedupeKey) ?? <String>[];
    return ids.contains(id);
  }

  Future<void> _marcarComoProcessada({
    required String uid,
    required String packageName,
    required String texto,
    required int timestamp,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final id = _dedupeId(
      uid: uid,
      packageName: packageName,
      texto: texto,
      timestamp: timestamp,
    );
    final ids = prefs.getStringList(_dedupeKey) ?? <String>[];
    if (ids.contains(id)) return;
    ids.add(id);
    if (ids.length > _dedupeMax) {
      ids.removeRange(0, ids.length - _dedupeMax);
    }
    await prefs.setStringList(_dedupeKey, ids);
  }

  Future<bool> _enqueuePendingTransaction({
    required String texto,
    required String packageName,
    required int timestamp,
    required TransacaoData transacaoData,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final list = <Map<String, dynamic>>[];
    final raw = prefs.getString(_pendingTxKey);
    if (raw != null && raw.isNotEmpty) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is List) {
          for (final e in decoded) {
            if (e is Map) {
              list.add(Map<String, dynamic>.from(e));
            }
          }
        }
      } catch (_) {}
    }

    final dup = list.any(
      (e) =>
          e['packageName'] == packageName &&
          e['timestamp'] == timestamp &&
          e['texto'] == texto,
    );
    if (dup) return false;

    list.add({
      'valor': transacaoData.valor,
      'descricao': transacaoData.descricao,
      'dataMillis': transacaoData.data.millisecondsSinceEpoch,
      'categoria': transacaoData.categoria,
      'tipoPagamento': transacaoData.tipoPagamento == TipoPagamento.credito
          ? 'credito'
          : 'debito',
      'limiteDisponivel': transacaoData.limiteDisponivel,
      'banco': _inferirBanco(packageName, texto),
      'packageName': packageName,
      'timestamp': timestamp,
      'texto': texto,
    });
    while (list.length > _pendingTxMax) {
      list.removeAt(0);
    }
    try {
      await prefs.setString(_pendingTxKey, jsonEncode(list));
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Grava na Firestore transações detetadas sem sessão (fila em [SharedPreferences]).
  Future<int> flushPendingTransactionsToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return 0;

    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_pendingTxKey);
    if (raw == null || raw.isEmpty) return 0;

    final List<Map<String, dynamic>> list;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return 0;
      list = <Map<String, dynamic>>[];
      for (final e in decoded) {
        if (e is Map) list.add(Map<String, dynamic>.from(e));
      }
    } catch (_) {
      return 0;
    }
    if (list.isEmpty) return 0;

    final remaining = <Map<String, dynamic>>[];
    var saved = 0;
    for (final e in list) {
      final valor = (e['valor'] as num?)?.toDouble();
      final descricao = e['descricao'] as String? ?? 'Gasto';
      final dataMillis = (e['dataMillis'] as num?)?.toInt();
      if (valor == null || dataMillis == null) continue;

      final t = TransacaoModel(
        valor: valor,
        descricao: descricao,
        data: DateTime.fromMillisecondsSinceEpoch(dataMillis),
        metodo: 'Notificação Bancária',
        categoria: e['categoria'] as String?,
        banco: e['banco'] as String?,
        tipoPagamento: e['tipoPagamento'] == 'credito'
            ? TipoPagamento.credito
            : TipoPagamento.debito,
        limiteDisponivel: (e['limiteDisponivel'] as num?)?.toDouble(),
      );

      final ok = await _repository.salvarTransacao(t);
      if (ok) {
        saved++;
        final pkg = e['packageName']?.toString() ?? '';
        final tx = e['texto']?.toString() ?? '';
        final ts = (e['timestamp'] as num?)?.toInt() ?? 0;
        await _marcarComoProcessada(
          uid: user.uid,
          packageName: pkg,
          texto: tx,
          timestamp: ts,
        );
      } else {
        remaining.add(e);
      }
    }

    if (remaining.isEmpty) {
      await prefs.remove(_pendingTxKey);
    } else {
      await prefs.setString(_pendingTxKey, jsonEncode(remaining));
    }
    return saved;
  }

  Future<void> _processarNotificacao(
    String texto, {
    required String packageName,
    required int timestamp,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final prefs = await SharedPreferences.getInstance();
    final enabled = prefs.getBool(_monitoringEnabledKey) ?? true;
    if (!enabled) {
      await _registrarDiagnostico('monitoramento pausado', texto);
      return;
    }

    final transacaoData = NotificationParserService.parse(texto);
    if (transacaoData == null) {
      await _registrarDiagnostico('ignorada pelo parser', texto);
      if (kDebugMode) {
        debugPrint('Notificação ignorada pelo parser: $texto');
      }
      return;
    }

    final dedupeUid = user?.uid ?? '_guest';
    if (await _isDuplicate(
      uid: dedupeUid,
      packageName: packageName,
      texto: texto,
      timestamp: timestamp,
    )) {
      await _registrarDiagnostico('duplicada', texto);
      return;
    }

    if (user == null) {
      final enqueued = await _enqueuePendingTransaction(
        texto: texto,
        packageName: packageName,
        timestamp: timestamp,
        transacaoData: transacaoData,
      );
      if (!enqueued) {
        await _registrarDiagnostico('fila local duplicada ou erro', texto);
        return;
      }
      await _marcarComoProcessada(
        uid: dedupeUid,
        packageName: packageName,
        texto: texto,
        timestamp: timestamp,
      );
      await _registrarDiagnostico(
        'fila local (inicie sessão para sincronizar)',
        '${transacaoData.descricao} - ${transacaoData.valor}',
      );
      debugPrint(
        'Transação detetada sem sessão — fila local (${transacaoData.descricao})',
      );
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
      await _marcarComoProcessada(
        uid: user.uid,
        packageName: packageName,
        texto: texto,
        timestamp: timestamp,
      );
      await _registrarDiagnostico(
        'salva no histórico',
        '${transacaoData.descricao} - ${transacaoData.valor}',
      );
      debugPrint(
        'Transação salva: ${transacaoData.descricao} - R\$ ${transacaoData.valor}',
      );
    } else {
      await _registrarDiagnostico('falha ao salvar', texto);
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

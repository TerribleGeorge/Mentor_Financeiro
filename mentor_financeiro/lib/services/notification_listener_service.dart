import 'dart:async';
import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'daily_spend_limit_notifier.dart';
import '../models/transacao_model.dart';
import 'local_transaction_store.dart';

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
    'compra aprovada no débito',
    'compra aprovada no debito',
    'compra aprovada no crédito',
    'compra aprovada no credito',
    'compra realizada',
    'compra efetuada',
    'compra confirmada',
    'compra autorizada',
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
    'transação autorizada',
    'transacao autorizada',
    'transação realizada',
    'transacao realizada',
    'debito',
    'débito',
    'débito aprovado',
    'debito aprovado',
    'débito autorizado',
    'debito autorizado',
    'débito realizado',
    'debito realizado',
    'cartao',
    'cartão',
    'cartão final',
    'cartao final',
    'cartão usado',
    'cartao usado',
    'cartão utilizado',
    'cartao utilizado',
    'compra no crédito',
    'compra no credito',
    'compra no débito',
    'compra no debito',
    'crédito aprovado',
    'credito aprovado',
    'crédito autorizado',
    'credito autorizado',
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
    'aproximação',
    'aproximacao',
    'compra por aproximação',
    'compra por aproximacao',
    'pagamento por aproximação',
    'pagamento por aproximacao',
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
    'valor debitado da conta',
    'lançamento',
    'lancamento',
    'lançamento no cartão',
    'lancamento no cartao',
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
    'payment successful',
    'payment approved',
    'payment authorised',
    'payment authorized',
    'transaction approved',
    'transaction authorised',
    'transaction authorized',
    'transaction successful',
    'purchase approved',
    'purchase successful',
    'debit card purchase',
    'credit card purchase',
    'card payment',
    'card transaction',
    'card ending',
    'card ending in',
    'card ending with',
    'card spent',
    'pos purchase',
    'point of sale',
    'merchant',
    'tap to pay',
    'contactless payment',
    'paid to',
    'spent at',
    'spent on',
    'charged at',
    'charged by',
    // ES
    'compra aprobada',
    'compra realizada',
    'compra autorizada',
    'pago aprobado',
    'pago realizado',
    'pago autorizado',
    'transacción aprobada',
    'transaccion aprobada',
    'transacción realizada',
    'transaccion realizada',
    'tarjeta terminada',
    'tarjeta final',
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
    'paiement approuvé',
    'paiement autorisé',
    'paiement réussi',
    'transaction approuvée',
    'transaction autorisée',
    'achat approuvé',
    'achat autorisé',
    'carte se terminant',
    'paiement sans contact',
    'achat',
    'débit',
    'retrait',
    'virement',
    'virement vers',
    // DE
    'zahlung',
    'zahlung erfolgreich',
    'zahlung autorisiert',
    'transaktion genehmigt',
    'transaktion erfolgreich',
    'kartenzahlung',
    'karte endet',
    'kontaktlos',
    'kauf',
    'abbuchung',
    'abhebung',
    'überweisung',
    'ueberweisung',
    'gesendet an',
    // IT
    'pagamento',
    'pagamento approvato',
    'pagamento autorizzato',
    'pagamento riuscito',
    'transazione approvata',
    'transazione autorizzata',
    'acquisto approvato',
    'carta terminante',
    'pagamento contactless',
    'acquisto',
    'addebito',
    'prelievo',
    'bonifico',
    'inviato a',
    // Global wallets / fintech
    'apple pay',
    'google pay',
    'samsung pay',
    'wallet payment',
    'mobile payment',
    'online payment',
    'bank card',
    'visa debit',
    'visa credit',
    'mastercard debit',
    'mastercard credit',
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
    'compra recusada',
    'compra negada',
    'compra cancelada',
    'compra não aprovada',
    'compra nao aprovada',
    'pagamento recusado',
    'pagamento negado',
    'pagamento cancelado',
    'transação recusada',
    'transacao recusada',
    'transaction declined',
    'purchase declined',
    'payment declined',
    'transaction cancelled',
    'transaction canceled',
    'purchase cancelled',
    'purchase canceled',
    'payment cancelled',
    'payment canceled',
    'not approved',
    'declined',
    'rechazad',
    'denegad',
    'cancelad',
    'refusé',
    'refuse',
    'annulé',
    'annule',
    'abgelehnt',
    'storniert',
    'rifiutat',
    'annullat',
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
    'pago recibido',
    'depósito recibido',
    'deposito recibido',
    'paiement reçu',
    'virement reçu',
    'einzahlung erhalten',
    'zahlung erhalten',
    'pagamento ricevuto',
    'bonifico ricevuto',
  ];

  /// Padrões multilingues de **saída de dinheiro** (complementam palavras-chave).
  static final List<RegExp> _spendPhraseRegexes = [
    RegExp(
      r'\b(?:compra|purchase)\b.{0,100}?(?:r\$|€|£|\$|usd|eur|gbp)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\bcompra\s+(?:no\s+)?(?:d[eé]bito|cr[eé]dito)\s+aprovad[ao]\b',
      caseSensitive: false,
    ),
    RegExp(
      r'\bcompra\s+de\s+(?:r\$|€|£|\$)\s*[\d.,]+\s+em\s+.{2,80}?\s+foi\s+aprovad[ao]\b',
      caseSensitive: false,
    ),
    RegExp(
      r'\bcompra\s+(?:efetuad[ao]|realizad[ao]|confirmad[ao]|autorizad[ao])\b.{0,90}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:d[eé]bito|cr[eé]dito)\s+(?:aprovad[ao]|autorizad[ao]|realizad[ao])\b.{0,90}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:transa[cç][aã]o|lan[cç]amento)\s+(?:aprovad[ao]|autorizad[ao]|realizad[ao])\b.{0,90}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\bcart[aã]o\s+(?:final|terminado\s+em)\s*\*{0,4}\d{4}\b.{0,100}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:pagamento|compra)\s+por\s+aproxima[cç][aã]o\b.{0,100}?(?:r\$|€|£|\$)\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:payment|transaction|purchase|card\s+payment|pos\s+purchase)\s+(?:approved|authori[sz]ed|successful|completed)\b.{0,120}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:approved|authori[sz]ed|successful|completed)\b.{0,80}?\b(?:payment|transaction|purchase|card)\b.{0,120}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:card|visa|mastercard|amex|discover)\b.{0,45}?(?:ending|ending\s+in|final|terminad[ao]|se\s+terminant|endet|terminante)\b.{0,30}?\d{2,4}.{0,120}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:tap\s+to\s+pay|contactless|sans\s+contact|kontaktlos|contactless\s+payment|aproxima[cç][aã]o)\b.{0,120}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:merchant|comerciante|establecimiento|commerce|händler|haendler|esercente)\b.{0,80}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:compra|pago|transacci[oó]n)\s+(?:aprobada|autorizada|realizada|exitosa)\b.{0,120}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:paiement|transaction|achat)\s+(?:approuv[ée]e?|autoris[ée]e?|r[ée]ussi)\b.{0,120}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:zahlung|transaktion|kauf|kartenzahlung)\s+(?:erfolgreich|autorisiert|genehmigt)\b.{0,120}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
      caseSensitive: false,
    ),
    RegExp(
      r'\b(?:pagamento|transazione|acquisto)\s+(?:approvat[ao]|autorizzat[ao]|riuscit[ao])\b.{0,120}?(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]+',
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
    RegExp(
      r'\b(?:parcela|installment|instalment)\s*\d+\s*/\s*\d+',
      caseSensitive: false,
    ),
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
      r'(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*[\d.,]{2,}\s+(?:com|con|em|na|no|para|por|to|at|from|von|chez|with|in|for|a|en|de|da|di|bei)\s+\S{2,}',
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
    t = t.replaceAll('\u00A0', ' ');

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
      r'\bvalor\b\s*[:\-]?\s*(?:R\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})?\s*(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    ),
    // "no valor de R$ X" / "por R$ X" (PIX, faturas)
    RegExp(
      r'(?:no\s+valor\s+de|no valor de|por|amount|importe|montant|betrag|importo)\s+(?:R\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*(\d{1,3}(?:[.\s]\d{3})*(?:,\d{1,2})?|\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    ),
    // Símbolo antes (com separadores)
    RegExp(
      r'([€£¥₹₩₺₽₫₦₱₪₴$]|R\$)\s*(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    ),
    // Código ISO antes
    RegExp(
      r'\b(usd|eur|brl|gbp|jpy|inr|cad|aud|chf|mxn|ars|clp|cop|pen|uyu|nzd|sek|nok|dkk|pln|try|zar|sgd|hkd|krw|cny|thb|myr|idr|php|ils|aed|sar)\b\s*(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)',
      caseSensitive: false,
    ),
    // Valor antes do código (ex.: 12.34 USD)
    RegExp(
      r'(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)\s*\b(usd|eur|brl|gbp|jpy|inr|cad|aud|chf|mxn|ars|clp|cop|pen|uyu|nzd|sek|nok|dkk|pln|try|zar|sgd|hkd|krw|cny|thb|myr|idr|php|ils|aed|sar)\b',
      caseSensitive: false,
    ),
    // "12,34 reais" / "100 BRL"
    RegExp(
      r'\b(\d{1,3}(?:[.,\s]\d{3})*(?:[.,]\d{1,2})?|\d+(?:[.,]\d{1,2})?)\s*(?:reais?|real|brl|dollars?|euros?|pesos?|soles?|pounds?|yen|rupees?|liras?|rand|shekels?|dirhams?|riyals?)\b',
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
    RegExp(
      r'compra\s+de\s+(?:R\$|€|£|¥|₹|\$)\s*[\d.,]+\s+em\s+(.+?)\s+foi\s+aprovad[ao](?:[.\n]|$)',
      caseSensitive: false,
    ),
    RegExp(
      r'(?:d[eé]bito|cr[eé]dito)\s+aprovad[ao].*?\b(?:em|no|na)\s+(.+?)(?:\s*[-–—]\s*|\s+(?:R\$|€|£|¥|₹|\$)|[.\n]|$)',
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
      'chase',
      'jpmorgan',
      'bankofamerica',
      'bank of america',
      'bofa',
      'wellsfargo',
      'wells fargo',
      'capitalone',
      'capital one',
      'citibank',
      'citi',
      'td bank',
      'usbank',
      'us bank',
      'pnc',
      'truist',
      'ally',
      'rbc',
      'royal bank',
      'scotiabank',
      'scotia',
      'bmo',
      'cibc',
      'barclays',
      'hsbc',
      'lloyds',
      'natwest',
      'monzo',
      'starling',
      'deutsche',
      'commerzbank',
      'n26',
      'bunq',
      'ing',
      'bbva',
      'caixabank',
      'sabadell',
      'unicredit',
      'intesa',
      'bnp',
      'credit agricole',
      'societe generale',
      'credit mutuel',
      'dbs',
      'ocbc',
      'uob',
      'standard chartered',
      'maybank',
      'commbank',
      'westpac',
      'anz',
      'nab',
      'sbi',
      'hdfc',
      'icici',
      'axis bank',
      'kotak',
      'paytm',
      'phonepe',
      'mercado pago',
      'nequi',
      'daviplata',
      'bancolombia',
      'nu mexico',
      'uala',
      'rappi',
      'klarna',
      'sofi',
      'cash app',
      'cashapp',
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
      'transaction',
      'merchant',
      'pos',
      'contactless',
      'wallet',
      'authori',
      'successful',
      'completed',
      'aprob',
      'autoriz',
      'realiz',
      'paiement',
      'achat',
      'zahlung',
      'kauf',
      'abbuchung',
      'pagamento',
      'acquisto',
    ];
    return signals.any(t.contains);
  }

  /// Google Wallet / GPay no telemóvel: título = estabelecimento; texto = «R$ 25,00 com Nome».
  static final RegExp _walletValorComTitular = RegExp(
    r'(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|[a-z]{3})\s*\d{1,3}(?:[.\s]\d{3})*(?:,\d{2}|\.\d{2})\s+(?:com|with|con|chez|bei|da|di)\s+\S',
    caseSensitive: false,
  );

  static bool _looksLikeGoogleWalletTapPay(String t) {
    return _walletValorComTitular.hasMatch(t);
  }

  static bool isSmsPackage(String packageName) {
    final p = packageName.toLowerCase();
    return p.contains('android.mms') ||
        p.contains('android.messaging') ||
        p.contains('google.android.apps.messaging') ||
        p.contains('samsung.android.messaging') ||
        p.contains('com.miui.mms') ||
        p.contains('textra') ||
        p.contains('sms');
  }

  static bool isGooglePayPackage(String packageName) {
    final p = packageName.toLowerCase();
    return p.contains('google.android.apps.walletnfcrel') ||
        p.contains('google.android.apps.wallet') ||
        p.contains('google.android.gms') ||
        p.contains('google.android.apps.nbu.paisa.user') ||
        p.contains('gpay') ||
        p.contains('wallet');
  }

  /// Só trata como “confirmação Google Wallet / Pay” o que parece pagamento por aproximação.
  /// Evita registar ruído do [com.google.android.gms] (Play Services, etc.) como se fosse Wallet.
  static bool shouldTreatNotificationAsGoogleWalletOrPayTap({
    required String packageName,
    required String texto,
  }) {
    if (!isGooglePayPackage(packageName)) return false;
    final p = packageName.toLowerCase();
    final t = _sanitize(texto).toLowerCase();
    if (p.contains('walletnfcrel')) return true;
    if (p.contains('google.android.apps.wallet')) return true;
    if (p.contains('nbu.paisa')) return true;
    if (p.contains('gpay') && p.contains('google')) return true;
    if (p.contains('google.android.gms')) {
      return _looksLikeGoogleWalletTapPay(t) ||
          t.contains('google pay') ||
          t.contains('google wallet') ||
          t.contains('gpay') ||
          _walletValorComTitular.hasMatch(t);
    }
    if (p.contains('wallet')) {
      return _looksLikeGoogleWalletTapPay(t) ||
          t.contains('google pay') ||
          t.contains('google wallet');
    }
    return true;
  }

  static bool isTrustedBankPackage(String packageName) {
    final p = packageName.toLowerCase();
    const trustedFragments = <String>[
      'com.nu.',
      'br.com.inter',
      'br.com.intermedium',
      'br.com.caixa',
      'br.gov.caixa',
      'com.itau',
      'br.com.itau',
      'br.com.bradesco',
      'br.com.bb',
      'com.bb',
      'br.com.santander',
      'br.com.sicredi',
      'br.com.sicoob',
      'com.c6bank',
      'br.com.c6bank',
      'br.com.pagseguro',
      'com.pagseguro',
      'br.com.uol.ps',
      'com.mercadopago',
      'br.com.mercadopago',
      'com.picpay',
      'br.com.original',
      'br.com.bancopan',
      'br.com.banrisul',
      'br.com.btgpactual',
      'com.btgpactual',
      'br.com.xp',
      'br.com.neon',
      'com.neon',
      'br.com.willbank',
      'br.com.digio',
      'com.chase',
      'chase',
      'jpmorgan',
      'bankofamerica',
      'bofa',
      'wellsfargo',
      'capitalone',
      'capitalone.mobile',
      'citibank',
      'citi.mobile',
      'com.citi',
      'tdbank',
      'usbank',
      'pnc',
      'truist',
      'ally',
      'rbc',
      'scotiabank',
      'bmo',
      'cibc',
      'barclays',
      'hsbc',
      'lloyds',
      'natwest',
      'monzo',
      'starling',
      'deutschebank',
      'commerzbank',
      'n26',
      'bunq',
      'ing.mobile',
      'bbva',
      'caixabank',
      'sabadell',
      'unicredit',
      'intesasanpaolo',
      'bnpparibas',
      'creditagricole',
      'societegenerale',
      'creditmutuel',
      'dbs',
      'ocbc',
      'uob',
      'standardchartered',
      'maybank',
      'commbank',
      'westpac',
      'anz.android',
      'nab.mobile',
      'sbi',
      'hdfc',
      'icici',
      'axisbank',
      'kotak',
      'paytm',
      'phonepe',
      'nequi',
      'daviplata',
      'bancolombia',
      'uala',
      'klarna',
      'sofi',
      'cashapp',
      'venmo',
      'zelle',
      'paypal',
      'revolut',
      'wise',
    ];
    return trustedFragments.any(p.contains);
  }

  static bool isLikelyFinancialPackage(String packageName) {
    final p = packageName.toLowerCase();
    if (isTrustedBankPackage(p) || isGooglePayPackage(p)) return true;
    const fragments = <String>[
      'bank',
      'banco',
      'banque',
      'banca',
      'credit',
      'credito',
      'debit',
      'wallet',
      'pay',
      'card',
      'finance',
      'fintech',
      'money',
      'cash',
      'pix',
      'pos',
      'merchant',
    ];
    return fragments.any(p.contains);
  }

  /// Texto antes do primeiro « R$…» (título do estabelecimento), removendo o pacote à frente.
  static String? _comercianteAntesDoValor(String texto) {
    final m = RegExp(
      r'\s+(?:r\$|€|£|¥|₹|₩|₺|₽|₫|₦|₱|₪|₴|\$|usd|eur|brl|gbp|jpy|inr|cad|aud|chf|mxn|ars|clp|cop|pen|uyu|nzd|sek|nok|dkk|pln|try|zar|sgd|hkd|krw|cny|thb|myr|idr|php|ils|aed|sar)\s*[\d.,]+',
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
      String? raw;
      for (var i = 1; i <= m.groupCount; i++) {
        final candidate = m.group(i);
        if (candidate != null && RegExp(r'\d').hasMatch(candidate)) {
          raw = candidate;
          break;
        }
      }
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

enum NotificationTrustStatus {
  confirmed,
  pendingSecondFactor,
  suspicious,
  ignored,
}

class NotificationTrustDecision {
  final NotificationTrustStatus status;
  final String reason;

  const NotificationTrustDecision(this.status, this.reason);

  bool get isConfirmed => status == NotificationTrustStatus.confirmed;
  bool get isPending => status == NotificationTrustStatus.pendingSecondFactor;
  bool get isSuspicious => status == NotificationTrustStatus.suspicious;
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

/// Serviço Dart do **monitor de gastos por notificação** (Android).
///
/// **Não é** a permissão “Mostrar notificações” (POST_NOTIFICATIONS): o utilizador
/// tem de ativar **Acesso a notificações** para esta app nas definições do sistema.
///
/// Fluxo resumido:
/// 1. Kotlin ([CustomNotificationListener]) recebe eventos da barra → [sendNotification]
///    persiste sempre na fila nativa e envia cópia ao [EventChannel] se o Dart estiver a ouvir.
/// 2. [iniciar] subscreve o stream, chama [_drainPendingNotifications] (reprocessa fila) e
///    [sincronizarRecentes] (re-lê notificações ainda visíveis).
/// 3. [_processarNotificacao] aplica regras de confiança, parser e dedupe; só grava transação
///    quando o texto parece gasto e a origem é aceitável (ver diagnósticos se “nada acontece”).
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
  /// Histórico curto de ids para não contar a mesma notificação duas vezes (tamanho [_dedupeMax]).
  static const _dedupeKey = 'notification_dedupe_ids';
  static const _dedupeMax = 300;
  static const _monitoringEnabledKey = 'notif_monitoring_enabled';
  /// Últimos eventos para ecrã de diagnóstico / suporte (não é fonte de verdade financeira).
  static const _diagnosticsKey = 'notification_listener_diagnostics';
  static const _diagnosticsMax = 60;
  static const _pendingTxKey = 'notification_pending_tx_v1';
  static const _pendingTxMax = 40;
  static const _walletConfirmationsKey = 'notification_wallet_confirmations_v1';
  static const _pendingBankCandidatesKey =
      'notification_pending_bank_candidates_v1';
  static const _suspiciousNotificationsKey = 'notification_suspicious_items_v1';
  /// Só para emparelhar **mesmo valor** banco ↔ Google Wallet (a 2.ª notificação pode atrasar no POS).
  static const _walletPairWindowMillis = 25 * 60 * 1000;
  static const _securityRetentionMillis = 12 * 60 * 60 * 1000;
  static const _securityMaxItems = 30;
  static const _suspiciousMaxItems = 40;
  /// Migração única: volta a ligar a monitorização para o fluxo compra aprovada + Wallet.
  static const _monitoringWalletMigrateKey =
      'notif_monitoring_migrate_v5_wallet_correlation';

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
      // Android: leitor de notificações (definições especiais), não só POST_NOTIFICATIONS.
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
      final result = await _channel.invokeMethod<bool>(
        'openAppBatterySettings',
      );
      return result ?? false;
    } on PlatformException catch (e) {
      debugPrint('Erro ao abrir definições de bateria: ${e.message}');
      return false;
    }
  }

  Future<bool> solicitarRebindDoListener() async {
    try {
      final result = await _channel.invokeMethod<bool>('requestRebind');
      return result ?? false;
    } on PlatformException catch (e) {
      debugPrint('Erro ao religar listener nativo: ${e.message}');
      return false;
    }
  }

  Future<bool> listenerConectado() async {
    try {
      final result = await _channel.invokeMethod<bool>('isListenerConnected');
      return result ?? false;
    } on PlatformException catch (e) {
      debugPrint('Erro ao verificar conexão do listener: ${e.message}');
      return false;
    }
  }

  Future<bool> forcarReconexaoDoListener() async {
    try {
      final result = await _channel.invokeMethod<bool>(
        'forceReconnectListener',
      );
      return result ?? false;
    } on PlatformException catch (e) {
      debugPrint('Erro ao forçar reconexão do listener: ${e.message}');
      return false;
    }
  }

  Future<bool> _garantirListenerConectado() async {
    if (await listenerConectado()) return true;

    // Pedidos de rebind ajudam quando o SO matou o serviço mas a permissão continua concedida.
    await solicitarRebindDoListener();
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (await listenerConectado()) return true;

    await forcarReconexaoDoListener();
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    final connected = await listenerConectado();
    if (!connected) {
      await _registrarDiagnostico(
        'listener desconectado',
        'Permissão concedida, mas o Android ainda não conectou o serviço.',
      );
    }
    return connected;
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

  Future<List<Map<String, dynamic>>> _readJsonList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(key);
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

  Future<void> _writeJsonList(
    String key,
    List<Map<String, dynamic>> items,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().millisecondsSinceEpoch;
    items.removeWhere((e) {
      final ts = (e['timestamp'] as num?)?.toInt() ?? 0;
      return ts > 0 && now - ts > _securityRetentionMillis;
    });
    while (items.length > _securityMaxItems) {
      items.removeAt(0);
    }
    await prefs.setString(key, jsonEncode(items));
  }

  Future<void> _registrarSuspeita({
    required String texto,
    required String packageName,
    required int timestamp,
    required String motivo,
    TransacaoData? transacaoData,
  }) async {
    final list = await _readJsonList(_suspiciousNotificationsKey);
    final normalized = texto.replaceAll(RegExp(r'\s+'), ' ').trim();
    final exists = list.any(
      (e) =>
          e['packageName'] == packageName &&
          e['timestamp'] == timestamp &&
          e['texto'] == normalized,
    );
    if (!exists) {
      list.insert(0, {
        'motivo': motivo,
        'valor': transacaoData?.valor,
        'descricao': transacaoData?.descricao,
        'packageName': packageName,
        'timestamp': timestamp > 0
            ? timestamp
            : DateTime.now().millisecondsSinceEpoch,
        'texto': normalized,
      });
    }
    while (list.length > _suspiciousMaxItems) {
      list.removeLast();
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_suspiciousNotificationsKey, jsonEncode(list));
    await _registrarDiagnostico('suspeita: $motivo', normalized);
  }

  bool _amountMatches(double a, double b) => (a - b).abs() < 0.01;

  bool _timeMatchesForWalletBankPair(int a, int b) {
    if (a <= 0 || b <= 0) return true;
    return (a - b).abs() <= _walletPairWindowMillis;
  }

  Future<void> _registrarConfirmacaoGooglePay({
    required String texto,
    required String packageName,
    required int timestamp,
    required TransacaoData transacaoData,
  }) async {
    final list = await _readJsonList(_walletConfirmationsKey);
    list.add({
      'valor': transacaoData.valor,
      'descricao': transacaoData.descricao,
      'packageName': packageName,
      'timestamp': timestamp > 0
          ? timestamp
          : DateTime.now().millisecondsSinceEpoch,
      'texto': texto,
    });
    await _writeJsonList(_walletConfirmationsKey, list);
    await _registrarDiagnostico(
      'confirmação Google Pay',
      '${transacaoData.descricao} - ${transacaoData.valor}',
    );
  }

  Future<bool> _temConfirmacaoGooglePay({
    required double valor,
    required int timestamp,
  }) async {
    final list = await _readJsonList(_walletConfirmationsKey);
    final found = list.any((e) {
      final otherValor = (e['valor'] as num?)?.toDouble();
      final otherTs = (e['timestamp'] as num?)?.toInt() ?? 0;
      return otherValor != null &&
          _amountMatches(otherValor, valor) &&
          _timeMatchesForWalletBankPair(otherTs, timestamp);
    });
    await _writeJsonList(_walletConfirmationsKey, list);
    return found;
  }

  /// Remove uma confirmação Wallet já usada para fechar um par com o banco (evita duplicar).
  Future<void> _removerConfirmacaoGooglePayUsada(
    double valor,
    int timestamp,
  ) async {
    final list = await _readJsonList(_walletConfirmationsKey);
    list.removeWhere((e) {
      final v = (e['valor'] as num?)?.toDouble();
      final ts = (e['timestamp'] as num?)?.toInt() ?? 0;
      return v != null &&
          _amountMatches(v, valor) &&
          _timeMatchesForWalletBankPair(ts, timestamp);
    });
    await _writeJsonList(_walletConfirmationsKey, list);
  }

  Future<void> _guardarBancoAguardandoGooglePay({
    required String texto,
    required String packageName,
    required int timestamp,
    required TransacaoData transacaoData,
    String motivo = 'aguardando confirmação do Google Pay',
  }) async {
    final list = await _readJsonList(_pendingBankCandidatesKey);
    final exists = list.any(
      (e) =>
          e['packageName'] == packageName &&
          e['timestamp'] == timestamp &&
          e['texto'] == texto,
    );
    if (!exists) {
      list.add({
        'valor': transacaoData.valor,
        'descricao': transacaoData.descricao,
        'dataMillis': transacaoData.data.millisecondsSinceEpoch,
        'categoria': transacaoData.categoria,
        'tipoPagamento': transacaoData.tipoPagamento == TipoPagamento.credito
            ? 'credito'
            : 'debito',
        'limiteDisponivel': transacaoData.limiteDisponivel,
        'packageName': packageName,
        'timestamp': timestamp > 0
            ? timestamp
            : DateTime.now().millisecondsSinceEpoch,
        'texto': texto,
      });
    }
    await _writeJsonList(_pendingBankCandidatesKey, list);
    await _registrarDiagnostico(
      'pendente: $motivo',
      '${transacaoData.descricao} - ${transacaoData.valor}',
    );
  }

  TransacaoData? _transacaoDataFromPending(Map<String, dynamic> e) {
    final valor = (e['valor'] as num?)?.toDouble();
    final dataMillis = (e['dataMillis'] as num?)?.toInt();
    if (valor == null || dataMillis == null) return null;
    return TransacaoData(
      valor: valor,
      descricao: e['descricao'] as String? ?? 'Gasto identificado',
      data: DateTime.fromMillisecondsSinceEpoch(dataMillis),
      categoria: e['categoria'] as String?,
      tipoPagamento: e['tipoPagamento'] == 'credito'
          ? TipoPagamento.credito
          : TipoPagamento.debito,
      limiteDisponivel: (e['limiteDisponivel'] as num?)?.toDouble(),
    );
  }

  bool get estaAtivo => _subscription != null;

  /// Drena eventos guardados nativamente e relê notificações ainda visíveis.
  Future<void> sincronizarPendentes() async {
    await _drainPendingNotifications();
    await sincronizarRecentes();
  }

  /// Reprocessa notificações ainda presentes na bandeja do Android.
  ///
  /// Isso cobre compras feitas quando o Dart não recebeu o evento ao vivo, mas
  /// a notificação do banco/Google Pay continua visível nas últimas horas.
  Future<void> sincronizarRecentes({int hours = 24}) async {
    try {
      await _garantirListenerConectado();

      var raw = await _channel.invokeMethod<dynamic>(
        'scanActiveNotifications',
        {'hours': hours},
      );
      if (raw is! List) return;

      if (raw.isEmpty) {
        await _garantirListenerConectado();
        raw = await _channel.invokeMethod<dynamic>('scanActiveNotifications', {
          'hours': hours,
        });
        if (raw is! List) return;
      }

      for (final item in raw) {
        final map = _normalizeNotificationEvent(item);
        if (map != null) {
          await _onNotificationReceived(map);
        }
      }
      await _registrarDiagnostico(
        'sincronização recente',
        '${raw.length} notificações visíveis verificadas',
      );
    } on PlatformException catch (e) {
      debugPrint('Erro ao reler notificações recentes: ${e.message}');
    }
  }

  /// Quando o Google Wallet já gravou confirmação e o banco ficou pendente na fila local.
  Future<void> _reprocessarPendentesComConfirmacoesWalletExistentes() async {
    final wallets = await _readJsonList(_walletConfirmationsKey);
    if (wallets.isEmpty) return;
    for (final w in wallets) {
      final valor = (w['valor'] as num?)?.toDouble() ?? 0.0;
      final ts = (w['timestamp'] as num?)?.toInt() ?? 0;
      if (valor <= 0) continue;
      final transacaoData = TransacaoData(
        valor: valor,
        descricao: w['descricao'] as String? ?? 'Google Wallet',
        data: DateTime.fromMillisecondsSinceEpoch(
          ts > 0 ? ts : DateTime.now().millisecondsSinceEpoch,
        ),
        categoria: null,
        tipoPagamento: TipoPagamento.debito,
        limiteDisponivel: null,
      );
      await _processarBancosPendentesComGooglePay(transacaoData, ts);
    }
  }

  /// Inicia o stream **sem** disparar pedido de permissão automaticamente.
  /// Retorna `false` se a permissão ainda não foi concedida.
  Future<bool> iniciar() async {
    if (_subscription != null) {
      return true;
    }

    final hasPermission = await verificarPermissao();
    if (!hasPermission) {
      debugPrint(
        'Acesso ao leitor de notificações: OFF. Definições Android > '
        'Acesso especial à aplicação > Acesso a notificações > ative Mentor Financeiro.',
      );
      return false;
    }

    final prefsMigrate = await SharedPreferences.getInstance();
    if (prefsMigrate.getBool(_monitoringWalletMigrateKey) != true) {
      await prefsMigrate.setBool(_monitoringEnabledKey, true);
      await prefsMigrate.setBool(_monitoringWalletMigrateKey, true);
    }

    await _garantirListenerConectado();

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
    await sincronizarRecentes();
    await _reprocessarPendentesComConfirmacoesWalletExistentes();

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
      // Lê a fila JSON nativa sem a apagar; só remove entradas após processar cada uma (ack por id).
      final raw = await _channel.invokeMethod<dynamic>(
        'drainPendingNotifications',
      );
      if (raw is! List) return;

      final ackIds = <String>[];
      for (final item in raw) {
        final map = _normalizeNotificationEvent(item);
        if (map != null) {
          await _onNotificationReceived(map);
          final nativeKey = map['nativeKey']?.toString();
          if (nativeKey != null && nativeKey.isNotEmpty) {
            ackIds.add(nativeKey);
          }
        }
      }
      if (ackIds.isNotEmpty) {
        await _channel.invokeMethod<dynamic>('ackPendingNotifications', {
          'ids': ackIds,
        });
      }
      if (raw.isNotEmpty) {
        await _registrarDiagnostico(
          'fila nativa processada',
          '${ackIds.length} notificações confirmadas',
        );
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

  Future<void> _onNotificationReceived(dynamic event) async {
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

    await _processarNotificacao(
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

  bool _temComprovanteBancarioForte(String texto) {
    final t = texto.toLowerCase();
    final strongPatterns = <RegExp>[
      RegExp(r'\bcompra\b.{0,120}\baprovad[ao]\b', caseSensitive: false),
      RegExp(r'\baprovad[ao]\b.{0,100}\bcompra\b', caseSensitive: false),
      RegExp(r'\bsua\s+compra\b.{0,120}\baprovad', caseSensitive: false),
      RegExp(r'\bcompra\s+no\s+(?:d[eé]bito|cr[eé]dito)\b.{0,120}\baprovad', caseSensitive: false),
      RegExp(r'\bcompra\s+de\s+r\$\s*[\d.,]+\s+em\b', caseSensitive: false),
      RegExp(r'\bd[eé]bito\b.{0,60}\baprovad[ao]\b', caseSensitive: false),
      RegExp(r'\bcr[eé]dito\b.{0,60}\baprovad[ao]\b', caseSensitive: false),
      RegExp(
        r'\bcompra\b.{0,80}\b(?:efetuad[ao]|realizad[ao]|confirmad[ao]|autorizad[ao])\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:d[eé]bito|cr[eé]dito)\b.{0,80}\b(?:autorizad[ao]|realizad[ao]|confirmad[ao])\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:transa[cç][aã]o|lan[cç]amento)\b.{0,80}\b(?:aprovad[ao]|autorizad[ao]|realizad[ao])\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:payment|transaction|purchase|card\s+payment|pos\s+purchase)\b.{0,90}\b(?:approved|authori[sz]ed|successful|completed)\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:approved|authori[sz]ed|successful|completed)\b.{0,90}\b(?:payment|transaction|purchase|card)\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:compra|pago|transacci[oó]n)\b.{0,90}\b(?:aprobada|autorizada|realizada|exitosa)\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:paiement|transaction|achat)\b.{0,90}\b(?:approuv[ée]e?|autoris[ée]e?|r[ée]ussi)\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:zahlung|transaktion|kauf|kartenzahlung)\b.{0,90}\b(?:erfolgreich|autorisiert|genehmigt)\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:pagamento|transazione|acquisto)\b.{0,90}\b(?:approvat[ao]|autorizzat[ao]|riuscit[ao])\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\bcart[aã]o\s+(?:final|terminado\s+em)\s*\*{0,4}\d{4}\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\b(?:card|visa|mastercard|amex|discover)\b.{0,45}\b(?:ending|ending\s+in|final|terminad[ao]|se\s+terminant|endet|terminante)\b.{0,30}\d{2,4}\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\bpix\b.{0,80}\b(?:enviad[ao]|realizad[ao]|pago)\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\bpagamento\b.{0,80}\b(?:aprovad[ao]|realizad[ao]|pago)\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\bboleto\b.{0,80}\b(?:pago|liquidad[ao])\b',
        caseSensitive: false,
      ),
      RegExp(
        r'\btransfer[eê]ncia\b.{0,80}\b(?:enviad[ao]|realizad[ao])\b',
        caseSensitive: false,
      ),
    ];
    return strongPatterns.any((r) => r.hasMatch(t));
  }

  bool _pareceCompraPorCarteiraDigital(String texto) {
    final t = texto.toLowerCase();
    const walletSignals = <String>[
      'google pay',
      'google wallet',
      'gpay',
      'wallet',
      'nfc',
      'aproximação',
      'aproximacao',
      'contactless',
    ];
    return walletSignals.any(t.contains);
  }

  /// Sinais de que o banco fala em contactless / Google — pedimos o par com a notificação Wallet.
  bool _textoPedeCorrelacaoComGoogleWallet(String texto) {
    final t = texto.toLowerCase();
    const keys = [
      'google pay',
      'google wallet',
      'gpay',
      'contactless',
      'nfc',
      'aproximação',
      'aproximacao',
      'tap to pay',
      'tap and pay',
      'near field',
      'sem contato',
      'sem contacto',
      'pagamento por aproximação',
    ];
    return keys.any(t.contains);
  }

  Future<NotificationTrustDecision> _avaliarConfianca({
    required String texto,
    required String packageName,
    required int timestamp,
    required TransacaoData transacaoData,
  }) async {
    if (NotificationParserService.isSmsPackage(packageName)) {
      return const NotificationTrustDecision(
        NotificationTrustStatus.suspicious,
        'recebida por SMS',
      );
    }

    final pacoteConfiavel = NotificationParserService.isTrustedBankPackage(
      packageName,
    );
    final pacoteFinanceiroProvavel =
        NotificationParserService.isLikelyFinancialPackage(packageName);

    if (!pacoteConfiavel && !pacoteFinanceiroProvavel) {
      return const NotificationTrustDecision(
        NotificationTrustStatus.suspicious,
        'origem não reconhecida',
      );
    }

    final temCorrelacaoWallet = await _temConfirmacaoGooglePay(
      valor: transacaoData.valor,
      timestamp: timestamp,
    );
    if (temCorrelacaoWallet) {
      return const NotificationTrustDecision(
        NotificationTrustStatus.confirmed,
        'correlacionado com Google Wallet / Pay',
      );
    }

    final comprovanteForte = _temComprovanteBancarioForte(texto);
    final exigeSegundoFactorWallet = _textoPedeCorrelacaoComGoogleWallet(texto);

    if (comprovanteForte && exigeSegundoFactorWallet) {
      return const NotificationTrustDecision(
        NotificationTrustStatus.pendingSecondFactor,
        'compra aprovada/contactless: aguarde notificação do Google Wallet',
      );
    }

    if (comprovanteForte) {
      return NotificationTrustDecision(
        NotificationTrustStatus.confirmed,
        pacoteConfiavel
            ? 'banco confiável com comprovante forte'
            : 'app financeiro com comprovante forte',
      );
    }

    if (_pareceCompraPorCarteiraDigital(texto)) {
      return const NotificationTrustDecision(
        NotificationTrustStatus.pendingSecondFactor,
        'aguardando confirmação do Google Pay',
      );
    }

    return NotificationTrustDecision(
      NotificationTrustStatus.pendingSecondFactor,
      pacoteConfiavel
          ? 'banco confiável com texto incompleto'
          : 'app financeiro com texto incompleto',
    );
  }

  String _dedupeId({
    required String uid,
    required String packageName,
    required String texto,
    required int timestamp,
  }) {
    final normalizedText = texto.replaceAll(RegExp(r'\s+'), ' ').trim();
    return '$uid|$timestamp|$packageName|$normalizedText';
  }

  String _dedupeMinuteId({
    required String uid,
    required String packageName,
    required String texto,
    required int timestamp,
  }) {
    final normalizedText = texto
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    final minuteBucket = timestamp > 0 ? timestamp ~/ 60000 : 0;
    return '$uid|minute:$minuteBucket|$packageName|$normalizedText';
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
    final minuteId = _dedupeMinuteId(
      uid: uid,
      packageName: packageName,
      texto: texto,
      timestamp: timestamp,
    );
    final ids = prefs.getStringList(_dedupeKey) ?? <String>[];
    return ids.contains(id) || ids.contains(minuteId);
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
    final minuteId = _dedupeMinuteId(
      uid: uid,
      packageName: packageName,
      texto: texto,
      timestamp: timestamp,
    );
    final ids = prefs.getStringList(_dedupeKey) ?? <String>[];
    if (ids.contains(id) || ids.contains(minuteId)) return;
    ids.add(id);
    ids.add(minuteId);
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
    String? sourceId,
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
      'sourceId': sourceId,
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

  Future<void> _atualizarCacheLocalDeGastos(TransacaoModel transacao) async {
    final prefs = await SharedPreferences.getInstance();
    // Mesma chave que [HomeDailyLimitPanel] / [TelaHome]: acumula débito do dia para a barra "Limite hoje".
    final key =
        'gastos_${transacao.data.year}-${transacao.data.month.toString().padLeft(2, '0')}-${transacao.data.day.toString().padLeft(2, '0')}';
    final atual = prefs.getDouble(key) ?? 0.0;
    await prefs.setDouble(key, atual + transacao.valor);
    await DailySpendLimitNotifier.onSpendUpdated(
      prefs: prefs,
      gastosDayKey: key,
      newTotal: atual + transacao.valor,
    );
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

      final sourceId = e['sourceId']?.toString();
      final ok = await _repository.salvarTransacao(t);
      if (ok) {
        if (sourceId == null || sourceId.isEmpty) {
          await _atualizarCacheLocalDeGastos(t);
        } else {
          await LocalTransactionStore.removeBySourceId(sourceId);
        }
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
    // Toggle na página de monitorização; quando false, só regista diagnóstico.
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

    if (NotificationParserService.isSmsPackage(packageName)) {
      await _registrarSuspeita(
        texto: texto,
        packageName: packageName,
        timestamp: timestamp,
        motivo: 'recebida por SMS',
        transacaoData: transacaoData,
      );
      return;
    }

    if (NotificationParserService.isGooglePayPackage(packageName)) {
      if (!NotificationParserService.shouldTreatNotificationAsGoogleWalletOrPayTap(
        packageName: packageName,
        texto: texto,
      )) {
        await _registrarDiagnostico(
          'Google ignorado (não é confirmação Wallet/Pay)',
          texto,
        );
        return;
      }
      await _registrarConfirmacaoGooglePay(
        texto: texto,
        packageName: packageName,
        timestamp: timestamp,
        transacaoData: transacaoData,
      );
      await _processarBancosPendentesComGooglePay(transacaoData, timestamp);
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

    final decision = await _avaliarConfianca(
      texto: texto,
      packageName: packageName,
      timestamp: timestamp,
      transacaoData: transacaoData,
    );

    if (decision.isSuspicious) {
      await _registrarSuspeita(
        texto: texto,
        packageName: packageName,
        timestamp: timestamp,
        motivo: decision.reason,
        transacaoData: transacaoData,
      );
      return;
    }

    if (decision.isPending) {
      await _guardarBancoAguardandoGooglePay(
        texto: texto,
        packageName: packageName,
        timestamp: timestamp,
        transacaoData: transacaoData,
        motivo: decision.reason,
      );
      return;
    }

    await _salvarTransacaoConfirmada(
      texto: texto,
      packageName: packageName,
      timestamp: timestamp,
      transacaoData: transacaoData,
      dedupeUid: dedupeUid,
      user: user,
      motivoConfirmacao: decision.reason,
    );
  }

  Future<void> _processarBancosPendentesComGooglePay(
    TransacaoData googlePayData,
    int googlePayTimestamp,
  ) async {
    final list = await _readJsonList(_pendingBankCandidatesKey);
    if (list.isEmpty) return;

    final remaining = <Map<String, dynamic>>[];
    for (final e in list) {
      final pendingData = _transacaoDataFromPending(e);
      final pendingTs = (e['timestamp'] as num?)?.toInt() ?? 0;
      if (pendingData == null) continue;

      if (_amountMatches(pendingData.valor, googlePayData.valor) &&
          _timeMatchesForWalletBankPair(pendingTs, googlePayTimestamp)) {
        final pkg = e['packageName']?.toString() ?? '';
        final tx = e['texto']?.toString() ?? '';
        final user = FirebaseAuth.instance.currentUser;
        await _salvarTransacaoConfirmada(
          texto: tx,
          packageName: pkg,
          timestamp: pendingTs,
          transacaoData: pendingData,
          dedupeUid: user?.uid ?? '_guest',
          user: user,
          motivoConfirmacao: 'banco confiável + Google Pay',
        );
        await _removerConfirmacaoGooglePayUsada(
          googlePayData.valor,
          googlePayTimestamp,
        );
      } else {
        remaining.add(e);
      }
    }

    await _writeJsonList(_pendingBankCandidatesKey, remaining);
  }

  Future<void> _salvarTransacaoConfirmada({
    required String texto,
    required String packageName,
    required int timestamp,
    required TransacaoData transacaoData,
    required String dedupeUid,
    required User? user,
    String motivoConfirmacao = 'confirmada',
  }) async {
    final sourceId = LocalTransactionStore.sourceIdFor(
      uid: dedupeUid,
      packageName: packageName,
      texto: texto,
      timestamp: timestamp,
    );

    if (user == null) {
      final enqueued = await _enqueuePendingTransaction(
        texto: texto,
        packageName: packageName,
        timestamp: timestamp,
        transacaoData: transacaoData,
        sourceId: sourceId,
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

    await LocalTransactionStore.save(transacao, sourceId: sourceId);
    await _atualizarCacheLocalDeGastos(transacao);

    final sucesso = await _repository.salvarTransacao(transacao);
    if (sucesso) {
      await LocalTransactionStore.removeBySourceId(sourceId);
      await _marcarComoProcessada(
        uid: user.uid,
        packageName: packageName,
        texto: texto,
        timestamp: timestamp,
      );
      await _registrarDiagnostico(
        'salva no histórico: $motivoConfirmacao',
        '${transacaoData.descricao} - ${transacaoData.valor}',
      );
      debugPrint(
        'Transação salva: ${transacaoData.descricao} - R\$ ${transacaoData.valor}',
      );
    } else {
      await _enqueuePendingTransaction(
        texto: texto,
        packageName: packageName,
        timestamp: timestamp,
        transacaoData: transacaoData,
        sourceId: sourceId,
      );
      await _marcarComoProcessada(
        uid: user.uid,
        packageName: packageName,
        texto: texto,
        timestamp: timestamp,
      );
      await _registrarDiagnostico(
        'salva no aparelho; sincronização pendente',
        '${transacaoData.descricao} - ${transacaoData.valor}',
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

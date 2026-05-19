import 'package:flutter_test/flutter_test.dart';
import 'package:mentor_financeiro/models/transacao_model.dart';
import 'package:mentor_financeiro/services/notification_listener_service.dart';

/// Garante que o [NotificationParserService] classifica e extrai dados de
/// notificações de gasto de forma consistente (o listener Android depende disto).
void main() {
  group('NotificationParserService — bloqueios (não gasto)', () {
    test('bloqueia PIX recebido', () {
      const t = 'banco PIX recebido no valor de R\$ 100,00';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
      expect(NotificationParserService.parse(t), isNull);
    });

    test('bloqueia transferência recebida (EN)', () {
      const t =
          'bank Transfer received - R\$ 200,00 credited to your account';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('bloqueia credit received', () {
      const t = 'Credit received: R\$ 50,00';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('bloqueia compra recebida (entrada)', () {
      const t = 'banco Compra recebida no valor de R\$ 30,00';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('bloqueia saldo disponível informativo', () {
      const t = 'com.appbank Seu saldo disponível: R\$ 1.234,56';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('bloqueia limite de crédito informativo', () {
      const t =
          'com.appbank Seu limite de crédito disponível: R\$ 8.000,00';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('bloqueia OTP mesmo com valor no texto', () {
      const t =
          'banco Código de verificação: 882211. Compra R\$ 15,00 recusada.';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('bloqueia TED recebida', () {
      const t = 'agencia TED recebida R\$ 500,00';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('bloqueia compra negada no crédito por saldo insuficiente', () {
      const t =
          'com.bank Compra negada no crédito por saldo insuficiente R\$ 89,90 em LOJA';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
      expect(NotificationParserService.parse(t), isNull);
    });

    test('bloqueia compra não autorizada mesmo com valor e cartão', () {
      const t =
          'com.bank Compra de R\$ 120,00 no cartão final 1234 não foi autorizada';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
      expect(NotificationParserService.parse(t), isNull);
    });

    test('bloqueia declined por limite insuficiente', () {
      const t =
          'com.bank Credit card purchase denied: insufficient limit - R\$ 30,00';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
      expect(NotificationParserService.parse(t), isNull);
    });
  });

  group('NotificationParserService — compras e pagamentos (gasto)', () {
    test('inglês: purchase at merchant com USD (received no meio)', () {
      const t =
          'com.bank.app Purchase received at MERCHANT - USD 12.50 with your card';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(12.50, 0.001));
    });

    test('Nubank-style compra aprovada com valor BR', () {
      const t =
          'com.nu.bank Compra aprovada no IFOOD *IFOOD R\$ 45,90 com cartão final 1234';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(45.90, 0.001));
    });

    test('pagamento efetuado + Valor', () {
      const t =
          'br.com.itau Pagamento efetuado - CONTA DE LUZ Valor R\$ 120,35';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(120.35, 0.001));
    });

    test('PIX enviado para pessoa', () {
      const t =
          'com.intermedium PIX enviado para João Silva - R\$ 33,00 no dia 11/05';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(33, 0.001));
    });

    test('transferência enviada', () {
      const t =
          'br.com.bb Transferência enviada para Maria - R\$ 200,00';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(200, 0.001));
    });

    test('você gastou (carteira / banco)', () {
      const t =
          'com.nu.xxx Você gastou R\$ 12,00 no UBER *TRIP';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(12, 0.001));
    });

    test('compra no débito aprovada (PicPay / empilhado)', () {
      const t =
          'com.picpay Compra no débito aprovada Compra de R\$ 10,50 em MERCADO X';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(10.5, 0.001));
    });

    test('regex: authorized + valor USD', () {
      const t =
          'com.chase.sigandroid Authorized Merchant XYZ - \$19.99 purchase';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(19.99, 0.001));
    });

    test('regex: charged + GBP', () {
      const t = 'uk.bank.app You were charged £7.50 at TFL Travel';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(7.50, 0.001));
    });

    test('regex: final do cartão + valor', () {
      const t = 'br.com.santander Final 9876 · R\$ 88,00';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(88, 0.001));
    });

    test('boleto pago', () {
      const t =
          'com.bb.android Boleto pago - Valor R\$ 250,00 vencimento 10/05';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(250, 0.001));
    });

    test('assinatura / subscription + valor', () {
      const t =
          'com.google.android Subscrição Netflix renovação R\$ 39,90';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(39.90, 0.001));
    });

    test('contactless / tap', () {
      const t =
          'com.revolut.revolut Contactless payment R\$ 18,00 at CAFE CENTRAL';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(18, 0.001));
    });
  });

  group('NotificationParserService.extrairValor', () {
    test('milhares BR + vírgula decimal', () {
      const t = 'compra aprovada Valor R\$ 1.234,56 no cartão';
      expect(NotificationParserService.extrairValor(t), closeTo(1234.56, 0.001));
    });

    test('no valor de / por R\$ (PIX)', () {
      const t =
          'com.intermedium Aprovado no valor de R\$ 42,50 para Mercado';
      expect(NotificationParserService.extrairValor(t), closeTo(42.5, 0.001));
    });

    test('valor em reais por extenso', () {
      const t = 'Débito de 15,50 reais no estabelecimento X';
      expect(NotificationParserService.extrairValor(t), closeTo(15.5, 0.001));
    });

    test('ISO BRL após número', () {
      const t = 'Payment 99.00 brl approved';
      expect(NotificationParserService.extrairValor(t), closeTo(99, 0.001));
    });
  });

  group('NotificationParserService — Google Wallet', () {
    test('título + R\$ com titular', () {
      const t =
          'com.google.android.apps.walletnfcrel VO MARIQUINHA QUITANDA R\$ 25,00 com TerribleGeorge';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(25, 0.001));
      expect(p.descricao, 'VO MARIQUINHA QUITANDA');
    });
  });

  group('NotificationParserService — heurística banco BR', () {
    test('Inter: compra no débito sem keyword genérica extra', () {
      const t =
          'br.com.inter.dashboard Compra no débito — R\$ 7,99 em PADARIA X';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.valor, closeTo(7.99, 0.001));
    });
  });

  group('NotificationParserService.identificarTipoPagamento', () {
    test('marca crédito quando texto menciona cartão de crédito', () {
      const t =
          'com.bank Cartão de crédito final 1234 - Compra R\$ 50,00 em LOJA';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.tipoPagamento, TipoPagamento.credito);
    });

    test('marca crédito quando texto menciona crédito com acento', () {
      const t =
          'com.bank Compra aprovada no crédito R\$ 75,00 em LOJA';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.tipoPagamento, TipoPagamento.credito);
    });

    test('débito por omissão quando não há sinal de crédito', () {
      const t =
          'com.bank Débito em conta R\$ 22,00 em PADARIA';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final p = NotificationParserService.parse(t);
      expect(p, isNotNull);
      expect(p!.tipoPagamento, TipoPagamento.debito);
    });
  });
}

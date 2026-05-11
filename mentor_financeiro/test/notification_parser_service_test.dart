import 'package:flutter_test/flutter_test.dart';
import 'package:mentor_financeiro/services/notification_listener_service.dart';

void main() {
  group('NotificationParserService.incoming filter', () {
    test('allows English purchase text containing "received"', () {
      const t =
          'com.bank.app Purchase received at MERCHANT - USD 12.50 with your card';
      expect(NotificationParserService.isSpendingNotification(t), isTrue);
      final parsed = NotificationParserService.parse(t);
      expect(parsed, isNotNull);
      expect(parsed!.valor, closeTo(12.50, 0.001));
    });

    test('blocks pix recebido', () {
      const t = 'banco PIX recebido no valor de R\$ 100,00';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('blocks transfer received (incoming)', () {
      const t = 'bank Transfer received - R\$ 200,00 credited to your account';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });

    test('blocks credit received', () {
      const t = 'Credit received: R\$ 50,00';
      expect(NotificationParserService.isSpendingNotification(t), isFalse);
    });
  });

  group('NotificationParserService.extrairValor', () {
    test('parses BRL with thousands and decimal comma', () {
      const t = 'compra aprovada Valor R\$ 1.234,56 no cartão';
      expect(NotificationParserService.extrairValor(t), closeTo(1234.56, 0.001));
    });
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mentor_financeiro/models/transacao_model.dart';

void main() {
  group('TransacaoModel', () {
    test('fromMap parses debito and credito', () {
      final ts = Timestamp.fromDate(DateTime(2026, 4, 15));
      final m = TransacaoModel.fromMap({
        'valor': 10.5,
        'descricao': 'Teste',
        'data': ts,
        'metodo': 'Manual',
        'tipoPagamento': 'credito',
        'categoria': 'Alimentação',
      });
      expect(m.valor, 10.5);
      expect(m.tipoPagamento, TipoPagamento.credito);
      expect(m.categoria, 'Alimentação');
    });

    test('toMap round-trips tipoPagamento', () {
      final t = TransacaoModel(
        valor: 20,
        descricao: 'X',
        data: DateTime(2026, 1, 2),
        metodo: 'M',
        tipoPagamento: TipoPagamento.debito,
      );
      final map = t.toMap();
      expect(map['tipoPagamento'], 'debito');
      final again = TransacaoModel.fromMap(map);
      expect(again.tipoPagamento, TipoPagamento.debito);
    });
  });
}

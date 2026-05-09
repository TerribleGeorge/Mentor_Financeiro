import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../models/transacao_model.dart';
import 'localization_service.dart';

/// Gera o PDF do relatório mensal com os mesmos dados filtrados que o ecrã mostra.
abstract final class RelatorioPdfExporter {
  static String _money(double v) => LocalizationService.formatCurrency(v);

  static String _tipoLabel(TipoPagamento t) =>
      t == TipoPagamento.credito ? 'Crédito' : 'Débito';

  static Future<Uint8List> build({
    required DateTime month,
    required List<TransacaoModel> transacoes,
    required String filtroLabel,
    String? geradoPara,
  }) async {
    final mesTitulo = DateFormat('MMMM yyyy', 'pt_BR').format(month);
    final geradoEm = DateFormat(
      "dd/MM/yyyy 'às' HH:mm",
      'pt_BR',
    ).format(DateTime.now());

    final total = transacoes.fold<double>(0, (a, t) => a + t.valor);
    final diasNoMes = DateTime(month.year, month.month + 1, 0).day;
    final mediaPorDia = diasNoMes > 0 ? total / diasNoMes : 0.0;

    final porCategoria = <String, double>{};
    for (final t in transacoes) {
      final c = t.categoria ?? 'Outros';
      porCategoria[c] = (porCategoria[c] ?? 0) + t.valor;
    }
    final ordenadas = List<TransacaoModel>.from(transacoes)
      ..sort((a, b) => b.data.compareTo(a.data));

    final totalCredito = transacoes
        .where((t) => t.isCredito)
        .fold<double>(0, (a, t) => a + t.valor);
    final totalDebito = transacoes
        .where((t) => t.isDebito)
        .fold<double>(0, (a, t) => a + t.valor);

    final doc = pw.Document();
    const edgeInsets = pw.EdgeInsets.all(40);

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: edgeInsets,
        build: (context) => [
          pw.Text(
            'Mentor Financeiro',
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'Relatório mensal',
            style: pw.TextStyle(fontSize: 14, color: PdfColors.grey800),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            mesTitulo,
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            'Gerado em: $geradoEm',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Text(
            'Filtro de pagamento: $filtroLabel',
            style: const pw.TextStyle(fontSize: 9),
          ),
          if (geradoPara != null && geradoPara.trim().isNotEmpty)
            pw.Text(
              'Cliente: ${geradoPara.trim()}',
              style: const pw.TextStyle(fontSize: 9),
            ),
          pw.SizedBox(height: 16),
          pw.Text(
            'Resumo',
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 6),
          _kvTable(
            rows: [
              ('Total do período', _money(total)),
              ('Número de transações', '${transacoes.length}'),
              ('Média por dia (mês de $diasNoMes dias)', _money(mediaPorDia)),
              ('Total em cartão de crédito', _money(totalCredito)),
              ('Total em débito / outros', _money(totalDebito)),
            ],
          ),
          if (porCategoria.isNotEmpty) ...[
            pw.SizedBox(height: 16),
            pw.Text(
              'Gastos por categoria',
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 6),
            _categoriaTable(porCategoria: porCategoria, totalGeral: total),
          ],
          pw.SizedBox(height: 16),
          pw.Text(
            'Lista de transações (${ordenadas.length})',
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 6),
          _transacoesTable(ordenadas: ordenadas),
          pw.SizedBox(height: 12),
          pw.Text(
            'Documento gerado pela app Mentor Financeiro. Os valores seguem a moeda de exibição configurada na app.',
            style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700),
          ),
        ],
      ),
    );

    return doc.save();
  }

  static pw.Widget _kvTable({required List<(String, String)> rows}) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(2.2),
        1: const pw.FlexColumnWidth(1.8),
      },
      children: rows.map((r) {
        return pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(
                r.$1,
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(r.$2, style: const pw.TextStyle(fontSize: 9)),
            ),
          ],
        );
      }).toList(),
    );
  }

  static pw.Widget _categoriaTable({
    required Map<String, double> porCategoria,
    required double totalGeral,
  }) {
    final entries = porCategoria.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(2),
        1: const pw.FlexColumnWidth(1.2),
        2: const pw.FlexColumnWidth(0.8),
      },
      children: [
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey300),
          children: [
            _cellPad('Categoria', bold: true),
            _cellPad('Valor', bold: true),
            _cellPad('%', bold: true),
          ],
        ),
        ...entries.map((e) {
          final pct = totalGeral > 0 ? (e.value / totalGeral * 100) : 0.0;
          return pw.TableRow(
            children: [
              _cellPad(e.key),
              _cellPad(_money(e.value)),
              _cellPad('${pct.toStringAsFixed(1)}%'),
            ],
          );
        }),
      ],
    );
  }

  static pw.Widget _cellPad(String t, {bool bold = false}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(5),
      child: pw.Text(
        t,
        style: pw.TextStyle(
          fontSize: 8,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
      ),
    );
  }

  static pw.Widget _transacoesTable({required List<TransacaoModel> ordenadas}) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(0.72),
        1: const pw.FlexColumnWidth(1.5),
        2: const pw.FlexColumnWidth(0.75),
        3: const pw.FlexColumnWidth(0.55),
        4: const pw.FlexColumnWidth(0.75),
      },
      children: [
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey300),
          children: [
            _cellPad('Data', bold: true),
            _cellPad('Descrição', bold: true),
            _cellPad('Categoria', bold: true),
            _cellPad('Tipo', bold: true),
            _cellPad('Valor', bold: true),
          ],
        ),
        ...ordenadas.map((t) {
          final dataStr = DateFormat('dd/MM/yy').format(t.data);
          final desc = t.descricao.length > 42
              ? '${t.descricao.substring(0, 39)}…'
              : t.descricao;
          final cat = (t.categoria ?? '—').length > 14
              ? '${(t.categoria ?? '').substring(0, 11)}…'
              : (t.categoria ?? '—');
          return pw.TableRow(
            children: [
              _cellPad(dataStr),
              _cellPad(desc),
              _cellPad(cat),
              _cellPad(_tipoLabel(t.tipoPagamento)),
              _cellPad(_money(t.valor)),
            ],
          );
        }),
      ],
    );
  }
}

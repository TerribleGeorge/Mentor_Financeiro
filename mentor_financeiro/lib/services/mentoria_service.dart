import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transacao_model.dart';

enum TipoDica { alerta, oportunidade, goldenDay, perigo, nenhuma }

class DicaFinanceira {
  final TipoDica tipo;
  final String titulo;
  final String mensagem;
  final ColorTypeEnum colorTypeEnum;

  DicaFinanceira({
    required this.tipo,
    required this.titulo,
    required this.mensagem,
    required this.colorTypeEnum,
  });
}

enum ColorTypeEnum { orange, green, red, blue }

class NotaSaudeFinanceira {
  final double nota;
  final String diagnostico;
  final List<String> pontosPositivos;
  final List<String> pontosNegativos;

  NotaSaudeFinanceira({
    required this.nota,
    required this.diagnostico,
    required this.pontosPositivos,
    required this.pontosNegativos,
  });
}

class MentoriaService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<Map<String, dynamic>?> buscarDadosUsuario(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    return doc.data();
  }

  static Future<double> buscarSaldoConta(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    final saldo = doc.get('saldoConta');
    return saldo is num ? saldo.toDouble() : 0.0;
  }

  static Future<double> buscarRendaMensal(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    final renda = doc.get('rendaMensal');
    return renda is num ? renda.toDouble() : 0.0;
  }

  static Future<bool> usuarioTemInvestimentos(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    final investimentos = doc.get('temInvestimentos');
    return investimentos == true;
  }

  static Future<int> buscarQuantidadeDiasSemJuros(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    final dias = doc.get('diasSemJuros');
    return dias is int ? dias : 0;
  }

  static Future<List<DicaFinanceira>> gerarDicas({
    required String uid,
    required List<TransacaoModel> transacoes,
  }) async {
    final List<DicaFinanceira> dicas = [];
    final dadosUsuario = await buscarDadosUsuario(uid);
    if (dadosUsuario == null) return dicas;

    final limiteCartao =
        (dadosUsuario['limiteTotalCartao'] as num?)?.toDouble() ?? 0.0;
    final diaFechamento = dadosUsuario['diaFechamentoFatura'] as int? ?? 0;
    final saldoConta = await buscarSaldoConta(uid);
    final rendaMensal = await buscarRendaMensal(uid);

    if (limiteCartao > 0 && diaFechamento > 0) {
      double gastoCredito = 0.0;
      for (final t in transacoes) {
        if (t.tipoPagamento == TipoPagamento.credito) {
          gastoCredito += t.valor;
        }
      }
      final percentualGasto = limiteCartao > 0
          ? gastoCredito / limiteCartao
          : 0.0;

      if (percentualGasto > 0.3 && percentualGasto <= 0.5) {
        dicas.add(
          DicaFinanceira(
            tipo: TipoDica.alerta,
            titulo: 'Dica: Regra dos 30%',
            mensagem:
                'Tente manter seu uso abaixo de 30% para melhorar seu Score Bancário.',
            colorTypeEnum: ColorTypeEnum.orange,
          ),
        );
      }

      if (percentualGasto > 0.5) {
        dicas.add(
          DicaFinanceira(
            tipo: TipoDica.alerta,
            titulo: 'Alerta de Gastos',
            mensagem:
                'Você já usou ${(percentualGasto * 100).toStringAsFixed(0)}% do limite.',
            colorTypeEnum: ColorTypeEnum.red,
          ),
        );
      }

      final agora = DateTime.now();
      final diaAtual = agora.day;
      final diasAteFechamento = diaFechamento - diaAtual;
      final diaVencimentoFatura = diaFechamento + 10;
      final diasAteVencimento = diaVencimentoFatura - diaAtual;

      if (diasAteFechamento == 1 ||
          (diaFechamento == 1 &&
              agora.day == DateTime(agora.year, agora.month + 1, 0).day)) {
        dicas.add(
          DicaFinanceira(
            tipo: TipoDica.goldenDay,
            titulo: '🌟 Dia de Ouro!',
            mensagem: 'Suas compras hoje só serão pagas daqui a 40 dias!',
            colorTypeEnum: ColorTypeEnum.green,
          ),
        );
      }

      if (diasAteFechamento >= 0 && diasAteFechamento < 5) {
        final valorFatura = gastoCredito;
        if (saldoConta < valorFatura && rendaMensal > 0) {
          dicas.add(
            DicaFinanceira(
              tipo: TipoDica.perigo,
              titulo: '⚠️ Cuidado: Juros',
              mensagem:
                  'Seu saldo não cobre a fatura de ${_formatarMoeda(valorFatura)}. Evite o crédito rotativo!',
              colorTypeEnum: ColorTypeEnum.red,
            ),
          );
        } else if (saldoConta < valorFatura * 0.5) {
          dicas.add(
            DicaFinanceira(
              tipo: TipoDica.alerta,
              titulo: 'Atenção: Saldo Baixo',
              mensagem:
                  'Seu saldo está baixo. Considere postergar compras não essenciais.',
              colorTypeEnum: ColorTypeEnum.orange,
            ),
          );
        }
      }

      if (diasAteVencimento <= 2 &&
          diasAteVencimento > 0 &&
          saldoConta < limiteCartao * 0.3) {
        dicas.add(
          DicaFinanceira(
            tipo: TipoDica.perigo,
            titulo: 'Fatura vencendo',
            mensagem:
                'Fatura vence em $diasAteVencimento dia(s). Verifique seu saldo.',
            colorTypeEnum: ColorTypeEnum.red,
          ),
        );
      }
    }

    return dicas;
  }

  static String _formatarMoeda(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2)}';
  }

  static Future<NotaSaudeFinanceira> calcularNotaSaude({
    required String uid,
    required List<TransacaoModel> transacoes,
  }) async {
    final dadosUsuario = await buscarDadosUsuario(uid);
    final saldoConta = await buscarSaldoConta(uid);
    final rendaMensal = await buscarRendaMensal(uid);
    final temInvestimentos = await usuarioTemInvestimentos(uid);
    final diasSemJuros = await buscarQuantidadeDiasSemJuros(uid);

    double nota = 5.0;
    final List<String> pontosPositivos = [];
    final List<String> pontosNegativos = [];

    final limiteCartao =
        (dadosUsuario?['limiteTotalCartao'] as num?)?.toDouble() ?? 0.0;
    final diaFechamento = dadosUsuario?['diaFechamentoFatura'] as int? ?? 0;

    double gastoCredito = 0.0;
    double gastoDebito = 0.0;
    for (final t in transacoes) {
      if (t.tipoPagamento == TipoPagamento.credito) {
        gastoCredito += t.valor;
      } else {
        gastoDebito += t.valor;
      }
    }
    final gastoTotal = gastoCredito + gastoDebito;

    if (rendaMensal > 0 && gastoTotal < rendaMensal * 0.8) {
      nota += 1.5;
      pontosPositivos.add('Gasta menos do que ganha');
    } else if (rendaMensal > 0 && gastoTotal > rendaMensal) {
      nota -= 1.5;
      pontosNegativos.add('Gasta mais do que ganha');
    }

    if (saldoConta > 0) {
      nota += 1.0;
      pontosPositivos.add('Tem saldo positivo');
    } else if (saldoConta < 0) {
      nota -= 2.0;
      pontosNegativos.add('Saldo negativo');
    }

    if (limiteCartao > 0) {
      final percentual = gastoCredito / limiteCartao;
      if (percentual <= 0.3) {
        nota += 1.5;
        pontosPositivos.add('Uso responsável do crédito');
      } else if (percentual > 0.5) {
        nota -= 1.5;
        pontosNegativos.add('Estourou o limite');
      }
    }

    if (diasSemJuros >= 30) {
      nota += 1.0;
      pontosPositivos.add('Usa o Dia de Ouro');
    }

    if (temInvestimentos) {
      nota += 1.5;
      pontosPositivos.add('Investe regularmente');
    }

    if (diasSemJuros == 0) {
      nota -= 1.5;
      pontosNegativos.add('Pagou juros recently');
    }

    if (diaFechamento > 0) {
      final agora = DateTime.now();
      final diaAtual = agora.day;
      final diasAteFechamento = diaFechamento - diaAtual;
      if (diasAteFechamento == 1) {
        nota += 0.5;
        pontosPositivos.add('Planejou o fechamento');
      }
    }

    if (nota > 10) nota = 10;
    if (nota < 0) nota = 0;

    String diagnostico;
    if (nota >= 8) {
      diagnostico = 'Excelente! Você tem saúde financeira.';
    } else if (nota >= 6) {
      diagnostico = 'Bom, mas pode melhorar.';
    } else if (nota >= 4) {
      diagnostico = 'Atenção aos gastos.';
    } else {
      diagnostico = 'Revise suas finanças.';
    }

    return NotaSaudeFinanceira(
      nota: nota,
      diagnostico: diagnostico,
      pontosPositivos: pontosPositivos,
      pontosNegativos: pontosNegativos.isEmpty
          ? ['Continue assim!']
          : pontosNegativos,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  // ==============================================================================
  // MÓDULOS / LIÇÕES (Mentoria v2)
  // ==============================================================================
  static const String _prefsMentoriaCompletedLessonsKey =
      'mentoria_completed_lessons_v1';

  static List<MentoriaModule> modules() {
    return const [
      MentoriaModule(
        id: 'mindset',
        title: 'Mentalidade e Comportamento',
        subtitle: 'Diagnóstico de vícios de consumo e reeducação psicológica.',
        accent: 0xFF00E5FF,
        lessons: [
          MentoriaLesson(
            id: 'mindset_01_triggers',
            title: 'Gatilhos de Consumo',
            videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            blocks: [
              MentoriaContentBlock.paragraph(
                'Você não compra “coisas”. Você compra alívio, status, pertencimento ou distração.',
              ),
              MentoriaContentBlock.bullets([
                'Identifique 3 gatilhos: tédio, ansiedade, recompensa.',
                'Quando o gatilho aparecer, adie a compra por 24h.',
                'Troque o hábito: caminhada curta, água, respiração 4-7-8.',
              ]),
            ],
            checkpoint: MentoriaCheckpoint(
              title: 'Exercício',
              prompt:
                  'Escreva 1 gatilho que te faz gastar e 1 alternativa saudável para ele.',
            ),
          ),
        ],
      ),
      MentoriaModule(
        id: 'spending_engineering',
        title: 'Engenharia de Gastos',
        subtitle: 'Separação por baldes: Essencial, Lazer, Investimento.',
        accent: 0xFF6366F1,
        lessons: [
          MentoriaLesson(
            id: 'engine_01_buckets',
            title: 'Os 3 Baldes',
            videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            blocks: [
              MentoriaContentBlock.paragraph(
                'Seu dinheiro precisa de “trilhos”. Sem trilho, ele vaza.',
              ),
              MentoriaContentBlock.bullets([
                'Essencial: moradia, comida, contas, saúde.',
                'Lazer: escolhas conscientes (não automático).',
                'Investimento: pagar o seu “eu do futuro” primeiro.',
              ]),
            ],
            checkpoint: MentoriaCheckpoint(
              title: 'Checkpoint',
              prompt:
                  'Defina um percentual inicial para cada balde (ex.: 70/20/10).',
            ),
          ),
        ],
      ),
      MentoriaModule(
        id: 'wealth_protection',
        title: 'Proteção de Patrimônio',
        subtitle: 'Fundo de emergência e seguros (blindagem).',
        accent: 0xFFFFD166,
        lessons: [
          MentoriaLesson(
            id: 'protect_01_emergency',
            title: 'Fundo de Emergência',
            videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            blocks: [
              MentoriaContentBlock.paragraph(
                'Sem fundo de emergência, qualquer imprevisto vira dívida.',
              ),
              MentoriaContentBlock.bullets([
                'Meta mínima: 1 mês de custos essenciais.',
                'Meta ideal: 3 a 6 meses.',
                'Automatize: aporte fixo no início do mês.',
              ]),
            ],
            checkpoint: MentoriaCheckpoint(
              title: 'Checkpoint',
              prompt: r'Qual é sua meta de fundo de emergência (R$) para 30 dias?',
            ),
          ),
        ],
      ),
      MentoriaModule(
        id: 'freedom_acceleration',
        title: 'Aceleração de Liberdade',
        subtitle: 'Aumentar renda e usar juros compostos.',
        accent: 0xFFFF2D2D,
        lessons: [
          MentoriaLesson(
            id: 'freedom_01_income',
            title: 'Aumentando a Renda',
            videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            blocks: [
              MentoriaContentBlock.paragraph(
                'O jogo acelera quando você aumenta a entrada e reduz vazamentos.',
              ),
              MentoriaContentBlock.bullets([
                'Liste 2 skills monetizáveis que você já tem.',
                'Crie uma oferta simples (serviço/produto) e valide.',
                'Direcione a renda extra: primeiro dívida → fundo → investir.',
              ]),
            ],
            checkpoint: MentoriaCheckpoint(
              title: 'Exercício',
              prompt: r'Qual renda extra mensal (R$) você quer atingir em 60 dias?',
            ),
          ),
        ],
      ),
    ];
  }

  static Future<Set<String>> completedLessonIds() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList(_prefsMentoriaCompletedLessonsKey) ?? const [];
    return ids.toSet();
  }

  static Future<void> markLessonCompleted(String lessonId) async {
    final prefs = await SharedPreferences.getInstance();
    final ids = (prefs.getStringList(_prefsMentoriaCompletedLessonsKey) ?? const [])
        .toSet();
    ids.add(lessonId);
    await prefs.setStringList(_prefsMentoriaCompletedLessonsKey, ids.toList());
  }

  static int totalLessonsCount() {
    var total = 0;
    for (final m in modules()) {
      total += m.lessons.length;
    }
    return total;
  }

  static Future<double> mentorScoreProgress01() async {
    final done = await completedLessonIds();
    final total = totalLessonsCount();
    if (total <= 0) return 0;
    return (done.length / total).clamp(0.0, 1.0);
  }

  static Future<MentorLimitAlert?> mentorLimitAlertFromPrefs({
    required SharedPreferences prefs,
    required double dailyLimit,
  }) async {
    if (dailyLimit <= 0) return null;
    final now = DateTime.now();
    int streak = 0;
    for (int i = 0; i < 3; i++) {
      final d = now.subtract(Duration(days: i));
      final key = '${d.year.toString().padLeft(4, '0')}-'
          '${d.month.toString().padLeft(2, '0')}-'
          '${d.day.toString().padLeft(2, '0')}';
      final spent = prefs.getDouble('gastos_$key') ?? 0.0;
      if (spent > dailyLimit) {
        streak++;
      } else {
        break;
      }
    }
    if (streak >= 3) {
      return const MentorLimitAlert(
        title: 'Alerta do Mentor',
        message:
            'Você passou do seu limite diário por 3 dias seguidos. Hoje, use a regra do “adiar 24h” e corte 1 gasto automático.',
      );
    }
    return null;
  }

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

// ==============================================================================
// MODELOS DE CONTEÚDO (Mentoria)
// ==============================================================================

class MentoriaModule {
  const MentoriaModule({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.lessons,
  });

  final String id;
  final String title;
  final String subtitle;
  final int accent; // 0xAARRGGBB
  final List<MentoriaLesson> lessons;
}

class MentoriaLesson {
  const MentoriaLesson({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.blocks,
    required this.checkpoint,
  });

  final String id;
  final String title;
  final String videoUrl;
  final List<MentoriaContentBlock> blocks;
  final MentoriaCheckpoint checkpoint;
}

class MentoriaCheckpoint {
  const MentoriaCheckpoint({required this.title, required this.prompt});
  final String title;
  final String prompt;
}

enum MentoriaBlockType { paragraph, bullets }

class MentoriaContentBlock {
  const MentoriaContentBlock._(this.type, {this.text, this.items});

  final MentoriaBlockType type;
  final String? text;
  final List<String>? items;

  const factory MentoriaContentBlock.paragraph(String text) =
      _MentoriaParagraphBlock;
  const factory MentoriaContentBlock.bullets(List<String> items) =
      _MentoriaBulletsBlock;
}

class _MentoriaParagraphBlock extends MentoriaContentBlock {
  const _MentoriaParagraphBlock(String text)
      : super._(MentoriaBlockType.paragraph, text: text);
}

class _MentoriaBulletsBlock extends MentoriaContentBlock {
  const _MentoriaBulletsBlock(List<String> items)
      : super._(MentoriaBlockType.bullets, items: items);
}

class MentorLimitAlert {
  const MentorLimitAlert({required this.title, required this.message});
  final String title;
  final String message;
}

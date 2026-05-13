import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/suitability_engine.dart';
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

  static Profile? _profileFromString(String? raw) {
    final value = raw?.trim().toLowerCase();
    if (value == null || value.isEmpty) return null;
    if (value.contains('conserv')) return Profile.conservador;
    if (value.contains('moder')) return Profile.moderado;
    if (value.contains('arroj') ||
        value.contains('agress') ||
        value.contains('aggress')) {
      return Profile.arrojado;
    }
    return null;
  }

  static Future<Profile?> currentInvestorProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return _profileFromString(prefs.getString('perfil_investidor'));
  }

  static Future<String> currentTreatment() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('tratamento_usuario')?.trim().toLowerCase();
    if (raw == 'feminino' || raw == 'masculino') return raw!;
    return 'neutro';
  }

  static String profileMentoriaTitle(Profile profile) {
    switch (profile) {
      case Profile.conservador:
        return 'Trilha Conservador';
      case Profile.moderado:
        return 'Trilha Moderado';
      case Profile.arrojado:
        return 'Trilha Arrojado';
    }
  }

  static String profileMentoriaDescription(Profile profile) {
    switch (profile) {
      case Profile.conservador:
        return 'Base, proteção emocional, reserva e primeiros investimentos sem pressa.';
      case Profile.moderado:
        return 'Você mantém a base conservadora disponível e avança para crescimento com controle, diversificação e metas maiores.';
      case Profile.arrojado:
        return 'Você mantém as trilhas anteriores disponíveis e avança para expansão, risco calculado e proteção contra excesso de confiança.';
    }
  }

  static List<MentoriaModule> modules({Profile profile = Profile.conservador}) {
    switch (profile) {
      case Profile.conservador:
        return _conservativeModules;
      case Profile.moderado:
        return [..._conservativeModules, ..._moderateModules];
      case Profile.arrojado:
        return [
          ..._conservativeModules,
          ..._moderateModules,
          ..._aggressiveModules,
        ];
    }
  }

  static List<Profile> unlockedProfiles(Profile profile) {
    switch (profile) {
      case Profile.conservador:
        return const [Profile.conservador];
      case Profile.moderado:
        return const [Profile.conservador, Profile.moderado];
      case Profile.arrojado:
        return const [Profile.conservador, Profile.moderado, Profile.arrojado];
    }
  }

  static List<MentoriaModule> profileModules(Profile profile) {
    switch (profile) {
      case Profile.conservador:
        return _conservativeModules;
      case Profile.moderado:
        return _moderateModules;
      case Profile.arrojado:
        return _aggressiveModules;
    }
  }

  static String sectionIntro(Profile profile) {
    switch (profile) {
      case Profile.conservador:
        return 'Estabilidade, clareza mental, reserva e hábitos. Esta base continua valendo quando você subir de nível.';
      case Profile.moderado:
        return 'Crescimento com controle: diversificação, renda, metas maiores e preparo para oscilações.';
      case Profile.arrojado:
        return 'Risco com método: tese, execução, limites, revisão e proteção contra excesso de confiança.';
    }
  }

  static String profileMentoriaTitleFor(Profile profile, String languageCode) {
    final lang = languageCode.toLowerCase();
    if (lang.startsWith('en')) {
      switch (profile) {
        case Profile.conservador:
          return 'Conservative Track';
        case Profile.moderado:
          return 'Moderate Track';
        case Profile.arrojado:
          return 'Growth Track';
      }
    }
    if (lang.startsWith('es')) {
      switch (profile) {
        case Profile.conservador:
          return 'Ruta Conservadora';
        case Profile.moderado:
          return 'Ruta Moderada';
        case Profile.arrojado:
          return 'Ruta Audaz';
      }
    }
    return profileMentoriaTitle(profile);
  }

  static String profileMentoriaDescriptionFor(
    Profile profile, {
    required String languageCode,
    required bool isBrazil,
  }) {
    if (isBrazil && languageCode.toLowerCase().startsWith('pt')) {
      return profileMentoriaDescription(profile);
    }
    final lang = languageCode.toLowerCase();
    if (lang.startsWith('en')) {
      switch (profile) {
        case Profile.conservador:
          return 'Build stability, emergency savings, discipline and low-risk first steps without rushing.';
        case Profile.moderado:
          return 'Keep the conservative base available and move into controlled growth, diversification and larger goals.';
        case Profile.arrojado:
          return 'Keep previous tracks available and advance into calculated risk, stronger execution and emotional control.';
      }
    }
    if (lang.startsWith('es')) {
      switch (profile) {
        case Profile.conservador:
          return 'Construye estabilidad, reserva de emergencia, disciplina y primeros pasos de bajo riesgo sin prisa.';
        case Profile.moderado:
          return 'Mantén disponible la base conservadora y avanza hacia crecimiento controlado, diversificación y metas mayores.';
        case Profile.arrojado:
          return 'Mantén las rutas anteriores y avanza hacia riesgo calculado, mejor ejecución y control emocional.';
      }
    }
    switch (profile) {
      case Profile.conservador:
        return 'Construa estabilidade, reserva de emergência, disciplina e primeiros passos de baixo risco sem pressa.';
      case Profile.moderado:
        return 'Mantenha a base conservadora disponível e avance para crescimento controlado, diversificação e metas maiores.';
      case Profile.arrojado:
        return 'Mantenha as trilhas anteriores e avance para risco calculado, execução forte e controle emocional.';
    }
  }

  static String sectionIntroFor(
    Profile profile, {
    required String languageCode,
    required bool isBrazil,
  }) {
    if (isBrazil && languageCode.toLowerCase().startsWith('pt')) {
      return sectionIntro(profile);
    }
    final lang = languageCode.toLowerCase();
    if (lang.startsWith('en')) {
      switch (profile) {
        case Profile.conservador:
          return 'Stability, mental clarity, emergency savings and habits. This foundation stays useful as you level up.';
        case Profile.moderado:
          return 'Controlled growth: diversification, income, larger goals and preparation for market swings.';
        case Profile.arrojado:
          return 'Risk with method: thesis, execution, limits, review and protection against overconfidence.';
      }
    }
    if (lang.startsWith('es')) {
      switch (profile) {
        case Profile.conservador:
          return 'Estabilidad, claridad mental, reserva de emergencia y hábitos. Esta base sigue valiendo al subir de nivel.';
        case Profile.moderado:
          return 'Crecimiento con control: diversificación, ingresos, metas mayores y preparación para oscilaciones.';
        case Profile.arrojado:
          return 'Riesgo con método: tesis, ejecución, límites, revisión y protección contra el exceso de confianza.';
      }
    }
    switch (profile) {
      case Profile.conservador:
        return 'Estabilidade, clareza mental, reserva de emergência e hábitos. Esta base continua valendo quando você sobe de nível.';
      case Profile.moderado:
        return 'Crescimento com controle: diversificação, renda, metas maiores e preparo para oscilações.';
      case Profile.arrojado:
        return 'Risco com método: tese, execução, limites, revisão e proteção contra excesso de confiança.';
    }
  }

  static List<MentoriaModule> profileModulesForContext(
    Profile profile, {
    required String languageCode,
    required bool isBrazil,
    String treatment = 'neutro',
  }) {
    final modules = isBrazil && languageCode.toLowerCase().startsWith('pt')
        ? profileModules(profile)
        : _globalProfileModules(profile, languageCode);
    return adaptModulesForTreatment(
      modules,
      treatment: treatment,
      languageCode: languageCode,
    );
  }

  static List<MentoriaModule> adaptModulesForTreatment(
    List<MentoriaModule> modules, {
    required String treatment,
    required String languageCode,
  }) {
    return modules
        .map(
          (module) => MentoriaModule(
            id: module.id,
            title: adaptTextForTreatment(
              module.title,
              treatment: treatment,
              languageCode: languageCode,
            ),
            subtitle: adaptTextForTreatment(
              module.subtitle,
              treatment: treatment,
              languageCode: languageCode,
            ),
            accent: module.accent,
            priority: module.priority,
            lessons: module.lessons
                .map(
                  (lesson) => MentoriaLesson(
                    id: lesson.id,
                    title: adaptTextForTreatment(
                      lesson.title,
                      treatment: treatment,
                      languageCode: languageCode,
                    ),
                    videoUrl: lesson.videoUrl,
                    blocks: lesson.blocks.map((block) {
                      if (block.type == MentoriaBlockType.paragraph) {
                        return MentoriaContentBlock.paragraph(
                          adaptTextForTreatment(
                            block.text ?? '',
                            treatment: treatment,
                            languageCode: languageCode,
                          ),
                        );
                      }
                      return MentoriaContentBlock.bullets(
                        (block.items ?? const <String>[])
                            .map(
                              (item) => adaptTextForTreatment(
                                item,
                                treatment: treatment,
                                languageCode: languageCode,
                              ),
                            )
                            .toList(),
                      );
                    }).toList(),
                    checkpoint: MentoriaCheckpoint(
                      title: adaptTextForTreatment(
                        lesson.checkpoint.title,
                        treatment: treatment,
                        languageCode: languageCode,
                      ),
                      prompt: adaptTextForTreatment(
                        lesson.checkpoint.prompt,
                        treatment: treatment,
                        languageCode: languageCode,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  static String adaptTextForTreatment(
    String text, {
    required String treatment,
    required String languageCode,
  }) {
    final normalized = treatment.toLowerCase();
    if (normalized == 'neutro') return text;

    var out = text;
    if (languageCode.toLowerCase().startsWith('pt')) {
      final replacements = normalized == 'feminino'
          ? const <String, String>{
              'Você não está atrasado': 'Você não está atrasada',
              'você está começando': 'você está começando',
              'Você não está preso': 'Você não está presa',
              'dedicado, disciplinado': 'dedicada, disciplinada',
              'dedicado': 'dedicada',
              'disciplinado': 'disciplinada',
              'pronto para': 'pronta para',
              'Pronto para': 'Pronta para',
              'o arrojado': 'a arrojada',
              'O arrojado': 'A arrojada',
              'o moderado': 'a moderada',
              'O moderado': 'A moderada',
              'o conservador': 'a conservadora',
              'O conservador': 'A conservadora',
            }
          : const <String, String>{
              'a arrojada': 'o arrojado',
              'A arrojada': 'O arrojado',
              'a moderada': 'o moderado',
              'A moderada': 'O moderado',
              'a conservadora': 'o conservador',
              'A conservadora': 'O conservador',
            };
      replacements.forEach((from, to) => out = out.replaceAll(from, to));
    } else if (languageCode.toLowerCase().startsWith('es')) {
      final replacements = normalized == 'feminino'
          ? const <String, String>{
              'Un inversor conservador': 'Una inversora conservadora',
              'un inversor conservador': 'una inversora conservadora',
              'El inversor moderado': 'La inversora moderada',
              'el inversor moderado': 'la inversora moderada',
              'El perfil audaz': 'La persona audaz',
              'el perfil audaz': 'la persona audaz',
              'preparado': 'preparada',
              'listo': 'lista',
            }
          : const <String, String>{};
      replacements.forEach((from, to) => out = out.replaceAll(from, to));
    }
    return out;
  }

  static List<MentoriaModule> _globalProfileModules(
    Profile profile,
    String languageCode,
  ) {
    final lang = languageCode.toLowerCase();
    if (lang.startsWith('en')) return _globalProfileModulesEn(profile);
    if (lang.startsWith('es')) return _globalProfileModulesEs(profile);
    return _globalProfileModulesPt(profile);
  }

  static List<MentoriaModule> _globalProfileModulesPt(Profile profile) {
    switch (profile) {
      case Profile.conservador:
        return [
          _globalModule(
            id: 'conservative_awakening',
            title: 'Clareza Antes de Risco',
            subtitle: 'Organizar mente, rotina e dinheiro antes de investir.',
            accent: 0xFF00E5FF,
            lessonTitle: 'Estabilidade é seu primeiro patrimônio',
            paragraph:
                'Para o perfil conservador, a prioridade é parar de agir no impulso. Antes de buscar retorno, construa clareza, controle e uma rotina financeira que você consiga manter.',
            bullets: const [
              'Registre gastos e renda antes de tomar decisões maiores.',
              'Evite promessas de ganho rápido e produtos que você não entende.',
              'Proteja seu foco: menos comparação, menos pressa, mais consistência.',
            ],
            checkpointTitle: 'Primeiro compromisso',
            checkpointPrompt:
                'Escreva uma regra simples para esta semana: registrar gastos, adiar compras por 24h ou revisar assinaturas.',
          ),
          _globalModule(
            id: 'conservative_reserve',
            title: 'Reserva de Emergência',
            subtitle: 'Dinheiro seguro para não decidir no desespero.',
            accent: 0xFF26DE81,
            lessonTitle: 'Sua primeira riqueza é dormir em paz',
            paragraph:
                'A reserva de emergência deve ficar em produtos simples, líquidos e de baixo risco disponíveis no seu país. O objetivo é segurança, não rendimento máximo.',
            bullets: const [
              'Primeira meta: 1 mês de custos essenciais.',
              'Meta seguinte: 3 a 6 meses de custos essenciais.',
              'Procure contas remuneradas, depósitos segurados, fundos monetários ou títulos públicos locais de baixo risco, conforme sua região.',
            ],
            checkpointTitle: 'Meta de segurança',
            checkpointPrompt:
                'Calcule quanto custa 1 mês da sua vida básica. Esse é seu primeiro alvo.',
          ),
          _globalModule(
            id: 'conservative_first_investments',
            title: 'Primeiros Investimentos',
            subtitle: 'Começar pequeno, entender bem e repetir.',
            accent: 0xFF4CAF50,
            lessonTitle: 'Sem pressa e sem aposta',
            paragraph:
                'O conservador deve escolher produtos compreensíveis, regulados e compatíveis com seu país. O hábito de investir importa mais que tentar acertar o melhor produto.',
            bullets: const [
              'Entenda liquidez, prazo, risco, taxa e proteção legal antes de aplicar.',
              'Prefira aportes pequenos e constantes.',
              'Só avance para produtos voláteis depois de ter reserva e conhecimento.',
            ],
            checkpointTitle: 'Aporte possível',
            checkpointPrompt:
                'Defina um valor mensal realista para investir sem prejudicar suas contas.',
          ),
        ];
      case Profile.moderado:
        return [
          _globalModule(
            id: 'moderate_balance',
            title: 'Crescimento com Controle',
            subtitle: 'Equilibrar segurança e retorno sem perder a paz.',
            accent: 0xFFFFC107,
            lessonTitle: 'Você pode crescer, mas precisa de trilhos',
            paragraph:
                'O moderado já pode buscar retorno maior, mas precisa separar objetivos por prazo e limitar quanto aceita expor a oscilações.',
            bullets: const [
              'Mantenha reserva e curto prazo em baixo risco.',
              'Use diversificação por classe, moeda e região quando fizer sentido.',
              'Evite transformar curiosidade em excesso de produtos.',
            ],
            checkpointTitle: 'Divisão inicial',
            checkpointPrompt:
                'Defina uma divisão entre segurança, crescimento e aprendizado.',
          ),
          _globalModule(
            id: 'moderate_diversification',
            title: 'Diversificação Inteligente',
            subtitle: 'Não depender de uma única moeda, empresa ou produto.',
            accent: 0xFFFFA502,
            lessonTitle: 'Diversificar não é comprar de tudo',
            paragraph:
                'Diversificação é dar função para cada parte da carteira. Produtos locais, internacionais, renda fixa, fundos e ações podem ter papéis diferentes.',
            bullets: const [
              'Evite concentração em um único ativo ou setor.',
              'Compare risco, custo, liquidez e imposto na sua região.',
              'Rebalanceie com calendário, não com emoção.',
            ],
            checkpointTitle: 'Função de cada ativo',
            checkpointPrompt:
                'Escolha um investimento e escreva qual função ele cumpre na sua carteira.',
          ),
          _globalModule(
            id: 'moderate_emotional_risk',
            title: 'Oscilação sem Pânico',
            subtitle: 'Lidar com quedas sem abandonar o plano.',
            accent: 0xFF6366F1,
            priority: MentoriaPriority.importante,
            lessonTitle: 'Oscilação não é fracasso',
            paragraph:
                'O moderado precisa aceitar que parte da carteira pode variar. O risco deve estar previsto antes da queda acontecer.',
            bullets: const [
              'Não decida em dia de medo ou euforia.',
              'Tenha limite de exposição por classe de ativo.',
              'Revise sua carteira mensalmente, não a cada notícia.',
            ],
            checkpointTitle: 'Regra emocional',
            checkpointPrompt:
                'Escreva o que você fará quando um ativo cair 5%, 10% ou mais.',
          ),
        ];
      case Profile.arrojado:
        return [
          _globalModule(
            id: 'aggressive_execution',
            title: 'Risco Calculado',
            subtitle: 'Buscar retorno maior sem confundir coragem com impulso.',
            accent: 0xFFF44336,
            lessonTitle: 'Coragem sem método vira prejuízo',
            paragraph:
                'O arrojado pode aceitar volatilidade, mas precisa de tese, limite de perda, horizonte e revisão. Sem isso, risco vira aposta.',
            bullets: const [
              'Escreva por que entra, quando sai e o que invalida sua tese.',
              'Nunca use reserva de emergência em risco alto.',
              'Defina limite máximo por ativo e por classe.',
            ],
            checkpointTitle: 'Limite de risco',
            checkpointPrompt:
                'Defina o percentual máximo do patrimônio que aceita expor a ativos de maior risco.',
          ),
          _globalModule(
            id: 'aggressive_strategy',
            title: 'Tese Antes da Entrada',
            subtitle: 'Investir com motivo, métrica e plano de saída.',
            accent: 0xFFFFA502,
            lessonTitle: 'Sem tese, você só está torcendo',
            paragraph:
                'Antes de comprar um ativo volátil, escreva a lógica. Uma tese simples protege você de seguir moda, medo ou euforia.',
            bullets: const [
              'Separe oportunidade real de ansiedade.',
              'Compare preço, qualidade, risco e horizonte.',
              'Tenha diário de decisões para aprender com erros.',
            ],
            checkpointTitle: 'Tese em uma página',
            checkpointPrompt:
                'Escolha um ativo e escreva: motivo da entrada, limite de perda e condição de saída.',
          ),
          _globalModule(
            id: 'aggressive_review',
            title: 'Revisão e Evolução',
            subtitle: 'Medir processo, resultado e comportamento.',
            accent: 0xFF00D9FF,
            priority: MentoriaPriority.importante,
            lessonTitle: 'Quem não revisa repete erro caro',
            paragraph:
                'O arrojado evolui quando erra menor, aprende rápido e protege o patrimônio enquanto busca crescimento.',
            bullets: const [
              'Revise carteira mensalmente e teses trimestralmente.',
              'Separe decisão boa de resultado bom.',
              'Compare sua evolução com seu plano, não com a vida dos outros.',
            ],
            checkpointTitle: 'Ritual mensal',
            checkpointPrompt:
                'Defina um dia fixo para revisar carteira, decisões e limites.',
          ),
        ];
    }
  }

  static List<MentoriaModule> _globalProfileModulesEn(Profile profile) {
    return _translateGlobalModules(_globalProfileModulesPt(profile), const {
      'Clareza Antes de Risco': 'Clarity Before Risk',
      'Organizar mente, rotina e dinheiro antes de investir.':
          'Organize your mind, routine and money before investing.',
      'Estabilidade é seu primeiro patrimônio': 'Stability is your first asset',
      'Reserva de Emergência': 'Emergency Fund',
      'Dinheiro seguro para não decidir no desespero.':
          'Safe money so you do not make decisions in panic.',
      'Sua primeira riqueza é dormir em paz':
          'Your first wealth is sleeping well',
      'Primeiros Investimentos': 'First Investments',
      'Começar pequeno, entender bem e repetir.':
          'Start small, understand clearly and repeat.',
      'Sem pressa e sem aposta': 'No rush, no gambling',
      'Crescimento com Controle': 'Controlled Growth',
      'Equilibrar segurança e retorno sem perder a paz.':
          'Balance safety and return without losing peace.',
      'Você pode crescer, mas precisa de trilhos':
          'You can grow, but you need rails',
      'Diversificação Inteligente': 'Smart Diversification',
      'Não depender de uma única moeda, empresa ou produto.':
          'Do not depend on one currency, company or product.',
      'Diversificar não é comprar de tudo':
          'Diversification is not buying everything',
      'Oscilação sem Pânico': 'Volatility Without Panic',
      'Lidar com quedas sem abandonar o plano.':
          'Handle drops without abandoning the plan.',
      'Oscilação não é fracasso': 'Volatility is not failure',
      'Risco Calculado': 'Calculated Risk',
      'Buscar retorno maior sem confundir coragem com impulso.':
          'Seek higher return without confusing courage with impulse.',
      'Coragem sem método vira prejuízo': 'Courage without method becomes loss',
      'Tese Antes da Entrada': 'Thesis Before Entry',
      'Investir com motivo, métrica e plano de saída.':
          'Invest with a reason, metrics and an exit plan.',
      'Sem tese, você só está torcendo':
          'Without a thesis, you are only hoping',
      'Revisão e Evolução': 'Review and Evolution',
      'Medir processo, resultado e comportamento.':
          'Measure process, result and behavior.',
      'Quem não revisa repete erro caro':
          'Those who do not review repeat costly mistakes',
    }, languageCode: 'en');
  }

  static List<MentoriaModule> _globalProfileModulesEs(Profile profile) {
    return _translateGlobalModules(_globalProfileModulesPt(profile), const {
      'Clareza Antes de Risco': 'Claridad Antes del Riesgo',
      'Organizar mente, rotina e dinheiro antes de investir.':
          'Organiza mente, rutina y dinero antes de invertir.',
      'Estabilidade é seu primeiro patrimônio':
          'La estabilidad es tu primer patrimonio',
      'Reserva de Emergência': 'Reserva de Emergencia',
      'Dinheiro seguro para não decidir no desespero.':
          'Dinero seguro para no decidir desde el desespero.',
      'Sua primeira riqueza é dormir em paz':
          'Tu primera riqueza es dormir en paz',
      'Primeiros Investimentos': 'Primeras Inversiones',
      'Começar pequeno, entender bem e repetir.':
          'Empieza pequeño, entiende bien y repite.',
      'Sem pressa e sem aposta': 'Sin prisa y sin apuesta',
      'Crescimento com Controle': 'Crecimiento con Control',
      'Equilibrar segurança e retorno sem perder a paz.':
          'Equilibra seguridad y retorno sin perder la paz.',
      'Você pode crescer, mas precisa de trilhos':
          'Puedes crecer, pero necesitas carriles',
      'Diversificação Inteligente': 'Diversificación Inteligente',
      'Não depender de uma única moeda, empresa ou produto.':
          'No dependas de una sola moneda, empresa o producto.',
      'Diversificar não é comprar de tudo':
          'Diversificar no es comprar de todo',
      'Oscilação sem Pânico': 'Oscilación sin Pánico',
      'Lidar com quedas sem abandonar o plano.':
          'Maneja caídas sin abandonar el plan.',
      'Oscilação não é fracasso': 'La oscilación no es fracaso',
      'Risco Calculado': 'Riesgo Calculado',
      'Buscar retorno maior sem confundir coragem com impulso.':
          'Busca mayor retorno sin confundir valentía con impulso.',
      'Coragem sem método vira prejuízo':
          'La valentía sin método se convierte en pérdida',
      'Tese Antes da Entrada': 'Tesis Antes de Entrar',
      'Investir com motivo, métrica e plano de saída.':
          'Invierte con motivo, métricas y plan de salida.',
      'Sem tese, você só está torcendo': 'Sin tesis, solo estás esperando',
      'Revisão e Evolução': 'Revisión y Evolución',
      'Medir processo, resultado e comportamento.':
          'Mide proceso, resultado y comportamiento.',
      'Quem não revisa repete erro caro':
          'Quien no revisa repite errores caros',
    }, languageCode: 'es');
  }

  static List<MentoriaModule> _translateGlobalModules(
    List<MentoriaModule> modules,
    Map<String, String> labels, {
    required String languageCode,
  }) {
    String tr(String value) => labels[value] ?? value;
    return modules.map((module) {
      final lesson = module.lessons.first;
      final localized = _localizedGlobalLessonText(module.id, languageCode);
      return MentoriaModule(
        id: module.id,
        title: tr(module.title),
        subtitle: tr(module.subtitle),
        accent: module.accent,
        priority: module.priority,
        lessons: [
          MentoriaLesson(
            id: lesson.id,
            title: tr(lesson.title),
            videoUrl: lesson.videoUrl,
            blocks: [
              MentoriaContentBlock.paragraph(localized.paragraph),
              MentoriaContentBlock.bullets(localized.bullets),
            ],
            checkpoint: MentoriaCheckpoint(
              title: localized.checkpointTitle,
              prompt: localized.checkpointPrompt,
            ),
          ),
        ],
      );
    }).toList();
  }

  static ({
    String paragraph,
    List<String> bullets,
    String checkpointTitle,
    String checkpointPrompt,
  })
  _localizedGlobalLessonText(String moduleId, String languageCode) {
    final en = languageCode.toLowerCase().startsWith('en');
    final es = languageCode.toLowerCase().startsWith('es');

    if (en) {
      switch (moduleId) {
        case 'conservative_awakening':
          return (
            paragraph:
                'For a conservative profile, the priority is to stop acting on impulse. Before chasing returns, build clarity, control and a money routine you can actually keep.',
            bullets: const [
              'Track income and spending before making bigger decisions.',
              'Avoid quick-profit promises and products you do not understand.',
              'Protect your focus: less comparison, less hurry, more consistency.',
            ],
            checkpointTitle: 'First commitment',
            checkpointPrompt:
                'Write one simple rule for this week: track expenses, delay purchases for 24 hours or review subscriptions.',
          );
        case 'conservative_reserve':
          return (
            paragraph:
                'Your emergency fund should stay in simple, liquid and low-risk products available in your country. The goal is safety, not maximum yield.',
            bullets: const [
              'First goal: 1 month of essential expenses.',
              'Next goal: 3 to 6 months of essential expenses.',
              'Look for insured savings, money market funds, short-term government bonds or regulated low-risk products in your region.',
            ],
            checkpointTitle: 'Safety goal',
            checkpointPrompt:
                'Calculate one month of basic living costs. That is your first target.',
          );
        case 'conservative_first_investments':
          return (
            paragraph:
                'A conservative investor should choose understandable, regulated products that fit their country. The habit of investing matters more than finding the perfect product.',
            bullets: const [
              'Understand liquidity, time horizon, risk, fees and legal protection before investing.',
              'Prefer small and consistent contributions.',
              'Move into volatile assets only after you have savings and knowledge.',
            ],
            checkpointTitle: 'Possible contribution',
            checkpointPrompt:
                'Define a realistic monthly amount to invest without harming your bills.',
          );
        case 'moderate_balance':
          return (
            paragraph:
                'A moderate profile can seek higher returns, but needs to separate goals by time horizon and limit exposure to volatility.',
            bullets: const [
              'Keep emergency savings and short-term goals in lower-risk products.',
              'Use diversification by asset class, currency and region when it makes sense.',
              'Do not turn curiosity into a messy portfolio.',
            ],
            checkpointTitle: 'Initial allocation',
            checkpointPrompt:
                'Define a split between safety, growth and learning.',
          );
        case 'moderate_diversification':
          return (
            paragraph:
                'Diversification means giving each part of your portfolio a job. Local products, global products, fixed income, funds and equities can play different roles.',
            bullets: const [
              'Avoid concentration in one asset, country, currency or sector.',
              'Compare risk, cost, liquidity and taxes in your region.',
              'Rebalance by calendar, not by emotion.',
            ],
            checkpointTitle: 'Role of each asset',
            checkpointPrompt:
                'Choose one investment and write the role it plays in your portfolio.',
          );
        case 'moderate_emotional_risk':
          return (
            paragraph:
                'A moderate investor must accept that part of the portfolio can move up and down. Risk should be planned before the drop happens.',
            bullets: const [
              'Do not decide on days of fear or euphoria.',
              'Set exposure limits by asset class.',
              'Review monthly, not after every headline.',
            ],
            checkpointTitle: 'Emotional rule',
            checkpointPrompt:
                'Write what you will do if an asset falls 5%, 10% or more.',
          );
        case 'aggressive_execution':
          return (
            paragraph:
                'An aggressive investor may accept volatility, but needs a thesis, loss limit, time horizon and review process. Without that, risk becomes gambling.',
            bullets: const [
              'Write why you enter, when you exit and what invalidates the thesis.',
              'Never use emergency savings for high-risk assets.',
              'Define a maximum limit per asset and asset class.',
            ],
            checkpointTitle: 'Risk limit',
            checkpointPrompt:
                'Define the maximum percentage of wealth you accept exposing to higher-risk assets.',
          );
        case 'aggressive_strategy':
          return (
            paragraph:
                'Before buying a volatile asset, write the logic. A simple thesis protects you from hype, fear and euphoria.',
            bullets: const [
              'Separate real opportunity from anxiety.',
              'Compare price, quality, risk and time horizon.',
              'Keep a decision journal to learn from mistakes.',
            ],
            checkpointTitle: 'One-page thesis',
            checkpointPrompt:
                'Choose one asset and write: entry reason, loss limit and exit condition.',
          );
        default:
          return (
            paragraph:
                'Growth comes from reviewing your decisions, protecting capital and improving behavior over time.',
            bullets: const [
              'Review the portfolio monthly and theses quarterly.',
              'Separate a good decision from a lucky result.',
              'Compare progress with your plan, not with other people.',
            ],
            checkpointTitle: 'Monthly ritual',
            checkpointPrompt:
                'Choose a fixed day to review your portfolio, decisions and limits.',
          );
      }
    }

    if (es) {
      switch (moduleId) {
        case 'conservative_awakening':
          return (
            paragraph:
                'Para un perfil conservador, la prioridad es dejar de actuar por impulso. Antes de buscar rentabilidad, construye claridad, control y una rutina financiera sostenible.',
            bullets: const [
              'Registra ingresos y gastos antes de tomar decisiones mayores.',
              'Evita promesas de ganancias rápidas y productos que no entiendes.',
              'Protege tu foco: menos comparación, menos prisa y más constancia.',
            ],
            checkpointTitle: 'Primer compromiso',
            checkpointPrompt:
                'Escribe una regla simple para esta semana: registrar gastos, aplazar compras 24 horas o revisar suscripciones.',
          );
        case 'conservative_reserve':
          return (
            paragraph:
                'La reserva de emergencia debe estar en productos simples, líquidos y de bajo riesgo disponibles en tu país. El objetivo es seguridad, no rendimiento máximo.',
            bullets: const [
              'Primera meta: 1 mes de gastos esenciales.',
              'Siguiente meta: 3 a 6 meses de gastos esenciales.',
              'Busca cuentas aseguradas, fondos monetarios, bonos públicos de corto plazo o productos regulados de bajo riesgo en tu región.',
            ],
            checkpointTitle: 'Meta de seguridad',
            checkpointPrompt:
                'Calcula cuánto cuesta 1 mes de tu vida básica. Ese es tu primer objetivo.',
          );
        case 'conservative_first_investments':
          return (
            paragraph:
                'Un inversor conservador debe elegir productos comprensibles, regulados y adecuados a su país. El hábito de invertir importa más que encontrar el producto perfecto.',
            bullets: const [
              'Entiende liquidez, plazo, riesgo, comisiones y protección legal antes de invertir.',
              'Prefiere aportes pequeños y constantes.',
              'Avanza hacia activos volátiles solo después de tener reserva y conocimiento.',
            ],
            checkpointTitle: 'Aporte posible',
            checkpointPrompt:
                'Define un monto mensual realista para invertir sin afectar tus cuentas.',
          );
        case 'moderate_balance':
          return (
            paragraph:
                'El perfil moderado puede buscar más retorno, pero necesita separar objetivos por plazo y limitar exposición a la volatilidad.',
            bullets: const [
              'Mantén reserva y corto plazo en productos de menor riesgo.',
              'Diversifica por clase de activo, moneda y región cuando tenga sentido.',
              'No conviertas la curiosidad en una cartera desordenada.',
            ],
            checkpointTitle: 'Asignación inicial',
            checkpointPrompt:
                'Define una división entre seguridad, crecimiento y aprendizaje.',
          );
        case 'moderate_diversification':
          return (
            paragraph:
                'Diversificar significa dar una función a cada parte de la cartera. Productos locales, globales, renta fija, fondos y acciones pueden tener roles diferentes.',
            bullets: const [
              'Evita concentración en un solo activo, país, moneda o sector.',
              'Compara riesgo, costo, liquidez e impuestos en tu región.',
              'Rebalancea con calendario, no con emoción.',
            ],
            checkpointTitle: 'Función de cada activo',
            checkpointPrompt:
                'Elige una inversión y escribe qué función cumple en tu cartera.',
          );
        case 'moderate_emotional_risk':
          return (
            paragraph:
                'El inversor moderado debe aceptar que parte de la cartera puede oscilar. El riesgo debe estar previsto antes de que llegue la caída.',
            bullets: const [
              'No decidas en días de miedo o euforia.',
              'Define límites de exposición por clase de activo.',
              'Revisa mensualmente, no con cada noticia.',
            ],
            checkpointTitle: 'Regla emocional',
            checkpointPrompt:
                'Escribe qué harás si un activo cae 5%, 10% o más.',
          );
        case 'aggressive_execution':
          return (
            paragraph:
                'El perfil audaz puede aceptar volatilidad, pero necesita tesis, límite de pérdida, horizonte y revisión. Sin eso, el riesgo se vuelve apuesta.',
            bullets: const [
              'Escribe por qué entras, cuándo sales y qué invalida la tesis.',
              'Nunca uses la reserva de emergencia para activos de alto riesgo.',
              'Define un límite máximo por activo y por clase.',
            ],
            checkpointTitle: 'Límite de riesgo',
            checkpointPrompt:
                'Define el porcentaje máximo de patrimonio que aceptas exponer a activos de mayor riesgo.',
          );
        case 'aggressive_strategy':
          return (
            paragraph:
                'Antes de comprar un activo volátil, escribe la lógica. Una tesis simple te protege de la moda, el miedo y la euforia.',
            bullets: const [
              'Separa oportunidad real de ansiedad.',
              'Compara precio, calidad, riesgo y horizonte.',
              'Mantén un diario de decisiones para aprender de errores.',
            ],
            checkpointTitle: 'Tesis en una página',
            checkpointPrompt:
                'Elige un activo y escribe: motivo de entrada, límite de pérdida y condición de salida.',
          );
        default:
          return (
            paragraph:
                'La evolución viene de revisar decisiones, proteger capital y mejorar el comportamiento con el tiempo.',
            bullets: const [
              'Revisa la cartera mensualmente y las tesis trimestralmente.',
              'Separa una buena decisión de un resultado con suerte.',
              'Compara tu progreso con tu plan, no con otras personas.',
            ],
            checkpointTitle: 'Ritual mensual',
            checkpointPrompt:
                'Elige un día fijo para revisar cartera, decisiones y límites.',
          );
      }
    }

    return (
      paragraph: '',
      bullets: const <String>[],
      checkpointTitle: '',
      checkpointPrompt: '',
    );
  }

  static MentoriaModule _globalModule({
    required String id,
    required String title,
    required String subtitle,
    required int accent,
    required String lessonTitle,
    required String paragraph,
    required List<String> bullets,
    required String checkpointTitle,
    required String checkpointPrompt,
    MentoriaPriority priority = MentoriaPriority.essencial,
  }) {
    return MentoriaModule(
      id: id,
      title: title,
      subtitle: subtitle,
      accent: accent,
      priority: priority,
      lessons: [
        MentoriaLesson(
          id: '${id}_lesson',
          title: lessonTitle,
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(paragraph),
            MentoriaContentBlock.bullets(bullets),
          ],
          checkpoint: MentoriaCheckpoint(
            title: checkpointTitle,
            prompt: checkpointPrompt,
          ),
        ),
      ],
    );
  }

  static const List<MentoriaModule> _conservativeModules = [
    MentoriaModule(
      id: 'conservative_awakening',
      title: 'Acordar para a Própria Vida',
      subtitle: 'Assumir controle sem culpa, pressa ou promessas milagrosas.',
      accent: 0xFF00E5FF,
      lessons: [
        MentoriaLesson(
          id: 'conservative_01_identity',
          title: 'A versão antiga não paga a conta da versão nova',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'O primeiro passo do conservador não é correr atrás de risco. É recuperar direção. Sua vida financeira melhora quando você para de agir no automático e começa a escolher com consciência.',
            ),
            MentoriaContentBlock.bullets([
              'Você não está atrasado: você está começando com consciência.',
              'A mudança começa na identidade: pare de se ver como alguém sem controle.',
              'Paciência é proteção. Pressa costuma empurrar o conservador para decisões ruins.',
              'Referência conceitual: Os Segredos da Mente Milionária, T. Harv Eker. A forma como você pensa sobre dinheiro influencia suas decisões.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Exercício de identidade',
            prompt:
                'Escreva qual hábito financeiro antigo você vai abandonar esta semana e qual atitude simples vai colocar no lugar.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'conservative_leaks',
      title: 'Cortar Vazamentos',
      subtitle: 'Dinheiro, tempo, atenção e energia precisam parar de escapar.',
      accent: 0xFF6366F1,
      lessons: [
        MentoriaLesson(
          id: 'conservative_02_leaks',
          title: 'O que drena sua vida também drena seu dinheiro',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Gasto ruim quase sempre nasce antes da compra: nasce no cansaço, na comparação, na ansiedade, na necessidade de aprovação ou no ambiente errado.',
            ),
            MentoriaContentBlock.bullets([
              'Evite fofoca, conteúdo negativo e ambientes que normalizam reclamação sem ação.',
              'Estabeleça limites até com pessoas próximas quando elas sabotam sua evolução.',
              'Nem todo convite merece seu dinheiro. Nem toda opinião merece sua energia.',
              'Use a regra das 24 horas para compras emocionais.',
              'Referência conceitual: Pai Rico, Pai Pobre, Robert Kiyosaki. Ativos fortalecem sua vida; passivos e hábitos ruins drenam seu caixa.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Mapa de vazamentos',
            prompt:
                'Liste 3 coisas que mais roubam seu dinheiro ou energia hoje. Corte ou limite uma delas nas próximas 24 horas.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'conservative_mind',
      title: 'Blindagem Mental',
      subtitle:
          'Disciplina, limites e constância antes de qualquer investimento.',
      accent: 0xFFFFD166,
      lessons: [
        MentoriaLesson(
          id: 'conservative_03_discipline',
          title: 'Sua mente tenta te manter onde você já está',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'A mente busca conforto, repetição e alívio rápido. Por isso disciplina não é sentimento: é decisão repetida mesmo quando a vontade falha.',
            ),
            MentoriaContentBlock.bullets([
              'Você não precisa ser perfeito. Precisa ser constante.',
              'Não se culpe por errar; transforme o erro em dado e ajuste o comportamento.',
              'Coloque-se em primeiro lugar de forma saudável: quem está destruído não consegue cuidar bem de ninguém.',
              'Afastar-se de hábitos e conversas ruins não é arrogância. É proteção de foco.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Contrato de disciplina',
            prompt:
                'Escolha uma regra simples para cumprir por 7 dias: não comprar por impulso, caminhar, dormir melhor ou registrar todos os gastos.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'conservative_body',
      title: 'Corpo, Rotina e Dinheiro',
      subtitle:
          'Energia física e clareza mental melhoram decisões financeiras.',
      accent: 0xFFFF2D2D,
      priority: MentoriaPriority.importante,
      lessons: [
        MentoriaLesson(
          id: 'conservative_04_routine',
          title: 'Uma mente cansada compra mal',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Problemas financeiros drenam saúde, sono, autoestima e relacionamentos. O caminho de volta começa com uma rotina simples que devolve controle.',
            ),
            MentoriaContentBlock.bullets([
              'Faça uma atividade física possível para sua realidade: caminhada já conta.',
              'Coma melhor por estratégia, não por estética. Energia boa ajuda a decidir melhor.',
              'Converse mais com pessoas que constroem, estudam, trabalham e evoluem.',
              'Quem já venceu ou está vencendo costuma enxergar caminho onde a maioria só enxerga desculpa.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Rotina mínima de vitória',
            prompt:
                'Defina uma rotina mínima para amanhã: horário para acordar, uma atividade física e uma revisão de gastos de 5 minutos.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'conservative_reserve',
      title: 'Reserva e Paz Financeira',
      subtitle: 'Antes de crescer, parar de sangrar e criar segurança.',
      accent: 0xFF26DE81,
      lessons: [
        MentoriaLesson(
          id: 'conservative_05_emergency',
          title: 'Sua primeira riqueza é dormir em paz',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Para o conservador, reserva de emergência não é detalhe. É o alicerce emocional que permite tomar decisões sem desespero.',
            ),
            MentoriaContentBlock.bullets([
              'Primeira meta: 1 mês de custos essenciais.',
              'Meta seguinte: 3 a 6 meses de custos essenciais.',
              'Priorize liquidez e baixo risco: Tesouro Selic, CDB com liquidez diária e instituições sólidas.',
              'Não busque rendimento máximo antes de ter segurança mínima.',
              'Referência conceitual: Do Mil ao Milhão, Thiago Nigro. Gaste bem, invista melhor e aumente sua renda com consistência.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Primeira meta de paz',
            prompt:
                r'Anote o valor de 1 mês dos seus custos essenciais. Esse será seu primeiro alvo de reserva.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'conservative_first_investments',
      title: 'Primeiros Investimentos Sem Medo',
      subtitle: 'Começar com clareza, segurança e repetição.',
      accent: 0xFF4CAF50,
      lessons: [
        MentoriaLesson(
          id: 'conservative_06_first_steps',
          title: 'Sem pressa, sem aposta, sem milagre',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Investir como conservador é aprender a confiar no processo. Você não precisa vencer o mercado amanhã; precisa construir o hábito de proteger e multiplicar aos poucos.',
            ),
            MentoriaContentBlock.bullets([
              'Entenda Selic, CDI, liquidez e prazo antes de buscar produtos novos.',
              'Evite promessas de ganho rápido. O dinheiro que parece fácil costuma cobrar caro.',
              'Aporte pequeno e constante vence empolgação sem método.',
              'Seu objetivo agora é consistência: repetir o certo até virar identidade.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Aporte de confiança',
            prompt:
                r'Defina um valor pequeno e realista para investir todo mês, mesmo que seja R$ 10.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'conservative_next_level',
      title: 'Preparação para Subir de Nível',
      subtitle: 'Evoluir quando houver segurança, não ansiedade.',
      accent: 0xFFFFA502,
      priority: MentoriaPriority.importante,
      lessons: [
        MentoriaLesson(
          id: 'conservative_07_next_level',
          title: 'Confiança é construída, não fingida',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Você não está preso ao perfil conservador. Ele representa seu momento atual. Quando sua reserva, rotina e entendimento amadurecem, você pode refazer o teste e avançar.',
            ),
            MentoriaContentBlock.bullets([
              'Sinais de evolução: reserva iniciada, menos compras emocionais, rotina mais estável e estudo constante.',
              'Subir para moderado não é abandonar segurança. É crescer com método.',
              'Você vai vencer se for dedicado, disciplinado e paciente. Respeite o processo.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Teste de evolução',
            prompt:
                'Quando concluir esta trilha, refaça o Simulado de Perfil e veja se seu comportamento já mudou.',
          ),
        ),
      ],
    ),
  ];

  static const List<MentoriaModule> _moderateModules = [
    MentoriaModule(
      id: 'moderate_balance',
      title: 'Crescimento com Controle',
      subtitle: 'Ambição, método e proteção contra excesso de confiança.',
      accent: 0xFFFFC107,
      lessons: [
        MentoriaLesson(
          id: 'moderate_01_balance',
          title: 'Você já pode crescer, mas ainda precisa de trilhos',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'O perfil moderado precisa equilibrar segurança e movimento. A meta não é apostar mais; é construir uma estratégia que aguente oscilações sem destruir sua paz.',
            ),
            MentoriaContentBlock.bullets([
              'Mantenha reserva e comece a diversificar aos poucos.',
              'Separe objetivos por prazo: curto, médio e longo.',
              'Use renda extra como acelerador, não como licença para gastar mais.',
              'Aprofunde renda fixa, FIIs, ETFs e fundos de forma gradual.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Plano 70/20/10',
            prompt:
                'Defina uma divisão inicial entre segurança, crescimento e aprendizado. Ajuste conforme sua realidade.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'moderate_environment',
      title: 'Ambiente de Evolução',
      subtitle: 'Crescer exige uma nova régua de conversas, hábitos e metas.',
      accent: 0xFF00D9FF,
      priority: MentoriaPriority.importante,
      lessons: [
        MentoriaLesson(
          id: 'moderate_02_environment',
          title: 'Seu próximo nível pede outro ambiente',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'O moderado já entendeu que segurança importa, mas agora precisa conviver com ideias maiores. O ambiente certo não te empurra para aposta; ele te puxa para método, constância e visão.',
            ),
            MentoriaContentBlock.bullets([
              'Procure pessoas que falam de solução, não só de problema.',
              'Troque parte do entretenimento automático por conteúdo de negócios, carreira e investimentos.',
              'Evite tentar provar evolução para quem não quer evoluir junto.',
              'Converse com pessoas que já fazem bem aquilo que você quer aprender.',
              'Referência conceitual: Os Segredos da Mente Milionária, T. Harv Eker. O ambiente reforça padrões mentais e financeiros.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Filtro de ambiente',
            prompt:
                'Liste 2 pessoas, canais ou ambientes que elevam sua visão e 2 que te puxam para trás. O que você vai reduzir esta semana?',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'moderate_income',
      title: 'Aumentar Renda com Estratégia',
      subtitle: 'Renda extra deixa de ser improviso e vira plano.',
      accent: 0xFF26DE81,
      lessons: [
        MentoriaLesson(
          id: 'moderate_03_income',
          title: 'Ganhar mais sem gastar mais',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'No nível moderado, o jogo não é apenas cortar gastos. É aumentar a capacidade de gerar dinheiro e direcionar esse dinheiro para patrimônio.',
            ),
            MentoriaContentBlock.bullets([
              'Liste habilidades que podem virar serviço, produto, consultoria ou comissão.',
              'Defina uma meta de renda extra para 60 dias, não para “um dia”.',
              'Todo aumento de renda precisa de destino antes de cair na conta.',
              'Use a ordem: quitar dívidas ruins, fortalecer reserva, investir e só depois aumentar padrão de vida.',
              'Referência conceitual: Do Mil ao Milhão, Thiago Nigro. Enriquecer envolve gastar bem, investir melhor e ganhar mais.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Plano de renda extra',
            prompt:
                r'Escolha uma habilidade monetizável e defina uma primeira meta realista de renda extra para os próximos 60 dias.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'moderate_diversification',
      title: 'Diversificação Inteligente',
      subtitle: 'Sair do básico sem abandonar a segurança construída.',
      accent: 0xFFFFA502,
      lessons: [
        MentoriaLesson(
          id: 'moderate_04_diversification',
          title: 'Diversificar não é comprar de tudo',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Diversificar é distribuir risco com intenção. O moderado precisa crescer sem transformar curiosidade em bagunça.',
            ),
            MentoriaContentBlock.bullets([
              'Mantenha reserva e objetivos de curto prazo em ativos conservadores.',
              'Use médio e longo prazo para estudar FIIs, ETFs, renda fixa longa e fundos adequados.',
              'Não compre um ativo só porque alguém falou bem dele.',
              'Tenha uma razão para cada investimento: prazo, risco, objetivo e função na carteira.',
              'Referência conceitual: Pai Rico, Pai Pobre, Robert Kiyosaki. O objetivo é construir ativos que fortaleçam sua liberdade.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Função de cada ativo',
            prompt:
                'Escolha um investimento que você tem ou quer estudar e escreva: qual objetivo, prazo, risco e função dele na sua vida?',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'moderate_emotional_risk',
      title: 'Controle Emocional no Crescimento',
      subtitle: 'O moderado precisa aprender a oscilar sem abandonar o plano.',
      accent: 0xFF6366F1,
      priority: MentoriaPriority.importante,
      lessons: [
        MentoriaLesson(
          id: 'moderate_05_emotional_risk',
          title: 'Oscilação não é fracasso',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Quando você começa a buscar mais retorno, precisa aprender a lidar com variação. A pessoa moderada vence quando entende que processo vale mais que emoção do dia.',
            ),
            MentoriaContentBlock.bullets([
              'Defina antes o que faria você vender, manter ou comprar mais.',
              'Não tome decisão importante em dia de medo ou euforia.',
              'Acompanhe sua evolução mensal, não sua ansiedade diária.',
              'Errar faz parte; repetir erro sem aprender é que custa caro.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Regra contra impulso',
            prompt:
                'Crie uma regra pessoal para não investir ou vender no calor da emoção. Exemplo: esperar 24 horas e revisar o motivo.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'moderate_next_level',
      title: 'Preparação para o Próximo Nível',
      subtitle: 'Ambição com maturidade antes de assumir mais risco.',
      accent: 0xFFE5B100,
      priority: MentoriaPriority.importante,
      lessons: [
        MentoriaLesson(
          id: 'moderate_06_next_level',
          title: 'Crescer sem se perder',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'O próximo nível não é pressa. É maturidade. Antes de assumir mais risco, você precisa provar para si mesmo que consegue executar, estudar, aportar e manter estabilidade emocional.',
            ),
            MentoriaContentBlock.bullets([
              'Tenha reserva montada ou em estágio avançado.',
              'Tenha rotina de estudo e acompanhamento dos investimentos.',
              'Tenha renda, metas e limites claros.',
              'Refaça o teste apenas quando seu comportamento mudar, não apenas sua vontade.',
              'Você vai vencer se respeitar o processo e continuar ajustando o caminho.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Pronto para avançar?',
            prompt:
                'Escreva quais sinais mostram que você amadureceu financeiramente desde o perfil conservador.',
          ),
        ),
      ],
    ),
  ];

  static const List<MentoriaModule> _aggressiveModules = [
    MentoriaModule(
      id: 'aggressive_execution',
      title: 'Expansão com Risco Calculado',
      subtitle: 'Execução forte, análise e proteção contra impulsividade.',
      accent: 0xFFF44336,
      lessons: [
        MentoriaLesson(
          id: 'aggressive_01_execution',
          title: 'Coragem sem método vira prejuízo',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'O arrojado pode buscar retornos maiores, mas precisa de processo. O maior risco deste perfil é confundir confiança com pressa.',
            ),
            MentoriaContentBlock.bullets([
              'Tenha tese, limite de perda e horizonte antes de entrar em qualquer ativo.',
              'Diversifique para sobreviver aos ciclos ruins.',
              'Nunca use dinheiro de reserva para risco alto.',
              'Estude negócios, valuation, ciclos de mercado e gestão emocional.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Regra de risco',
            prompt:
                'Escreva qual percentual máximo do patrimônio você aceita expor a ativos de maior risco.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'aggressive_strategy',
      title: 'Tese Antes da Entrada',
      subtitle:
          'O arrojado precisa saber por que entra, quando sai e o que invalida sua ideia.',
      accent: 0xFFFFA502,
      lessons: [
        MentoriaLesson(
          id: 'aggressive_02_strategy',
          title: 'Sem tese, você só está torcendo',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Investimento arrojado não é impulso com nome bonito. Antes de comprar qualquer ativo volátil, você precisa ter uma tese simples, escrita e revisável.',
            ),
            MentoriaContentBlock.bullets([
              'Defina o motivo da entrada: crescimento, preço descontado, tendência, proteção ou assimetria.',
              'Escreva o que faria você sair: perda de fundamento, limite de risco, mudança no ciclo ou erro na tese.',
              'Separe oportunidade de ansiedade. Nem todo movimento do mercado exige reação.',
              'Referência conceitual: O Investidor Inteligente, Benjamin Graham. Margem de segurança protege o investidor de excesso de confiança.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Tese em uma página',
            prompt:
                'Escolha um ativo de maior risco e escreva: por que entraria, quanto aceitaria perder e qual fato invalidaria sua decisão.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'aggressive_portfolio',
      title: 'Carteira Antifrágil',
      subtitle: 'Crescer sem deixar um único erro destruir anos de construção.',
      accent: 0xFF26DE81,
      lessons: [
        MentoriaLesson(
          id: 'aggressive_03_portfolio',
          title: 'Seu patrimônio precisa sobreviver aos dias ruins',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'O arrojado vence quando aceita que risco alto exige estrutura. Uma carteira forte tem caixa, proteção, diversificação e espaço controlado para assimetria.',
            ),
            MentoriaContentBlock.bullets([
              'Preserve reserva de emergência fora de risco alto.',
              'Use percentuais máximos por classe e por ativo.',
              'Não confunda diversificação com comprar tudo que aparece.',
              'Rebalanceie com calendário, não com emoção.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Mapa de exposição',
            prompt:
                'Defina o percentual máximo para renda variável, cripto, ativos internacionais e caixa. Escreva também o limite máximo por ativo.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'aggressive_emotion',
      title: 'Domínio Emocional',
      subtitle:
          'A mente do arrojado precisa ser mais forte que a volatilidade.',
      accent: 0xFF6366F1,
      priority: MentoriaPriority.importante,
      lessons: [
        MentoriaLesson(
          id: 'aggressive_04_emotion',
          title: 'Euforia e medo cobram caro',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'Quanto maior o risco, mais cara fica uma decisão emocional. O arrojado precisa criar regras para os dias em que estiver confiante demais ou assustado demais.',
            ),
            MentoriaContentBlock.bullets([
              'Não aumente posição depois de uma sequência de ganhos sem revisar a tese.',
              'Não venda em pânico sem comparar preço, fundamento e horizonte.',
              'Tenha diário de decisões para identificar padrões de erro.',
              'Descanse antes de decisões grandes. Cansaço parece intuição, mas muitas vezes é ansiedade.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Regra de proteção emocional',
            prompt:
                'Crie uma regra para dias de euforia e outra para dias de medo. Exemplo: esperar 24 horas antes de aumentar ou encerrar posição.',
          ),
        ),
      ],
    ),
    MentoriaModule(
      id: 'aggressive_review',
      title: 'Revisão e Evolução',
      subtitle:
          'O arrojado cresce quando mede resultado, processo e comportamento.',
      accent: 0xFF00D9FF,
      priority: MentoriaPriority.importante,
      lessons: [
        MentoriaLesson(
          id: 'aggressive_05_review',
          title: 'Quem não revisa repete erro caro',
          videoUrl: '',
          blocks: [
            MentoriaContentBlock.paragraph(
              'A evolução arrojada não vem de acertar sempre. Vem de errar menor, aprender mais rápido e proteger o patrimônio enquanto busca crescimento.',
            ),
            MentoriaContentBlock.bullets([
              'Revise carteira mensalmente e tese trimestralmente.',
              'Separe resultado bom de decisão boa. Às vezes você ganha fazendo errado.',
              'Compare sua evolução com seu plano, não com a vida dos outros.',
              'Você vai vencer se mantiver disciplina, paciência e humildade para corrigir rota.',
            ]),
          ],
          checkpoint: MentoriaCheckpoint(
            title: 'Ritual mensal',
            prompt:
                'Defina um dia fixo do mês para revisar carteira, anotar decisões e ajustar percentuais sem agir por impulso.',
          ),
        ),
      ],
    ),
  ];

  static Future<Set<String>> completedLessonIds() async {
    final prefs = await SharedPreferences.getInstance();
    final ids =
        prefs.getStringList(_prefsMentoriaCompletedLessonsKey) ?? const [];
    return ids.toSet();
  }

  static Future<void> markLessonCompleted(String lessonId) async {
    final prefs = await SharedPreferences.getInstance();
    final ids =
        (prefs.getStringList(_prefsMentoriaCompletedLessonsKey) ?? const [])
            .toSet();
    ids.add(lessonId);
    await prefs.setStringList(_prefsMentoriaCompletedLessonsKey, ids.toList());
  }

  static int totalLessonsCount({Profile profile = Profile.conservador}) {
    var total = 0;
    for (final m in modules(profile: profile)) {
      total += m.lessons.length;
    }
    return total;
  }

  static Future<double> mentorScoreProgress01() async {
    final profile = await currentInvestorProfile() ?? Profile.conservador;
    final done = await completedLessonIds();
    final activeLessonIds = modules(
      profile: profile,
    ).expand((m) => m.lessons).map((lesson) => lesson.id).toSet();
    final doneInActiveTrack = done.intersection(activeLessonIds).length;
    final total = totalLessonsCount(profile: profile);
    if (total <= 0) return 0;
    return (doneInActiveTrack / total).clamp(0.0, 1.0);
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
      final key =
          '${d.year.toString().padLeft(4, '0')}-'
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
    final saldo = doc.data()?['saldoConta'];
    return saldo is num ? saldo.toDouble() : 0.0;
  }

  static Future<double> buscarRendaMensal(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    final renda = doc.data()?['rendaMensal'];
    return renda is num ? renda.toDouble() : 0.0;
  }

  static Future<bool> usuarioTemInvestimentos(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    final investimentos = doc.data()?['temInvestimentos'];
    return investimentos == true;
  }

  static Future<int> buscarQuantidadeDiasSemJuros(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    final dias = doc.data()?['diasSemJuros'];
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
                'Tente manter seu uso abaixo de 30% para melhorar seu score bancário.',
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
    this.priority = MentoriaPriority.essencial,
  });

  final String id;
  final String title;
  final String subtitle;
  final int accent; // 0xAARRGGBB
  final List<MentoriaLesson> lessons;
  final MentoriaPriority priority;
}

enum MentoriaPriority { essencial, importante }

extension MentoriaPriorityLabel on MentoriaPriority {
  String get label {
    switch (this) {
      case MentoriaPriority.essencial:
        return 'Essencial';
      case MentoriaPriority.importante:
        return 'Importante';
    }
  }
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

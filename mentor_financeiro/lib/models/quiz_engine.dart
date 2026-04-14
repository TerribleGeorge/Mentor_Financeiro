class QuizQuestion {
  final String question;
  final List<QuizOption> options;
  final String referencePage;
  final int correctIndex;
  final String topicName;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.referencePage,
    required this.correctIndex,
    required this.topicName,
  });
}

class QuizOption {
  final String text;
  final bool isCorrect;

  const QuizOption({required this.text, required this.isCorrect});
}

class QuizEngine {
  static const List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Qual é o investimento de menor risco de crédito no Brasil?',
      options: [
        QuizOption(text: 'CDB', isCorrect: false),
        QuizOption(text: 'Tesouro Direto', isCorrect: true),
        QuizOption(text: 'Ações', isCorrect: false),
      ],
      referencePage: '/conhecimento/investimentos',
      correctIndex: 1,
      topicName: 'Tesouro Direto',
    ),
    QuizQuestion(
      question: 'O que é o FGC?',
      options: [
        QuizOption(text: 'Fundo de Garantia de Crédito', isCorrect: true),
        QuizOption(text: 'Fundo Garantidor de Cotas', isCorrect: false),
        QuizOption(text: 'Fundo de Gestão Centralizada', isCorrect: false),
      ],
      referencePage: '/conhecimento/investimentos',
      correctIndex: 0,
      topicName: 'FGC',
    ),
    QuizQuestion(
      question: 'Qual é a principal vantagem das LCI e LCA?',
      options: [
        QuizOption(text: 'Alta rentabilidade garantida', isCorrect: false),
        QuizOption(text: 'Isenção de IR para pessoa física', isCorrect: true),
        QuizOption(text: 'Garantia eterna', isCorrect: false),
      ],
      referencePage: '/conhecimento/investimentos',
      correctIndex: 1,
      topicName: 'LCI/LCA',
    ),
    QuizQuestion(
      question: 'O que é marcação a mercado?',
      options: [
        QuizOption(text: 'Sistema de precificação diária', isCorrect: true),
        QuizOption(text: 'Método de investimento', isCorrect: false),
        QuizOption(text: 'Tipo de imposto', isCorrect: false),
      ],
      referencePage: '/conhecimento/investimentos',
      correctIndex: 0,
      topicName: 'Marcação a Mercado',
    ),
    QuizQuestion(
      question: 'Qual a alíquota de IR para ações com menos de 180 dias?',
      options: [
        QuizOption(text: '15%', isCorrect: false),
        QuizOption(text: '20%', isCorrect: false),
        QuizOption(text: '15% sobre o lucro', isCorrect: true),
      ],
      referencePage: '/conhecimento/investimentos',
      correctIndex: 2,
      topicName: 'Ações',
    ),
    QuizQuestion(
      question: 'O que é o CDI?',
      options: [
        QuizOption(
          text: 'Certificado de Depósito Interbancário',
          isCorrect: true,
        ),
        QuizOption(text: 'Centro de Dados Internacional', isCorrect: false),
        QuizOption(text: 'Crédito Direto Informado', isCorrect: false),
      ],
      referencePage: '/conhecimento/dicionario',
      correctIndex: 0,
      topicName: 'CDI',
    ),
    QuizQuestion(
      question: 'O que significa diversificar investimentos?',
      options: [
        QuizOption(
          text: 'Colocar todo dinheiro em um ativo só',
          isCorrect: false,
        ),
        QuizOption(text: 'Distribuir entre diferentes ativos', isCorrect: true),
        QuizOption(text: 'Investir apenas em ações', isCorrect: false),
      ],
      referencePage: '/conhecimento/estrategias',
      correctIndex: 1,
      topicName: 'Diversificação',
    ),
    QuizQuestion(
      question: 'Qual é a regra de ouro para emergência?',
      options: [
        QuizOption(text: 'Guardar 1-3 meses de despesas', isCorrect: false),
        QuizOption(text: 'Guardar 3-6 meses de despesas', isCorrect: true),
        QuizOption(text: 'Guardar 12 meses de despesas', isCorrect: false),
      ],
      referencePage: '/conhecimento/estrategias',
      correctIndex: 1,
      topicName: 'Reserva de Emergência',
    ),
    QuizQuestion(
      question: 'O que é Dividend Yield?',
      options: [
        QuizOption(text: 'Valor pago em dividendos', isCorrect: false),
        QuizOption(text: 'Percentual pago em dividendos', isCorrect: true),
        QuizOption(text: 'Imposto sobre dividendos', isCorrect: false),
      ],
      referencePage: '/conhecimento/dicionario',
      correctIndex: 1,
      topicName: 'Dividend Yield',
    ),
    QuizQuestion(
      question: 'Qual a principal vantagem dos FIIs?',
      options: [
        QuizOption(text: 'Liquidez imediata total', isCorrect: false),
        QuizOption(text: 'Isenção de IR sobre dividendos', isCorrect: true),
        QuizOption(text: 'Garantia do FGC', isCorrect: false),
      ],
      referencePage: '/conhecimento/investimentos',
      correctIndex: 1,
      topicName: 'FIIs',
    ),
    QuizQuestion(
      question: 'O que significa "levar até o vencimento"?',
      options: [
        QuizOption(text: 'Vender antes do prazo', isCorrect: false),
        QuizOption(text: 'Manter o título até o final', isCorrect: true),
        QuizOption(text: 'Renovar automaticamente', isCorrect: false),
      ],
      referencePage: '/conhecimento/investimentos',
      correctIndex: 1,
      topicName: 'Vencimento',
    ),
    QuizQuestion(
      question: 'O que é a Selic?',
      options: [
        QuizOption(text: 'Taxa básica de juros', isCorrect: true),
        QuizOption(text: 'Tipo de ação', isCorrect: false),
        QuizOption(text: 'Corretora de valores', isCorrect: false),
      ],
      referencePage: '/conhecimento/dicionario',
      correctIndex: 0,
      topicName: 'Selic',
    ),
  ];

  static int calculateScore(List<int?> answers) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (answers[i] != null && answers[i] == questions[i].correctIndex) {
        score++;
      }
    }
    return score;
  }

  static List<QuizQuestion> getWrongAnswers(List<int?> answers) {
    List<QuizQuestion> wrong = [];
    for (int i = 0; i < questions.length; i++) {
      if (answers[i] == null || answers[i] != questions[i].correctIndex) {
        wrong.add(questions[i]);
      }
    }
    return wrong;
  }
}

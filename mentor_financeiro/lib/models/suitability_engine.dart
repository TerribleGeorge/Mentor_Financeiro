class Question {
  final String question;
  final List<Option> options;

  const Question({required this.question, required this.options});
}

class Option {
  final String text;
  final int value;

  const Option({required this.text, required this.value});
}

class SuitabilityEngine {
  static const List<Question> questions = [
    Question(
      question: 'Qual é a sua idade?',
      options: [
        Option(text: 'Acima de 60 anos', value: 1),
        Option(text: 'Entre 45 e 60 anos', value: 2),
        Option(text: 'Menos de 45 anos', value: 3),
      ],
    ),
    Question(
      question: 'Qual seu objetivo principal ao investir?',
      options: [
        Option(text: 'Preservar o patrimônio (segurança)', value: 1),
        Option(text: 'Equilibrar segurança com crescimento', value: 2),
        Option(text: 'Maximizar retornos (aceito riscos)', value: 3),
      ],
    ),
    Question(
      question:
          'Por quanto tempo você pretende deixar esse dinheiro investido?',
      options: [
        Option(text: 'Menos de 1 ano', value: 1),
        Option(text: 'Entre 1 e 3 anos', value: 2),
        Option(text: 'Mais de 3 anos', value: 3),
      ],
    ),
    Question(
      question: 'Como você reage a perdas de 20% em um mês?',
      options: [
        Option(text: 'Vendo tudo imediatamente', value: 1),
        Option(text: 'Espero para ver se recupera', value: 2),
        Option(text: 'Compra mais (oportunidade)', value: 3),
      ],
    ),
    Question(
      question: 'Qual seu conhecimento sobre investimentos?',
      options: [
        Option(text: 'Iniciante (quase nada)', value: 1),
        Option(text: 'Intermediário (conheço algumas opções)', value: 2),
        Option(text: 'Avançado (sou bem informado)', value: 3),
      ],
    ),
    Question(
      question: 'De onde vem sua renda principal?',
      options: [
        Option(text: 'Aposentadoria ou renda fixa', value: 1),
        Option(text: 'Salário estável', value: 2),
        Option(text: 'Renda variável ou negócios', value: 3),
      ],
    ),
    Question(
      question: 'Você tem reservas para emergências?',
      options: [
        Option(text: 'Não tenho nenhuma reserva', value: 1),
        Option(text: 'Tenho pouco (menos de 3 meses)', value: 2),
        Option(text: 'Tenho bastante (6+ meses)', value: 3),
      ],
    ),
    Question(
      question: 'Como você prefere receber informações sobre investimentos?',
      options: [
        Option(text: 'Só preciso de orientações simples', value: 1),
        Option(text: 'Gosto de entender antes de agir', value: 2),
        Option(text: 'Adoro analisar dados e gráficos', value: 3),
      ],
    ),
    Question(
      question: 'Se você perdesse R\$ 10.000 hoje, o que aconteceria com você?',
      options: [
        Option(text: 'Seria um problema sério', value: 1),
        Option(text: 'Sentiria, mas conseguiria absorver', value: 2),
        Option(
          text: 'Mal perceberia (dinheiro que não me faz falta)',
          value: 3,
        ),
      ],
    ),
    Question(
      question: 'Você já investiu em ações ou renda variável?',
      options: [
        Option(text: 'Nunca', value: 1),
        Option(text: 'Uma vez, mas parei', value: 2),
        Option(text: 'Sim, continuo investindo', value: 3),
      ],
    ),
    Question(
      question: 'Qual sua experiência com investimentos de risco?',
      options: [
        Option(text: 'Nenhuma experiência', value: 1),
        Option(text: 'Pouca experiência (poucos meses/anos)', value: 2),
        Option(text: 'Muita experiência (anos)', value: 3),
      ],
    ),
    Question(
      question:
          'Quanto do seu patrimônio você colocaria em investimentos de risco?',
      options: [
        Option(text: 'Menos de 10%', value: 1),
        Option(text: 'Entre 10% e 30%', value: 2),
        Option(text: 'Mais de 30%', value: 3),
      ],
    ),
  ];

  static Profile calculateProfile(int totalScore) {
    if (totalScore >= 12 && totalScore <= 18) {
      return Profile.conservador;
    } else if (totalScore >= 19 && totalScore <= 28) {
      return Profile.moderado;
    } else {
      return Profile.arrojado;
    }
  }
}

enum Profile { conservador, moderado, arrojado }

extension ProfileExtension on Profile {
  String get name {
    switch (this) {
      case Profile.conservador:
        return 'Conservador';
      case Profile.moderado:
        return 'Moderado';
      case Profile.arrojado:
        return 'Arrojado';
    }
  }

  String get description {
    switch (this) {
      case Profile.conservador:
        return 'Você prioriza a segurança acima de tudo. Prefere investimentos com baixo risco e história comprovada.';
      case Profile.moderado:
        return 'Você busca um equilíbrio entre segurança e rentabilidade. Aceita alguns riscos em troca de melhores retornos.';
      case Profile.arrojado:
        return 'Você está disposto a assumir riscos para buscar retornos maiores. Tem nervos de aço e visão de longo prazo.';
    }
  }

  List<String> get suggestions {
    switch (this) {
      case Profile.conservador:
        return ['Tesouro Selic', 'CDB de bancos sólidos', 'Fundos DI'];
      case Profile.moderado:
        return [
          'Tesouro IPCA+',
          'Fundos Multimercado',
          'Ações de empresas sólidas',
        ];
      case Profile.arrojado:
        return ['Ações', 'FIIs', 'Criptomoedas'];
    }
  }

  String get colorHex {
    switch (this) {
      case Profile.conservador:
        return '#4CAF50';
      case Profile.moderado:
        return '#FFC107';
      case Profile.arrojado:
        return '#F44336';
    }
  }
}

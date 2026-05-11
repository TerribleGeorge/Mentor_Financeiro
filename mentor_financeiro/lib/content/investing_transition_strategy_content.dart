import 'package:flutter/material.dart';

/// Texto educativo: investir em período sem renda fixa / desemprego.
/// Centralizado para revisões de conteúdo sem alterar layout.
abstract final class InvestingTransitionStrategyContent {
  static const String menuTitle =
      'Sem renda fixa: defesa e liquidez';
  static const String menuSubtitle =
      'Estratégias conservadoras para períodos de transição';

  static const String pageTitle =
      'Estratégias de Investimento para Períodos de Transição';

  static const String introLead =
      'Quando não há entrada previsível, o objetivo do investimento '
      'deixa de ser maximizar retorno e passa a ser sobreviver financeiramente '
      'com o mínimo de risco até restabelecer a renda.';

  // --- Secção 1 ---
  static const String section1Title = 'Foco em defesa e liquidez';
  static const IconData section1Icon = Icons.security;
  static const String section1Paragraph1 =
      'A prioridade absoluta é a preservação de capital: cada real guardado '
      'precisa estar disponível se surgir imprevisto (saúde, moradia, '
      'transporte ou oportunidade de trabalho).';
  static const String section1Paragraph2 =
      'Mantenha uma reserva de emergência capaz de cobrir de 6 a 12 meses '
      'do seu custo de vida real (não o ideal, mas o que efetivamente gasta). '
      'Somente o que exceder essa almofada deve ser considerado para '
      'investimentos com prazo ou menor liquidez.';

  // --- Secção 2 ---
  static const String section2Title = 'Ativos recomendados (segurança máxima)';
  static const IconData section2Icon = Icons.savings_outlined;

  static const List<({String title, String subtitle, IconData icon})>
      recommendedAssets = <({
    String title,
    String subtitle,
    IconData icon,
  })>[
    (
      title: 'Tesouro Selic',
      subtitle:
          'Títulos públicos pós-fixados atrelados à taxa Selic. Liquidez '
          'D+1 em mercado secundário e, na prática, um dos menores riscos de '
          'crédito do país para o investidor pessoa física.',
      icon: Icons.account_balance,
    ),
    (
      title: 'CDBs 100% do CDI',
      subtitle:
          'Depósitos bancários com rentabilidade atrelada ao CDI. Emissores '
          'sólidos e cobertura do FGC até o limite legal por instituição — '
          'leia sempre o prospecto e o enquadramento do CDB.',
      icon: Icons.verified_user_outlined,
    ),
    (
      title: 'Contas remuneradas',
      subtitle:
          'Saldo diário com rendimento automático (são “caixas” com juros). '
          'Praticidade para despesas correntes; compare taxa, limites de '
          'FGC e regras de resgate.',
      icon: Icons.account_balance_wallet_outlined,
    ),
  ];

  // --- Secção 3 ---
  static const String section3Title = 'O que evitar (alto risco)';
  static const IconData section3Icon = Icons.warning_amber_rounded;
  static const List<String> highRiskBullets = <String>[
    'Renda variável (ações e fundos de ações) sem colchão: oscilações de 20% '
        'a 40% em crises são comuns; sem salário, cada queda vira estresse '
        'real.',
    'Day trade e alavancagem: alta probabilidade de perda sequencial; exige '
        'tempo, disciplina e capital que você não pode “apostar”.',
    'Criptoativos: volatilidade extrema, risco regulatório e menor '
        'previsibilidade de liquidez em stress de mercado.',
  ];

  /// Linhas da tabela comparativa (texto curto para caber em ecrãs pequenos).
  static const List<({
    String ativo,
    String seguranca,
    String liquidez,
    String recomendacao,
  })> comparisonRows = <({
    String ativo,
    String seguranca,
    String liquidez,
    String recomendacao,
  })>[
    (
      ativo: 'Tesouro Selic',
      seguranca: 'Altíssima\n(risco soberano)',
      liquidez: 'D+1\n(mercado secundário)',
      recomendacao: 'Forte\n(base da reserva)',
    ),
    (
      ativo: 'CDB 100% CDI',
      seguranca: 'Alta\n(+ FGC até limite)',
      liquidez: 'Contrato\n(varia por banco)',
      recomendacao: 'Forte\n(após reserva)',
    ),
    (
      ativo: 'Ações',
      seguranca: 'Baixa\n(risco de mercado)',
      liquidez: 'D+2 ou mais',
      recomendacao: 'Fraca\n(sem renda fixa)',
    ),
  ];

  static const String comparisonFootnote =
      'A tabela simplifica; leia prospectos, LFTs vs LTNs, prazos de CDB e '
      'custódia antes de decidir.';

  // --- Dicas práticas ---
  static const String tipsTitle = 'Dicas práticas';
  static const IconData tipsIcon = Icons.lightbulb_outline;
  static const List<({IconData icon, String title, String body})> tips =
      <({IconData icon, String title, String body})>[
    (
      icon: Icons.credit_card_off_outlined,
      title: 'Quite dívidas caras antes de “investir por investir”',
      body:
          'Cartão de crédito, cheque especial e empréstimos pessoais comem '
          'rendimentos conservadores inteiros. Reduzir juros pagos é o '
          'melhor “retorno garantido” nesta fase.',
    ),
    (
      icon: Icons.table_chart_outlined,
      title: 'Atenção à tributação regressiva do IR',
      body:
          'Em Tesouro Direto e CDB de bancos, o IR sobre ganho segue tabela '
          'regressiva conforme o tempo que o título fica na sua posição. '
          'Resgates muito cedo pagam alíquota maior; planeje resgates para '
          'não destruir o rendimento líquido quando precisar do dinheiro.',
    ),
  ];
}

import 'package:flutter/material.dart';

/// Onde o produto faz sentido no catálogo regional.
enum InvestmentProductAudience {
  /// Ex.: CDB, Tesouro Direto, LCA — apenas Brasil.
  brazilOnly,

  /// Ex.: ETFs globais acentuados para quem não está no mercado BR.
  internationalFocus,

  /// Mostrar em qualquer região.
  universal,
}

class InvestmentProductDefinition {
  const InvestmentProductDefinition({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.audience,
  });

  final String id;
  final String title;
  final String description;
  final IconData icon;
  final InvestmentProductAudience audience;
}

/// Catálogo para UI educativa e para o formulário de cadastro de investimento.
abstract final class InvestmentCatalog {
  static const List<InvestmentProductDefinition> all = [
    InvestmentProductDefinition(
      id: 'poupanca',
      title: 'Poupança',
      description:
          'Conta poupança tradicional. Liquidez imediata; rendimento costuma ficar abaixo da inflação em muitos países.',
      icon: Icons.savings_outlined,
      audience: InvestmentProductAudience.universal,
    ),
    InvestmentProductDefinition(
      id: 'tesouro_direto',
      title: 'Tesouro Direto',
      description:
          'Títulos públicos federais (Brasil). Considerados baixo risco de crédito soberano no Brasil.',
      icon: Icons.trending_up,
      audience: InvestmentProductAudience.brazilOnly,
    ),
    InvestmentProductDefinition(
      id: 'cdb',
      title: 'CDB',
      description:
          'Certificado de depósito bancário (Brasil). Renda fixa com proteção do FGC até limites legais.',
      icon: Icons.account_balance,
      audience: InvestmentProductAudience.brazilOnly,
    ),
    InvestmentProductDefinition(
      id: 'lci_lca',
      title: 'LCI e LCA',
      description:
          'Letras de crédito imobiliário e do agronegócio (Brasil). Isenção de IR para PF em condições específicas.',
      icon: Icons.insights,
      audience: InvestmentProductAudience.brazilOnly,
    ),
    InvestmentProductDefinition(
      id: 'fundos',
      title: 'Fundos de investimento',
      description:
          'Cestas geridas por gestores. Perfil de risco variável (conservador a agressivo).',
      icon: Icons.pie_chart_outline,
      audience: InvestmentProductAudience.universal,
    ),
    InvestmentProductDefinition(
      id: 'acoes',
      title: 'Ações',
      description:
          'Participação em empresas listadas. Retorno e volatilidade maiores; exige tolerância ao risco.',
      icon: Icons.show_chart,
      audience: InvestmentProductAudience.universal,
    ),
    InvestmentProductDefinition(
      id: 'etf',
      title: 'ETFs',
      description:
          'Fundos negociados em bolsa que replicam índices (ex.: S&P 500, MSCI). Diversificação com liquidez diária.',
      icon: Icons.multiline_chart_outlined,
      audience: InvestmentProductAudience.internationalFocus,
    ),
    InvestmentProductDefinition(
      id: 'stocks_global',
      title: 'Ações internacionais',
      description:
          'Bolsa fora do Brasil (ex.: NYSE, NASDAQ). Moeda e tributação dependem do país da conta.',
      icon: Icons.public,
      audience: InvestmentProductAudience.internationalFocus,
    ),
    InvestmentProductDefinition(
      id: 'cripto',
      title: 'Criptoativos',
      description:
          'Ativos digitais voláteis. Sem garantia de fundo garantidor; adequado apenas a perfil arrojado.',
      icon: Icons.currency_bitcoin,
      audience: InvestmentProductAudience.universal,
    ),
    InvestmentProductDefinition(
      id: 'debentures',
      title: 'Debêntures',
      description:
          'Títulos de dívida corporativa. Risco de crédito da emissora; cupons fixos ou variáveis.',
      icon: Icons.diamond_outlined,
      audience: InvestmentProductAudience.universal,
    ),
  ];

  /// Itens para listas expansíveis (educação).
  static List<InvestmentProductDefinition> forEducation(bool isBrazil) {
    return all.where((p) {
      switch (p.audience) {
        case InvestmentProductAudience.brazilOnly:
          return isBrazil;
        case InvestmentProductAudience.internationalFocus:
          return !isBrazil;
        case InvestmentProductAudience.universal:
          return true;
      }
    }).toList();
  }

  /// Tipos disponíveis no formulário de cadastro (ids estáveis).
  static List<InvestmentProductDefinition> forRegistration(bool isBrazil) {
    return forEducation(isBrazil);
  }
}

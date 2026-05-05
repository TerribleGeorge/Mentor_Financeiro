import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/app_theme_controller.dart';
import 'content_models.dart';

/// Repositório de conteúdo educativo com variações por região e premium.
///
/// - **Região**: `isBrazil` decide se expõe termos BR (Tesouro/CDB/SELIC).
/// - **Premium**: blocos avançados permanecem bloqueados independentemente do país.
abstract final class ContentRepository {
  static bool isPtBrLocale(Locale locale) {
    final lang = locale.languageCode.toLowerCase();
    final cc = (locale.countryCode ?? '').toUpperCase();
    // Se o app estiver em português sem countryCode, assume Brasil.
    if (lang == 'pt' && (cc.isEmpty || cc == 'BR')) return true;
    return lang == 'pt' && cc == 'BR';
  }

  static List<ContentBlock> investmentFirstSteps({
    required AppLocalizations l10n,
    required bool isBrazil,
  }) {
    return <ContentBlock>[
      ContentBlock(
        id: 'broker',
        title: l10n.investFirstSteps_brokerTitle,
        body: l10n.investFirstSteps_brokerBody,
        icon: Icons.business,
      ),
      ContentBlock(
        id: 'open_account',
        title: l10n.investFirstSteps_openAccountTitle,
        body: isBrazil
            ? l10n.investFirstSteps_openAccountBodyBr
            : l10n.investFirstSteps_openAccountBodyGlobal,
        icon: Icons.person_add,
      ),
      ContentBlock(
        id: 'transfer',
        title: l10n.investFirstSteps_transferTitle,
        body: isBrazil
            ? l10n.investFirstSteps_transferBodyBr
            : l10n.investFirstSteps_transferBodyGlobal,
        icon: Icons.swap_horiz,
      ),
      ContentBlock(
        id: 'risk_profile',
        title: l10n.investFirstSteps_riskProfileTitle,
        body: l10n.investFirstSteps_riskProfileBody,
        icon: Icons.psychology,
      ),
      ContentBlock(
        id: 'first_asset',
        title: l10n.investFirstSteps_firstAssetTitle,
        body: isBrazil
            ? l10n.investFirstSteps_firstAssetBodyBr
            : l10n.investFirstSteps_firstAssetBodyGlobal,
        icon: Icons.rocket_launch,
      ),
    ];
  }

  static ({String title, String body}) investmentFirstStepsTip({
    required AppLocalizations l10n,
    required bool isBrazil,
  }) {
    return (
      title: l10n.investFirstSteps_tipTitle,
      body: isBrazil
          ? l10n.investFirstSteps_tipBodyBr
          : l10n.investFirstSteps_tipBodyGlobal,
    );
  }

  static List<ContentMenuItem> investmentMenuItems({
    required AppLocalizations l10n,
    required bool isBrazil,
  }) {
    final items = <ContentMenuItem>[
      if (isBrazil)
        ContentMenuItem(
          id: 'tesouro',
          title: l10n.investMenu_tesouroTitle,
          icon: Icons.account_balance,
          audience: ContentAudience.brazilOnly,
        ),
      if (isBrazil)
        ContentMenuItem(
          id: 'cdb',
          title: l10n.investMenu_cdbTitle,
          icon: Icons.savings_outlined,
          audience: ContentAudience.brazilOnly,
        ),
      if (!isBrazil)
        ContentMenuItem(
          id: 'etfs',
          title: l10n.investMenu_etfsTitle,
          icon: Icons.multiline_chart_outlined,
          audience: ContentAudience.internationalOnly,
        ),
      if (!isBrazil)
        ContentMenuItem(
          id: 'sp500',
          title: l10n.investMenu_sp500Title,
          icon: Icons.auto_graph,
          audience: ContentAudience.internationalOnly,
        ),
      ContentMenuItem(
        id: 'stocks',
        title: l10n.investMenu_stocksTitle,
        icon: Icons.show_chart,
      ),
      ContentMenuItem(
        id: 'funds',
        title: l10n.investMenu_fundsTitle,
        icon: Icons.account_balance_wallet_outlined,
      ),
      ContentMenuItem(
        id: 'reits_fiis',
        title:
            isBrazil ? l10n.investMenu_fiisTitle : l10n.investMenu_reitsTitle,
        icon: Icons.apartment,
      ),
      ContentMenuItem(
        id: 'international',
        title: l10n.investMenu_internationalTitle,
        icon: Icons.public,
      ),
      ContentMenuItem(
        id: 'crypto',
        title: l10n.investMenu_cryptoTitle,
        icon: Icons.currency_bitcoin,
      ),
    ];

    return items;
  }

  static List<ContentSection> investmentStrategies({
    required AppLocalizations l10n,
    required bool isBrazil,
    required bool isPremium,
  }) {
    // Base (free): estratégias iniciais, adaptadas por região.
    final core = <ContentBlock>[
      ContentBlock(
        id: 'emergency_fund',
        title: l10n.strategy_emergencyFundTitle,
        body: isBrazil
            ? l10n.strategy_emergencyFundBodyBr
            : l10n.strategy_emergencyFundBodyGlobal,
        icon: Icons.shield,
      ),
      ContentBlock(
        id: 'buy_hold',
        title: l10n.strategy_buyHoldTitle,
        body: l10n.strategy_buyHoldBody,
        icon: Icons.shopping_bag,
      ),
      ContentBlock(
        id: 'diversification',
        title: l10n.strategy_diversificationTitle,
        body: isBrazil
            ? l10n.strategy_diversificationBodyBr
            : l10n.strategy_diversificationBodyGlobal,
        icon: Icons.inventory_2,
      ),
      ContentBlock(
        id: 'dca',
        title: l10n.strategy_dcaTitle,
        body: l10n.strategy_dcaBody,
        icon: Icons.sync,
      ),
      ContentBlock(
        id: 'smart_goals',
        title: l10n.strategy_smartGoalsTitle,
        body: l10n.strategy_smartGoalsBody,
        icon: Icons.flag,
      ),
      ContentBlock(
        id: 'budget_503020',
        title: l10n.strategy_503020Title,
        body: l10n.strategy_503020Body,
        icon: Icons.balance,
      ),
    ];

    // Deep Dive premium (bloqueado independente do país).
    final deepDive = <ContentBlock>[
      ContentBlock(
        id: 'deep_dive_asset_allocation',
        title: l10n.strategy_deepDive_allocationTitle,
        body: l10n.strategy_deepDive_allocationBody,
        icon: Icons.auto_graph,
        premiumOnly: true,
        premiumAura: PremiumThemeAura.grimm,
      ),
      ContentBlock(
        id: 'deep_dive_global_etfs',
        title: l10n.strategy_deepDive_globalEtfsTitle,
        body: l10n.strategy_deepDive_globalEtfsBody,
        icon: Icons.multiline_chart_outlined,
        premiumOnly: true,
        premiumAura: PremiumThemeAura.cyber,
      ),
      ContentBlock(
        id: 'deep_dive_taxes',
        title: l10n.strategy_deepDive_taxesTitle,
        body: l10n.strategy_deepDive_taxesBody,
        icon: Icons.receipt_long,
        premiumOnly: true,
        premiumAura: PremiumThemeAura.hive,
      ),
    ];

    return <ContentSection>[
      ContentSection(
        id: 'strategies_core',
        title: l10n.strategy_sectionCoreTitle,
        blocks: core,
      ),
      ContentSection(
        id: 'strategies_deep_dive',
        title: l10n.strategy_sectionDeepDiveTitle,
        blocks: isPremium ? deepDive : deepDive,
      ),
    ];
  }

  static bool isPremiumForContent(AppThemeController theme) {
    // Fonte única simples para as telas: o tema já espelha o entitlement.
    return theme.isPremium;
  }
}


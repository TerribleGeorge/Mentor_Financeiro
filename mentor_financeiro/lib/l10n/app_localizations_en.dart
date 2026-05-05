// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Balance';

  @override
  String get gastosDiarios => 'Daily Expenses';

  @override
  String get confirmarTransacao => 'Confirm Transaction';

  @override
  String get extrato => 'Statement';

  @override
  String get transferencias => 'Transfers';

  @override
  String get investimentos => 'Investments';

  @override
  String get configuracoes => 'Settings';

  @override
  String get perfil => 'Profile';

  @override
  String get sair => 'Logout';

  @override
  String get entrar => 'Login';

  @override
  String get cadastrar => 'Register';

  @override
  String get email => 'Email';

  @override
  String get senha => 'Password';

  @override
  String get nome => 'Name';

  @override
  String get cpf => 'ID Number';

  @override
  String get telefone => 'Phone';

  @override
  String get continuar => 'Continue';

  @override
  String get voltar => 'Back';

  @override
  String get cancelar => 'Cancel';

  @override
  String get salvar => 'Save';

  @override
  String get editar => 'Edit';

  @override
  String get excluir => 'Delete';

  @override
  String get sucesso => 'Success';

  @override
  String get erro => 'Error';

  @override
  String get carregando => 'Loading...';

  @override
  String get semDados => 'No data';

  @override
  String get tentarNovamente => 'Try again';

  @override
  String get relatorios => 'Reports';

  @override
  String get gastosPorCategoria => 'Expenses by Category';

  @override
  String get ultimosSeteDias => 'Last 7 Days';

  @override
  String get totalGasto => 'Total Spent';

  @override
  String get transacoes => 'Transactions';

  @override
  String get categoria => 'Category';

  @override
  String get data => 'Date';

  @override
  String get valor => 'Value';

  @override
  String get descricao => 'Description';

  @override
  String get alimentacao => 'Food';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Leisure';

  @override
  String get saude => 'Health';

  @override
  String get outros => 'Others';

  @override
  String get notificacoes => 'Notifications';

  @override
  String get permissaoNotificacoes => 'Notification Permission';

  @override
  String get ativarMonitoramento => 'Enable Expense Monitoring';

  @override
  String get descricaoMonitoramento =>
      'Allow the app to automatically monitor your bank transactions to organize your finances.';

  @override
  String get idioma => 'Language';

  @override
  String get moeda => 'Currency';

  @override
  String get compararInvestimentos => 'Compare Investments';

  @override
  String get descricaoLocalizacao =>
      'To compare local investments (CDB/CDI) with international rates, we need your location.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Location Permission Required';

  @override
  String get rendaFixa => 'Fixed Income';

  @override
  String get rendaVariavel => 'Variable Income';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Stocks';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Cryptocurrencies';

  @override
  String get rendimento => 'Return';

  @override
  String get rentabilidade => 'Profitability';

  @override
  String get aplicar => 'Apply';

  @override
  String get resgatar => 'Redeem';

  @override
  String get simular => 'Simulate';

  @override
  String get metas => 'Goals';

  @override
  String get estrategias => 'Strategies';

  @override
  String get conhecimento => 'Knowledge';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Send message';

  @override
  String get digiteMensagem => 'Type a message...';

  @override
  String get alertaGastos => 'Spending Alert';

  @override
  String alertaGastosMsg(int percent) {
    return 'You already used $percent% of your credit limit.';
  }

  @override
  String get fechamentoFatura => 'Invoice Closing';

  @override
  String get fechamentoFaturaMsg =>
      'Tomorrow is closing day. Great time to review expenses.';

  @override
  String get faturaVencendo => 'Invoice Due';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Invoice due in $dias day(s). Check your balance.';
  }

  @override
  String get regra30 => 'Tip: 30% Rule';

  @override
  String get regra30Msg => 'Keep usage below 30% to improve your Credit Score.';

  @override
  String get diaDeOuro => 'Golden Day!';

  @override
  String get diaDeOuroMsg =>
      'Your purchases today will only be paid in 40 days!';

  @override
  String get alertaJuros => 'Warning: Interest';

  @override
  String get alertaJurosMsg =>
      'Your balance doesn\'t cover the bill. Avoid revolving credit!';

  @override
  String get notaSaude => 'Financial Health';

  @override
  String get notaExcelente => 'Excellent! You have great financial health.';

  @override
  String get notaBom => 'Good, but can improve.';

  @override
  String get notaAtencao => 'Attention to spending.';

  @override
  String get notaRevisar => 'Review your finances.';

  @override
  String get mentorInsightTitle => 'Mentor guidance';

  @override
  String get mentorInsightLoading => 'Fetching market data…';

  @override
  String get mentorInsightError =>
      'Could not load data right now. Try again shortly.';

  @override
  String get mentorInsightOffline =>
      'You\'re offline. Connect to fetch quotes and Mentor insights.';

  @override
  String get mentorAllocationDefensive =>
      'Given current volatility, prioritize capital preservation and liquidity before chasing returns.';

  @override
  String get mentorAllocationBalanced =>
      'Balance protection and growth: diversify and revisit your goal horizon.';

  @override
  String get mentorAllocationOffensive =>
      'Your profile allows more risk: stay disciplined and avoid heavy concentration.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Symbols reviewed: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatic (language)';

  @override
  String get compoundCalculatorTitle => 'Mentor Calculator — Compound Interest';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulate contributions, nominal vs real gain (after inflation), and mentor notes.';

  @override
  String get compoundInitialLabel => 'Initial lump sum';

  @override
  String get compoundMonthlyLabel => 'Monthly contribution';

  @override
  String get compoundRateLabel => 'Interest rate';

  @override
  String get compoundRateAnnual => 'per year';

  @override
  String get compoundRateMonthly => 'per month';

  @override
  String get compoundHorizonLabel => 'Time horizon';

  @override
  String get compoundHorizonYears => 'years';

  @override
  String get compoundHorizonMonths => 'months';

  @override
  String get compoundInflationLabel => 'Estimated inflation (% per year)';

  @override
  String get compoundCalculate => 'Calculate';

  @override
  String get compoundChartInvested => 'Total invested';

  @override
  String get compoundChartInterest => 'Interest earned';

  @override
  String get compoundSummaryNominalEnd => 'Ending balance (nominal)';

  @override
  String get compoundSummaryRealGain => 'Real gain (purchasing power)';

  @override
  String get compoundMentorCardTitle => 'Mentor advice';

  @override
  String get compoundInvalidInput => 'Enter valid values (horizon > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor tone';

  @override
  String get userPersonaNovice => 'Beginner';

  @override
  String get userPersonaStrategist => 'Strategist';

  @override
  String get userPersonaRiskTaker => 'Risk-taker';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Open full mentor insight';

  @override
  String get investFirstSteps_title => 'First steps';

  @override
  String get investFirstSteps_brokerTitle => 'Choose a broker';

  @override
  String get investFirstSteps_brokerBody =>
      'Look for regulated, reputable institutions. Compare fees, products, and reliability before opening an account.';

  @override
  String get investFirstSteps_openAccountTitle => 'Open your account';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digital onboarding. In Brazil, you typically need CPF/RG and sometimes proof of address.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digital onboarding varies by country. Typically you need an ID document and identity/address verification.';

  @override
  String get investFirstSteps_transferTitle => 'Transfer funds';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Send money via PIX or bank transfer to your broker. The balance becomes available to invest.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Transfer funds via bank transfer or local payment methods (depends on your country). The balance becomes available to invest.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Know your risk profile';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Answer a suitability questionnaire. Understand whether you are conservative, moderate, or aggressive.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Buy your first asset';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Start with an emergency fund (Tesouro Selic or a daily-liquidity CDB). Then diversify gradually.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Start with an emergency fund (high-yield cash, money market funds, or short-term Treasury bonds). Then diversify gradually.';

  @override
  String get investFirstSteps_tipTitle => 'Mentor tip:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Start small, invest consistently, and avoid trying to time the market. Time is your best ally.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Start small, invest consistently, and avoid trying to time the market. Time is your best ally.';

  @override
  String get investMenu_tesouroTitle => 'Brazilian Treasuries';

  @override
  String get investMenu_cdbTitle => 'Bank fixed income (CDB)';

  @override
  String get investMenu_etfsTitle => 'International ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (index)';

  @override
  String get investMenu_stocksTitle => 'Stocks';

  @override
  String get investMenu_fundsTitle => 'Funds';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Register investment';

  @override
  String investRegionHintBr(String country) {
    return 'Effective country: $country · Brazil catalog (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Effective country: $country · Global catalog (ETFs, NYSE/NASDAQ…). Priority: store (RevenueCat) · fallback locale/IP.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Essential strategies';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Emergency fund';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Your financial shield. Cover 6–12 months of expenses. Prioritize daily liquidity and low risk (e.g., Tesouro Selic or CDI-linked CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Your financial shield. Cover 6–12 months of expenses. Prioritize daily liquidity and low risk (e.g., money market funds and short-term Treasury bonds).';

  @override
  String get strategy_buyHoldTitle => 'Buy & Hold';

  @override
  String get strategy_buyHoldBody =>
      'Buy quality assets and hold for the long term. Focus on discipline, quality, and reinvestment over time.';

  @override
  String get strategy_diversificationTitle => 'Diversification';

  @override
  String get strategy_diversificationBodyBr =>
      'Spread your capital across fixed income, stocks, FIIs, and international assets to reduce risk and improve risk-adjusted returns.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Spread your capital across bonds, stocks, REITs, and international exposure to reduce risk and improve risk-adjusted returns.';

  @override
  String get strategy_dcaTitle => 'Dollar-cost averaging (DCA)';

  @override
  String get strategy_dcaBody =>
      'Consistency beats genius. Investing every month is often more effective than trying to pick the perfect entry point.';

  @override
  String get strategy_smartGoalsTitle => 'SMART goals';

  @override
  String get strategy_smartGoalsBody =>
      'Your goals should be specific, measurable, achievable, relevant, and time-bound.';

  @override
  String get strategy_503020Title => '50-30-20 rule';

  @override
  String get strategy_503020Body =>
      'A simple budgeting framework: 50% needs, 30% wants, 20% investing and goals.';

  @override
  String get strategy_deepDive_allocationTitle => 'Asset allocation (advanced)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Learn how to build an allocation by goal and horizon, adjusting risk, correlation, and rebalancing.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETFs and indices (advanced)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Learn about global indices (e.g., S&P 500), ETFs, and how to build international exposure with discipline.';

  @override
  String get strategy_deepDive_taxesTitle => 'Taxes and reporting (advanced)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Understand core tax concepts and how to keep records to report investments safely.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium content. Activate a Cyber/Grimm/Hive theme to unlock the investment Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Showcase';

  @override
  String get homeShowcaseProfileSimTitle => 'Risk profile quiz';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Find your investor profile in a few minutes.';

  @override
  String get homeShowcaseStrategiesTitle => 'Recommended strategies';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Direct shortcuts to learn and apply strategies.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Quizzes & Strategies';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Quick access to the risk profile quiz and recommended strategies.';

  @override
  String get quizProfile_title => 'Risk profile quiz';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get quizProfile_badge => 'RISK PROFILE QUIZ';

  @override
  String get quizProfile_resultTitle => 'YOUR PROFILE IS';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEAL INVESTMENTS:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'EXPLORE INVESTMENTS';

  @override
  String get quizProfile_exit => 'EXIT';

  @override
  String get quizKnowledge_title => 'Knowledge quiz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Question $current of $total';
  }
}

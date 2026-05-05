// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Mentor Financeiro';

  @override
  String get saldo => 'Saldo';

  @override
  String get gastosDiarios => 'Gastos Diários';

  @override
  String get confirmarTransacao => 'Confirmar Transação';

  @override
  String get extrato => 'Extrato';

  @override
  String get transferencias => 'Transferências';

  @override
  String get investimentos => 'Investimentos';

  @override
  String get configuracoes => 'Configurações';

  @override
  String get perfil => 'Perfil';

  @override
  String get sair => 'Sair';

  @override
  String get entrar => 'Entrar';

  @override
  String get cadastrar => 'Cadastrar';

  @override
  String get email => 'E-mail';

  @override
  String get senha => 'Senha';

  @override
  String get nome => 'Nome';

  @override
  String get cpf => 'CPF';

  @override
  String get telefone => 'Telefone';

  @override
  String get continuar => 'Continuar';

  @override
  String get voltar => 'Voltar';

  @override
  String get cancelar => 'Cancelar';

  @override
  String get salvar => 'Salvar';

  @override
  String get editar => 'Editar';

  @override
  String get excluir => 'Excluir';

  @override
  String get sucesso => 'Sucesso';

  @override
  String get erro => 'Erro';

  @override
  String get carregando => 'Carregando...';

  @override
  String get semDados => 'Sem dados';

  @override
  String get tentarNovamente => 'Tentar novamente';

  @override
  String get relatorios => 'Relatórios';

  @override
  String get gastosPorCategoria => 'Gastos por Categoria';

  @override
  String get ultimosSeteDias => 'Últimos 7 Dias';

  @override
  String get totalGasto => 'Total Gasto';

  @override
  String get transacoes => 'Transações';

  @override
  String get categoria => 'Categoria';

  @override
  String get data => 'Data';

  @override
  String get valor => 'Valor';

  @override
  String get descricao => 'Descrição';

  @override
  String get alimentacao => 'Alimentação';

  @override
  String get transporte => 'Transporte';

  @override
  String get lazer => 'Lazer';

  @override
  String get saude => 'Saúde';

  @override
  String get outros => 'Outros';

  @override
  String get notificacoes => 'Notificações';

  @override
  String get permissaoNotificacoes => 'Permissão de Notificações';

  @override
  String get ativarMonitoramento => 'Ativar Monitoramento de Gastos';

  @override
  String get descricaoMonitoramento =>
      ' Permite que o app monitore automaticamente suas transações bancárias para organizar suas finanças.';

  @override
  String get idioma => 'Idioma';

  @override
  String get moeda => 'Moeda';

  @override
  String get compararInvestimentos => 'Comparar Investimentos';

  @override
  String get descricaoLocalizacao =>
      'Para comparar investimentos locais (CDB/CDI) com taxas internacionais, precisamos saber sua localização.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Permissão de Localização Necessária';

  @override
  String get rendaFixa => 'Renda Fixa';

  @override
  String get rendaVariavel => 'Renda Variável';

  @override
  String get tesouroDireto => 'Tesouro Direto';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Ações';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Criptomoedas';

  @override
  String get rendimento => 'Rendimento';

  @override
  String get rentabilidade => 'Rentabilidade';

  @override
  String get aplicar => 'Aplicar';

  @override
  String get resgatar => 'Resgatar';

  @override
  String get simular => 'Simular';

  @override
  String get metas => 'Metas';

  @override
  String get estrategias => 'Estratégias';

  @override
  String get conhecimento => 'Conhecimento';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Enviar mensagem';

  @override
  String get digiteMensagem => 'Digite uma mensagem...';

  @override
  String get alertaGastos => 'Alerta de Gastos';

  @override
  String alertaGastosMsg(int percent) {
    return 'Você já usou $percent% do seu limite de crédito.';
  }

  @override
  String get fechamentoFatura => 'Fechamento da Fatura';

  @override
  String get fechamentoFaturaMsg =>
      'Amanhã é o dia do fechamento. Ótimo momento para revisar seus gastos.';

  @override
  String get faturaVencendo => 'Atenção: Fatura vencendo';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Sua fatura vence em $dias dia(s). Verifique seu saldo.';
  }

  @override
  String get regra30 => 'Dica: Regra dos 30%';

  @override
  String get regra30Msg =>
      'Tente manter seu uso abaixo de 30% para melhorar seu Score Bancário.';

  @override
  String get diaDeOuro => 'Dia de Ouro!';

  @override
  String get diaDeOuroMsg =>
      'Suas compras hoje só serão pagas daqui a 40 dias!';

  @override
  String get alertaJuros => 'Cuidado: Juros';

  @override
  String get alertaJurosMsg =>
      'Seu saldo não cobre a fatura. Evite o crédito rotativo!';

  @override
  String get notaSaude => 'Saúde Financeira';

  @override
  String get notaExcelente => 'Excelente! Você tem saúde financeira.';

  @override
  String get notaBom => 'Bom, mas pode melhorar.';

  @override
  String get notaAtencao => 'Atenção aos gastos.';

  @override
  String get notaRevisar => 'Revise suas finanças.';

  @override
  String get mentorInsightTitle => 'Orientação do Mentor';

  @override
  String get mentorInsightLoading => 'Consultando mercado…';

  @override
  String get mentorInsightError =>
      'Não foi possível carregar os dados agora. Tente de novo em instantes.';

  @override
  String get mentorInsightOffline =>
      'Sem internet. Conecte-se para consultar cotações e o Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Com a volatilidade atual, priorize preservação de capital e liquidez antes de buscar retorno.';

  @override
  String get mentorAllocationBalanced =>
      'Equilibre proteção e crescimento: diversifique e revisite o prazo do seu objetivo.';

  @override
  String get mentorAllocationOffensive =>
      'Seu perfil permite mais risco: mantenha disciplina e limite concentrações em poucos ativos.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Ativos observados: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automático (idioma)';

  @override
  String get compoundCalculatorTitle => 'Calculadora Mentora — Juros Compostos';

  @override
  String get compoundCalculatorSubtitle =>
      'Simule aportes, veja ganho nominal e real (após inflação) e ouça o Mentor.';

  @override
  String get compoundInitialLabel => 'Aporte inicial';

  @override
  String get compoundMonthlyLabel => 'Aporte mensal';

  @override
  String get compoundRateLabel => 'Taxa de juros';

  @override
  String get compoundRateAnnual => 'ao ano';

  @override
  String get compoundRateMonthly => 'ao mês';

  @override
  String get compoundHorizonLabel => 'Prazo';

  @override
  String get compoundHorizonYears => 'anos';

  @override
  String get compoundHorizonMonths => 'meses';

  @override
  String get compoundInflationLabel => 'Inflação estimada (% ao ano)';

  @override
  String get compoundCalculate => 'Calcular';

  @override
  String get compoundChartInvested => 'Total investido';

  @override
  String get compoundChartInterest => 'Juros ganhos';

  @override
  String get compoundSummaryNominalEnd => 'Montante final (nominal)';

  @override
  String get compoundSummaryRealGain => 'Ganho real (poder de compra)';

  @override
  String get compoundMentorCardTitle => 'Conselho do Mentor';

  @override
  String get compoundInvalidInput => 'Preencha valores válidos (prazo > 0).';

  @override
  String get userPersonaSectionTitle => 'Tom do Mentor';

  @override
  String get userPersonaNovice => 'Iniciante';

  @override
  String get userPersonaStrategist => 'Estrategista';

  @override
  String get userPersonaRiskTaker => 'Arrojado';

  @override
  String get userPersonaConservative => 'Poupador';

  @override
  String get compoundOpenFullInsight => 'Ver análise completa do Mentor';

  @override
  String get investFirstSteps_title => 'Primeiros passos';

  @override
  String get investFirstSteps_brokerTitle => 'Escolha uma corretora';

  @override
  String get investFirstSteps_brokerBody =>
      'Busque instituições seguras e reguladas. Compare taxas, produtos e reputação antes de abrir conta.';

  @override
  String get investFirstSteps_openAccountTitle => 'Abra sua conta';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Processo digital gratuito. Você precisará de documentos pessoais (CPF, RG) e, às vezes, comprovante de residência.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Processo digital (varia por país). Em geral, você precisará de documento de identificação e verificação de endereço/identidade.';

  @override
  String get investFirstSteps_transferTitle => 'Transfira recursos';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Envie dinheiro via PIX ou TED do seu banco para a corretora. O saldo ficará disponível para investir.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Transfira fundos via transferência bancária ou métodos locais (depende do país). O saldo ficará disponível para investir.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Descubra seu perfil';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Responda ao questionário de suitability. Entenda se você é conservador, moderado ou arrojado.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Invista no primeiro ativo';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Comece pela reserva de emergência (Tesouro Selic ou CDB com liquidez diária). Depois, diversifique gradualmente.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Comece pela reserva de emergência (conta remunerada, money market ou Treasury bonds de curto prazo). Depois, diversifique gradualmente.';

  @override
  String get investFirstSteps_tipTitle => 'Dica do Mentor:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Comece devagar, invista consistentemente e evite tentar “timar” o mercado. O tempo é seu maior aliado.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Comece devagar, invista com consistência e evite tentar acertar o “timing” do mercado. O tempo é seu maior aliado.';

  @override
  String get investMenu_tesouroTitle => 'Tesouro Direto';

  @override
  String get investMenu_cdbTitle => 'Renda fixa bancária (CDB)';

  @override
  String get investMenu_etfsTitle => 'ETFs internacionais';

  @override
  String get investMenu_sp500Title => 'S&P 500 (índice)';

  @override
  String get investMenu_stocksTitle => 'Ações';

  @override
  String get investMenu_fundsTitle => 'Fundos';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Internacional';

  @override
  String get investMenu_cryptoTitle => 'Cripto';

  @override
  String get investRegisterCta => 'Registrar investimento';

  @override
  String investRegionHintBr(String country) {
    return 'País efetivo: $country · catálogo Brasil (Tesouro, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'País efetivo: $country · catálogo global (ETFs, NYSE/NASDAQ…). Prioridade: loja (RevenueCat) · fallback locale/IP.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Estratégias essenciais';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Reserva de emergência';

  @override
  String get strategy_emergencyFundBodyBr =>
      'É o seu escudo financeiro. Deve cobrir de 6 a 12 meses do seu custo de vida. Priorize liquidez diária e baixo risco (ex.: Tesouro Selic ou CDB atrelado ao CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'É o seu escudo financeiro. Deve cobrir de 6 a 12 meses do seu custo de vida. Priorize liquidez diária e baixo risco (ex.: money market e Treasury bonds de curto prazo).';

  @override
  String get strategy_buyHoldTitle => 'Buy & Hold';

  @override
  String get strategy_buyHoldBody =>
      'Estratégia de comprar bons ativos e mantê-los por longo prazo. O foco é disciplina, qualidade e reinvestimento ao longo dos anos.';

  @override
  String get strategy_diversificationTitle => 'Diversificação';

  @override
  String get strategy_diversificationBodyBr =>
      'Distribua seu capital entre renda fixa, ações, FIIs e ativos internacionais para reduzir riscos e melhorar o retorno ajustado ao risco.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Distribua seu capital entre bonds, ações, REITs e exposição internacional para reduzir riscos e melhorar o retorno ajustado ao risco.';

  @override
  String get strategy_dcaTitle => 'Aportes constantes (DCA)';

  @override
  String get strategy_dcaBody =>
      'A constância vence a genialidade. Investir um pouco todos os meses é mais eficiente do que tentar adivinhar o melhor momento do mercado.';

  @override
  String get strategy_smartGoalsTitle => 'Metas SMART';

  @override
  String get strategy_smartGoalsBody =>
      'Suas metas devem ser: específicas, mensuráveis, atingíveis, relevantes e com prazo definido.';

  @override
  String get strategy_503020Title => 'Regra 50-30-20';

  @override
  String get strategy_503020Body =>
      'Um método de organização: 50% para necessidades, 30% para desejos e 20% para investimentos e metas.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Alocação de ativos (avançado)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Aprenda a montar uma alocação por objetivo e horizonte, ajustando risco, correlação e rebalanceamento.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETFs globais e índices (avançado)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Entenda índices globais (ex.: S&P 500), ETFs e como montar exposição internacional com disciplina.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Tributação e declaração (avançado)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Entenda os princípios de tributação e como organizar registros para declarar investimentos com segurança.';

  @override
  String get strategy_premiumLockedBody =>
      'Conteúdo Premium. Ative um tema Cyber/Grimm/Hive para desbloquear o Deep Dive de investimentos.';

  @override
  String get homeShowcaseTitle => 'Vitrine';

  @override
  String get homeShowcaseProfileSimTitle => 'Simulado de Perfil';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Descubra seu perfil de investidor em poucos minutos.';

  @override
  String get homeShowcaseStrategiesTitle => 'Estratégias recomendadas';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Atalhos diretos para aprender e aplicar estratégias.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Simulados e Estratégias';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Acesso rápido ao Simulado de Perfil e às Estratégias recomendadas.';

  @override
  String get quizProfile_title => 'Simulado de Perfil';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Pergunta $current de $total';
  }

  @override
  String get quizProfile_badge => 'QUESTIONÁRIO DE PERFIL';

  @override
  String get quizProfile_resultTitle => 'SEU PERFIL É';

  @override
  String get quizProfile_idealInvestmentsTitle => 'INVESTIMENTOS IDEAIS:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'EXPLORAR INVESTIMENTOS';

  @override
  String get quizProfile_exit => 'SAIR';

  @override
  String get quizKnowledge_title => 'Simulado de Conhecimento';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Pergunta $current de $total';
  }
}

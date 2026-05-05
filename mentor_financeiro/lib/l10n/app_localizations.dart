import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// App title
  ///
  /// In pt, this message translates to:
  /// **'Mentor Financeiro'**
  String get appTitle;

  /// Balance
  ///
  /// In pt, this message translates to:
  /// **'Saldo'**
  String get saldo;

  /// Daily expenses
  ///
  /// In pt, this message translates to:
  /// **'Gastos Diários'**
  String get gastosDiarios;

  /// Confirm transaction
  ///
  /// In pt, this message translates to:
  /// **'Confirmar Transação'**
  String get confirmarTransacao;

  /// Statement
  ///
  /// In pt, this message translates to:
  /// **'Extrato'**
  String get extrato;

  /// Transfers
  ///
  /// In pt, this message translates to:
  /// **'Transferências'**
  String get transferencias;

  /// Investments
  ///
  /// In pt, this message translates to:
  /// **'Investimentos'**
  String get investimentos;

  /// Settings
  ///
  /// In pt, this message translates to:
  /// **'Configurações'**
  String get configuracoes;

  /// Profile
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get perfil;

  /// Logout
  ///
  /// In pt, this message translates to:
  /// **'Sair'**
  String get sair;

  /// Login
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get entrar;

  /// Register
  ///
  /// In pt, this message translates to:
  /// **'Cadastrar'**
  String get cadastrar;

  /// Email
  ///
  /// In pt, this message translates to:
  /// **'E-mail'**
  String get email;

  /// Password
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get senha;

  /// Name
  ///
  /// In pt, this message translates to:
  /// **'Nome'**
  String get nome;

  /// CPF number
  ///
  /// In pt, this message translates to:
  /// **'CPF'**
  String get cpf;

  /// Phone
  ///
  /// In pt, this message translates to:
  /// **'Telefone'**
  String get telefone;

  /// Continue
  ///
  /// In pt, this message translates to:
  /// **'Continuar'**
  String get continuar;

  /// Back
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get voltar;

  /// Cancel
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get cancelar;

  /// Save
  ///
  /// In pt, this message translates to:
  /// **'Salvar'**
  String get salvar;

  /// Edit
  ///
  /// In pt, this message translates to:
  /// **'Editar'**
  String get editar;

  /// Delete
  ///
  /// In pt, this message translates to:
  /// **'Excluir'**
  String get excluir;

  /// Success
  ///
  /// In pt, this message translates to:
  /// **'Sucesso'**
  String get sucesso;

  /// Error
  ///
  /// In pt, this message translates to:
  /// **'Erro'**
  String get erro;

  /// Loading
  ///
  /// In pt, this message translates to:
  /// **'Carregando...'**
  String get carregando;

  /// No data
  ///
  /// In pt, this message translates to:
  /// **'Sem dados'**
  String get semDados;

  /// Try again
  ///
  /// In pt, this message translates to:
  /// **'Tentar novamente'**
  String get tentarNovamente;

  /// Reports
  ///
  /// In pt, this message translates to:
  /// **'Relatórios'**
  String get relatorios;

  /// Expenses by category
  ///
  /// In pt, this message translates to:
  /// **'Gastos por Categoria'**
  String get gastosPorCategoria;

  /// Last 7 days
  ///
  /// In pt, this message translates to:
  /// **'Últimos 7 Dias'**
  String get ultimosSeteDias;

  /// Total spent
  ///
  /// In pt, this message translates to:
  /// **'Total Gasto'**
  String get totalGasto;

  /// Transactions
  ///
  /// In pt, this message translates to:
  /// **'Transações'**
  String get transacoes;

  /// Category
  ///
  /// In pt, this message translates to:
  /// **'Categoria'**
  String get categoria;

  /// Date
  ///
  /// In pt, this message translates to:
  /// **'Data'**
  String get data;

  /// Value
  ///
  /// In pt, this message translates to:
  /// **'Valor'**
  String get valor;

  /// Description
  ///
  /// In pt, this message translates to:
  /// **'Descrição'**
  String get descricao;

  /// Food
  ///
  /// In pt, this message translates to:
  /// **'Alimentação'**
  String get alimentacao;

  /// Transport
  ///
  /// In pt, this message translates to:
  /// **'Transporte'**
  String get transporte;

  /// Leisure
  ///
  /// In pt, this message translates to:
  /// **'Lazer'**
  String get lazer;

  /// Health
  ///
  /// In pt, this message translates to:
  /// **'Saúde'**
  String get saude;

  /// Others
  ///
  /// In pt, this message translates to:
  /// **'Outros'**
  String get outros;

  /// Notifications
  ///
  /// In pt, this message translates to:
  /// **'Notificações'**
  String get notificacoes;

  /// Notification permission
  ///
  /// In pt, this message translates to:
  /// **'Permissão de Notificações'**
  String get permissaoNotificacoes;

  /// Enable expense monitoring
  ///
  /// In pt, this message translates to:
  /// **'Ativar Monitoramento de Gastos'**
  String get ativarMonitoramento;

  /// Monitoring description
  ///
  /// In pt, this message translates to:
  /// **' Permite que o app monitore automaticamente suas transações bancárias para organizar suas finanças.'**
  String get descricaoMonitoramento;

  /// Language
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get idioma;

  /// Currency
  ///
  /// In pt, this message translates to:
  /// **'Moeda'**
  String get moeda;

  /// Compare investments
  ///
  /// In pt, this message translates to:
  /// **'Comparar Investimentos'**
  String get compararInvestimentos;

  /// Location description
  ///
  /// In pt, this message translates to:
  /// **'Para comparar investimentos locais (CDB/CDI) com taxas internacionais, precisamos saber sua localização.'**
  String get descricaoLocalizacao;

  /// Location permission required
  ///
  /// In pt, this message translates to:
  /// **'Permissão de Localização Necessária'**
  String get permissaoLocalizacaoNecessaria;

  /// Fixed income
  ///
  /// In pt, this message translates to:
  /// **'Renda Fixa'**
  String get rendaFixa;

  /// Variable income
  ///
  /// In pt, this message translates to:
  /// **'Renda Variável'**
  String get rendaVariavel;

  /// Treasury direct
  ///
  /// In pt, this message translates to:
  /// **'Tesouro Direto'**
  String get tesouroDireto;

  /// CDB
  ///
  /// In pt, this message translates to:
  /// **'CDB'**
  String get cdb;

  /// LCI
  ///
  /// In pt, this message translates to:
  /// **'LCI'**
  String get lci;

  /// LCA
  ///
  /// In pt, this message translates to:
  /// **'LCA'**
  String get lca;

  /// Stocks
  ///
  /// In pt, this message translates to:
  /// **'Ações'**
  String get acoes;

  /// FIIs
  ///
  /// In pt, this message translates to:
  /// **'FIIs'**
  String get fiis;

  /// Cryptocurrencies
  ///
  /// In pt, this message translates to:
  /// **'Criptomoedas'**
  String get criptomoedas;

  /// Return
  ///
  /// In pt, this message translates to:
  /// **'Rendimento'**
  String get rendimento;

  /// Profitability
  ///
  /// In pt, this message translates to:
  /// **'Rentabilidade'**
  String get rentabilidade;

  /// Apply
  ///
  /// In pt, this message translates to:
  /// **'Aplicar'**
  String get aplicar;

  /// Redeem
  ///
  /// In pt, this message translates to:
  /// **'Resgatar'**
  String get resgatar;

  /// Simulate
  ///
  /// In pt, this message translates to:
  /// **'Simular'**
  String get simular;

  /// Goals
  ///
  /// In pt, this message translates to:
  /// **'Metas'**
  String get metas;

  /// Strategies
  ///
  /// In pt, this message translates to:
  /// **'Estratégias'**
  String get estrategias;

  /// Knowledge
  ///
  /// In pt, this message translates to:
  /// **'Conhecimento'**
  String get conhecimento;

  /// Chat
  ///
  /// In pt, this message translates to:
  /// **'Chat'**
  String get chat;

  /// Send message
  ///
  /// In pt, this message translates to:
  /// **'Enviar mensagem'**
  String get enviarMensagem;

  /// Type a message
  ///
  /// In pt, this message translates to:
  /// **'Digite uma mensagem...'**
  String get digiteMensagem;

  /// Alert about spending
  ///
  /// In pt, this message translates to:
  /// **'Alerta de Gastos'**
  String get alertaGastos;

  /// Alert about spending percentage
  ///
  /// In pt, this message translates to:
  /// **'Você já usou {percent}% do seu limite de crédito.'**
  String alertaGastosMsg(int percent);

  /// Invoice closing
  ///
  /// In pt, this message translates to:
  /// **'Fechamento da Fatura'**
  String get fechamentoFatura;

  /// Invoice closing message
  ///
  /// In pt, this message translates to:
  /// **'Amanhã é o dia do fechamento. Ótimo momento para revisar seus gastos.'**
  String get fechamentoFaturaMsg;

  /// Invoice due warning
  ///
  /// In pt, this message translates to:
  /// **'Atenção: Fatura vencendo'**
  String get faturaVencendo;

  /// Invoice due message
  ///
  /// In pt, this message translates to:
  /// **'Sua fatura vence em {dias} dia(s). Verifique seu saldo.'**
  String faturaVencendoMsg(int dias);

  /// 30% rule tip
  ///
  /// In pt, this message translates to:
  /// **'Dica: Regra dos 30%'**
  String get regra30;

  /// 30% rule message
  ///
  /// In pt, this message translates to:
  /// **'Tente manter seu uso abaixo de 30% para melhorar seu Score Bancário.'**
  String get regra30Msg;

  /// Golden day tip
  ///
  /// In pt, this message translates to:
  /// **'Dia de Ouro!'**
  String get diaDeOuro;

  /// Golden day message
  ///
  /// In pt, this message translates to:
  /// **'Suas compras hoje só serão pagas daqui a 40 dias!'**
  String get diaDeOuroMsg;

  /// Interest alert
  ///
  /// In pt, this message translates to:
  /// **'Cuidado: Juros'**
  String get alertaJuros;

  /// Interest alert message
  ///
  /// In pt, this message translates to:
  /// **'Seu saldo não cobre a fatura. Evite o crédito rotativo!'**
  String get alertaJurosMsg;

  /// Financial health score
  ///
  /// In pt, this message translates to:
  /// **'Saúde Financeira'**
  String get notaSaude;

  /// Excellent health
  ///
  /// In pt, this message translates to:
  /// **'Excelente! Você tem saúde financeira.'**
  String get notaExcelente;

  /// Good health
  ///
  /// In pt, this message translates to:
  /// **'Bom, mas pode melhorar.'**
  String get notaBom;

  /// Need attention
  ///
  /// In pt, this message translates to:
  /// **'Atenção aos gastos.'**
  String get notaAtencao;

  /// Need to review
  ///
  /// In pt, this message translates to:
  /// **'Revise suas finanças.'**
  String get notaRevisar;

  /// Mentor insight card title
  ///
  /// In pt, this message translates to:
  /// **'Orientação do Mentor'**
  String get mentorInsightTitle;

  /// Mentor insight loading
  ///
  /// In pt, this message translates to:
  /// **'Consultando mercado…'**
  String get mentorInsightLoading;

  /// Mentor insight error
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar os dados agora. Tente de novo em instantes.'**
  String get mentorInsightError;

  /// Mentor insight when device is offline
  ///
  /// In pt, this message translates to:
  /// **'Sem internet. Conecte-se para consultar cotações e o Mentor.'**
  String get mentorInsightOffline;

  /// Defensive allocation hint
  ///
  /// In pt, this message translates to:
  /// **'Com a volatilidade atual, priorize preservação de capital e liquidez antes de buscar retorno.'**
  String get mentorAllocationDefensive;

  /// Balanced allocation hint
  ///
  /// In pt, this message translates to:
  /// **'Equilibre proteção e crescimento: diversifique e revisite o prazo do seu objetivo.'**
  String get mentorAllocationBalanced;

  /// Offensive allocation hint
  ///
  /// In pt, this message translates to:
  /// **'Seu perfil permite mais risco: mantenha disciplina e limite concentrações em poucos ativos.'**
  String get mentorAllocationOffensive;

  /// List of symbols watched by mentor
  ///
  /// In pt, this message translates to:
  /// **'Ativos observados: {symbols}'**
  String mentorInsightSymbols(String symbols);

  /// Currency follows app language
  ///
  /// In pt, this message translates to:
  /// **'Automático (idioma)'**
  String get currencyFollowLocale;

  /// Compound interest calculator title
  ///
  /// In pt, this message translates to:
  /// **'Calculadora Mentora — Juros Compostos'**
  String get compoundCalculatorTitle;

  /// Compound calculator subtitle
  ///
  /// In pt, this message translates to:
  /// **'Simule aportes, veja ganho nominal e real (após inflação) e ouça o Mentor.'**
  String get compoundCalculatorSubtitle;

  /// No description provided for @compoundInitialLabel.
  ///
  /// In pt, this message translates to:
  /// **'Aporte inicial'**
  String get compoundInitialLabel;

  /// No description provided for @compoundMonthlyLabel.
  ///
  /// In pt, this message translates to:
  /// **'Aporte mensal'**
  String get compoundMonthlyLabel;

  /// No description provided for @compoundRateLabel.
  ///
  /// In pt, this message translates to:
  /// **'Taxa de juros'**
  String get compoundRateLabel;

  /// No description provided for @compoundRateAnnual.
  ///
  /// In pt, this message translates to:
  /// **'ao ano'**
  String get compoundRateAnnual;

  /// No description provided for @compoundRateMonthly.
  ///
  /// In pt, this message translates to:
  /// **'ao mês'**
  String get compoundRateMonthly;

  /// No description provided for @compoundHorizonLabel.
  ///
  /// In pt, this message translates to:
  /// **'Prazo'**
  String get compoundHorizonLabel;

  /// No description provided for @compoundHorizonYears.
  ///
  /// In pt, this message translates to:
  /// **'anos'**
  String get compoundHorizonYears;

  /// No description provided for @compoundHorizonMonths.
  ///
  /// In pt, this message translates to:
  /// **'meses'**
  String get compoundHorizonMonths;

  /// No description provided for @compoundInflationLabel.
  ///
  /// In pt, this message translates to:
  /// **'Inflação estimada (% ao ano)'**
  String get compoundInflationLabel;

  /// No description provided for @compoundCalculate.
  ///
  /// In pt, this message translates to:
  /// **'Calcular'**
  String get compoundCalculate;

  /// No description provided for @compoundChartInvested.
  ///
  /// In pt, this message translates to:
  /// **'Total investido'**
  String get compoundChartInvested;

  /// No description provided for @compoundChartInterest.
  ///
  /// In pt, this message translates to:
  /// **'Juros ganhos'**
  String get compoundChartInterest;

  /// No description provided for @compoundSummaryNominalEnd.
  ///
  /// In pt, this message translates to:
  /// **'Montante final (nominal)'**
  String get compoundSummaryNominalEnd;

  /// No description provided for @compoundSummaryRealGain.
  ///
  /// In pt, this message translates to:
  /// **'Ganho real (poder de compra)'**
  String get compoundSummaryRealGain;

  /// No description provided for @compoundMentorCardTitle.
  ///
  /// In pt, this message translates to:
  /// **'Conselho do Mentor'**
  String get compoundMentorCardTitle;

  /// No description provided for @compoundInvalidInput.
  ///
  /// In pt, this message translates to:
  /// **'Preencha valores válidos (prazo > 0).'**
  String get compoundInvalidInput;

  /// Persona selector title
  ///
  /// In pt, this message translates to:
  /// **'Tom do Mentor'**
  String get userPersonaSectionTitle;

  /// No description provided for @userPersonaNovice.
  ///
  /// In pt, this message translates to:
  /// **'Iniciante'**
  String get userPersonaNovice;

  /// No description provided for @userPersonaStrategist.
  ///
  /// In pt, this message translates to:
  /// **'Estrategista'**
  String get userPersonaStrategist;

  /// No description provided for @userPersonaRiskTaker.
  ///
  /// In pt, this message translates to:
  /// **'Arrojado'**
  String get userPersonaRiskTaker;

  /// No description provided for @userPersonaConservative.
  ///
  /// In pt, this message translates to:
  /// **'Poupador'**
  String get userPersonaConservative;

  /// No description provided for @compoundOpenFullInsight.
  ///
  /// In pt, this message translates to:
  /// **'Ver análise completa do Mentor'**
  String get compoundOpenFullInsight;

  /// No description provided for @investFirstSteps_title.
  ///
  /// In pt, this message translates to:
  /// **'Primeiros passos'**
  String get investFirstSteps_title;

  /// No description provided for @investFirstSteps_brokerTitle.
  ///
  /// In pt, this message translates to:
  /// **'Escolha uma corretora'**
  String get investFirstSteps_brokerTitle;

  /// No description provided for @investFirstSteps_brokerBody.
  ///
  /// In pt, this message translates to:
  /// **'Busque instituições seguras e reguladas. Compare taxas, produtos e reputação antes de abrir conta.'**
  String get investFirstSteps_brokerBody;

  /// No description provided for @investFirstSteps_openAccountTitle.
  ///
  /// In pt, this message translates to:
  /// **'Abra sua conta'**
  String get investFirstSteps_openAccountTitle;

  /// No description provided for @investFirstSteps_openAccountBodyBr.
  ///
  /// In pt, this message translates to:
  /// **'Processo digital gratuito. Você precisará de documentos pessoais (CPF, RG) e, às vezes, comprovante de residência.'**
  String get investFirstSteps_openAccountBodyBr;

  /// No description provided for @investFirstSteps_openAccountBodyGlobal.
  ///
  /// In pt, this message translates to:
  /// **'Processo digital (varia por país). Em geral, você precisará de documento de identificação e verificação de endereço/identidade.'**
  String get investFirstSteps_openAccountBodyGlobal;

  /// No description provided for @investFirstSteps_transferTitle.
  ///
  /// In pt, this message translates to:
  /// **'Transfira recursos'**
  String get investFirstSteps_transferTitle;

  /// No description provided for @investFirstSteps_transferBodyBr.
  ///
  /// In pt, this message translates to:
  /// **'Envie dinheiro via PIX ou TED do seu banco para a corretora. O saldo ficará disponível para investir.'**
  String get investFirstSteps_transferBodyBr;

  /// No description provided for @investFirstSteps_transferBodyGlobal.
  ///
  /// In pt, this message translates to:
  /// **'Transfira fundos via transferência bancária ou métodos locais (depende do país). O saldo ficará disponível para investir.'**
  String get investFirstSteps_transferBodyGlobal;

  /// No description provided for @investFirstSteps_riskProfileTitle.
  ///
  /// In pt, this message translates to:
  /// **'Descubra seu perfil'**
  String get investFirstSteps_riskProfileTitle;

  /// No description provided for @investFirstSteps_riskProfileBody.
  ///
  /// In pt, this message translates to:
  /// **'Responda ao questionário de suitability. Entenda se você é conservador, moderado ou arrojado.'**
  String get investFirstSteps_riskProfileBody;

  /// No description provided for @investFirstSteps_firstAssetTitle.
  ///
  /// In pt, this message translates to:
  /// **'Invista no primeiro ativo'**
  String get investFirstSteps_firstAssetTitle;

  /// No description provided for @investFirstSteps_firstAssetBodyBr.
  ///
  /// In pt, this message translates to:
  /// **'Comece pela reserva de emergência (Tesouro Selic ou CDB com liquidez diária). Depois, diversifique gradualmente.'**
  String get investFirstSteps_firstAssetBodyBr;

  /// No description provided for @investFirstSteps_firstAssetBodyGlobal.
  ///
  /// In pt, this message translates to:
  /// **'Comece pela reserva de emergência (conta remunerada, money market ou Treasury bonds de curto prazo). Depois, diversifique gradualmente.'**
  String get investFirstSteps_firstAssetBodyGlobal;

  /// No description provided for @investFirstSteps_tipTitle.
  ///
  /// In pt, this message translates to:
  /// **'Dica do Mentor:'**
  String get investFirstSteps_tipTitle;

  /// No description provided for @investFirstSteps_tipBodyBr.
  ///
  /// In pt, this message translates to:
  /// **'Comece devagar, invista consistentemente e evite tentar “timar” o mercado. O tempo é seu maior aliado.'**
  String get investFirstSteps_tipBodyBr;

  /// No description provided for @investFirstSteps_tipBodyGlobal.
  ///
  /// In pt, this message translates to:
  /// **'Comece devagar, invista com consistência e evite tentar acertar o “timing” do mercado. O tempo é seu maior aliado.'**
  String get investFirstSteps_tipBodyGlobal;

  /// No description provided for @investMenu_tesouroTitle.
  ///
  /// In pt, this message translates to:
  /// **'Tesouro Direto'**
  String get investMenu_tesouroTitle;

  /// No description provided for @investMenu_cdbTitle.
  ///
  /// In pt, this message translates to:
  /// **'Renda fixa bancária (CDB)'**
  String get investMenu_cdbTitle;

  /// No description provided for @investMenu_etfsTitle.
  ///
  /// In pt, this message translates to:
  /// **'ETFs internacionais'**
  String get investMenu_etfsTitle;

  /// No description provided for @investMenu_sp500Title.
  ///
  /// In pt, this message translates to:
  /// **'S&P 500 (índice)'**
  String get investMenu_sp500Title;

  /// No description provided for @investMenu_stocksTitle.
  ///
  /// In pt, this message translates to:
  /// **'Ações'**
  String get investMenu_stocksTitle;

  /// No description provided for @investMenu_fundsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Fundos'**
  String get investMenu_fundsTitle;

  /// No description provided for @investMenu_fiisTitle.
  ///
  /// In pt, this message translates to:
  /// **'FIIs'**
  String get investMenu_fiisTitle;

  /// No description provided for @investMenu_reitsTitle.
  ///
  /// In pt, this message translates to:
  /// **'REITs'**
  String get investMenu_reitsTitle;

  /// No description provided for @investMenu_internationalTitle.
  ///
  /// In pt, this message translates to:
  /// **'Internacional'**
  String get investMenu_internationalTitle;

  /// No description provided for @investMenu_cryptoTitle.
  ///
  /// In pt, this message translates to:
  /// **'Cripto'**
  String get investMenu_cryptoTitle;

  /// No description provided for @investRegisterCta.
  ///
  /// In pt, this message translates to:
  /// **'Registrar investimento'**
  String get investRegisterCta;

  /// No description provided for @investRegionHintBr.
  ///
  /// In pt, this message translates to:
  /// **'País efetivo: {country} · catálogo Brasil (Tesouro, CDB, LCA…).'**
  String investRegionHintBr(String country);

  /// No description provided for @investRegionHintGlobal.
  ///
  /// In pt, this message translates to:
  /// **'País efetivo: {country} · catálogo global (ETFs, NYSE/NASDAQ…). Prioridade: loja (RevenueCat) · fallback locale/IP.'**
  String investRegionHintGlobal(String country);

  /// No description provided for @strategy_sectionCoreTitle.
  ///
  /// In pt, this message translates to:
  /// **'Estratégias essenciais'**
  String get strategy_sectionCoreTitle;

  /// No description provided for @strategy_sectionDeepDiveTitle.
  ///
  /// In pt, this message translates to:
  /// **'Deep Dive (Premium)'**
  String get strategy_sectionDeepDiveTitle;

  /// No description provided for @strategy_emergencyFundTitle.
  ///
  /// In pt, this message translates to:
  /// **'Reserva de emergência'**
  String get strategy_emergencyFundTitle;

  /// No description provided for @strategy_emergencyFundBodyBr.
  ///
  /// In pt, this message translates to:
  /// **'É o seu escudo financeiro. Deve cobrir de 6 a 12 meses do seu custo de vida. Priorize liquidez diária e baixo risco (ex.: Tesouro Selic ou CDB atrelado ao CDI).'**
  String get strategy_emergencyFundBodyBr;

  /// No description provided for @strategy_emergencyFundBodyGlobal.
  ///
  /// In pt, this message translates to:
  /// **'É o seu escudo financeiro. Deve cobrir de 6 a 12 meses do seu custo de vida. Priorize liquidez diária e baixo risco (ex.: money market e Treasury bonds de curto prazo).'**
  String get strategy_emergencyFundBodyGlobal;

  /// No description provided for @strategy_buyHoldTitle.
  ///
  /// In pt, this message translates to:
  /// **'Buy & Hold'**
  String get strategy_buyHoldTitle;

  /// No description provided for @strategy_buyHoldBody.
  ///
  /// In pt, this message translates to:
  /// **'Estratégia de comprar bons ativos e mantê-los por longo prazo. O foco é disciplina, qualidade e reinvestimento ao longo dos anos.'**
  String get strategy_buyHoldBody;

  /// No description provided for @strategy_diversificationTitle.
  ///
  /// In pt, this message translates to:
  /// **'Diversificação'**
  String get strategy_diversificationTitle;

  /// No description provided for @strategy_diversificationBodyBr.
  ///
  /// In pt, this message translates to:
  /// **'Distribua seu capital entre renda fixa, ações, FIIs e ativos internacionais para reduzir riscos e melhorar o retorno ajustado ao risco.'**
  String get strategy_diversificationBodyBr;

  /// No description provided for @strategy_diversificationBodyGlobal.
  ///
  /// In pt, this message translates to:
  /// **'Distribua seu capital entre bonds, ações, REITs e exposição internacional para reduzir riscos e melhorar o retorno ajustado ao risco.'**
  String get strategy_diversificationBodyGlobal;

  /// No description provided for @strategy_dcaTitle.
  ///
  /// In pt, this message translates to:
  /// **'Aportes constantes (DCA)'**
  String get strategy_dcaTitle;

  /// No description provided for @strategy_dcaBody.
  ///
  /// In pt, this message translates to:
  /// **'A constância vence a genialidade. Investir um pouco todos os meses é mais eficiente do que tentar adivinhar o melhor momento do mercado.'**
  String get strategy_dcaBody;

  /// No description provided for @strategy_smartGoalsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Metas SMART'**
  String get strategy_smartGoalsTitle;

  /// No description provided for @strategy_smartGoalsBody.
  ///
  /// In pt, this message translates to:
  /// **'Suas metas devem ser: específicas, mensuráveis, atingíveis, relevantes e com prazo definido.'**
  String get strategy_smartGoalsBody;

  /// No description provided for @strategy_503020Title.
  ///
  /// In pt, this message translates to:
  /// **'Regra 50-30-20'**
  String get strategy_503020Title;

  /// No description provided for @strategy_503020Body.
  ///
  /// In pt, this message translates to:
  /// **'Um método de organização: 50% para necessidades, 30% para desejos e 20% para investimentos e metas.'**
  String get strategy_503020Body;

  /// No description provided for @strategy_deepDive_allocationTitle.
  ///
  /// In pt, this message translates to:
  /// **'Alocação de ativos (avançado)'**
  String get strategy_deepDive_allocationTitle;

  /// No description provided for @strategy_deepDive_allocationBody.
  ///
  /// In pt, this message translates to:
  /// **'Aprenda a montar uma alocação por objetivo e horizonte, ajustando risco, correlação e rebalanceamento.'**
  String get strategy_deepDive_allocationBody;

  /// No description provided for @strategy_deepDive_globalEtfsTitle.
  ///
  /// In pt, this message translates to:
  /// **'ETFs globais e índices (avançado)'**
  String get strategy_deepDive_globalEtfsTitle;

  /// No description provided for @strategy_deepDive_globalEtfsBody.
  ///
  /// In pt, this message translates to:
  /// **'Entenda índices globais (ex.: S&P 500), ETFs e como montar exposição internacional com disciplina.'**
  String get strategy_deepDive_globalEtfsBody;

  /// No description provided for @strategy_deepDive_taxesTitle.
  ///
  /// In pt, this message translates to:
  /// **'Tributação e declaração (avançado)'**
  String get strategy_deepDive_taxesTitle;

  /// No description provided for @strategy_deepDive_taxesBody.
  ///
  /// In pt, this message translates to:
  /// **'Entenda os princípios de tributação e como organizar registros para declarar investimentos com segurança.'**
  String get strategy_deepDive_taxesBody;

  /// No description provided for @strategy_premiumLockedBody.
  ///
  /// In pt, this message translates to:
  /// **'Conteúdo Premium. Ative um tema Cyber/Grimm/Hive para desbloquear o Deep Dive de investimentos.'**
  String get strategy_premiumLockedBody;

  /// No description provided for @homeShowcaseTitle.
  ///
  /// In pt, this message translates to:
  /// **'Vitrine'**
  String get homeShowcaseTitle;

  /// No description provided for @homeShowcaseProfileSimTitle.
  ///
  /// In pt, this message translates to:
  /// **'Simulado de Perfil'**
  String get homeShowcaseProfileSimTitle;

  /// No description provided for @homeShowcaseProfileSimSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Descubra seu perfil de investidor em poucos minutos.'**
  String get homeShowcaseProfileSimSubtitle;

  /// No description provided for @homeShowcaseStrategiesTitle.
  ///
  /// In pt, this message translates to:
  /// **'Estratégias recomendadas'**
  String get homeShowcaseStrategiesTitle;

  /// No description provided for @homeShowcaseStrategiesSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Atalhos diretos para aprender e aplicar estratégias.'**
  String get homeShowcaseStrategiesSubtitle;

  /// No description provided for @homeShowcaseMentorHubTitle.
  ///
  /// In pt, this message translates to:
  /// **'Mentor: Simulados e Estratégias'**
  String get homeShowcaseMentorHubTitle;

  /// No description provided for @homeShowcaseMentorHubSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Acesso rápido ao Simulado de Perfil e às Estratégias recomendadas.'**
  String get homeShowcaseMentorHubSubtitle;

  /// No description provided for @quizProfile_title.
  ///
  /// In pt, this message translates to:
  /// **'Simulado de Perfil'**
  String get quizProfile_title;

  /// No description provided for @quizProfile_progress.
  ///
  /// In pt, this message translates to:
  /// **'Pergunta {current} de {total}'**
  String quizProfile_progress(int current, int total);

  /// No description provided for @quizProfile_badge.
  ///
  /// In pt, this message translates to:
  /// **'QUESTIONÁRIO DE PERFIL'**
  String get quizProfile_badge;

  /// No description provided for @quizProfile_resultTitle.
  ///
  /// In pt, this message translates to:
  /// **'SEU PERFIL É'**
  String get quizProfile_resultTitle;

  /// No description provided for @quizProfile_idealInvestmentsTitle.
  ///
  /// In pt, this message translates to:
  /// **'INVESTIMENTOS IDEAIS:'**
  String get quizProfile_idealInvestmentsTitle;

  /// No description provided for @quizProfile_exploreInvestmentsCta.
  ///
  /// In pt, this message translates to:
  /// **'EXPLORAR INVESTIMENTOS'**
  String get quizProfile_exploreInvestmentsCta;

  /// No description provided for @quizProfile_exit.
  ///
  /// In pt, this message translates to:
  /// **'SAIR'**
  String get quizProfile_exit;

  /// No description provided for @quizKnowledge_title.
  ///
  /// In pt, this message translates to:
  /// **'Simulado de Conhecimento'**
  String get quizKnowledge_title;

  /// No description provided for @quizKnowledge_progress.
  ///
  /// In pt, this message translates to:
  /// **'Pergunta {current} de {total}'**
  String quizKnowledge_progress(int current, int total);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

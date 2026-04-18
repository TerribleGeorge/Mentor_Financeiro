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

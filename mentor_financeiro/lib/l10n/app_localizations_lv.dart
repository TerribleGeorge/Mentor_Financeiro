// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get appTitle => 'Mentoru finanses';

  @override
  String get saldo => 'Bilance';

  @override
  String get gastosDiarios => 'Ikdienas izdevumi';

  @override
  String get confirmarTransacao => 'Apstipriniet darījumu';

  @override
  String get extrato => 'Paziņojums';

  @override
  String get transferencias => 'Pārskaitījumi';

  @override
  String get investimentos => 'Investīcijas';

  @override
  String get configuracoes => 'Iestatījumi';

  @override
  String get perfil => 'profils';

  @override
  String get sair => 'Izrakstīties';

  @override
  String get entrar => 'Pieteikties';

  @override
  String get cadastrar => 'Reģistrēties';

  @override
  String get email => 'E-pasts';

  @override
  String get senha => 'Parole';

  @override
  String get nome => 'Nosaukums';

  @override
  String get cpf => 'ID numurs';

  @override
  String get telefone => 'Tālrunis';

  @override
  String get continuar => 'Turpināt';

  @override
  String get voltar => 'Atpakaļ';

  @override
  String get cancelar => 'Atcelt';

  @override
  String get salvar => 'Ietaupi';

  @override
  String get editar => 'Rediģēt';

  @override
  String get excluir => 'Dzēst';

  @override
  String get sucesso => 'Panākumi';

  @override
  String get erro => 'Kļūda';

  @override
  String get carregando => 'Notiek ielāde...';

  @override
  String get semDados => 'Nav datu';

  @override
  String get tentarNovamente => 'Mēģiniet vēlreiz';

  @override
  String get relatorios => 'Ziņojumi';

  @override
  String get gastosPorCategoria => 'Izdevumi pēc kategorijām';

  @override
  String get ultimosSeteDias => 'Pēdējās 7 dienas';

  @override
  String get totalGasto => 'Kopā iztērēts';

  @override
  String get transacoes => 'Darījumi';

  @override
  String get categoria => 'Kategorija';

  @override
  String get data => 'Datums';

  @override
  String get valor => 'Vērtība';

  @override
  String get descricao => 'Apraksts';

  @override
  String get alimentacao => 'Pārtika';

  @override
  String get transporte => 'Transports';

  @override
  String get lazer => 'Atpūta';

  @override
  String get saude => 'Veselība';

  @override
  String get outros => 'Citi';

  @override
  String get notificacoes => 'Paziņojumi';

  @override
  String get permissaoNotificacoes => 'Paziņojumu atļauja';

  @override
  String get ativarMonitoramento => 'Iespējot izdevumu uzraudzību';

  @override
  String get descricaoMonitoramento =>
      'Ļaujiet lietotnei automātiski pārraudzīt jūsu bankas darījumus, lai sakārtotu jūsu finanses.';

  @override
  String get idioma => 'Valoda';

  @override
  String get moeda => 'Valūta';

  @override
  String get compararInvestimentos => 'Salīdziniet ieguldījumus';

  @override
  String get descricaoLocalizacao =>
      'Lai salīdzinātu vietējās investīcijas (CDB/CDI) ar starptautiskajiem tarifiem, mums ir nepieciešama jūsu atrašanās vieta.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Nepieciešama atrašanās vietas atļauja';

  @override
  String get rendaFixa => 'Fiksētais ienākums';

  @override
  String get rendaVariavel => 'Mainīgie ienākumi';

  @override
  String get tesouroDireto => 'Valsts kase Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Krājumi';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kriptovalūtas';

  @override
  String get rendimento => 'Atgriešanās';

  @override
  String get rentabilidade => 'Rentabilitāte';

  @override
  String get aplicar => 'Pieteikties';

  @override
  String get resgatar => 'Izpirkt';

  @override
  String get simular => 'Simulēt';

  @override
  String get metas => 'Mērķi';

  @override
  String get estrategias => 'Stratēģijas';

  @override
  String get conhecimento => 'Zināšanas';

  @override
  String get chat => 'Tērzēšana';

  @override
  String get enviarMensagem => 'Nosūtīt ziņu';

  @override
  String get digiteMensagem => 'Ierakstiet ziņojumu...';

  @override
  String get alertaGastos => 'Brīdinājums par tēriņiem';

  @override
  String alertaGastosMsg(int percent) {
    return 'Jūs jau izmantojāt $percent% no sava kredītlimita.';
  }

  @override
  String get fechamentoFatura => 'Rēķina slēgšana';

  @override
  String get fechamentoFaturaMsg =>
      'Rīt ir noslēguma diena. Lielisks laiks izdevumu pārskatīšanai.';

  @override
  String get faturaVencendo => 'Rēķina apmaksas termiņš';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Rēķins jāapmaksā pēc $dias dienas(-ām). Pārbaudiet savu bilanci.';
  }

  @override
  String get regra30 => 'Padoms: 30% noteikums';

  @override
  String get regra30Msg =>
      'Saglabājiet lietojumu zem 30%, lai uzlabotu savu kredītreitingu.';

  @override
  String get diaDeOuro => 'Zelta diena!';

  @override
  String get diaDeOuroMsg =>
      'Jūsu pirkumi šodien tiks apmaksāti tikai 40 dienu laikā!';

  @override
  String get alertaJuros => 'Brīdinājums: Interese';

  @override
  String get alertaJurosMsg =>
      'Jūsu atlikums nesedz rēķinu. Izvairieties no apgrozības kredīta!';

  @override
  String get notaSaude => 'Finanšu veselība';

  @override
  String get notaExcelente => 'Lieliski! Jums ir lieliska finansiālā veselība.';

  @override
  String get notaBom => 'Labs, bet var uzlabot.';

  @override
  String get notaAtencao => 'Uzmanību tēriņiem.';

  @override
  String get notaRevisar => 'Pārskatiet savas finanses.';

  @override
  String get mentorInsightTitle => 'Mentoru norādījumi';

  @override
  String get mentorInsightLoading => 'Notiek tirgus datu iegūšana…';

  @override
  String get mentorInsightError =>
      'Pašlaik nevarēja ielādēt datus. Drīzumā mēģiniet vēlreiz.';

  @override
  String get mentorInsightOffline =>
      'Jūs esat bezsaistē. Izveidojiet savienojumu, lai iegūtu citātus un mentoru ieskatus.';

  @override
  String get mentorAllocationDefensive =>
      'Ņemot vērā pašreizējo nestabilitāti, pirms ienesīguma meklējiet prioritāti kapitāla saglabāšanai un likviditātei.';

  @override
  String get mentorAllocationBalanced =>
      'Līdzsvara aizsardzība un izaugsme: dažādojiet un atkārtoti apmeklējiet savu mērķu horizontu.';

  @override
  String get mentorAllocationOffensive =>
      'Jūsu profils pieļauj lielāku risku: saglabājiet disciplīnu un izvairieties no smagas koncentrēšanās.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Pārskatītie simboli: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automātisks (valoda)';

  @override
  String get compoundCalculatorTitle =>
      'Mentoru kalkulators — saliktie procenti';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulēt iemaksas, nominālo un reālo peļņu (pēc inflācijas) un mentoru piezīmes.';

  @override
  String get compoundInitialLabel => 'Sākotnējā vienreizējā summa';

  @override
  String get compoundMonthlyLabel => 'Ikmēneša iemaksa';

  @override
  String get compoundRateLabel => 'Procentu likme';

  @override
  String get compoundRateAnnual => 'gadā';

  @override
  String get compoundRateMonthly => 'mēnesī';

  @override
  String get compoundHorizonLabel => 'Laika horizonts';

  @override
  String get compoundHorizonYears => 'gadi';

  @override
  String get compoundHorizonMonths => 'mēneši';

  @override
  String get compoundInflationLabel => 'Paredzamā inflācija (% gadā)';

  @override
  String get compoundCalculate => 'Aprēķināt';

  @override
  String get compoundChartInvested => 'Kopā ieguldīts';

  @override
  String get compoundChartInterest => 'Nopelnīti procenti';

  @override
  String get compoundSummaryNominalEnd => 'Beigu bilance (nominālā)';

  @override
  String get compoundSummaryRealGain => 'Reāls ieguvums (pirktspēja)';

  @override
  String get compoundMentorCardTitle => 'Mentoru padoms';

  @override
  String get compoundInvalidInput =>
      'Ievadiet derīgas vērtības (horizonts > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentora tonis';

  @override
  String get userPersonaNovice => 'Iesācējs';

  @override
  String get userPersonaStrategist => 'Stratēģis';

  @override
  String get userPersonaRiskTaker => 'Riska uzņēmējs';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Atveriet pilnu mentora ieskatu';

  @override
  String get investFirstSteps_title => 'Pirmie soļi';

  @override
  String get investFirstSteps_brokerTitle => 'Izvēlieties brokeri';

  @override
  String get investFirstSteps_brokerBody =>
      'Meklējiet regulētas, cienījamas iestādes. Pirms konta atvēršanas salīdziniet maksas, produktus un uzticamību.';

  @override
  String get investFirstSteps_openAccountTitle => 'Atveriet savu kontu';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitālā iekļaušana. Brazīlijā parasti ir nepieciešams CPF/RG un dažreiz adreses apliecinājums.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digitālā iekļaušana dažādās valstīs atšķiras. Parasti jums ir nepieciešams personu apliecinošs dokuments un identitātes/adreses pārbaude.';

  @override
  String get investFirstSteps_transferTitle => 'Pārskaitiet līdzekļus';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Nosūtiet naudu savam brokerim, izmantojot PIX vai bankas pārskaitījumu. Atlikums kļūst pieejams ieguldījumiem.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Pārskaitiet līdzekļus, izmantojot bankas pārskaitījumu vai vietējos maksājumu veidus (atkarībā no jūsu valsts). Atlikums kļūst pieejams ieguldījumiem.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Ziniet savu riska profilu';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Atbildiet uz atbilstības anketu. Saprotiet, vai esat konservatīvs, mērens vai agresīvs.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Pērciet savu pirmo īpašumu';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Sāciet ar ārkārtas fondu (Tesouro Selic vai ikdienas likviditātes CDB). Pēc tam pakāpeniski dažādojiet.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Sāciet ar ārkārtas fondu (augsta ienesīguma skaidru naudu, naudas tirgus fondiem vai īstermiņa valsts obligācijām). Pēc tam pakāpeniski dažādojiet.';

  @override
  String get investFirstSteps_tipTitle => 'Mentora padoms:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Sāciet ar mazumiņu, konsekventi investējiet un izvairieties no laika noteikšanas tirgus. Laiks ir jūsu labākais sabiedrotais.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Sāciet ar mazumiņu, konsekventi investējiet un izvairieties no laika noteikšanas tirgus. Laiks ir jūsu labākais sabiedrotais.';

  @override
  String get investMenu_tesouroTitle => 'Brazīlijas valsts kases';

  @override
  String get investMenu_cdbTitle => 'Bankas fiksētā ienākuma (CDB)';

  @override
  String get investMenu_etfsTitle => 'Starptautiskie ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indekss)';

  @override
  String get investMenu_stocksTitle => 'Krājumi';

  @override
  String get investMenu_fundsTitle => 'Līdzekļi';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Kripto';

  @override
  String get investRegisterCta => 'Reģistrēt investīcijas';

  @override
  String investRegionHintBr(String country) {
    return 'Spēkā valsts: $country · Brazīlijas katalogs (Valsts kases, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Spēkā valsts: $country · Globālais katalogs (ETF, NYSE/NASDAQ…). Automātiski pielāgots no jūsu ierīces reģiona.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Būtiskas stratēģijas';

  @override
  String get strategy_sectionDeepDiveTitle => 'dziļā niršana (premium)';

  @override
  String get strategy_emergencyFundTitle => 'Ārkārtas fonds';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Jūsu finanšu vairogs. Sedz 6-12 mēnešu izdevumus. Dodiet priekšroku ikdienas likviditātei un zemam riskam (piemēram, Tesouro Selic vai ar CDI saistīts CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Jūsu finanšu vairogs. Sedz 6-12 mēnešu izdevumus. Dodiet priekšroku ikdienas likviditātei un zemam riskam (piemēram, naudas tirgus fondi un īstermiņa valsts obligācijas).';

  @override
  String get strategy_buyHoldTitle => 'Pirkt un turēt';

  @override
  String get strategy_buyHoldBody =>
      'Pērciet kvalitatīvus aktīvus un turiet tos ilgtermiņā. Koncentrējieties uz disciplīnu, kvalitāti un reinvestēšanu laika gaitā.';

  @override
  String get strategy_diversificationTitle => 'Dažādošana';

  @override
  String get strategy_diversificationBodyBr =>
      'Izplatiet savu kapitālu starp fiksēto ienākumu, akcijām, FII un starptautiskajiem aktīviem, lai samazinātu risku un uzlabotu riskam pielāgotu peļņu.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Izplatiet savu kapitālu starp obligācijām, akcijām, REIT un starptautiskajiem darījumiem, lai samazinātu risku un uzlabotu riskam pielāgotu peļņu.';

  @override
  String get strategy_dcaTitle => 'Vidējo izmaksu noteikšana dolāros (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konsekvence pārspēj ģenialitāti. Ieguldījumi katru mēnesi bieži ir efektīvāki nekā mēģinājumi izvēlēties perfektu sākuma punktu.';

  @override
  String get strategy_smartGoalsTitle => 'SMART vārti';

  @override
  String get strategy_smartGoalsBody =>
      'Jūsu mērķiem ir jābūt konkrētiem, izmērāmiem, sasniedzamiem, atbilstošiem un ar noteiktu laiku.';

  @override
  String get strategy_503020Title => '50-30-20 noteikums';

  @override
  String get strategy_503020Body =>
      'Vienkārša budžeta veidošanas sistēma: 50% vajadzības, 30% vēlmes, 20% ieguldījumi un mērķi.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Līdzekļu piešķiršana (uzlabots)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Uzziniet, kā izveidot sadalījumu pēc mērķa un horizonta, pielāgojot risku, korelāciju un līdzsvarošanu.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globālie ETF un indeksi (uzlaboti)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Uzziniet par globālajiem indeksiem (piemēram, S&P 500), ETF un to, kā ar disciplīnu veidot starptautisku ietekmi.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Nodokļi un pārskatu sniegšana (papildu)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Izprotiet nodokļu pamatjēdzienus un to, kā veikt uzskaiti, lai droši ziņotu par ieguldījumiem.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium saturs. Aktivizējiet Cyber/Grimm/Hive motīvu, lai atbloķētu ieguldījumu Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Vitrīna';

  @override
  String get homeShowcaseProfileSimTitle => 'Riska profila viktorīna';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Dažu minūšu laikā atrodiet savu investora profilu.';

  @override
  String get homeShowcaseStrategiesTitle => 'Ieteicamās stratēģijas';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Tiešie saīsnes, lai apgūtu un piemērotu stratēģijas.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentors: viktorīnas un stratēģijas';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Ātra piekļuve riska profila viktorīnai un ieteicamajām stratēģijām.';

  @override
  String get homeTourStepClassicTitle => 'Klasiskais režīms';

  @override
  String get homeTourStepClassicBody =>
      'Atver sākotnējo lietotņu paneli: darījumi, mērķi, ieguldījumi un iestatījumi pazīstamajā izkārtojumā.';

  @override
  String get homeTourStepVitrineTitle => 'Vitrīnas laukums';

  @override
  String get homeTourStepVitrineBody =>
      'Īsceļi, lai mācītos un praktizētu: investora profils, stratēģijas un mentoru centrs.';

  @override
  String get homeTourStepProfileTitle => 'Profila viktorīna';

  @override
  String get homeTourStepProfileBody =>
      'Atbildiet uz anketu, lai atklātu savu riska profilu un skatītu saskaņotos ieteikumus.';

  @override
  String get homeTourStepStrategiesTitle => 'stratēģijas';

  @override
  String get homeTourStepStrategiesBody =>
      'Saturs, lai organizētu finanses, investētu ar disciplīnu un izvairītos no izplatītām kļūmēm.';

  @override
  String get homeTourStepHubTitle => 'Mentoru centrs';

  @override
  String get homeTourStepHubBody =>
      'Profila viktorīnas ātrā izvēlne un ieteicamās stratēģijas.';

  @override
  String get homeTourStepPremiumTitle => 'Premium funkcijas';

  @override
  String get homeTourStepPremiumBody =>
      'Automātiskā mentorings, uzlabotas diagrammas un ikmēneša pārskati — pieejami ar Premium abonementu.';

  @override
  String get homeTourStepMarketTitle => 'Tirgus momentuzņēmums';

  @override
  String get homeTourStepMarketBody =>
      'Tirgus konteksts (Brazīlija vai globāls), pamatojoties uz jūsu reģionu un konvertēto neto vērtību.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentoru kalkulators';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulējiet saliktos procentus, inflāciju un skatiet bagātības diagrammu; pēc tam mēs atveram šo rīku.';

  @override
  String get quizProfile_title => 'Riska profila viktorīna';

  @override
  String quizProfile_progress(int current, int total) {
    return '$current. jautājums no $total';
  }

  @override
  String get quizProfile_badge => 'RISKA PROFILA Viktorīna';

  @override
  String get quizProfile_resultTitle => 'JŪSU PROFILS IR';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEĀLI IEGULDĪJUMI:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'IZPĒTIET IEGULDĪJUMUS';

  @override
  String get quizProfile_exit => 'IZEJA';

  @override
  String get quizKnowledge_title => 'Zināšanu viktorīna';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '$current. jautājums no $total';
  }
}

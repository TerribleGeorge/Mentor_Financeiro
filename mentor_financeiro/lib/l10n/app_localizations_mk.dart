// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appTitle => 'Ментор финансии';

  @override
  String get saldo => 'Биланс\nЗЗЗ008ЗЗЗ Дневни трошоци';

  @override
  String get gastosDiarios => 'Daily Expenses';

  @override
  String get confirmarTransacao => 'Потврдете ја трансакцијата';

  @override
  String get extrato => 'Изјава';

  @override
  String get transferencias => 'Трансфери';

  @override
  String get investimentos => 'Инвестиции';

  @override
  String get configuracoes => 'Поставки';

  @override
  String get perfil => 'Профил';

  @override
  String get sair => 'Одјавување';

  @override
  String get entrar => 'Најавете се';

  @override
  String get cadastrar => 'Регистрирајте се';

  @override
  String get email => 'Е-пошта\nЗЗЗ019ЗЗЗ Лозинка';

  @override
  String get senha => 'Password';

  @override
  String get nome => 'Име';

  @override
  String get cpf => 'матичен број';

  @override
  String get telefone => 'Телефон';

  @override
  String get continuar => 'Продолжи';

  @override
  String get voltar => 'Назад';

  @override
  String get cancelar => 'Откажи';

  @override
  String get salvar => 'Зачувај';

  @override
  String get editar => 'Уреди';

  @override
  String get excluir => 'Избриши';

  @override
  String get sucesso => 'Успех';

  @override
  String get erro => 'Грешка';

  @override
  String get carregando => 'Се вчитува...';

  @override
  String get semDados => 'Нема податоци';

  @override
  String get tentarNovamente => 'Обидете се повторно';

  @override
  String get relatorios => 'Извештаи';

  @override
  String get gastosPorCategoria => 'Трошоци по категорија';

  @override
  String get ultimosSeteDias => 'Последните 7 дена';

  @override
  String get totalGasto => 'Вкупно потрошени';

  @override
  String get transacoes => 'Трансакции';

  @override
  String get categoria => 'Категорија';

  @override
  String get data => 'Датум';

  @override
  String get valor => 'Вредност';

  @override
  String get descricao => 'Опис';

  @override
  String get alimentacao => 'Храна';

  @override
  String get transporte => 'Транспорт';

  @override
  String get lazer => 'Слободно време';

  @override
  String get saude => 'Здравје';

  @override
  String get outros => 'Други';

  @override
  String get notificacoes => 'Известувања';

  @override
  String get permissaoNotificacoes => 'Дозвола за известување';

  @override
  String get ativarMonitoramento => 'Овозможи следење на трошоците';

  @override
  String get descricaoMonitoramento =>
      'Дозволете апликацијата автоматски да ги следи вашите банкарски трансакции за да ги организира вашите финансии.';

  @override
  String get idioma => 'Јазик';

  @override
  String get moeda => 'Валута';

  @override
  String get compararInvestimentos => 'Споредете инвестиции';

  @override
  String get descricaoLocalizacao =>
      'За да ги споредиме локалните инвестиции (CDB/CDI) со меѓународните стапки, потребна ни е вашата локација.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Потребна е дозвола за локација';

  @override
  String get rendaFixa => 'Фиксни приходи';

  @override
  String get rendaVariavel => 'Променлив приход';

  @override
  String get tesouroDireto => 'Трезор Директен';

  @override
  String get cdb => 'ЦДБ';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Акции';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Криптовалути';

  @override
  String get rendimento => 'Враќање';

  @override
  String get rentabilidade => 'Профитабилност';

  @override
  String get aplicar => 'Пријавете се';

  @override
  String get resgatar => 'Откупи';

  @override
  String get simular => 'Симулирајте';

  @override
  String get metas => 'Голови';

  @override
  String get estrategias => 'стратегии';

  @override
  String get conhecimento => 'Знаење';

  @override
  String get chat => 'Разговор';

  @override
  String get enviarMensagem => 'Испрати порака';

  @override
  String get digiteMensagem => 'Напишете порака...';

  @override
  String get alertaGastos => 'Известување за трошење';

  @override
  String alertaGastosMsg(int percent) {
    return 'Веќе искористивте $percent% од вашиот кредитен лимит.';
  }

  @override
  String get fechamentoFatura => 'Затворање на фактурата';

  @override
  String get fechamentoFaturaMsg =>
      'Утре се затвора. Одлично време за преглед на трошоците.';

  @override
  String get faturaVencendo => 'Доспеана фактура';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Фактура доспева за $dias ден(и). Проверете ја вашата рамнотежа.';
  }

  @override
  String get regra30 => 'Совет: 30% Правило';

  @override
  String get regra30Msg =>
      'Чувајте го користењето под 30% за да го подобрите вашиот кредитен резултат.';

  @override
  String get diaDeOuro => 'Златен ден!';

  @override
  String get diaDeOuroMsg =>
      'Вашите купувања денес ќе се платат само за 40 дена!';

  @override
  String get alertaJuros => 'Предупредување: камата';

  @override
  String get alertaJurosMsg =>
      'Вашето салдо не ја покрива сметката. Избегнувајте револвинг кредит!';

  @override
  String get notaSaude => 'Финансиско здравје';

  @override
  String get notaExcelente => 'Одлично! Имате одлично финансиско здравје.';

  @override
  String get notaBom => 'Добро, но може да се подобри.';

  @override
  String get notaAtencao => 'Внимание на трошењето.';

  @override
  String get notaRevisar => 'Прегледајте ги вашите финансии.';

  @override
  String get mentorInsightTitle => 'Насоки од ментор';

  @override
  String get mentorInsightLoading => 'Се преземаат податоци за пазарот…';

  @override
  String get mentorInsightError =>
      'Не може да се вчитаат податоците во моментов. Обидете се повторно наскоро.';

  @override
  String get mentorInsightOffline =>
      'Офлајн сте. Поврзете се за преземање цитати и увиди од менторот.';

  @override
  String get mentorAllocationDefensive =>
      'Со оглед на моменталната нестабилност, дадете приоритет на зачувувањето на капиталот и ликвидноста пред да ги следите приносите.';

  @override
  String get mentorAllocationBalanced =>
      'Рамнотежете ја заштитата и растот: диверзифицирајте го и повторно разгледајте го хоризонтот на вашата цел.';

  @override
  String get mentorAllocationOffensive =>
      'Вашиот профил дозволува поголем ризик: останете дисциплинирани и избегнувајте голема концентрација.\nПрегледани симболи';

  @override
  String mentorInsightSymbols(String symbols) {
    return ': $symbols';
  }

  @override
  String get currencyFollowLocale => 'Автоматски (јазик)';

  @override
  String get compoundCalculatorTitle => 'Ментор Калкулатор — сложена камата';

  @override
  String get compoundCalculatorSubtitle =>
      'Симулирајте придонеси, номинална наспроти реална добивка (по инфлација) и менторски белешки.';

  @override
  String get compoundInitialLabel => 'Почетен паушал';

  @override
  String get compoundMonthlyLabel => 'Месечен придонес';

  @override
  String get compoundRateLabel => 'Каматна стапка';

  @override
  String get compoundRateAnnual => 'годишно';

  @override
  String get compoundRateMonthly => 'месечно';

  @override
  String get compoundHorizonLabel => 'Временски хоризонт';

  @override
  String get compoundHorizonYears => 'години';

  @override
  String get compoundHorizonMonths => 'месеци';

  @override
  String get compoundInflationLabel => 'Проценета инфлација (% годишно)';

  @override
  String get compoundCalculate => 'Пресметај';

  @override
  String get compoundChartInvested => 'Вкупно инвестирано';

  @override
  String get compoundChartInterest => 'Заработена камата';

  @override
  String get compoundSummaryNominalEnd => 'Крајно салдо (номинално)';

  @override
  String get compoundSummaryRealGain => 'Реална добивка (куповна моќ)';

  @override
  String get compoundMentorCardTitle => 'Менторски совет';

  @override
  String get compoundInvalidInput =>
      'Внесете валидни вредности (хоризонт > 0).';

  @override
  String get userPersonaSectionTitle => 'Менторски тон';

  @override
  String get userPersonaNovice => 'Почетник';

  @override
  String get userPersonaStrategist => 'стратег';

  @override
  String get userPersonaRiskTaker => 'Ризик';

  @override
  String get userPersonaConservative => 'Штедач';

  @override
  String get compoundOpenFullInsight => 'Отворете целосен увид на менторите';

  @override
  String get investFirstSteps_title => 'Први чекори';

  @override
  String get investFirstSteps_brokerTitle => 'Изберете брокер';

  @override
  String get investFirstSteps_brokerBody =>
      'Барајте регулирани, реномирани институции. Споредете ги надоместоците, производите и доверливоста пред да отворите сметка.';

  @override
  String get investFirstSteps_openAccountTitle => 'Отворете ја вашата сметка';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Дигитално вклучување. Во Бразил, обично ви треба CPF/RG, а понекогаш и доказ за адреса.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Дигиталното вклучување се разликува во зависност од земјата. Обично ви треба документ за лична идентификација и потврда за идентитет/адреса.';

  @override
  String get investFirstSteps_transferTitle => 'Трансфер на средства';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Испратете пари преку PIX или банкарски трансфер до вашиот брокер. Билансот станува достапен за инвестирање.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Трансфер на средства преку банкарски трансфер или локални начини на плаќање (зависи од вашата земја). Билансот станува достапен за инвестирање.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Знајте го вашиот профил на ризик';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Одговорете на прашалник за соодветност. Разберете дали сте конзервативни, умерени или агресивни.';

  @override
  String get investFirstSteps_firstAssetTitle =>
      'Купете го вашето прво средство';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Започнете со фонд за итни случаи (Tesouro Selic или ЦДБ со дневна ликвидност). Потоа постепено диверзифицирајте.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Започнете со итен фонд (готовина со висок принос, фондови на пазарот на пари или краткорочни државни обврзници). Потоа постепено диверзифицирајте.';

  @override
  String get investFirstSteps_tipTitle => 'Совет за ментор:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Започнете мали, инвестирајте постојано и избегнувајте да се обидувате да го темпирате пазарот. Времето е вашиот најдобар сојузник.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Започнете малку, инвестирајте постојано и избегнувајте да се обидувате да го темпирате пазарот. Времето е вашиот најдобар сојузник.';

  @override
  String get investMenu_tesouroTitle => 'Бразилски ризници';

  @override
  String get investMenu_cdbTitle => 'Банка со фиксен приход (CDB)';

  @override
  String get investMenu_etfsTitle => 'Меѓународни ЕТФ';

  @override
  String get investMenu_sp500Title => 'S&P 500 (индекс)';

  @override
  String get investMenu_stocksTitle => 'Акции\nЗЗЗ143ЗЗЗ Средства';

  @override
  String get investMenu_fundsTitle => 'Funds';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Меѓународниот';

  @override
  String get investMenu_cryptoTitle => 'Крипто';

  @override
  String get investRegisterCta => 'Регистрирајте инвестиција';

  @override
  String investRegionHintBr(String country) {
    return 'Ефективна земја: $country · Бразилски каталог (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Ефективна земја: $country · Глобален каталог (ETF, NYSE/NASDAQ…). Автоматски се прилагодува од регионот на вашиот уред.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Суштински стратегии';

  @override
  String get strategy_sectionDeepDiveTitle => 'длабоко нуркање (премиум)';

  @override
  String get strategy_emergencyFundTitle => 'Итен фонд';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Вашиот финансиски штит. Покријте 6-12 месеци трошоци. Дајте приоритет на дневната ликвидност и низок ризик (на пр., Tesouro Selic или CDB поврзана со CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Вашиот финансиски штит. Покријте 6-12 месеци трошоци. Дајте приоритет на дневната ликвидност и низок ризик (на пример, фондови на пазарот на пари и краткорочни државни обврзници).';

  @override
  String get strategy_buyHoldTitle => 'Купи и задржи';

  @override
  String get strategy_buyHoldBody =>
      'Купете квалитетни средства и држете ги на долг рок. Фокусирајте се на дисциплина, квалитет и реинвестирање со текот на времето.';

  @override
  String get strategy_diversificationTitle => 'Диверзификација';

  @override
  String get strategy_diversificationBodyBr =>
      'Распоредете го вашиот капитал преку фиксен приход, акции, FII и меѓународни средства за да го намалите ризикот и да ги подобрите приносите приспособени на ризик.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Раширете го вашиот капитал преку обврзници, акции, REIT и меѓународна изложеност за да го намалите ризикот и да ги подобрите приносите приспособени на ризик.';

  @override
  String get strategy_dcaTitle => 'Просечна цена на долар (DCA)';

  @override
  String get strategy_dcaBody =>
      'Конзистентноста ја победи генијалноста. Инвестирањето секој месец е често поефикасно од обидот да се избере совршената влезна точка.';

  @override
  String get strategy_smartGoalsTitle => 'SMART цели';

  @override
  String get strategy_smartGoalsBody =>
      'Вашите цели треба да бидат конкретни, мерливи, остварливи, релевантни и временски ограничени.\nЗЗЗ165ЗЗЗ 50-30-20 правило';

  @override
  String get strategy_503020Title => '50-30-20 rule';

  @override
  String get strategy_503020Body =>
      'Едноставна рамка за буџетирање: 50% потреби, 30% желби, 20% инвестирање и цели.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Распределба на средства (напредно)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Научете како да изградите распределба по цел и хоризонт, приспособувајќи го ризикот, корелацијата и ребалансирањето.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Глобални ETF и индекси (напредно)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Дознајте за глобалните индекси (на пр., S&P 500), ETF и како да изградите меѓународна изложеност со дисциплина.';

  @override
  String get strategy_deepDive_taxesTitle => 'Даноци и известување (напредно)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Разберете ги основните даночни концепти и како да водите евиденција за безбедно да ги пријавите инвестициите.';

  @override
  String get strategy_premiumLockedBody =>
      'Премиум содржина. Активирајте ја темата Cyber/Grimm/Hive за да ја отклучите инвестицијата Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Изложба';

  @override
  String get homeShowcaseProfileSimTitle => 'Квиз за профил на ризик';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Најдете го вашиот профил на инвеститор за неколку минути.';

  @override
  String get homeShowcaseStrategiesTitle => 'Препорачани стратегии';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Директни кратенки за учење и примена на стратегии.';

  @override
  String get homeShowcaseMentorHubTitle => 'Ментор: Квизови и стратегии';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Брз пристап до квизот на профилот на ризик и препорачаните стратегии.';

  @override
  String get homeTourStepClassicTitle => 'Класичен режим';

  @override
  String get homeTourStepClassicBody =>
      'Го отвора оригиналниот панел со апликации: трансакции, цели, инвестиции и поставки во познатиот распоред.';

  @override
  String get homeTourStepVitrineTitle => 'Изложен простор';

  @override
  String get homeTourStepVitrineBody =>
      'Кратенки за учење и вежбање: профил на инвеститор, стратегии и центар Ментор.\nКвиз за профил на';

  @override
  String get homeTourStepProfileTitle => '';

  @override
  String get homeTourStepProfileBody =>
      'Одговорете на прашалникот за да го откриете вашиот профил на ризик и да ги видите усогласените предлози.\nСтратегии на';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Содржина за организирање финансии, инвестирање со дисциплина и избегнување вообичаени стапици.';

  @override
  String get homeTourStepHubTitle => 'Менторски центар';

  @override
  String get homeTourStepHubBody =>
      'Брзо мени до квизот на профилот и препорачаните стратегии.';

  @override
  String get homeTourStepPremiumTitle => 'Премиум карактеристики';

  @override
  String get homeTourStepPremiumBody =>
      'Автоматско менторство, напредни графикони и месечни извештаи — достапни со претплата за Premium.';

  @override
  String get homeTourStepMarketTitle => 'Слика од пазарот';

  @override
  String get homeTourStepMarketBody =>
      'Пазарен контекст (Бразил или глобален) врз основа на вашиот регион плус конвертираната нето вредност.';

  @override
  String get homeTourStepCalculatorTitle => 'Ментор калкулатор';

  @override
  String get homeTourStepCalculatorBody =>
      'Симулирајте сложена камата, инфлација и видете ја табелата на богатство; следно ја отвораме оваа алатка.';

  @override
  String get quizProfile_title => 'Квиз за профил на ризик';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Прашање $current од $total';
  }

  @override
  String get quizProfile_badge => 'РИЗИК ПРОФИЛ КВИЗ';

  @override
  String get quizProfile_resultTitle => 'ВАШИОТ ПРОФИЛ Е';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ИДЕАЛНИ ИНВЕСТИЦИИ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ИСТРАЖУВАЈТЕ ИНВЕСТИЦИИ';

  @override
  String get quizProfile_exit => 'ИЗЛЕЗ';

  @override
  String get quizKnowledge_title => 'Квиз за знаење';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Прашање $current од $total';
  }
}

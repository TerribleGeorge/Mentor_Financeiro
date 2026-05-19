// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kirghiz Kyrgyz (`ky`).
class AppLocalizationsKy extends AppLocalizations {
  AppLocalizationsKy([String locale = 'ky']) : super(locale);

  @override
  String get appTitle => 'Насаатчы Каржы';

  @override
  String get saldo => 'Баланс';

  @override
  String get gastosDiarios => 'Күнүмдүк чыгымдар';

  @override
  String get confirmarTransacao => 'Транзакцияны ырастоо';

  @override
  String get extrato => 'билдирүү';

  @override
  String get transferencias => 'Transfers';

  @override
  String get investimentos => 'Инвестициялар';

  @override
  String get configuracoes => 'Орнотуулар';

  @override
  String get perfil => 'профили';

  @override
  String get sair => 'Чыгуу';

  @override
  String get entrar => 'Кирүү';

  @override
  String get cadastrar => 'Каттоо';

  @override
  String get email => 'Электрондук почта';

  @override
  String get senha => 'Сырсөз';

  @override
  String get nome => 'Аты-жөнү';

  @override
  String get cpf => 'ID номери';

  @override
  String get telefone => 'Телефон';

  @override
  String get continuar => 'Улантуу';

  @override
  String get voltar => 'Артка';

  @override
  String get cancelar => 'Жокко чыгаруу';

  @override
  String get salvar => 'Сактоо';

  @override
  String get editar => 'Edit';

  @override
  String get excluir => 'Жок кылуу';

  @override
  String get sucesso => 'Ийгилик';

  @override
  String get erro => 'Error';

  @override
  String get carregando => 'Жүктөлүүдө...';

  @override
  String get semDados => 'Маалымат жок';

  @override
  String get tentarNovamente => 'Кайталап көрүңүз';

  @override
  String get relatorios => 'Reports';

  @override
  String get gastosPorCategoria => 'Категория боюнча чыгашалар';

  @override
  String get ultimosSeteDias => 'Акыркы 7 күн';

  @override
  String get totalGasto => 'Жалпы сарпталган';

  @override
  String get transacoes => 'транзакциялар';

  @override
  String get categoria => 'Category';

  @override
  String get data => 'Дата';

  @override
  String get valor => 'Мааниси';

  @override
  String get descricao => 'Description';

  @override
  String get alimentacao => 'Тамак-аш';

  @override
  String get transporte => 'Транспорт';

  @override
  String get lazer => 'Эс алуу';

  @override
  String get saude => 'Ден соолук';

  @override
  String get outros => 'Башкалар';

  @override
  String get notificacoes => 'Эскертмелер';

  @override
  String get permissaoNotificacoes => 'Кабарлоо уруксаты';

  @override
  String get ativarMonitoramento => 'Чыгымдардын мониторингин иштетүү';

  @override
  String get descricaoMonitoramento =>
      'Колдонмого каржыңызды уюштуруу үчүн банк транзакцияларыңызды автоматтык түрдө көзөмөлдөөгө уруксат бериңиз.';

  @override
  String get idioma => 'тили';

  @override
  String get moeda => 'Валюта';

  @override
  String get compararInvestimentos => 'Инвестицияларды салыштырыңыз';

  @override
  String get descricaoLocalizacao =>
      'Жергиликтүү инвестицияларды (CDB/CDI) эл аралык тарифтер менен салыштыруу үчүн бизге жайгашкан жериңиз керек.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Жайгашкан жерди аныктоого уруксат талап кылынат';

  @override
  String get rendaFixa => 'Туруктуу киреше';

  @override
  String get rendaVariavel => 'Өзгөрмө киреше';

  @override
  String get tesouroDireto => 'Казыналык Түз';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Акциялар';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Cryptocurrencies';

  @override
  String get rendimento => 'Кайтуу';

  @override
  String get rentabilidade => 'Рентабелдүүлүк';

  @override
  String get aplicar => 'Колдонуу';

  @override
  String get resgatar => 'Куткаруу';

  @override
  String get simular => 'Симулят';

  @override
  String get metas => 'Максаттар';

  @override
  String get estrategias => 'Strategies';

  @override
  String get conhecimento => 'Билим';

  @override
  String get chat => 'Чат';

  @override
  String get enviarMensagem => 'Билдирүүнү жөнөтүү';

  @override
  String get digiteMensagem => 'Билдирүүнү териңиз...';

  @override
  String get alertaGastos => 'Сарптоо эскертүүсү';

  @override
  String alertaGastosMsg(int percent) {
    return 'Сиз насыя чегиңиздин $percent% колдонгонсуз.';
  }

  @override
  String get fechamentoFatura => 'Эсеп-фактуранын жабылышы';

  @override
  String get fechamentoFaturaMsg =>
      'Эртең жабылуу күнү. Чыгымдарды карап чыгууга сонун убакыт.';

  @override
  String get faturaVencendo => 'Эсеп-фактура төлөө мөөнөтү';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Эсеп-фактура $dias күндөн кийин төлөнөт. Балансыңызды текшериңиз.';
  }

  @override
  String get regra30 => 'Кеңеш: 30% эреже';

  @override
  String get regra30Msg =>
      'Кредиттик упайыңызды жакшыртуу үчүн колдонууну 30%дан төмөн кармаңыз.';

  @override
  String get diaDeOuro => 'Алтын күн!';

  @override
  String get diaDeOuroMsg =>
      'Бүгүнкү сатып алууларыңыз 40 күндүн ичинде гана төлөнөт!';

  @override
  String get alertaJuros => 'Эскертүү: Кызыкчылык';

  @override
  String get alertaJurosMsg =>
      'Сиздин балансыңыз эсепти жаббайт. Айлануучу кредиттерден качыңыз!';

  @override
  String get notaSaude => 'Финансылык саламаттык';

  @override
  String get notaExcelente => 'Эн сонун! Сизде чоң каржылык ден-соолук бар.';

  @override
  String get notaBom => 'Жакшы, бирок жакшыртса болот.';

  @override
  String get notaAtencao => 'Сарптоого көңүл буруңуз.';

  @override
  String get notaRevisar => 'Каржыңызды карап чыгыңыз.';

  @override
  String get mentorInsightTitle => 'Насаатчы жетекчилиги';

  @override
  String get mentorInsightLoading => 'Базар маалыматы алынууда…';

  @override
  String get mentorInsightError =>
      'Учурда дайындар жүктөлбөй жатат. Бир аздан кийин кайталап көрүңүз.';

  @override
  String get mentorInsightOffline =>
      'Сиз оффлайндасыз. Цитаталарды жана Насаатчынын маалыматын алуу үчүн туташыңыз.';

  @override
  String get mentorAllocationDefensive =>
      'Учурдагы туруксуздукту эске алып, кирешени кууп чыгуудан мурун капиталды сактоого жана өтүмдүүлүккө артыкчылык бериңиз.';

  @override
  String get mentorAllocationBalanced =>
      'Балансты коргоо жана өсүү: максат горизонтуңузду диверсификациялоо жана кайра карап чыгуу.';

  @override
  String get mentorAllocationOffensive =>
      'Сиздин профилиңиз көбүрөөк тобокелчиликке жол берет: тартиптүү болуңуз жана катуу концентрациядан качыңыз.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Символдор каралып чыкты: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Автоматтык (тил)';

  @override
  String get compoundCalculatorTitle =>
      'Насаатчы калькулятор — Комплекстүү пайыздар';

  @override
  String get compoundCalculatorSubtitle =>
      'Салымдарды, номиналдык жана реалдуу пайданы (инфляциядан кийин) жана насаатчынын эскертүүлөрүн окшоштуруңуз.';

  @override
  String get compoundInitialLabel => 'Баштапкы бир жолку сумма';

  @override
  String get compoundMonthlyLabel => 'Айлык салым';

  @override
  String get compoundRateLabel => 'Пайыздык чен';

  @override
  String get compoundRateAnnual => 'жылына';

  @override
  String get compoundRateMonthly => 'айына';

  @override
  String get compoundHorizonLabel => 'Убакыт горизонту';

  @override
  String get compoundHorizonYears => 'жыл';

  @override
  String get compoundHorizonMonths => 'ай';

  @override
  String get compoundInflationLabel => 'Болжолдуу инфляция (жылына%)';

  @override
  String get compoundCalculate => 'эсептөө';

  @override
  String get compoundChartInvested => 'Жалпы инвестицияланган';

  @override
  String get compoundChartInterest => 'Пайыздар алынган';

  @override
  String get compoundSummaryNominalEnd => 'Аяктоо балансы (номиналдуу)';

  @override
  String get compoundSummaryRealGain =>
      'Чыныгы пайда (сатып алуу жөндөмдүүлүгү)';

  @override
  String get compoundMentorCardTitle => 'Насаатчы кеңеши';

  @override
  String get compoundInvalidInput =>
      'Жарактуу маанилерди киргизиңиз (горизонт > 0).';

  @override
  String get userPersonaSectionTitle => 'Насаатчы обону';

  @override
  String get userPersonaNovice => 'Баштоочу';

  @override
  String get userPersonaStrategist => 'стратег';

  @override
  String get userPersonaRiskTaker => 'Тобокелге кабылуучу';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Ачык толук насаатчы түшүнүк';

  @override
  String get investFirstSteps_title => 'Биринчи кадамдар';

  @override
  String get investFirstSteps_brokerTitle => 'Брокерди тандаңыз';

  @override
  String get investFirstSteps_brokerBody =>
      'Жөнгө салынган, кадыр-барктуу мекемелерди издеңиз. Эсеп ачуудан мурун төлөмдөрдү, өнүмдөрдү жана ишенимдүүлүктү салыштырыңыз.';

  @override
  String get investFirstSteps_openAccountTitle => 'Каттоо эсебиңизди ачыңыз';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Санариптик кошуу. Бразилияда сизге адатта CPF/RG жана кээде даректин далили керек.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Санариптик кошуу өлкөгө жараша өзгөрөт. Адатта сизге ID документ жана инсандык/даректи текшерүү керек.';

  @override
  String get investFirstSteps_transferTitle => 'Акча которуу';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Сиздин брокериңизге PIX же банктык которуу аркылуу акча жөнөтүңүз. Баланс инвестициялоо үчүн жеткиликтүү болот.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Каражаттарды банктык которуу же жергиликтүү төлөм ыкмалары аркылуу которуу (өлкөңүзгө жараша). Баланс инвестициялоо үчүн жеткиликтүү болот.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Тобокелдик профилиңизди билиңиз';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Жарактуулугу анкетасына жооп бериңиз. Консервативдүү, орточо же агрессивдүү экениңизди түшүнүңүз.';

  @override
  String get investFirstSteps_firstAssetTitle =>
      'Биринчи активиңизди сатып алыңыз';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Тез жардам фондунан баштаңыз (Tesouro Selic же күнүмдүк өтүмдүүлүк CDB). Андан кийин бара-бара диверсификация.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Шашылыш фонд менен баштаңыз (жогорку кирешелүү накталай акча, акча рыногунун каражаттары же кыска мөөнөттүү казыналык облигациялар). Андан кийин бара-бара диверсификация.';

  @override
  String get investFirstSteps_tipTitle => 'Насаатчы кеңеши:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Кичинеден баштаңыз, ырааттуу түрдө инвестиция салыңыз жана рынокту убакытка бурууга аракет кылбаңыз. Убакыт сиздин эң жакшы өнөктөшүңүз.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Кичинеден баштаңыз, ырааттуу түрдө инвестиция салыңыз жана рынокту убакытка бурууга аракет кылбаңыз. Убакыт сиздин эң жакшы өнөктөшүңүз.';

  @override
  String get investMenu_tesouroTitle => 'Бразилиянын казынасы';

  @override
  String get investMenu_cdbTitle => 'Банктын туруктуу кирешеси (CDB)';

  @override
  String get investMenu_etfsTitle => 'Эл аралык ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (индекс)';

  @override
  String get investMenu_stocksTitle => 'Акциялар';

  @override
  String get investMenu_fundsTitle => 'Фонд';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Эл аралык';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Инвестицияларды каттоо';

  @override
  String investRegionHintBr(String country) {
    return 'Натыйжалуу өлкө: $country · Бразилия каталогу (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Натыйжалуу өлкө: $country · Глобалдык каталог (ETFs, NYSE/NASDAQ…). Түзмөгүңүздүн аймагынан автоматтык түрдө туураланган.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Негизги стратегиялар';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Премиум)';

  @override
  String get strategy_emergencyFundTitle => 'Өзгөчө кырдаалдар фонду';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Сиздин каржылык калканыңыз. 6-12 айлык чыгымдарды жабуу. Күнүмдүк ликвиддүүлүккө жана төмөн тобокелдикке артыкчылык бериңиз (мисалы, Tesouro Selic же CDI менен байланышкан CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Сиздин каржылык калканчыңыз. 6-12 айлык чыгымдарды жабуу. Күнүмдүк ликвиддүүлүккө жана төмөн тобокелдикке артыкчылык бериңиз (мисалы, акча рыногунун каражаттары жана кыска мөөнөттүү казыналык облигациялар).';

  @override
  String get strategy_buyHoldTitle => 'Сатып алуу жана кармоо';

  @override
  String get strategy_buyHoldBody =>
      'Сапаттуу активдерди сатып алыңыз жана узак мөөнөткө кармаңыз. Тартипке, сапатка жана убакыттын өтүшү менен кайра инвестициялоого көңүл буруңуз.';

  @override
  String get strategy_diversificationTitle => 'Диверсификация';

  @override
  String get strategy_diversificationBodyBr =>
      'Тобокелдиктерди азайтуу жана тобокелдикке жараша оңдолгон кирешени жакшыртуу үчүн капиталыңызды туруктуу киреше, акциялар, FII жана эл аралык активдерге таратыңыз.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Капиталыңызды облигацияларга, акцияларга, РЕИТтерге жана эл аралык тобокелдикке жайылтыңыз. Тобокелдикти азайтуу жана тобокелдикке ылайыкталган кирешени жакшыртуу.';

  @override
  String get strategy_dcaTitle => 'Доллардын орточо наркы (DCA)';

  @override
  String get strategy_dcaBody =>
      'Ырааттуулук генийди жеңет. Ай сайын инвестициялоо идеалдуу кирүү пунктун тандоого караганда натыйжалуураак.';

  @override
  String get strategy_smartGoalsTitle => 'SMART максаттары';

  @override
  String get strategy_smartGoalsBody =>
      'Сиздин максаттарыңыз конкреттүү, өлчөнгөн, жетүүгө боло турган, актуалдуу жана убакыт менен чектелген болушу керек.';

  @override
  String get strategy_503020Title => '50-30-20 эрежеси';

  @override
  String get strategy_503020Body =>
      'Жөнөкөй бюджет түзүү негизи: 50% муктаждыктар, 30% каалайт, 20% инвестиция жана максаттар.';

  @override
  String get strategy_deepDive_allocationTitle => 'Актив бөлүштүрүү (өнүккөн)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Максат жана горизонт боюнча бөлүштүрүүнү кантип түзүүнү, тобокелдикти, корреляцияны жана тең салмактуулукту тууралоону үйрөнүңүз.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETFs жана индекстер (өнүккөн)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Глобалдык индекстер (мисалы, S&P 500), ETFs жана тартип менен эл аралык таасирди кантип куруу керектиги жөнүндө билип алыңыз.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Салыктар жана отчеттуулук (өнүккөн)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Негизги салык концепцияларын жана инвестицияларды коопсуз билдирүү үчүн жазууларды кантип сактоону түшүнүңүз.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium мазмун. Deep Dive инвестициясынын кулпусун ачуу үчүн Cyber/Grimm/Hive темасын иштетиңиз.';

  @override
  String get homeShowcaseTitle => 'Showcase';

  @override
  String get homeShowcaseProfileSimTitle => 'Тобокелдик профилинин викторинасы';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Инвестор профилиңизди бир нече мүнөттөн кийин табыңыз.';

  @override
  String get homeShowcaseStrategiesTitle => 'Сунушталган стратегиялар';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Стратегияларды үйрөнүү жана колдонуу үчүн түз жарлыктар.';

  @override
  String get homeShowcaseMentorHubTitle =>
      'Насаатчы: Викториналар жана стратегиялар';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Тобокелдик профили боюнча тестке жана сунушталган стратегияларга тез жетүү.';

  @override
  String get homeTourStepClassicTitle => 'Классикалык режим';

  @override
  String get homeTourStepClassicBody =>
      'Түпнуска колдонмо панелин ачат: транзакциялар, максаттар, инвестициялар жана тааныш макетте жөндөөлөр.';

  @override
  String get homeTourStepVitrineTitle => 'Көрсөтүү аймагы';

  @override
  String get homeTourStepVitrineBody =>
      'Үйрөнүү жана практикалоо үчүн кыска жолдор: инвесторлордун профили, стратегиялар жана Ментор хабы.';

  @override
  String get homeTourStepProfileTitle => 'Профиль викторинасы';

  @override
  String get homeTourStepProfileBody =>
      'Тобокелдик профилиңизди таап, тегизделген сунуштарды көрүү үчүн анкетага жооп бериңиз.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategies';

  @override
  String get homeTourStepStrategiesBody =>
      'Каржыны уюштуруу, тартип менен инвестициялоо жана жалпы тузактардан качуу үчүн мазмун.';

  @override
  String get homeTourStepHubTitle => 'Ментор борбору';

  @override
  String get homeTourStepHubBody =>
      'Профиль викторинасына тез меню жана сунушталган стратегиялар.';

  @override
  String get homeTourStepPremiumTitle => 'Premium өзгөчөлүктөрү';

  @override
  String get homeTourStepPremiumBody =>
      'Авто насаатчылык, өркүндөтүлгөн диаграммалар жана айлык отчеттор — Premium жазылуусу менен жеткиликтүү.';

  @override
  String get homeTourStepMarketTitle => 'Базардын сүрөтү';

  @override
  String get homeTourStepMarketBody =>
      'Рынок контексти (Бразилия же дүйнөлүк) сиздин чөлкөмүңүзгө жана конверттелген таза баалуулукка негизделген.';

  @override
  String get homeTourStepCalculatorTitle => 'Ментор калькулятору';

  @override
  String get homeTourStepCalculatorBody =>
      'Татаал пайыздарды, инфляцияны окшоштуруңуз жана байлык диаграммасын көрүңүз; кийинки биз бул куралды ачабыз.';

  @override
  String get quizProfile_title => 'Тобокелдик профилинин викторинасы';

  @override
  String quizProfile_progress(int current, int total) {
    return 'суроосу $total ичинен $current';
  }

  @override
  String get quizProfile_badge => 'КОРКУНУЧТУУ ПРОФИЛЬДИН ТУРМУШ';

  @override
  String get quizProfile_resultTitle => 'СИЗДИН ПРОФИЛИНИЗ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ИДЕАЛДЫК ИНВЕСТИЦИЯЛАР:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ИНВЕСТИЦИЯЛАРДЫ ИЗИЛДӨӨ';

  @override
  String get quizProfile_exit => 'ЧЫГУУ';

  @override
  String get quizKnowledge_title => 'Билим викторинасы';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'суроосу $total ичинен $current';
  }
}

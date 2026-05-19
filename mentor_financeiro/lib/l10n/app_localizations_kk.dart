// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Ментор қаржысы';

  @override
  String get saldo => 'Баланс';

  @override
  String get gastosDiarios => 'Күнделікті шығыстар';

  @override
  String get confirmarTransacao => 'Транзакцияны растау';

  @override
  String get extrato => 'Мәлімдеме';

  @override
  String get transferencias => 'Трансферттер';

  @override
  String get investimentos => 'Инвестициялар';

  @override
  String get configuracoes => 'Параметрлер';

  @override
  String get perfil => 'профилі';

  @override
  String get sair => 'Шығу';

  @override
  String get entrar => 'Кіру';

  @override
  String get cadastrar => 'Тіркелу';

  @override
  String get email => 'Электрондық пошта';

  @override
  String get senha => 'Құпия сөз';

  @override
  String get nome => 'Атауы';

  @override
  String get cpf => 'ID нөмірі';

  @override
  String get telefone => 'телефон';

  @override
  String get continuar => 'Жалғастыру';

  @override
  String get voltar => 'Артқа';

  @override
  String get cancelar => 'Болдырмау';

  @override
  String get salvar => 'Сақтау';

  @override
  String get editar => 'Өңдеу';

  @override
  String get excluir => 'Жою';

  @override
  String get sucesso => 'Сәттілік';

  @override
  String get erro => 'қатесі';

  @override
  String get carregando => 'Жүктелуде...';

  @override
  String get semDados => 'Деректер жоқ';

  @override
  String get tentarNovamente => 'Қайталап көріңіз';

  @override
  String get relatorios => 'есептері';

  @override
  String get gastosPorCategoria => 'Санаттар бойынша шығыстар';

  @override
  String get ultimosSeteDias => 'Соңғы 7 күн';

  @override
  String get totalGasto => 'Жалпы жұмсалған';

  @override
  String get transacoes => 'транзакциялар';

  @override
  String get categoria => 'санаты';

  @override
  String get data => 'Күні';

  @override
  String get valor => 'Мән';

  @override
  String get descricao => 'Сипаттама';

  @override
  String get alimentacao => 'Тағам';

  @override
  String get transporte => 'Көлік';

  @override
  String get lazer => 'Бос уақыт';

  @override
  String get saude => 'Денсаулық';

  @override
  String get outros => 'Басқалар';

  @override
  String get notificacoes => 'Хабарландырулар';

  @override
  String get permissaoNotificacoes => 'Хабарландыру рұқсаты';

  @override
  String get ativarMonitoramento => 'Шығындарды бақылауды қосу';

  @override
  String get descricaoMonitoramento =>
      'Қаржыңызды ұйымдастыру үшін қолданбаға банк транзакцияларын автоматты түрде бақылауға рұқсат беріңіз.';

  @override
  String get idioma => 'тілі';

  @override
  String get moeda => 'Валюта';

  @override
  String get compararInvestimentos => 'Инвестицияларды салыстыру';

  @override
  String get descricaoLocalizacao =>
      'Жергілікті инвестицияларды (CDB/CDI) халықаралық тарифтермен салыстыру үшін бізге орналасқан жеріңіз қажет.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Орынды анықтау рұқсаты қажет';

  @override
  String get rendaFixa => 'Тұрақты кіріс';

  @override
  String get rendaVariavel => 'Айнымалы кіріс';

  @override
  String get tesouroDireto => 'Қазынашылық тікелей';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'акциялары';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'криптовалюталар';

  @override
  String get rendimento => 'Қайтару';

  @override
  String get rentabilidade => 'Табыстылық';

  @override
  String get aplicar => 'Қолдану';

  @override
  String get resgatar => 'Өтеу';

  @override
  String get simular => 'Модельдеу';

  @override
  String get metas => 'Мақсаттар';

  @override
  String get estrategias => 'стратегиялары';

  @override
  String get conhecimento => 'Білім';

  @override
  String get chat => 'Чат';

  @override
  String get enviarMensagem => 'Хабарлама жіберу';

  @override
  String get digiteMensagem => 'Хабарламаны теріңіз...';

  @override
  String get alertaGastos => 'Шығындар туралы ескерту';

  @override
  String alertaGastosMsg(int percent) {
    return 'Несие лимиті $percent%-ын пайдаланып қойғансыз.';
  }

  @override
  String get fechamentoFatura => 'Шот-фактураны жабу';

  @override
  String get fechamentoFaturaMsg =>
      'Ертең жабылатын күн. Шығындарды қарауға тамаша уақыт.';

  @override
  String get faturaVencendo => 'Төлеу мерзімі шот-фактура';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Шот-фактура $dias күннен кейін төленеді. Балансыңызды тексеріңіз.';
  }

  @override
  String get regra30 => 'Кеңес: 30% ереже';

  @override
  String get regra30Msg =>
      'Несие ұпайыңызды жақсарту үшін пайдалануды 30%-дан төмен ұстаңыз.';

  @override
  String get diaDeOuro => 'Алтын күн!';

  @override
  String get diaDeOuroMsg =>
      'Бүгінгі сатып алуларыңыз тек 40 күннен кейін төленеді!';

  @override
  String get alertaJuros => 'Ескерту: қызығушылық';

  @override
  String get alertaJurosMsg =>
      'Сіздің балансыңыз шотқа кірмейді. Қайталанатын несиеден аулақ болыңыз!';

  @override
  String get notaSaude => 'Қаржылық денсаулық';

  @override
  String get notaExcelente => 'Өте жақсы! Сіздің қаржылық денсаулығыңыз жақсы.';

  @override
  String get notaBom => 'Жақсы, бірақ жақсартуға болады.';

  @override
  String get notaAtencao => 'Шығынға назар аударыңыз.';

  @override
  String get notaRevisar => 'Қаржыңызды қарап шығыңыз.';

  @override
  String get mentorInsightTitle => 'Тәлімгердің нұсқауы';

  @override
  String get mentorInsightLoading => 'Нарық деректері алынуда…';

  @override
  String get mentorInsightError =>
      'Дәл қазір деректерді жүктеу мүмкін емес. Біраз уақыттан кейін қайталап көріңіз.';

  @override
  String get mentorInsightOffline =>
      'Сіз офлайнсыз. Дәйексөздер мен тәлімгердің түсініктерін алу үшін қосылыңыз.';

  @override
  String get mentorAllocationDefensive =>
      'Ағымдағы құбылмалылықты ескере отырып, кірістерді іздеу алдында капиталды сақтау мен өтімділікке басымдық беріңіз.';

  @override
  String get mentorAllocationBalanced =>
      'Тепе-теңдікті қорғау және өсу: мақсат көкжиегіңізді әртараптандырыңыз және қайта қараңыз.';

  @override
  String get mentorAllocationOffensive =>
      'Сіздің профиліңіз көбірек тәуекелге жол береді: тәртіпті сақтаңыз және қатты зейін қоюдан аулақ болыңыз.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Қаралған белгілер: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Автоматты (тіл)';

  @override
  String get compoundCalculatorTitle => 'Ментор калькуляторы — күрделі пайыз';

  @override
  String get compoundCalculatorSubtitle =>
      'Жарналарды, номиналды және нақты пайданы (инфляциядан кейін) және тәлімгер жазбаларын имитациялаңыз.';

  @override
  String get compoundInitialLabel => 'Бастапқы біржолғы төлем';

  @override
  String get compoundMonthlyLabel => 'Ай сайынғы жарна';

  @override
  String get compoundRateLabel => 'Пайыз мөлшерлемесі';

  @override
  String get compoundRateAnnual => 'жылына';

  @override
  String get compoundRateMonthly => 'айына';

  @override
  String get compoundHorizonLabel => 'Уақыт көкжиегі';

  @override
  String get compoundHorizonYears => 'жылдар';

  @override
  String get compoundHorizonMonths => 'ай';

  @override
  String get compoundInflationLabel => 'Болжалды инфляция (жылдық %)';

  @override
  String get compoundCalculate => 'Есептеңіз';

  @override
  String get compoundChartInvested => 'Барлығы инвестицияланған';

  @override
  String get compoundChartInterest => 'Пайыз алынды';

  @override
  String get compoundSummaryNominalEnd => 'Соңғы баланс (номиналды)';

  @override
  String get compoundSummaryRealGain => 'Нақты пайда (сатып алу қабілеті)';

  @override
  String get compoundMentorCardTitle => 'Тәлімгер кеңесі';

  @override
  String get compoundInvalidInput =>
      'Жарамды мәндерді енгізіңіз (горизонт > 0).';

  @override
  String get userPersonaSectionTitle => 'Ментор үні';

  @override
  String get userPersonaNovice => 'Бастауыш';

  @override
  String get userPersonaStrategist => 'стратег';

  @override
  String get userPersonaRiskTaker => 'Тәуекелші';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Тәлімгердің толық түсінігін ашыңыз';

  @override
  String get investFirstSteps_title => 'Алғашқы қадамдар';

  @override
  String get investFirstSteps_brokerTitle => 'Брокерді таңдаңыз';

  @override
  String get investFirstSteps_brokerBody =>
      'Реттелетін, беделді мекемелерді іздеңіз. Есептік жазбаны ашпас бұрын комиссияларды, өнімдерді және сенімділікті салыстырыңыз.';

  @override
  String get investFirstSteps_openAccountTitle => 'Тіркелгіңізді ашыңыз';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Сандық қосу. Бразилияда әдетте CPF/RG және кейде мекенжайды растайтын құжат қажет.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Сандық қосу елге байланысты өзгереді. Әдетте сізге жеке куәлік және жеке басын куәландыратын құжат/мекенжайды растау қажет.';

  @override
  String get investFirstSteps_transferTitle => 'Ақшаны аудару';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Брокерге PIX немесе банктік аударым арқылы ақша жіберіңіз. Баланс инвестициялауға қол жетімді болады.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Қаражатты банктік аударым немесе жергілікті төлем әдістері арқылы аударыңыз (еліңізге байланысты). Баланс инвестициялауға қол жетімді болады.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Тәуекел профиліңізді біліңіз';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Жарамдылық сауалнамасына жауап беріңіз. Сіз консервативті, қалыпты немесе агрессивті екеніңізді түсініңіз.';

  @override
  String get investFirstSteps_firstAssetTitle =>
      'Бірінші активіңізді сатып алыңыз';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Төтенше қордан бастаңыз (Tesouro Selic немесе күнделікті өтімділік CDB). Содан кейін біртіндеп әртараптандырыңыз.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Төтенше қордан бастаңыз (жоғары кірісті қолма-қол ақша, ақша нарығының қорлары немесе қысқа мерзімді қазынашылық міндеттемелер). Содан кейін біртіндеп әртараптандырыңыз.';

  @override
  String get investFirstSteps_tipTitle => 'Тәлімгер кеңесі:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Кішкентайдан бастаңыз, тұрақты түрде инвестициялаңыз және нарықты уақытты белгілеуге тырыспаңыз. Уақыт сіздің ең жақсы одақтасыңыз.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Кішкентайдан бастаңыз, тұрақты түрде инвестициялаңыз және нарықты уақытты белгілеуге тырыспаңыз. Уақыт сіздің ең жақсы одақтасыңыз.';

  @override
  String get investMenu_tesouroTitle => 'Бразилия қазынашылықтары';

  @override
  String get investMenu_cdbTitle => 'Банк тұрақты кірісі (CDB)';

  @override
  String get investMenu_etfsTitle => 'халықаралық ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (индекс)';

  @override
  String get investMenu_stocksTitle => 'акциялары';

  @override
  String get investMenu_fundsTitle => 'қорлары';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Халықаралық';

  @override
  String get investMenu_cryptoTitle => 'крипто';

  @override
  String get investRegisterCta => 'Инвестицияларды тіркеу';

  @override
  String investRegionHintBr(String country) {
    return 'Тиімді ел: $country · Бразилия каталогы (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Тиімді ел: $country · Жаһандық каталог (ETFs, NYSE/NASDAQ…). Құрылғы аймағынан автоматты түрде реттеледі.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Маңызды стратегиялар';

  @override
  String get strategy_sectionDeepDiveTitle => 'терең сүңгу (премиум)';

  @override
  String get strategy_emergencyFundTitle => 'Төтенше жағдай қоры';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Сіздің қаржылық қалқаныңыз. 6-12 айлық шығындарды жабу. Күнделікті өтімділікке және төмен тәуекелге басымдық беріңіз (мысалы, Tesouro Selic немесе CDI-байланысты CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Сіздің қаржылық қалқаныңыз. 6-12 айлық шығындарды жабу. Күнделікті өтімділікке және төмен тәуекелге басымдық беріңіз (мысалы, ақша нарығының қорлары және қысқа мерзімді қазынашылық міндеттемелер).';

  @override
  String get strategy_buyHoldTitle => 'Сатып алу және ұстау';

  @override
  String get strategy_buyHoldBody =>
      'Сапалы активтерді сатып алып, ұзақ мерзімге сақтаңыз. Уақыт өте келе тәртіпке, сапаға және қайта инвестициялауға назар аударыңыз.';

  @override
  String get strategy_diversificationTitle => 'әртараптандыру';

  @override
  String get strategy_diversificationBodyBr =>
      'Тәуекелді азайту және тәуекелге байланысты түзетілген табысты жақсарту үшін капиталыңызды тіркелген кіріс, акциялар, FII және халықаралық активтерге таратыңыз.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Тәуекелді азайту және тәуекелге байланысты түзетілген табысты жақсарту үшін капиталыңызды облигациялар, акциялар, REIT және халықаралық тәуекелге таратыңыз.';

  @override
  String get strategy_dcaTitle => 'Доллардың орташа құны (DCA)';

  @override
  String get strategy_dcaBody =>
      'Жүйелілік данышпандарды жеңеді. Ай сайын инвестициялау өте жақсы кіру нүктесін таңдаудан гөрі тиімдірек.';

  @override
  String get strategy_smartGoalsTitle => 'SMART мақсаттары';

  @override
  String get strategy_smartGoalsBody =>
      'Сіздің мақсаттарыңыз нақты, өлшенетін, қол жеткізуге болатын, өзекті және уақытқа байланысты болуы керек.';

  @override
  String get strategy_503020Title => '50-30-20 ережесі';

  @override
  String get strategy_503020Body =>
      'Қарапайым бюджеттік құрылым: 50% қажеттіліктер, 30% қажет, 20% инвестиция және мақсаттар.';

  @override
  String get strategy_deepDive_allocationTitle => 'Активтерді бөлу (қосымша)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Мақсат пен көкжиек бойынша бөлуді құруды, тәуекелді, корреляцияны және қайта теңестіруді реттеуді үйреніңіз.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'жаһандық ETF және индекстер (кеңейтілген)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Жаһандық индекстер (мысалы, S&P 500), ETF және халықаралық әсерді тәртіппен қалай құру керектігін біліңіз.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Салықтар және есеп беру (қосымша)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Инвестициялар туралы қауіпсіз есеп беру үшін негізгі салық тұжырымдамаларын және жазбаларды қалай сақтау керектігін түсініңіз.';

  @override
  String get strategy_premiumLockedBody =>
      'Премиум мазмұн. Инвестициялық Deep Dive құлпын ашу үшін Cyber/Grimm/Hive тақырыбын іске қосыңыз.';

  @override
  String get homeShowcaseTitle => 'Көрме';

  @override
  String get homeShowcaseProfileSimTitle => 'Тәуекел профилі бойынша викторина';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Инвестор профиліңізді бірнеше минут ішінде табыңыз.';

  @override
  String get homeShowcaseStrategiesTitle => 'Ұсынылатын стратегиялар';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Стратегияларды үйрену және қолдану үшін тікелей төте жолдар.';

  @override
  String get homeShowcaseMentorHubTitle =>
      'Тәлімгер: Викториналар және стратегиялар';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Тәуекел профилі бойынша тестке және ұсынылған стратегияларға жылдам қол жеткізу.';

  @override
  String get homeTourStepClassicTitle => 'Классикалық режим';

  @override
  String get homeTourStepClassicBody =>
      'Түпнұсқа қолданба тақтасын ашады: транзакциялар, мақсаттар, инвестициялар және таныс орналасудағы параметрлер.';

  @override
  String get homeTourStepVitrineTitle => 'Көрме аймағы';

  @override
  String get homeTourStepVitrineBody =>
      'Үйренуге және тәжірибеге төте жолдар: инвестор профилі, стратегиялар және ментор хабы.';

  @override
  String get homeTourStepProfileTitle => 'Профиль викторинасы';

  @override
  String get homeTourStepProfileBody =>
      'Тәуекел профиліңізді анықтау және реттелген ұсыныстарды көру үшін сауалнамаға жауап беріңіз.';

  @override
  String get homeTourStepStrategiesTitle => 'стратегиялары';

  @override
  String get homeTourStepStrategiesBody =>
      'Қаржыны ұйымдастыруға, тәртіппен инвестициялауға және жалпы қателіктерді болдырмауға арналған мазмұн.';

  @override
  String get homeTourStepHubTitle => 'Ментор хабы';

  @override
  String get homeTourStepHubBody =>
      'Профиль викторинасына және ұсынылған стратегияларға арналған жылдам мәзір.';

  @override
  String get homeTourStepPremiumTitle => 'Premium мүмкіндіктері';

  @override
  String get homeTourStepPremiumBody =>
      'Автоматты тәлімгерлік, кеңейтілген диаграммалар және айлық есептер — Premium жазылымымен қолжетімді.';

  @override
  String get homeTourStepMarketTitle => 'Нарық суреті';

  @override
  String get homeTourStepMarketBody =>
      'Аймағыңызға және конверсияланған таза құнға негізделген нарық контексі (Бразилия немесе жаһандық).';

  @override
  String get homeTourStepCalculatorTitle => 'Ментор калькуляторы';

  @override
  String get homeTourStepCalculatorBody =>
      'Күрделі пайызды, инфляцияны имитациялаңыз және байлық кестесін қараңыз; келесі құралды ашамыз.';

  @override
  String get quizProfile_title => 'Тәуекел профилі бойынша викторина';

  @override
  String quizProfile_progress(int current, int total) {
    return '$total сұрағы $current';
  }

  @override
  String get quizProfile_badge => 'ТӘУЕКЕЛ ПРОФИЛІЛІК ВИКТИНА';

  @override
  String get quizProfile_resultTitle => 'ПРОФИЛЬІҢІЗ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ИДЕАЛ ИНВЕСТИЦИЯЛАР:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ИНВЕСТИЦИЯЛАРДЫ ЗЕРТТЕУ';

  @override
  String get quizProfile_exit => 'ШЫҒУ';

  @override
  String get quizKnowledge_title => 'Білім викторинасы';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '$total сұрағы $current';
  }
}

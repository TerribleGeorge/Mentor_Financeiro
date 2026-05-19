// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pushto Pashto (`ps`).
class AppLocalizationsPs extends AppLocalizations {
  AppLocalizationsPs([String locale = 'ps']) : super(locale);

  @override
  String get appTitle => 'سرپرست مالي';

  @override
  String get saldo => 'بیلانس';

  @override
  String get gastosDiarios => 'ورځني لګښتونه';

  @override
  String get confirmarTransacao => 'راکړه ورکړه تایید کړه';

  @override
  String get extrato => 'بیان';

  @override
  String get transferencias => 'لیږدونه';

  @override
  String get investimentos => 'پانګه اچونه';

  @override
  String get configuracoes => 'ترتیبات';

  @override
  String get perfil => 'پروفایل';

  @override
  String get sair => 'ننوتل';

  @override
  String get entrar => 'ننوتل';

  @override
  String get cadastrar => 'راجستر';

  @override
  String get email => 'بریښنالیک';

  @override
  String get senha => 'پټنوم';

  @override
  String get nome => 'نوم';

  @override
  String get cpf => 'ID شمیره';

  @override
  String get telefone => 'تلیفون';

  @override
  String get continuar => 'ادامه ورکړئ';

  @override
  String get voltar => 'بیرته';

  @override
  String get cancelar => 'لغوه کړه';

  @override
  String get salvar => 'خوندي کړئ';

  @override
  String get editar => 'سمون';

  @override
  String get excluir => 'ړنګول';

  @override
  String get sucesso => 'بریالیتوب';

  @override
  String get erro => 'تېروتنه';

  @override
  String get carregando => 'پورته کیږي...';

  @override
  String get semDados => 'هیڅ معلومات نشته';

  @override
  String get tentarNovamente => 'بیا هڅه وکړئ';

  @override
  String get relatorios => 'راپورونه';

  @override
  String get gastosPorCategoria => 'لګښتونه د کټګورۍ له مخې';

  @override
  String get ultimosSeteDias => 'وروستۍ 7 ورځې';

  @override
  String get totalGasto => 'ټول مصرف';

  @override
  String get transacoes => 'لیږدونه';

  @override
  String get categoria => 'کټګوري';

  @override
  String get data => 'نیټه';

  @override
  String get valor => 'ارزښت';

  @override
  String get descricao => 'تفصیل';

  @override
  String get alimentacao => 'خواړه';

  @override
  String get transporte => 'ټرانسپورټ';

  @override
  String get lazer => 'تفریح';

  @override
  String get saude => 'روغتیا';

  @override
  String get outros => 'نور';

  @override
  String get notificacoes => 'خبرتیاوې';

  @override
  String get permissaoNotificacoes => 'د خبرتیا اجازه';

  @override
  String get ativarMonitoramento => 'د لګښت نظارت فعال کړئ';

  @override
  String get descricaoMonitoramento =>
      'اپلیکیشن ته اجازه ورکړئ چې ستاسو د مالیاتو تنظیم کولو لپاره په اوتومات ډول ستاسو د بانک لیږد څارنه وکړي.';

  @override
  String get idioma => 'ژبه';

  @override
  String get moeda => 'اسعارو';

  @override
  String get compararInvestimentos => 'پانګه اچونه پرتله کړئ';

  @override
  String get descricaoLocalizacao =>
      'محلي پانګونې (CDB/CDI) د نړیوالو نرخونو سره پرتله کولو لپاره، موږ ستاسو موقعیت ته اړتیا لرو.';

  @override
  String get permissaoLocalizacaoNecessaria => 'د ځای اجازې ته اړتیا ده';

  @override
  String get rendaFixa => 'ثابت عاید';

  @override
  String get rendaVariavel => 'متغیر عاید';

  @override
  String get tesouroDireto => 'خزانه مستقیم';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'ذخیره';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'کریپټو اسعارو';

  @override
  String get rendimento => 'بیرته راستنیدل';

  @override
  String get rentabilidade => 'ګټه';

  @override
  String get aplicar => 'غوښتنه وکړئ';

  @override
  String get resgatar => 'خلاص کړئ';

  @override
  String get simular => 'سمول';

  @override
  String get metas => 'اهداف';

  @override
  String get estrategias => 'ستراتیژۍ';

  @override
  String get conhecimento => 'پوهه';

  @override
  String get chat => 'چیٹ';

  @override
  String get enviarMensagem => 'پیغام واستوئ';

  @override
  String get digiteMensagem => 'یو پیغام ولیکئ...';

  @override
  String get alertaGastos => 'د مصرف خبرتیا';

  @override
  String alertaGastosMsg(int percent) {
    return 'تاسو دمخه د خپل کریډیټ حد $percent٪ کارولی.';
  }

  @override
  String get fechamentoFatura => 'رسید بندول';

  @override
  String get fechamentoFaturaMsg =>
      'سبا د تړلو ورځ ده. د لګښتونو بیاکتنې لپاره ښه وخت.';

  @override
  String get faturaVencendo => 'رسید پای ته رسیدلی';

  @override
  String faturaVencendoMsg(int dias) {
    return 'رسید په $dias ورځو کې. خپل بیلانس چیک کړئ.';
  }

  @override
  String get regra30 => 'ټیپ: 30٪ قاعده';

  @override
  String get regra30Msg =>
      'ستاسو د کریډیټ سکور ښه کولو لپاره د 30٪ څخه کم کارول وساتئ.';

  @override
  String get diaDeOuro => 'طلایی ورځ!';

  @override
  String get diaDeOuroMsg =>
      'ستاسو نننۍ پیرود به یوازې په 40 ورځو کې تادیه شي!';

  @override
  String get alertaJuros => 'خبرداری: سود';

  @override
  String get alertaJurosMsg =>
      'ستاسو بیلانس بیل نه پوښي. د کریډیټ بدلولو څخه ډډه وکړئ!';

  @override
  String get notaSaude => 'مالي روغتیا';

  @override
  String get notaExcelente => 'عالي! تاسو ښه مالي روغتیا لرئ.';

  @override
  String get notaBom => 'ښه، مګر وده کولی شي.';

  @override
  String get notaAtencao => 'لګښتونو ته پاملرنه.';

  @override
  String get notaRevisar => 'خپل مالیات بیاکتنه وکړئ.';

  @override
  String get mentorInsightTitle => 'د لارښود لارښود';

  @override
  String get mentorInsightLoading => 'د بازار ډاټا ترلاسه کول…';

  @override
  String get mentorInsightError =>
      'همدا اوس ډاټا نشي پورته کولی. لږ وروسته بیا هڅه وکړئ.';

  @override
  String get mentorInsightOffline =>
      'تاسو آفلاین یاست. د نرخونو او لارښود لیدونو ترلاسه کولو سره وصل شئ.';

  @override
  String get mentorAllocationDefensive =>
      'اوسني بې ثباتۍ ته په پام سره، د بیرته راګرځیدو دمخه د پانګې ساتنې او مایعاتو ته لومړیتوب ورکړئ.';

  @override
  String get mentorAllocationBalanced =>
      'توازن ساتنه او وده: د خپل هدف افق تنوع او بیا کتنه وکړئ.';

  @override
  String get mentorAllocationOffensive =>
      'ستاسو پروفایل ډیر خطر ته اجازه ورکوي: ډسپلین اوسئ او د ډیر تمرکز څخه مخنیوی وکړئ.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'سمبولونه بیاکتنه شوي: $symbols';
  }

  @override
  String get currencyFollowLocale => 'اتوماتیک (ژبه)';

  @override
  String get compoundCalculatorTitle => 'د لارښود حساب ورکوونکی - مرکب سود';

  @override
  String get compoundCalculatorSubtitle =>
      'د ونډې تقلید، د اصلي لاسته راوړنې په مقابل کې نومول (د انفلاسیون وروسته)، او د لارښود یادښتونه.';

  @override
  String get compoundInitialLabel => 'ابتدايي یوه اندازه';

  @override
  String get compoundMonthlyLabel => 'میاشتنۍ مرسته';

  @override
  String get compoundRateLabel => 'د سود نرخ';

  @override
  String get compoundRateAnnual => 'په کال کې';

  @override
  String get compoundRateMonthly => 'هره میاشت';

  @override
  String get compoundHorizonLabel => 'وخت افق';

  @override
  String get compoundHorizonYears => 'کاله';

  @override
  String get compoundHorizonMonths => 'میاشتې';

  @override
  String get compoundInflationLabel => 'اټکل شوی انفلاسیون (٪ په کال کې)';

  @override
  String get compoundCalculate => 'حساب کړئ';

  @override
  String get compoundChartInvested => 'ټوله پانګه اچونه';

  @override
  String get compoundChartInterest => 'سود ترلاسه کړ';

  @override
  String get compoundSummaryNominalEnd => 'پای توازن (نوم)';

  @override
  String get compoundSummaryRealGain => 'ریښتینې ګټه (د پیرود ځواک)';

  @override
  String get compoundMentorCardTitle => 'د لارښود مشوره';

  @override
  String get compoundInvalidInput => 'معتبر ارزښتونه دننه کړئ (افق > 0).';

  @override
  String get userPersonaSectionTitle => 'د لارښود ټون';

  @override
  String get userPersonaNovice => 'پیل کونکی';

  @override
  String get userPersonaStrategist => 'ستراتیژیک';

  @override
  String get userPersonaRiskTaker => 'خطر اخیستونکی';

  @override
  String get userPersonaConservative => 'سیور';

  @override
  String get compoundOpenFullInsight => 'د بشپړ لارښود بصیرت خلاص کړئ';

  @override
  String get investFirstSteps_title => 'لومړی ګامونه';

  @override
  String get investFirstSteps_brokerTitle => 'یو بروکر غوره کړئ';

  @override
  String get investFirstSteps_brokerBody =>
      'تنظیم شوي، نامتو ادارو ته وګورئ. د حساب پرانیستلو دمخه فیسونه، محصولات او اعتبار پرتله کړئ.';

  @override
  String get investFirstSteps_openAccountTitle => 'خپل حساب خلاص کړئ';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'ډیجیټل آن بورډینګ. په برازیل کې، تاسو عموما CPF/RG ته اړتیا لرئ او ځینې وختونه د پتې ثبوت ته اړتیا لرئ.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'ډیجیټل آن بورډینګ د هیواد له مخې توپیر لري. معمولا تاسو د شناخت سند او د هویت / پته تصدیق ته اړتیا لرئ.';

  @override
  String get investFirstSteps_transferTitle => 'د پیسو لیږد';

  @override
  String get investFirstSteps_transferBodyBr =>
      'د PIX یا بانکي لیږد له لارې خپل بروکر ته پیسې واستوئ. توازن د پانګې اچونې لپاره شتون لري.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'د بانک لیږد یا محلي تادیاتو میتودونو له لارې فنډونه لیږدول (ستاسو په هیواد پورې اړه لري). توازن د پانګې اچونې لپاره شتون لري.';

  @override
  String get investFirstSteps_riskProfileTitle => 'ستاسو د خطر پروفایل پیژني';

  @override
  String get investFirstSteps_riskProfileBody =>
      'یو مناسب پوښتنلیک ته ځواب ورکړئ. پوه شئ چې آیا تاسو محافظه کار، اعتدال، یا تیریدونکي یاست.';

  @override
  String get investFirstSteps_firstAssetTitle => 'خپله لومړۍ شتمني واخلئ';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'د بیړني فنډ سره پیل کړئ (Tesouro Selic یا د ورځني مایعاتو CDB). بیا په تدریجي ډول تنوع کړئ.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'د بیړني فنډ سره پیل کړئ (د لوړ حاصل نغدي پیسې، د پیسو بازار فنډونه، یا لنډ مهاله خزانې بانډونه). بیا په تدریجي ډول تنوع کړئ.';

  @override
  String get investFirstSteps_tipTitle => 'لارښود لارښوونه:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'کوچنی پیل کړئ، په دوامداره توګه پانګه اچونه وکړئ، او د بازار د وخت هڅه کولو څخه ډډه وکړئ. وخت ستاسو غوره ملګری دی.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'کوچنی پیل کړئ، په دوامداره توګه پانګه اچونه وکړئ، او د بازار د وخت هڅه کولو څخه ډډه وکړئ. وخت ستاسو غوره ملګری دی.';

  @override
  String get investMenu_tesouroTitle => 'د برازیل خزانې';

  @override
  String get investMenu_cdbTitle => 'بانک ثابت عاید (CDB)';

  @override
  String get investMenu_etfsTitle => 'نړیوال ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (انډیکس)';

  @override
  String get investMenu_stocksTitle => 'ذخیره';

  @override
  String get investMenu_fundsTitle => 'فنډونه';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'نړیوال';

  @override
  String get investMenu_cryptoTitle => 'کریپټو';

  @override
  String get investRegisterCta => 'پانګه اچونه راجستر کړئ';

  @override
  String investRegionHintBr(String country) {
    return 'اغیزمن هیواد: $country · د برازیل کتلاګ (خزانې، CDB، LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'اغیزمن هیواد: $country · نړیوال کتلاګ (ETFs, NYSE/NASDAQ…). ستاسو د وسیلې سیمې څخه په اوتومات ډول تنظیم شوی.';
  }

  @override
  String get strategy_sectionCoreTitle => 'اړین ستراتیژیانې';

  @override
  String get strategy_sectionDeepDiveTitle => 'ژور ډوب (پریمیم)';

  @override
  String get strategy_emergencyFundTitle => 'بیړني فنډ';

  @override
  String get strategy_emergencyFundBodyBr =>
      'ستاسو مالي ډال. د 6-12 میاشتو لګښتونه پوښئ. ورځني مایعیت او ټیټ خطر ته لومړیتوب ورکړئ (د مثال په توګه، Tesouro Selic یا CDI پورې تړلی CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'ستاسو مالي ډال. د 6-12 میاشتو لګښتونه پوښئ. ورځني مایعیت او ټیټ خطر ته لومړیتوب ورکړئ (د بیلګې په توګه د پیسو بازار فنډونه او لنډمهاله خزانې بانډونه).';

  @override
  String get strategy_buyHoldTitle => 'پیرود او ساتل';

  @override
  String get strategy_buyHoldBody =>
      'کیفیت لرونکي شتمنۍ واخلئ او د اوږدې مودې لپاره وساتئ. د وخت په تیریدو سره په ډسپلین، کیفیت او بیا پانګې باندې تمرکز وکړئ.';

  @override
  String get strategy_diversificationTitle => 'تنوع';

  @override
  String get strategy_diversificationBodyBr =>
      'خپل پانګه په ثابت عاید، سټاک، FIIs او نړیوالو شتمنیو کې خپره کړئ ترڅو خطر کم کړي او د خطر سره سم تعدیل شوي بیرته راستانه شي.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'خپله سرمایه په بانډونو، سټاکونو، REITs، او نړیوال افشا کولو کې خپره کړئ ترڅو خطر کم کړي او د خطر سره سم بیرته راستنیدو ته وده ورکړي.';

  @override
  String get strategy_dcaTitle => 'ډالر لګښت اوسط (DCA)';

  @override
  String get strategy_dcaBody =>
      'تسلسل د هوښیارۍ ماتوي. هره میاشت پانګه اچونه اکثرا د بشپړ ننوتلو نقطې غوره کولو هڅه کولو په پرتله خورا مؤثره ده.';

  @override
  String get strategy_smartGoalsTitle => 'سمارټ اهداف';

  @override
  String get strategy_smartGoalsBody =>
      'ستاسو اهداف باید مشخص، د اندازه کولو وړ، د لاسته راوړلو وړ، اړونده، او د وخت محدود وي.';

  @override
  String get strategy_503020Title => '50-30-20 قاعده';

  @override
  String get strategy_503020Body =>
      'د بودیجې ساده چوکاټ: 50٪ اړتیاوې، 30٪ غواړي، 20٪ پانګه اچونه او اهداف.';

  @override
  String get strategy_deepDive_allocationTitle => 'د شتمنیو تخصیص (پرمختللی)';

  @override
  String get strategy_deepDive_allocationBody =>
      'زده کړئ چې څنګه د هدف او افق له مخې تخصیص رامینځته کړئ ، د خطر تنظیم کول ، ارتباط ، او بیا توازن کول.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'نړیوال ETFs او شاخصونه (پرمختللي)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'د نړیوالو شاخصونو (د مثال په توګه، S&P 500)، ETFs، او د ډسپلین سره د نړیوالو افشا کولو څرنګوالي په اړه زده کړه وکړئ.';

  @override
  String get strategy_deepDive_taxesTitle => 'مالیه او راپور ورکول (پرمختللی)';

  @override
  String get strategy_deepDive_taxesBody =>
      'د اصلي مالیاتو مفاهیمو او د پانګې اچونې په خوندي ډول راپور ورکولو لپاره د ریکارډونو ساتلو څرنګوالی پوهیږئ.';

  @override
  String get strategy_premiumLockedBody =>
      'پریمیم مینځپانګه. د پانګې اچونې ژور ډوب خلاصولو لپاره د سایبر / ګریم / هایو موضوع فعاله کړئ.';

  @override
  String get homeShowcaseTitle => 'شوکیس';

  @override
  String get homeShowcaseProfileSimTitle => 'د خطر پروفایل کوئز';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'په څو دقیقو کې د خپل پانګه اچوونکي پروفایل ومومئ.';

  @override
  String get homeShowcaseStrategiesTitle => 'وړاندیز شوي ستراتیژۍ';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'د ستراتیژیو زده کولو او پلي کولو لپاره مستقیم لنډ لنډیز.';

  @override
  String get homeShowcaseMentorHubTitle => 'لارښود: پوښتنې او ستراتیژیانې';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'د خطر پروفایل پوښتنې او وړاندیز شوي ستراتیژیو ته ګړندي لاسرسی.';

  @override
  String get homeTourStepClassicTitle => 'کلاسیک حالت';

  @override
  String get homeTourStepClassicBody =>
      'د اصلي ایپ پینل خلاصوي: په پیژندل شوي ترتیب کې لیږدونه، اهداف، پانګه اچونه او ترتیبات.';

  @override
  String get homeTourStepVitrineTitle => 'د نندارې ساحه';

  @override
  String get homeTourStepVitrineBody =>
      'د زده کړې او تمرین لپاره لنډ لنډیز: د پانګوالو پروفایل، ستراتیژیانې او د لارښود مرکز.';

  @override
  String get homeTourStepProfileTitle => 'پروفایل پوښتنه';

  @override
  String get homeTourStepProfileBody =>
      'د خپل خطر پروفایل موندلو لپاره پوښتنلیک ته ځواب ووایاست او ترتیب شوي وړاندیزونه وګورئ.';

  @override
  String get homeTourStepStrategiesTitle => 'ستراتیژۍ';

  @override
  String get homeTourStepStrategiesBody =>
      'د مالیاتو تنظیم کولو لپاره مینځپانګه ، د ډسپلین سره پانګه اچونه او د عام زیانونو څخه مخنیوی.';

  @override
  String get homeTourStepHubTitle => 'د لارښود مرکز';

  @override
  String get homeTourStepHubBody =>
      'د پروفایل پوښتنې او وړاندیز شوي ستراتیژیو ته چټک مینو.';

  @override
  String get homeTourStepPremiumTitle => 'پریمیم ځانګړتیاوې';

  @override
  String get homeTourStepPremiumBody =>
      'آټو لارښود، پرمختللي چارټونه او میاشتني راپورونه - د پریمیم ګډون سره شتون لري.';

  @override
  String get homeTourStepMarketTitle => 'مارکیټ سنیپ شاټ';

  @override
  String get homeTourStepMarketBody =>
      'د بازار شرایط (برازیل یا نړیوال) ستاسو د سیمې او بدل شوي خالص ارزښت پراساس.';

  @override
  String get homeTourStepCalculatorTitle => 'د لارښود محاسب';

  @override
  String get homeTourStepCalculatorBody =>
      'مرکب سود، انفلاسیون سم کړئ او د شتمنۍ چارټ وګورئ؛ بیا موږ دا وسیله پرانیزو.';

  @override
  String get quizProfile_title => 'د خطر پروفایل کوئز';

  @override
  String quizProfile_progress(int current, int total) {
    return 'پوښتنه $current د $total';
  }

  @override
  String get quizProfile_badge => 'د خطر پروفایل کوئز';

  @override
  String get quizProfile_resultTitle => 'ستاسو پروفایل دی';

  @override
  String get quizProfile_idealInvestmentsTitle => 'مثالی پانګه اچونه:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'پانګونه وپلټئ';

  @override
  String get quizProfile_exit => 'وتل';

  @override
  String get quizKnowledge_title => 'د پوهې پوښتنه';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'پوښتنه $current د $total';
  }
}

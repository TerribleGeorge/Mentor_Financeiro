// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'مشاور مالی\nهشدار هزینه';

  @override
  String get saldo => 'موجودی';

  @override
  String get gastosDiarios => 'هزینه های روزانه';

  @override
  String get confirmarTransacao => 'تراکنش را تایید کنید\nبیانیه';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'نقل و انتقالات\nسرمایه گذاری';

  @override
  String get investimentos => 'تنظیمات';

  @override
  String get configuracoes => 'پروفایل';

  @override
  String get perfil => '';

  @override
  String get sair => 'خروج';

  @override
  String get entrar => 'ورود';

  @override
  String get cadastrar => 'ثبت نام';

  @override
  String get email => 'رمز عبور';

  @override
  String get senha => '';

  @override
  String get nome => 'نام';

  @override
  String get cpf => 'شماره شناسه\nتلفن';

  @override
  String get telefone => '';

  @override
  String get continuar => 'ادامه دهید';

  @override
  String get voltar => 'پشت';

  @override
  String get cancelar => 'لغو';

  @override
  String get salvar => 'ذخیره';

  @override
  String get editar => 'ویرایش';

  @override
  String get excluir => 'حذف';

  @override
  String get sucesso => 'موفقیت\nخطای';

  @override
  String get erro => '';

  @override
  String get carregando => 'در حال بارگذاری...';

  @override
  String get semDados => 'داده ای وجود ندارد';

  @override
  String get tentarNovamente => 'دوباره امتحان کنید\nگزارش های';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'هزینه ها بر اساس دسته';

  @override
  String get ultimosSeteDias => '7 روز گذشته';

  @override
  String get totalGasto => 'کل خرج شده\nمعاملات';

  @override
  String get transacoes => 'دسته بندی';

  @override
  String get categoria => '';

  @override
  String get data => 'تاریخ\nمقدار';

  @override
  String get valor => '';

  @override
  String get descricao => 'توضیحات';

  @override
  String get alimentacao => 'غذا';

  @override
  String get transporte => 'حمل و نقل';

  @override
  String get lazer => 'اوقات فراغت';

  @override
  String get saude => 'سلامت';

  @override
  String get outros => 'دیگران\nاطلاعیه های';

  @override
  String get notificacoes => 'مجوز اعلان';

  @override
  String get permissaoNotificacoes => '';

  @override
  String get ativarMonitoramento => 'نظارت بر هزینه را فعال کنید';

  @override
  String get descricaoMonitoramento =>
      'به برنامه اجازه دهید به طور خودکار تراکنش های بانکی شما را برای سازماندهی امور مالی شما نظارت کند.\nزبان';

  @override
  String get idioma => 'ارز';

  @override
  String get moeda => '';

  @override
  String get compararInvestimentos => 'مقایسه سرمایه گذاری';

  @override
  String get descricaoLocalizacao =>
      'برای مقایسه سرمایه گذاری های محلی (CDB/CDI) با نرخ های بین المللی، به موقعیت مکانی شما نیاز داریم.';

  @override
  String get permissaoLocalizacaoNecessaria => 'مجوز مکان مورد نیاز است';

  @override
  String get rendaFixa => 'درآمد ثابت';

  @override
  String get rendaVariavel => 'درآمد متغیر';

  @override
  String get tesouroDireto => 'خزانه داری مستقیم';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA\nسهام';

  @override
  String get acoes => '';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'ارزهای دیجیتال';

  @override
  String get rendimento => 'بازگشت\nسودآوری';

  @override
  String get rentabilidade => '';

  @override
  String get aplicar => 'درخواست کنید';

  @override
  String get resgatar => 'بازخرید';

  @override
  String get simular => 'شبیه سازی';

  @override
  String get metas => 'اهداف';

  @override
  String get estrategias => '';

  @override
  String get conhecimento => 'دانش';

  @override
  String get chat => 'چت';

  @override
  String get enviarMensagem => 'ارسال پیام';

  @override
  String get digiteMensagem => 'یک پیام تایپ کنید...';

  @override
  String get alertaGastos => '';

  @override
  String alertaGastosMsg(int percent) {
    return 'شما قبلاً از $percent٪ از حد اعتبار خود استفاده کرده‌اید.\nبسته شدن فاکتور';
  }

  @override
  String get fechamentoFatura => '';

  @override
  String get fechamentoFaturaMsg =>
      'فردا روز تعطیل است. زمان عالی برای بررسی هزینه ها\nسررسید فاکتور';

  @override
  String get faturaVencendo => '';

  @override
  String faturaVencendoMsg(int dias) {
    return 'صورتحساب سررسید $dias روز(های) است. تعادل خود را بررسی کنید.';
  }

  @override
  String get regra30 => 'نکته: قانون 30٪';

  @override
  String get regra30Msg =>
      'برای بهبود امتیاز اعتباری خود، استفاده را زیر 30 درصد نگه دارید.';

  @override
  String get diaDeOuro => 'روز طلایی!';

  @override
  String get diaDeOuroMsg => 'خریدهای امروز شما فقط 40 روز دیگر پرداخت می شود!';

  @override
  String get alertaJuros => 'هشدار: علاقه';

  @override
  String get alertaJurosMsg =>
      'موجودی شما قبض را پوشش نمی دهد. از اعتبار گردان خودداری کنید!';

  @override
  String get notaSaude => 'سلامت مالی';

  @override
  String get notaExcelente => 'عالی! شما سلامت مالی خوبی دارید.';

  @override
  String get notaBom => 'خوب است، اما می تواند بهبود یابد.';

  @override
  String get notaAtencao => 'توجه به خرج کردن.';

  @override
  String get notaRevisar => 'امور مالی خود را بررسی کنید.';

  @override
  String get mentorInsightTitle => 'راهنمایی مربی';

  @override
  String get mentorInsightLoading => 'واکشی داده های بازار…';

  @override
  String get mentorInsightError =>
      'در حال حاضر نمی توان داده ها را بارگیری کرد. به زودی دوباره امتحان کنید.';

  @override
  String get mentorInsightOffline =>
      'شما آفلاین هستید. برای واکشی نقل قول ها و دیدگاه های مربی وصل شوید.';

  @override
  String get mentorAllocationDefensive =>
      'با توجه به نوسانات فعلی، حفظ سرمایه و نقدینگی را قبل از تعقیب بازده در اولویت قرار دهید.';

  @override
  String get mentorAllocationBalanced =>
      'حفظ تعادل و رشد: افق هدف خود را متنوع کرده و دوباره مرور کنید.';

  @override
  String get mentorAllocationOffensive =>
      'نمایه شما ریسک بیشتری را امکان پذیر می کند: منظم بمانید و از تمرکز زیاد خودداری کنید.\nنمادهای';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'بررسی شده: $symbols';
  }

  @override
  String get currencyFollowLocale => 'خودکار (زبان)\nماشین حساب مربی';

  @override
  String get compoundCalculatorTitle => 'بهره مرکب';

  @override
  String get compoundCalculatorSubtitle =>
      'مشارکت ها، سود اسمی در مقابل واقعی (پس از تورم) و یادداشت های مربی را شبیه سازی کنید.';

  @override
  String get compoundInitialLabel => 'مبلغ یکجا اولیه';

  @override
  String get compoundMonthlyLabel => 'کمک ماهانه';

  @override
  String get compoundRateLabel => 'نرخ بهره';

  @override
  String get compoundRateAnnual => 'در سال';

  @override
  String get compoundRateMonthly => 'در ماه';

  @override
  String get compoundHorizonLabel => 'افق زمانی';

  @override
  String get compoundHorizonYears => 'سال';

  @override
  String get compoundHorizonMonths => 'ماه';

  @override
  String get compoundInflationLabel => 'تورم تخمینی (٪ در سال)';

  @override
  String get compoundCalculate => 'محاسبه کنید';

  @override
  String get compoundChartInvested => 'کل سرمایه گذاری شده است';

  @override
  String get compoundChartInterest => 'سود کسب شده';

  @override
  String get compoundSummaryNominalEnd => 'موجودی پایانی (اسمی)';

  @override
  String get compoundSummaryRealGain => 'سود واقعی (قدرت خرید)';

  @override
  String get compoundMentorCardTitle => 'مشاوره مربی';

  @override
  String get compoundInvalidInput => 'مقادیر معتبر (افق > 0) را وارد کنید.';

  @override
  String get userPersonaSectionTitle => 'تن مربی';

  @override
  String get userPersonaNovice => 'مبتدی';

  @override
  String get userPersonaStrategist => 'استراتژیست';

  @override
  String get userPersonaRiskTaker => 'ریسک پذیر';

  @override
  String get userPersonaConservative => 'بهینه ساز';

  @override
  String get compoundOpenFullInsight => 'بینش کامل مربی را باز کنید';

  @override
  String get investFirstSteps_title => 'مراحل اول';

  @override
  String get investFirstSteps_brokerTitle => 'یک کارگزار انتخاب کنید';

  @override
  String get investFirstSteps_brokerBody =>
      'به دنبال موسسات قانونی و معتبر باشید. قبل از افتتاح حساب، کارمزدها، محصولات و قابلیت اطمینان را مقایسه کنید.';

  @override
  String get investFirstSteps_openAccountTitle => 'حساب خود را باز کنید';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'نصب دیجیتال. در برزیل، شما معمولاً به CPF/RG و گاهی اوقات مدرک نشانی نیاز دارید.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'بسته به کشور متفاوت است. معمولاً به یک مدرک شناسایی و تأیید هویت/آدرس نیاز دارید.';

  @override
  String get investFirstSteps_transferTitle => 'انتقال وجه';

  @override
  String get investFirstSteps_transferBodyBr =>
      'پول را از طریق PIX یا حواله بانکی به کارگزار خود ارسال کنید. موجودی برای سرمایه گذاری در دسترس می شود.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'وجوه را از طریق حواله بانکی یا روش های پرداخت محلی (بستگی به کشور شما دارد) انتقال دهید. موجودی برای سرمایه گذاری در دسترس می شود.';

  @override
  String get investFirstSteps_riskProfileTitle => 'مشخصات ریسک خود را بشناسید';

  @override
  String get investFirstSteps_riskProfileBody =>
      'به پرسشنامه شایستگی پاسخ دهید. بدانید که آیا محافظه کار هستید، میانه رو یا تهاجمی.';

  @override
  String get investFirstSteps_firstAssetTitle => 'اولین دارایی خود را بخرید';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'با یک صندوق اضطراری (Tesouro Selic یا CDB نقدینگی روزانه) شروع کنید. سپس به تدریج تنوع دهید.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'با یک صندوق اضطراری (نقد با بازده بالا، وجوه بازار پول، یا اوراق خزانه کوتاه مدت) شروع کنید. سپس به تدریج تنوع دهید.\nنکته مربی';

  @override
  String get investFirstSteps_tipTitle => ':';

  @override
  String get investFirstSteps_tipBodyBr =>
      'کوچک شروع کنید، به طور مداوم سرمایه گذاری کنید و از تلاش برای زمان بندی بازار خودداری کنید. زمان بهترین متحد شماست.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'کوچک شروع کنید، به طور مداوم سرمایه گذاری کنید و از تلاش برای زمان بندی بازار خودداری کنید. زمان بهترین متحد شماست.';

  @override
  String get investMenu_tesouroTitle => 'خزانه داری برزیل';

  @override
  String get investMenu_cdbTitle => 'بانک درآمد ثابت (CDB)\nETF های بین المللی';

  @override
  String get investMenu_etfsTitle => '';

  @override
  String get investMenu_sp500Title => 'S&P 500 (شاخص)\nسهام';

  @override
  String get investMenu_stocksTitle => 'وجوه';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'بین المللی\nرمزگذاری';

  @override
  String get investMenu_cryptoTitle => '';

  @override
  String get investRegisterCta => 'ثبت سرمایه گذاری';

  @override
  String investRegionHintBr(String country) {
    return 'کشور مؤثر: $country · کاتالوگ برزیل (خزانه‌ها، CDB، LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'کشور مؤثر: $country · فهرست جهانی (ETFs، NYSE/NASDAQ…). به طور خودکار از منطقه دستگاه شما تنظیم می شود.';
  }

  @override
  String get strategy_sectionCoreTitle => 'استراتژی های ضروری';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'صندوق اضطراری';

  @override
  String get strategy_emergencyFundBodyBr =>
      'سپر مالی شما. پوشش هزینه های 6 تا 12 ماهه نقدینگی روزانه و ریسک پایین (به عنوان مثال، Tesouro Selic یا CDB مرتبط با CDI) را در اولویت قرار دهید.';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'سپر مالی شما. پوشش هزینه های 6 تا 12 ماهه نقدینگی روزانه و ریسک کم (مانند وجوه بازار پول و اوراق قرضه خزانه کوتاه مدت) را در اولویت قرار دهید.';

  @override
  String get strategy_buyHoldTitle => 'خرید و نگه دارید';

  @override
  String get strategy_buyHoldBody =>
      'دارایی های با کیفیت را بخرید و برای بلند مدت نگه دارید. روی نظم، کیفیت و سرمایه گذاری مجدد در طول زمان تمرکز کنید.';

  @override
  String get strategy_diversificationTitle => 'تنوع';

  @override
  String get strategy_diversificationBodyBr =>
      'سرمایه خود را در بین درآمد ثابت، سهام، FII و دارایی های بین المللی برای کاهش ریسک و بهبود بازدهی تعدیل شده بر اساس ریسک پخش کنید.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'سرمایه خود را در اوراق قرضه، سهام، REIT و قرار گرفتن در معرض بین المللی برای کاهش ریسک و بهبود بازدهی تعدیل شده بر اساس ریسک پخش کنید.';

  @override
  String get strategy_dcaTitle => 'میانگین هزینه دلار (DCA)';

  @override
  String get strategy_dcaBody =>
      'سازگاری نبوغ را شکست می دهد. سرمایه گذاری هر ماه اغلب موثرتر از تلاش برای انتخاب نقطه ورود عالی است.\nاهداف';

  @override
  String get strategy_smartGoalsTitle => 'SMART';

  @override
  String get strategy_smartGoalsBody =>
      'اهداف شما باید مشخص، قابل اندازه گیری، قابل دستیابی، مرتبط و محدود به زمان باشد.\nقانون';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'یک چارچوب بودجه بندی ساده: 50% نیازها، 30% خواسته ها، 20% سرمایه گذاری و اهداف.';

  @override
  String get strategy_deepDive_allocationTitle => 'تخصیص دارایی (پیشرفته)';

  @override
  String get strategy_deepDive_allocationBody =>
      'نحوه ایجاد تخصیص بر اساس هدف و افق، تنظیم ریسک، همبستگی و تعادل مجدد را بیاموزید.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETF ها و شاخص های جهانی (پیشرفته)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'در مورد شاخص های جهانی (مانند S&P 500)، ETF ها، و نحوه ایجاد نمایشگاه بین المللی با نظم و انضباط بیاموزید.';

  @override
  String get strategy_deepDive_taxesTitle => 'مالیات و گزارش (پیشرفته)';

  @override
  String get strategy_deepDive_taxesBody =>
      'مفاهیم اصلی مالیات و نحوه نگهداری سوابق برای گزارش ایمن سرمایه گذاری را درک کنید.';

  @override
  String get strategy_premiumLockedBody =>
      'محتوای ممتاز. یک تم Cyber/Grimm/Hive را فعال کنید تا قفل سرمایه گذاری Deep Dive را باز کنید.\nویترین';

  @override
  String get homeShowcaseTitle => 'آزمون مشخصات ریسک';

  @override
  String get homeShowcaseProfileSimTitle => '';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'پروفایل سرمایه گذار خود را در چند دقیقه بیابید.';

  @override
  String get homeShowcaseStrategiesTitle => 'استراتژی های توصیه شده';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'میانبرهای مستقیم برای یادگیری و اعمال استراتژی ها.';

  @override
  String get homeShowcaseMentorHubTitle => 'مربی: آزمون ها و استراتژی ها';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'دسترسی سریع به آزمون مشخصات ریسک و استراتژی های توصیه شده.';

  @override
  String get homeTourStepClassicTitle => 'حالت کلاسیک';

  @override
  String get homeTourStepClassicBody =>
      'پنل اصلی برنامه را باز می کند: تراکنش ها، اهداف، سرمایه گذاری ها و تنظیمات در طرح آشنا.';

  @override
  String get homeTourStepVitrineTitle => 'منطقه ویترین';

  @override
  String get homeTourStepVitrineBody =>
      'میانبرهایی برای یادگیری و تمرین: نمایه سرمایه گذار، استراتژی ها و مرکز مربی.\nآزمون مشخصات';

  @override
  String get homeTourStepProfileTitle => '';

  @override
  String get homeTourStepProfileBody =>
      'به پرسشنامه پاسخ دهید تا نمایه ریسک خود را کشف کنید و پیشنهادات هم تراز را ببینید.\nاستراتژی های';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'محتوایی برای سازماندهی امور مالی، سرمایه گذاری با نظم و اجتناب از دام های رایج.\nمرکز مربی';

  @override
  String get homeTourStepHubTitle => '';

  @override
  String get homeTourStepHubBody =>
      'منوی سریع به مسابقه پروفایل و استراتژی های توصیه شده.\nویژگی های';

  @override
  String get homeTourStepPremiumTitle => 'Premium';

  @override
  String get homeTourStepPremiumBody =>
      'راهنمایی خودکار، نمودارهای پیشرفته و گزارش‌های ماهانه — با اشتراک Premium در دسترس است.\nعکس فوری از بازار';

  @override
  String get homeTourStepMarketTitle => 'زمینه بازار';

  @override
  String get homeTourStepMarketBody =>
      '(برزیل یا جهانی) بر اساس منطقه شما به اضافه ارزش خالص تبدیل شده.\nماشین حساب مربی';

  @override
  String get homeTourStepCalculatorTitle => '';

  @override
  String get homeTourStepCalculatorBody =>
      'بهره مرکب، تورم را شبیه سازی کنید و نمودار ثروت را ببینید. در ادامه این ابزار را باز می کنیم.\nآزمون مشخصات ریسک';

  @override
  String get quizProfile_title => '';

  @override
  String quizProfile_progress(int current, int total) {
    return 'سوال $current از $total';
  }

  @override
  String get quizProfile_badge => 'RISK PROFILE QUIZ';

  @override
  String get quizProfile_resultTitle => 'نمایه شماست';

  @override
  String get quizProfile_idealInvestmentsTitle => 'سرمایه گذاری های ایده آل:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'کاوش سرمایه گذاری';

  @override
  String get quizProfile_exit => 'خروج\nمسابقه دانش';

  @override
  String get quizKnowledge_title => '';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'سوال $current از $total';
  }
}

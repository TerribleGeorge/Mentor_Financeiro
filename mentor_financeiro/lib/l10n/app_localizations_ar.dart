// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مينتور المالية';

  @override
  String get saldo => '';

  @override
  String get gastosDiarios => 'النفقات اليومية';

  @override
  String get confirmarTransacao => 'تأكيد المعاملة\nبيان';

  @override
  String get extrato => 'تحويلات';

  @override
  String get transferencias => 'استثمارات';

  @override
  String get investimentos => 'إعدادات';

  @override
  String get configuracoes => 'الملف الشخصي';

  @override
  String get perfil => 'تسجيل الخروج';

  @override
  String get sair => 'تسجيل الدخول';

  @override
  String get entrar => 'تسجيل';

  @override
  String get cadastrar => '';

  @override
  String get email => 'البريد الإلكتروني\nكلمة المرور';

  @override
  String get senha => 'الاسم';

  @override
  String get nome => 'رقم معرف';

  @override
  String get cpf => 'هاتف';

  @override
  String get telefone => 'متابعة';

  @override
  String get continuar => '';

  @override
  String get voltar => 'العودة';

  @override
  String get cancelar => 'إلغاء\nحفظ';

  @override
  String get salvar => 'تحرير';

  @override
  String get editar => 'حذف';

  @override
  String get excluir => 'نجاح';

  @override
  String get sucesso => 'خطأ';

  @override
  String get erro => 'جاري التحميل';

  @override
  String get carregando => '...';

  @override
  String get semDados => 'لا توجد بيانات';

  @override
  String get tentarNovamente => 'حاول مرة أخرى\nتقارير';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'النفقات حسب الفئة';

  @override
  String get ultimosSeteDias => 'آخر 7 أيام';

  @override
  String get totalGasto => 'إجمالي الإنفاق\nالمعاملات';

  @override
  String get transacoes => 'فئة';

  @override
  String get categoria => 'تاريخ';

  @override
  String get data => 'قيمة';

  @override
  String get valor => 'وصف';

  @override
  String get descricao => '';

  @override
  String get alimentacao => 'الغذاء\nالنقل';

  @override
  String get transporte => '';

  @override
  String get lazer => 'الترفيه';

  @override
  String get saude => 'الصحة';

  @override
  String get outros => 'أخرى\nإخطارات';

  @override
  String get notificacoes => 'إذن الإخطار';

  @override
  String get permissaoNotificacoes => '';

  @override
  String get ativarMonitoramento => 'تمكين مراقبة النفقات';

  @override
  String get descricaoMonitoramento =>
      'اسمح للتطبيق بمراقبة معاملاتك المصرفية تلقائيًا لتنظيم أموالك.\nلغة';

  @override
  String get idioma => 'العملة';

  @override
  String get moeda => '';

  @override
  String get compararInvestimentos => 'مقارنة الاستثمارات';

  @override
  String get descricaoLocalizacao =>
      'لمقارنة الاستثمارات المحلية (CDB/CDI) مع الأسعار الدولية، نحتاج إلى موقعك.';

  @override
  String get permissaoLocalizacaoNecessaria => 'مطلوب إذن الموقع';

  @override
  String get rendaFixa => 'الدخل الثابت';

  @override
  String get rendaVariavel => 'الدخل المتغير';

  @override
  String get tesouroDireto => 'الخزانة المباشرة';

  @override
  String get cdb => 'بنك التنمية الصيني';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA\nالأسهم';

  @override
  String get acoes => '';

  @override
  String get fiis => 'أقسام الصناعات السمكية';

  @override
  String get criptomoedas => 'العملات المشفرة\nعودة';

  @override
  String get rendimento => 'الربحية';

  @override
  String get rentabilidade => 'تطبيق';

  @override
  String get aplicar => 'استرداد';

  @override
  String get resgatar => 'محاكاة';

  @override
  String get simular => '';

  @override
  String get metas => 'الأهداف';

  @override
  String get estrategias => 'المعرفة';

  @override
  String get conhecimento => 'دردشة';

  @override
  String get chat => '';

  @override
  String get enviarMensagem => 'أرسل الرسالة';

  @override
  String get digiteMensagem => 'اكتب رسالة...\nنصيحة';

  @override
  String get alertaGastos => 'تنبيه الإنفاق';

  @override
  String alertaGastosMsg(int percent) {
    return 'لقد استخدمت بالفعل $percent% من الحد الائتماني الخاص بك.\nإغلاق الفاتورة';
  }

  @override
  String get fechamentoFatura => '';

  @override
  String get fechamentoFaturaMsg =>
      'غدا هو يوم الإغلاق. وقت رائع لمراجعة النفقات.';

  @override
  String get faturaVencendo => 'الفاتورة مستحقة\nفاتورة';

  @override
  String faturaVencendoMsg(int dias) {
    return 'مستحقة خلال $dias يوم (أيام). تحقق من رصيدك.\nرصيد';
  }

  @override
  String get regra30 => ': قاعدة 30%';

  @override
  String get regra30Msg =>
      'حافظ على الاستخدام أقل من 30% لتحسين نقاط الائتمان الخاصة بك.';

  @override
  String get diaDeOuro => 'اليوم الذهبي!';

  @override
  String get diaDeOuroMsg =>
      'سيتم دفع مشترياتك اليوم خلال 40 يومًا فقط!\nتحذير';

  @override
  String get alertaJuros => ': الفائدة';

  @override
  String get alertaJurosMsg => 'رصيدك لا يغطي الفاتورة. تجنب الائتمان الدوار!';

  @override
  String get notaSaude => 'الصحة المالية';

  @override
  String get notaExcelente => 'ممتاز! لديك صحة مالية كبيرة.';

  @override
  String get notaBom => 'جيد، ولكن يمكن أن يتحسن.';

  @override
  String get notaAtencao => 'الاهتمام بالإنفاق.';

  @override
  String get notaRevisar => 'قم بمراجعة أموالك.';

  @override
  String get mentorInsightTitle => 'توجيهات المرشد';

  @override
  String get mentorInsightLoading => 'جارٍ جلب بيانات السوق...';

  @override
  String get mentorInsightError =>
      'تعذر تحميل البيانات الآن. حاول مرة أخرى قريبا.';

  @override
  String get mentorInsightOffline =>
      'أنت غير متصل بالإنترنت. اتصل لجلب عروض الأسعار ورؤى المرشد.';

  @override
  String get mentorAllocationDefensive =>
      'نظرًا للتقلبات الحالية، قم بإعطاء الأولوية للحفاظ على رأس المال والسيولة قبل مطاردة العائدات.';

  @override
  String get mentorAllocationBalanced =>
      'توازن الحماية والنمو: قم بتنويع وإعادة النظر في أفق هدفك.';

  @override
  String get mentorAllocationOffensive =>
      'ملفك الشخصي يسمح بمزيد من المخاطر: كن منضبطًا وتجنب التركيز الشديد.\nتمت مراجعة الرموز';

  @override
  String mentorInsightSymbols(String symbols) {
    return ': $symbols';
  }

  @override
  String get currencyFollowLocale => 'تلقائي (لغة)';

  @override
  String get compoundCalculatorTitle => 'حاسبة مينتور — الفائدة المركبة';

  @override
  String get compoundCalculatorSubtitle =>
      'محاكاة المساهمات، والمكاسب الاسمية مقابل الحقيقية (بعد التضخم)، وملاحظات المرشد.';

  @override
  String get compoundInitialLabel => 'المبلغ المقطوع الأولي';

  @override
  String get compoundMonthlyLabel => 'المساهمة الشهرية';

  @override
  String get compoundRateLabel => 'سعر الفائدة';

  @override
  String get compoundRateAnnual => 'سنويا';

  @override
  String get compoundRateMonthly => 'شهريا';

  @override
  String get compoundHorizonLabel => 'الأفق الزمني';

  @override
  String get compoundHorizonYears => 'سنوات';

  @override
  String get compoundHorizonMonths => 'أشهر';

  @override
  String get compoundInflationLabel => 'التضخم المقدر (٪ سنويا)';

  @override
  String get compoundCalculate => 'احسب';

  @override
  String get compoundChartInvested => 'إجمالي الاستثمار';

  @override
  String get compoundChartInterest => 'الفائدة المكتسبة';

  @override
  String get compoundSummaryNominalEnd => 'الرصيد النهائي (الاسمي)';

  @override
  String get compoundSummaryRealGain => 'مكسب حقيقي (القدرة الشرائية)';

  @override
  String get compoundMentorCardTitle => 'نصيحة المرشد';

  @override
  String get compoundInvalidInput => 'أدخل قيمًا صالحة (الأفق > 0).';

  @override
  String get userPersonaSectionTitle => 'لهجة معلمه';

  @override
  String get userPersonaNovice => 'مبتدئ';

  @override
  String get userPersonaStrategist => 'الاستراتيجي';

  @override
  String get userPersonaRiskTaker => 'مجازف';

  @override
  String get userPersonaConservative => 'التوقف';

  @override
  String get compoundOpenFullInsight => 'فتح البصيرة الكاملة للمرشد';

  @override
  String get investFirstSteps_title => 'الخطوات الأولى';

  @override
  String get investFirstSteps_brokerTitle => 'اختر وسيطًا';

  @override
  String get investFirstSteps_brokerBody =>
      'ابحث عن المؤسسات المنظمة وذات السمعة الطيبة. قارن الرسوم والمنتجات والموثوقية قبل فتح الحساب.';

  @override
  String get investFirstSteps_openAccountTitle => 'افتح حسابك';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'الإعداد الرقمي. في البرازيل، تحتاج عادةً إلى CPF/RG وأحيانًا إثبات العنوان.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'يختلف الإعداد الرقمي حسب البلد. عادةً ما تحتاج إلى مستند هوية والتحقق من الهوية/العنوان.';

  @override
  String get investFirstSteps_transferTitle => 'تحويل الأموال';

  @override
  String get investFirstSteps_transferBodyBr =>
      'أرسل الأموال عبر PIX أو التحويل البنكي إلى الوسيط الخاص بك. ويصبح الرصيد متاحا للاستثمار.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'قم بتحويل الأموال عبر التحويل البنكي أو طرق الدفع المحلية (حسب بلدك). ويصبح الرصيد متاحا للاستثمار.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'تعرف على ملف تعريف المخاطر الخاص بك';

  @override
  String get investFirstSteps_riskProfileBody =>
      'أجب عن استبيان الملاءمة. افهم ما إذا كنت محافظًا أم معتدلاً أم عدوانيًا.';

  @override
  String get investFirstSteps_firstAssetTitle =>
      'قم بشراء الأصول الأولى الخاصة بك';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'ابدأ بصندوق الطوارئ (Tesouro Selic أو CDB للسيولة اليومية). ثم التنويع تدريجياً.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'ابدأ بصندوق الطوارئ (النقدية ذات العائد المرتفع، أو صناديق سوق المال، أو سندات الخزانة قصيرة الأجل). ثم التنويع تدريجياً.\nنصيحة معلم';

  @override
  String get investFirstSteps_tipTitle => ':';

  @override
  String get investFirstSteps_tipBodyBr =>
      'ابدأ صغيرًا، واستثمر باستمرار، وتجنب محاولة تحديد توقيت السوق. الوقت هو أفضل حليف لك.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'ابدأ صغيرًا، واستثمر باستمرار، وتجنب محاولة تحديد توقيت السوق. الوقت هو أفضل حليف لك.';

  @override
  String get investMenu_tesouroTitle => 'سندات الخزانة البرازيلية';

  @override
  String get investMenu_cdbTitle => 'بنك الدخل الثابت (CDB)';

  @override
  String get investMenu_etfsTitle => 'صناديق الاستثمار المتداولة الدولية';

  @override
  String get investMenu_sp500Title => 'ستاندرد آند بورز 500 (مؤشر)\nأسهم';

  @override
  String get investMenu_stocksTitle => 'أموال';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'الصناعات السمكية';

  @override
  String get investMenu_reitsTitle => 'صناديق الاستثمار العقارية';

  @override
  String get investMenu_internationalTitle => 'الدولية';

  @override
  String get investMenu_cryptoTitle => 'التشفير';

  @override
  String get investRegisterCta => 'سجل الاستثمار';

  @override
  String investRegionHintBr(String country) {
    return 'البلد الفعال: $country · كتالوج البرازيل (سندات الخزانة، CDB، LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'البلد الفعال: $country · الكتالوج العالمي (صناديق الاستثمار المتداولة، NYSE/NASDAQ...). يتم تعديلها تلقائيًا من منطقة جهازك.';
  }

  @override
  String get strategy_sectionCoreTitle => 'الاستراتيجيات الأساسية';

  @override
  String get strategy_sectionDeepDiveTitle => 'الغوص العميق (الممتاز)';

  @override
  String get strategy_emergencyFundTitle => 'صندوق الطوارئ';

  @override
  String get strategy_emergencyFundBodyBr =>
      'درعك المالي. تغطية 6-12 شهرا من النفقات. إعطاء الأولوية للسيولة اليومية والمخاطر المنخفضة (على سبيل المثال، Tesouro Selic أو CDB المرتبط بـ CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'درعك المالي. تغطية 6-12 شهرا من النفقات. إعطاء الأولوية للسيولة اليومية والمخاطر المنخفضة (على سبيل المثال، صناديق سوق المال وسندات الخزانة قصيرة الأجل).';

  @override
  String get strategy_buyHoldTitle => 'شراء وانتظار';

  @override
  String get strategy_buyHoldBody =>
      'قم بشراء الأصول عالية الجودة واحتفظ بها على المدى الطويل. التركيز على الانضباط والجودة وإعادة الاستثمار مع مرور الوقت.';

  @override
  String get strategy_diversificationTitle => 'التنويع';

  @override
  String get strategy_diversificationBodyBr =>
      'قم بتوزيع رأس المال الخاص بك عبر الدخل الثابت والأسهم ومؤسسات الصناعات السمكية والأصول الدولية لتقليل المخاطر وتحسين العوائد المعدلة حسب المخاطر.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'قم بتوزيع رأس المال الخاص بك عبر السندات والأسهم وصناديق الاستثمار العقارية والتعرض الدولي لتقليل المخاطر وتحسين العائدات المعدلة حسب المخاطر.';

  @override
  String get strategy_dcaTitle => 'متوسط ​​التكلفة بالدولار (DCA)';

  @override
  String get strategy_dcaBody =>
      'الاتساق يتفوق على العبقرية. غالبًا ما يكون الاستثمار كل شهر أكثر فعالية من محاولة اختيار نقطة الدخول المثالية.';

  @override
  String get strategy_smartGoalsTitle => 'الأهداف الذكية';

  @override
  String get strategy_smartGoalsBody =>
      'يجب أن تكون أهدافك محددة وقابلة للقياس وقابلة للتحقيق وذات صلة ومحددة بفترة زمنية.\nقاعدة';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'إطار عمل بسيط للميزانية: 50% احتياجات، 30% رغبات، 20% استثمار وأهداف.';

  @override
  String get strategy_deepDive_allocationTitle => 'توزيع الأصول (متقدم)';

  @override
  String get strategy_deepDive_allocationBody =>
      'تعرف على كيفية إنشاء التخصيص حسب الهدف والأفق، وضبط المخاطر، والارتباط، وإعادة التوازن.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'صناديق الاستثمار المتداولة العالمية والمؤشرات (متقدمة)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'تعرف على المؤشرات العالمية (مثل S&P 500)، وصناديق الاستثمار المتداولة، وكيفية بناء التعرض الدولي بانضباط.';

  @override
  String get strategy_deepDive_taxesTitle => 'الضرائب وإعداد التقارير (متقدم)';

  @override
  String get strategy_deepDive_taxesBody =>
      'فهم المفاهيم الضريبية الأساسية وكيفية الاحتفاظ بالسجلات للإبلاغ عن الاستثمارات بأمان.\nمحتوى';

  @override
  String get strategy_premiumLockedBody =>
      'المميز. قم بتنشيط سمة Cyber/Grimm/Hive لفتح الاستثمار العميق.\nعرض';

  @override
  String get homeShowcaseTitle => '';

  @override
  String get homeShowcaseProfileSimTitle => 'اختبار ملف تعريف المخاطر';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'ابحث عن الملف التعريفي للمستثمر الخاص بك في بضع دقائق.';

  @override
  String get homeShowcaseStrategiesTitle => 'الاستراتيجيات الموصى بها';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'اختصارات مباشرة لتعلم الاستراتيجيات وتطبيقها.';

  @override
  String get homeShowcaseMentorHubTitle => 'مينتور: الاختبارات والاستراتيجيات';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'الوصول السريع إلى اختبار ملف تعريف المخاطر والاستراتيجيات الموصى بها.';

  @override
  String get homeTourStepClassicTitle => 'الوضع الكلاسيكي';

  @override
  String get homeTourStepClassicBody =>
      'يفتح لوحة التطبيق الأصلية: المعاملات والأهداف والاستثمارات والإعدادات في التخطيط المألوف.\nمنطقة العرض';

  @override
  String get homeTourStepVitrineTitle => '';

  @override
  String get homeTourStepVitrineBody =>
      'اختصارات للتعلم والممارسة: ملف تعريف المستثمر والاستراتيجيات ومركز المرشد.';

  @override
  String get homeTourStepProfileTitle => 'اختبار الملف الشخصي';

  @override
  String get homeTourStepProfileBody =>
      'قم بالإجابة على الاستبيان لاكتشاف ملف تعريف المخاطر الخاص بك والاطلاع على الاقتراحات المتوافقة.\nاستراتيجيات';

  @override
  String get homeTourStepStrategiesTitle => 'محتوى';

  @override
  String get homeTourStepStrategiesBody =>
      'لتنظيم الشؤون المالية والاستثمار بانضباط وتجنب المخاطر الشائعة.';

  @override
  String get homeTourStepHubTitle => 'مركز المرشد';

  @override
  String get homeTourStepHubBody =>
      'قائمة سريعة لاختبار الملف الشخصي والاستراتيجيات الموصى بها.\nميزات';

  @override
  String get homeTourStepPremiumTitle => 'المتميزة';

  @override
  String get homeTourStepPremiumBody =>
      'التوجيه التلقائي والرسوم البيانية المتقدمة والتقارير الشهرية - متاحة مع اشتراك Premium.\nلقطة من السوق';

  @override
  String get homeTourStepMarketTitle => 'سياق السوق';

  @override
  String get homeTourStepMarketBody =>
      '(البرازيل أو العالم) بناءً على منطقتك بالإضافة إلى القيمة الصافية المحولة.\nآلة حاسبة';

  @override
  String get homeTourStepCalculatorTitle => 'مينتور';

  @override
  String get homeTourStepCalculatorBody =>
      'محاكاة الفائدة المركبة والتضخم ورؤية مخطط الثروة؛ بعد ذلك نفتح هذه الأداة.';

  @override
  String get quizProfile_title => 'اختبار ملف تعريف المخاطر';

  @override
  String quizProfile_progress(int current, int total) {
    return 'السؤال $current من $total';
  }

  @override
  String get quizProfile_badge => 'اختبار ملف تعريف المخاطر';

  @override
  String get quizProfile_resultTitle => 'ملفك الشخصي هو';

  @override
  String get quizProfile_idealInvestmentsTitle => 'الاستثمارات المثالية:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'اكتشف الاستثمارات\nخروج';

  @override
  String get quizProfile_exit => '';

  @override
  String get quizKnowledge_title => 'اختبار المعرفة';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'سؤال $current من $total';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'מנטור פיננסים\nהתראת הוצאה';

  @override
  String get saldo => '';

  @override
  String get gastosDiarios => 'הוצאות יומיות';

  @override
  String get confirmarTransacao => 'אשר עסקה\nהצהרת';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'העברות';

  @override
  String get investimentos => 'השקעות\nהגדרות';

  @override
  String get configuracoes => 'פרופיל';

  @override
  String get perfil => '';

  @override
  String get sair => 'התנתק';

  @override
  String get entrar => 'כניסה';

  @override
  String get cadastrar => 'הרשמה';

  @override
  String get email => '';

  @override
  String get senha => 'סיסמא\nשם';

  @override
  String get nome => 'מספר מזהה';

  @override
  String get cpf => 'טלפון';

  @override
  String get telefone => '';

  @override
  String get continuar => 'המשך';

  @override
  String get voltar => 'חזרה';

  @override
  String get cancelar => 'בטל';

  @override
  String get salvar => 'שמור';

  @override
  String get editar => 'עריכה';

  @override
  String get excluir => 'מחק';

  @override
  String get sucesso => 'הצלחה\nשגיאה';

  @override
  String get erro => '';

  @override
  String get carregando => 'טוען...';

  @override
  String get semDados => 'אין נתונים';

  @override
  String get tentarNovamente => 'נסה שוב\nדוחות';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'הוצאות לפי קטגוריות';

  @override
  String get ultimosSeteDias => '7 הימים האחרונים';

  @override
  String get totalGasto => 'הוצאה סך הכל';

  @override
  String get transacoes => 'עסקאות\nקטגוריית';

  @override
  String get categoria => '';

  @override
  String get data => 'תאריך\nערך';

  @override
  String get valor => '';

  @override
  String get descricao => 'תיאור';

  @override
  String get alimentacao => 'מזון';

  @override
  String get transporte => 'הובלה';

  @override
  String get lazer => 'פנאי';

  @override
  String get saude => 'בריאות';

  @override
  String get outros => 'אחרים';

  @override
  String get notificacoes => 'התראות\nהרשאת הודעה';

  @override
  String get permissaoNotificacoes => '';

  @override
  String get ativarMonitoramento => 'אפשר ניטור הוצאות';

  @override
  String get descricaoMonitoramento =>
      'אפשר לאפליקציה לנטר אוטומטית את העסקאות הבנקאיות שלך כדי לארגן את הכספים שלך.';

  @override
  String get idioma => 'שפה';

  @override
  String get moeda => 'מטבע';

  @override
  String get compararInvestimentos => 'השווה השקעות';

  @override
  String get descricaoLocalizacao =>
      'כדי להשוות השקעות מקומיות (CDB/CDI) עם תעריפים בינלאומיים, אנחנו צריכים את המיקום שלך.';

  @override
  String get permissaoLocalizacaoNecessaria => 'נדרשת הרשאת מיקום';

  @override
  String get rendaFixa => 'הכנסה קבועה';

  @override
  String get rendaVariavel => 'הכנסה משתנה';

  @override
  String get tesouroDireto => 'משרד האוצר הישיר';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA\nמניות';

  @override
  String get acoes => '';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'מטבעות קריפטו';

  @override
  String get rendimento => 'החזרה';

  @override
  String get rentabilidade => 'רווחיות';

  @override
  String get aplicar => 'הגש בקשה';

  @override
  String get resgatar => 'פדה';

  @override
  String get simular => 'סימולציה';

  @override
  String get metas => 'מטרות';

  @override
  String get estrategias => '';

  @override
  String get conhecimento => 'ידע';

  @override
  String get chat => 'צ\'אט';

  @override
  String get enviarMensagem => 'שלח הודעה';

  @override
  String get digiteMensagem => 'הקלד הודעה...\nטיפ';

  @override
  String get alertaGastos => '';

  @override
  String alertaGastosMsg(int percent) {
    return 'כבר השתמשת ב-$percent% ממסגרת האשראי שלך.';
  }

  @override
  String get fechamentoFatura => 'סגירת חשבונית';

  @override
  String get fechamentoFaturaMsg =>
      'מחר הוא יום הסגירה. זמן מצוין לבדיקת הוצאות.\nחשבונית';

  @override
  String get faturaVencendo => 'לתשלום\nחשבונית';

  @override
  String faturaVencendoMsg(int dias) {
    return 'לפירעון בעוד $dias ימים. בדוק את היתרה שלך.\nמאזן';
  }

  @override
  String get regra30 => ': כלל 30%.';

  @override
  String get regra30Msg =>
      'שמור על שימוש מתחת ל-30% כדי לשפר את ציון האשראי שלך.';

  @override
  String get diaDeOuro => 'יום הזהב!';

  @override
  String get diaDeOuroMsg => 'הרכישות שלך היום ישולמו רק בעוד 40 יום!';

  @override
  String get alertaJuros => 'אזהרה: ריבית';

  @override
  String get alertaJurosMsg =>
      'היתרה שלך לא מכסה את החשבון. הימנע אשראי מתגלגל!';

  @override
  String get notaSaude => 'בריאות פיננסית';

  @override
  String get notaExcelente => 'מעולה! יש לך בריאות כלכלית מצוינת.';

  @override
  String get notaBom => 'טוב, אבל יכול להשתפר.';

  @override
  String get notaAtencao => 'תשומת לב להוצאות.';

  @override
  String get notaRevisar => 'סקור את הכספים שלך.';

  @override
  String get mentorInsightTitle => 'הדרכת מנטור';

  @override
  String get mentorInsightLoading => 'שואב נתוני שוק...';

  @override
  String get mentorInsightError => 'לא ניתן לטעון נתונים כעת. נסה שוב בקרוב.';

  @override
  String get mentorInsightOffline =>
      'אתה לא מקוון. התחבר כדי להביא הצעות מחיר ותובנות מנטור.';

  @override
  String get mentorAllocationDefensive =>
      'בהתחשב בתנודתיות הנוכחית, תעדוף את שימור ההון והנזילות לפני המרדף אחר תשואות.';

  @override
  String get mentorAllocationBalanced =>
      'איזון הגנה וצמיחה: גיוון ובקר מחדש באופק היעד שלך.';

  @override
  String get mentorAllocationOffensive =>
      'הפרופיל שלך מאפשר יותר סיכונים: הישאר ממושמע והימנע מריכוז כבד.\nסמלים של';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'נבדקו: $symbols';
  }

  @override
  String get currencyFollowLocale => 'אוטומטי (שפה)';

  @override
  String get compoundCalculatorTitle => 'מחשבון מנטור — ריבית דריבית';

  @override
  String get compoundCalculatorSubtitle =>
      'הדמיית תרומות, רווח נומינלי לעומת ריאלי (אחרי אינפלציה), והערות מנטור.';

  @override
  String get compoundInitialLabel => 'סכום חד פעמי ראשוני';

  @override
  String get compoundMonthlyLabel => 'תרומה חודשית';

  @override
  String get compoundRateLabel => 'ריבית';

  @override
  String get compoundRateAnnual => 'לשנה';

  @override
  String get compoundRateMonthly => 'לחודש';

  @override
  String get compoundHorizonLabel => 'אופק זמן';

  @override
  String get compoundHorizonYears => 'שנים';

  @override
  String get compoundHorizonMonths => 'חודשים';

  @override
  String get compoundInflationLabel => 'אינפלציה משוערת (% לשנה)';

  @override
  String get compoundCalculate => 'חשב';

  @override
  String get compoundChartInvested => 'סך הכל מושקע';

  @override
  String get compoundChartInterest => 'ריבית שהושגה';

  @override
  String get compoundSummaryNominalEnd => 'יתרת סיום (נומינלית)';

  @override
  String get compoundSummaryRealGain => 'רווח אמיתי (כוח קנייה)';

  @override
  String get compoundMentorCardTitle => 'ייעוץ מנטור';

  @override
  String get compoundInvalidInput => 'הזן ערכים חוקיים (אופק > 0).';

  @override
  String get userPersonaSectionTitle => 'טון מנטור';

  @override
  String get userPersonaNovice => 'מתחיל';

  @override
  String get userPersonaStrategist => 'אסטרטג';

  @override
  String get userPersonaRiskTaker => 'נוטל סיכונים';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'פתח את תובנת המנטורים המלאה';

  @override
  String get investFirstSteps_title => 'צעדים ראשונים';

  @override
  String get investFirstSteps_brokerTitle => 'בחר מתווך';

  @override
  String get investFirstSteps_brokerBody =>
      'חפשו מוסדות מוסדרים בעלי מוניטין מוסדרים. השווה עמלות, מוצרים ואמינות לפני פתיחת חשבון.';

  @override
  String get investFirstSteps_openAccountTitle => 'פתח את החשבון שלך';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'כניסה דיגיטלית. בברזיל, אתה בדרך כלל צריך CPF/RG ולפעמים הוכחת כתובת.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'כניסה דיגיטלית משתנה בהתאם למדינה. בדרך כלל אתה צריך מסמך מזהה ואימות זהות/כתובת.';

  @override
  String get investFirstSteps_transferTitle => 'העבר כספים';

  @override
  String get investFirstSteps_transferBodyBr =>
      'שלח כסף באמצעות PIX או העברה בנקאית לברוקר שלך. היתרה הופכת זמינה להשקעה.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'העבר כספים באמצעות העברה בנקאית או אמצעי תשלום מקומיים (תלוי במדינה שלך). היתרה הופכת זמינה להשקעה.';

  @override
  String get investFirstSteps_riskProfileTitle => 'הכר את פרופיל הסיכון שלך';

  @override
  String get investFirstSteps_riskProfileBody =>
      'ענה על שאלון התאמה. הבן אם אתה שמרן, מתון או תוקפני.';

  @override
  String get investFirstSteps_firstAssetTitle => 'קנה את הנכס הראשון שלך';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'התחל עם קרן חירום (Tesouro Selic או CDB עם נזילות יומית). לאחר מכן גיוון בהדרגה.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'התחל עם קרן חירום (מזומן עם תשואה גבוהה, קרנות שוק כספים או אג\"ח אוצר לטווח קצר). לאחר מכן גיוון בהדרגה.\nטיפ למנטור';

  @override
  String get investFirstSteps_tipTitle => ':';

  @override
  String get investFirstSteps_tipBodyBr =>
      'התחילו בקטן, השקיעו בעקביות והימנעו מלנסות לתזמן את השוק. הזמן הוא בעל הברית הטוב ביותר שלך.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'התחילו בקטן, השקיעו בעקביות והימנעו מלנסות לתזמן את השוק. הזמן הוא בעל הברית הטוב ביותר שלך.';

  @override
  String get investMenu_tesouroTitle => 'אוצר ברזילאים';

  @override
  String get investMenu_cdbTitle =>
      'בנק להכנסה קבועה (CDB)\nתעודות סל בינלאומיות';

  @override
  String get investMenu_etfsTitle => '';

  @override
  String get investMenu_sp500Title => 'S&P 500 (מדד)\nמניות';

  @override
  String get investMenu_stocksTitle => 'קרנות';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'בינלאומי';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'רשום השקעה';

  @override
  String investRegionHintBr(String country) {
    return 'מדינה יעילה: $country · קטלוג ברזיל (אוצר, CDB, LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'מדינה יעילה: $country · קטלוג גלובלי (תעודות סל, NYSE/NASDAQ...). מותאם אוטומטית מאזור המכשיר שלך.';
  }

  @override
  String get strategy_sectionCoreTitle => 'אסטרטגיות חיוניות';

  @override
  String get strategy_sectionDeepDiveTitle => 'צלילה עמוקה (פרימיום)';

  @override
  String get strategy_emergencyFundTitle => 'קרן חירום';

  @override
  String get strategy_emergencyFundBodyBr =>
      'המגן הפיננסי שלך. כיסוי הוצאות של 6-12 חודשים. תעדוף נזילות יומית וסיכון נמוך (למשל, Tesouro Selic או CDB צמוד CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'המגן הפיננסי שלך. כיסוי הוצאות של 6-12 חודשים. תעדוף נזילות יומית וסיכון נמוך (למשל, קרנות שוק כספים ואג\"ח אוצר לטווח קצר).';

  @override
  String get strategy_buyHoldTitle => 'קניה והחזקה';

  @override
  String get strategy_buyHoldBody =>
      'קנה נכסים איכותיים והחזק לטווח ארוך. התמקדו במשמעת, באיכות ובהשקעה מחדש לאורך זמן.\nגיוון';

  @override
  String get strategy_diversificationTitle => '';

  @override
  String get strategy_diversificationBodyBr =>
      'פזר את ההון שלך על פני הכנסה קבועה, מניות, FIIs ונכסים בינלאומיים כדי להפחית סיכון ולשפר תשואות מותאמות סיכון.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'פזר את ההון שלך על פני אג\"ח, מניות, REIT וחשיפה בינלאומית כדי להפחית סיכון ולשפר תשואות מותאמות לסיכון.';

  @override
  String get strategy_dcaTitle => 'ממוצע עלות דולר (DCA)';

  @override
  String get strategy_dcaBody =>
      'עקביות מנצחת גאונות. השקעה בכל חודש היא לרוב יעילה יותר מאשר לנסות לבחור את נקודת הכניסה המושלמת.';

  @override
  String get strategy_smartGoalsTitle => 'שערים SMART';

  @override
  String get strategy_smartGoalsBody =>
      'היעדים שלך צריכים להיות ספציפיים, ניתנים למדידה, ניתנים להשגה, רלוונטיים ומוגדרים בזמן.\nכלל';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'מסגרת תקצוב פשוטה: 50% צרכים, 30% רצונות, 20% השקעה ויעדים.';

  @override
  String get strategy_deepDive_allocationTitle => 'הקצאת נכסים (מתקדם)';

  @override
  String get strategy_deepDive_allocationBody =>
      'למד כיצד לבנות הקצאה לפי יעד ואופק, התאמת סיכונים, מתאם ואיזון מחדש.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'תעודות סל ומדדים גלובליים (מתקדמים)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'למד על מדדים גלובליים (למשל, S&P 500), תעודות סל וכיצד לבנות חשיפה בינלאומית במשמעת.';

  @override
  String get strategy_deepDive_taxesTitle => 'מיסים ודיווח (מתקדם)';

  @override
  String get strategy_deepDive_taxesBody =>
      'הבן את מושגי הליבה בנושא מס וכיצד לשמור תיעוד כדי לדווח על השקעות בבטחה.';

  @override
  String get strategy_premiumLockedBody =>
      'תוכן פרימיום. הפעל ערכת נושא Cyber/Grimm/Hive כדי לפתוח את ההשקעה Deep Dive.\nחלון ראווה של';

  @override
  String get homeShowcaseTitle => 'חידון פרופיל סיכונים';

  @override
  String get homeShowcaseProfileSimTitle => '';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'מצא את פרופיל המשקיע שלך תוך מספר דקות.';

  @override
  String get homeShowcaseStrategiesTitle => 'אסטרטגיות מומלצות';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'קיצורי דרך ישירים ללמידה ויישום אסטרטגיות.';

  @override
  String get homeShowcaseMentorHubTitle => 'מנטור: חידונים ואסטרטגיות';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'גישה מהירה לחידון פרופיל הסיכון ואסטרטגיות מומלצות.';

  @override
  String get homeTourStepClassicTitle => 'מצב קלאסי';

  @override
  String get homeTourStepClassicBody =>
      'פותח את פאנל האפליקציה המקורי: עסקאות, יעדים, השקעות והגדרות בפריסה המוכרת.\nאזור חלון ראווה של';

  @override
  String get homeTourStepVitrineTitle => '';

  @override
  String get homeTourStepVitrineBody =>
      'קיצורי דרך ללמידה ולתרגול: פרופיל משקיעים, אסטרטגיות ומרכז המנטור.\nחידון פרופיל';

  @override
  String get homeTourStepProfileTitle => '';

  @override
  String get homeTourStepProfileBody =>
      'ענה על השאלון כדי לגלות את פרופיל הסיכון שלך ולראות הצעות מיושרות.\nאסטרטגיות';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'תוכן לארגון כספים, השקעה במשמעת והימנעות ממלכודות נפוצות.';

  @override
  String get homeTourStepHubTitle => 'Mentor רכזת';

  @override
  String get homeTourStepHubBody =>
      'תפריט מהיר לחידון הפרופילים ואסטרטגיות מומלצות.\nתכונות';

  @override
  String get homeTourStepPremiumTitle => 'פרימיום';

  @override
  String get homeTourStepPremiumBody =>
      'חניכה אוטומטית, תרשימים מתקדמים ודוחות חודשיים - זמינים עם מנוי פרימיום.\nתמונת מצב של שוק';

  @override
  String get homeTourStepMarketTitle => '';

  @override
  String get homeTourStepMarketBody =>
      'ההקשר של השוק (ברזיל או גלובלי) מבוסס על האזור שלך בתוספת שווי נקי שהומר.\nמחשבון';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor';

  @override
  String get homeTourStepCalculatorBody =>
      'הדמיית ריבית דריבית, אינפלציה וראה את תרשים העושר; בשלב הבא נפתח את הכלי הזה.';

  @override
  String get quizProfile_title => 'חידון פרופיל סיכונים';

  @override
  String quizProfile_progress(int current, int total) {
    return 'שאלה $current מתוך $total';
  }

  @override
  String get quizProfile_badge => 'חידון פרופיל סיכון';

  @override
  String get quizProfile_resultTitle => 'הפרופיל שלך הוא';

  @override
  String get quizProfile_idealInvestmentsTitle => 'השקעות אידיאליות:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'חקור השקעות';

  @override
  String get quizProfile_exit => 'יציאה\nחידון ידע';

  @override
  String get quizKnowledge_title => '';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'שאלה $current מתוך $total';
  }
}

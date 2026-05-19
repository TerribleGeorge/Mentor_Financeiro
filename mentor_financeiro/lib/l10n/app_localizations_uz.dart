// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'Mentor moliya';

  @override
  String get saldo => 'Balans';

  @override
  String get gastosDiarios => 'Kundalik xarajatlar';

  @override
  String get confirmarTransacao => 'Tranzaksiyani tasdiqlang';

  @override
  String get extrato => 'bayonoti';

  @override
  String get transferencias => 'Transferlar';

  @override
  String get investimentos => 'Investitsiyalar';

  @override
  String get configuracoes => 'sozlamalari';

  @override
  String get perfil => 'profili';

  @override
  String get sair => 'Chiqish';

  @override
  String get entrar => 'Kirish';

  @override
  String get cadastrar => 'Ro\'yxatdan o\'tish';

  @override
  String get email => 'Elektron pochta';

  @override
  String get senha => 'parol';

  @override
  String get nome => 'nomi';

  @override
  String get cpf => 'ID raqami';

  @override
  String get telefone => 'telefon';

  @override
  String get continuar => 'Davom etish';

  @override
  String get voltar => 'Orqaga';

  @override
  String get cancelar => 'Bekor qilish';

  @override
  String get salvar => 'Saqlash';

  @override
  String get editar => 'Tahrirlash';

  @override
  String get excluir => 'O\'chirish';

  @override
  String get sucesso => 'Muvaffaqiyat';

  @override
  String get erro => 'xatosi';

  @override
  String get carregando => 'Yuklanmoqda...';

  @override
  String get semDados => 'Ma\'lumot yo\'q';

  @override
  String get tentarNovamente => 'Qaytadan urining';

  @override
  String get relatorios => 'hisobotlari';

  @override
  String get gastosPorCategoria => 'Turkum bo\'yicha xarajatlar';

  @override
  String get ultimosSeteDias => 'Oxirgi 7 kun';

  @override
  String get totalGasto => 'Jami sarflangan';

  @override
  String get transacoes => 'operatsiyalari';

  @override
  String get categoria => 'toifasi';

  @override
  String get data => 'Sana';

  @override
  String get valor => 'qiymati';

  @override
  String get descricao => 'Tavsif';

  @override
  String get alimentacao => 'Oziq-ovqat';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Dam olish';

  @override
  String get saude => 'Salomatlik';

  @override
  String get outros => 'Boshqalar';

  @override
  String get notificacoes => 'bildirishnomalari';

  @override
  String get permissaoNotificacoes => 'bildirishnoma ruxsati';

  @override
  String get ativarMonitoramento => 'Xarajatlar monitoringini yoqish';

  @override
  String get descricaoMonitoramento =>
      'Ilovaga moliyangizni tartibga solish uchun bank tranzaksiyalaringizni avtomatik kuzatishga ruxsat bering.';

  @override
  String get idioma => 'tili';

  @override
  String get moeda => 'Valyuta';

  @override
  String get compararInvestimentos => 'Investitsiyalar solishtiring';

  @override
  String get descricaoLocalizacao =>
      'Mahalliy investitsiyalarni (CDB/CDI) xalqaro tariflar bilan solishtirish uchun bizga joylashuvingiz kerak.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Joylashuv ruxsati talab qilinadi';

  @override
  String get rendaFixa => 'Ruxsat etilgan daromad';

  @override
  String get rendaVariavel => 'o\'zgaruvchan daromad';

  @override
  String get tesouroDireto => 'G\'aznachilik to\'g\'ridan-to\'g\'ri';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'aktsiyalari';

  @override
  String get fiis => 'FIIlar';

  @override
  String get criptomoedas => 'kriptovalyutalar';

  @override
  String get rendimento => 'Qaytish';

  @override
  String get rentabilidade => 'Daromadlilik';

  @override
  String get aplicar => 'Qo\'llash';

  @override
  String get resgatar => 'Foydalanish';

  @override
  String get simular => 'Simulyatsiya';

  @override
  String get metas => 'Maqsadlar';

  @override
  String get estrategias => 'strategiyalari';

  @override
  String get conhecimento => 'Bilim';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Xabar yuborish';

  @override
  String get digiteMensagem => 'Xabar yozing...';

  @override
  String get alertaGastos => 'Xarajat haqida ogohlantirish';

  @override
  String alertaGastosMsg(int percent) {
    return 'Siz allaqachon kredit limitingizning $percent% ishlatgansiz.';
  }

  @override
  String get fechamentoFatura => 'Hisob-fakturani yopish';

  @override
  String get fechamentoFaturaMsg =>
      'Ertaga yopilish kuni. Xarajatlarni ko\'rib chiqish uchun ajoyib vaqt.';

  @override
  String get faturaVencendo => 'Hisob-faktura muddati tugaydi';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Hisob-faktura $dias kundan keyin to‘lanadi. Balansingizni tekshiring.';
  }

  @override
  String get regra30 => 'Maslahat: 30% qoida';

  @override
  String get regra30Msg =>
      'Kredit ballingizni yaxshilash uchun foydalanishni 30% dan pastroqda saqlang.';

  @override
  String get diaDeOuro => 'Oltin kun!';

  @override
  String get diaDeOuroMsg =>
      'Bugungi xaridlaringiz faqat 40 kun ichida to\'lanadi!';

  @override
  String get alertaJuros => 'Ogohlantirish: Qiziqish';

  @override
  String get alertaJurosMsg =>
      'Balansingiz hisobni qoplamaydi. Qayta tiklanadigan kreditdan saqlaning!';

  @override
  String get notaSaude => 'Moliyaviy salomatlik';

  @override
  String get notaExcelente => 'Zo\'r! Sizning moliyaviy sog\'ligingiz yaxshi.';

  @override
  String get notaBom => 'Yaxshi, lekin yaxshilash mumkin.';

  @override
  String get notaAtencao => 'Xarajatga e\'tibor.';

  @override
  String get notaRevisar => 'Moliyangizni ko\'rib chiqing.';

  @override
  String get mentorInsightTitle => 'Mentor ko\'rsatmasi';

  @override
  String get mentorInsightLoading => 'Bozor maʼlumotlari olinmoqda…';

  @override
  String get mentorInsightError =>
      'Hozir maʼlumotlarni yuklab boʻlmadi. Tez orada qayta urinib ko\'ring.';

  @override
  String get mentorInsightOffline =>
      'Siz oflaynsiz. Kotirovkalar va Mentor tushunchalarini olish uchun ulaning.';

  @override
  String get mentorAllocationDefensive =>
      'Joriy o\'zgaruvchanlikni hisobga olgan holda, daromadlarni ta\'qib qilishdan oldin kapitalni saqlash va likvidlikni birinchi o\'ringa qo\'ying.';

  @override
  String get mentorAllocationBalanced =>
      'Balansni himoya qilish va o\'sish: maqsad ufqingizni diversifikatsiya qiling va qayta ko\'rib chiqing.';

  @override
  String get mentorAllocationOffensive =>
      'Sizning profilingiz ko\'proq xavf tug\'diradi: intizomli bo\'ling va og\'ir konsentratsiyadan qoching.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Belgilar ko‘rib chiqildi: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Avtomatik (til)';

  @override
  String get compoundCalculatorTitle => 'Mentor Kalkulyator - Murakkab foiz';

  @override
  String get compoundCalculatorSubtitle =>
      'badallar, nominal va real daromad (inflyatsiyadan keyin) va murabbiy eslatmalarini taqlid qiling.';

  @override
  String get compoundInitialLabel => 'Boshlang\'ich bir martalik to\'lov';

  @override
  String get compoundMonthlyLabel => 'Oylik badal';

  @override
  String get compoundRateLabel => 'Foiz stavkasi\nYiliga';

  @override
  String get compoundRateAnnual => 'Oyiga';

  @override
  String get compoundRateMonthly => '';

  @override
  String get compoundHorizonLabel => 'Vaqt gorizonti';

  @override
  String get compoundHorizonYears => 'yil';

  @override
  String get compoundHorizonMonths => 'oylar';

  @override
  String get compoundInflationLabel => 'Taxminiy inflyatsiya (yillik foiz)';

  @override
  String get compoundCalculate => 'Hisoblash';

  @override
  String get compoundChartInvested => 'Jami investitsiya qilingan';

  @override
  String get compoundChartInterest => 'Ishlagan foiz';

  @override
  String get compoundSummaryNominalEnd => 'Yakuniy balans (nominal)';

  @override
  String get compoundSummaryRealGain =>
      'Haqiqiy daromad (sotib olish qobiliyati)';

  @override
  String get compoundMentorCardTitle => 'Mentor maslahati';

  @override
  String get compoundInvalidInput => 'Yaroqli qiymatlarni kiriting (ufq > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor ohangi';

  @override
  String get userPersonaNovice => 'Boshlang\'ich';

  @override
  String get userPersonaStrategist => 'strategist';

  @override
  String get userPersonaRiskTaker => 'Tavakkalchi';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'To\'liq murabbiy tushunchasini oching';

  @override
  String get investFirstSteps_title => 'Birinchi qadamlar';

  @override
  String get investFirstSteps_brokerTitle => 'Brokerni tanlang';

  @override
  String get investFirstSteps_brokerBody =>
      'Tartibga solinadigan, obro\'li muassasalarni qidiring. Hisobni ochishdan oldin to\'lovlar, mahsulotlar va ishonchlilikni solishtiring.';

  @override
  String get investFirstSteps_openAccountTitle => 'Hisobingizni oching';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Raqamli ishga tushirish. Braziliyada sizga odatda CPF/RG va ba\'zan manzilni tasdiqlovchi hujjat kerak bo\'ladi.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Raqamli ulanish mamlakatga qarab farq qiladi. Odatda sizga shaxsni tasdiqlovchi hujjat va shaxsni tasdiqlovchi/manzilni tasdiqlash kerak bo\'ladi.';

  @override
  String get investFirstSteps_transferTitle => 'Pul o\'tkazmalari';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Brokeringizga PIX yoki bank oʻtkazmasi orqali pul yuboring. Balans investitsiya qilish uchun mavjud bo\'ladi.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Pulni bank oʻtkazmasi yoki mahalliy toʻlov usullari orqali oʻtkazing (mamlakatingizga bogʻliq). Balans investitsiya qilish uchun mavjud bo\'ladi.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Xavf profilingizni biling';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Muvofiqlik so\'roviga javob bering. Konservativ, mo\'\'tadil yoki tajovuzkor ekanligingizni tushuning.';

  @override
  String get investFirstSteps_firstAssetTitle =>
      'Birinchi aktivingizni sotib oling';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Favqulodda vaziyatlar fondidan boshlang (Tesouro Selic yoki kunlik likvidli CDB). Keyin asta-sekin diversifikatsiya qiling.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Favqulodda vaziyatlar fondidan (yuqori daromadli naqd pul, pul bozori fondlari yoki qisqa muddatli g\'aznachilik obligatsiyalari) boshlang. Keyin asta-sekin diversifikatsiya qiling.';

  @override
  String get investFirstSteps_tipTitle => 'Mentor maslahati:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Kichkinadan boshlang, doimiy ravishda sarmoya kiriting va bozor vaqtini belgilashga urinmang. Vaqt sizning eng yaxshi ittifoqdoshingizdir.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Kichkinadan boshlang, doimiy ravishda investitsiya qiling va bozor vaqtini belgilashga urinmang. Vaqt sizning eng yaxshi ittifoqdoshingizdir.';

  @override
  String get investMenu_tesouroTitle => 'Braziliya g\'aznalari';

  @override
  String get investMenu_cdbTitle => 'Bankning doimiy daromadi (CDB)';

  @override
  String get investMenu_etfsTitle => 'xalqaro ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'aktsiyalari';

  @override
  String get investMenu_fundsTitle => 'mablag\'lari';

  @override
  String get investMenu_fiisTitle => 'FIIlar';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'xalqaro';

  @override
  String get investMenu_cryptoTitle => 'kripto';

  @override
  String get investRegisterCta => 'Investitsiyalarni ro\'yxatdan o\'tkazing';

  @override
  String investRegionHintBr(String country) {
    return 'Samarali mamlakat: $country · Braziliya katalogi (Gazinalar, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Samarali mamlakat: $country · Global katalog (ETFs, NYSE/NASDAQ…). Qurilmangiz hududidan avtomatik sozlangan.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Muhim strategiyalar';

  @override
  String get strategy_sectionDeepDiveTitle => 'Chuqur sho\'ng\'in (premium)';

  @override
  String get strategy_emergencyFundTitle => 'Favqulodda vaziyatlar fondi';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Sizning moliyaviy qalqoningiz. 6-12 oylik xarajatlarni qoplash. Kundalik likvidlik va past xavfga ustunlik bering (masalan, Tesouro Selic yoki CDI bilan bog\'liq CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Sizning moliyaviy qalqoningiz. 6-12 oylik xarajatlarni qoplash. Kundalik likvidlik va past xavfga ustunlik bering (masalan, pul bozori fondlari va qisqa muddatli g\'aznachilik obligatsiyalari).';

  @override
  String get strategy_buyHoldTitle => 'Sotib oling va ushlab turing';

  @override
  String get strategy_buyHoldBody =>
      'Sifatli aktivlarni sotib oling va uzoq muddatga saqlang. Vaqt o\'tishi bilan intizom, sifat va qayta investitsiyalarga e\'tibor qarating.';

  @override
  String get strategy_diversificationTitle => 'diversifikatsiyasi';

  @override
  String get strategy_diversificationBodyBr =>
      'Xavfni kamaytirish va xavfga qarab sozlangan daromadlarni yaxshilash uchun kapitalingizni qat\'iy daromad, aktsiyalar, FII va xalqaro aktivlar bo\'ylab tarqating.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Kapitalingizni obligatsiyalar, aktsiyalar, REITlar va xalqaro taʼsirlar boʻyicha taqsimlang va xavfni kamaytirish va tavakkalchilik asosida tuzatilgan daromadlarni yaxshilash.';

  @override
  String get strategy_dcaTitle => 'Dollar-xarajat o\'rtacha (DCA)';

  @override
  String get strategy_dcaBody =>
      'Mustahkamlik dahoni uradi. Har oy investitsiya qilish ko\'pincha mukammal kirish nuqtasini tanlashga urinishdan ko\'ra samaraliroqdir.';

  @override
  String get strategy_smartGoalsTitle => 'SMART maqsadlar';

  @override
  String get strategy_smartGoalsBody =>
      'Maqsadlaringiz aniq, o\'lchanadigan, erishish mumkin, tegishli va vaqt bilan bog\'liq bo\'lishi kerak.';

  @override
  String get strategy_503020Title => '50-30-20 qoidasi';

  @override
  String get strategy_503020Body =>
      'Oddiy byudjet tizimi: 50% ehtiyojlar, 30% istaklar, 20% sarmoya va maqsadlar.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Aktivlarni taqsimlash (kengaytirilgan)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Maqsad va ufq bo\'yicha taqsimlashni qanday yaratishni, xavfni, korrelyatsiyani va muvozanatni o\'zgartirishni o\'rganing.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETF va indekslari (ilg\'or)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Global indekslar (masalan, S&P 500), ETFlar va intizom bilan xalqaro ta\'sirni qanday yaratish haqida bilib oling.';

  @override
  String get strategy_deepDive_taxesTitle => 'Soliqlar va hisobotlar (ilg\'or)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Asosiy soliq tushunchalari va investitsiyalar haqida xavfsiz hisobot berish uchun yozuvlarni qanday saqlash kerakligini tushuning.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium kontent. Deep Dive investitsiyasini ochish uchun Cyber/Grimm/Hive mavzusini faollashtiring.';

  @override
  String get homeShowcaseTitle => 'ko\'rgazmasi';

  @override
  String get homeShowcaseProfileSimTitle => 'Risk profili testi';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Bir necha daqiqada investor profilingizni toping.';

  @override
  String get homeShowcaseStrategiesTitle => 'Tavsiya etilgan strategiyalar';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Strategiyalarni oʻrganish va qoʻllash uchun bevosita yorliqlar.';

  @override
  String get homeShowcaseMentorHubTitle =>
      'Mentor: Viktorinalar va strategiyalar';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Xavf profili viktorinasiga va tavsiya etilgan strategiyalarga tezkor kirish.';

  @override
  String get homeTourStepClassicTitle => 'Klassik rejim';

  @override
  String get homeTourStepClassicBody =>
      'Asl ilova panelini ochadi: tranzaksiyalar, maqsadlar, investitsiyalar va tanish tartibdagi sozlamalar.';

  @override
  String get homeTourStepVitrineTitle => 'Vitrin maydoni';

  @override
  String get homeTourStepVitrineBody =>
      'O\'rganish va mashq qilish uchun yorliqlar: investor profili, strategiyalar va Mentor markazi.';

  @override
  String get homeTourStepProfileTitle => 'Profil viktorina';

  @override
  String get homeTourStepProfileBody =>
      'Xavf profilingizni aniqlash va moslashtirilgan takliflarni koʻrish uchun soʻrovnomaga javob bering.';

  @override
  String get homeTourStepStrategiesTitle => 'strategiyalari';

  @override
  String get homeTourStepStrategiesBody =>
      'Moliyani tartibga solish, intizom bilan investitsiya qilish va umumiy tuzoqlardan qochish uchun kontent.';

  @override
  String get homeTourStepHubTitle => 'Mentor markazi';

  @override
  String get homeTourStepHubBody =>
      'Profil viktorina va tavsiya etilgan strategiyalar uchun tezkor menyu.';

  @override
  String get homeTourStepPremiumTitle => 'Premium xususiyatlari';

  @override
  String get homeTourStepPremiumBody =>
      'Avtomatik murabbiylik, kengaytirilgan jadvallar va oylik hisobotlar — Premium obunasi bilan mavjud.';

  @override
  String get homeTourStepMarketTitle => 'Bozor surati';

  @override
  String get homeTourStepMarketBody =>
      'Mintaqangiz va konvertatsiya qilingan sof qiymatga asoslangan bozor konteksti (Braziliya yoki global).';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor kalkulyatori';

  @override
  String get homeTourStepCalculatorBody =>
      'Murakkab foizlarni, inflyatsiyani taqlid qiling va boylik jadvalini ko\'ring; keyin biz ushbu vositani ochamiz.';

  @override
  String get quizProfile_title => 'Risk profili testi';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Savol: $current, $total';
  }

  @override
  String get quizProfile_badge => 'XAVF PROFILI VIktorinasi';

  @override
  String get quizProfile_resultTitle => 'PROFILINGIZ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEAL investitsiyalar:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'INVESTITSIYALARNI TANISH';

  @override
  String get quizProfile_exit => 'CHIKISh';

  @override
  String get quizKnowledge_title => 'Bilimlar viktorinasi';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Savol: $current / $total';
  }
}

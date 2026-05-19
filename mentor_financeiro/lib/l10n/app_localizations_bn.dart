// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'মেন্টর ফাইন্যান্স';

  @override
  String get saldo => 'ব্যালেন্স';

  @override
  String get gastosDiarios => 'দৈনিক খরচ';

  @override
  String get confirmarTransacao => 'লেনদেন নিশ্চিত করুন';

  @override
  String get extrato => 'বিবৃতি';

  @override
  String get transferencias => 'স্থানান্তর';

  @override
  String get investimentos => 'বিনিয়োগ';

  @override
  String get configuracoes => 'সেটিংস';

  @override
  String get perfil => 'প্রোফাইল';

  @override
  String get sair => 'লগআউট';

  @override
  String get entrar => 'লগইন করুন';

  @override
  String get cadastrar => 'নিবন্ধন করুন';

  @override
  String get email => 'ইমেল';

  @override
  String get senha => 'পাসওয়ার্ড';

  @override
  String get nome => 'নাম';

  @override
  String get cpf => 'আইডি নম্বর';

  @override
  String get telefone => 'ফোন';

  @override
  String get continuar => 'চালিয়ে যান';

  @override
  String get voltar => 'পিছনে';

  @override
  String get cancelar => 'বাতিল করুন';

  @override
  String get salvar => 'সংরক্ষণ করুন';

  @override
  String get editar => 'সম্পাদনা করুন';

  @override
  String get excluir => 'মুছুন';

  @override
  String get sucesso => 'সাফল্য';

  @override
  String get erro => 'ত্রুটি';

  @override
  String get carregando => 'লোড হচ্ছে...';

  @override
  String get semDados => 'কোন ডেটা নেই';

  @override
  String get tentarNovamente => 'আবার চেষ্টা করুন';

  @override
  String get relatorios => 'রিপোর্ট';

  @override
  String get gastosPorCategoria => 'বিভাগ অনুসারে ব্যয়';

  @override
  String get ultimosSeteDias => 'গত ৭ দিন';

  @override
  String get totalGasto => 'মোট খরচ হয়েছে';

  @override
  String get transacoes => 'লেনদেন';

  @override
  String get categoria => 'বিভাগ';

  @override
  String get data => 'তারিখ';

  @override
  String get valor => 'মান';

  @override
  String get descricao => 'বর্ণনা';

  @override
  String get alimentacao => 'খাদ্য';

  @override
  String get transporte => 'পরিবহন';

  @override
  String get lazer => 'অবসর';

  @override
  String get saude => 'স্বাস্থ্য';

  @override
  String get outros => 'অন্যরা';

  @override
  String get notificacoes => 'বিজ্ঞপ্তি';

  @override
  String get permissaoNotificacoes => 'বিজ্ঞপ্তির অনুমতি';

  @override
  String get ativarMonitoramento => 'ব্যয় নিরীক্ষণ সক্ষম করুন';

  @override
  String get descricaoMonitoramento =>
      'অ্যাপটিকে স্বয়ংক্রিয়ভাবে আপনার ব্যাঙ্কের লেনদেনগুলিকে আপনার আর্থিক ব্যবস্থার নিরীক্ষণ করার অনুমতি দিন৷';

  @override
  String get idioma => 'ভাষা';

  @override
  String get moeda => 'মুদ্রা';

  @override
  String get compararInvestimentos => 'বিনিয়োগ তুলনা করুন';

  @override
  String get descricaoLocalizacao =>
      'স্থানীয় বিনিয়োগ (CDB/CDI) আন্তর্জাতিক হারের সাথে তুলনা করতে, আমাদের আপনার অবস্থান প্রয়োজন।';

  @override
  String get permissaoLocalizacaoNecessaria => 'অবস্থানের অনুমতি প্রয়োজন';

  @override
  String get rendaFixa => 'ফিক্সড ইনকাম';

  @override
  String get rendaVariavel => 'পরিবর্তনশীল আয়';

  @override
  String get tesouroDireto => 'ট্রেজারি ডাইরেক্ট';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'স্টক';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'ক্রিপ্টোকারেন্সি';

  @override
  String get rendimento => 'রিটার্ন';

  @override
  String get rentabilidade => 'লাভজনকতা';

  @override
  String get aplicar => 'আবেদন করুন';

  @override
  String get resgatar => 'রিডিম করুন';

  @override
  String get simular => 'অনুকরণ';

  @override
  String get metas => 'লক্ষ্য';

  @override
  String get estrategias => 'কৌশল';

  @override
  String get conhecimento => 'জ্ঞান';

  @override
  String get chat => 'চ্যাট';

  @override
  String get enviarMensagem => 'বার্তা পাঠান';

  @override
  String get digiteMensagem => 'একটি বার্তা টাইপ করুন...';

  @override
  String get alertaGastos => 'খরচের সতর্কতা';

  @override
  String alertaGastosMsg(int percent) {
    return 'আপনি ইতিমধ্যেই আপনার ক্রেডিট সীমার $percent% ব্যবহার করেছেন।';
  }

  @override
  String get fechamentoFatura => 'চালান বন্ধ';

  @override
  String get fechamentoFaturaMsg =>
      'আগামীকাল বন্ধের দিন। ব্যয় পর্যালোচনা করার জন্য দুর্দান্ত সময়।';

  @override
  String get faturaVencendo => 'চালান বাকি';

  @override
  String faturaVencendoMsg(int dias) {
    return 'ইনভয়েস $dias দিনের মধ্যে দিতে হবে। আপনার ব্যালেন্স চেক করুন.';
  }

  @override
  String get regra30 => 'টিপ: 30% নিয়ম';

  @override
  String get regra30Msg =>
      'আপনার ক্রেডিট স্কোর উন্নত করতে 30% এর নিচে ব্যবহার রাখুন।';

  @override
  String get diaDeOuro => 'গোল্ডেন ডে!';

  @override
  String get diaDeOuroMsg =>
      'আপনার আজকের কেনাকাটা শুধুমাত্র 40 দিনের মধ্যে পরিশোধ করা হবে!';

  @override
  String get alertaJuros => 'সতর্কতা: আগ্রহ';

  @override
  String get alertaJurosMsg =>
      'আপনার ব্যালেন্স বিলটি কভার করে না। ঘূর্ণায়মান ক্রেডিট এড়িয়ে চলুন!';

  @override
  String get notaSaude => 'আর্থিক স্বাস্থ্য';

  @override
  String get notaExcelente => 'চমৎকার! আপনি মহান আর্থিক স্বাস্থ্য আছে.';

  @override
  String get notaBom => 'ভাল, কিন্তু উন্নতি করতে পারে।';

  @override
  String get notaAtencao => 'খরচে মনোযোগ দিন।';

  @override
  String get notaRevisar => 'আপনার আর্থিক পর্যালোচনা করুন।';

  @override
  String get mentorInsightTitle => 'পরামর্শদাতা নির্দেশিকা';

  @override
  String get mentorInsightLoading => 'বাজার ডেটা আনা হচ্ছে...';

  @override
  String get mentorInsightError =>
      'এই মুহূর্তে ডেটা লোড করা যায়নি৷ শীঘ্রই আবার চেষ্টা করুন.';

  @override
  String get mentorInsightOffline =>
      'আপনি অফলাইনে আছেন। উদ্ধৃতি এবং পরামর্শদাতার অন্তর্দৃষ্টি আনতে সংযোগ করুন।';

  @override
  String get mentorAllocationDefensive =>
      'বর্তমান অস্থিরতার প্রেক্ষিতে, রিটার্ন অনুসরণ করার আগে মূলধন সংরক্ষণ এবং তারল্যকে অগ্রাধিকার দিন।';

  @override
  String get mentorAllocationBalanced =>
      'ভারসাম্য সুরক্ষা এবং বৃদ্ধি: বৈচিত্র্য আনুন এবং আপনার লক্ষ্য দিগন্ত পুনরায় দেখুন।';

  @override
  String get mentorAllocationOffensive =>
      'আপনার প্রোফাইল আরও ঝুঁকির অনুমতি দেয়: সুশৃঙ্খল থাকুন এবং ভারী ঘনত্ব এড়ান।';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'চিহ্নগুলি পর্যালোচনা করা হয়েছে: $symbols';
  }

  @override
  String get currencyFollowLocale => 'স্বয়ংক্রিয় (ভাষা)';

  @override
  String get compoundCalculatorTitle => 'মেন্টর ক্যালকুলেটর — চক্রবৃদ্ধি সুদ';

  @override
  String get compoundCalculatorSubtitle =>
      'অনুকরণ অবদান, নামমাত্র বনাম বাস্তব লাভ (স্ফীতির পরে), এবং পরামর্শদাতা নোট।';

  @override
  String get compoundInitialLabel => 'প্রাথমিক একক যোগফল';

  @override
  String get compoundMonthlyLabel => 'মাসিক অবদান';

  @override
  String get compoundRateLabel => 'সুদের হার';

  @override
  String get compoundRateAnnual => 'প্রতি বছর';

  @override
  String get compoundRateMonthly => 'প্রতি মাসে';

  @override
  String get compoundHorizonLabel => 'সময় দিগন্ত';

  @override
  String get compoundHorizonYears => 'বছর';

  @override
  String get compoundHorizonMonths => 'মাস';

  @override
  String get compoundInflationLabel => 'আনুমানিক মুদ্রাস্ফীতি (প্রতি বছর %)';

  @override
  String get compoundCalculate => 'গণনা করুন';

  @override
  String get compoundChartInvested => 'মোট বিনিয়োগ';

  @override
  String get compoundChartInterest => 'সুদ অর্জিত হয়েছে';

  @override
  String get compoundSummaryNominalEnd => 'শেষ ব্যালেন্স (নামমাত্র)';

  @override
  String get compoundSummaryRealGain => 'প্রকৃত লাভ (ক্রয় ক্ষমতা)';

  @override
  String get compoundMentorCardTitle => 'পরামর্শদাতা';

  @override
  String get compoundInvalidInput => 'বৈধ মান লিখুন (দিগন্ত > 0)।';

  @override
  String get userPersonaSectionTitle => 'মেন্টর টোন';

  @override
  String get userPersonaNovice => 'শিক্ষানবিস';

  @override
  String get userPersonaStrategist => 'কৌশলবিদ';

  @override
  String get userPersonaRiskTaker => 'ঝুঁকি গ্রহণকারী';

  @override
  String get userPersonaConservative => 'সেভার';

  @override
  String get compoundOpenFullInsight =>
      'সম্পূর্ণ পরামর্শদাতা অন্তর্দৃষ্টি খুলুন';

  @override
  String get investFirstSteps_title => 'প্রথম ধাপ';

  @override
  String get investFirstSteps_brokerTitle => 'একটি ব্রোকার বেছে নিন';

  @override
  String get investFirstSteps_brokerBody =>
      'নিয়ন্ত্রিত, স্বনামধন্য প্রতিষ্ঠানের জন্য দেখুন। একটি অ্যাকাউন্ট খোলার আগে ফি, পণ্য এবং নির্ভরযোগ্যতার তুলনা করুন।';

  @override
  String get investFirstSteps_openAccountTitle => 'আপনার অ্যাকাউন্ট খুলুন';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'ডিজিটাল অনবোর্ডিং। ব্রাজিলে, আপনার সাধারণত CPF/RG এবং কখনও কখনও ঠিকানার প্রমাণের প্রয়োজন হয়।';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'ডিজিটাল অনবোর্ডিং দেশ অনুসারে পরিবর্তিত হয়। সাধারণত আপনার একটি আইডি ডকুমেন্ট এবং পরিচয়/ঠিকানা যাচাইকরণ প্রয়োজন।';

  @override
  String get investFirstSteps_transferTitle => 'তহবিল স্থানান্তর';

  @override
  String get investFirstSteps_transferBodyBr =>
      'আপনার ব্রোকারকে PIX বা ব্যাঙ্ক ট্রান্সফারের মাধ্যমে টাকা পাঠান। ব্যালেন্স বিনিয়োগের জন্য উপলব্ধ হয়ে যায়।';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'ব্যাঙ্ক ট্রান্সফার বা স্থানীয় অর্থপ্রদানের পদ্ধতির মাধ্যমে তহবিল স্থানান্তর করুন (আপনার দেশের উপর নির্ভর করে)। ব্যালেন্স বিনিয়োগের জন্য উপলব্ধ হয়ে যায়।';

  @override
  String get investFirstSteps_riskProfileTitle => 'আপনার ঝুঁকি প্রোফাইল জানুন';

  @override
  String get investFirstSteps_riskProfileBody =>
      'একটি উপযুক্ততা প্রশ্নাবলীর উত্তর দিন। আপনি রক্ষণশীল, মধ্যপন্থী বা আক্রমণাত্মক কিনা তা বুঝুন।';

  @override
  String get investFirstSteps_firstAssetTitle => 'আপনার প্রথম সম্পদ কিনুন';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'একটি জরুরি তহবিল দিয়ে শুরু করুন (Tesouro Selic বা একটি দৈনিক-তরলতা CDB)। তারপর ধীরে ধীরে বৈচিত্র্য আনুন।';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'একটি জরুরি তহবিল দিয়ে শুরু করুন (উচ্চ-ফলন নগদ, মানি মার্কেট ফান্ড, বা স্বল্পমেয়াদী ট্রেজারি বন্ড)। তারপর ধীরে ধীরে বৈচিত্র্য আনুন।';

  @override
  String get investFirstSteps_tipTitle => 'মেন্টর টিপ:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'ছোট শুরু করুন, ধারাবাহিকভাবে বিনিয়োগ করুন এবং বাজারকে সময় দেওয়ার চেষ্টা এড়িয়ে চলুন। সময় আপনার সেরা মিত্র।';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'ছোট শুরু করুন, ধারাবাহিকভাবে বিনিয়োগ করুন এবং বাজারকে সময় দেওয়ার চেষ্টা এড়িয়ে চলুন। সময় আপনার সেরা মিত্র।';

  @override
  String get investMenu_tesouroTitle => 'ব্রাজিলিয়ান ট্রেজারি';

  @override
  String get investMenu_cdbTitle => 'ব্যাংক স্থায়ী আয় (CDB)';

  @override
  String get investMenu_etfsTitle => 'আন্তর্জাতিক ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (সূচক)';

  @override
  String get investMenu_stocksTitle => 'স্টক';

  @override
  String get investMenu_fundsTitle => 'তহবিল';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'আন্তর্জাতিক';

  @override
  String get investMenu_cryptoTitle => 'ক্রিপ্টো';

  @override
  String get investRegisterCta => 'বিনিয়োগ নিবন্ধন করুন';

  @override
  String investRegionHintBr(String country) {
    return 'কার্যকরী দেশ: $country · ব্রাজিল ক্যাটালগ (ট্রেজারি, CDB, LCA…)।';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'কার্যকর দেশ: $country · গ্লোবাল ক্যাটালগ (ETFs, NYSE/NASDAQ…)। আপনার ডিভাইস অঞ্চল থেকে স্বয়ংক্রিয়ভাবে সামঞ্জস্য.';
  }

  @override
  String get strategy_sectionCoreTitle => 'অপরিহার্য কৌশল';

  @override
  String get strategy_sectionDeepDiveTitle => 'ডিপ ডাইভ (প্রিমিয়াম)';

  @override
  String get strategy_emergencyFundTitle => 'জরুরী তহবিল';

  @override
  String get strategy_emergencyFundBodyBr =>
      'আপনার আর্থিক ঢাল। 6-12 মাসের খরচ কভার করুন। দৈনিক তারল্য এবং কম ঝুঁকি (যেমন, Tesouro Selic বা CDI-সংযুক্ত CDB) অগ্রাধিকার দিন।';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'আপনার আর্থিক ঢাল। 6-12 মাসের খরচ কভার করুন। দৈনিক তারল্য এবং কম ঝুঁকি (যেমন, মানি মার্কেট ফান্ড এবং স্বল্পমেয়াদী ট্রেজারি বন্ড) অগ্রাধিকার দিন।';

  @override
  String get strategy_buyHoldTitle => 'কিনুন এবং ধরে রাখুন';

  @override
  String get strategy_buyHoldBody =>
      'গুণমানের সম্পদ কিনুন এবং দীর্ঘমেয়াদে ধরে রাখুন। সময়ের সাথে শৃঙ্খলা, গুণমান এবং পুনঃবিনিয়োগের উপর ফোকাস করুন।';

  @override
  String get strategy_diversificationTitle => 'বৈচিত্র্য';

  @override
  String get strategy_diversificationBodyBr =>
      'আপনার মূলধন স্থির আয়, স্টক, এফআইআই এবং আন্তর্জাতিক সম্পদে ছড়িয়ে দিন ঝুঁকি কমাতে এবং ঝুঁকি-সামঞ্জস্যপূর্ণ রিটার্ন উন্নত করতে।';

  @override
  String get strategy_diversificationBodyGlobal =>
      'ঝুঁকি কমাতে এবং ঝুঁকি-সামঞ্জস্যপূর্ণ রিটার্ন উন্নত করতে বন্ড, স্টক, REIT এবং আন্তর্জাতিক এক্সপোজার জুড়ে আপনার মূলধন ছড়িয়ে দিন।';

  @override
  String get strategy_dcaTitle => 'ডলার-কস্ট এভারেজিং (DCA)';

  @override
  String get strategy_dcaBody =>
      'ধারাবাহিকতা প্রতিভাকে হারায়। নিখুঁত এন্ট্রি পয়েন্ট বাছাই করার চেষ্টা করার চেয়ে প্রতি মাসে বিনিয়োগ করা প্রায়শই বেশি কার্যকর।';

  @override
  String get strategy_smartGoalsTitle => 'স্মার্ট লক্ষ্য';

  @override
  String get strategy_smartGoalsBody =>
      'আপনার লক্ষ্যগুলি সুনির্দিষ্ট, পরিমাপযোগ্য, অর্জনযোগ্য, প্রাসঙ্গিক এবং সময়সীমাবদ্ধ হওয়া উচিত।';

  @override
  String get strategy_503020Title => '50-30-20 নিয়ম';

  @override
  String get strategy_503020Body =>
      'একটি সাধারণ বাজেট কাঠামো: 50% প্রয়োজন, 30% চায়, 20% বিনিয়োগ এবং লক্ষ্য।';

  @override
  String get strategy_deepDive_allocationTitle => 'সম্পদ বরাদ্দ (উন্নত)';

  @override
  String get strategy_deepDive_allocationBody =>
      'লক্ষ্য এবং দিগন্ত, ঝুঁকি সামঞ্জস্য, পারস্পরিক সম্পর্ক এবং পুনরায় ভারসাম্য বজায় রেখে কীভাবে একটি বরাদ্দ তৈরি করতে হয় তা শিখুন।';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'গ্লোবাল ইটিএফ এবং সূচক (উন্নত)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'বৈশ্বিক সূচক (যেমন, S&P 500), ETF, এবং কীভাবে শৃঙ্খলার সাথে আন্তর্জাতিক এক্সপোজার তৈরি করা যায় সে সম্পর্কে জানুন।';

  @override
  String get strategy_deepDive_taxesTitle => 'ট্যাক্স এবং রিপোর্টিং (উন্নত)';

  @override
  String get strategy_deepDive_taxesBody =>
      'মূল ট্যাক্স ধারণা এবং নিরাপদে বিনিয়োগের রিপোর্ট করার জন্য কীভাবে রেকর্ড রাখতে হয় তা বুঝুন।';

  @override
  String get strategy_premiumLockedBody =>
      'প্রিমিয়াম সামগ্রী। বিনিয়োগ ডিপ ডাইভ আনলক করতে একটি সাইবার/গ্রিম/হাইভ থিম সক্রিয় করুন।';

  @override
  String get homeShowcaseTitle => 'শোকেস';

  @override
  String get homeShowcaseProfileSimTitle => 'ঝুঁকি প্রোফাইল কুইজ';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'কয়েক মিনিটের মধ্যে আপনার বিনিয়োগকারী প্রোফাইল খুঁজুন।';

  @override
  String get homeShowcaseStrategiesTitle => 'প্রস্তাবিত কৌশল';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'কৌশল শিখতে এবং প্রয়োগ করার জন্য সরাসরি শর্টকাট।';

  @override
  String get homeShowcaseMentorHubTitle => 'পরামর্শদাতা: কুইজ এবং কৌশল';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'ঝুঁকি প্রোফাইল কুইজ এবং প্রস্তাবিত কৌশলগুলিতে দ্রুত অ্যাক্সেস।';

  @override
  String get homeTourStepClassicTitle => 'ক্লাসিক মোড';

  @override
  String get homeTourStepClassicBody =>
      'আসল অ্যাপ প্যানেল খোলে: পরিচিত লেআউটে লেনদেন, লক্ষ্য, বিনিয়োগ এবং সেটিংস।';

  @override
  String get homeTourStepVitrineTitle => 'শোকেস এলাকা';

  @override
  String get homeTourStepVitrineBody =>
      'শেখার এবং অনুশীলন করার শর্টকাট: বিনিয়োগকারীর প্রোফাইল, কৌশল এবং মেন্টর হাব।';

  @override
  String get homeTourStepProfileTitle => 'প্রোফাইল কুইজ';

  @override
  String get homeTourStepProfileBody =>
      'আপনার ঝুঁকির প্রোফাইল আবিষ্কার করতে এবং সারিবদ্ধ পরামর্শগুলি দেখতে প্রশ্নাবলীর উত্তর দিন।';

  @override
  String get homeTourStepStrategiesTitle => 'কৌশল';

  @override
  String get homeTourStepStrategiesBody =>
      'অর্থ সংগঠিত করতে, শৃঙ্খলার সাথে বিনিয়োগ করতে এবং সাধারণ সমস্যাগুলি এড়াতে সামগ্রী।';

  @override
  String get homeTourStepHubTitle => 'মেন্টর হাব';

  @override
  String get homeTourStepHubBody =>
      'প্রোফাইল কুইজের দ্রুত মেনু এবং প্রস্তাবিত কৌশল।';

  @override
  String get homeTourStepPremiumTitle => 'প্রিমিয়াম বৈশিষ্ট্য';

  @override
  String get homeTourStepPremiumBody =>
      'অটো মেন্টরিং, উন্নত চার্ট এবং মাসিক রিপোর্ট — একটি প্রিমিয়াম সাবস্ক্রিপশন সহ উপলব্ধ৷';

  @override
  String get homeTourStepMarketTitle => 'মার্কেট স্ন্যাপশট';

  @override
  String get homeTourStepMarketBody =>
      'মার্কেট প্রেক্ষাপট (ব্রাজিল বা গ্লোবাল) আপনার অঞ্চল এবং রূপান্তরিত নেট মূল্যের উপর ভিত্তি করে।';

  @override
  String get homeTourStepCalculatorTitle => 'মেন্টর ক্যালকুলেটর';

  @override
  String get homeTourStepCalculatorBody =>
      'চক্রবৃদ্ধি সুদ, মুদ্রাস্ফীতি অনুকরণ করুন এবং সম্পদের চার্ট দেখুন; পরবর্তী আমরা এই টুল খুলি।';

  @override
  String get quizProfile_title => 'ঝুঁকি প্রোফাইল কুইজ';

  @override
  String quizProfile_progress(int current, int total) {
    return 'প্রশ্ন $total এর মধ্যে $current';
  }

  @override
  String get quizProfile_badge => 'ঝুঁকি প্রোফাইল কুইজ';

  @override
  String get quizProfile_resultTitle => 'আপনার প্রোফাইল';

  @override
  String get quizProfile_idealInvestmentsTitle => 'আদর্শ বিনিয়োগ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'অন্বেষণ বিনিয়োগ';

  @override
  String get quizProfile_exit => 'প্রস্থান করুন';

  @override
  String get quizKnowledge_title => 'জ্ঞান কুইজ';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'প্রশ্ন $total এর মধ্যে $current';
  }
}

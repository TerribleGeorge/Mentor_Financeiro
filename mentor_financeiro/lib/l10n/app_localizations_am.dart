// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'አማካሪ ፋይናንስ';

  @override
  String get saldo => 'ሚዛን';

  @override
  String get gastosDiarios => 'ዕለታዊ ወጪዎች';

  @override
  String get confirmarTransacao => 'ግብይት ያረጋግጡ';

  @override
  String get extrato => 'መግለጫ';

  @override
  String get transferencias => 'ዝውውሮች';

  @override
  String get investimentos => 'ኢንቨስትመንት';

  @override
  String get configuracoes => 'ቅንብሮች';

  @override
  String get perfil => 'መገለጫ';

  @override
  String get sair => 'ውጣ';

  @override
  String get entrar => 'መግቢያ';

  @override
  String get cadastrar => 'ይመዝገቡ';

  @override
  String get email => 'ኢሜይል';

  @override
  String get senha => 'የይለፍ ቃል';

  @override
  String get nome => 'ስም';

  @override
  String get cpf => 'መታወቂያ ቁጥር';

  @override
  String get telefone => 'ስልክ';

  @override
  String get continuar => 'ቀጥል';

  @override
  String get voltar => 'ተመለስ';

  @override
  String get cancelar => 'ሰርዝ';

  @override
  String get salvar => 'አስቀምጥ';

  @override
  String get editar => 'አርትዕ';

  @override
  String get excluir => 'ሰርዝ';

  @override
  String get sucesso => 'ስኬት';

  @override
  String get erro => 'ስህተት';

  @override
  String get carregando => 'በመጫን ላይ...';

  @override
  String get semDados => 'ምንም ውሂብ የለም።';

  @override
  String get tentarNovamente => 'እንደገና ይሞክሩ';

  @override
  String get relatorios => 'ሪፖርቶች';

  @override
  String get gastosPorCategoria => 'ወጪዎች በምድብ';

  @override
  String get ultimosSeteDias => 'የመጨረሻዎቹ 7 ቀናት';

  @override
  String get totalGasto => 'ጠቅላላ ወጪ';

  @override
  String get transacoes => 'ግብይቶች';

  @override
  String get categoria => 'ምድብ';

  @override
  String get data => 'ቀን';

  @override
  String get valor => 'ዋጋ';

  @override
  String get descricao => 'መግለጫ';

  @override
  String get alimentacao => 'ምግብ';

  @override
  String get transporte => 'ትራንስፖርት';

  @override
  String get lazer => 'መዝናኛ';

  @override
  String get saude => 'ጤና';

  @override
  String get outros => 'ሌሎች\nየ';

  @override
  String get notificacoes => 'ማሳወቂያዎች';

  @override
  String get permissaoNotificacoes => 'የማሳወቂያ ፍቃድ';

  @override
  String get ativarMonitoramento => 'የወጪ ክትትልን አንቃ';

  @override
  String get descricaoMonitoramento =>
      'መተግበሪያው የእርስዎን ፋይናንስ ለማደራጀት የእርስዎን የባንክ ግብይቶች በራስ-ሰር እንዲከታተል ይፍቀዱለት።';

  @override
  String get idioma => 'ቋንቋ';

  @override
  String get moeda => 'ምንዛሬ';

  @override
  String get compararInvestimentos => 'ኢንቨስትመንቶችን አወዳድር';

  @override
  String get descricaoLocalizacao =>
      'የአገር ውስጥ ኢንቨስትመንቶችን (ሲዲቢ/ሲዲአይ) ከዓለም አቀፍ ተመኖች ጋር ለማነፃፀር፣ ያለዎትን ቦታ እንፈልጋለን።';

  @override
  String get permissaoLocalizacaoNecessaria => 'የአካባቢ ፍቃድ ያስፈልጋል';

  @override
  String get rendaFixa => 'ቋሚ ገቢ';

  @override
  String get rendaVariavel => 'ተለዋዋጭ ገቢ';

  @override
  String get tesouroDireto => 'የግምጃ ቤት ዳይሬክት';

  @override
  String get cdb => 'ሲዲቢ';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'አክሲዮኖች';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'ክሪፕቶ ምንዛሬዎች';

  @override
  String get rendimento => 'መመለስ';

  @override
  String get rentabilidade => 'ትርፋማነት';

  @override
  String get aplicar => 'ያመልክቱ';

  @override
  String get resgatar => 'ማስመለስ';

  @override
  String get simular => 'አስመሳይ';

  @override
  String get metas => 'ግቦች';

  @override
  String get estrategias => 'ስልቶች';

  @override
  String get conhecimento => 'እውቀት';

  @override
  String get chat => 'ውይይት';

  @override
  String get enviarMensagem => 'መልእክት ላክ';

  @override
  String get digiteMensagem => 'መልዕክት ይተይቡ...';

  @override
  String get alertaGastos => 'የወጪ ማንቂያ';

  @override
  String alertaGastosMsg(int percent) {
    return 'አስቀድመው የክሬዲት ገደብዎን $percent% ተጠቅመዋል።';
  }

  @override
  String get fechamentoFatura => 'የክፍያ መጠየቂያ መዝጊያ';

  @override
  String get fechamentoFaturaMsg => 'ነገ የሚዘጋበት ቀን ነው። ወጪዎችን ለመገምገም በጣም ጥሩ ጊዜ።';

  @override
  String get faturaVencendo => 'የክፍያ መጠየቂያ ዋጋ';

  @override
  String faturaVencendoMsg(int dias) {
    return 'ደረሰኝ በ$dias ቀን(ዎች) ውስጥ ይገባል። ቀሪ ሂሳብዎን ያረጋግጡ።';
  }

  @override
  String get regra30 => 'ጠቃሚ ምክር: 30% ደንብ';

  @override
  String get regra30Msg => 'የክሬዲት ነጥብዎን ለማሻሻል አጠቃቀሙን ከ30% በታች ያድርጉት።';

  @override
  String get diaDeOuro => 'ወርቃማው ቀን!';

  @override
  String get diaDeOuroMsg => 'የዛሬ ግዢዎችዎ የሚከፈሉት በ 40 ቀናት ውስጥ ብቻ ነው!';

  @override
  String get alertaJuros => 'ማስጠንቀቂያ: ፍላጎት';

  @override
  String get alertaJurosMsg => 'ቀሪ ሒሳብዎ ሂሳቡን አይሸፍነውም። ተዘዋዋሪ ብድርን ያስወግዱ!';

  @override
  String get notaSaude => 'የፋይናንስ ጤና';

  @override
  String get notaExcelente => 'በጣም ጥሩ! ጥሩ የፋይናንስ ጤንነት አለዎት።';

  @override
  String get notaBom => 'ጥሩ፣ ግን ማሻሻል ይችላል።';

  @override
  String get notaAtencao => 'ወጪ ትኩረት.';

  @override
  String get notaRevisar => 'የእርስዎን ፋይናንስ ይገምግሙ።';

  @override
  String get mentorInsightTitle => 'አማካሪ መመሪያ';

  @override
  String get mentorInsightLoading => 'የገበያ ውሂብ በማምጣት ላይ…';

  @override
  String get mentorInsightError => 'አሁን ውሂብ መጫን አልተቻለም። ትንሽ ቆይተው እንደገና ይሞክሩ።';

  @override
  String get mentorInsightOffline =>
      'ከመስመር ውጭ ነዎት። ጥቅሶችን እና የአማካሪ ግንዛቤዎችን ለማምጣት ይገናኙ።';

  @override
  String get mentorAllocationDefensive =>
      'አሁን ካለው ተለዋዋጭነት አንጻር፣ ተመላሾችን ከማሳደድዎ በፊት ለካፒታል ጥበቃ እና ለገንዘብ መጠን ቅድሚያ ይስጡ።';

  @override
  String get mentorAllocationBalanced =>
      'ሚዛን ጥበቃ እና እድገት፡ የተለያዩ እና የግብ አድማስዎን እንደገና ይጎብኙ።';

  @override
  String get mentorAllocationOffensive =>
      'መገለጫዎ የበለጠ አደጋን ይፈቅዳል፡ በሥርዓት ይቆዩ እና ከፍተኛ ትኩረትን ያስወግዱ።\nየ';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'ምልክቶች ተገምግመዋል፡ $symbols';
  }

  @override
  String get currencyFollowLocale => 'አውቶማቲክ (ቋንቋ)';

  @override
  String get compoundCalculatorTitle => 'አማካሪ ካልኩሌተር - ውሁድ ፍላጎት';

  @override
  String get compoundCalculatorSubtitle =>
      'አስተዋፅዖዎችን አስመስሎ፣ ስም እና እውነተኛ ትርፍ (ከዋጋ ግሽበት በኋላ) እና የአማካሪ ማስታወሻዎች።';

  @override
  String get compoundInitialLabel => 'የመጀመሪያ ጥቅል ድምር';

  @override
  String get compoundMonthlyLabel => 'ወርሃዊ መዋጮ';

  @override
  String get compoundRateLabel => 'የወለድ መጠን';

  @override
  String get compoundRateAnnual => 'በዓመት';

  @override
  String get compoundRateMonthly => 'በወር';

  @override
  String get compoundHorizonLabel => 'የጊዜ አድማስ';

  @override
  String get compoundHorizonYears => 'ዓመታት';

  @override
  String get compoundHorizonMonths => 'ወራት';

  @override
  String get compoundInflationLabel => 'የሚገመተው የዋጋ ግሽበት (በዓመት%)';

  @override
  String get compoundCalculate => 'አስላ';

  @override
  String get compoundChartInvested => 'ጠቅላላ ኢንቨስት ተደርጓል';

  @override
  String get compoundChartInterest => 'ወለድ አግኝቷል';

  @override
  String get compoundSummaryNominalEnd => 'ማለቂያ ሚዛን (ስም)';

  @override
  String get compoundSummaryRealGain => 'እውነተኛ ትርፍ (የግዢ ኃይል)';

  @override
  String get compoundMentorCardTitle => 'አማካሪ ምክር';

  @override
  String get compoundInvalidInput => 'ትክክለኛ እሴቶችን አስገባ (አድማስ > 0)።';

  @override
  String get userPersonaSectionTitle => 'አማካሪ ቃና';

  @override
  String get userPersonaNovice => 'ጀማሪ';

  @override
  String get userPersonaStrategist => 'ስትራቴጂስት';

  @override
  String get userPersonaRiskTaker => 'አደጋ-ተቀባይ';

  @override
  String get userPersonaConservative => 'ቆጣቢ';

  @override
  String get compoundOpenFullInsight => 'የሙሉ አማካሪ ግንዛቤን ይክፈቱ';

  @override
  String get investFirstSteps_title => 'የመጀመሪያ ደረጃዎች';

  @override
  String get investFirstSteps_brokerTitle => 'ደላላ ይምረጡ';

  @override
  String get investFirstSteps_brokerBody =>
      'በቁጥጥር ስር ያሉ እና ታዋቂ ተቋማትን ይፈልጉ። መለያ ከመክፈትዎ በፊት ክፍያዎችን፣ ምርቶችን እና አስተማማኝነትን ያወዳድሩ።';

  @override
  String get investFirstSteps_openAccountTitle => 'መለያዎን ይክፈቱ';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'ዲጂታል ተሳፍሮ. በብራዚል፣ በተለምዶ CPF/RG እና አንዳንድ ጊዜ የአድራሻ ማረጋገጫ ያስፈልግዎታል።';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'ዲጂታል መሳፈር በአገር ይለያያል። በተለምዶ የመታወቂያ ሰነድ እና የማንነት/የአድራሻ ማረጋገጫ ያስፈልግዎታል።';

  @override
  String get investFirstSteps_transferTitle => 'የገንዘብ ልውውጥ';

  @override
  String get investFirstSteps_transferBodyBr =>
      'ገንዘብን በPIX ወይም በባንክ ማስተላለፍ ወደ ደላላዎ ይላኩ። ሚዛኑ ለመዋዕለ ንዋይ የሚገኝ ይሆናል።';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'ገንዘቦችን በባንክ ማስተላለፍ ወይም በአገር ውስጥ የመክፈያ ዘዴዎች ያስተላልፉ (እንደ ሀገርዎ ይወሰናል)። ሚዛኑ ለመዋዕለ ንዋይ የሚገኝ ይሆናል።';

  @override
  String get investFirstSteps_riskProfileTitle => 'የእርስዎን የአደጋ መገለጫ ይወቁ';

  @override
  String get investFirstSteps_riskProfileBody =>
      'ተስማሚነት መጠይቅን ይመልሱ። ወግ አጥባቂ፣ መካከለኛ ወይም ጠበኛ መሆንዎን ይረዱ።';

  @override
  String get investFirstSteps_firstAssetTitle => 'የመጀመሪያውን ንብረትዎን ይግዙ';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'በድንገተኛ ፈንድ (Tesouro Selic ወይም ዕለታዊ-ፈሳሽ ሲዲቢ) ይጀምሩ። ከዚያ ቀስ በቀስ ይለያዩ.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'በአደጋ ጊዜ ፈንድ (ከፍተኛ ገቢ ያለው ጥሬ ገንዘብ፣ የገንዘብ ገበያ ፈንድ ወይም የአጭር ጊዜ የግምጃ ቤት ቦንዶች) ይጀምሩ። ከዚያ ቀስ በቀስ ይለያዩ.';

  @override
  String get investFirstSteps_tipTitle => 'አማካሪ ጠቃሚ ምክር፡';

  @override
  String get investFirstSteps_tipBodyBr =>
      'በትንሹ ጀምር፣ ያለማቋረጥ ኢንቨስት አድርግ፣ እና ገበያውን ጊዜ ለማስያዝ ከመሞከር ተቆጠብ። ጊዜ ምርጥ አጋርህ ነው።';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'በትንሹ ጀምር፣ ያለማቋረጥ ኢንቨስት አድርግ እና ገበያውን ጊዜ ለማስያዝ ከመሞከር ተቆጠብ። ጊዜ ምርጥ አጋርህ ነው።';

  @override
  String get investMenu_tesouroTitle => 'የብራዚል ግምጃ ቤቶች';

  @override
  String get investMenu_cdbTitle => 'ባንክ ቋሚ ገቢ (ሲዲቢ)';

  @override
  String get investMenu_etfsTitle => 'ዓለም አቀፍ ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (ኢንዴክስ)';

  @override
  String get investMenu_stocksTitle => 'አክሲዮኖች';

  @override
  String get investMenu_fundsTitle => 'ገንዘቦች';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'ኢንተርናሽናል';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'ኢንቨስትመንት ይመዝገቡ';

  @override
  String investRegionHintBr(String country) {
    return 'ውጤታማ አገር፡ $country · የብራዚል ካታሎግ (ግምጃ ቤቶች፣ ሲዲቢ፣ ኤልሲኤ…)።';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'ውጤታማ አገር፡ $country · ዓለም አቀፍ ካታሎግ (ETFs፣ NYSE/NASDAQ…)። ከመሣሪያዎ ክልል በራስ-ሰር ተስተካክሏል።';
  }

  @override
  String get strategy_sectionCoreTitle => 'አስፈላጊ ስልቶች';

  @override
  String get strategy_sectionDeepDiveTitle => 'ጥልቅ ዳይቭ (ፕሪሚየም)';

  @override
  String get strategy_emergencyFundTitle => 'የአደጋ ጊዜ ፈንድ';

  @override
  String get strategy_emergencyFundBodyBr =>
      'የእርስዎ የገንዘብ ጋሻ. ከ6-12 ወራት ወጪዎችን ይሸፍኑ. ለዕለታዊ ፈሳሽነት እና ለአነስተኛ ተጋላጭነት ቅድሚያ ይስጡ (ለምሳሌ፡ Tesouro Selic ወይም CDI-linked CDB)።';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'የእርስዎ የገንዘብ ጋሻ. ከ6-12 ወራት ወጪዎችን ይሸፍኑ. ለዕለታዊ ፈሳሽነት እና ለአነስተኛ ስጋት (ለምሳሌ የገንዘብ ገበያ ፈንድ እና የአጭር ጊዜ የግምጃ ቤት ቦንዶች) ቅድሚያ ይስጡ።';

  @override
  String get strategy_buyHoldTitle => 'ይግዙ እና ይያዙ';

  @override
  String get strategy_buyHoldBody =>
      'ጥራት ያላቸውን ንብረቶች ይግዙ እና ለረጅም ጊዜ ያቆዩ። በጊዜ ሂደት በዲሲፕሊን፣ በጥራት እና በድጋሚ ኢንቨስትመንት ላይ ያተኩሩ።';

  @override
  String get strategy_diversificationTitle => 'ዳይቨርሲፊኬሽን';

  @override
  String get strategy_diversificationBodyBr =>
      'አደጋን ለመቀነስ እና በአደጋ ላይ የተስተካከሉ ተመላሾችን ለማሻሻል ካፒታልዎን በቋሚ ገቢዎች፣ አክሲዮኖች፣ FIIs እና ዓለም አቀፍ ንብረቶች ላይ ያሰራጩ።';

  @override
  String get strategy_diversificationBodyGlobal =>
      'ካፒታልዎን በቦንዶች፣ አክሲዮኖች፣ REITs እና በአለም አቀፍ ተጋላጭነት ስጋትን ለመቀነስ እና በአደጋ የተስተካከሉ ምላሾችን ለማሻሻል ያሰራጩ።';

  @override
  String get strategy_dcaTitle => 'ዶላር-ወጪ (DCA)';

  @override
  String get strategy_dcaBody =>
      'ወጥነት ብልህነትን ያሸንፋል። በየወሩ መዋዕለ ንዋይ ማፍሰስ ትክክለኛውን የመግቢያ ነጥብ ለመምረጥ ከመሞከር የበለጠ ውጤታማ ነው.';

  @override
  String get strategy_smartGoalsTitle => 'SMART ግቦች';

  @override
  String get strategy_smartGoalsBody =>
      'የእርስዎ ግቦች የተወሰነ፣ የሚለካ፣ ሊደረስበት የሚችል፣ ተዛማጅነት ያለው እና በጊዜ የተገደበ መሆን አለበት።';

  @override
  String get strategy_503020Title => '50-30-20 ደንብ';

  @override
  String get strategy_503020Body =>
      'ቀላል የበጀት አወጣጥ ማዕቀፍ፡ 50% ፍላጎቶች፣ 30% ፍላጎቶች፣ 20% ኢንቨስት እና ግቦች።';

  @override
  String get strategy_deepDive_allocationTitle => 'የንብረት ምደባ (የላቀ)';

  @override
  String get strategy_deepDive_allocationBody =>
      'እንዴት በግብ እና በአድማስ አመዳደብ መገንባት፣ ስጋትን ማስተካከል እና ማመጣጠን እንደሚችሉ ይማሩ።';

  @override
  String get strategy_deepDive_globalEtfsTitle => 'Global ETFs እና ኢንዴክሶች (የላቀ)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'ስለ አለምአቀፍ ኢንዴክሶች (ለምሳሌ፡ S&P 500)፣ ETFs እና አለምአቀፍ ተጋላጭነትን በዲሲፕሊን እንዴት መገንባት እንደሚችሉ ይወቁ።';

  @override
  String get strategy_deepDive_taxesTitle => 'ግብሮች እና ሪፖርት ማድረግ (የላቀ)';

  @override
  String get strategy_deepDive_taxesBody =>
      'የዋና የታክስ ጽንሰ-ሀሳቦችን እና ኢንቨስትመንቶችን ደህንነቱ በተጠበቀ ሁኔታ ሪፖርት ለማድረግ መዝገቦችን እንዴት እንደሚይዝ ይረዱ።';

  @override
  String get strategy_premiumLockedBody =>
      'ፕሪሚየም ይዘት። ጥልቅ ዳይቭ ኢንቨስትመንቱን ለመክፈት የሳይበር/Grimm/Hive ጭብጥን ያግብሩ።';

  @override
  String get homeShowcaseTitle => 'ማሳያ';

  @override
  String get homeShowcaseProfileSimTitle => 'የአደጋ መገለጫ ጥያቄዎች';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'የእርስዎን ባለሀብት መገለጫ በጥቂት ደቂቃዎች ውስጥ ያግኙ።';

  @override
  String get homeShowcaseStrategiesTitle => 'የሚመከሩ ስልቶች\nስልቶችን ለመማር እና ለመተግበር';

  @override
  String get homeShowcaseStrategiesSubtitle => 'ቀጥተኛ አቋራጮች።';

  @override
  String get homeShowcaseMentorHubTitle => 'አማካሪ፡ ጥያቄዎች እና ስልቶች';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'ለአደጋ መገለጫ ጥያቄዎች እና የሚመከሩ ስልቶች ፈጣን መዳረሻ።';

  @override
  String get homeTourStepClassicTitle => 'ክላሲክ ሁነታ';

  @override
  String get homeTourStepClassicBody =>
      'የመጀመሪያውን የመተግበሪያ ፓነል ይከፍታል፡ ግብይቶች፣ ግቦች፣ ኢንቨስትመንቶች እና ቅንብሮች በሚታወቀው አቀማመጥ።';

  @override
  String get homeTourStepVitrineTitle => 'የማሳያ ቦታ';

  @override
  String get homeTourStepVitrineBody =>
      'ለመማር እና ለመለማመድ አቋራጭ መንገዶች፡የባለሀብቶች መገለጫ፣ስልቶች እና የመካሪ ማእከል።';

  @override
  String get homeTourStepProfileTitle => 'የመገለጫ ጥያቄዎች';

  @override
  String get homeTourStepProfileBody =>
      'የእርስዎን የአደጋ መገለጫ ለማግኘት እና የተጣጣሙ የአስተያየት ጥቆማዎችን ለማየት መጠይቁን ይመልሱ።';

  @override
  String get homeTourStepStrategiesTitle => 'ስልቶች';

  @override
  String get homeTourStepStrategiesBody =>
      'ይዘት ፋይናንስን ለማደራጀት፣ በዲሲፕሊን ኢንቨስት ለማድረግ እና የተለመዱ ወጥመዶችን ለማስወገድ።';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody => 'ፈጣን ምናሌ ወደ የመገለጫ ጥያቄዎች እና የሚመከሩ ስልቶች።';

  @override
  String get homeTourStepPremiumTitle => 'ፕሪሚየም ባህሪያት';

  @override
  String get homeTourStepPremiumBody =>
      'ራስ-አማካሪ፣ የላቁ ገበታዎች እና ወርሃዊ ሪፖርቶች - በፕሪሚየም ምዝገባ ይገኛል።';

  @override
  String get homeTourStepMarketTitle => 'የገበያ ቅጽበታዊ እይታ';

  @override
  String get homeTourStepMarketBody =>
      'የገበያ አውድ (ብራዚል ወይም ዓለም አቀፋዊ) በክልልዎ ላይ የተመሰረተ እና የተለወጠ የተጣራ ዋጋ።';

  @override
  String get homeTourStepCalculatorTitle => 'አማካሪ ማስያ';

  @override
  String get homeTourStepCalculatorBody =>
      'የውህደት ፍላጎትን፣ የዋጋ ግሽበትን አስመስሎ የሀብት ገበታውን ተመልከት። በመቀጠል ይህንን መሳሪያ እንከፍተዋለን.';

  @override
  String get quizProfile_title => 'የአደጋ መገለጫ ጥያቄዎች';

  @override
  String quizProfile_progress(int current, int total) {
    return 'ጥያቄ $current የ$total';
  }

  @override
  String get quizProfile_badge => 'ስጋት የመገለጫ ጥያቄ';

  @override
  String get quizProfile_resultTitle => 'የእርስዎ መገለጫ ነው።';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ተስማሚ ኢንቨስትመንቶች፡-';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ኢንቨስትመንቶችን ያስሱ';

  @override
  String get quizProfile_exit => 'ውጣ';

  @override
  String get quizKnowledge_title => 'የእውቀት ጥያቄዎች\nየ';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'ጥያቄ $current የ$total';
  }
}

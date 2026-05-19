// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'मेंटर फाइनेंस';

  @override
  String get saldo => 'बैलेंस';

  @override
  String get gastosDiarios => 'दैनिक व्यय';

  @override
  String get confirmarTransacao => 'लेनदेन की पुष्टि करें';

  @override
  String get extrato => 'वक्तव्य';

  @override
  String get transferencias => 'स्थानान्तरण';

  @override
  String get investimentos => 'निवेश';

  @override
  String get configuracoes => 'सेटिंग्स';

  @override
  String get perfil => 'प्रोफाइल';

  @override
  String get sair => 'लॉगआउट';

  @override
  String get entrar => 'लॉगिन';

  @override
  String get cadastrar => 'रजिस्टर करें';

  @override
  String get email => 'ईमेल';

  @override
  String get senha => 'पासवर्ड';

  @override
  String get nome => 'नाम';

  @override
  String get cpf => 'आईडी नंबर';

  @override
  String get telefone => 'फोन';

  @override
  String get continuar => 'जारी रखें';

  @override
  String get voltar => 'वापस';

  @override
  String get cancelar => 'रद्द करें';

  @override
  String get salvar => 'सहेजें';

  @override
  String get editar => 'संपादित करें';

  @override
  String get excluir => 'हटाएं';

  @override
  String get sucesso => 'सफलता';

  @override
  String get erro => 'त्रुटि';

  @override
  String get carregando => 'लोड हो रहा है...';

  @override
  String get semDados => 'कोई डेटा नहीं';

  @override
  String get tentarNovamente => 'पुनः प्रयास करें';

  @override
  String get relatorios => 'रिपोर्ट';

  @override
  String get gastosPorCategoria => 'श्रेणी के अनुसार व्यय';

  @override
  String get ultimosSeteDias => 'पिछले 7 दिन';

  @override
  String get totalGasto => 'कुल खर्च';

  @override
  String get transacoes => 'लेनदेन';

  @override
  String get categoria => 'श्रेणी';

  @override
  String get data => 'दिनांक';

  @override
  String get valor => 'मान';

  @override
  String get descricao => 'विवरण';

  @override
  String get alimentacao => 'भोजन';

  @override
  String get transporte => 'परिवहन';

  @override
  String get lazer => 'अवकाश';

  @override
  String get saude => 'स्वास्थ्य';

  @override
  String get outros => 'अन्य';

  @override
  String get notificacoes => 'सूचनाएं';

  @override
  String get permissaoNotificacoes => 'अधिसूचना अनुमति';

  @override
  String get ativarMonitoramento => 'व्यय निगरानी सक्षम करें';

  @override
  String get descricaoMonitoramento =>
      'ऐप को आपके वित्त को व्यवस्थित करने के लिए आपके बैंक लेनदेन की स्वचालित रूप से निगरानी करने की अनुमति दें।';

  @override
  String get idioma => 'भाषा';

  @override
  String get moeda => 'मुद्रा';

  @override
  String get compararInvestimentos => 'निवेश की तुलना करें';

  @override
  String get descricaoLocalizacao =>
      'स्थानीय निवेश (सीडीबी/सीडीआई) की अंतरराष्ट्रीय दरों से तुलना करने के लिए, हमें आपके स्थान की आवश्यकता है।';

  @override
  String get permissaoLocalizacaoNecessaria => 'स्थान अनुमति आवश्यक है';

  @override
  String get rendaFixa => 'निश्चित आय';

  @override
  String get rendaVariavel => 'परिवर्तनीय आय';

  @override
  String get tesouroDireto => 'ट्रेजरी डायरेक्ट';

  @override
  String get cdb => 'सीडीबी';

  @override
  String get lci => 'एलसीआई';

  @override
  String get lca => 'एलसीए';

  @override
  String get acoes => 'स्टॉक';

  @override
  String get fiis => 'एफआईआई';

  @override
  String get criptomoedas => 'क्रिप्टोकरेंसी';

  @override
  String get rendimento => 'वापसी';

  @override
  String get rentabilidade => 'लाभप्रदता';

  @override
  String get aplicar => 'आवेदन करें';

  @override
  String get resgatar => 'रिडीम';

  @override
  String get simular => 'अनुकरण';

  @override
  String get metas => 'लक्ष्य';

  @override
  String get estrategias => 'रणनीतियाँ';

  @override
  String get conhecimento => 'ज्ञान';

  @override
  String get chat => 'चैट';

  @override
  String get enviarMensagem => 'संदेश भेजें';

  @override
  String get digiteMensagem => 'एक संदेश टाइप करें...';

  @override
  String get alertaGastos => 'खर्च संबंधी चेतावनी';

  @override
  String alertaGastosMsg(int percent) {
    return 'आप पहले ही अपनी क्रेडिट सीमा का $percent% उपयोग कर चुके हैं।';
  }

  @override
  String get fechamentoFatura => 'चालान समापन';

  @override
  String get fechamentoFaturaMsg =>
      'कल समापन दिवस है। ख़र्चों की समीक्षा करने का बढ़िया समय है।';

  @override
  String get faturaVencendo => 'चालान देय';

  @override
  String faturaVencendoMsg(int dias) {
    return 'चालान $dias दिन में देय होगा। अपना बैलेंस जांचें.';
  }

  @override
  String get regra30 => 'टिप: 30% नियम';

  @override
  String get regra30Msg =>
      'अपने क्रेडिट स्कोर को बेहतर बनाने के लिए उपयोग को 30% से कम रखें।';

  @override
  String get diaDeOuro => 'स्वर्णिम दिन!';

  @override
  String get diaDeOuroMsg =>
      'आज आपकी खरीदारी का भुगतान केवल 40 दिनों में किया जाएगा!';

  @override
  String get alertaJuros => 'चेतावनी: रुचि';

  @override
  String get alertaJurosMsg =>
      'आपकी शेष राशि बिल को कवर नहीं करती है। परिक्रामी क्रेडिट से बचें!';

  @override
  String get notaSaude => 'वित्तीय स्वास्थ्य';

  @override
  String get notaExcelente => 'उत्कृष्ट! आपका वित्तीय स्वास्थ्य बहुत अच्छा है।';

  @override
  String get notaBom => 'अच्छा है, लेकिन सुधार किया जा सकता है।';

  @override
  String get notaAtencao => 'खर्च पर ध्यान दें।';

  @override
  String get notaRevisar => 'अपने वित्त की समीक्षा करें।';

  @override
  String get mentorInsightTitle => 'सलाहकार मार्गदर्शन';

  @override
  String get mentorInsightLoading => 'बाज़ार डेटा प्राप्त किया जा रहा है...';

  @override
  String get mentorInsightError =>
      'अभी डेटा लोड नहीं किया जा सका. शीघ्र ही पुनः प्रयास करें.';

  @override
  String get mentorInsightOffline =>
      'आप ऑफ़लाइन हैं। उद्धरण और मेंटर अंतर्दृष्टि प्राप्त करने के लिए कनेक्ट करें।';

  @override
  String get mentorAllocationDefensive =>
      'वर्तमान अस्थिरता को देखते हुए, रिटर्न का पीछा करने से पहले पूंजी संरक्षण और तरलता को प्राथमिकता दें।';

  @override
  String get mentorAllocationBalanced =>
      'संतुलन सुरक्षा और विकास: विविधता लाएं और अपने लक्ष्य क्षितिज पर दोबारा गौर करें।';

  @override
  String get mentorAllocationOffensive =>
      'आपकी प्रोफ़ाइल अधिक जोखिम की अनुमति देती है: अनुशासित रहें और भारी एकाग्रता से बचें।';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'प्रतीकों की समीक्षा की गई: $symbols';
  }

  @override
  String get currencyFollowLocale => 'स्वचालित (भाषा)';

  @override
  String get compoundCalculatorTitle => 'मेंटर कैलकुलेटर - चक्रवृद्धि ब्याज';

  @override
  String get compoundCalculatorSubtitle =>
      'योगदान, नाममात्र बनाम वास्तविक लाभ (मुद्रास्फीति के बाद), और सलाहकार नोट्स का अनुकरण करें।';

  @override
  String get compoundInitialLabel => 'प्रारंभिक एकमुश्त राशि';

  @override
  String get compoundMonthlyLabel => 'मासिक योगदान';

  @override
  String get compoundRateLabel => 'ब्याज दर';

  @override
  String get compoundRateAnnual => 'प्रति वर्ष';

  @override
  String get compoundRateMonthly => 'प्रति माह';

  @override
  String get compoundHorizonLabel => 'समय क्षितिज';

  @override
  String get compoundHorizonYears => 'वर्ष';

  @override
  String get compoundHorizonMonths => 'महीने';

  @override
  String get compoundInflationLabel => 'अनुमानित मुद्रास्फीति (प्रति वर्ष%)';

  @override
  String get compoundCalculate => 'गणना करें';

  @override
  String get compoundChartInvested => 'कुल निवेश';

  @override
  String get compoundChartInterest => 'अर्जित ब्याज';

  @override
  String get compoundSummaryNominalEnd => 'समाप्ति शेष (नाममात्र)';

  @override
  String get compoundSummaryRealGain => 'वास्तविक लाभ (क्रय शक्ति)';

  @override
  String get compoundMentorCardTitle => 'Mentor advice';

  @override
  String get compoundInvalidInput => 'मान्य मान दर्ज करें (क्षितिज > 0)।';

  @override
  String get userPersonaSectionTitle => 'मेंटर टोन';

  @override
  String get userPersonaNovice => 'शुरुआती';

  @override
  String get userPersonaStrategist => 'रणनीतिकार';

  @override
  String get userPersonaRiskTaker => 'जोखिम लेने वाला';

  @override
  String get userPersonaConservative => 'सेवर';

  @override
  String get compoundOpenFullInsight => 'पूर्ण सलाहकार अंतर्दृष्टि खोलें';

  @override
  String get investFirstSteps_title => 'पहला कदम';

  @override
  String get investFirstSteps_brokerTitle => 'एक ब्रोकर चुनें';

  @override
  String get investFirstSteps_brokerBody =>
      'विनियमित, प्रतिष्ठित संस्थानों की तलाश करें। खाता खोलने से पहले शुल्क, उत्पाद और विश्वसनीयता की तुलना करें।';

  @override
  String get investFirstSteps_openAccountTitle => 'अपना खाता खोलें';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'डिजिटल ऑनबोर्डिंग। ब्राज़ील में, आपको आमतौर पर सीपीएफ/आरजी और कभी-कभी पते के प्रमाण की आवश्यकता होती है।';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'डिजिटल ऑनबोर्डिंग देश के अनुसार भिन्न होती है। आमतौर पर आपको एक आईडी दस्तावेज़ और पहचान/पता सत्यापन की आवश्यकता होती है।';

  @override
  String get investFirstSteps_transferTitle => 'फंड ट्रांसफर करें';

  @override
  String get investFirstSteps_transferBodyBr =>
      'अपने ब्रोकर को PIX या बैंक हस्तांतरण के माध्यम से धन भेजें। शेष राशि निवेश के लिए उपलब्ध हो जाती है।';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'बैंक हस्तांतरण या स्थानीय भुगतान विधियों के माध्यम से धनराशि स्थानांतरित करें (आपके देश पर निर्भर करता है)। शेष राशि निवेश के लिए उपलब्ध हो जाती है।';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'अपने जोखिम प्रोफ़ाइल को जानें';

  @override
  String get investFirstSteps_riskProfileBody =>
      'उपयुक्तता प्रश्नावली का उत्तर दें। समझें कि आप रूढ़िवादी हैं, उदारवादी हैं या आक्रामक हैं।';

  @override
  String get investFirstSteps_firstAssetTitle => 'अपनी पहली संपत्ति खरीदें';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'एक आपातकालीन निधि (टेसोउरो सेलिक या दैनिक-तरलता सीडीबी) से शुरुआत करें। फिर धीरे-धीरे विविधता लाएं।';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'एक आपातकालीन निधि (उच्च-उपज नकदी, मुद्रा बाजार निधि, या अल्पकालिक ट्रेजरी बांड) से शुरू करें। फिर धीरे-धीरे विविधता लाएं।';

  @override
  String get investFirstSteps_tipTitle => 'सलाहकार टिप:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'छोटी शुरुआत करें, लगातार निवेश करें, और बाज़ार में समय के अनुसार प्रयास करने से बचें। समय आपका सबसे अच्छा सहयोगी है.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'छोटी शुरुआत करें, लगातार निवेश करें, और बाज़ार में समय के अनुसार प्रयास करने से बचें। समय आपका सबसे अच्छा सहयोगी है.';

  @override
  String get investMenu_tesouroTitle => 'ब्राजीलियाई कोषागार';

  @override
  String get investMenu_cdbTitle => 'बैंक निश्चित आय (सीडीबी)';

  @override
  String get investMenu_etfsTitle => 'अंतर्राष्ट्रीय ईटीएफ';

  @override
  String get investMenu_sp500Title => 'S&P 500 (सूचकांक)';

  @override
  String get investMenu_stocksTitle => 'स्टॉक';

  @override
  String get investMenu_fundsTitle => 'फंड';

  @override
  String get investMenu_fiisTitle => 'एफआईआई';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'इंटरनेशनल';

  @override
  String get investMenu_cryptoTitle => 'क्रिप्टो';

  @override
  String get investRegisterCta => 'निवेश पंजीकृत करें';

  @override
  String investRegionHintBr(String country) {
    return 'प्रभावी देश: $country · ब्राज़ील कैटलॉग (कोषागार, सीडीबी, एलसीए…)।';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'प्रभावी देश: $country · वैश्विक कैटलॉग (ETFs, NYSE/NASDAQ…)। आपके डिवाइस क्षेत्र से स्वचालित रूप से समायोजित।';
  }

  @override
  String get strategy_sectionCoreTitle => 'आवश्यक रणनीतियाँ';

  @override
  String get strategy_sectionDeepDiveTitle => 'डीप डाइव (प्रीमियम)';

  @override
  String get strategy_emergencyFundTitle => 'आपातकालीन निधि';

  @override
  String get strategy_emergencyFundBodyBr =>
      'आपकी वित्तीय ढाल। 6-12 महीने के खर्चों को कवर करें। दैनिक तरलता और कम जोखिम (उदाहरण के लिए, टेसोउरो सेलिक या सीडीआई-लिंक्ड सीडीबी) को प्राथमिकता दें।';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'आपकी वित्तीय ढाल। 6-12 महीने के खर्चों को कवर करें। दैनिक तरलता और कम जोखिम (जैसे, मनी मार्केट फंड और अल्पकालिक ट्रेजरी बांड) को प्राथमिकता दें।';

  @override
  String get strategy_buyHoldTitle => 'खरीदें और होल्ड करें';

  @override
  String get strategy_buyHoldBody =>
      'गुणवत्तापूर्ण संपत्ति खरीदें और लंबी अवधि के लिए रखें। अनुशासन, गुणवत्ता और समय के साथ पुनर्निवेश पर ध्यान दें।';

  @override
  String get strategy_diversificationTitle => 'विविधीकरण';

  @override
  String get strategy_diversificationBodyBr =>
      'जोखिम को कम करने और जोखिम-समायोजित रिटर्न में सुधार करने के लिए अपनी पूंजी को निश्चित आय, स्टॉक, एफआईआई और अंतरराष्ट्रीय परिसंपत्तियों में फैलाएं।';

  @override
  String get strategy_diversificationBodyGlobal =>
      'जोखिम को कम करने और जोखिम-समायोजित रिटर्न में सुधार करने के लिए अपनी पूंजी को बांड, स्टॉक, आरईआईटी और अंतरराष्ट्रीय एक्सपोजर में फैलाएं।';

  @override
  String get strategy_dcaTitle => 'डॉलर-लागत औसत (DCA)';

  @override
  String get strategy_dcaBody =>
      'संगति प्रतिभा को मात देती है। सही प्रवेश बिंदु चुनने की कोशिश करने की तुलना में हर महीने निवेश करना अक्सर अधिक प्रभावी होता है।';

  @override
  String get strategy_smartGoalsTitle => 'स्मार्ट लक्ष्य';

  @override
  String get strategy_smartGoalsBody =>
      'आपके लक्ष्य विशिष्ट, मापने योग्य, प्राप्त करने योग्य, प्रासंगिक और समयबद्ध होने चाहिए।';

  @override
  String get strategy_503020Title => '50-30-20 नियम';

  @override
  String get strategy_503020Body =>
      'एक सरल बजट ढांचा: 50% जरूरतें, 30% चाहत, 20% निवेश और लक्ष्य।';

  @override
  String get strategy_deepDive_allocationTitle => 'परिसंपत्ति आवंटन (उन्नत)';

  @override
  String get strategy_deepDive_allocationBody =>
      'जानें कि लक्ष्य और क्षितिज के आधार पर आवंटन कैसे बनाया जाए, जोखिम, सहसंबंध और पुनर्संतुलन को समायोजित किया जाए।';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'वैश्विक ईटीएफ और सूचकांक (उन्नत)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'वैश्विक सूचकांकों (उदाहरण के लिए, एसएंडपी 500), ईटीएफ और अनुशासन के साथ अंतरराष्ट्रीय प्रदर्शन कैसे बनाया जाए, इसके बारे में जानें।';

  @override
  String get strategy_deepDive_taxesTitle => 'कर और रिपोर्टिंग (उन्नत)';

  @override
  String get strategy_deepDive_taxesBody =>
      'मुख्य कर अवधारणाओं को समझें और निवेश की सुरक्षित रिपोर्ट करने के लिए रिकॉर्ड कैसे रखें।';

  @override
  String get strategy_premiumLockedBody =>
      'प्रीमियम सामग्री। निवेश डीप डाइव को अनलॉक करने के लिए साइबर/ग्रिम/हाइव थीम सक्रिय करें।';

  @override
  String get homeShowcaseTitle => 'शोकेस';

  @override
  String get homeShowcaseProfileSimTitle => 'जोखिम प्रोफ़ाइल प्रश्नोत्तरी';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'कुछ ही मिनटों में अपनी निवेशक प्रोफ़ाइल ढूंढें।';

  @override
  String get homeShowcaseStrategiesTitle => 'अनुशंसित रणनीतियाँ';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'रणनीतियों को सीखने और लागू करने के लिए सीधे शॉर्टकट।';

  @override
  String get homeShowcaseMentorHubTitle => 'सलाहकार: प्रश्नोत्तरी और रणनीतियाँ';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'जोखिम प्रोफ़ाइल प्रश्नोत्तरी और अनुशंसित रणनीतियों तक त्वरित पहुंच।';

  @override
  String get homeTourStepClassicTitle => 'क्लासिक मोड';

  @override
  String get homeTourStepClassicBody =>
      'मूल ऐप पैनल खोलता है: परिचित लेआउट में लेनदेन, लक्ष्य, निवेश और सेटिंग्स।';

  @override
  String get homeTourStepVitrineTitle => 'शोकेस क्षेत्र';

  @override
  String get homeTourStepVitrineBody =>
      'सीखने और अभ्यास करने के लिए शॉर्टकट: निवेशक प्रोफ़ाइल, रणनीतियाँ और मेंटर हब।';

  @override
  String get homeTourStepProfileTitle => 'प्रोफ़ाइल प्रश्नोत्तरी';

  @override
  String get homeTourStepProfileBody =>
      'अपने जोखिम प्रोफ़ाइल को खोजने और संरेखित सुझाव देखने के लिए प्रश्नावली का उत्तर दें।';

  @override
  String get homeTourStepStrategiesTitle => 'रणनीतियाँ';

  @override
  String get homeTourStepStrategiesBody =>
      'वित्त को व्यवस्थित करने, अनुशासन के साथ निवेश करने और सामान्य नुकसान से बचने के लिए सामग्री।';

  @override
  String get homeTourStepHubTitle => 'मेंटर हब';

  @override
  String get homeTourStepHubBody =>
      'प्रोफ़ाइल प्रश्नोत्तरी और अनुशंसित रणनीतियों के लिए त्वरित मेनू।';

  @override
  String get homeTourStepPremiumTitle => 'प्रीमियम सुविधाएँ';

  @override
  String get homeTourStepPremiumBody =>
      'ऑटो मेंटरिंग, उन्नत चार्ट और मासिक रिपोर्ट - प्रीमियम सदस्यता के साथ उपलब्ध है।';

  @override
  String get homeTourStepMarketTitle => 'मार्केट स्नैपशॉट';

  @override
  String get homeTourStepMarketBody =>
      'बाज़ार संदर्भ (ब्राजील या वैश्विक) आपके क्षेत्र और परिवर्तित निवल मूल्य पर आधारित।';

  @override
  String get homeTourStepCalculatorTitle => 'मेंटर कैलकुलेटर';

  @override
  String get homeTourStepCalculatorBody =>
      'चक्रवृद्धि ब्याज, मुद्रास्फीति का अनुकरण करें और धन चार्ट देखें; आगे हम इस टूल को खोलते हैं।';

  @override
  String get quizProfile_title => 'जोखिम प्रोफ़ाइल प्रश्नोत्तरी';

  @override
  String quizProfile_progress(int current, int total) {
    return 'प्रश्न $total का $current';
  }

  @override
  String get quizProfile_badge => 'जोखिम प्रोफ़ाइल प्रश्नोत्तरी';

  @override
  String get quizProfile_resultTitle => 'आपकी प्रोफ़ाइल है';

  @override
  String get quizProfile_idealInvestmentsTitle => 'आदर्श निवेश:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'निवेश का अन्वेषण करें';

  @override
  String get quizProfile_exit => 'बाहर निकलें';

  @override
  String get quizKnowledge_title => 'ज्ञान प्रश्नोत्तरी';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'प्रश्न $total का $current';
  }
}

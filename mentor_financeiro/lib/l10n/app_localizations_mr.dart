// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'मार्गदर्शक वित्त';

  @override
  String get saldo => 'शिल्लक';

  @override
  String get gastosDiarios => 'दैनिक खर्च';

  @override
  String get confirmarTransacao => 'व्यवहाराची पुष्टी करा';

  @override
  String get extrato => 'विधान';

  @override
  String get transferencias => 'बदल्या';

  @override
  String get investimentos => 'गुंतवणूक';

  @override
  String get configuracoes => 'सेटिंग्ज';

  @override
  String get perfil => 'प्रोफाइल';

  @override
  String get sair => 'लॉगआउट';

  @override
  String get entrar => 'लॉगिन करा';

  @override
  String get cadastrar => 'नोंदणी';

  @override
  String get email => 'ईमेल';

  @override
  String get senha => 'पासवर्ड';

  @override
  String get nome => 'नाव';

  @override
  String get cpf => 'आयडी क्रमांक';

  @override
  String get telefone => 'फोन';

  @override
  String get continuar => 'सुरू ठेवा';

  @override
  String get voltar => 'मागे';

  @override
  String get cancelar => 'रद्द करा';

  @override
  String get salvar => 'जतन करा';

  @override
  String get editar => 'संपादित करा';

  @override
  String get excluir => 'हटवा';

  @override
  String get sucesso => 'यश';

  @override
  String get erro => 'त्रुटी';

  @override
  String get carregando => 'लोड करत आहे...';

  @override
  String get semDados => 'कोणताही डेटा नाही';

  @override
  String get tentarNovamente => 'पुन्हा प्रयत्न करा';

  @override
  String get relatorios => 'अहवाल';

  @override
  String get gastosPorCategoria => 'श्रेणीनुसार खर्च';

  @override
  String get ultimosSeteDias => 'शेवटचे 7 दिवस';

  @override
  String get totalGasto => 'एकूण खर्च';

  @override
  String get transacoes => 'व्यवहार';

  @override
  String get categoria => 'श्रेणी';

  @override
  String get data => 'तारीख';

  @override
  String get valor => 'मूल्य';

  @override
  String get descricao => 'वर्णन';

  @override
  String get alimentacao => 'अन्न';

  @override
  String get transporte => 'वाहतूक';

  @override
  String get lazer => 'विश्रांती';

  @override
  String get saude => 'आरोग्य';

  @override
  String get outros => 'इतर';

  @override
  String get notificacoes => 'सूचना';

  @override
  String get permissaoNotificacoes => 'सूचना परवानगी';

  @override
  String get ativarMonitoramento => 'खर्च निरीक्षण सक्षम करा';

  @override
  String get descricaoMonitoramento =>
      'तुमचे वित्त व्यवस्थापित करण्यासाठी ॲपला तुमच्या बँक व्यवहारांचे स्वयंचलितपणे निरीक्षण करण्याची अनुमती द्या.';

  @override
  String get idioma => 'भाषा';

  @override
  String get moeda => 'चलन';

  @override
  String get compararInvestimentos => 'गुंतवणुकीची तुलना करा';

  @override
  String get descricaoLocalizacao =>
      'स्थानिक गुंतवणुकीची (CDB/CDI) आंतरराष्ट्रीय दरांशी तुलना करण्यासाठी, आम्हाला तुमचे स्थान आवश्यक आहे.';

  @override
  String get permissaoLocalizacaoNecessaria => 'स्थान परवानगी आवश्यक आहे';

  @override
  String get rendaFixa => 'निश्चित उत्पन्न';

  @override
  String get rendaVariavel => 'परिवर्तनीय उत्पन्न';

  @override
  String get tesouroDireto => 'ट्रेझरी डायरेक्ट';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'स्टॉक्स';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'क्रिप्टोकरन्सी';

  @override
  String get rendimento => 'परत';

  @override
  String get rentabilidade => 'नफा';

  @override
  String get aplicar => 'अर्ज करा';

  @override
  String get resgatar => 'रिडीम करा';

  @override
  String get simular => 'सिम्युलेट';

  @override
  String get metas => 'गोल';

  @override
  String get estrategias => 'धोरणे';

  @override
  String get conhecimento => 'ज्ञान';

  @override
  String get chat => 'गप्पा';

  @override
  String get enviarMensagem => 'संदेश पाठवा';

  @override
  String get digiteMensagem => 'संदेश टाइप करा...';

  @override
  String get alertaGastos => 'खर्चाची सूचना';

  @override
  String alertaGastosMsg(int percent) {
    return 'तुम्ही तुमच्या क्रेडिट मर्यादेपैकी $percent% आधीच वापरला आहे.';
  }

  @override
  String get fechamentoFatura => 'बीजक बंद होत आहे';

  @override
  String get fechamentoFaturaMsg =>
      'उद्या बंद दिवस आहे. खर्चाचा आढावा घेण्यासाठी उत्तम वेळ.';

  @override
  String get faturaVencendo => 'बीजक देय';

  @override
  String faturaVencendoMsg(int dias) {
    return 'बीजक $dias दिवसांत देय आहे. तुमची शिल्लक तपासा.';
  }

  @override
  String get regra30 => 'टीप: 30% नियम';

  @override
  String get regra30Msg =>
      'तुमचा क्रेडिट स्कोअर सुधारण्यासाठी वापर 30% च्या खाली ठेवा.';

  @override
  String get diaDeOuro => 'सुवर्ण दिवस!';

  @override
  String get diaDeOuroMsg =>
      'तुमच्या आजच्या खरेदीचे पैसे फक्त 40 दिवसांत दिले जातील!';

  @override
  String get alertaJuros => 'चेतावणी: व्याज';

  @override
  String get alertaJurosMsg =>
      'तुमची शिल्लक बिल कव्हर करत नाही. फिरणारे क्रेडिट टाळा!';

  @override
  String get notaSaude => 'आर्थिक आरोग्य';

  @override
  String get notaExcelente => 'उत्कृष्ट! तुमचे आर्थिक आरोग्य उत्तम आहे.';

  @override
  String get notaBom => 'चांगले, परंतु सुधारू शकते.';

  @override
  String get notaAtencao => 'खर्चाकडे लक्ष द्या.';

  @override
  String get notaRevisar => 'तुमच्या वित्ताचे पुनरावलोकन करा.';

  @override
  String get mentorInsightTitle => 'मार्गदर्शक मार्गदर्शन';

  @override
  String get mentorInsightLoading => 'मार्केट डेटा आणत आहे...';

  @override
  String get mentorInsightError =>
      'आत्ता डेटा लोड करू शकत नाही. थोड्या वेळाने पुन्हा प्रयत्न करा.';

  @override
  String get mentorInsightOffline =>
      'तुम्ही ऑफलाइन आहात. कोट्स आणि मेंटॉर इनसाइट्स मिळवण्यासाठी कनेक्ट करा.';

  @override
  String get mentorAllocationDefensive =>
      'सध्याची अस्थिरता लक्षात घेता, रिटर्नचा पाठलाग करण्यापूर्वी भांडवल संरक्षण आणि तरलतेला प्राधान्य द्या.';

  @override
  String get mentorAllocationBalanced =>
      'संतुलन संरक्षण आणि वाढ: वैविध्यपूर्ण करा आणि तुमच्या ध्येय क्षितिजावर पुन्हा भेट द्या.';

  @override
  String get mentorAllocationOffensive =>
      'तुमचे प्रोफाइल अधिक जोखमीला अनुमती देते: शिस्तबद्ध रहा आणि जास्त एकाग्रता टाळा.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'चिन्हांचे पुनरावलोकन केले: $symbols';
  }

  @override
  String get currencyFollowLocale => 'स्वयंचलित (भाषा)';

  @override
  String get compoundCalculatorTitle => 'मेंटर कॅल्क्युलेटर — चक्रवाढ व्याज';

  @override
  String get compoundCalculatorSubtitle =>
      'योगदान, नाममात्र वि वास्तविक लाभ (महागाई नंतर) आणि मार्गदर्शक नोट्सचे अनुकरण करा.';

  @override
  String get compoundInitialLabel => 'प्रारंभिक एकरकमी';

  @override
  String get compoundMonthlyLabel => 'मासिक योगदान';

  @override
  String get compoundRateLabel => 'व्याज दर';

  @override
  String get compoundRateAnnual => 'दरसाल';

  @override
  String get compoundRateMonthly => 'दरमहा';

  @override
  String get compoundHorizonLabel => 'वेळ क्षितिज';

  @override
  String get compoundHorizonYears => 'वर्षे';

  @override
  String get compoundHorizonMonths => 'महिने';

  @override
  String get compoundInflationLabel => 'अंदाजे महागाई (% प्रति वर्ष)';

  @override
  String get compoundCalculate => 'गणना करा';

  @override
  String get compoundChartInvested => 'एकूण गुंतवणूक';

  @override
  String get compoundChartInterest => 'व्याज मिळाले';

  @override
  String get compoundSummaryNominalEnd => 'शेवटची शिल्लक (नाममात्र)';

  @override
  String get compoundSummaryRealGain => 'वास्तविक लाभ (खरेदी शक्ती)';

  @override
  String get compoundMentorCardTitle => 'मार्गदर्शक सल्ला';

  @override
  String get compoundInvalidInput => 'वैध मूल्ये प्रविष्ट करा (क्षितिज > 0).';

  @override
  String get userPersonaSectionTitle => 'मार्गदर्शक टोन';

  @override
  String get userPersonaNovice => 'नवशिक्या';

  @override
  String get userPersonaStrategist => 'रणनीतिकार';

  @override
  String get userPersonaRiskTaker => 'जोखीम घेणारा';

  @override
  String get userPersonaConservative => 'बचतकर्ता';

  @override
  String get compoundOpenFullInsight => 'संपूर्ण मार्गदर्शक अंतर्दृष्टी उघडा';

  @override
  String get investFirstSteps_title => 'पहिली पायरी';

  @override
  String get investFirstSteps_brokerTitle => 'दलाल निवडा';

  @override
  String get investFirstSteps_brokerBody =>
      'नियमन केलेल्या, प्रतिष्ठित संस्था शोधा. खाते उघडण्यापूर्वी फी, उत्पादने आणि विश्वासार्हतेची तुलना करा.';

  @override
  String get investFirstSteps_openAccountTitle => 'तुमचे खाते उघडा';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'डिजिटल ऑनबोर्डिंग. ब्राझीलमध्ये, तुम्हाला सामान्यतः CPF/RG आणि कधीकधी पत्त्याचा पुरावा आवश्यक असतो.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'डिजिटल ऑनबोर्डिंग देशानुसार बदलते. सामान्यत: तुम्हाला आयडी दस्तऐवज आणि ओळख/पत्ता पडताळणीची आवश्यकता असते.';

  @override
  String get investFirstSteps_transferTitle => 'निधी हस्तांतरित करा';

  @override
  String get investFirstSteps_transferBodyBr =>
      'PIX द्वारे पैसे पाठवा किंवा तुमच्या ब्रोकरला बँक ट्रान्सफर करा. शिल्लक गुंतवणुकीसाठी उपलब्ध होते.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'बँक हस्तांतरण किंवा स्थानिक पेमेंट पद्धतींद्वारे निधी हस्तांतरित करा (तुमच्या देशावर अवलंबून). शिल्लक गुंतवणुकीसाठी उपलब्ध होते.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'तुमची जोखीम प्रोफाइल जाणून घ्या';

  @override
  String get investFirstSteps_riskProfileBody =>
      'योग्यता प्रश्नावलीचे उत्तर द्या. तुम्ही पुराणमतवादी, मध्यम किंवा आक्रमक आहात हे समजून घ्या.';

  @override
  String get investFirstSteps_firstAssetTitle =>
      'तुमची पहिली मालमत्ता खरेदी करा';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'आपत्कालीन निधीसह प्रारंभ करा (टेसोरो सेलिक किंवा दैनिक-तरलता CDB). मग हळूहळू विविधता आणा.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'आपत्कालीन निधी (उच्च उत्पन्न रोख, मनी मार्केट फंड, किंवा अल्प-मुदतीचे ट्रेझरी बाँड) सह प्रारंभ करा. मग हळूहळू विविधता आणा.';

  @override
  String get investFirstSteps_tipTitle => 'मेंटॉर टीप:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'लहान सुरुवात करा, सातत्याने गुंतवणूक करा आणि बाजाराला वेळ देण्याचा प्रयत्न टाळा. वेळ तुमचा सर्वात चांगला मित्र आहे.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'लहान सुरुवात करा, सातत्याने गुंतवणूक करा आणि बाजाराला वेळ देण्याचा प्रयत्न टाळा. वेळ तुमचा सर्वात चांगला मित्र आहे.';

  @override
  String get investMenu_tesouroTitle => 'ब्राझिलियन ट्रेझरी';

  @override
  String get investMenu_cdbTitle => 'बँक निश्चित उत्पन्न (CDB)';

  @override
  String get investMenu_etfsTitle => 'आंतरराष्ट्रीय ईटीएफ';

  @override
  String get investMenu_sp500Title => 'S&P 500 (इंडेक्स)';

  @override
  String get investMenu_stocksTitle => 'स्टॉक';

  @override
  String get investMenu_fundsTitle => 'निधी';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'आंतरराष्ट्रीय';

  @override
  String get investMenu_cryptoTitle => 'क्रिप्टो';

  @override
  String get investRegisterCta => 'गुंतवणूक नोंदणी करा';

  @override
  String investRegionHintBr(String country) {
    return 'प्रभावी देश: $country · ब्राझील कॅटलॉग (ट्रेझरी, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'प्रभावी देश: $country · जागतिक कॅटलॉग (ETFs, NYSE/NASDAQ…). आपल्या डिव्हाइस प्रदेशातून आपोआप समायोजित केले.';
  }

  @override
  String get strategy_sectionCoreTitle => 'आवश्यक धोरणे';

  @override
  String get strategy_sectionDeepDiveTitle => 'डीप डायव्ह (प्रीमियम)';

  @override
  String get strategy_emergencyFundTitle => 'आपत्कालीन निधी';

  @override
  String get strategy_emergencyFundBodyBr =>
      'तुमची आर्थिक ढाल. 6-12 महिन्यांचा खर्च कव्हर करा. दैनंदिन तरलता आणि कमी जोखीम (उदा. टेसोरो सेलिक किंवा सीडीआय-लिंक्ड सीडीबी) यांना प्राधान्य द्या.';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'तुमचे आर्थिक ढाल. 6-12 महिन्यांचा खर्च कव्हर करा. दैनंदिन तरलता आणि कमी जोखीम (उदा. मनी मार्केट फंड आणि अल्प-मुदतीचे ट्रेझरी बाँड) यांना प्राधान्य द्या.';

  @override
  String get strategy_buyHoldTitle => 'खरेदी करा आणि धरून ठेवा';

  @override
  String get strategy_buyHoldBody =>
      'दर्जेदार मालमत्ता खरेदी करा आणि दीर्घ मुदतीसाठी धरून ठेवा. शिस्त, गुणवत्ता आणि कालांतराने पुनर्गुंतवणूक यावर लक्ष केंद्रित करा.';

  @override
  String get strategy_diversificationTitle => 'विविधीकरण';

  @override
  String get strategy_diversificationBodyBr =>
      'जोखीम कमी करण्यासाठी आणि जोखीम-समायोजित परतावा सुधारण्यासाठी निश्चित उत्पन्न, स्टॉक, FII आणि आंतरराष्ट्रीय मालमत्तांमध्ये तुमचे भांडवल पसरवा.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'जोखीम कमी करण्यासाठी आणि जोखीम-समायोजित परतावा सुधारण्यासाठी बाँड, स्टॉक, REIT आणि आंतरराष्ट्रीय एक्सपोजरमध्ये तुमचे भांडवल पसरवा.';

  @override
  String get strategy_dcaTitle => 'डॉलर-खर्च सरासरी (DCA)';

  @override
  String get strategy_dcaBody =>
      'सुसंगतता प्रतिभाला हरवते. प्रत्येक महिन्याला गुंतवणूक करणे हे परिपूर्ण एंट्री पॉइंट निवडण्याचा प्रयत्न करण्यापेक्षा बरेचदा अधिक प्रभावी असते.';

  @override
  String get strategy_smartGoalsTitle => 'स्मार्ट उद्दिष्टे';

  @override
  String get strategy_smartGoalsBody =>
      'तुमची उद्दिष्टे विशिष्ट, मोजण्यायोग्य, साध्य करण्यायोग्य, संबंधित आणि कालबद्ध असावीत.';

  @override
  String get strategy_503020Title => '50-30-20 नियम';

  @override
  String get strategy_503020Body =>
      'एक साधी बजेटिंग फ्रेमवर्क: 50% गरजा, 30% इच्छा, 20% गुंतवणूक आणि उद्दिष्टे.';

  @override
  String get strategy_deepDive_allocationTitle => 'मालमत्ता वाटप (प्रगत)';

  @override
  String get strategy_deepDive_allocationBody =>
      'ध्येय आणि क्षितिजानुसार वाटप कसे तयार करायचे, जोखीम समायोजित करणे, परस्परसंबंध आणि पुनर्संतुलन कसे करायचे ते शिका.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ग्लोबल ईटीएफ आणि निर्देशांक (प्रगत)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'जागतिक निर्देशांक (उदा. S&P 500), ETF आणि शिस्तीसह आंतरराष्ट्रीय प्रदर्शन कसे तयार करावे याबद्दल जाणून घ्या.';

  @override
  String get strategy_deepDive_taxesTitle => 'कर आणि अहवाल (प्रगत)';

  @override
  String get strategy_deepDive_taxesBody =>
      'मुख्य कर संकल्पना समजून घ्या आणि सुरक्षितपणे गुंतवणुकीचा अहवाल देण्यासाठी रेकॉर्ड कसे ठेवावे.';

  @override
  String get strategy_premiumLockedBody =>
      'प्रीमियम सामग्री. गुंतवणूक डीप डायव्ह अनलॉक करण्यासाठी सायबर/ग्रिम/हाइव्ह थीम सक्रिय करा.';

  @override
  String get homeShowcaseTitle => 'शोकेस';

  @override
  String get homeShowcaseProfileSimTitle => 'जोखीम प्रोफाइल क्विझ';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'काही मिनिटांत तुमचे गुंतवणूकदार प्रोफाइल शोधा.';

  @override
  String get homeShowcaseStrategiesTitle => 'शिफारस केलेली धोरणे';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'धोरणे जाणून घेण्यासाठी आणि लागू करण्यासाठी थेट शॉर्टकट.';

  @override
  String get homeShowcaseMentorHubTitle => 'मार्गदर्शक: क्विझ आणि धोरणे';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'जोखीम प्रोफाइल क्विझ आणि शिफारस केलेल्या धोरणांमध्ये द्रुत प्रवेश.';

  @override
  String get homeTourStepClassicTitle => 'क्लासिक मोड';

  @override
  String get homeTourStepClassicBody =>
      'मूळ ॲप पॅनेल उघडते: परिचित लेआउटमधील व्यवहार, उद्दिष्टे, गुंतवणूक आणि सेटिंग्ज.';

  @override
  String get homeTourStepVitrineTitle => 'शोकेस क्षेत्र';

  @override
  String get homeTourStepVitrineBody =>
      'शिकण्यासाठी आणि सराव करण्यासाठी शॉर्टकट: गुंतवणूकदार प्रोफाइल, धोरणे आणि मेंटॉर हब.';

  @override
  String get homeTourStepProfileTitle => 'प्रोफाइल क्विझ';

  @override
  String get homeTourStepProfileBody =>
      'तुमची जोखीम प्रोफाइल शोधण्यासाठी प्रश्नावलीचे उत्तर द्या आणि संरेखित सूचना पहा.';

  @override
  String get homeTourStepStrategiesTitle => 'धोरणे';

  @override
  String get homeTourStepStrategiesBody =>
      'आर्थिक व्यवस्था करण्यासाठी, शिस्तीने गुंतवणूक करण्यासाठी आणि सामान्य अडचणी टाळण्यासाठी सामग्री.';

  @override
  String get homeTourStepHubTitle => 'मेंटर हब';

  @override
  String get homeTourStepHubBody =>
      'प्रोफाइल क्विझ आणि शिफारस केलेल्या रणनीतींसाठी द्रुत मेनू.';

  @override
  String get homeTourStepPremiumTitle => 'प्रीमियम वैशिष्ट्ये';

  @override
  String get homeTourStepPremiumBody =>
      'स्वयं मार्गदर्शन, प्रगत चार्ट आणि मासिक अहवाल — प्रीमियम सदस्यत्वासह उपलब्ध.';

  @override
  String get homeTourStepMarketTitle => 'मार्केट स्नॅपशॉट';

  @override
  String get homeTourStepMarketBody =>
      'बाजार संदर्भ (ब्राझील किंवा जागतिक) तुमच्या क्षेत्रावर आधारित आणि रूपांतरित निव्वळ संपत्तीवर आधारित.';

  @override
  String get homeTourStepCalculatorTitle => 'मेंटर कॅल्क्युलेटर';

  @override
  String get homeTourStepCalculatorBody =>
      'चक्रवाढ व्याज, चलनवाढीचे अनुकरण करा आणि संपत्ती चार्ट पहा; पुढे आपण हे साधन उघडतो.';

  @override
  String get quizProfile_title => 'जोखीम प्रोफाइल क्विझ';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get quizProfile_badge => 'जोखीम प्रोफाइल प्रश्नमंजुषा';

  @override
  String get quizProfile_resultTitle => 'तुमचे प्रोफाइल आहे';

  @override
  String get quizProfile_idealInvestmentsTitle => 'आदर्श गुंतवणूक:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'गुंतवणूक एक्सप्लोर करा';

  @override
  String get quizProfile_exit => 'बाहेर पडा';

  @override
  String get quizKnowledge_title => 'Knowledge quiz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Question $current of $total';
  }
}

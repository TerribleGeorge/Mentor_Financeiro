// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Balanse';

  @override
  String get gastosDiarios => 'Pang-araw-araw na Gastos';

  @override
  String get confirmarTransacao => 'Kumpirmahin ang Transaksyon\nPahayag ng';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Mga Paglilipat';

  @override
  String get investimentos => 'Mga Pamumuhunan\nMga Setting ng';

  @override
  String get configuracoes => '';

  @override
  String get perfil => 'Profile';

  @override
  String get sair => 'Logout';

  @override
  String get entrar => 'Login';

  @override
  String get cadastrar => 'Magrehistro';

  @override
  String get email => 'Email';

  @override
  String get senha => 'Password';

  @override
  String get nome => 'Pangalan';

  @override
  String get cpf => 'ID Number';

  @override
  String get telefone => 'Telepono';

  @override
  String get continuar => 'Magpatuloy';

  @override
  String get voltar => 'Bumalik';

  @override
  String get cancelar => 'Kanselahin';

  @override
  String get salvar => 'I-save';

  @override
  String get editar => 'I-edit';

  @override
  String get excluir => 'Tanggalin';

  @override
  String get sucesso => 'Tagumpay';

  @override
  String get erro => 'Error';

  @override
  String get carregando => 'Naglo-load...';

  @override
  String get semDados => 'Walang data';

  @override
  String get tentarNovamente => 'Subukang muli\nMga Ulat ng';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'Mga Gastos ayon sa Kategorya';

  @override
  String get ultimosSeteDias => 'Huling 7 Araw';

  @override
  String get totalGasto => 'Kabuuang Ginastos';

  @override
  String get transacoes => 'Mga Transaksyon';

  @override
  String get categoria => 'Kategorya';

  @override
  String get data => 'Petsa\nHalaga ng';

  @override
  String get valor => '';

  @override
  String get descricao => 'Paglalarawan';

  @override
  String get alimentacao => 'Pagkain';

  @override
  String get transporte => 'Transportasyon';

  @override
  String get lazer => 'Paglilibang';

  @override
  String get saude => 'Kalusugan';

  @override
  String get outros => 'Iba pa\nMga Notification ng';

  @override
  String get notificacoes => '';

  @override
  String get permissaoNotificacoes => 'Pahintulot sa Notification';

  @override
  String get ativarMonitoramento => 'Paganahin ang Pagsubaybay sa Gastos';

  @override
  String get descricaoMonitoramento =>
      'Payagan ang app na awtomatikong subaybayan ang iyong mga transaksyon sa bangko upang ayusin ang iyong mga pananalapi.';

  @override
  String get idioma => 'Wika';

  @override
  String get moeda => 'Pera';

  @override
  String get compararInvestimentos => 'Ikumpara ang Mga Puhunan';

  @override
  String get descricaoLocalizacao =>
      'Upang ihambing ang mga lokal na pamumuhunan (CDB/CDI) sa mga internasyonal na rate, kailangan namin ang iyong lokasyon.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Kinakailangan ang Pahintulot sa Lokasyon';

  @override
  String get rendaFixa => 'Fixed Income';

  @override
  String get rendaVariavel => 'Variable Income';

  @override
  String get tesouroDireto => 'Direktang Treasury';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA\nMga Stock ng';

  @override
  String get acoes => '';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Cryptocurrencies';

  @override
  String get rendimento => 'Bumalik';

  @override
  String get rentabilidade => 'kakayahang kumita';

  @override
  String get aplicar => 'Mag-apply';

  @override
  String get resgatar => 'I-redeem';

  @override
  String get simular => 'Gayahin';

  @override
  String get metas => 'Mga Layunin';

  @override
  String get estrategias => '';

  @override
  String get conhecimento => 'Kaalaman';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Magpadala ng mensahe';

  @override
  String get digiteMensagem => 'Mag-type ng mensahe...\nTip ng';

  @override
  String get alertaGastos => 'Alerto sa Paggastos';

  @override
  String alertaGastosMsg(int percent) {
    return 'Nagamit mo na ang $percent% ng iyong limitasyon sa kredito.';
  }

  @override
  String get fechamentoFatura => 'Pagsasara ng Invoice';

  @override
  String get fechamentoFaturaMsg =>
      'Bukas ay araw ng pagsasara. Magandang oras para suriin ang mga gastos.';

  @override
  String get faturaVencendo => 'Dapat na Invoice';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Invoice na dapat bayaran sa $dias (na) araw. Suriin ang iyong balanse.';
  }

  @override
  String get regra30 => ': 30% na Panuntunan';

  @override
  String get regra30Msg =>
      'Panatilihing mababa sa 30% ang paggamit upang mapabuti ang iyong Credit Score.';

  @override
  String get diaDeOuro => 'Gintong Araw!';

  @override
  String get diaDeOuroMsg =>
      'Ang iyong mga binili ngayon ay babayaran lamang sa loob ng 40 araw!';

  @override
  String get alertaJuros => 'Babala: Interes';

  @override
  String get alertaJurosMsg =>
      'Hindi saklaw ng iyong balanse ang singil. Iwasan ang revolving credit!';

  @override
  String get notaSaude => 'Pinansyal na Kalusugan';

  @override
  String get notaExcelente =>
      'Magaling! Mayroon kang mahusay na kalusugan sa pananalapi.';

  @override
  String get notaBom => 'Mabuti, ngunit maaaring mapabuti.';

  @override
  String get notaAtencao => 'Pansin sa paggastos.';

  @override
  String get notaRevisar => 'Suriin ang iyong pananalapi.';

  @override
  String get mentorInsightTitle => 'Gabay sa Mentor';

  @override
  String get mentorInsightLoading => 'Kinukuha ang data ng market...';

  @override
  String get mentorInsightError =>
      'Hindi ma-load ang data sa ngayon. Subukan muli sa ilang sandali.';

  @override
  String get mentorInsightOffline =>
      'Offline ka. Kumonekta para kumuha ng mga quote at Mentor insight.';

  @override
  String get mentorAllocationDefensive =>
      'Dahil sa kasalukuyang pagkasumpungin, unahin ang pagpapanatili ng kapital at pagkatubig bago humabol sa mga pagbabalik.';

  @override
  String get mentorAllocationBalanced =>
      'Proteksyon ng balanse at paglago: pag-iba-ibahin at muling bisitahin ang abot-tanaw ng iyong layunin.';

  @override
  String get mentorAllocationOffensive =>
      'Ang iyong profile ay nagbibigay-daan sa mas maraming panganib: manatiling disiplinado at iwasan ang matinding konsentrasyon.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Mga Simbolo na nasuri: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Awtomatiko (wika)';

  @override
  String get compoundCalculatorTitle => 'Mentor Calculator — Compound Interes';

  @override
  String get compoundCalculatorSubtitle =>
      'Gayahin ang mga kontribusyon, nominal vs real gain (pagkatapos ng inflation), at mentor notes.';

  @override
  String get compoundInitialLabel => 'Paunang lump sum';

  @override
  String get compoundMonthlyLabel => 'Buwanang kontribusyon';

  @override
  String get compoundRateLabel => 'Rate ng interes';

  @override
  String get compoundRateAnnual => 'bawat taon';

  @override
  String get compoundRateMonthly => 'bawat buwan';

  @override
  String get compoundHorizonLabel => 'Horizon ng oras';

  @override
  String get compoundHorizonYears => 'taon';

  @override
  String get compoundHorizonMonths => 'buwan';

  @override
  String get compoundInflationLabel => 'Tinantyang inflation (% bawat taon)';

  @override
  String get compoundCalculate => 'Kalkulahin';

  @override
  String get compoundChartInvested => 'Kabuuang namuhunan';

  @override
  String get compoundChartInterest => 'Interes na nakuha';

  @override
  String get compoundSummaryNominalEnd => 'Pangwakas na balanse (nominal)';

  @override
  String get compoundSummaryRealGain =>
      'Tunay na pakinabang (kapangyarihan sa pagbili)';

  @override
  String get compoundMentorCardTitle => 'Payo ng Mentor';

  @override
  String get compoundInvalidInput =>
      'Maglagay ng mga wastong halaga (horizon > 0).';

  @override
  String get userPersonaSectionTitle => 'Tone ng Mentor';

  @override
  String get userPersonaNovice => 'Baguhan';

  @override
  String get userPersonaStrategist => 'Strategist';

  @override
  String get userPersonaRiskTaker => 'Tagakuha ng panganib';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Buksan ang buong insight ng mentor';

  @override
  String get investFirstSteps_title => 'Mga unang hakbang';

  @override
  String get investFirstSteps_brokerTitle => 'Pumili ng broker';

  @override
  String get investFirstSteps_brokerBody =>
      'Maghanap ng mga regulated, mapagkakatiwalaang institusyon. Paghambingin ang mga bayarin, produkto, at pagiging maaasahan bago magbukas ng account.';

  @override
  String get investFirstSteps_openAccountTitle => 'Buksan ang iyong account';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digital na onboarding. Sa Brazil, karaniwang kailangan mo ng CPF/RG at kung minsan ay patunay ng address.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digital onboarding ay nag-iiba ayon sa bansa. Karaniwang kailangan mo ng ID na dokumento at pag-verify ng pagkakakilanlan/address.';

  @override
  String get investFirstSteps_transferTitle => 'Maglipat ng mga pondo';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Magpadala ng pera sa pamamagitan ng PIX o bank transfer sa iyong broker. Ang balanse ay magiging available upang mamuhunan.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Maglipat ng mga pondo sa pamamagitan ng bank transfer o mga lokal na paraan ng pagbabayad (depende sa iyong bansa). Ang balanse ay magiging available upang mamuhunan.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Alamin ang iyong profile sa panganib';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Sagutin ang isang talatanungan sa pagiging angkop. Unawain kung ikaw ay konserbatibo, katamtaman, o agresibo.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Bilhin ang iyong unang asset';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Magsimula sa isang emergency fund (Tesouro Selic o isang daily-liquidity CDB). Pagkatapos ay unti-unting pag-iba-iba.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Magsimula sa isang emergency fund (high-yield cash, money market funds, o short-term Treasury bond). Pagkatapos ay unti-unting pag-iba-iba.';

  @override
  String get investFirstSteps_tipTitle => 'Mentor tip:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Magsimula sa maliit, patuloy na mamuhunan, at iwasang subukang i-time ang market. Ang oras ang iyong pinakamahusay na kakampi.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Magsimula sa maliit, patuloy na mamuhunan, at iwasang subukang i-time ang market. Ang oras ang iyong pinakamahusay na kakampi.';

  @override
  String get investMenu_tesouroTitle => 'Brazilian Treasuries';

  @override
  String get investMenu_cdbTitle => 'Bank fixed income (CDB)';

  @override
  String get investMenu_etfsTitle => 'International na mga ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (index)\nMga Stock ng';

  @override
  String get investMenu_stocksTitle => 'Mga Pondo ng';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Magrehistro ng pamumuhunan';

  @override
  String investRegionHintBr(String country) {
    return 'Epektibong bansa: $country · Catalog ng Brazil (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Epektibong bansa: $country · Global catalog (ETFs, NYSE/NASDAQ…). Awtomatikong inaayos mula sa rehiyon ng iyong device.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Mahahalagang diskarte';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Emergency fund';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Ang iyong pinansiyal na kalasag. Takpan ang 6–12 buwang gastos. Unahin ang pang-araw-araw na pagkatubig at mababang panganib (hal., Tesouro Selic o CDI-linked CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Ang iyong pinansiyal na kalasag. Takpan ang 6–12 buwang gastos. Unahin ang pang-araw-araw na pagkatubig at mababang panganib (hal., mga pondo sa money market at mga panandaliang Treasury bond).';

  @override
  String get strategy_buyHoldTitle => 'Bumili at Maghintay';

  @override
  String get strategy_buyHoldBody =>
      'Bumili ng mga de-kalidad na asset at i-hold para sa pangmatagalan. Tumutok sa disiplina, kalidad, at muling pamumuhunan sa paglipas ng panahon.';

  @override
  String get strategy_diversificationTitle => 'Diversification';

  @override
  String get strategy_diversificationBodyBr =>
      'Ipagkalat ang iyong kapital sa mga fixed income, stock, FII, at international asset para bawasan ang panganib at pagbutihin ang mga return na nababagay sa panganib.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Ikalat ang iyong kapital sa mga bono, stock, REIT, at internasyonal na pagkakalantad upang mabawasan ang panganib at mapabuti ang mga return na nababagay sa panganib.';

  @override
  String get strategy_dcaTitle => 'Dollar-cost averaging (DCA)';

  @override
  String get strategy_dcaBody =>
      'ay tinatalo ng Consistency ang henyo. Ang pamumuhunan bawat buwan ay kadalasang mas epektibo kaysa sa pagsubok na pumili ng perpektong entry point.';

  @override
  String get strategy_smartGoalsTitle => 'SMART na mga layunin';

  @override
  String get strategy_smartGoalsBody =>
      'Ang iyong mga layunin ay dapat na tiyak, masusukat, makakamit, may-katuturan, at may hangganan sa oras.';

  @override
  String get strategy_503020Title => '50-30-20 panuntunan';

  @override
  String get strategy_503020Body =>
      'Isang simpleng balangkas ng pagbabadyet: 50% pangangailangan, 30% gusto, 20% pamumuhunan at mga layunin.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Paglalaan ng asset (advanced)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Alamin kung paano bumuo ng alokasyon ayon sa layunin at abot-tanaw, pagsasaayos ng panganib, ugnayan, at muling pagbabalanse.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETF at mga indeks (advanced)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Alamin ang tungkol sa mga pandaigdigang indeks (hal., S&P 500), mga ETF, at kung paano bumuo ng international exposure nang may disiplina.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Mga buwis at pag-uulat (advanced)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Unawain ang mga pangunahing konsepto ng buwis at kung paano mag-iingat ng mga talaan upang maiulat ang mga pamumuhunan nang ligtas.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium na nilalaman. Mag-activate ng Cyber/Grimm/Hive na tema para i-unlock ang investment Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Showcase';

  @override
  String get homeShowcaseProfileSimTitle => 'Pagsusulit sa profile sa peligro';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Hanapin ang iyong profile ng mamumuhunan sa loob ng ilang minuto.';

  @override
  String get homeShowcaseStrategiesTitle => 'Mga inirerekomendang diskarte';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Mga direktang shortcut para matuto at maglapat ng mga diskarte.';

  @override
  String get homeShowcaseMentorHubTitle =>
      'Mentor: Mga Pagsusulit at Istratehiya';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Mabilis na pag-access sa pagsusulit sa profile ng panganib at mga inirerekomendang diskarte.';

  @override
  String get homeTourStepClassicTitle => 'Klasikong mode';

  @override
  String get homeTourStepClassicBody =>
      'Binubuksan ang orihinal na panel ng app: mga transaksyon, layunin, pamumuhunan at setting sa pamilyar na layout.';

  @override
  String get homeTourStepVitrineTitle => 'Showcase area';

  @override
  String get homeTourStepVitrineBody =>
      'Mga Shortcut para matuto at magsanay: profile ng mamumuhunan, mga diskarte at ang Mentor hub.';

  @override
  String get homeTourStepProfileTitle => 'Pagsusulit sa profile';

  @override
  String get homeTourStepProfileBody =>
      'Sagutin ang talatanungan upang matuklasan ang iyong profile sa panganib at makita ang mga nakahanay na mungkahi.\nMga Istratehiya ng';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Nilalaman upang ayusin ang pananalapi, mamuhunan nang may disiplina at maiwasan ang mga karaniwang pitfalls.';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody =>
      'Mabilis na menu sa pagsusulit sa profile at mga inirerekomendang diskarte.';

  @override
  String get homeTourStepPremiumTitle => 'Premium na mga tampok';

  @override
  String get homeTourStepPremiumBody =>
      'Auto mentoring, mga advanced na chart at buwanang ulat — available na may Premium na subscription.';

  @override
  String get homeTourStepMarketTitle => 'Market snapshot';

  @override
  String get homeTourStepMarketBody =>
      'Market context (Brazil o global) batay sa iyong rehiyon at na-convert na net worth.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor calculator';

  @override
  String get homeTourStepCalculatorBody =>
      'Gayahin ang tambalang interes, inflation at tingnan ang tsart ng kayamanan; Susunod, buksan namin ang tool na ito.';

  @override
  String get quizProfile_title => 'Pagsusulit sa profile sa peligro';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Tanong $current ng $total';
  }

  @override
  String get quizProfile_badge => 'RISK PROFILE QUIZ';

  @override
  String get quizProfile_resultTitle => 'ANG PROFILE MO';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEAL NA INVESTMENT:';

  @override
  String get quizProfile_exploreInvestmentsCta =>
      'I-EXPLORE ANG MGA INVESTMENT';

  @override
  String get quizProfile_exit => 'EXIT';

  @override
  String get quizKnowledge_title => 'Pagsusulit sa kaalaman';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Tanong $current ng $total';
  }
}

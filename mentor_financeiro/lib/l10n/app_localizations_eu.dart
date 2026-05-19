// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get appTitle => 'Tutorearen Finantza';

  @override
  String get saldo => 'Balantzea';

  @override
  String get gastosDiarios => 'Eguneko gastuak';

  @override
  String get confirmarTransacao => 'Berretsi transakzioa';

  @override
  String get extrato => 'Adierazpena';

  @override
  String get transferencias => 'Transferentziak';

  @override
  String get investimentos => 'Inbertsioak';

  @override
  String get configuracoes => 'Ezarpenak';

  @override
  String get perfil => 'Profila';

  @override
  String get sair => 'Amaitu saioa';

  @override
  String get entrar => 'Saioa hasi';

  @override
  String get cadastrar => 'Erregistratu';

  @override
  String get email => 'Posta elektronikoa';

  @override
  String get senha => 'Pasahitza';

  @override
  String get nome => 'Izena';

  @override
  String get cpf => 'NAN zenbakia';

  @override
  String get telefone => 'Telefonoa';

  @override
  String get continuar => 'Jarraitu';

  @override
  String get voltar => 'Itzuli';

  @override
  String get cancelar => 'Utzi';

  @override
  String get salvar => 'Gorde';

  @override
  String get editar => 'Editatu';

  @override
  String get excluir => 'Ezabatu';

  @override
  String get sucesso => 'Arrakasta';

  @override
  String get erro => 'Errorea';

  @override
  String get carregando => 'Kargatzen...';

  @override
  String get semDados => 'Ez dago daturik';

  @override
  String get tentarNovamente => 'Saiatu berriro';

  @override
  String get relatorios => 'Txostenak';

  @override
  String get gastosPorCategoria => 'Kategoriaren araberako gastuak';

  @override
  String get ultimosSeteDias => 'Azken 7 egunak';

  @override
  String get totalGasto => 'Gastu osoa';

  @override
  String get transacoes => 'Transakzioak';

  @override
  String get categoria => 'Kategoria';

  @override
  String get data => 'Data';

  @override
  String get valor => 'Balioa';

  @override
  String get descricao => 'Deskribapena';

  @override
  String get alimentacao => 'Janaria';

  @override
  String get transporte => 'Garraioa';

  @override
  String get lazer => 'Aisia';

  @override
  String get saude => 'Osasuna';

  @override
  String get outros => 'Beste batzuk';

  @override
  String get notificacoes => 'Jakinarazpenak';

  @override
  String get permissaoNotificacoes => 'Jakinarazpen-baimena';

  @override
  String get ativarMonitoramento => 'Gaitu gastuen jarraipena';

  @override
  String get descricaoMonitoramento =>
      'Eman aplikazioari zure banku-transakzioak automatikoki kontrolatzeko, zure finantzak antolatzeko.';

  @override
  String get idioma => 'Hizkuntza';

  @override
  String get moeda => 'Moneta';

  @override
  String get compararInvestimentos => 'Inbertsioak alderatu';

  @override
  String get descricaoLocalizacao =>
      'Tokiko inbertsioak (CDB/CDI) nazioarteko tasekin alderatzeko, zure kokapena behar dugu.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Kokapen-baimena behar da';

  @override
  String get rendaFixa => 'Errenta Finkoa';

  @override
  String get rendaVariavel => 'Errenta Aldakorra';

  @override
  String get tesouroDireto => 'Ogasun Zuzena';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Akzioak';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kriptomonetak';

  @override
  String get rendimento => 'Itzulera';

  @override
  String get rentabilidade => 'Errentagarritasuna';

  @override
  String get aplicar => 'Aplikatu';

  @override
  String get resgatar => 'Erabili';

  @override
  String get simular => 'Simulatu';

  @override
  String get metas => 'Golak';

  @override
  String get estrategias => 'Estrategiak';

  @override
  String get conhecimento => 'Ezagutza';

  @override
  String get chat => 'Txata';

  @override
  String get enviarMensagem => 'Bidali mezua';

  @override
  String get digiteMensagem => 'Idatzi mezu bat...';

  @override
  String get alertaGastos => 'Gastuen alerta';

  @override
  String alertaGastosMsg(int percent) {
    return 'Zure kreditu-mugaren % $percent erabili duzu dagoeneko.';
  }

  @override
  String get fechamentoFatura => 'Fakturaren itxiera';

  @override
  String get fechamentoFaturaMsg =>
      'Bihar itxiera eguna da. Gastuak berrikusteko garai bikaina.';

  @override
  String get faturaVencendo => 'Egokitutako faktura';

  @override
  String faturaVencendoMsg(int dias) {
    return '$dias egun barru ordaintzeko faktura. Egiaztatu zure saldoa.';
  }

  @override
  String get regra30 => 'Aholkua: % 30eko araua';

  @override
  String get regra30Msg =>
      'Mantendu erabilera % 30etik behera zure Kreditu Puntuazioa hobetzeko.';

  @override
  String get diaDeOuro => 'Urrezko Eguna!';

  @override
  String get diaDeOuroMsg =>
      'Gaur egindako erosketak 40 egunetan bakarrik ordainduko dira!';

  @override
  String get alertaJuros => 'Abisua: Interesa';

  @override
  String get alertaJurosMsg =>
      'Zure saldoak ez du faktura estaltzen. Saihestu kreditu birakaria!';

  @override
  String get notaSaude => 'Finantza Osasuna';

  @override
  String get notaExcelente => 'Bikain! Finantza osasun handia duzu.';

  @override
  String get notaBom => 'Ona, baina hobetu daiteke.';

  @override
  String get notaAtencao => 'Gastuari arreta.';

  @override
  String get notaRevisar => 'Berrikusi zure finantzak.';

  @override
  String get mentorInsightTitle => 'Tutorearen orientazioa';

  @override
  String get mentorInsightLoading => 'Merkatuko datuak eskuratzen…';

  @override
  String get mentorInsightError =>
      'Ezin izan dira datuak kargatu une honetan. Saiatu berriro laster.';

  @override
  String get mentorInsightOffline =>
      'Deskonektatuta zaude. Konektatu komatxoak eta Mentor-en estatistikak lortzeko.';

  @override
  String get mentorAllocationDefensive =>
      'Egungo hegazkortasuna ikusita, lehenetsi kapitalaren kontserbazioa eta likidezia itzulkinen atzetik baino lehen.';

  @override
  String get mentorAllocationBalanced =>
      'Orekatu babesa eta hazkundea: dibertsifikatu eta berrikusi zure helburu-horizontea.';

  @override
  String get mentorAllocationOffensive =>
      'Zure profilak arrisku gehiago ematen du: diziplinatuta egon eta kontzentrazio handia saihestu.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Berrikusitako ikurrak: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatikoa (hizkuntza)';

  @override
  String get compoundCalculatorTitle =>
      'Tutoreen kalkulagailua — Interes konposatua';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulatu ekarpenak, irabazi nominala eta erreala (inflazioaren ondoren) eta tutoreen oharrak.';

  @override
  String get compoundInitialLabel => 'Hasierako batuketa';

  @override
  String get compoundMonthlyLabel => 'Hileko ekarpena';

  @override
  String get compoundRateLabel => 'Interes-tasa';

  @override
  String get compoundRateAnnual => 'urtean';

  @override
  String get compoundRateMonthly => 'hilean';

  @override
  String get compoundHorizonLabel => 'Denbora-horizontea';

  @override
  String get compoundHorizonYears => 'urte';

  @override
  String get compoundHorizonMonths => 'hilabeteak';

  @override
  String get compoundInflationLabel => 'Estimatutako inflazioa (% urteko)';

  @override
  String get compoundCalculate => 'Kalkulatu';

  @override
  String get compoundChartInvested => 'Inbertitutako guztira';

  @override
  String get compoundChartInterest => 'Irabazitako interesa';

  @override
  String get compoundSummaryNominalEnd => 'Amaierako saldoa (nominala)';

  @override
  String get compoundSummaryRealGain => 'Benetako irabazia (eros-ahalmena)';

  @override
  String get compoundMentorCardTitle => 'Tutoreen aholkua';

  @override
  String get compoundInvalidInput => 'Sartu baliozko balioak (horizontea > 0).';

  @override
  String get userPersonaSectionTitle => 'Tutore-tonua';

  @override
  String get userPersonaNovice => 'Hastapena';

  @override
  String get userPersonaStrategist => 'Estratega';

  @override
  String get userPersonaRiskTaker => 'Arrisku-hartzailea';

  @override
  String get userPersonaConservative => 'Aurrezlea';

  @override
  String get compoundOpenFullInsight => 'Ireki tutoreen ikuspegi osoa';

  @override
  String get investFirstSteps_title => 'Lehen urratsak';

  @override
  String get investFirstSteps_brokerTitle => 'Aukeratu broker bat';

  @override
  String get investFirstSteps_brokerBody =>
      'Bilatu erakunde arautuak eta entzutetsuak. Konparatu kuotak, produktuak eta fidagarritasuna kontu bat ireki aurretik.';

  @override
  String get investFirstSteps_openAccountTitle => 'Ireki zure kontua';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Sartze digitala. Brasilen, normalean CPF/RG eta batzuetan helbidearen froga behar duzu.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Onartze digitala herrialdearen arabera aldatzen da. Normalean nortasun agiria eta identitatea/helbidea egiaztatzea behar dituzu.';

  @override
  String get investFirstSteps_transferTitle => 'Funtsak transferitzea';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Bidali dirua PIX edo banku-transferentzia bidez zure artekariari. Saldoa inbertitzeko erabilgarri bihurtzen da.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Transferitu funtsak banku-transferentzia edo tokiko ordainketa-metodoen bidez (zure herrialdearen arabera). Saldoa inbertitzeko erabilgarri bihurtzen da.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Ezagutu zure arrisku-profila';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Egokitasun galdetegi bati erantzun. Ulertu kontserbadorea, moderatua edo oldarkorra zaren.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Erosi zure lehen aktiboa';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Larrialdi-funts batekin hasi (Tesouro Selic edo eguneroko likidotasuneko CDB). Gero dibertsifikatu pixkanaka.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Hasi larrialdi-funts batekin (errendimendu handiko eskudirua, diru-merkatuko funtsak edo epe laburreko Altxorko bonuak). Gero dibertsifikatu pixkanaka.';

  @override
  String get investFirstSteps_tipTitle => 'Tutorearen aholkua:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Hasi txiki, koherentziaz inbertitu eta saihestu merkatua denboran jartzen saiatzea. Denbora da zure aliatu onena.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Hasi txiki, koherentziaz inbertitu eta saihestu merkatua denboran jartzen saiatzea. Denbora da zure aliatu onena.';

  @override
  String get investMenu_tesouroTitle => 'Brasilgo Ogasunak';

  @override
  String get investMenu_cdbTitle => 'Bankuaren errenta finkoa (CDB)';

  @override
  String get investMenu_etfsTitle => 'Nazioarteko ETFak';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indizea)';

  @override
  String get investMenu_stocksTitle => 'Akzioak';

  @override
  String get investMenu_fundsTitle => 'fondoak';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITak';

  @override
  String get investMenu_internationalTitle => 'Nazioarteko';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Erregistratu inbertsioa';

  @override
  String investRegionHintBr(String country) {
    return 'Herrialde eraginkorra: $country · Brasilen katalogoa (Ogasunak, CDB, LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Herrialde eraginkorra: $country · Katalogo globala (ETF, NYSE/NASDAQ...). Automatikoki egokitu da zure gailuaren eskualdetik.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Funtsezko estrategiak';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Larrialdietarako funtsa';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Zure finantza ezkutua. 6-12 hilabeteko gastuak estali. Lehenetsi eguneroko likidezia eta arrisku txikia (adibidez, Tesouro Selic edo CDI-rekin lotutako CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Zure finantza ezkutua. 6-12 hilabeteko gastuak estali. Lehenetsi eguneroko likidezia eta arrisku txikia (adibidez, diru-merkatuko funtsak eta epe laburreko Altxorraren bonuak).';

  @override
  String get strategy_buyHoldTitle => 'Erosi eta mantendu';

  @override
  String get strategy_buyHoldBody =>
      'Erosi kalitatezko aktiboak eta mantendu epe luzerako. Denboran zehar diziplina, kalitatea eta berrinbertsioa bideratu.';

  @override
  String get strategy_diversificationTitle => 'Dibertsifikazioa';

  @override
  String get strategy_diversificationBodyBr =>
      'Zabaldu zure kapitala errenta finko, akzio, FII eta nazioarteko aktiboetan arriskua murrizteko eta arriskuaren arabera egokitutako etekinak hobetzeko.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Zabaldu zure kapitala bonu, akzio, REIT eta nazioarteko esposizioetan, arriskua murrizteko eta arriskuari egokitutako etekinak hobetzeko.';

  @override
  String get strategy_dcaTitle => 'Dolar-kostuaren batez bestekoa (DCA)';

  @override
  String get strategy_dcaBody =>
      'Koherentziak jenioari irabazi dio. Hilero inbertitzea eraginkorragoa izan ohi da sarrera-puntu perfektua hautatzen saiatzea baino.';

  @override
  String get strategy_smartGoalsTitle => 'SMART helburuak';

  @override
  String get strategy_smartGoalsBody =>
      'Zure helburuak zehatzak, neurgarriak, lorgarriak, garrantzitsuak eta denbora mugatuak izan behar dira.';

  @override
  String get strategy_503020Title => '50-30-20 araua';

  @override
  String get strategy_503020Body =>
      'Aurrekontu-esparru sinplea: %50 beharrak, %30 nahiak, %20 inbertsioa eta helburuak.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Aktiboen esleipena (aurreratua)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Ikasi esleipen bat nola eraiki helburuen eta horizontearen arabera, arriskua, korrelazioa eta orekatua egokituz.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETF globalak eta indizeak (aurreratua)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Ezagutu indize globalei (adibidez, S&P 500), ETFei eta diziplinaz nazioarteko esposizioa nola eraiki.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Zergak eta txostenak (aurreratua)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Ulertu oinarrizko zerga kontzeptuak eta nola gorde erregistroak inbertsioak modu seguruan jakinarazteko.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium edukia. Aktibatu Cyber/Grimm/Hive gai bat Deep Dive inbertsioa desblokeatzeko.';

  @override
  String get homeShowcaseTitle => 'Erakusleihoa';

  @override
  String get homeShowcaseProfileSimTitle => 'Arrisku-profilaren galdetegia';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Aurkitu zure inbertitzaile-profila minutu gutxitan.';

  @override
  String get homeShowcaseStrategiesTitle => 'Gomendatutako estrategiak';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Estrategiak ikasteko eta aplikatzeko zuzeneko lasterbideak.';

  @override
  String get homeShowcaseMentorHubTitle =>
      'Tutorea: Galdetegiak eta estrategiak';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Arrisku-profilen galdetegira eta gomendatutako estrategietara sarbide azkarra.';

  @override
  String get homeTourStepClassicTitle => 'Modu klasikoa';

  @override
  String get homeTourStepClassicBody =>
      'Jatorrizko aplikazioen panela irekitzen du: transakzioak, helburuak, inbertsioak eta ezarpenak diseinu ezagunean.';

  @override
  String get homeTourStepVitrineTitle => 'Erakusleiho gunea';

  @override
  String get homeTourStepVitrineBody =>
      'Ikasteko eta praktikatzeko lasterbideak: inbertitzaileen profila, estrategiak eta Mentor hub-a.';

  @override
  String get homeTourStepProfileTitle => 'Profil galdetegia';

  @override
  String get homeTourStepProfileBody =>
      'Erantzun galdetegia zure arrisku-profila ezagutzeko eta lerrokatutako iradokizunak ikusteko.';

  @override
  String get homeTourStepStrategiesTitle => 'Estrategiak';

  @override
  String get homeTourStepStrategiesBody =>
      'Ogasunak antolatzeko, diziplinaz inbertitzeko eta hutsune arruntak saihesteko edukia.';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody =>
      'Profileko galdetegirako menu azkarra eta gomendatutako estrategiak.';

  @override
  String get homeTourStepPremiumTitle => 'Premium ezaugarriak';

  @override
  String get homeTourStepPremiumBody =>
      'Tutoretza automatikoa, grafiko aurreratuak eta hileroko txostenak — Premium harpidetzarekin eskuragarri.';

  @override
  String get homeTourStepMarketTitle => 'Merkatuaren argazkia';

  @override
  String get homeTourStepMarketBody =>
      'Merkatu-testuingurua (Brasil edo globala) zure eskualdean eta bihurtutako balio garbian oinarrituta.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor kalkulagailua';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulatu interes konposatua, inflazioa eta ikusi aberastasunaren taula; hurrengoan tresna hau irekiko dugu.';

  @override
  String get quizProfile_title => 'Arrisku-profilaren galdetegia';

  @override
  String quizProfile_progress(int current, int total) {
    return '$current-ren $total galdera';
  }

  @override
  String get quizProfile_badge => 'ARRISKU-PROFIL GALDERA';

  @override
  String get quizProfile_resultTitle => 'ZURE PROFILA DA';

  @override
  String get quizProfile_idealInvestmentsTitle => 'INBERTSIO IDEAK:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'INBERTSIOAK ARAKATU';

  @override
  String get quizProfile_exit => 'IRTEERA';

  @override
  String get quizKnowledge_title => 'Ezagutza galdetegia';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '$current-ren $total galdera';
  }
}

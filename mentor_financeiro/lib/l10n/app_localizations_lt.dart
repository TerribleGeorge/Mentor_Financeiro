// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'Finansų mentorius';

  @override
  String get saldo => 'Balansas';

  @override
  String get gastosDiarios => 'Kasdienės išlaidos';

  @override
  String get confirmarTransacao => 'Patvirtinkite operaciją';

  @override
  String get extrato => 'pareiškimas';

  @override
  String get transferencias => 'Pervedimai';

  @override
  String get investimentos => 'Investicijos';

  @override
  String get configuracoes => 'Nustatymai';

  @override
  String get perfil => 'profilis';

  @override
  String get sair => 'Atsijungti';

  @override
  String get entrar => 'Prisijungti';

  @override
  String get cadastrar => 'Registruotis';

  @override
  String get email => 'El';

  @override
  String get senha => 'Slaptažodis';

  @override
  String get nome => 'Pavadinimas';

  @override
  String get cpf => 'ID numeris';

  @override
  String get telefone => 'Telefonas';

  @override
  String get continuar => 'Tęsti';

  @override
  String get voltar => 'Atgal';

  @override
  String get cancelar => 'Atšaukti';

  @override
  String get salvar => 'Sutaupykite';

  @override
  String get editar => 'Redaguoti';

  @override
  String get excluir => 'Ištrinti';

  @override
  String get sucesso => 'Sėkmė';

  @override
  String get erro => 'Klaida';

  @override
  String get carregando => 'Įkeliama...';

  @override
  String get semDados => 'Duomenų nėra';

  @override
  String get tentarNovamente => 'Bandykite dar kartą';

  @override
  String get relatorios => 'ataskaitos';

  @override
  String get gastosPorCategoria => 'Išlaidos pagal kategorijas';

  @override
  String get ultimosSeteDias => 'Paskutinės 7 dienos';

  @override
  String get totalGasto => 'Iš viso išleista';

  @override
  String get transacoes => 'Sandoriai';

  @override
  String get categoria => 'Kategorija';

  @override
  String get data => 'Data';

  @override
  String get valor => 'Vertė';

  @override
  String get descricao => 'Aprašymas';

  @override
  String get alimentacao => 'Maistas';

  @override
  String get transporte => 'Transportas';

  @override
  String get lazer => 'Laisvalaikis';

  @override
  String get saude => 'Sveikata';

  @override
  String get outros => 'Kiti';

  @override
  String get notificacoes => 'Pranešimai';

  @override
  String get permissaoNotificacoes => 'Pranešimo leidimas';

  @override
  String get ativarMonitoramento => 'Įgalinti išlaidų stebėjimą';

  @override
  String get descricaoMonitoramento =>
      'Leiskite programai automatiškai stebėti jūsų banko operacijas, kad galėtumėte tvarkyti jūsų finansus.';

  @override
  String get idioma => 'Kalba';

  @override
  String get moeda => 'Valiuta';

  @override
  String get compararInvestimentos => 'Palyginkite investicijas';

  @override
  String get descricaoLocalizacao =>
      'Norėdami palyginti vietines investicijas (CDB/CDI) su tarptautiniais tarifais, mums reikia jūsų vietos.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Reikalingas vietos leidimas';

  @override
  String get rendaFixa => 'Fiksuotos pajamos';

  @override
  String get rendaVariavel => 'Kintamos pajamos';

  @override
  String get tesouroDireto => 'Tiesioginis iždas';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Atsargos';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kriptovaliutos';

  @override
  String get rendimento => 'Grąžinti';

  @override
  String get rentabilidade => 'Pelningumas';

  @override
  String get aplicar => 'Taikyti';

  @override
  String get resgatar => 'Išpirkti';

  @override
  String get simular => 'Imituoti';

  @override
  String get metas => 'Tikslai';

  @override
  String get estrategias => 'strategijos';

  @override
  String get conhecimento => 'Žinios';

  @override
  String get chat => 'Pokalbiai';

  @override
  String get enviarMensagem => 'Siųsti žinutę';

  @override
  String get digiteMensagem => 'Įveskite žinutę...';

  @override
  String get alertaGastos => 'Įspėjimas apie išlaidas';

  @override
  String alertaGastosMsg(int percent) {
    return 'Jau išnaudojote $percent % kredito limito.';
  }

  @override
  String get fechamentoFatura => 'Sąskaitos faktūros uždarymas';

  @override
  String get fechamentoFaturaMsg =>
      'Rytoj uždarymo diena. Puikus laikas peržiūrėti išlaidas.';

  @override
  String get faturaVencendo => 'Sąskaitos faktūros apmokėjimas';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Sąskaita faktūra apmokėta po $dias d. Patikrinkite balansą.';
  }

  @override
  String get regra30 => 'Patarimas: 30 % taisyklė';

  @override
  String get regra30Msg =>
      'Naudokite žemiau 30%, kad pagerintumėte savo kredito balą.';

  @override
  String get diaDeOuro => 'Auksinė diena!';

  @override
  String get diaDeOuroMsg =>
      'Jūsų pirkiniai šiandien bus apmokėti tik per 40 dienų!';

  @override
  String get alertaJuros => 'Įspėjimas: susidomėjimas';

  @override
  String get alertaJurosMsg =>
      'Jūsų likutis nepadengia sąskaitos. Venkite atnaujinamo kredito!';

  @override
  String get notaSaude => 'Finansinė sveikata';

  @override
  String get notaExcelente => 'Puiku! Turite puikią finansinę sveikatą.';

  @override
  String get notaBom => 'Geras, bet gali tobulėti.';

  @override
  String get notaAtencao => 'Dėmesys išlaidoms.';

  @override
  String get notaRevisar => 'Peržiūrėkite savo finansus.';

  @override
  String get mentorInsightTitle => 'Mentoriaus nurodymai';

  @override
  String get mentorInsightLoading => 'Gaunami rinkos duomenys…';

  @override
  String get mentorInsightError =>
      'Šiuo metu nepavyko įkelti duomenų. Netrukus bandykite dar kartą.';

  @override
  String get mentorInsightOffline =>
      'Jūs neprisijungę. Prisijunkite, kad gautumėte citatas ir mentoriaus įžvalgas.';

  @override
  String get mentorAllocationDefensive =>
      'Atsižvelgiant į dabartinį nepastovumą, pirmenybę teikite kapitalo išsaugojimui ir likvidumui prieš siekdami grąžos.';

  @override
  String get mentorAllocationBalanced =>
      'Subalansuokite apsaugą ir augimą: paįvairinkite ir peržiūrėkite savo tikslų horizontą.';

  @override
  String get mentorAllocationOffensive =>
      'Jūsų profilis suteikia daugiau rizikos: išlikite disciplinuoti ir venkite per daug susikaupti.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Simboliai peržiūrėti: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatinis (kalba)';

  @override
  String get compoundCalculatorTitle =>
      'Mentoriaus skaičiuoklė – sudėtinės palūkanos';

  @override
  String get compoundCalculatorSubtitle =>
      'Imituokite įnašus, nominalųjį ir realųjį pelną (po infliacijos) ir mentoriaus pastabas.';

  @override
  String get compoundInitialLabel => 'Pradinė vienkartinė išmoka';

  @override
  String get compoundMonthlyLabel => 'Mėnesinis įnašas';

  @override
  String get compoundRateLabel => 'Palūkanų norma';

  @override
  String get compoundRateAnnual => 'per metus';

  @override
  String get compoundRateMonthly => 'per mėnesį';

  @override
  String get compoundHorizonLabel => 'Laiko horizontas';

  @override
  String get compoundHorizonYears => 'metų';

  @override
  String get compoundHorizonMonths => 'mėn';

  @override
  String get compoundInflationLabel => 'Numatoma infliacija (% per metus)';

  @override
  String get compoundCalculate => 'Apskaičiuokite';

  @override
  String get compoundChartInvested => 'Iš viso investuota';

  @override
  String get compoundChartInterest => 'Uždirbtos palūkanos';

  @override
  String get compoundSummaryNominalEnd => 'Galutinis likutis (nominalus)';

  @override
  String get compoundSummaryRealGain => 'Realus pelnas (perkamoji galia)';

  @override
  String get compoundMentorCardTitle => 'Mentoriaus patarimas';

  @override
  String get compoundInvalidInput =>
      'Įveskite tinkamas reikšmes (horizontas > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentoriaus tonas';

  @override
  String get userPersonaNovice => 'Pradedantysis';

  @override
  String get userPersonaStrategist => 'strategas';

  @override
  String get userPersonaRiskTaker => 'Rizikuojantis';

  @override
  String get userPersonaConservative => 'taupyklė';

  @override
  String get compoundOpenFullInsight => 'Atidarykite visą mentoriaus įžvalgą';

  @override
  String get investFirstSteps_title => 'Pirmieji žingsniai';

  @override
  String get investFirstSteps_brokerTitle => 'Pasirinkite brokerį';

  @override
  String get investFirstSteps_brokerBody =>
      'Ieškokite reguliuojamų, geros reputacijos institucijų. Prieš atidarydami sąskaitą palyginkite mokesčius, produktus ir patikimumą.';

  @override
  String get investFirstSteps_openAccountTitle => 'Atidarykite paskyrą';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Skaitmeninis įjungimas. Brazilijoje paprastai reikia CPF/RG ir kartais adreso įrodymo.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Skaitmeninis įdiegimas skiriasi priklausomai nuo šalies. Paprastai jums reikia asmens dokumento ir tapatybės / adreso patvirtinimo.';

  @override
  String get investFirstSteps_transferTitle => 'Perveskite lėšas';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Siųskite pinigus per PIX arba banko pavedimu brokeriui. Likutis tampa prieinamas investuoti.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Perveskite lėšas banko pavedimu arba vietiniais mokėjimo būdais (priklauso nuo jūsų šalies). Likutis tampa prieinamas investuoti.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Žinokite savo rizikos profilį';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Atsakykite į tinkamumo klausimyną. Supraskite, ar esate konservatyvus, nuosaikus ar agresyvus.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Pirkite savo pirmąjį turtą';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Pradėkite nuo skubios pagalbos fondo (Tesouro Selic arba kasdienio likvidumo CDB). Tada paįvairinkite palaipsniui.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Pradėkite nuo skubios pagalbos fondo (didelio pajamingumo grynųjų pinigų, pinigų rinkos fondų arba trumpalaikių iždo obligacijų). Tada paįvairinkite palaipsniui.';

  @override
  String get investFirstSteps_tipTitle => 'Mentoriaus patarimas:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Pradėkite nuo mažo, nuosekliai investuokite ir nebandykite nustatyti rinkos laiko. Laikas yra geriausias jūsų sąjungininkas.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Pradėkite nuo mažo, nuosekliai investuokite ir nebandykite nustatyti rinkos laiko. Laikas yra geriausias jūsų sąjungininkas.';

  @override
  String get investMenu_tesouroTitle => 'Brazilijos iždai';

  @override
  String get investMenu_cdbTitle => 'Banko fiksuotų pajamų (CDB)';

  @override
  String get investMenu_etfsTitle => 'tarptautiniai ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeksas)';

  @override
  String get investMenu_stocksTitle => 'Atsargos';

  @override
  String get investMenu_fundsTitle => 'Lėšos';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Kripto';

  @override
  String get investRegisterCta => 'Registruoti investicijas';

  @override
  String investRegionHintBr(String country) {
    return 'Galioja šalis: $country · Brazilijos katalogas (iždai, CDB, LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Galioja šalis: $country · Pasaulinis katalogas (ETF, NYSE/NASDAQ…). Automatiškai koreguojama iš jūsų įrenginio regiono.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Esminės strategijos';

  @override
  String get strategy_sectionDeepDiveTitle => 'Gilus nardymas (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Skubios pagalbos fondas';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Jūsų finansinis skydas. Padengti 6-12 mėnesių išlaidas. Pirmenybę teikite kasdieniam likvidumui ir mažai rizikai (pvz., Tesouro Selic arba su CDI susietas CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Jūsų finansinis skydas. Padengti 6-12 mėnesių išlaidas. Pirmenybę teikite kasdieniam likvidumui ir mažai rizikai (pvz., pinigų rinkos fondams ir trumpalaikėms iždo obligacijoms).';

  @override
  String get strategy_buyHoldTitle => 'Pirkite ir laikykite';

  @override
  String get strategy_buyHoldBody =>
      'Pirkite kokybišką turtą ir laikykite jį ilgą laiką. Laikui bėgant sutelkite dėmesį į drausmę, kokybę ir reinvestavimą.';

  @override
  String get strategy_diversificationTitle => 'Įvairinimas';

  @override
  String get strategy_diversificationBodyBr =>
      'Paskirstykite savo kapitalą fiksuotoms pajamoms, akcijoms, FII ir tarptautiniam turtui, kad sumažintumėte riziką ir pagerintumėte pagal riziką koreguotą grąžą.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Paskirstykite savo kapitalą tarp obligacijų, akcijų, REIT ir tarptautinių pozicijų, kad sumažintumėte riziką ir pagerintumėte pagal riziką įvertintą grąžą.';

  @override
  String get strategy_dcaTitle => 'Dolerio išlaidų vidurkis (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konsistencija pranoksta genialumą. Investuoti kiekvieną mėnesį dažnai yra veiksmingiau nei bandyti pasirinkti geriausią įėjimo tašką.';

  @override
  String get strategy_smartGoalsTitle => 'SMART tikslai';

  @override
  String get strategy_smartGoalsBody =>
      'Jūsų tikslai turi būti konkretūs, išmatuojami, pasiekiami, aktualūs ir apriboti laiku.';

  @override
  String get strategy_503020Title => '50-30-20 taisyklė';

  @override
  String get strategy_503020Body =>
      'Paprasta biudžeto sudarymo sistema: 50 % poreikių, 30 % norų, 20 % investicijų ir tikslų.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Turto paskirstymas (išplėstinis)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Sužinokite, kaip sukurti paskirstymą pagal tikslą ir horizontą, koreguojant riziką, koreliaciją ir perbalansavimą.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Pasauliniai ETF ir indeksai (išplėstiniai)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Sužinokite apie pasaulinius indeksus (pvz., S&P 500), ETF ir kaip disciplinuotai sukurti tarptautinį poveikį.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Mokesčiai ir ataskaitų teikimas (išplėstinė)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Supraskite pagrindines mokesčių sąvokas ir kaip vesti įrašus, kad galėtumėte saugiai pranešti apie investicijas.';

  @override
  String get strategy_premiumLockedBody =>
      'Aukščiausios kokybės turinys. Suaktyvinkite „Cyber“ / „Grimm“ / „Hive“ temą, kad atrakintumėte investicinį „Deep Dive“.';

  @override
  String get homeShowcaseTitle => 'Vitrina';

  @override
  String get homeShowcaseProfileSimTitle => 'Rizikos profilio viktorina';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Raskite savo investuotojo profilį per kelias minutes.';

  @override
  String get homeShowcaseStrategiesTitle => 'Rekomenduojamos strategijos';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Tiesioginės nuorodos mokytis ir taikyti strategijas.';

  @override
  String get homeShowcaseMentorHubTitle =>
      'Mentorius: viktorinos ir strategijos';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Greita prieiga prie rizikos profilio viktorinos ir rekomenduojamų strategijų.';

  @override
  String get homeTourStepClassicTitle => 'Klasikinis režimas';

  @override
  String get homeTourStepClassicBody =>
      'Atidaromas pradinis programų skydelis: operacijos, tikslai, investicijos ir nustatymai žinomu išdėstymu.';

  @override
  String get homeTourStepVitrineTitle => 'Vitrinos zona';

  @override
  String get homeTourStepVitrineBody =>
      'Nuorodos mokytis ir praktikuotis: investuotojo profilis, strategijos ir mentoriaus centras.';

  @override
  String get homeTourStepProfileTitle => 'Profilio viktorina';

  @override
  String get homeTourStepProfileBody =>
      'Atsakykite į klausimyną, kad sužinotumėte savo rizikos profilį ir pamatytumėte suderintus pasiūlymus.';

  @override
  String get homeTourStepStrategiesTitle => 'strategijos';

  @override
  String get homeTourStepStrategiesBody =>
      'Turinys, skirtas organizuoti finansus, drausmingai investuoti ir išvengti įprastų spąstų.';

  @override
  String get homeTourStepHubTitle => 'Mentoriaus šakotuvas';

  @override
  String get homeTourStepHubBody =>
      'Greitas profilio viktorinos meniu ir rekomenduojamos strategijos.';

  @override
  String get homeTourStepPremiumTitle => 'Premium funkcijos';

  @override
  String get homeTourStepPremiumBody =>
      'Automatinis kuravimas, išplėstinės diagramos ir mėnesinės ataskaitos – pasiekiama užsisakius „Premium“ prenumeratą.';

  @override
  String get homeTourStepMarketTitle => 'Rinkos momentinė nuotrauka';

  @override
  String get homeTourStepMarketBody =>
      'Rinkos kontekstas (Brazilijoje arba visame pasaulyje), pagrįstas jūsų regionu ir konvertuota grynąja verte.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentoriaus skaičiuoklė';

  @override
  String get homeTourStepCalculatorBody =>
      'Imituokite sudėtines palūkanas, infliaciją ir žiūrėkite turto diagramą; toliau atidarome šį įrankį.';

  @override
  String get quizProfile_title => 'Rizikos profilio viktorina';

  @override
  String quizProfile_progress(int current, int total) {
    return '$current klausimas iš $total';
  }

  @override
  String get quizProfile_badge => 'RIZIKOS PROFILIŲ Viktorina';

  @override
  String get quizProfile_resultTitle => 'JŪSŲ PROFILIS YRA';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALIOS INVESTICIJOS:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'TYRĖKITE INVESTICIJŲ';

  @override
  String get quizProfile_exit => 'IŠĖJIMAS';

  @override
  String get quizKnowledge_title => 'Žinių viktorina';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '$current klausimas iš $total';
  }
}

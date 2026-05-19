// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Bilanci';

  @override
  String get gastosDiarios => 'Shpenzimet ditore';

  @override
  String get confirmarTransacao => 'Konfirmo transaksionin\nDeklaratë';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Transferet';

  @override
  String get investimentos => 'Investimet';

  @override
  String get configuracoes => 'Cilësimet\nProfili';

  @override
  String get perfil => '';

  @override
  String get sair => 'Dilni';

  @override
  String get entrar => 'Identifikohu';

  @override
  String get cadastrar => 'Regjistrohu';

  @override
  String get email => 'Email';

  @override
  String get senha => 'Fjalëkalimi';

  @override
  String get nome => 'Emri';

  @override
  String get cpf => 'Numri ID';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Vazhdo';

  @override
  String get voltar => 'Mbrapa';

  @override
  String get cancelar => 'Anulo';

  @override
  String get salvar => 'Ruaj';

  @override
  String get editar => 'Edit';

  @override
  String get excluir => 'Fshij';

  @override
  String get sucesso => 'Suksese\nGabim';

  @override
  String get erro => '';

  @override
  String get carregando => 'Duke u ngarkuar...';

  @override
  String get semDados => 'Nuk ka të dhëna';

  @override
  String get tentarNovamente => 'Provo sërish';

  @override
  String get relatorios => 'Raportet';

  @override
  String get gastosPorCategoria => 'Shpenzimet sipas kategorive';

  @override
  String get ultimosSeteDias => '7 ditët e fundit';

  @override
  String get totalGasto => 'Totali i shpenzuar';

  @override
  String get transacoes => 'Transaksionet\nKategoria';

  @override
  String get categoria => '';

  @override
  String get data => 'Data';

  @override
  String get valor => 'Vlera';

  @override
  String get descricao => 'Përshkrimi';

  @override
  String get alimentacao => 'Ushqim';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Koha e lire';

  @override
  String get saude => 'Shëndeti';

  @override
  String get outros => 'Të tjera';

  @override
  String get notificacoes => 'Njoftimet';

  @override
  String get permissaoNotificacoes => 'Leja e njoftimit';

  @override
  String get ativarMonitoramento => 'Aktivizo monitorimin e shpenzimeve';

  @override
  String get descricaoMonitoramento =>
      'Lejo aplikacionin të monitorojë automatikisht transaksionet tuaja bankare për të organizuar financat tuaja.';

  @override
  String get idioma => 'Gjuha';

  @override
  String get moeda => 'Monedha';

  @override
  String get compararInvestimentos => 'Krahasoni Investimet';

  @override
  String get descricaoLocalizacao =>
      'Për të krahasuar investimet lokale (CDB/CDI) me tarifat ndërkombëtare, ne kemi nevojë për vendndodhjen tuaj.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Kërkohet leje për vendndodhjen';

  @override
  String get rendaFixa => 'Të ardhura fikse';

  @override
  String get rendaVariavel => 'Të ardhura të ndryshueshme';

  @override
  String get tesouroDireto => 'Thesari Direkt';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Stoqet';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kriptovalutat';

  @override
  String get rendimento => 'Kthimi';

  @override
  String get rentabilidade => 'Rentabiliteti';

  @override
  String get aplicar => 'Aplikoni';

  @override
  String get resgatar => 'Shlyej';

  @override
  String get simular => 'Simuloni';

  @override
  String get metas => 'Golat';

  @override
  String get estrategias => '';

  @override
  String get conhecimento => 'Njohuri';

  @override
  String get chat => 'Biseda';

  @override
  String get enviarMensagem => 'Dërgo mesazh';

  @override
  String get digiteMensagem => 'Shkruaj një mesazh...';

  @override
  String get alertaGastos => 'Alarmi për shpenzimet';

  @override
  String alertaGastosMsg(int percent) {
    return 'Ju keni përdorur tashmë $percent% të kufirit tuaj të kreditit.';
  }

  @override
  String get fechamentoFatura => 'Mbyllja e Faturës';

  @override
  String get fechamentoFaturaMsg =>
      'Nesër është dita e mbylljes. Koha e mirë për të rishikuar shpenzimet.';

  @override
  String get faturaVencendo => 'Fatura e detyrueshme';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Fatura duhet të përfundojë në $dias ditë. Kontrolloni bilancin tuaj.';
  }

  @override
  String get regra30 => 'Këshillë: Rregulli 30%.';

  @override
  String get regra30Msg =>
      'Mbajeni përdorimin nën 30% për të përmirësuar rezultatin tuaj të kreditit.';

  @override
  String get diaDeOuro => 'Dita e Artë!';

  @override
  String get diaDeOuroMsg =>
      'Blerjet tuaja sot do të paguhen vetëm për 40 ditë!';

  @override
  String get alertaJuros => 'Paralajmërim: Interes';

  @override
  String get alertaJurosMsg =>
      'Gjendja juaj nuk e mbulon faturën. Shmangni kredinë rrotulluese!';

  @override
  String get notaSaude => 'Shëndeti Financiar';

  @override
  String get notaExcelente =>
      'E shkëlqyeshme! Ju keni një shëndet të mirë financiar.';

  @override
  String get notaBom => 'Mirë, por mund të përmirësohet.';

  @override
  String get notaAtencao => 'Kujdes ndaj shpenzimeve.';

  @override
  String get notaRevisar => 'Rishikoni financat tuaja.';

  @override
  String get mentorInsightTitle => 'Udhëzimet e mentorit';

  @override
  String get mentorInsightLoading => 'Po merr të dhënat e tregut…';

  @override
  String get mentorInsightError =>
      'Nuk mund të ngarkonte të dhënat për momentin. Provo sërish së shpejti.';

  @override
  String get mentorInsightOffline =>
      'Je jashtë linje. Lidhu për të marrë kuotat dhe njohuritë e Mentorit.';

  @override
  String get mentorAllocationDefensive =>
      'Duke pasur parasysh paqëndrueshmërinë aktuale, jepni përparësi ruajtjes së kapitalit dhe likuiditetit përpara se të ndiqni kthimet.';

  @override
  String get mentorAllocationBalanced =>
      'Mbrojtja dhe rritja e ekuilibrit: diversifikoni dhe rishikoni horizontin tuaj të synimit.';

  @override
  String get mentorAllocationOffensive =>
      'Profili juaj lejon më shumë rrezik: qëndroni të disiplinuar dhe shmangni përqendrimin e rëndë.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Simbolet e shqyrtuara: $symbols';
  }

  @override
  String get currencyFollowLocale =>
      'Automatik (gjuhë)\nLlogaritësi i Mentorit';

  @override
  String get compoundCalculatorTitle => '— Interesi i përbërë';

  @override
  String get compoundCalculatorSubtitle =>
      'Simuloni kontributet, fitimin nominal kundrejt real (pas inflacionit) dhe shënimet e mentorit.';

  @override
  String get compoundInitialLabel => 'Shuma e përgjithshme fillestare';

  @override
  String get compoundMonthlyLabel => 'Kontribut mujor';

  @override
  String get compoundRateLabel => 'Norma e interesit';

  @override
  String get compoundRateAnnual => 'në vit';

  @override
  String get compoundRateMonthly => 'në muaj';

  @override
  String get compoundHorizonLabel => 'Horizonti kohor';

  @override
  String get compoundHorizonYears => 'vjet';

  @override
  String get compoundHorizonMonths => 'muaj';

  @override
  String get compoundInflationLabel => 'Inflacioni i vlerësuar (% në vit)';

  @override
  String get compoundCalculate => 'Llogarit';

  @override
  String get compoundChartInvested => 'Totali i investuar';

  @override
  String get compoundChartInterest => 'Interesi i fituar';

  @override
  String get compoundSummaryNominalEnd => 'Bilanci përfundimtar (nominal)';

  @override
  String get compoundSummaryRealGain => 'Fitimi real (fuqia blerëse)';

  @override
  String get compoundMentorCardTitle => 'Këshilla mentore';

  @override
  String get compoundInvalidInput => 'Futni vlera të vlefshme (horizonti > 0).';

  @override
  String get userPersonaSectionTitle => 'Ton mentor';

  @override
  String get userPersonaNovice => 'Fillestar';

  @override
  String get userPersonaStrategist => 'Strateg';

  @override
  String get userPersonaRiskTaker => 'Riskmarrës';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Hapni pasqyrën e plotë të mentorit';

  @override
  String get investFirstSteps_title => 'Hapat e parë';

  @override
  String get investFirstSteps_brokerTitle => 'Zgjidhni një ndërmjetës';

  @override
  String get investFirstSteps_brokerBody =>
      'Kërkoni për institucione të rregulluara dhe me reputacion. Krahasoni tarifat, produktet dhe besueshmërinë përpara se të hapni një llogari.';

  @override
  String get investFirstSteps_openAccountTitle => 'Hapni llogarinë tuaj';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Hyrja dixhitale. Në Brazil, zakonisht keni nevojë për CPF/RG dhe nganjëherë dëshmi të adresës.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Futja dixhitale ndryshon sipas vendit. Zakonisht ju duhet një dokument identiteti dhe verifikim identiteti/adrese.';

  @override
  String get investFirstSteps_transferTitle => 'Transferoni fonde';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Dërgoni para nëpërmjet PIX ose transfertë bankare te ndërmjetësi juaj. Bilanci bëhet i disponueshëm për të investuar.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Transferoni fonde nëpërmjet transfertës bankare ose mënyrave lokale të pagesës (varet nga vendi juaj). Bilanci bëhet i disponueshëm për të investuar.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Njihni profilin tuaj të rrezikut';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Përgjigjuni një pyetësori të përshtatshmërisë. Kuptoni nëse jeni konservator, i moderuar apo agresiv.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Blini aktivin tuaj të parë';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Filloni me një fond emergjence (Tesouro Selic ose një CDB me likuiditet ditor). Pastaj diversifikojeni gradualisht.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Filloni me një fond emergjence (para me rendiment të lartë, fondet e tregut të parasë ose obligacionet afatshkurtra të thesarit). Pastaj diversifikojeni gradualisht.\nKëshillë për mentorin';

  @override
  String get investFirstSteps_tipTitle => ':';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Filloni pak, investoni vazhdimisht dhe shmangni përpjekjet për të përcaktuar kohën e tregut. Koha është aleati juaj më i mirë.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Filloni nga pak, investoni vazhdimisht dhe shmangni përpjekjet për të përcaktuar kohën e tregut. Koha është aleati juaj më i mirë.';

  @override
  String get investMenu_tesouroTitle => 'Thesaret Braziliane';

  @override
  String get investMenu_cdbTitle => 'Banka me të ardhura fikse (CDB)';

  @override
  String get investMenu_etfsTitle => 'ETF ndërkombëtare';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeksi)';

  @override
  String get investMenu_stocksTitle => 'Stoqet';

  @override
  String get investMenu_fundsTitle => 'Fondet';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Ndërkombëtare';

  @override
  String get investMenu_cryptoTitle => 'Kripto';

  @override
  String get investRegisterCta => 'Regjistro investime';

  @override
  String investRegionHintBr(String country) {
    return 'Vendi efektiv: $country · Katalogu i Brazilit (Thesaret, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Vendi efektiv: $country · Katalogu global (ETF, NYSE/NASDAQ…). Rregulluar automatikisht nga rajoni i pajisjes suaj.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Strategjitë thelbësore';

  @override
  String get strategy_sectionDeepDiveTitle => 'Zhytje e thellë (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Fondi i urgjencës';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Mburoja juaj financiare. Mbuloni 6-12 muaj shpenzime. Jepini përparësi likuiditetit ditor dhe rrezikut të ulët (p.sh. Tesouro Selic ose CDB e lidhur me CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Mburoja juaj financiare. Mbuloni 6-12 muaj shpenzime. Jepini përparësi likuiditetit ditor dhe rrezikut të ulët (p.sh. fondet e tregut të parasë dhe obligacionet afatshkurtra të thesarit).';

  @override
  String get strategy_buyHoldTitle => 'Blej dhe mbaj';

  @override
  String get strategy_buyHoldBody =>
      'Blini asete cilësore dhe mbajini për një kohë të gjatë. Fokusohuni te disiplina, cilësia dhe riinvestimi me kalimin e kohës.';

  @override
  String get strategy_diversificationTitle => 'Diversifikimi';

  @override
  String get strategy_diversificationBodyBr =>
      'Shpërndani kapitalin tuaj në të ardhura fikse, aksione, FII dhe aktive ndërkombëtare për të zvogëluar rrezikun dhe për të përmirësuar kthimet e rregulluara sipas rrezikut.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Shpërndani kapitalin tuaj nëpër obligacione, aksione, REIT dhe ekspozim ndërkombëtar për të reduktuar rrezikun dhe për të përmirësuar kthimet e rregulluara sipas rrezikut.';

  @override
  String get strategy_dcaTitle => 'Mesatarja e kostos në dollarë (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konsistenca e mund gjenialitetin. Investimi çdo muaj është shpesh më efektiv sesa përpjekja për të zgjedhur pikën e përsosur të hyrjes.\nGolat';

  @override
  String get strategy_smartGoalsTitle => 'SMART';

  @override
  String get strategy_smartGoalsBody =>
      'Qëllimet tuaja duhet të jenë specifike, të matshme, të arritshme, relevante dhe të kufizuara në kohë.\nRregulli';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Një kornizë e thjeshtë buxhetimi: 50% nevoja, 30% dëshira, 20% investime dhe qëllime.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Alokimi i aseteve (i avancuar)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Mësoni se si të ndërtoni një shpërndarje sipas qëllimit dhe horizontit, duke rregulluar rrezikun, korrelacionin dhe ribalancimin.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETF dhe indekset globale (të avancuara)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Mësoni rreth indekseve globale (p.sh. S&P 500), ETF-ve dhe si të krijoni ekspozim ndërkombëtar me disiplinë.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Taksat dhe raportimet (të avancuara)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Kuptoni konceptet kryesore tatimore dhe si të mbani shënime për të raportuar investimet në mënyrë të sigurt.';

  @override
  String get strategy_premiumLockedBody =>
      'Përmbajtje premium. Aktivizoni një temë Cyber/Grimm/Hive për të zhbllokuar investimin Deep Dive.';

  @override
  String get homeShowcaseTitle => 'vitrinë';

  @override
  String get homeShowcaseProfileSimTitle => 'Kuizi i profilit të rrezikut';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Gjeni profilin tuaj të investitorit në pak minuta.';

  @override
  String get homeShowcaseStrategiesTitle => 'Strategjitë e rekomanduara';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Drejtojini shkurtoret për të mësuar dhe zbatuar strategji.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentori: Kuize & Strategji';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Qasje e shpejtë në kuizin e profilit të rrezikut dhe strategjitë e rekomanduara.';

  @override
  String get homeTourStepClassicTitle => 'modaliteti klasik';

  @override
  String get homeTourStepClassicBody =>
      'Hap panelin origjinal të aplikacionit: transaksionet, qëllimet, investimet dhe cilësimet në paraqitjen e njohur.';

  @override
  String get homeTourStepVitrineTitle => 'Zona e vitrinës';

  @override
  String get homeTourStepVitrineBody =>
      'Shkurtoret për të mësuar dhe praktikuar: profili i investitorit, strategjitë dhe qendra e Mentorit.\nKuizi i profilit të';

  @override
  String get homeTourStepProfileTitle => '';

  @override
  String get homeTourStepProfileBody =>
      'Përgjigjuni pyetësorit për të zbuluar profilin tuaj të rrezikut dhe për të parë sugjerimet e përafruara.\nStrategjitë';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Përmbajtje për të organizuar financat, për të investuar me disiplinë dhe për të shmangur grackat e zakonshme.';

  @override
  String get homeTourStepHubTitle => 'Qendra e mentorit';

  @override
  String get homeTourStepHubBody =>
      'Menu e shpejtë për kuizin e profilit dhe strategjitë e rekomanduara.';

  @override
  String get homeTourStepPremiumTitle => 'Karakteristikat Premium';

  @override
  String get homeTourStepPremiumBody =>
      'Këshillim automatik, grafikët e avancuar dhe raporte mujore — të disponueshme me një abonim Premium.';

  @override
  String get homeTourStepMarketTitle => 'Foto e tregut';

  @override
  String get homeTourStepMarketBody =>
      'Konteksti i tregut (Brazil ose global) bazuar në rajonin tuaj plus vlerën neto të konvertuar.\nLlogaritësi i Mentorit';

  @override
  String get homeTourStepCalculatorTitle => '';

  @override
  String get homeTourStepCalculatorBody =>
      'Simuloni interesin e përbërë, inflacionin dhe shikoni grafikun e pasurisë; më pas hapim këtë mjet.';

  @override
  String get quizProfile_title => 'Kuizi i profilit të rrezikut';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Pyetja $current nga $total\nKUIZ PROFILI I RREZIKUT';
  }

  @override
  String get quizProfile_badge => '';

  @override
  String get quizProfile_resultTitle => 'PROFILI JUAJ ËSHTË';

  @override
  String get quizProfile_idealInvestmentsTitle => 'INVESTIMET IDEAL:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'EKSPLORE INVESTIMET';

  @override
  String get quizProfile_exit => 'DALJE';

  @override
  String get quizKnowledge_title => 'Kuizi i njohurive';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Pyetja $current nga $total';
  }
}

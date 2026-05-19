// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'Mentorrahandus';

  @override
  String get saldo => 'Tasakaal';

  @override
  String get gastosDiarios => 'Igapäevased kulud';

  @override
  String get confirmarTransacao => 'Kinnitage tehing';

  @override
  String get extrato => 'avaldus';

  @override
  String get transferencias => 'Ülekanded';

  @override
  String get investimentos => 'Investeeringud';

  @override
  String get configuracoes => 'Seaded';

  @override
  String get perfil => 'profiil';

  @override
  String get sair => 'Väljalogimine';

  @override
  String get entrar => 'Logi sisse';

  @override
  String get cadastrar => 'Registreeri';

  @override
  String get email => 'E-post';

  @override
  String get senha => 'Parool';

  @override
  String get nome => 'Nimi';

  @override
  String get cpf => 'ID-number';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Jätka';

  @override
  String get voltar => 'Tagakülg';

  @override
  String get cancelar => 'Tühista';

  @override
  String get salvar => 'Salvestage';

  @override
  String get editar => 'Redigeeri';

  @override
  String get excluir => 'Kustuta';

  @override
  String get sucesso => 'Edu';

  @override
  String get erro => 'Viga';

  @override
  String get carregando => 'Laadimine...';

  @override
  String get semDados => 'Andmed puuduvad';

  @override
  String get tentarNovamente => 'Proovige uuesti';

  @override
  String get relatorios => 'aruanded';

  @override
  String get gastosPorCategoria => 'Kulud kategooriate kaupa';

  @override
  String get ultimosSeteDias => 'Viimased 7 päeva';

  @override
  String get totalGasto => 'Kogukulu';

  @override
  String get transacoes => 'Tehingud';

  @override
  String get categoria => 'Kategooria';

  @override
  String get data => 'Kuupäev';

  @override
  String get valor => 'Väärtus';

  @override
  String get descricao => 'Kirjeldus';

  @override
  String get alimentacao => 'Toit';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Vaba aeg';

  @override
  String get saude => 'Tervis';

  @override
  String get outros => 'Muud';

  @override
  String get notificacoes => 'Teavitused';

  @override
  String get permissaoNotificacoes => 'Teavitamise luba';

  @override
  String get ativarMonitoramento => 'Kulude jälgimise lubamine';

  @override
  String get descricaoMonitoramento =>
      'Lubage rakendusel teie rahaasjade korraldamiseks automaatselt teie pangatehinguid jälgida.';

  @override
  String get idioma => 'Keel';

  @override
  String get moeda => 'Valuuta';

  @override
  String get compararInvestimentos => 'Võrdle investeeringuid';

  @override
  String get descricaoLocalizacao =>
      'Kohalike investeeringute (CDB/CDI) ja rahvusvaheliste intressimäärade võrdlemiseks vajame teie asukohta.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Vajalik asukohaluba';

  @override
  String get rendaFixa => 'Püsitulu';

  @override
  String get rendaVariavel => 'Muutuv sissetulek';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Varud';

  @override
  String get fiis => 'FII-d';

  @override
  String get criptomoedas => 'Krüptovaluutad';

  @override
  String get rendimento => 'Tagastamine';

  @override
  String get rentabilidade => 'Kasumlikkus';

  @override
  String get aplicar => 'Taotlege';

  @override
  String get resgatar => 'Lunasta';

  @override
  String get simular => 'Simuleeri';

  @override
  String get metas => 'Eesmärgid';

  @override
  String get estrategias => 'strateegiad';

  @override
  String get conhecimento => 'Teadmised';

  @override
  String get chat => 'Vestlus';

  @override
  String get enviarMensagem => 'Saada sõnum';

  @override
  String get digiteMensagem => 'Sisestage sõnum...';

  @override
  String get alertaGastos => 'Kulutusteade';

  @override
  String alertaGastosMsg(int percent) {
    return 'Olete juba kasutanud $percent% oma krediidilimiidist.';
  }

  @override
  String get fechamentoFatura => 'Arve sulgemine';

  @override
  String get fechamentoFaturaMsg =>
      'Homme on sulgemispäev. Hea aeg kulude ülevaatamiseks.';

  @override
  String get faturaVencendo => 'Arve maksetähtaeg';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Arve tähtaeg on $dias päeva(t). Kontrollige oma saldot.';
  }

  @override
  String get regra30 => 'Näpunäide: 30% reegel';

  @override
  String get regra30Msg =>
      'Krediidiskoori parandamiseks hoidke kasutust alla 30%.';

  @override
  String get diaDeOuro => 'Kuldne päev!';

  @override
  String get diaDeOuroMsg =>
      'Teie tänaste ostude eest makstakse alles 40 päeva pärast!';

  @override
  String get alertaJuros => 'Hoiatus: huvi';

  @override
  String get alertaJurosMsg =>
      'Teie saldo ei kata arvet. Väldi uuenevat krediiti!';

  @override
  String get notaSaude => 'Finantstervis';

  @override
  String get notaExcelente => 'Suurepärane! Sul on hea rahaline tervis.';

  @override
  String get notaBom => 'Hea, kuid võib parandada.';

  @override
  String get notaAtencao => 'Tähelepanu kulutamisele.';

  @override
  String get notaRevisar => 'Vaadake üle oma rahaasjad.';

  @override
  String get mentorInsightTitle => 'Mentori juhendamine';

  @override
  String get mentorInsightLoading => 'Turuandmete toomine…';

  @override
  String get mentorInsightError =>
      'Andmeid ei saanud praegu laadida. Proovige varsti uuesti.';

  @override
  String get mentorInsightOffline =>
      'Te pole võrgus. Looge ühendus tsitaatide ja mentorite ülevaate saamiseks.';

  @override
  String get mentorAllocationDefensive =>
      'Arvestades praegust volatiilsust, seadke kapitali säilitamine ja likviidsus enne tootluse otsimist esikohale.';

  @override
  String get mentorAllocationBalanced =>
      'Tasakaalu kaitse ja kasv: mitmekesistada ja vaadata uuesti oma eesmärkide horisonti.';

  @override
  String get mentorAllocationOffensive =>
      'Teie profiil võimaldab rohkem riske: püsige distsiplineeritud ja vältige suurt keskendumist.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Ülevaadatud sümbolid: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automaatne (keel)';

  @override
  String get compoundCalculatorTitle => 'Mentori kalkulaator – liitintress';

  @override
  String get compoundCalculatorSubtitle =>
      'Simuleerige sissemakseid, nominaalset või tegelikku kasumit (pärast inflatsiooni) ja juhendaja märkmeid.';

  @override
  String get compoundInitialLabel => 'Esialgne ühekordne summa';

  @override
  String get compoundMonthlyLabel => 'Igakuine sissemakse';

  @override
  String get compoundRateLabel => 'Intressimäär';

  @override
  String get compoundRateAnnual => 'aastas';

  @override
  String get compoundRateMonthly => 'kuus';

  @override
  String get compoundHorizonLabel => 'Ajahorisont';

  @override
  String get compoundHorizonYears => 'aastat';

  @override
  String get compoundHorizonMonths => 'kuud';

  @override
  String get compoundInflationLabel => 'Hinnanguline inflatsioon (% aastas)';

  @override
  String get compoundCalculate => 'Arvutage';

  @override
  String get compoundChartInvested => 'Investeeritud kokku';

  @override
  String get compoundChartInterest => 'Teenitud intressid';

  @override
  String get compoundSummaryNominalEnd => 'Lõppsaldo (nominaalne)';

  @override
  String get compoundSummaryRealGain => 'Tegelik kasum (ostujõud)';

  @override
  String get compoundMentorCardTitle => 'Mentori nõuanded';

  @override
  String get compoundInvalidInput =>
      'Sisestage kehtivad väärtused (horisont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentori toon';

  @override
  String get userPersonaNovice => 'Algaja';

  @override
  String get userPersonaStrategist => 'Strateeg';

  @override
  String get userPersonaRiskTaker => 'Riskija';

  @override
  String get userPersonaConservative => 'Säästja';

  @override
  String get compoundOpenFullInsight => 'Avage mentori täielik ülevaade';

  @override
  String get investFirstSteps_title => 'Esimesed sammud';

  @override
  String get investFirstSteps_brokerTitle => 'Valige maakler';

  @override
  String get investFirstSteps_brokerBody =>
      'Otsige reguleeritud, hea mainega asutusi. Enne konto avamist võrrelge tasusid, tooteid ja usaldusväärsust.';

  @override
  String get investFirstSteps_openAccountTitle => 'Ava oma konto';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitaalne sisseehitamine. Brasiilias vajate tavaliselt CPF/RG-d ja mõnikord ka aadressitõendit.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digitaalne liitumine erineb riigiti. Tavaliselt vajate isikut tõendavat dokumenti ja isiku/aadressi kinnitamist.';

  @override
  String get investFirstSteps_transferTitle => 'Raha ülekandmine';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Saatke raha PIX-i või pangaülekande kaudu oma maaklerile. Jääk muutub investeerimiseks kättesaadavaks.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Kandke raha üle pangaülekande või kohalike makseviiside kaudu (sõltub teie riigist). Jääk muutub investeerimiseks kättesaadavaks.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Tea oma riskiprofiili';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Vasta sobivusküsimustikule. Saage aru, kas olete konservatiivne, mõõdukas või agressiivne.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Ostke oma esimene vara';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Alusta hädaabifondiga (Tesouro Selic või igapäevase likviidsusega CDB). Seejärel mitmekesistada järk-järgult.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Alustage hädaabifondist (kõrge tootlusega sularaha, rahaturufondid või lühiajalised riigivõlakirjad). Seejärel mitmekesistada järk-järgult.';

  @override
  String get investFirstSteps_tipTitle => 'Mentori nõuanne:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Alustage väikeselt, investeerige järjepidevalt ja vältige turgu ajastamise katseid. Aeg on teie parim liitlane.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Alustage väikeselt, investeerige järjepidevalt ja vältige turgu ajastamise katseid. Aeg on teie parim liitlane.';

  @override
  String get investMenu_tesouroTitle => 'Brasiilia riigikassad';

  @override
  String get investMenu_cdbTitle => 'Panga fikseeritud tulu (CDB)';

  @override
  String get investMenu_etfsTitle => 'Rahvusvahelised ETF-id';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'Varud';

  @override
  String get investMenu_fundsTitle => 'Fondid';

  @override
  String get investMenu_fiisTitle => 'FII-d';

  @override
  String get investMenu_reitsTitle => 'REIT';

  @override
  String get investMenu_internationalTitle => 'rahvusvaheline';

  @override
  String get investMenu_cryptoTitle => 'Krüpto';

  @override
  String get investRegisterCta => 'Registreeri investeering';

  @override
  String investRegionHintBr(String country) {
    return 'Kehtiv riik: $country · Brasiilia kataloog (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Kehtiv riik: $country · Ülemaailmne kataloog (ETF-id, NYSE/NASDAQ…). Kohandatud automaatselt teie seadme piirkonnast.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Olulised strateegiad';

  @override
  String get strategy_sectionDeepDiveTitle => 'Süvasukeldumine (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Hädaabifond';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Teie finantskilp. Kata 6-12 kuu kulud. Eelistage igapäevast likviidsust ja madalat riski (nt Tesouro Selic või CDI-ga seotud CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Teie finantskilp. Kata 6-12 kuu kulud. Eelistage igapäevast likviidsust ja madalat riski (nt rahaturufondid ja lühiajalised riigivõlakirjad).';

  @override
  String get strategy_buyHoldTitle => 'Osta ja hoia';

  @override
  String get strategy_buyHoldBody =>
      'Ostke kvaliteetseid varasid ja hoidke neid pikaajaliselt. Keskenduge distsipliinile, kvaliteedile ja aja jooksul reinvesteerimisele.';

  @override
  String get strategy_diversificationTitle => 'Mitmekesistamine';

  @override
  String get strategy_diversificationBodyBr =>
      'Jaotage oma kapitali fikseeritud tulu, aktsiate, FIIde ja rahvusvaheliste varade vahel, et vähendada riski ja parandada riskiga kohandatud tulu.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Jaotage oma kapitali võlakirjade, aktsiate, REIT-ide ja rahvusvaheliste riskide vähendamiseks ja parandage riskiga kohandatud tulu.';

  @override
  String get strategy_dcaTitle => 'Dollar-kulu keskmine (DCA)';

  @override
  String get strategy_dcaBody =>
      'Järjepidevus ületab geniaalsuse. Igakuine investeerimine on sageli tõhusam kui ideaalse sisenemispunkti valimine.';

  @override
  String get strategy_smartGoalsTitle => 'SMART eesmärgid';

  @override
  String get strategy_smartGoalsBody =>
      'Teie eesmärgid peaksid olema konkreetsed, mõõdetavad, saavutatavad, asjakohased ja ajalised.';

  @override
  String get strategy_503020Title => '50-30-20 reegel';

  @override
  String get strategy_503020Body =>
      'Lihtne eelarveraamistik: 50% vajadused, 30% soovid, 20% investeerimine ja eesmärgid.';

  @override
  String get strategy_deepDive_allocationTitle => 'Varade jaotamine (täpsem)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Õppige, kuidas luua jaotust eesmärgi ja horisondi alusel, kohandades riski, korrelatsiooni ja tasakaalustamist.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globaalsed ETF-id ja indeksid (täiustatud)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Siit saate teada ülemaailmsete indeksite (nt S&P 500), ETF-ide ja distsipliiniga rahvusvaheliste avalikkuse suurendamise kohta.';

  @override
  String get strategy_deepDive_taxesTitle => 'Maksud ja aruandlus (täpsem)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Saate aru peamistest maksukontseptsioonidest ja sellest, kuidas pidada arvestust, et investeeringutest ohutult aru anda.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium sisu. Investeeringute Deep Dive avamiseks aktiveerige teema Cyber/Grimm/Hive.';

  @override
  String get homeShowcaseTitle => 'Vitriin';

  @override
  String get homeShowcaseProfileSimTitle => 'Riskiprofiili viktoriin';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Leidke mõne minutiga oma investorprofiil.';

  @override
  String get homeShowcaseStrategiesTitle => 'Soovitatavad strateegiad';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Otsesed otseteed strateegiate õppimiseks ja rakendamiseks.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: viktoriinid ja strateegiad';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Kiire juurdepääs riskiprofiili viktoriinile ja soovitatavatele strateegiatele.';

  @override
  String get homeTourStepClassicTitle => 'Klassikaline režiim';

  @override
  String get homeTourStepClassicBody =>
      'Avab algse rakenduste paneeli: tehingud, eesmärgid, investeeringud ja seaded tuttavas paigutuses.';

  @override
  String get homeTourStepVitrineTitle => 'Vitriin';

  @override
  String get homeTourStepVitrineBody =>
      'Otseteed õppimiseks ja harjutamiseks: investori profiil, strateegiad ja mentori keskus.';

  @override
  String get homeTourStepProfileTitle => 'Profiili viktoriin';

  @override
  String get homeTourStepProfileBody =>
      'Vastake küsimustikule, et teada saada oma riskiprofiil ja näha kooskõlastatud soovitusi.';

  @override
  String get homeTourStepStrategiesTitle => 'strateegiad';

  @override
  String get homeTourStepStrategiesBody =>
      'Sisu rahaasjade korraldamiseks, distsipliiniga investeerimiseks ja tavaliste lõkse vältimiseks.';

  @override
  String get homeTourStepHubTitle => 'Mentori jaotur';

  @override
  String get homeTourStepHubBody =>
      'Profiili viktoriini kiirmenüü ja soovitatavad strateegiad.';

  @override
  String get homeTourStepPremiumTitle => 'Premium funktsioonid';

  @override
  String get homeTourStepPremiumBody =>
      'Automaatne juhendamine, täpsemad diagrammid ja igakuised aruanded – saadaval Premium-tellimusega.';

  @override
  String get homeTourStepMarketTitle => 'Turu hetktõmmis';

  @override
  String get homeTourStepMarketBody =>
      'Turu kontekst (Brasiilia või ülemaailmne), mis põhineb teie piirkonnal pluss konverteeritud netoväärtus.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentori kalkulaator';

  @override
  String get homeTourStepCalculatorBody =>
      'Simuleerige liitintressi, inflatsiooni ja vaadake rikkuse diagrammi; järgmisena avame selle tööriista.';

  @override
  String get quizProfile_title => 'Riskiprofiili viktoriin';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Küsimus $current/$total';
  }

  @override
  String get quizProfile_badge => 'RISKIPROFIILI Viktoriin';

  @override
  String get quizProfile_resultTitle => 'TEIE PROFIIL ON';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEAALSED INVESTEERINGUD:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'UURIGE INVESTEERINGUD';

  @override
  String get quizProfile_exit => 'VÄLJUMINE';

  @override
  String get quizKnowledge_title => 'Teadmiste viktoriin';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Küsimus $current/$total';
  }
}

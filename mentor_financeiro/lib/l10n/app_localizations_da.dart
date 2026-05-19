// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Mentor Finans';

  @override
  String get saldo => 'Balance';

  @override
  String get gastosDiarios => 'Daglige udgifter';

  @override
  String get confirmarTransacao => 'Bekræft transaktion';

  @override
  String get extrato => 'erklæring';

  @override
  String get transferencias => 'Overførsler';

  @override
  String get investimentos => 'Investeringer';

  @override
  String get configuracoes => 'Indstillinger';

  @override
  String get perfil => 'profil';

  @override
  String get sair => 'Log ud';

  @override
  String get entrar => 'Login';

  @override
  String get cadastrar => 'Register';

  @override
  String get email => 'E-mail';

  @override
  String get senha => 'adgangskode';

  @override
  String get nome => 'Navn';

  @override
  String get cpf => 'ID-nummer';

  @override
  String get telefone => 'telefon';

  @override
  String get continuar => 'Fortsæt';

  @override
  String get voltar => 'Tilbage';

  @override
  String get cancelar => 'Annuller';

  @override
  String get salvar => 'Gem';

  @override
  String get editar => 'Rediger';

  @override
  String get excluir => 'Slet';

  @override
  String get sucesso => 'Succes';

  @override
  String get erro => 'fejl';

  @override
  String get carregando => 'Indlæser...';

  @override
  String get semDados => 'Ingen data';

  @override
  String get tentarNovamente => 'Prøv igen';

  @override
  String get relatorios => 'rapporter';

  @override
  String get gastosPorCategoria => 'Udgifter efter kategori';

  @override
  String get ultimosSeteDias => 'Sidste 7 dage';

  @override
  String get totalGasto => 'Samlet brugt';

  @override
  String get transacoes => 'Transaktioner';

  @override
  String get categoria => 'Kategori';

  @override
  String get data => 'Dato';

  @override
  String get valor => 'Værdi';

  @override
  String get descricao => 'Beskrivelse';

  @override
  String get alimentacao => 'Mad';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Fritid';

  @override
  String get saude => 'Sundhed';

  @override
  String get outros => 'Andre';

  @override
  String get notificacoes => 'meddelelser';

  @override
  String get permissaoNotificacoes => 'Notifikationstilladelse';

  @override
  String get ativarMonitoramento => 'Aktiver udgiftsovervågning';

  @override
  String get descricaoMonitoramento =>
      'Tillad, at appen automatisk overvåger dine banktransaktioner for at organisere din økonomi.';

  @override
  String get idioma => 'Sprog';

  @override
  String get moeda => 'Valuta';

  @override
  String get compararInvestimentos => 'Sammenlign investeringer';

  @override
  String get descricaoLocalizacao =>
      'For at sammenligne lokale investeringer (CDB/CDI) med internationale priser, har vi brug for din placering.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Placeringstilladelse påkrævet';

  @override
  String get rendaFixa => 'Fast indkomst';

  @override
  String get rendaVariavel => 'Variabel indkomst';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'aktier';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Kryptovalutaer';

  @override
  String get rendimento => 'Retur';

  @override
  String get rentabilidade => 'Rentabilitet';

  @override
  String get aplicar => 'Anvend';

  @override
  String get resgatar => 'Indløs';

  @override
  String get simular => 'Simuler';

  @override
  String get metas => 'mål';

  @override
  String get estrategias => 'Strategier';

  @override
  String get conhecimento => 'Viden';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Send besked';

  @override
  String get digiteMensagem => 'Indtast en besked...';

  @override
  String get alertaGastos => 'Spending Alert';

  @override
  String alertaGastosMsg(int percent) {
    return 'Du har allerede brugt $percent % af din kreditgrænse.';
  }

  @override
  String get fechamentoFatura => 'Fakturalukning';

  @override
  String get fechamentoFaturaMsg =>
      'I morgen er lukkedag. God tid til at gennemgå udgifter.';

  @override
  String get faturaVencendo => 'Forfalden faktura';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Faktura forfalder om $dias dag(e). Tjek din saldo.';
  }

  @override
  String get regra30 => 'Tip: 30 % regel';

  @override
  String get regra30Msg =>
      'Hold forbruget under 30 % for at forbedre din kreditscore.';

  @override
  String get diaDeOuro => 'Golden Day!';

  @override
  String get diaDeOuroMsg => 'Dine køb i dag bliver kun betalt om 40 dage!';

  @override
  String get alertaJuros => 'Advarsel: Interesse';

  @override
  String get alertaJurosMsg =>
      'Din saldo dækker ikke regningen. Undgå revolverende kredit!';

  @override
  String get notaSaude => 'Finansiel sundhed';

  @override
  String get notaExcelente => 'Fremragende! Du har et godt økonomisk helbred.';

  @override
  String get notaBom => 'Godt, men kan forbedres.';

  @override
  String get notaAtencao => 'Opmærksomhed på udgifter.';

  @override
  String get notaRevisar => 'Gennemgå din økonomi.';

  @override
  String get mentorInsightTitle => 'Mentorvejledning';

  @override
  String get mentorInsightLoading => 'Henter markedsdata...';

  @override
  String get mentorInsightError =>
      'Kunne ikke indlæse data lige nu. Prøv igen om lidt.';

  @override
  String get mentorInsightOffline =>
      'Du er offline. Opret forbindelse for at hente tilbud og Mentor-indsigt.';

  @override
  String get mentorAllocationDefensive =>
      'Givet den nuværende volatilitet, prioriter kapitalbevarelse og likviditet, før du jagter afkast.';

  @override
  String get mentorAllocationBalanced =>
      'Balancer beskyttelse og vækst: diversificere og gense din målhorisont.';

  @override
  String get mentorAllocationOffensive =>
      'Din profil tillader mere risiko: forbliv disciplineret og undgå tung koncentration.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Symboler gennemgået: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatisk (sprog)';

  @override
  String get compoundCalculatorTitle => 'Mentor Lommeregner — Rentesammensat';

  @override
  String get compoundCalculatorSubtitle =>
      'Simuler bidrag, nominel vs. real gevinst (efter inflation) og mentornoter.';

  @override
  String get compoundInitialLabel => 'Oprindeligt engangsbeløb';

  @override
  String get compoundMonthlyLabel => 'Månedligt bidrag';

  @override
  String get compoundRateLabel => 'Rente';

  @override
  String get compoundRateAnnual => 'om året';

  @override
  String get compoundRateMonthly => 'om måneden';

  @override
  String get compoundHorizonLabel => 'Tidshorisont';

  @override
  String get compoundHorizonYears => 'år';

  @override
  String get compoundHorizonMonths => 'måneder';

  @override
  String get compoundInflationLabel => 'Estimeret inflation (% pr. år)';

  @override
  String get compoundCalculate => 'Beregn';

  @override
  String get compoundChartInvested => 'Total investeret';

  @override
  String get compoundChartInterest => 'Optjente renter';

  @override
  String get compoundSummaryNominalEnd => 'Slutsaldo (nominelt)';

  @override
  String get compoundSummaryRealGain => 'Reel gevinst (købekraft)';

  @override
  String get compoundMentorCardTitle => 'Mentorrådgivning';

  @override
  String get compoundInvalidInput => 'Indtast gyldige værdier (horisont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor tone';

  @override
  String get userPersonaNovice => 'Begynder';

  @override
  String get userPersonaStrategist => 'Strategist';

  @override
  String get userPersonaRiskTaker => 'Risikotager';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Åben fuld mentorindsigt';

  @override
  String get investFirstSteps_title => 'Første trin';

  @override
  String get investFirstSteps_brokerTitle => 'Vælg en mægler';

  @override
  String get investFirstSteps_brokerBody =>
      'Se efter regulerede, velrenommerede institutioner. Sammenlign gebyrer, produkter og pålidelighed, før du åbner en konto.';

  @override
  String get investFirstSteps_openAccountTitle => 'Åbn din konto';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digital onboarding. I Brasilien har du typisk brug for CPF/RG og nogle gange bevis for adresse.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digital onboarding varierer fra land til land. Typisk skal du have et ID-dokument og identitets-/adressebekræftelse.';

  @override
  String get investFirstSteps_transferTitle => 'Overfør penge';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Send penge via PIX eller bankoverførsel til din mægler. Balancen bliver tilgængelig til at investere.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Overfør penge via bankoverførsel eller lokale betalingsmetoder (afhænger af dit land). Balancen bliver tilgængelig til at investere.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Kend din risikoprofil';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Besvar et egnethedsspørgeskema. Forstå, om du er konservativ, moderat eller aggressiv.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Køb dit første aktiv';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Start med en nødfond (Tesouro Selic eller en daglig likviditets-CDB). Derefter diversificere gradvist.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Start med en nødfond (højforrentede kontanter, pengemarkedsfonde eller kortfristede statsobligationer). Derefter diversificere gradvist.';

  @override
  String get investFirstSteps_tipTitle => 'Mentor tip:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Start i det små, invester konsekvent, og undgå at prøve at time markedet. Tiden er din bedste allierede.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Start i det små, invester konsekvent, og undgå at prøve at time markedet. Tiden er din bedste allierede.';

  @override
  String get investMenu_tesouroTitle => 'brasilianske statsobligationer';

  @override
  String get investMenu_cdbTitle => 'Bank fast indkomst (CDB)';

  @override
  String get investMenu_etfsTitle => 'International ETF\'er';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'aktier';

  @override
  String get investMenu_fundsTitle => 'midler';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Krypto';

  @override
  String get investRegisterCta => 'Registrer investering';

  @override
  String investRegionHintBr(String country) {
    return 'Effektivt land: $country · Brasilien-katalog (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Effektivt land: $country · Globalt katalog (ETF\'er, NYSE/NASDAQ…). Justeres automatisk fra din enhedsregion.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Væsentlige strategier';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Akutfond';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Dit økonomiske skjold. Dæk 6-12 måneders udgifter. Prioriter daglig likviditet og lav risiko (f.eks. Tesouro Selic eller CDI-linked CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Dit økonomiske skjold. Dæk 6-12 måneders udgifter. Prioriter daglig likviditet og lav risiko (f.eks. pengemarkedsfonde og kortfristede statsobligationer).';

  @override
  String get strategy_buyHoldTitle => 'Køb og hold';

  @override
  String get strategy_buyHoldBody =>
      'Køb kvalitetsaktiver og behold dem på lang sigt. Fokus på disciplin, kvalitet og geninvestering over tid.';

  @override
  String get strategy_diversificationTitle => 'Diversifikation';

  @override
  String get strategy_diversificationBodyBr =>
      'Spred din kapital på tværs af fast indkomst, aktier, FII\'er og internationale aktiver for at reducere risikoen og forbedre risikojusterede afkast.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Spred din kapital på tværs af obligationer, aktier, REIT\'er og international eksponering for at reducere risiko og forbedre risikojusterede afkast.';

  @override
  String get strategy_dcaTitle => 'Dollar-omkostningsgennemsnit (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konsistens slår genialitet. At investere hver måned er ofte mere effektivt end at prøve at vælge det perfekte indgangspunkt.';

  @override
  String get strategy_smartGoalsTitle => 'SMART mål';

  @override
  String get strategy_smartGoalsBody =>
      'Dine mål skal være specifikke, målbare, opnåelige, relevante og tidsbestemte.';

  @override
  String get strategy_503020Title => '50-30-20 regel';

  @override
  String get strategy_503020Body =>
      'En simpel budgetramme: 50 % behov, 30 % ønsker, 20 % investering og mål.';

  @override
  String get strategy_deepDive_allocationTitle => 'Aktivallokering (avanceret)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Lær, hvordan du opbygger en allokering efter mål og horisont, justerer risiko, korrelation og rebalancering.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETF\'er og indekser (avanceret)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Lær om globale indekser (f.eks. S&P 500), ETF\'er, og hvordan du opbygger international eksponering med disciplin.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Skatter og indberetning (avanceret)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Forstå kerneskattekoncepter, og hvordan man fører optegnelser for at rapportere investeringer sikkert.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium-indhold. Aktiver et Cyber/Grimm/Hive-tema for at låse op for investeringen Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Vitrineskab';

  @override
  String get homeShowcaseProfileSimTitle => 'Risikoprofilquiz';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Find din investorprofil på få minutter.';

  @override
  String get homeShowcaseStrategiesTitle => 'Anbefalede strategier';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Direkte genveje til at lære og anvende strategier.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Quizzer og strategier';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Hurtig adgang til risikoprofil-quizzen og anbefalede strategier.';

  @override
  String get homeTourStepClassicTitle => 'Klassisk tilstand';

  @override
  String get homeTourStepClassicBody =>
      'Åbner det originale apppanel: transaktioner, mål, investeringer og indstillinger i det velkendte layout.';

  @override
  String get homeTourStepVitrineTitle => 'Udstillingsområde';

  @override
  String get homeTourStepVitrineBody =>
      'Genveje til læring og praksis: investorprofil, strategier og Mentor-hubben.';

  @override
  String get homeTourStepProfileTitle => 'Profilquiz';

  @override
  String get homeTourStepProfileBody =>
      'Besvar spørgeskemaet for at finde din risikoprofil og se tilpassede forslag.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategier';

  @override
  String get homeTourStepStrategiesBody =>
      'Indhold til at organisere økonomi, investere med disciplin og undgå almindelige faldgruber.';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody =>
      'Hurtig menu til profilquizzen og anbefalede strategier.';

  @override
  String get homeTourStepPremiumTitle => 'Premium funktioner';

  @override
  String get homeTourStepPremiumBody =>
      'Automatisk mentoring, avancerede diagrammer og månedlige rapporter — tilgængelig med et Premium-abonnement.';

  @override
  String get homeTourStepMarketTitle => 'Markedsøjebliksbillede';

  @override
  String get homeTourStepMarketBody =>
      'Markedskontekst (Brasilien eller globalt) baseret på din region plus konverteret nettoværdi.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor lommeregner';

  @override
  String get homeTourStepCalculatorBody =>
      'Simuler renters rente, inflation og se formuediagrammet; derefter åbner vi dette værktøj.';

  @override
  String get quizProfile_title => 'Risikoprofilquiz';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Spørgsmål $current af $total';
  }

  @override
  String get quizProfile_badge => 'RISIKOPROFIL QUIZ';

  @override
  String get quizProfile_resultTitle => 'DIN PROFIL ER';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALE INVESTERINGER:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'UDFORSK I INVESTERINGER';

  @override
  String get quizProfile_exit => 'EXIT';

  @override
  String get quizKnowledge_title => 'Vidensquiz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Spørgsmål $current af $total';
  }
}

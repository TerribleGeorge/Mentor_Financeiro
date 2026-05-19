// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Mentor Ekonomi';

  @override
  String get saldo => 'Balans';

  @override
  String get gastosDiarios => 'Dagliga utgifter';

  @override
  String get confirmarTransacao => 'Bekräfta transaktion';

  @override
  String get extrato => 'uttalande';

  @override
  String get transferencias => 'Överföringar';

  @override
  String get investimentos => 'Investeringar';

  @override
  String get configuracoes => 'Inställningar';

  @override
  String get perfil => 'profil';

  @override
  String get sair => 'Logga ut';

  @override
  String get entrar => 'Logga in';

  @override
  String get cadastrar => 'Registrera';

  @override
  String get email => 'E-post';

  @override
  String get senha => 'Lösenord';

  @override
  String get nome => 'Namn';

  @override
  String get cpf => 'ID-nummer';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Fortsätt';

  @override
  String get voltar => 'Tillbaka';

  @override
  String get cancelar => 'Avbryt';

  @override
  String get salvar => 'Spara';

  @override
  String get editar => 'Redigera';

  @override
  String get excluir => 'Ta bort';

  @override
  String get sucesso => 'Framgång';

  @override
  String get erro => 'Fel';

  @override
  String get carregando => 'Laddar...';

  @override
  String get semDados => 'Inga data';

  @override
  String get tentarNovamente => 'Försök igen';

  @override
  String get relatorios => 'Rapporter';

  @override
  String get gastosPorCategoria => 'Utgifter per kategori';

  @override
  String get ultimosSeteDias => 'Senaste 7 dagarna';

  @override
  String get totalGasto => 'Totalt förbrukat';

  @override
  String get transacoes => 'Transaktioner';

  @override
  String get categoria => 'Kategori';

  @override
  String get data => 'Datum';

  @override
  String get valor => 'Värde';

  @override
  String get descricao => 'Beskrivning';

  @override
  String get alimentacao => 'Mat';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Fritid';

  @override
  String get saude => 'Hälsa';

  @override
  String get outros => 'Andra';

  @override
  String get notificacoes => 'meddelanden';

  @override
  String get permissaoNotificacoes => 'Notifieringstillstånd';

  @override
  String get ativarMonitoramento => 'Aktivera kostnadsövervakning';

  @override
  String get descricaoMonitoramento =>
      'Tillåt att appen automatiskt övervakar dina banktransaktioner för att organisera din ekonomi.';

  @override
  String get idioma => 'Språk';

  @override
  String get moeda => 'Valuta';

  @override
  String get compararInvestimentos => 'Jämför investeringar';

  @override
  String get descricaoLocalizacao =>
      'För att jämföra lokala investeringar (CDB/CDI) med internationella priser behöver vi din plats.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Platstillstånd krävs';

  @override
  String get rendaFixa => 'Ränteintäkter';

  @override
  String get rendaVariavel => 'Rörlig inkomst';

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
  String get criptomoedas => 'Kryptovalutor';

  @override
  String get rendimento => 'Retur';

  @override
  String get rentabilidade => 'Lönsamhet';

  @override
  String get aplicar => 'Ansök';

  @override
  String get resgatar => 'Lös in';

  @override
  String get simular => 'Simulera';

  @override
  String get metas => 'Mål';

  @override
  String get estrategias => 'Strategier';

  @override
  String get conhecimento => 'Kunskap';

  @override
  String get chat => 'Chatt';

  @override
  String get enviarMensagem => 'Skicka meddelande';

  @override
  String get digiteMensagem => 'Skriv ett meddelande...';

  @override
  String get alertaGastos => 'Spending Alert';

  @override
  String alertaGastosMsg(int percent) {
    return 'Du har redan använt $percent % av din kreditgräns.';
  }

  @override
  String get fechamentoFatura => 'Fakturastängning';

  @override
  String get fechamentoFaturaMsg =>
      'Imorgon är stängningsdagen. Bra tid att se över utgifterna.';

  @override
  String get faturaVencendo => 'Faktura förfaller';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Faktura förfaller inom $dias dag(ar). Kontrollera ditt saldo.';
  }

  @override
  String get regra30 => 'Tips: 30 % regel';

  @override
  String get regra30Msg =>
      'Håll användningen under 30 % för att förbättra din kreditpoäng.';

  @override
  String get diaDeOuro => 'Golden Day!';

  @override
  String get diaDeOuroMsg => 'Dina köp idag betalas endast om 40 dagar!';

  @override
  String get alertaJuros => 'Varning: Intresse';

  @override
  String get alertaJurosMsg =>
      'Ditt saldo täcker inte räkningen. Undvik revolverande kredit!';

  @override
  String get notaSaude => 'Finansiell hälsa';

  @override
  String get notaExcelente => 'Utmärkt! Du har bra ekonomisk hälsa.';

  @override
  String get notaBom => 'Bra, men kan förbättras.';

  @override
  String get notaAtencao => 'Uppmärksamhet på utgifter.';

  @override
  String get notaRevisar => 'Se över din ekonomi.';

  @override
  String get mentorInsightTitle => 'Mentorvägledning';

  @override
  String get mentorInsightLoading => 'Hämtar marknadsdata...';

  @override
  String get mentorInsightError =>
      'Det gick inte att ladda data just nu. Försök snart igen.';

  @override
  String get mentorInsightOffline =>
      'Du är offline. Anslut för att hämta offerter och mentorinsikter.';

  @override
  String get mentorAllocationDefensive =>
      'Med tanke på nuvarande volatilitet, prioritera kapitalbevarande och likviditet innan du jagar avkastning.';

  @override
  String get mentorAllocationBalanced =>
      'Balansera skydd och tillväxt: diversifiera och se om din målhorisont.';

  @override
  String get mentorAllocationOffensive =>
      'Din profil tillåter mer risk: håll dig disciplinerad och undvik tung koncentration.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Symboler granskade: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatisk (språk)';

  @override
  String get compoundCalculatorTitle => 'Mentorkalkylator — ränta';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulera bidrag, nominell vs real vinst (efter inflation) och mentoranteckningar.';

  @override
  String get compoundInitialLabel => 'Initialt engångsbelopp';

  @override
  String get compoundMonthlyLabel => 'Månadsbidrag';

  @override
  String get compoundRateLabel => 'Ränta';

  @override
  String get compoundRateAnnual => 'per år';

  @override
  String get compoundRateMonthly => 'per månad';

  @override
  String get compoundHorizonLabel => 'Tidshorisont';

  @override
  String get compoundHorizonYears => 'år';

  @override
  String get compoundHorizonMonths => 'månader';

  @override
  String get compoundInflationLabel => 'Beräknad inflation (% per år)';

  @override
  String get compoundCalculate => 'Beräkna';

  @override
  String get compoundChartInvested => 'Totalt investerat';

  @override
  String get compoundChartInterest => 'Intjänad ränta';

  @override
  String get compoundSummaryNominalEnd => 'Slutsaldo (nominellt)';

  @override
  String get compoundSummaryRealGain => 'Verklig vinst (köpkraft)';

  @override
  String get compoundMentorCardTitle => 'Mentorråd';

  @override
  String get compoundInvalidInput => 'Ange giltiga värden (horisont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentorton';

  @override
  String get userPersonaNovice => 'Nybörjare';

  @override
  String get userPersonaStrategist => 'Strateg';

  @override
  String get userPersonaRiskTaker => 'Risktagare';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Öppna fullständig mentorinsikt';

  @override
  String get investFirstSteps_title => 'Första stegen';

  @override
  String get investFirstSteps_brokerTitle => 'Välj en mäklare';

  @override
  String get investFirstSteps_brokerBody =>
      'Leta efter reglerade, välrenommerade institutioner. Jämför avgifter, produkter och tillförlitlighet innan du öppnar ett konto.';

  @override
  String get investFirstSteps_openAccountTitle => 'Öppna ditt konto';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digital onboarding. I Brasilien behöver du vanligtvis CPF/RG och ibland adressbevis.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digital onboarding varierar beroende på land. Vanligtvis behöver du en ID-handling och identitets-/adressverifiering.';

  @override
  String get investFirstSteps_transferTitle => 'Överför pengar';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Skicka pengar via PIX eller banköverföring till din mäklare. Balansen blir tillgänglig att investera.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Överför pengar via banköverföring eller lokala betalningsmetoder (beror på ditt land). Balansen blir tillgänglig att investera.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Känn din riskprofil';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Svara på ett lämplighetsformulär. Förstå om du är konservativ, moderat eller aggressiv.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Köp din första tillgång';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Börja med en nödfond (Tesouro Selic eller en CDB med daglig likviditet). Diversifiera sedan gradvis.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Börja med en nödfond (högavkastande kontanter, penningmarknadsfonder eller kortfristiga statsobligationer). Diversifiera sedan gradvis.';

  @override
  String get investFirstSteps_tipTitle => 'Mentortips:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Börja smått, investera konsekvent och undvik att försöka tajma marknaden. Tiden är din bästa allierade.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Börja smått, investera konsekvent och undvik att försöka tajma marknaden. Tiden är din bästa allierade.';

  @override
  String get investMenu_tesouroTitle => 'brasilianska statsobligationer';

  @override
  String get investMenu_cdbTitle => 'Bank räntebärande (CDB)';

  @override
  String get investMenu_etfsTitle => 'Internationella ETF:er';

  @override
  String get investMenu_sp500Title => 'S&P 500 (index)';

  @override
  String get investMenu_stocksTitle => 'aktier';

  @override
  String get investMenu_fundsTitle => 'fonder';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Krypto';

  @override
  String get investRegisterCta => 'Registrera investering';

  @override
  String investRegionHintBr(String country) {
    return 'Gällande land: $country · Brasilien-katalog (Treasuries, CDB, LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Gällande land: $country · Global katalog (ETF:er, NYSE/NASDAQ…). Justeras automatiskt från din enhetsregion.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Viktiga strategier';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Akutfond';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Din ekonomiska sköld. Täcker 6–12 månaders utgifter. Prioritera daglig likviditet och låg risk (t.ex. Tesouro Selic eller CDI-linked CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Din ekonomiska sköld. Täcker 6–12 månaders utgifter. Prioritera daglig likviditet och låg risk (t.ex. penningmarknadsfonder och kortfristiga statsobligationer).';

  @override
  String get strategy_buyHoldTitle => 'Köp och behåll';

  @override
  String get strategy_buyHoldBody =>
      'Köp kvalitetstillgångar och behåll dem på lång sikt. Fokusera på disciplin, kvalitet och återinvestering över tid.';

  @override
  String get strategy_diversificationTitle => 'Diversifiering';

  @override
  String get strategy_diversificationBodyBr =>
      'Sprid ditt kapital över ränteintäkter, aktier, FIIs och internationella tillgångar för att minska risken och förbättra riskjusterad avkastning.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Sprid ditt kapital över obligationer, aktier, REITs och internationell exponering för att minska risken och förbättra riskjusterad avkastning.';

  @override
  String get strategy_dcaTitle => 'Dollarkostnadsgenomsnitt (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konsistens slår geni. Att investera varje månad är ofta mer effektivt än att försöka välja den perfekta startpunkten.';

  @override
  String get strategy_smartGoalsTitle => 'SMARTA mål';

  @override
  String get strategy_smartGoalsBody =>
      'Dina mål bör vara specifika, mätbara, uppnåbara, relevanta och tidsbundna.';

  @override
  String get strategy_503020Title => '50-30-20 regel';

  @override
  String get strategy_503020Body =>
      'En enkel budgetram: 50 % behov, 30 % önskemål, 20 % investeringar och mål.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Tillgångsallokering (avancerat)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Lär dig hur du bygger en allokering efter mål och horisont, justerar risk, korrelation och ombalansering.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globala ETF:er och index (avancerat)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Lär dig mer om globala index (t.ex. S&P 500), ETF:er och hur du bygger internationell exponering med disciplin.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Skatter och rapportering (avancerat)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Förstå centrala skattekoncept och hur man för register för att rapportera investeringar på ett säkert sätt.';

  @override
  String get strategy_premiumLockedBody =>
      'Premiuminnehåll. Aktivera ett Cyber/Grimm/Hive-tema för att låsa upp investeringen Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Showcase';

  @override
  String get homeShowcaseProfileSimTitle => 'Riskprofil frågesport';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Hitta din investerarprofil på några minuter.';

  @override
  String get homeShowcaseStrategiesTitle => 'Rekommenderade strategier';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Direkta genvägar för att lära sig och tillämpa strategier.';

  @override
  String get homeShowcaseMentorHubTitle =>
      'Mentor: Frågesporter och strategier';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Snabb tillgång till riskprofilfrågesporten och rekommenderade strategier.';

  @override
  String get homeTourStepClassicTitle => 'Klassiskt läge';

  @override
  String get homeTourStepClassicBody =>
      'Öppnar den ursprungliga apppanelen: transaktioner, mål, investeringar och inställningar i den välbekanta layouten.';

  @override
  String get homeTourStepVitrineTitle => 'Utställningsområde';

  @override
  String get homeTourStepVitrineBody =>
      'Genvägar för att lära och öva: investerarprofil, strategier och Mentor-navet.';

  @override
  String get homeTourStepProfileTitle => 'Profilquiz';

  @override
  String get homeTourStepProfileBody =>
      'Svara på frågeformuläret för att upptäcka din riskprofil och se anpassade förslag.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategier';

  @override
  String get homeTourStepStrategiesBody =>
      'Innehåll för att organisera ekonomin, investera med disciplin och undvika vanliga fallgropar.';

  @override
  String get homeTourStepHubTitle => 'Mentor-nav';

  @override
  String get homeTourStepHubBody =>
      'Snabbmeny till profilquizet och rekommenderade strategier.';

  @override
  String get homeTourStepPremiumTitle => 'Premiumfunktioner';

  @override
  String get homeTourStepPremiumBody =>
      'Automatisk mentorskap, avancerade diagram och månadsrapporter — tillgängligt med en Premium-prenumeration.';

  @override
  String get homeTourStepMarketTitle => 'Marknadsbild';

  @override
  String get homeTourStepMarketBody =>
      'Marknadssammanhang (Brasilien eller globalt) baserat på din region plus konverterat nettovärde.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor-kalkylator';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulera sammansatt ränta, inflation och se förmögenhetsdiagrammet; nästa öppnar vi det här verktyget.';

  @override
  String get quizProfile_title => 'Riskprofil frågesport';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Fråga $current av $total';
  }

  @override
  String get quizProfile_badge => 'RISKPROFILFRÅGOR';

  @override
  String get quizProfile_resultTitle => 'DIN PROFIL ÄR';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALA INVESTERINGAR:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'UTFORSKA INVESTERINGAR';

  @override
  String get quizProfile_exit => 'AVSLUTA';

  @override
  String get quizKnowledge_title => 'Kunskapsquiz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Fråga $current av $total';
  }
}

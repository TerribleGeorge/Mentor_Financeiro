// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Mentor Økonomi';

  @override
  String get saldo => 'Balanse';

  @override
  String get gastosDiarios => 'Daglige utgifter';

  @override
  String get confirmarTransacao => 'Bekreft transaksjon';

  @override
  String get extrato => 'erklæring';

  @override
  String get transferencias => 'Overføringer';

  @override
  String get investimentos => 'Investeringer';

  @override
  String get configuracoes => 'Innstillinger';

  @override
  String get perfil => 'profil';

  @override
  String get sair => 'Logg ut';

  @override
  String get entrar => 'Logg inn';

  @override
  String get cadastrar => 'Registrer deg';

  @override
  String get email => 'E-post';

  @override
  String get senha => 'Passord';

  @override
  String get nome => 'Navn';

  @override
  String get cpf => 'ID-nummer';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Fortsett';

  @override
  String get voltar => 'Tilbake';

  @override
  String get cancelar => 'Avbryt';

  @override
  String get salvar => 'Lagre';

  @override
  String get editar => 'Rediger';

  @override
  String get excluir => 'Slett';

  @override
  String get sucesso => 'Suksess';

  @override
  String get erro => 'feil';

  @override
  String get carregando => 'Laster...';

  @override
  String get semDados => 'Ingen data';

  @override
  String get tentarNovamente => 'Prøv igjen';

  @override
  String get relatorios => 'Rapporter';

  @override
  String get gastosPorCategoria => 'Utgifter etter kategori';

  @override
  String get ultimosSeteDias => 'Siste 7 dager';

  @override
  String get totalGasto => 'Totalt brukt';

  @override
  String get transacoes => 'Transaksjoner';

  @override
  String get categoria => 'Kategori';

  @override
  String get data => 'Dato';

  @override
  String get valor => 'Verdi';

  @override
  String get descricao => 'Beskrivelse';

  @override
  String get alimentacao => 'Mat';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Fritid';

  @override
  String get saude => 'Helse';

  @override
  String get outros => 'Andre';

  @override
  String get notificacoes => 'varsler';

  @override
  String get permissaoNotificacoes => 'Varslingstillatelse';

  @override
  String get ativarMonitoramento => 'Aktiver utgiftsovervåking';

  @override
  String get descricaoMonitoramento =>
      'Tillat at appen automatisk overvåker banktransaksjonene dine for å organisere økonomien din.';

  @override
  String get idioma => 'Språk';

  @override
  String get moeda => 'Valuta';

  @override
  String get compararInvestimentos => 'Sammenlign investeringer';

  @override
  String get descricaoLocalizacao =>
      'For å sammenligne lokale investeringer (CDB/CDI) med internasjonale priser, trenger vi plasseringen din.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Plasseringstillatelse kreves';

  @override
  String get rendaFixa => 'Fast inntekt';

  @override
  String get rendaVariavel => 'Variabel inntekt';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'aksjer';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Kryptovalutaer';

  @override
  String get rendimento => 'Retur';

  @override
  String get rentabilidade => 'Lønnsomhet';

  @override
  String get aplicar => 'Søk';

  @override
  String get resgatar => 'Løs inn';

  @override
  String get simular => 'Simuler';

  @override
  String get metas => 'mål';

  @override
  String get estrategias => 'Strategier';

  @override
  String get conhecimento => 'Kunnskap';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Send melding';

  @override
  String get digiteMensagem => 'Skriv inn en melding...';

  @override
  String get alertaGastos => 'Utgiftsvarsel';

  @override
  String alertaGastosMsg(int percent) {
    return 'Du har allerede brukt $percent % av kredittgrensen din.';
  }

  @override
  String get fechamentoFatura => 'Fakturaavslutning';

  @override
  String get fechamentoFaturaMsg =>
      'I morgen er stengedag. Flott tid for å vurdere utgifter.';

  @override
  String get faturaVencendo => 'Faktura forfaller';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Faktura forfaller innen $dias dag(er). Sjekk saldoen din.';
  }

  @override
  String get regra30 => 'Tips: 30 % regel';

  @override
  String get regra30Msg =>
      'Hold bruken under 30 % for å forbedre kredittscore.';

  @override
  String get diaDeOuro => 'Golden Day!';

  @override
  String get diaDeOuroMsg => 'Dine kjøp i dag vil kun bli betalt om 40 dager!';

  @override
  String get alertaJuros => 'Advarsel: Interesse';

  @override
  String get alertaJurosMsg =>
      'Saldoen din dekker ikke regningen. Unngå rullerende kreditt!';

  @override
  String get notaSaude => 'Finansiell helse';

  @override
  String get notaExcelente => 'Utmerket! Du har god økonomisk helse.';

  @override
  String get notaBom => 'Bra, men kan forbedres.';

  @override
  String get notaAtencao => 'Oppmerksomhet på utgifter.';

  @override
  String get notaRevisar => 'Gjennomgå økonomien din.';

  @override
  String get mentorInsightTitle => 'Mentorveiledning';

  @override
  String get mentorInsightLoading => 'Henter markedsdata...';

  @override
  String get mentorInsightError =>
      'Kunne ikke laste inn data akkurat nå. Prøv igjen snart.';

  @override
  String get mentorInsightOffline =>
      'Du er frakoblet. Koble til for å hente sitater og mentorinnsikt.';

  @override
  String get mentorAllocationDefensive =>
      'Gitt gjeldende volatilitet, prioriter kapitalbevaring og likviditet før du jager avkastning.';

  @override
  String get mentorAllocationBalanced =>
      'Balanser beskyttelse og vekst: diversifiser og gå tilbake til målhorisonten din.';

  @override
  String get mentorAllocationOffensive =>
      'Profilen din tillater mer risiko: hold deg disiplinert og unngå tung konsentrasjon.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Symboler gjennomgått: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatisk (språk)';

  @override
  String get compoundCalculatorTitle => 'Mentorkalkulator — Rentesammensatt';

  @override
  String get compoundCalculatorSubtitle =>
      'Simuler bidrag, nominell vs reell gevinst (etter inflasjon), og mentornotater.';

  @override
  String get compoundInitialLabel => 'Opprinnelig engangsbeløp';

  @override
  String get compoundMonthlyLabel => 'Månedlig bidrag';

  @override
  String get compoundRateLabel => 'Rente';

  @override
  String get compoundRateAnnual => 'per år';

  @override
  String get compoundRateMonthly => 'per måned';

  @override
  String get compoundHorizonLabel => 'Tidshorisont';

  @override
  String get compoundHorizonYears => 'år';

  @override
  String get compoundHorizonMonths => 'måneder';

  @override
  String get compoundInflationLabel => 'Estimert inflasjon (% per år)';

  @override
  String get compoundCalculate => 'Beregn';

  @override
  String get compoundChartInvested => 'Totalt investert';

  @override
  String get compoundChartInterest => 'Opptjente renter';

  @override
  String get compoundSummaryNominalEnd => 'Sluttsaldo (nominell)';

  @override
  String get compoundSummaryRealGain => 'Virkelig gevinst (kjøpekraft)';

  @override
  String get compoundMentorCardTitle => 'Mentorråd';

  @override
  String get compoundInvalidInput => 'Angi gyldige verdier (horisont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor tone';

  @override
  String get userPersonaNovice => 'Nybegynner';

  @override
  String get userPersonaStrategist => 'Strateg';

  @override
  String get userPersonaRiskTaker => 'Risikotaker';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Åpne full mentorinnsikt';

  @override
  String get investFirstSteps_title => 'Første trinn';

  @override
  String get investFirstSteps_brokerTitle => 'Velg en megler';

  @override
  String get investFirstSteps_brokerBody =>
      'Se etter regulerte, anerkjente institusjoner. Sammenlign avgifter, produkter og pålitelighet før du åpner en konto.';

  @override
  String get investFirstSteps_openAccountTitle => 'Åpne kontoen din';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digital onboarding. I Brasil trenger du vanligvis CPF/RG og noen ganger bevis på adresse.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digital onboarding varierer fra land til land. Vanligvis trenger du et ID-dokument og bekreftelse av identitet/adresse.';

  @override
  String get investFirstSteps_transferTitle => 'Overfør midler';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Send penger via PIX eller bankoverføring til megleren din. Balansen blir tilgjengelig for investering.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Overfør midler via bankoverføring eller lokale betalingsmetoder (avhenger av landet ditt). Balansen blir tilgjengelig for investering.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Kjenn risikoprofilen din';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Svar på et egnethetsspørreskjema. Forstå om du er konservativ, moderat eller aggressiv.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Kjøp din første eiendel';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Start med et nødfond (Tesouro Selic eller en daglig likviditets-CDB). Diversifiser deretter gradvis.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Start med et nødfond (høyavkastningskontanter, pengemarkedsfond eller kortsiktige statsobligasjoner). Diversifiser deretter gradvis.';

  @override
  String get investFirstSteps_tipTitle => 'Mentortips:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Start i det små, invester konsekvent, og unngå å prøve å time markedet. Tiden er din beste allierte.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Start i det små, invester konsekvent, og unngå å prøve å time markedet. Tiden er din beste allierte.';

  @override
  String get investMenu_tesouroTitle => 'brasilianske statsobligasjoner';

  @override
  String get investMenu_cdbTitle => 'Bank fast inntekt (CDB)';

  @override
  String get investMenu_etfsTitle => 'internasjonale ETFer';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'aksjer';

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
    return 'Effektivt land: $country · Brasil-katalogen (Skattkammer, CDB, LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Effektivt land: $country · Global katalog (ETFer, NYSE/NASDAQ…). Justeres automatisk fra enhetens region.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Viktige strategier';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Nødfond';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Ditt økonomiske skjold. Dekke 6–12 måneders utgifter. Prioriter daglig likviditet og lav risiko (f.eks. Tesouro Selic eller CDI-linked CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Ditt økonomiske skjold. Dekke 6–12 måneders utgifter. Prioriter daglig likviditet og lav risiko (f.eks. pengemarkedsfond og kortsiktige statsobligasjoner).';

  @override
  String get strategy_buyHoldTitle => 'Kjøp og hold';

  @override
  String get strategy_buyHoldBody =>
      'Kjøp kvalitetsmidler og hold på lang sikt. Fokuser på disiplin, kvalitet og reinvestering over tid.';

  @override
  String get strategy_diversificationTitle => 'Diversifisering';

  @override
  String get strategy_diversificationBodyBr =>
      'Spre kapitalen din på tvers av rentebærende inntekter, aksjer, FIIs og internasjonale eiendeler for å redusere risiko og forbedre risikojustert avkastning.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Spre kapitalen din på tvers av obligasjoner, aksjer, REITs og internasjonal eksponering for å redusere risiko og forbedre risikojustert avkastning.';

  @override
  String get strategy_dcaTitle => 'Gjennomsnittlig dollarkostnad (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konsistens slår geni. Å investere hver måned er ofte mer effektivt enn å prøve å velge det perfekte inngangspunktet.';

  @override
  String get strategy_smartGoalsTitle => 'SMART mål';

  @override
  String get strategy_smartGoalsBody =>
      'Målene dine bør være spesifikke, målbare, oppnåelige, relevante og tidsbestemte.';

  @override
  String get strategy_503020Title => '50-30-20 regel';

  @override
  String get strategy_503020Body =>
      'En enkel budsjettramme: 50 % behov, 30 % ønsker, 20 % investering og mål.';

  @override
  String get strategy_deepDive_allocationTitle => 'Asset allocation (avansert)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Lær hvordan du bygger en allokering etter mål og horisont, justerer risiko, korrelasjon og rebalansering.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETFer og indekser (avansert)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Lær om globale indekser (f.eks. S&P 500), ETFer og hvordan du bygger internasjonal eksponering med disiplin.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Skatter og rapportering (avansert)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Forstå kjerneskattekonsepter og hvordan du fører regnskap for å rapportere investeringer trygt.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium-innhold. Aktiver et Cyber/Grimm/Hive-tema for å låse opp investeringen Deep Dive.';

  @override
  String get homeShowcaseTitle => 'utstillingsvindu';

  @override
  String get homeShowcaseProfileSimTitle => 'Risikoprofilquiz';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Finn din investorprofil på noen få minutter.';

  @override
  String get homeShowcaseStrategiesTitle => 'Anbefalte strategier';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Direkte snarveier for å lære og bruke strategier.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Quizzer og strategier';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Rask tilgang til risikoprofilquizen og anbefalte strategier.';

  @override
  String get homeTourStepClassicTitle => 'Klassisk modus';

  @override
  String get homeTourStepClassicBody =>
      'Åpner det originale apppanelet: transaksjoner, mål, investeringer og innstillinger i det kjente oppsettet.';

  @override
  String get homeTourStepVitrineTitle => 'Utstillingsområde';

  @override
  String get homeTourStepVitrineBody =>
      'Snarveier for å lære og øve: investorprofil, strategier og Mentor-huben.';

  @override
  String get homeTourStepProfileTitle => 'Profilquiz';

  @override
  String get homeTourStepProfileBody =>
      'Svar på spørreskjemaet for å finne risikoprofilen din og se tilpassede forslag.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategier';

  @override
  String get homeTourStepStrategiesBody =>
      'Innhold for å organisere økonomi, investere med disiplin og unngå vanlige fallgruver.';

  @override
  String get homeTourStepHubTitle => 'Mentor-hub';

  @override
  String get homeTourStepHubBody =>
      'Hurtigmeny til profilquizen og anbefalte strategier.';

  @override
  String get homeTourStepPremiumTitle => 'Premium funksjoner';

  @override
  String get homeTourStepPremiumBody =>
      'Automatisk veiledning, avanserte diagrammer og månedlige rapporter — tilgjengelig med et Premium-abonnement.';

  @override
  String get homeTourStepMarketTitle => 'Markedsbilde';

  @override
  String get homeTourStepMarketBody =>
      'Markedskontekst (Brasil eller globalt) basert på din region pluss konvertert nettoverdi.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor-kalkulator';

  @override
  String get homeTourStepCalculatorBody =>
      'Simuler renters rente, inflasjon og se formuesdiagrammet; neste åpner vi dette verktøyet.';

  @override
  String get quizProfile_title => 'Risikoprofilquiz';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Spørsmål $current av $total';
  }

  @override
  String get quizProfile_badge => 'RISIKOPROFIL QUIZ';

  @override
  String get quizProfile_resultTitle => 'DIN PROFIL ER';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALE INVESTERINGER:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'UTFORSK INVESTERINGER';

  @override
  String get quizProfile_exit => 'EXIT';

  @override
  String get quizKnowledge_title => 'Kunnskapsquiz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Spørsmål $current av $total';
  }
}

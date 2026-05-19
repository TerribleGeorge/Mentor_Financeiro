// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Mentore finanziario';

  @override
  String get saldo => 'Saldo';

  @override
  String get gastosDiarios => 'Spese giornaliere';

  @override
  String get confirmarTransacao => 'Conferma transazione\nDichiarazione';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Trasferimenti';

  @override
  String get investimentos => 'Investimenti';

  @override
  String get configuracoes => 'Impostazioni';

  @override
  String get perfil => 'Profilo';

  @override
  String get sair => 'Disconnettersi';

  @override
  String get entrar => 'Accedi';

  @override
  String get cadastrar => 'Registrati';

  @override
  String get email => 'E-mail';

  @override
  String get senha => 'Parola d\'ordine';

  @override
  String get nome => 'Nome';

  @override
  String get cpf => 'Numero identificativo';

  @override
  String get telefone => 'Telefono';

  @override
  String get continuar => 'Continua';

  @override
  String get voltar => 'Indietro';

  @override
  String get cancelar => 'Annulla';

  @override
  String get salvar => 'Salva';

  @override
  String get editar => 'Modifica';

  @override
  String get excluir => 'Elimina';

  @override
  String get sucesso => 'Successo\nErrore';

  @override
  String get erro => '';

  @override
  String get carregando => 'Caricamento...';

  @override
  String get semDados => 'Nessun dato';

  @override
  String get tentarNovamente => 'Riprova';

  @override
  String get relatorios => 'Rapporti';

  @override
  String get gastosPorCategoria => 'Spese per categoria';

  @override
  String get ultimosSeteDias => 'Ultimi 7 giorni';

  @override
  String get totalGasto => 'Totale speso';

  @override
  String get transacoes => 'Transazioni';

  @override
  String get categoria => 'Categoria';

  @override
  String get data => 'Data';

  @override
  String get valor => 'Valore';

  @override
  String get descricao => 'Descrizione';

  @override
  String get alimentacao => 'Cibo';

  @override
  String get transporte => 'Trasporto';

  @override
  String get lazer => 'Tempo libero';

  @override
  String get saude => 'Salute';

  @override
  String get outros => 'Altri';

  @override
  String get notificacoes => 'Notifiche';

  @override
  String get permissaoNotificacoes => 'Autorizzazione notifica';

  @override
  String get ativarMonitoramento => 'Abilita monitoraggio spese';

  @override
  String get descricaoMonitoramento =>
      'Consenti all\'app di monitorare automaticamente le tue transazioni bancarie per organizzare le tue finanze.';

  @override
  String get idioma => 'Lingua';

  @override
  String get moeda => 'Valuta';

  @override
  String get compararInvestimentos => 'Confronta investimenti';

  @override
  String get descricaoLocalizacao =>
      'Per confrontare gli investimenti locali (CDB/CDI) con i tassi internazionali, abbiamo bisogno della tua posizione.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Autorizzazione alla posizione richiesta';

  @override
  String get rendaFixa => 'Reddito fisso';

  @override
  String get rendaVariavel => 'Reddito variabile';

  @override
  String get tesouroDireto => 'Tesoreria diretta';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Azioni';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Criptovalute';

  @override
  String get rendimento => 'Ritorno';

  @override
  String get rentabilidade => 'Redditività';

  @override
  String get aplicar => 'Applicare';

  @override
  String get resgatar => 'Riscatta';

  @override
  String get simular => 'Simula';

  @override
  String get metas => 'Gol';

  @override
  String get estrategias => 'Strategie';

  @override
  String get conhecimento => 'Conoscenza';

  @override
  String get chat => 'Chatta';

  @override
  String get enviarMensagem => 'Invia messaggio';

  @override
  String get digiteMensagem => 'Scrivi un messaggio...';

  @override
  String get alertaGastos => 'Avviso di spesa';

  @override
  String alertaGastosMsg(int percent) {
    return 'Hai già utilizzato il $percent% del tuo limite di credito.';
  }

  @override
  String get fechamentoFatura => 'Chiusura fattura';

  @override
  String get fechamentoFaturaMsg =>
      'Domani è giorno di chiusura. Ottimo momento per rivedere le spese.';

  @override
  String get faturaVencendo => 'Fattura scaduta';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Fattura con scadenza tra $dias giorno/i. Controlla il tuo saldo.';
  }

  @override
  String get regra30 => 'Suggerimento: regola del 30%.';

  @override
  String get regra30Msg =>
      'Mantieni l\'utilizzo al di sotto del 30% per migliorare il tuo punteggio di credito.';

  @override
  String get diaDeOuro => 'Giorno d\'oro!';

  @override
  String get diaDeOuroMsg =>
      'I tuoi acquisti di oggi verranno pagati solo tra 40 giorni!';

  @override
  String get alertaJuros => 'Attenzione: Interesse';

  @override
  String get alertaJurosMsg =>
      'Il tuo saldo non copre la fattura. Evita il credito rotativo!';

  @override
  String get notaSaude => 'Salute finanziaria';

  @override
  String get notaExcelente => 'Eccellente! Hai una grande salute finanziaria.';

  @override
  String get notaBom => 'Buono, ma può migliorare.';

  @override
  String get notaAtencao => 'Attenzione alla spesa.';

  @override
  String get notaRevisar => 'Controlla le tue finanze.';

  @override
  String get mentorInsightTitle => 'Guida del mentore';

  @override
  String get mentorInsightLoading => 'Recupero dati di mercato…';

  @override
  String get mentorInsightError =>
      'Impossibile caricare i dati in questo momento. Riprova a breve.';

  @override
  String get mentorInsightOffline =>
      'Sei offline. Connettiti per recuperare preventivi e approfondimenti del mentore.';

  @override
  String get mentorAllocationDefensive =>
      'Data l\'attuale volatilità, dare priorità alla conservazione del capitale e alla liquidità prima di inseguire i rendimenti.';

  @override
  String get mentorAllocationBalanced =>
      'Bilancia protezione e crescita: diversifica e rivisita il tuo orizzonte di obiettivi.';

  @override
  String get mentorAllocationOffensive =>
      'Il tuo profilo consente maggiori rischi: mantieni la disciplina ed evita la concentrazione.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Simboli revisionati: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatico (lingua)';

  @override
  String get compoundCalculatorTitle =>
      'Calcolatore mentore: interesse composto';

  @override
  String get compoundCalculatorSubtitle =>
      'Simula contributi, guadagni nominali e reali (dopo l\'inflazione) e note di tutoraggio.';

  @override
  String get compoundInitialLabel => 'Somma forfettaria iniziale';

  @override
  String get compoundMonthlyLabel => 'Contributo mensile';

  @override
  String get compoundRateLabel => 'Tasso di interesse';

  @override
  String get compoundRateAnnual => 'all\'anno';

  @override
  String get compoundRateMonthly => 'al mese';

  @override
  String get compoundHorizonLabel => 'Orizzonte temporale';

  @override
  String get compoundHorizonYears => 'anni';

  @override
  String get compoundHorizonMonths => 'mesi';

  @override
  String get compoundInflationLabel => 'Inflazione stimata (% annuo)';

  @override
  String get compoundCalculate => 'Calcola';

  @override
  String get compoundChartInvested => 'Totale investito';

  @override
  String get compoundChartInterest => 'Interessi maturati';

  @override
  String get compoundSummaryNominalEnd => 'Saldo finale (nominale)';

  @override
  String get compoundSummaryRealGain => 'Guadagno reale (potere d\'acquisto)';

  @override
  String get compoundMentorCardTitle => 'Consiglio del mentore';

  @override
  String get compoundInvalidInput => 'Immettere valori validi (orizzonte > 0).';

  @override
  String get userPersonaSectionTitle => 'Tono mentore';

  @override
  String get userPersonaNovice => 'Principiante';

  @override
  String get userPersonaStrategist => 'Stratega';

  @override
  String get userPersonaRiskTaker => 'Ama il rischio';

  @override
  String get userPersonaConservative => 'Risparmio';

  @override
  String get compoundOpenFullInsight => 'Apri la visione completa del mentore';

  @override
  String get investFirstSteps_title => 'Primi passi';

  @override
  String get investFirstSteps_brokerTitle => 'Scegli un broker';

  @override
  String get investFirstSteps_brokerBody =>
      'Cerca istituti regolamentati e rispettabili. Confronta tariffe, prodotti e affidabilità prima di aprire un conto.';

  @override
  String get investFirstSteps_openAccountTitle => 'Apri il tuo conto';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Onboarding digitale. In Brasile, in genere è necessario il CPF/RG e talvolta una prova di indirizzo.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'L\'onboarding digitale varia in base al Paese. In genere è necessario un documento di identità e la verifica dell\'identità/indirizzo.';

  @override
  String get investFirstSteps_transferTitle => 'Trasferisci fondi';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Invia denaro tramite PIX o bonifico bancario al tuo broker. Il saldo diventa disponibile per investire.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Trasferisci fondi tramite bonifico bancario o metodi di pagamento locali (dipende dal Paese). Il saldo diventa disponibile per investire.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Conosci il tuo profilo di rischio';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Rispondi a un questionario di idoneità. Comprendi se sei conservatore, moderato o aggressivo.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Acquista il tuo primo bene';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Inizia con un fondo di emergenza (Tesouro Selic o un CDB con liquidità giornaliera). Poi diversificare gradualmente.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Inizia con un fondo di emergenza (contanti ad alto rendimento, fondi del mercato monetario o buoni del Tesoro a breve termine). Poi diversificare gradualmente.';

  @override
  String get investFirstSteps_tipTitle => 'Consiglio del mentore:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Inizia in piccolo, investi in modo coerente ed evita di cercare di cronometrare il mercato. Il tempo è il tuo miglior alleato.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Inizia in piccolo, investi in modo coerente ed evita di cercare di cronometrare il mercato. Il tempo è il tuo miglior alleato.';

  @override
  String get investMenu_tesouroTitle => 'Tesori brasiliani';

  @override
  String get investMenu_cdbTitle => 'Reddito fisso bancario (CDB)';

  @override
  String get investMenu_etfsTitle => 'ETF internazionali';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indice)';

  @override
  String get investMenu_stocksTitle => 'Azioni';

  @override
  String get investMenu_fundsTitle => 'Fondi';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REIT';

  @override
  String get investMenu_internationalTitle => 'Internazionale';

  @override
  String get investMenu_cryptoTitle => 'Crittografia';

  @override
  String get investRegisterCta => 'Registro degli investimenti';

  @override
  String investRegionHintBr(String country) {
    return 'Paese effettivo: $country · Catalogo Brasile (Tesoro, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Paese effettivo: $country · Catalogo globale (ETF, NYSE/NASDAQ…). Regolato automaticamente dalla regione del tuo dispositivo.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Strategie essenziali';

  @override
  String get strategy_sectionDeepDiveTitle => 'Immersione profonda (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Fondo di emergenza';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Il tuo scudo finanziario. Coprire 6-12 mesi di spese. Dare priorità alla liquidità giornaliera e al basso rischio (ad esempio, Tesouro Selic o CDB collegato a CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Il tuo scudo finanziario. Coprire 6-12 mesi di spese. Dare priorità alla liquidità giornaliera e al basso rischio (ad esempio, fondi del mercato monetario e titoli del Tesoro a breve termine).';

  @override
  String get strategy_buyHoldTitle => 'Acquista e mantieni';

  @override
  String get strategy_buyHoldBody =>
      'Acquista asset di qualità e mantienili a lungo termine. Concentrarsi su disciplina, qualità e reinvestimento nel tempo.';

  @override
  String get strategy_diversificationTitle => 'Diversificazione';

  @override
  String get strategy_diversificationBodyBr =>
      'Distribuisci il tuo capitale tra reddito fisso, azioni, FII e asset internazionali per ridurre il rischio e migliorare i rendimenti adeguati al rischio.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Distribuisci il tuo capitale tra obbligazioni, azioni, REIT ed esposizione internazionale per ridurre il rischio e migliorare i rendimenti adeguati al rischio.';

  @override
  String get strategy_dcaTitle => 'Media del costo in dollari (DCA)';

  @override
  String get strategy_dcaBody =>
      'La coerenza batte la genialità. Investire ogni mese è spesso più efficace che cercare di scegliere il punto di ingresso perfetto.';

  @override
  String get strategy_smartGoalsTitle => 'Obiettivi SMART';

  @override
  String get strategy_smartGoalsBody =>
      'I tuoi obiettivi dovrebbero essere specifici, misurabili, realizzabili, pertinenti e limitati nel tempo.\nRegola';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Un quadro di budget semplice: 50% bisogni, 30% desideri, 20% investimenti e obiettivi.';

  @override
  String get strategy_deepDive_allocationTitle => 'Asset allocation (avanzata)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Scopri come costruire un\'allocazione per obiettivo e orizzonte, adeguando il rischio, la correlazione e il ribilanciamento.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETF e indici globali (avanzati)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Scopri gli indici globali (ad esempio S&P 500), gli ETF e come costruire un\'esposizione internazionale con disciplina.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Imposte e rendicontazione (avanzata)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Comprendere i concetti fiscali fondamentali e come conservare i registri per segnalare gli investimenti in modo sicuro.';

  @override
  String get strategy_premiumLockedBody =>
      'Contenuti premium. Attiva un tema Cyber/Grimm/Hive per sbloccare l\'investimento Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Vetrina';

  @override
  String get homeShowcaseProfileSimTitle => 'Quiz sul profilo di rischio';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Trova il tuo profilo di investitore in pochi minuti.';

  @override
  String get homeShowcaseStrategiesTitle => 'Strategie consigliate';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Scorciatoie dirette per apprendere e applicare strategie.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentore: quiz e strategie';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Accesso rapido al quiz sul profilo di rischio e alle strategie consigliate.';

  @override
  String get homeTourStepClassicTitle => 'Modalità classica';

  @override
  String get homeTourStepClassicBody =>
      'Apre il pannello dell\'app originale: transazioni, obiettivi, investimenti e impostazioni nel layout familiare.';

  @override
  String get homeTourStepVitrineTitle => 'Zona vetrina';

  @override
  String get homeTourStepVitrineBody =>
      'Scorciatoie per imparare e fare pratica: profilo dell\'investitore, strategie e Mentor hub.';

  @override
  String get homeTourStepProfileTitle => 'Quiz sul profilo';

  @override
  String get homeTourStepProfileBody =>
      'Rispondi al questionario per scoprire il tuo profilo di rischio e vedere suggerimenti allineati.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategie';

  @override
  String get homeTourStepStrategiesBody =>
      'Contenuto per organizzare le finanze, investire con disciplina ed evitare le trappole comuni.';

  @override
  String get homeTourStepHubTitle => 'Centro mentori';

  @override
  String get homeTourStepHubBody =>
      'Menu rapido per il quiz del profilo e le strategie consigliate.';

  @override
  String get homeTourStepPremiumTitle => 'Funzionalità premium';

  @override
  String get homeTourStepPremiumBody =>
      'Tutoring automatico, grafici avanzati e report mensili: disponibili con un abbonamento Premium.';

  @override
  String get homeTourStepMarketTitle => 'Istantanea del mercato';

  @override
  String get homeTourStepMarketBody =>
      'Contesto di mercato (Brasile o globale) in base alla tua regione più il patrimonio netto convertito.';

  @override
  String get homeTourStepCalculatorTitle => 'Calcolatrice mentore';

  @override
  String get homeTourStepCalculatorBody =>
      'Simula l\'interesse composto, l\'inflazione e visualizza il grafico della ricchezza; quindi apriremo questo strumento.';

  @override
  String get quizProfile_title => 'Quiz sul profilo di rischio';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Domanda $current di $total';
  }

  @override
  String get quizProfile_badge => 'QUIZ SUL PROFILO DI RISCHIO';

  @override
  String get quizProfile_resultTitle => 'IL TUO PROFILO È';

  @override
  String get quizProfile_idealInvestmentsTitle => 'INVESTIMENTI IDEALI:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ESPLORA GLI INVESTIMENTI';

  @override
  String get quizProfile_exit => 'ESCI';

  @override
  String get quizKnowledge_title => 'Quiz di conoscenza';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Domanda $current di $total';
  }
}

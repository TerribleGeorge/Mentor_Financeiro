// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Mentor Finanțe';

  @override
  String get saldo => 'Sold';

  @override
  String get gastosDiarios => 'Cheltuieli zilnice';

  @override
  String get confirmarTransacao => 'Confirmați tranzacția\nDeclarație';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Transferuri';

  @override
  String get investimentos => 'Investiții';

  @override
  String get configuracoes => 'Setări';

  @override
  String get perfil => 'Profil';

  @override
  String get sair => 'Deconectare';

  @override
  String get entrar => 'Conectare';

  @override
  String get cadastrar => 'Înregistrare';

  @override
  String get email => 'E-mail';

  @override
  String get senha => 'Parolă';

  @override
  String get nome => 'Nume';

  @override
  String get cpf => 'Număr ID';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Continuați';

  @override
  String get voltar => 'Înapoi';

  @override
  String get cancelar => 'Anulează';

  @override
  String get salvar => 'Salvați';

  @override
  String get editar => 'Editare';

  @override
  String get excluir => 'Şterge';

  @override
  String get sucesso => 'Succes';

  @override
  String get erro => 'Eroare';

  @override
  String get carregando => 'Se încarcă...';

  @override
  String get semDados => 'Nu există date';

  @override
  String get tentarNovamente => 'Încercați din nou';

  @override
  String get relatorios => 'Rapoarte';

  @override
  String get gastosPorCategoria => 'Cheltuieli pe categorii';

  @override
  String get ultimosSeteDias => 'Ultimele 7 zile';

  @override
  String get totalGasto => 'Total cheltuit';

  @override
  String get transacoes => 'Tranzacții';

  @override
  String get categoria => 'Categorie';

  @override
  String get data => 'Data';

  @override
  String get valor => 'Valoare';

  @override
  String get descricao => 'Descriere';

  @override
  String get alimentacao => 'Mâncare';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Timp liber';

  @override
  String get saude => 'Sănătate';

  @override
  String get outros => 'Altele';

  @override
  String get notificacoes => 'Notificări';

  @override
  String get permissaoNotificacoes => 'Permisiune de notificare';

  @override
  String get ativarMonitoramento => 'Activați monitorizarea cheltuielilor';

  @override
  String get descricaoMonitoramento =>
      'Permiteți aplicației să vă monitorizeze automat tranzacțiile bancare pentru a vă organiza finanțele.';

  @override
  String get idioma => 'Limba';

  @override
  String get moeda => 'Moneda';

  @override
  String get compararInvestimentos => 'Comparați investițiile';

  @override
  String get descricaoLocalizacao =>
      'Pentru a compara investițiile locale (CDB/CDI) cu tarifele internaționale, avem nevoie de locația dvs.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Permisiune de locație necesară';

  @override
  String get rendaFixa => 'cu venit fix';

  @override
  String get rendaVariavel => 'Venit variabil';

  @override
  String get tesouroDireto => 'Trezorerie Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Stocuri';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Criptomonede';

  @override
  String get rendimento => 'Retur';

  @override
  String get rentabilidade => 'Rentabilitatea';

  @override
  String get aplicar => 'Aplicați';

  @override
  String get resgatar => 'Valorificați';

  @override
  String get simular => 'Simulare';

  @override
  String get metas => 'Goluri';

  @override
  String get estrategias => 'Strategii';

  @override
  String get conhecimento => 'Cunoștințe';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Trimite mesaj';

  @override
  String get digiteMensagem => 'Tastați un mesaj...';

  @override
  String get alertaGastos => 'Alertă privind cheltuielile';

  @override
  String alertaGastosMsg(int percent) {
    return 'Ați folosit deja $percent% din limita dvs. de credit.';
  }

  @override
  String get fechamentoFatura => 'Închiderea facturii';

  @override
  String get fechamentoFaturaMsg =>
      'Mâine este ziua de închidere. Moment bun pentru a revizui cheltuielile.';

  @override
  String get faturaVencendo => 'Factură datorată';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Factură scadentă în $dias zi(e). Verificați-vă soldul.';
  }

  @override
  String get regra30 => 'Sfat: Regula 30%.';

  @override
  String get regra30Msg =>
      'Păstrați utilizarea sub 30% pentru a vă îmbunătăți Scorul de credit.';

  @override
  String get diaDeOuro => 'Ziua de Aur!';

  @override
  String get diaDeOuroMsg =>
      'Achizițiile dvs. de astăzi vor fi plătite doar în 40 de zile!';

  @override
  String get alertaJuros => 'Avertisment: interes';

  @override
  String get alertaJurosMsg =>
      'Soldul dvs. nu acoperă factura. Evitați creditul revolving!';

  @override
  String get notaSaude => 'Sănătate financiară';

  @override
  String get notaExcelente => 'Excelent! Ai o sănătate financiară grozavă.';

  @override
  String get notaBom => 'Bun, dar se poate îmbunătăți.';

  @override
  String get notaAtencao => 'Atenție la cheltuieli.';

  @override
  String get notaRevisar => 'Examinați-vă finanțele.';

  @override
  String get mentorInsightTitle => 'Îndrumarea mentorului';

  @override
  String get mentorInsightLoading => 'Se preiau date de piață...';

  @override
  String get mentorInsightError =>
      'Nu s-au putut încărca datele acum. Încercați din nou în scurt timp.';

  @override
  String get mentorInsightOffline =>
      'Ești offline. Conectați-vă pentru a obține citate și informații despre Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Având în vedere volatilitatea actuală, acordați prioritate păstrării capitalului și lichidității înainte de a urmări rentabilitatea.';

  @override
  String get mentorAllocationBalanced =>
      'Echilibrați protecția și creșterea: diversificați-vă și revizuiți-vă orizontul obiectivelor.';

  @override
  String get mentorAllocationOffensive =>
      'Profilul dvs. permite mai mult risc: rămâneți disciplinat și evitați concentrarea grea.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Simboluri examinate: $symbols';
  }

  @override
  String get currencyFollowLocale => 'automată (limbă)';

  @override
  String get compoundCalculatorTitle => 'Mentor Calculator — Dobândă compusă';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulați contribuțiile, câștigul nominal vs real (după inflație) și note de mentor.';

  @override
  String get compoundInitialLabel => 'Sumă forfetară inițială';

  @override
  String get compoundMonthlyLabel => 'Contribuție lunară';

  @override
  String get compoundRateLabel => 'Rata dobânzii';

  @override
  String get compoundRateAnnual => 'pe an';

  @override
  String get compoundRateMonthly => 'pe lună';

  @override
  String get compoundHorizonLabel => 'Orizontul de timp';

  @override
  String get compoundHorizonYears => 'ani';

  @override
  String get compoundHorizonMonths => 'luni';

  @override
  String get compoundInflationLabel => 'Inflația estimată (% pe an)';

  @override
  String get compoundCalculate => 'Calculați';

  @override
  String get compoundChartInvested => 'Total investit';

  @override
  String get compoundChartInterest => 'Dobândă câștigată';

  @override
  String get compoundSummaryNominalEnd => 'Sold final (nominal)';

  @override
  String get compoundSummaryRealGain => 'Câștig real (putere de cumpărare)';

  @override
  String get compoundMentorCardTitle => 'Sfatul mentorului';

  @override
  String get compoundInvalidInput => 'Introduceți valori valide (orizont > 0).';

  @override
  String get userPersonaSectionTitle => 'Ton de mentor';

  @override
  String get userPersonaNovice => 'Începător';

  @override
  String get userPersonaStrategist => 'Strategist';

  @override
  String get userPersonaRiskTaker => 'Asumător de riscuri';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight =>
      'Deschideți informații complete despre mentor';

  @override
  String get investFirstSteps_title => 'Primii pași';

  @override
  String get investFirstSteps_brokerTitle => 'Alegeți un broker';

  @override
  String get investFirstSteps_brokerBody =>
      'Căutați instituții reglementate și de renume. Comparați taxele, produsele și fiabilitatea înainte de a deschide un cont.';

  @override
  String get investFirstSteps_openAccountTitle => 'Deschideți-vă contul';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Onboarding digital. În Brazilia, de obicei aveți nevoie de CPF/RG și uneori de dovada adresei.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Integrarea digitală variază în funcție de țară. De obicei, aveți nevoie de un act de identitate și de verificare a identității/adresei.';

  @override
  String get investFirstSteps_transferTitle => 'Transferați fonduri';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Trimiteți bani prin PIX sau transfer bancar către broker. Soldul devine disponibil pentru investiții.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Transferați fonduri prin transfer bancar sau prin metode de plată locale (în funcție de țara dvs.). Soldul devine disponibil pentru investiții.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Cunoaște-ți profilul de risc';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Răspunde la un chestionar de adecvare. Înțelegeți dacă sunteți conservator, moderat sau agresiv.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Cumpărați primul dvs. bun';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Începeți cu un fond de urgență (Tesouro Selic sau un CDB cu lichiditate zilnică). Apoi diversificați treptat.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Începeți cu un fond de urgență (numerar cu randament ridicat, fonduri de pe piața monetară sau obligațiuni de trezorerie pe termen scurt). Apoi diversificați treptat.';

  @override
  String get investFirstSteps_tipTitle => 'Sfat mentor:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Începeți mic, investiți în mod constant și evitați să încercați să cronometrați piața. Timpul este cel mai bun aliat al tău.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Începeți mic, investiți în mod constant și evitați să încercați să cronometrați piața. Timpul este cel mai bun aliat al tău.';

  @override
  String get investMenu_tesouroTitle => 'Trezoreria braziliană';

  @override
  String get investMenu_cdbTitle => 'Bank cu venit fix (CDB)';

  @override
  String get investMenu_etfsTitle => 'ETF-uri internaționale';

  @override
  String get investMenu_sp500Title => 'S&P 500 (index)';

  @override
  String get investMenu_stocksTitle => 'Stocuri';

  @override
  String get investMenu_fundsTitle => 'Fonduri';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Internațional';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Înregistrați investiții';

  @override
  String investRegionHintBr(String country) {
    return 'Țara efectivă: $country · Catalog Brazilia (Trezorerie, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Țara efectivă: $country · Catalog global (ETF-uri, NYSE/NASDAQ…). Ajustat automat din regiunea dispozitivului dvs.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Strategii esențiale';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Fond de urgență';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Scutul tău financiar. Acoperiți 6-12 luni de cheltuieli. Prioritizează lichiditatea zilnică și riscul scăzut (de exemplu, Tesouro Selic sau CDB legat de CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Scutul tău financiar. Acoperiți 6-12 luni de cheltuieli. Prioritizează lichiditatea zilnică și riscul scăzut (de exemplu, fondurile pieței monetare și obligațiunile de trezorerie pe termen scurt).';

  @override
  String get strategy_buyHoldTitle => 'Cumpărați și păstrați';

  @override
  String get strategy_buyHoldBody =>
      'Cumpărați active de calitate și păstrați-le pe termen lung. Concentrați-vă pe disciplină, calitate și reinvestire în timp.';

  @override
  String get strategy_diversificationTitle => 'Diversificare';

  @override
  String get strategy_diversificationBodyBr =>
      'Răspândiți-vă capitalul pe venit fix, acțiuni, FII și active internaționale pentru a reduce riscul și a îmbunătăți rentabilitatea ajustată la risc.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Răspândiți-vă capitalul în obligațiuni, acțiuni, REIT și expunere internațională pentru a reduce riscul și a îmbunătăți rentabilitatea ajustată la risc.';

  @override
  String get strategy_dcaTitle => 'Media costurilor în dolari (DCA)';

  @override
  String get strategy_dcaBody =>
      'Consecvența bate geniul. Investiția în fiecare lună este adesea mai eficientă decât încercarea de a alege punctul de intrare perfect.';

  @override
  String get strategy_smartGoalsTitle => 'obiective SMART';

  @override
  String get strategy_smartGoalsBody =>
      'Obiectivele dvs. ar trebui să fie specifice, măsurabile, realizabile, relevante și limitate în timp.';

  @override
  String get strategy_503020Title => '50-30-20 regula';

  @override
  String get strategy_503020Body =>
      'Un cadru de bugetare simplu: 50% nevoi, 30% dorințe, 20% investiții și obiective.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Alocarea activelor (avansat)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Aflați cum să construiți o alocare în funcție de obiectiv și orizont, ajustând riscul, corelarea și reechilibrarea.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETF-uri și indici globali (avansați)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Aflați despre indici globali (de exemplu, S&P 500), ETF-uri și cum să construiți expunerea internațională cu disciplină.';

  @override
  String get strategy_deepDive_taxesTitle => 'Taxe și raportare (avansat)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Înțelegeți conceptele fiscale de bază și cum să păstrați înregistrări pentru a raporta investițiile în siguranță.';

  @override
  String get strategy_premiumLockedBody =>
      'Conținut premium. Activați o temă Cyber/Grimm/Hive pentru a debloca investiția Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Vitrina';

  @override
  String get homeShowcaseProfileSimTitle => 'Test de profil de risc';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Găsiți profilul dvs. de investitor în câteva minute.';

  @override
  String get homeShowcaseStrategiesTitle => 'Strategii recomandate';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Comenzi rapide directe pentru a învăța și a aplica strategii.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: chestionare și strategii';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Acces rapid la testul de profil de risc și strategiile recomandate.';

  @override
  String get homeTourStepClassicTitle => 'Modul clasic';

  @override
  String get homeTourStepClassicBody =>
      'Deschide panoul original al aplicației: tranzacții, obiective, investiții și setări în aspectul familiar.';

  @override
  String get homeTourStepVitrineTitle => 'Zona de vitrină';

  @override
  String get homeTourStepVitrineBody =>
      'Comenzi rapide pentru a învăța și a exersa: profilul investitorului, strategii și hub-ul Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Test de profil';

  @override
  String get homeTourStepProfileBody =>
      'Răspundeți la chestionar pentru a vă descoperi profilul de risc și pentru a vedea sugestii aliniate.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategii';

  @override
  String get homeTourStepStrategiesBody =>
      'Conținut pentru a organiza finanțele, a investi cu disciplină și a evita capcanele comune.';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody =>
      'Meniu rapid la testul de profil și strategiile recomandate.';

  @override
  String get homeTourStepPremiumTitle => 'Caracteristici premium';

  @override
  String get homeTourStepPremiumBody =>
      'Mentorizare automată, diagrame avansate și rapoarte lunare — disponibile cu un abonament Premium.';

  @override
  String get homeTourStepMarketTitle => 'Instantaneu de piață';

  @override
  String get homeTourStepMarketBody =>
      'Contextul pieței (Brazilia sau global) bazat pe regiunea dvs. plus valoarea netă convertită.\nCalculator';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulați dobânda compusă, inflația și vedeți graficul averii; apoi deschidem acest instrument.';

  @override
  String get quizProfile_title => 'Test de profil de risc';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Întrebarea $current pentru $total';
  }

  @override
  String get quizProfile_badge => 'PROFIL DE RISC QUIZ';

  @override
  String get quizProfile_resultTitle => 'PROFILUL TĂU ESTE';

  @override
  String get quizProfile_idealInvestmentsTitle => 'INVESTIȚII IDEALE:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'EXPLORAȚI INVESTIȚII';

  @override
  String get quizProfile_exit => 'EXIT';

  @override
  String get quizKnowledge_title => 'Test de cunoștințe';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Întrebarea $current pentru $total';
  }
}

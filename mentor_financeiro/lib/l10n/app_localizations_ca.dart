// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Mentor Finances';

  @override
  String get saldo => 'Balanç';

  @override
  String get gastosDiarios => 'Despeses diàries';

  @override
  String get confirmarTransacao => 'Confirmeu la transacció\nDeclaració';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Trasllats';

  @override
  String get investimentos => 'Inversions\nConfiguració';

  @override
  String get configuracoes => 'Perfil';

  @override
  String get perfil => '';

  @override
  String get sair => 'Tanca la sessió';

  @override
  String get entrar => 'Inici de sessió';

  @override
  String get cadastrar => 'Registre';

  @override
  String get email => 'Correu electrònic';

  @override
  String get senha => 'Contrasenya';

  @override
  String get nome => 'Nom\nNúmero d\'identificació';

  @override
  String get cpf => 'Telèfon';

  @override
  String get telefone => '';

  @override
  String get continuar => 'Continua';

  @override
  String get voltar => 'Enrere';

  @override
  String get cancelar => 'Cancel·la';

  @override
  String get salvar => 'Desa';

  @override
  String get editar => 'Edita';

  @override
  String get excluir => 'Suprimeix';

  @override
  String get sucesso => 'Èxit\nError';

  @override
  String get erro => '';

  @override
  String get carregando => 'Carregant...';

  @override
  String get semDados => 'Sense dades';

  @override
  String get tentarNovamente => 'Torna-ho a provar\nInformes';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'Despeses per categoria';

  @override
  String get ultimosSeteDias => '7 darrers dies';

  @override
  String get totalGasto => 'Total gastat';

  @override
  String get transacoes => 'Transaccions\nCategoria';

  @override
  String get categoria => '';

  @override
  String get data => 'Data\nValor';

  @override
  String get valor => '';

  @override
  String get descricao => 'Descripció';

  @override
  String get alimentacao => 'Menjar';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Oci';

  @override
  String get saude => 'Salut';

  @override
  String get outros => 'Altres';

  @override
  String get notificacoes => 'Notificacions\nPermís de notificació';

  @override
  String get permissaoNotificacoes => '';

  @override
  String get ativarMonitoramento => 'Habilita el seguiment de despeses';

  @override
  String get descricaoMonitoramento =>
      'Permet que l\'aplicació controli automàticament les transaccions bancàries per organitzar les teves finances.';

  @override
  String get idioma => 'Idioma';

  @override
  String get moeda => 'Moneda';

  @override
  String get compararInvestimentos => 'Compara inversions';

  @override
  String get descricaoLocalizacao =>
      'Per comparar inversions locals (CDB/CDI) amb tarifes internacionals, necessitem la vostra ubicació.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Cal permís d\'ubicació';

  @override
  String get rendaFixa => 'Renda Fixa';

  @override
  String get rendaVariavel => 'Renda variable';

  @override
  String get tesouroDireto => 'Tresoreria directa';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Estocs';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Criptomonedes';

  @override
  String get rendimento => 'Tornada';

  @override
  String get rentabilidade => 'Rendibilitat';

  @override
  String get aplicar => 'Sol·licitar';

  @override
  String get resgatar => 'Bescanviar';

  @override
  String get simular => 'Simular';

  @override
  String get metas => 'Gols';

  @override
  String get estrategias => 'Estratègies';

  @override
  String get conhecimento => 'Coneixement';

  @override
  String get chat => 'Xat';

  @override
  String get enviarMensagem => 'Envia missatge';

  @override
  String get digiteMensagem => 'Escriviu un missatge...';

  @override
  String get alertaGastos => 'Alerta de despesa';

  @override
  String alertaGastosMsg(int percent) {
    return 'Ja heu utilitzat el $percent% del vostre límit de crèdit.';
  }

  @override
  String get fechamentoFatura => 'Tancament de la factura';

  @override
  String get fechamentoFaturaMsg =>
      'Demà és el dia de tancament. Un bon moment per revisar les despeses.';

  @override
  String get faturaVencendo => 'Factura pendent';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Factura amb venciment d\'aquí a $dias dies. Comproveu el vostre saldo.';
  }

  @override
  String get regra30 => 'Consell: regla del 30%.';

  @override
  String get regra30Msg =>
      'Mantingueu l\'ús per sota del 30% per millorar la vostra puntuació de crèdit.';

  @override
  String get diaDeOuro => 'Dia daurat!';

  @override
  String get diaDeOuroMsg =>
      'Les vostres compres d\'avui només es pagaran en 40 dies!';

  @override
  String get alertaJuros => 'Avís: interès';

  @override
  String get alertaJurosMsg =>
      'El vostre saldo no cobreix la factura. Eviteu el crèdit rotatiu!';

  @override
  String get notaSaude => 'Salut financera';

  @override
  String get notaExcelente => 'Excel·lent! Tens una gran salut financera.';

  @override
  String get notaBom => 'Bé, però pot millorar.';

  @override
  String get notaAtencao => 'Atenció a la despesa.';

  @override
  String get notaRevisar => 'Revisa les teves finances.';

  @override
  String get mentorInsightTitle => 'Orientació del mentor';

  @override
  String get mentorInsightLoading => 'S\'estan obtenint dades del mercat...';

  @override
  String get mentorInsightError =>
      'No s\'han pogut carregar les dades en aquest moment. Torna-ho a provar en breu.';

  @override
  String get mentorInsightOffline =>
      'Estàs fora de línia. Connecteu-vos per obtenir pressupostos i estadístiques de Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Donada la volatilitat actual, prioritzeu la preservació del capital i la liquiditat abans de perseguir els rendiments.';

  @override
  String get mentorAllocationBalanced =>
      'Equilibri la protecció i el creixement: diversifica i revisa el teu horitzó d\'objectius.';

  @override
  String get mentorAllocationOffensive =>
      'El teu perfil permet més risc: mantén la disciplina i evita concentracions pesades.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Símbols revisats: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automàtic (idioma)';

  @override
  String get compoundCalculatorTitle => 'Mentor Calculadora — Interès compost';

  @override
  String get compoundCalculatorSubtitle =>
      'Simular contribucions, guany nominal vs real (després de la inflació) i notes del mentor.';

  @override
  String get compoundInitialLabel => 'Suma global inicial';

  @override
  String get compoundMonthlyLabel => 'Aportació mensual';

  @override
  String get compoundRateLabel => 'Tipus d\'interès';

  @override
  String get compoundRateAnnual => 'per any';

  @override
  String get compoundRateMonthly => 'al mes';

  @override
  String get compoundHorizonLabel => 'Horitzó temporal';

  @override
  String get compoundHorizonYears => 'anys';

  @override
  String get compoundHorizonMonths => 'mesos';

  @override
  String get compoundInflationLabel => 'Inflació estimada (% per any)';

  @override
  String get compoundCalculate => 'Calcula';

  @override
  String get compoundChartInvested => 'Total invertit';

  @override
  String get compoundChartInterest => 'Interessos guanyats';

  @override
  String get compoundSummaryNominalEnd => 'Saldo final (nominal)';

  @override
  String get compoundSummaryRealGain => 'Guany real (poder adquisitiu)';

  @override
  String get compoundMentorCardTitle => 'Consell de mentor';

  @override
  String get compoundInvalidInput => 'Introduïu valors vàlids (horitzó > 0).';

  @override
  String get userPersonaSectionTitle => 'To mentor';

  @override
  String get userPersonaNovice => 'Principiant';

  @override
  String get userPersonaStrategist => 'Estratega';

  @override
  String get userPersonaRiskTaker => 'Prenedor de riscos';

  @override
  String get userPersonaConservative => 'Estalvi';

  @override
  String get compoundOpenFullInsight => 'Obriu una visió completa del mentor';

  @override
  String get investFirstSteps_title => 'Primers passos';

  @override
  String get investFirstSteps_brokerTitle => 'Trieu un corredor';

  @override
  String get investFirstSteps_brokerBody =>
      'Busqueu institucions regulades i de bona reputació. Compareu les tarifes, els productes i la fiabilitat abans d\'obrir un compte.';

  @override
  String get investFirstSteps_openAccountTitle => 'Obre el teu compte';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Incorporació digital. Al Brasil, normalment necessiteu CPF/RG i, de vegades, una prova de domicili.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'La incorporació digital varia segons el país. Normalment necessiteu un document d\'identitat i una verificació d\'identitat/adreça.';

  @override
  String get investFirstSteps_transferTitle => 'Transferència de fons';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Envieu diners mitjançant PIX o transferència bancària al vostre corredor. El saldo està disponible per invertir.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Transfereix fons mitjançant transferència bancària o mètodes de pagament locals (depèn del teu país). El saldo està disponible per invertir.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Coneix el teu perfil de risc';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Respon un qüestionari d\'idoneïtat. Comprèn si ets conservador, moderat o agressiu.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Compra el teu primer actiu';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Comenceu amb un fons d\'emergència (Tesouro Selic o un CDB de liquiditat diària). A continuació, diversifica gradualment.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Comenceu amb un fons d\'emergència (efectiu d\'alt rendiment, fons del mercat monetari o bons del Tresor a curt termini). A continuació, diversifica gradualment.\nConsell del mentor';

  @override
  String get investFirstSteps_tipTitle => ':';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Comença petit, inverteix de manera coherent i evita intentar cronometrar el mercat. El temps és el teu millor aliat.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Comença petit, inverteix de manera coherent i evita intentar cronometrar el mercat. El temps és el teu millor aliat.';

  @override
  String get investMenu_tesouroTitle => 'Tresor del Brasil';

  @override
  String get investMenu_cdbTitle => 'Renda fixa del banc (CDB)';

  @override
  String get investMenu_etfsTitle => 'ETF internacionals';

  @override
  String get investMenu_sp500Title => 'S&P 500 (índex)';

  @override
  String get investMenu_stocksTitle => 'Accions\nFons';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Internacional';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Registre d\'inversió';

  @override
  String investRegionHintBr(String country) {
    return 'País efectiu: $country · Catàleg de Brasil (Hisenda, CDB, LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'País efectiu: $country · Catàleg global (ETF, NYSE/NASDAQ...). S\'ajusta automàticament des de la regió del dispositiu.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Estratègies essencials';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Fons d\'emergència';

  @override
  String get strategy_emergencyFundBodyBr =>
      'El teu escut financer. Cobrir 6-12 mesos de despeses. Prioritzeu la liquiditat diària i el baix risc (p. ex., Tesouro Selic o CDB vinculat a CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'El teu escut financer. Cobrir 6-12 mesos de despeses. Prioritzeu la liquiditat diària i el baix risc (p. ex., fons del mercat monetari i bons del Tresor a curt termini).';

  @override
  String get strategy_buyHoldTitle => 'Comprar i mantenir';

  @override
  String get strategy_buyHoldBody =>
      'Compreu actius de qualitat i mantingueu-los a llarg termini. Centra\'t en la disciplina, la qualitat i la reinversió al llarg del temps.';

  @override
  String get strategy_diversificationTitle => 'Diversificació';

  @override
  String get strategy_diversificationBodyBr =>
      'Distribuïu el vostre capital entre renda fixa, accions, FII i actius internacionals per reduir el risc i millorar els rendiments ajustats al risc.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Distribuïu el vostre capital entre bons, accions, REIT i exposició internacional per reduir el risc i millorar els rendiments ajustats al risc.';

  @override
  String get strategy_dcaTitle => 'Mitjana de costos en dòlars (DCA)';

  @override
  String get strategy_dcaBody =>
      'La consistència supera el geni. Invertir cada mes és sovint més efectiu que intentar escollir el punt d\'entrada perfecte.\nObjectius';

  @override
  String get strategy_smartGoalsTitle => 'SMART';

  @override
  String get strategy_smartGoalsBody =>
      'Els vostres objectius han de ser específics, mesurables, assolibles, rellevants i limitats en el temps.';

  @override
  String get strategy_503020Title => '50-30-20 regla';

  @override
  String get strategy_503020Body =>
      'Un marc pressupostari senzill: 50% necessitats, 30% desitjos, 20% inversió i objectius.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Assignació d\'actius (avançat)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Apreneu a crear una assignació per objectiu i horitzó, ajustant el risc, la correlació i el reequilibri.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETF i índexs globals (avançat)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Obteniu informació sobre índexs globals (p. ex., S&P 500), ETF i com crear una exposició internacional amb disciplina.';

  @override
  String get strategy_deepDive_taxesTitle => 'Impostos i informes (avançat)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Comprendre els conceptes fiscals bàsics i com mantenir registres per informar de les inversions de manera segura.';

  @override
  String get strategy_premiumLockedBody =>
      'Contingut premium. Activa un tema Cyber/Grimm/Hive per desbloquejar la inversió Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Aparador';

  @override
  String get homeShowcaseProfileSimTitle => 'Test de perfil de risc';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Trobeu el vostre perfil d\'inversor en pocs minuts.';

  @override
  String get homeShowcaseStrategiesTitle => 'Estratègies recomanades';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Dreceres directes per aprendre i aplicar estratègies.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: qüestionaris i estratègies';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Accés ràpid al qüestionari del perfil de risc i a les estratègies recomanades.';

  @override
  String get homeTourStepClassicTitle => 'Mode clàssic';

  @override
  String get homeTourStepClassicBody =>
      'Obre el tauler de l\'aplicació original: transaccions, objectius, inversions i configuracions en el disseny familiar.';

  @override
  String get homeTourStepVitrineTitle => 'Zona d\'aparador';

  @override
  String get homeTourStepVitrineBody =>
      'Dreceres per aprendre i practicar: perfil d\'inversor, estratègies i el centre Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Test de perfil';

  @override
  String get homeTourStepProfileBody =>
      'Contesteu el qüestionari per descobrir el vostre perfil de risc i veure suggeriments alineats.';

  @override
  String get homeTourStepStrategiesTitle => 'Estratègies';

  @override
  String get homeTourStepStrategiesBody =>
      'Contingut per organitzar les finances, invertir amb disciplina i evitar inconvenients habituals.';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody =>
      'Menú ràpid al qüestionari de perfil i estratègies recomanades.';

  @override
  String get homeTourStepPremiumTitle => 'Funcions Premium';

  @override
  String get homeTourStepPremiumBody =>
      'Tutoria automàtica, gràfics avançats i informes mensuals, disponibles amb una subscripció Premium.';

  @override
  String get homeTourStepMarketTitle => 'Instantània del mercat';

  @override
  String get homeTourStepMarketBody =>
      'Context del mercat (Brasil o global) basat en la vostra regió més el valor net convertit.\nCalculadora';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor';

  @override
  String get homeTourStepCalculatorBody =>
      'Simula l\'interès compost, la inflació i consulta el gràfic de riquesa; a continuació obrim aquesta eina.';

  @override
  String get quizProfile_title => 'Test de perfil de risc';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Pregunta $current de $total';
  }

  @override
  String get quizProfile_badge => 'PRESTACIÓ DEL PERFIL DE RISC';

  @override
  String get quizProfile_resultTitle => 'EL TEU PERFIL ÉS';

  @override
  String get quizProfile_idealInvestmentsTitle => 'INVERSIONS IDEALS:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'EXPLORAR INVERSIONS';

  @override
  String get quizProfile_exit => 'SORTIDA';

  @override
  String get quizKnowledge_title => 'Test de coneixements';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Pregunta $current de $total';
  }
}

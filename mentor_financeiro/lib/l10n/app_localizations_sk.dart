// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance\nUpozornenie na výdavky';

  @override
  String get saldo => 'Zostatok';

  @override
  String get gastosDiarios => 'Denné výdavky';

  @override
  String get confirmarTransacao => 'Potvrdenie transakcie\nVyhlásenie';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Prevody';

  @override
  String get investimentos => 'Investície';

  @override
  String get configuracoes => 'Nastavenia\nProfil';

  @override
  String get perfil => '';

  @override
  String get sair => 'Odhlásenie';

  @override
  String get entrar => 'Prihlásenie\nRegistrovať sa';

  @override
  String get cadastrar => '';

  @override
  String get email => 'E-mail\nHeslo';

  @override
  String get senha => '';

  @override
  String get nome => 'Názov\nIdentifikačné číslo';

  @override
  String get cpf => 'Telefón';

  @override
  String get telefone => '';

  @override
  String get continuar => 'Pokračujte';

  @override
  String get voltar => 'Späť';

  @override
  String get cancelar => 'Zrušiť';

  @override
  String get salvar => 'Uložiť';

  @override
  String get editar => 'Upraviť';

  @override
  String get excluir => 'Odstrániť';

  @override
  String get sucesso => 'Úspech';

  @override
  String get erro => 'Chyba';

  @override
  String get carregando => 'Načítavam...';

  @override
  String get semDados => 'Žiadne údaje';

  @override
  String get tentarNovamente => 'Skúste to znova\nSprávy';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'Výdavky podľa kategórie';

  @override
  String get ultimosSeteDias => 'Posledných 7 dní';

  @override
  String get totalGasto => 'Celkové výdavky';

  @override
  String get transacoes => 'Transakcie\nKategória';

  @override
  String get categoria => '';

  @override
  String get data => 'Dátum';

  @override
  String get valor => 'Hodnota';

  @override
  String get descricao => 'Popis';

  @override
  String get alimentacao => 'Jedlo';

  @override
  String get transporte => 'Doprava';

  @override
  String get lazer => 'Voľný čas';

  @override
  String get saude => 'Zdravie';

  @override
  String get outros => 'Ostatné\nOznámenia';

  @override
  String get notificacoes => '';

  @override
  String get permissaoNotificacoes => 'Povolenie oznámenia';

  @override
  String get ativarMonitoramento => 'Povoliť sledovanie výdavkov';

  @override
  String get descricaoMonitoramento =>
      'Umožnite aplikácii automaticky monitorovať vaše bankové transakcie a organizovať tak vaše financie.';

  @override
  String get idioma => 'Jazyk';

  @override
  String get moeda => 'Mena';

  @override
  String get compararInvestimentos => 'Porovnajte investície';

  @override
  String get descricaoLocalizacao =>
      'Na porovnanie miestnych investícií (CDB/CDI) s medzinárodnými sadzbami potrebujeme vašu polohu.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Vyžaduje sa povolenie na umiestnenie';

  @override
  String get rendaFixa => 'Pevný príjem';

  @override
  String get rendaVariavel => 'Variabilný príjem';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Zásoby';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kryptomeny';

  @override
  String get rendimento => 'Návrat';

  @override
  String get rentabilidade => 'Ziskovosť';

  @override
  String get aplicar => 'Použiť\nUplatniť';

  @override
  String get resgatar => '';

  @override
  String get simular => 'Simulovať';

  @override
  String get metas => 'Ciele';

  @override
  String get estrategias => '';

  @override
  String get conhecimento => 'Vedomosti';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Odoslať správu';

  @override
  String get digiteMensagem => 'Napíšte správu...';

  @override
  String get alertaGastos => '';

  @override
  String alertaGastosMsg(int percent) {
    return 'Už ste použili $percent % svojho kreditného limitu.';
  }

  @override
  String get fechamentoFatura => 'Uzávierka faktúry';

  @override
  String get fechamentoFaturaMsg =>
      'Zajtra je zatvárací deň. Skvelý čas na preskúmanie výdavkov.';

  @override
  String get faturaVencendo => 'Splatná faktúra';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Splatnosť faktúry do $dias dní. Skontrolujte si zostatok.';
  }

  @override
  String get regra30 => 'Tip: Pravidlo 30 %.';

  @override
  String get regra30Msg =>
      'Udržujte používanie pod 30 %, aby ste zlepšili svoje kreditné skóre.';

  @override
  String get diaDeOuro => 'Zlatý deň!';

  @override
  String get diaDeOuroMsg => 'Vaše dnešné nákupy budú vyplatené až do 40 dní!';

  @override
  String get alertaJuros => 'Upozornenie: Záujem';

  @override
  String get alertaJurosMsg =>
      'Váš zostatok nepokrýva účet. Vyhnite sa revolvingovému kreditu!';

  @override
  String get notaSaude => 'Finančné zdravie';

  @override
  String get notaExcelente => 'Výborne! Máte skvelé finančné zdravie.';

  @override
  String get notaBom => 'Dobré, ale môže sa zlepšiť.';

  @override
  String get notaAtencao => 'Pozor na výdavky.';

  @override
  String get notaRevisar => 'Skontrolujte svoje financie.';

  @override
  String get mentorInsightTitle => 'Poradenstvo mentora';

  @override
  String get mentorInsightLoading => 'Načítavajú sa údaje o trhu…';

  @override
  String get mentorInsightError =>
      'Momentálne nie je možné načítať údaje. Skúste to znova o chvíľu.';

  @override
  String get mentorInsightOffline =>
      'Ste offline. Pripojte sa k načítaniu cenových ponúk a prehľadov mentorov.';

  @override
  String get mentorAllocationDefensive =>
      'Vzhľadom na súčasnú volatilitu uprednostňujte zachovanie kapitálu a likviditu pred honbou za výnosmi.';

  @override
  String get mentorAllocationBalanced =>
      'Vyvážte ochranu a rast: diverzifikujte a prehodnoťte svoj horizont cieľov.';

  @override
  String get mentorAllocationOffensive =>
      'Váš profil umožňuje väčšie riziko: zostaňte disciplinovaní a vyhnite sa silnej koncentrácii.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'skontrolované symboly: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automaticky (jazyk)';

  @override
  String get compoundCalculatorTitle => 'Mentorská kalkulačka — Zložený úrok';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulujte príspevky, nominálny verzus skutočný zisk (po inflácii) a mentorské poznámky.';

  @override
  String get compoundInitialLabel => 'Počiatočná paušálna suma';

  @override
  String get compoundMonthlyLabel => 'Mesačný príspevok';

  @override
  String get compoundRateLabel => 'Úroková sadzba';

  @override
  String get compoundRateAnnual => 'ročne';

  @override
  String get compoundRateMonthly => 'mesačne';

  @override
  String get compoundHorizonLabel => 'Časový horizont';

  @override
  String get compoundHorizonYears => 'rokov';

  @override
  String get compoundHorizonMonths => 'mesiacov';

  @override
  String get compoundInflationLabel => 'Odhadovaná inflácia (% za rok)';

  @override
  String get compoundCalculate => 'Vypočítajte';

  @override
  String get compoundChartInvested => 'Celková investícia';

  @override
  String get compoundChartInterest => 'Získaný úrok';

  @override
  String get compoundSummaryNominalEnd => 'Konečný zostatok (nominálny)';

  @override
  String get compoundSummaryRealGain => 'Skutočný zisk (kúpna sila)';

  @override
  String get compoundMentorCardTitle => 'Poradenstvo mentora';

  @override
  String get compoundInvalidInput => 'Zadajte platné hodnoty (horizont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentorský tón';

  @override
  String get userPersonaNovice => 'Začiatočník\nStratég';

  @override
  String get userPersonaStrategist => '';

  @override
  String get userPersonaRiskTaker => 'Rizikový\nŠetrič';

  @override
  String get userPersonaConservative => '';

  @override
  String get compoundOpenFullInsight => 'Otvorte úplný náhľad mentora';

  @override
  String get investFirstSteps_title => 'Prvé kroky';

  @override
  String get investFirstSteps_brokerTitle => 'Vyberte si makléra';

  @override
  String get investFirstSteps_brokerBody =>
      'Hľadajte regulované, renomované inštitúcie. Pred otvorením účtu porovnajte poplatky, produkty a spoľahlivosť.';

  @override
  String get investFirstSteps_openAccountTitle => 'Otvorte si účet';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitálny onboarding. V Brazílii zvyčajne potrebujete CPF/RG a niekedy aj doklad o adrese.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digitálna integrácia sa v jednotlivých krajinách líši. Zvyčajne potrebujete doklad totožnosti a overenie totožnosti/adresy.';

  @override
  String get investFirstSteps_transferTitle => 'Prevod prostriedkov';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Pošlite peniaze prostredníctvom PIX alebo bankovým prevodom svojmu maklérovi. Zostatok bude k dispozícii na investovanie.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Prevod prostriedkov bankovým prevodom alebo miestnymi platobnými metódami (v závislosti od vašej krajiny). Zostatok bude k dispozícii na investovanie.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Poznajte svoj rizikový profil';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Odpovedzte na dotazník vhodnosti. Uvedomte si, či ste konzervatívny, umiernený alebo agresívny.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Kúpte si svoj prvý majetok';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Začnite s núdzovým fondom (Tesouro Selic alebo CDB s dennou likviditou). Potom postupne diverzifikujte.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Začnite s núdzovým fondom (hotovosť s vysokým výnosom, fondy peňažného trhu alebo krátkodobé štátne dlhopisy). Potom postupne diverzifikujte.';

  @override
  String get investFirstSteps_tipTitle => 'Tip mentora:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Začnite v malom, investujte dôsledne a vyhnite sa pokusom načasovať trh. Čas je váš najlepší spojenec.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Začnite v malom, investujte dôsledne a vyhnite sa pokusom načasovať trh. Čas je váš najlepší spojenec.';

  @override
  String get investMenu_tesouroTitle => 'Brazílske štátne pokladnice';

  @override
  String get investMenu_cdbTitle =>
      'Banka s pevným výnosom (CDB)\nMedzinárodné ETF';

  @override
  String get investMenu_etfsTitle => '';

  @override
  String get investMenu_sp500Title => 'S&P 500 (index)';

  @override
  String get investMenu_stocksTitle => 'Zásoby\nFinančné prostriedky';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs\nMedzinárodné';

  @override
  String get investMenu_internationalTitle => '';

  @override
  String get investMenu_cryptoTitle => 'kryptomeny';

  @override
  String get investRegisterCta => 'Registrovať investíciu';

  @override
  String investRegionHintBr(String country) {
    return 'Platná krajina: $country · Brazílsky katalóg (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Platná krajina: $country · Globálny katalóg (ETF, NYSE/NASDAQ…). Automaticky upravené z oblasti vášho zariadenia.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Základné stratégie';

  @override
  String get strategy_sectionDeepDiveTitle => 'Hlboký ponor (prémiový)';

  @override
  String get strategy_emergencyFundTitle => 'Núdzový fond';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Váš finančný štít. Pokrytie nákladov na 6-12 mesiacov. Uprednostňujte dennú likviditu a nízke riziko (napr. Tesouro Selic alebo CDB spojené s CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Váš finančný štít. Pokrytie nákladov na 6-12 mesiacov. Uprednostňujte dennú likviditu a nízke riziko (napr. fondy peňažného trhu a krátkodobé štátne dlhopisy).';

  @override
  String get strategy_buyHoldTitle => 'Kúpiť a držať';

  @override
  String get strategy_buyHoldBody =>
      'Kúpte si kvalitné aktíva a držte ich dlhodobo. Zamerajte sa na disciplínu, kvalitu a reinvestície v priebehu času.';

  @override
  String get strategy_diversificationTitle => 'Diverzifikácia';

  @override
  String get strategy_diversificationBodyBr =>
      'Rozložte svoj kapitál medzi pevný príjem, akcie, FII a medzinárodné aktíva, aby ste znížili riziko a zlepšili výnosy upravené o riziko.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Rozložte svoj kapitál medzi dlhopisy, akcie, REIT a medzinárodnú expozíciu, aby ste znížili riziko a zlepšili výnosy upravené o riziko.';

  @override
  String get strategy_dcaTitle => 'Priemerovanie nákladov v dolároch (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konzistentnosť poráža génia. Investovanie každý mesiac je často efektívnejšie ako snaha vybrať si perfektný vstupný bod.';

  @override
  String get strategy_smartGoalsTitle => 'SMART ciele';

  @override
  String get strategy_smartGoalsBody =>
      'Vaše ciele by mali byť konkrétne, merateľné, dosiahnuteľné, relevantné a časovo ohraničené.\nPravidlo';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Jednoduchý rozpočtový rámec: 50 % potrieb, 30 % potrieb, 20 % investovania a cieľov.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Rozdelenie aktív (pokročilé)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Naučte sa, ako vytvoriť alokáciu podľa cieľa a horizontu, upraviť riziko, koreláciu a opätovné vyváženie.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globálne ETF a indexy (pokročilé)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Dozviete sa o globálnych indexoch (napr. S&P 500), ETF a o tom, ako disciplínou vybudovať medzinárodnú expozíciu.';

  @override
  String get strategy_deepDive_taxesTitle => 'Dane a výkazníctvo (pokročilé)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Pochopte základné daňové koncepty a ako viesť záznamy na bezpečné vykazovanie investícií.';

  @override
  String get strategy_premiumLockedBody =>
      'Prémiový obsah. Aktivujte si tému Cyber/Grimm/Hive a odomknite investičný Deep Dive.\nVitrína';

  @override
  String get homeShowcaseTitle => '';

  @override
  String get homeShowcaseProfileSimTitle => 'Kvíz rizikového profilu';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Nájdite svoj profil investora za pár minút.';

  @override
  String get homeShowcaseStrategiesTitle => 'Odporúčané stratégie';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Priame skratky na učenie sa a uplatňovanie stratégií.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Kvízy a stratégie';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Rýchly prístup ku kvízu rizikového profilu a odporúčaným stratégiám.';

  @override
  String get homeTourStepClassicTitle => 'Klasický režim';

  @override
  String get homeTourStepClassicBody =>
      'Otvorí pôvodný panel aplikácie: transakcie, ciele, investície a nastavenia v známom rozložení.';

  @override
  String get homeTourStepVitrineTitle => 'Vitrína';

  @override
  String get homeTourStepVitrineBody =>
      'Skratky na učenie a precvičovanie: profil investora, stratégie a centrum Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Profilový kvíz';

  @override
  String get homeTourStepProfileBody =>
      'Odpovedaním na dotazník objavíte svoj rizikový profil a uvidíte zosúladené návrhy.\nStratégie';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Usporiadajte si financie, investujte disciplinovane a vyhýbajte sa bežným nástrahám.\nNáboj Mentor';

  @override
  String get homeTourStepHubTitle => '';

  @override
  String get homeTourStepHubBody =>
      'Rýchla ponuka k profilovému kvízu a odporúčaným stratégiám.';

  @override
  String get homeTourStepPremiumTitle => 'Prémiové funkcie';

  @override
  String get homeTourStepPremiumBody =>
      'Auto mentoring, pokročilé grafy a mesačné správy – dostupné s predplatným Premium.';

  @override
  String get homeTourStepMarketTitle => 'Snímka trhu';

  @override
  String get homeTourStepMarketBody =>
      'Trhový kontext (Brazília alebo globálny) na základe vášho regiónu a prepočítaného čistého majetku.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentorská kalkulačka';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulujte zložený úrok, infláciu a pozrite si tabuľku bohatstva; ďalej otvoríme tento nástroj.';

  @override
  String get quizProfile_title => 'Kvíz rizikového profilu';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Otázka $current z $total';
  }

  @override
  String get quizProfile_badge => 'KVÍZ RIZIKOVÉHO PROFILU';

  @override
  String get quizProfile_resultTitle => 'VÁŠ PROFIL JE';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEÁLNE INVESTÍCIE:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'PRESKÚMAJTE INVESTÍCIE';

  @override
  String get quizProfile_exit => 'VÝSTUP';

  @override
  String get quizKnowledge_title => 'Vedomostný kvíz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Otázka $current z $total';
  }
}

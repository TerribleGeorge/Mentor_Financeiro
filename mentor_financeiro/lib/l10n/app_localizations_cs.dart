// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance\nUpozornění na výdaje';

  @override
  String get saldo => 'Zůstatek';

  @override
  String get gastosDiarios => 'Denní výdaje';

  @override
  String get confirmarTransacao => 'Potvrďte transakci\nVýpis';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Převody';

  @override
  String get investimentos => 'Investice';

  @override
  String get configuracoes => 'Nastavení\nProfil';

  @override
  String get perfil => '';

  @override
  String get sair => 'Odhlášení';

  @override
  String get entrar => 'Přihlášení\nRegistrujte se';

  @override
  String get cadastrar => '';

  @override
  String get email => 'E-mail\nHeslo';

  @override
  String get senha => '';

  @override
  String get nome => 'Název\nID číslo';

  @override
  String get cpf => 'Telefon';

  @override
  String get telefone => '';

  @override
  String get continuar => 'Pokračujte';

  @override
  String get voltar => 'Zpět';

  @override
  String get cancelar => 'Zrušit';

  @override
  String get salvar => 'Uložit';

  @override
  String get editar => 'Upravit';

  @override
  String get excluir => 'Smazat';

  @override
  String get sucesso => 'Úspěch';

  @override
  String get erro => 'Chyba';

  @override
  String get carregando => 'Načítání...';

  @override
  String get semDados => 'Žádná data';

  @override
  String get tentarNovamente => 'Zkuste to znovu\nZprávy';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'Výdaje podle kategorií';

  @override
  String get ultimosSeteDias => 'Posledních 7 dní';

  @override
  String get totalGasto => 'Celková útrata';

  @override
  String get transacoes => 'Transakce\nKategorie';

  @override
  String get categoria => '';

  @override
  String get data => 'Datum\nHodnota';

  @override
  String get valor => '';

  @override
  String get descricao => 'Popis';

  @override
  String get alimentacao => 'Jídlo';

  @override
  String get transporte => 'Doprava';

  @override
  String get lazer => 'Volný čas';

  @override
  String get saude => 'Zdraví';

  @override
  String get outros => 'Ostatní';

  @override
  String get notificacoes => 'Oznámení\nOprávnění k oznámení';

  @override
  String get permissaoNotificacoes => '';

  @override
  String get ativarMonitoramento => 'Povolit sledování výdajů';

  @override
  String get descricaoMonitoramento =>
      'Umožněte aplikaci automaticky sledovat vaše bankovní transakce za účelem uspořádání vašich financí.\nJazyk';

  @override
  String get idioma => '';

  @override
  String get moeda => 'Měna';

  @override
  String get compararInvestimentos => 'Porovnání investic';

  @override
  String get descricaoLocalizacao =>
      'K porovnání místních investic (CDB/CDI) s mezinárodními sazbami potřebujeme vaši polohu.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Je vyžadováno oprávnění k umístění';

  @override
  String get rendaFixa => 'Pevný příjem';

  @override
  String get rendaVariavel => 'Variabilní příjem';

  @override
  String get tesouroDireto => 'Přímá pokladna';

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
  String get criptomoedas => 'Kryptoměny';

  @override
  String get rendimento => 'Návrat';

  @override
  String get rentabilidade => 'Ziskovost';

  @override
  String get aplicar => 'Použít';

  @override
  String get resgatar => 'Uplatnit';

  @override
  String get simular => 'Simulovat';

  @override
  String get metas => 'Branky';

  @override
  String get estrategias => '';

  @override
  String get conhecimento => 'Znalosti';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Odeslat zprávu';

  @override
  String get digiteMensagem => 'Napište zprávu...';

  @override
  String get alertaGastos => '';

  @override
  String alertaGastosMsg(int percent) {
    return 'Již jste využili $percent % svého kreditního limitu.';
  }

  @override
  String get fechamentoFatura => 'Uzavření faktury';

  @override
  String get fechamentoFaturaMsg =>
      'Zítra je zavírací den. Skvělý čas na revizi výdajů.';

  @override
  String get faturaVencendo => 'Splatná faktura';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Splatnost faktury za $dias dny. Zkontrolujte svůj zůstatek.';
  }

  @override
  String get regra30 => 'Tip: Pravidlo 30 %.';

  @override
  String get regra30Msg =>
      'Udržujte používání pod 30 %, abyste zlepšili své kreditní skóre.';

  @override
  String get diaDeOuro => 'Zlatý den!';

  @override
  String get diaDeOuroMsg => 'Vaše dnešní nákupy budou vyplaceny až za 40 dní!';

  @override
  String get alertaJuros => 'Upozornění: Zájem';

  @override
  String get alertaJurosMsg =>
      'Váš zůstatek nepokrývá účet. Vyhněte se revolvingovému úvěru!';

  @override
  String get notaSaude => 'Finanční zdraví';

  @override
  String get notaExcelente => 'Výborně! Máte skvělé finanční zdraví.';

  @override
  String get notaBom => 'Dobré, ale může se zlepšit.';

  @override
  String get notaAtencao => 'Pozor na utrácení.';

  @override
  String get notaRevisar => 'Zkontrolujte své finance.';

  @override
  String get mentorInsightTitle => 'Vedení mentora';

  @override
  String get mentorInsightLoading => 'Načítání údajů o trhu…';

  @override
  String get mentorInsightError =>
      'Momentálně nelze načíst data. Zkuste to za chvíli znovu.';

  @override
  String get mentorInsightOffline =>
      'Jste offline. Připojte se k načítání nabídek a statistik mentorů.';

  @override
  String get mentorAllocationDefensive =>
      'Vzhledem k současné volatilitě upřednostněte ochranu kapitálu a likviditu před honbou za výnosy.';

  @override
  String get mentorAllocationBalanced =>
      'Vyvážení ochrany a růstu: diverzifikujte a přehodnoťte svůj horizont cílů.';

  @override
  String get mentorAllocationOffensive =>
      'Váš profil umožňuje větší riziko: zůstaňte disciplinovaní a vyhněte se těžké koncentraci.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Zkontrolované symboly: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automaticky (jazyk)';

  @override
  String get compoundCalculatorTitle => 'Mentor Calculator — Složené úročení';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulujte příspěvky, nominální vs skutečný zisk (po inflaci) a poznámky mentora.';

  @override
  String get compoundInitialLabel => 'Počáteční paušální částka';

  @override
  String get compoundMonthlyLabel => 'Měsíční příspěvek';

  @override
  String get compoundRateLabel => 'Úroková sazba';

  @override
  String get compoundRateAnnual => 'za rok';

  @override
  String get compoundRateMonthly => 'za měsíc';

  @override
  String get compoundHorizonLabel => 'Časový horizont';

  @override
  String get compoundHorizonYears => 'let';

  @override
  String get compoundHorizonMonths => 'měsíců';

  @override
  String get compoundInflationLabel => 'Odhadovaná inflace (% ročně)';

  @override
  String get compoundCalculate => 'Vypočítejte';

  @override
  String get compoundChartInvested => 'Celkem investováno';

  @override
  String get compoundChartInterest => 'Získaný úrok';

  @override
  String get compoundSummaryNominalEnd => 'Konečný zůstatek (nominální)';

  @override
  String get compoundSummaryRealGain => 'Skutečný zisk (kupní síla)';

  @override
  String get compoundMentorCardTitle => 'Poradenství mentora';

  @override
  String get compoundInvalidInput => 'Zadejte platné hodnoty (horizont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentorský tón';

  @override
  String get userPersonaNovice => 'Začátečník';

  @override
  String get userPersonaStrategist => 'Stratég';

  @override
  String get userPersonaRiskTaker => 'Riskant';

  @override
  String get userPersonaConservative => 'Spořič';

  @override
  String get compoundOpenFullInsight => 'Otevřete úplný náhled mentora';

  @override
  String get investFirstSteps_title => 'První kroky';

  @override
  String get investFirstSteps_brokerTitle => 'Vyberte si makléře';

  @override
  String get investFirstSteps_brokerBody =>
      'Hledejte regulované, renomované instituce. Před otevřením účtu porovnejte poplatky, produkty a spolehlivost.';

  @override
  String get investFirstSteps_openAccountTitle => 'Otevřete si účet';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitální onboarding. V Brazílii obvykle potřebujete CPF/RG a někdy i doklad o adrese.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digitální onboarding se v jednotlivých zemích liší. Obvykle potřebujete doklad totožnosti a ověření identity/adresy.';

  @override
  String get investFirstSteps_transferTitle => 'Převod prostředků';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Pošlete peníze prostřednictvím PIX nebo bankovním převodem svému brokerovi. Zůstatek bude k dispozici pro investování.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Převod prostředků bankovním převodem nebo místními platebními metodami (závisí na vaší zemi). Zůstatek bude k dispozici pro investování.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Poznejte svůj rizikový profil';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Odpovězte na dotazník vhodnosti. Uvědomte si, zda jste konzervativní, umírněný nebo agresivní.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Kupte si své první aktivum';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Začněte s nouzovým fondem (Tesouro Selic nebo CDB s denní likviditou). Pak postupně diverzifikujte.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Začněte s nouzovým fondem (hotovost s vysokým výnosem, fondy peněžního trhu nebo krátkodobé státní dluhopisy). Pak postupně diverzifikujte.';

  @override
  String get investFirstSteps_tipTitle => 'Tip mentora:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Začněte v malém, investujte důsledně a vyhněte se snaze načasovat trh. Čas je váš nejlepší spojenec.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Začněte v malém, investujte důsledně a vyhněte se snaze načasovat trh. Čas je váš nejlepší spojenec.';

  @override
  String get investMenu_tesouroTitle => 'Brazilské státní pokladny';

  @override
  String get investMenu_cdbTitle =>
      'Banka s pevným výnosem (CDB)\nMezinárodní ETF';

  @override
  String get investMenu_etfsTitle => '';

  @override
  String get investMenu_sp500Title => 'S&P 500 (index)';

  @override
  String get investMenu_stocksTitle => 'Zásoby\nFondy';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'mezinárodní';

  @override
  String get investMenu_cryptoTitle => 'Krypto';

  @override
  String get investRegisterCta => 'Registrovat investici';

  @override
  String investRegionHintBr(String country) {
    return 'Platná země: $country · Brazilský katalog (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Platná země: $country · Globální katalog (ETF, NYSE/NASDAQ…). Automaticky upraveno z oblasti vašeho zařízení.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Základní strategie';

  @override
  String get strategy_sectionDeepDiveTitle => 'Hluboký ponor (prémiový)';

  @override
  String get strategy_emergencyFundTitle => 'Pohotovostní fond';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Váš finanční štít. Pokryjte náklady za 6–12 měsíců. Upřednostněte denní likviditu a nízké riziko (např. Tesouro Selic nebo CDB vázané na CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Váš finanční štít. Pokryjte náklady za 6–12 měsíců. Upřednostněte denní likviditu a nízké riziko (např. fondy peněžního trhu a krátkodobé státní dluhopisy).';

  @override
  String get strategy_buyHoldTitle => 'Koupit a držet';

  @override
  String get strategy_buyHoldBody =>
      'Kupujte kvalitní aktiva a držte je dlouhodobě. Zaměřte se na disciplínu, kvalitu a reinvestice v průběhu času.';

  @override
  String get strategy_diversificationTitle => 'Diverzifikace';

  @override
  String get strategy_diversificationBodyBr =>
      'Rozložte svůj kapitál mezi pevný příjem, akcie, FII a mezinárodní aktiva, abyste snížili riziko a zlepšili výnosy upravené o riziko.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Rozložte svůj kapitál mezi dluhopisy, akcie, REIT a mezinárodní expozici, abyste snížili riziko a zlepšili výnosy upravené o riziko.';

  @override
  String get strategy_dcaTitle => 'Průměrování nákladů v dolarech (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konzistence překonává génia. Investování každý měsíc je často efektivnější než snažit se vybrat perfektní vstupní bod.';

  @override
  String get strategy_smartGoalsTitle => 'SMART cíle';

  @override
  String get strategy_smartGoalsBody =>
      'Vaše cíle by měly být konkrétní, měřitelné, dosažitelné, relevantní a časově ohraničené.\nPravidlo';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Jednoduchý rozpočtový rámec: 50 % potřeby, 30 % přání, 20 % investice a cíle.';

  @override
  String get strategy_deepDive_allocationTitle => 'Alokace aktiv (pokročilé)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Naučte se, jak vytvořit alokaci podle cíle a horizontu, upravit riziko, korelaci a opětovné vyvážení.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globální ETF a indexy (pokročilé)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Zjistěte více o globálních indexech (např. S&P 500), ETF a o tom, jak disciplinovaně budovat mezinárodní expozici.';

  @override
  String get strategy_deepDive_taxesTitle => 'Daně a výkaznictví (pokročilé)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Pochopte základní daňové koncepty a jak vést záznamy pro bezpečné vykazování investic.';

  @override
  String get strategy_premiumLockedBody =>
      'Prémiový obsah. Aktivujte téma Cyber/Grimm/Hive a odemkněte investiční Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Vitrína';

  @override
  String get homeShowcaseProfileSimTitle => 'Kvíz rizikového profilu';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Najděte svůj profil investora během několika minut.';

  @override
  String get homeShowcaseStrategiesTitle => 'Doporučené strategie';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Přímé zkratky pro učení a aplikaci strategií.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Kvízy a strategie';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Rychlý přístup ke kvízu rizikového profilu a doporučeným strategiím.';

  @override
  String get homeTourStepClassicTitle => 'Klasický režim';

  @override
  String get homeTourStepClassicBody =>
      'Otevře původní panel aplikace: transakce, cíle, investice a nastavení ve známém rozložení.';

  @override
  String get homeTourStepVitrineTitle => 'Vitrína';

  @override
  String get homeTourStepVitrineBody =>
      'Zkratky k učení a procvičování: profil investora, strategie a centrum Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Profilový kvíz';

  @override
  String get homeTourStepProfileBody =>
      'Odpovězte na dotazník a zjistěte svůj rizikový profil a prohlédněte si související návrhy.\nStrategie';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Uspořádejte si finance, disciplinovaně investujte a vyhněte se běžným nástrahám.\nNáboj Mentor';

  @override
  String get homeTourStepHubTitle => '';

  @override
  String get homeTourStepHubBody =>
      'Rychlé menu k profilovému kvízu a doporučeným strategiím.';

  @override
  String get homeTourStepPremiumTitle => 'Prémiové funkce';

  @override
  String get homeTourStepPremiumBody =>
      'Automatické mentoring, pokročilé grafy a měsíční zprávy – dostupné s předplatným Premium.';

  @override
  String get homeTourStepMarketTitle => 'Snímek trhu';

  @override
  String get homeTourStepMarketBody =>
      'Kontext trhu (Brazílie nebo globální) na základě vašeho regionu a převedeného čistého jmění.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor kalkulačka';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulujte složený úrok, inflaci a podívejte se na graf bohatství; dále otevřeme tento nástroj.';

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
  String get quizProfile_idealInvestmentsTitle => 'IDEÁLNÍ INVESTICE:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'PROZKOUMEJTE INVESTICE';

  @override
  String get quizProfile_exit => 'VÝSTUP';

  @override
  String get quizKnowledge_title => 'Vědomostní kvíz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Otázka $current z $total';
  }
}

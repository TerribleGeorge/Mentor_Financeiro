// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Stanje';

  @override
  String get gastosDiarios => 'Dnevni stroški';

  @override
  String get confirmarTransacao => 'Potrdite transakcijo\nIzjava';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Prenosi';

  @override
  String get investimentos => 'Naložbe';

  @override
  String get configuracoes => 'Nastavitve\nProfil';

  @override
  String get perfil => '';

  @override
  String get sair => 'Odjava';

  @override
  String get entrar => 'Prijava';

  @override
  String get cadastrar => 'Registracija';

  @override
  String get email => 'E-pošta\nGeslo';

  @override
  String get senha => '';

  @override
  String get nome => 'Ime\nID številka';

  @override
  String get cpf => '';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Nadaljuj';

  @override
  String get voltar => 'Nazaj';

  @override
  String get cancelar => 'Prekliči';

  @override
  String get salvar => 'Shrani';

  @override
  String get editar => 'Uredi';

  @override
  String get excluir => 'Izbriši';

  @override
  String get sucesso => 'Uspeh';

  @override
  String get erro => 'Napaka';

  @override
  String get carregando => 'Nalaganje ...';

  @override
  String get semDados => 'Ni podatkov';

  @override
  String get tentarNovamente => 'Poskusite znova';

  @override
  String get relatorios => 'Poročila';

  @override
  String get gastosPorCategoria => 'Stroški po kategoriji';

  @override
  String get ultimosSeteDias => 'Zadnjih 7 dni';

  @override
  String get totalGasto => 'Skupna poraba';

  @override
  String get transacoes => 'Transakcije';

  @override
  String get categoria => 'Kategorija';

  @override
  String get data => 'Datum';

  @override
  String get valor => 'Vrednost';

  @override
  String get descricao => 'Opis';

  @override
  String get alimentacao => 'Hrana';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Prosti čas';

  @override
  String get saude => 'Zdravje';

  @override
  String get outros => 'Drugo';

  @override
  String get notificacoes => 'Obvestila';

  @override
  String get permissaoNotificacoes => 'dovoljenje za obvestilo';

  @override
  String get ativarMonitoramento => 'Omogoči spremljanje stroškov';

  @override
  String get descricaoMonitoramento =>
      'Dovolite aplikaciji, da samodejno spremlja vaše bančne transakcije za organiziranje vaših financ.';

  @override
  String get idioma => 'Jezik';

  @override
  String get moeda => 'Valuta';

  @override
  String get compararInvestimentos => 'Primerjaj naložbe';

  @override
  String get descricaoLocalizacao =>
      'Za primerjavo lokalnih naložb (CDB/CDI) z mednarodnimi tečaji potrebujemo vašo lokacijo.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Potrebno dovoljenje za lokacijo';

  @override
  String get rendaFixa => 's stalnim dohodkom';

  @override
  String get rendaVariavel => 'spremenljivi dohodek';

  @override
  String get tesouroDireto => 'Neposredno zakladništvo';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Delnice';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kriptovalute';

  @override
  String get rendimento => 'Vrnitev';

  @override
  String get rentabilidade => 'Dobičkonosnost';

  @override
  String get aplicar => 'Prijavite se';

  @override
  String get resgatar => 'Odkupi';

  @override
  String get simular => 'Simulacija';

  @override
  String get metas => 'Cilji';

  @override
  String get estrategias => 'Strategije';

  @override
  String get conhecimento => 'Znanje';

  @override
  String get chat => 'Klepet';

  @override
  String get enviarMensagem => 'Pošlji sporočilo';

  @override
  String get digiteMensagem => 'Vnesite sporočilo ...';

  @override
  String get alertaGastos => 'Opozorilo o porabi';

  @override
  String alertaGastosMsg(int percent) {
    return 'Porabili ste že $percent % svojega kreditnega limita.';
  }

  @override
  String get fechamentoFatura => 'Zaključek računa';

  @override
  String get fechamentoFaturaMsg =>
      'Jutri je konec. Odličen čas za pregled stroškov.';

  @override
  String get faturaVencendo => 'Račun zapade';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Račun zapade v $dias dneh. Preverite stanje.';
  }

  @override
  String get regra30 => 'Nasvet: pravilo 30 %';

  @override
  String get regra30Msg =>
      'Ohranite uporabo pod 30 %, da izboljšate svoj kreditni rezultat.';

  @override
  String get diaDeOuro => 'Zlati dan!';

  @override
  String get diaDeOuroMsg =>
      'Vaši današnji nakupi bodo plačani šele v 40 dneh!';

  @override
  String get alertaJuros => 'Opozorilo: Obresti';

  @override
  String get alertaJurosMsg =>
      'Vaše stanje ne pokriva računa. Izognite se revolving kreditu!';

  @override
  String get notaSaude => 'Finančno zdravje';

  @override
  String get notaExcelente => 'Odlično! Imate odlično finančno zdravje.';

  @override
  String get notaBom => 'Dobro, vendar se lahko izboljša.';

  @override
  String get notaAtencao => 'Pozor pri porabi.';

  @override
  String get notaRevisar => 'Preglejte svoje finance.';

  @override
  String get mentorInsightTitle => 'Vodenje mentorja';

  @override
  String get mentorInsightLoading => 'Pridobivanje tržnih podatkov ...';

  @override
  String get mentorInsightError =>
      'Podatkov trenutno ni bilo mogoče naložiti. Kmalu poskusite znova.';

  @override
  String get mentorInsightOffline =>
      'Nisi povezan. Povežite se za pridobivanje ponudb in vpogledov mentorjev.';

  @override
  String get mentorAllocationDefensive =>
      'Glede na trenutno nestanovitnost dajte prednost ohranjanju kapitala in likvidnosti, preden lovite donose.';

  @override
  String get mentorAllocationBalanced =>
      'Ravnovesje zaščite in rasti: diverzificirajte in ponovno obiščite svoje ciljno obzorje.';

  @override
  String get mentorAllocationOffensive =>
      'Vaš profil dopušča več tveganja: ostanite disciplinirani in se izogibajte veliki koncentraciji.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Pregledani simboli: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Samodejno (jezik)';

  @override
  String get compoundCalculatorTitle => 'Mentor Kalkulator — Obrestne obresti';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulirajte prispevke, nominalni dobiček v primerjavi z realnim (po inflaciji) in opombe mentorja.';

  @override
  String get compoundInitialLabel => 'Začetni pavšalni znesek';

  @override
  String get compoundMonthlyLabel => 'Mesečni prispevek';

  @override
  String get compoundRateLabel => 'Obrestna mera';

  @override
  String get compoundRateAnnual => 'na leto';

  @override
  String get compoundRateMonthly => 'na mesec';

  @override
  String get compoundHorizonLabel => 'Časovni horizont';

  @override
  String get compoundHorizonYears => 'let';

  @override
  String get compoundHorizonMonths => 'mesecev';

  @override
  String get compoundInflationLabel => 'Ocenjena inflacija (% na leto)';

  @override
  String get compoundCalculate => 'Izračunaj';

  @override
  String get compoundChartInvested => 'Skupna naložba';

  @override
  String get compoundChartInterest => 'Zaslužene obresti';

  @override
  String get compoundSummaryNominalEnd => 'Končno stanje (nominalno)';

  @override
  String get compoundSummaryRealGain => 'Realni dobiček (kupna moč)';

  @override
  String get compoundMentorCardTitle => 'Nasvet mentorja';

  @override
  String get compoundInvalidInput =>
      'Vnesite veljavne vrednosti (horizont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentorski ton';

  @override
  String get userPersonaNovice => 'Začetnik';

  @override
  String get userPersonaStrategist => 'Strateg';

  @override
  String get userPersonaRiskTaker => 'Tvegalec\nVarčevalec';

  @override
  String get userPersonaConservative => '';

  @override
  String get compoundOpenFullInsight => 'Odpri polni mentorski vpogled';

  @override
  String get investFirstSteps_title => 'Prvi koraki';

  @override
  String get investFirstSteps_brokerTitle => 'Izberite posrednika';

  @override
  String get investFirstSteps_brokerBody =>
      'Poiščite regulirane, ugledne ustanove. Primerjajte provizije, izdelke in zanesljivost, preden odprete račun.';

  @override
  String get investFirstSteps_openAccountTitle => 'Odprite svoj račun';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitalno vkrcanje. V Braziliji običajno potrebujete CPF/RG in včasih dokazilo o naslovu.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digitalna vključitev se razlikuje glede na državo. Običajno potrebujete osebni dokument in potrditev identitete/naslova.';

  @override
  String get investFirstSteps_transferTitle => 'Prenesite sredstva';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Pošljite denar prek PIX ali bančnega nakazila svojemu posredniku. Stanje postane na voljo za naložbo.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Prenesite sredstva prek bančnega nakazila ali lokalnih načinov plačila (odvisno od vaše države). Stanje postane na voljo za naložbo.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Spoznajte svoj profil tveganja';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Odgovorite na vprašalnik o primernosti. Ugotovite, ali ste konzervativni, zmerni ali agresivni.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Kupite svoje prvo sredstvo';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Začnite s skladom za nujne primere (Tesouro Selic ali CDB z dnevno likvidnostjo). Nato postopoma diverzificirajte.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Začnite s skladom za nujne primere (gotovina z visokim donosom, skladi denarnega trga ali kratkoročne državne obveznice). Nato postopoma diverzificirajte.';

  @override
  String get investFirstSteps_tipTitle => 'Mentorski nasvet:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Začnite z majhnim, vlagajte dosledno in se izogibajte časovnemu določanju trga. Čas je vaš najboljši zaveznik.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Začnite z majhnim, vlagajte dosledno in se izogibajte časovnemu določanju trga. Čas je vaš najboljši zaveznik.';

  @override
  String get investMenu_tesouroTitle => 'Brazilske zakladnice';

  @override
  String get investMenu_cdbTitle => 'Banka s stalnim donosom (CDB)';

  @override
  String get investMenu_etfsTitle => 'Mednarodni ETF-ji';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'Delnice\nSredstva';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Mednarodno';

  @override
  String get investMenu_cryptoTitle => 'Kripto';

  @override
  String get investRegisterCta => 'Registriraj naložbo';

  @override
  String investRegionHintBr(String country) {
    return 'Veljavna država: $country · Brazilski katalog (zakladnice, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Veljavna država: $country · Globalni katalog (ETF-ji, NYSE/NASDAQ…). Samodejno prilagojeno glede na regijo vaše naprave.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Bistvene strategije';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Sklad za nujne primere';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Vaš finančni ščit. Pokrijte 6–12 mesečne stroške. Dajte prednost dnevni likvidnosti in nizkemu tveganju (npr. Tesouro Selic ali CDB, povezana s CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Vaš finančni ščit. Pokrijte 6–12 mesečne stroške. Dajte prednost dnevni likvidnosti in nizkemu tveganju (npr. skladi denarnega trga in kratkoročne državne obveznice).';

  @override
  String get strategy_buyHoldTitle => 'Kupi in drži';

  @override
  String get strategy_buyHoldBody =>
      'Kupite kakovostna sredstva in jih držite dolgoročno. Osredotočite se na disciplino, kakovost in ponovna vlaganja skozi čas.';

  @override
  String get strategy_diversificationTitle => 'Diverzifikacija';

  @override
  String get strategy_diversificationBodyBr =>
      'Razporedite svoj kapital med vrednostne papirje s stalnim dohodkom, delnice, FII in mednarodna sredstva, da zmanjšate tveganje in izboljšate tveganjem prilagojene donose.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Razporedite svoj kapital med obveznice, delnice, REIT-e in mednarodno izpostavljenost, da zmanjšate tveganje in izboljšate tveganjem prilagojene donose.';

  @override
  String get strategy_dcaTitle => 'Povprečenje stroškov v dolarjih (DCA)';

  @override
  String get strategy_dcaBody =>
      'Doslednost premaga genialnost. Vlaganje vsak mesec je pogosto učinkovitejše od izbire popolne vstopne točke.';

  @override
  String get strategy_smartGoalsTitle => 'SMART cilji';

  @override
  String get strategy_smartGoalsBody =>
      'Vaši cilji morajo biti specifični, merljivi, dosegljivi, ustrezni in časovno omejeni.';

  @override
  String get strategy_503020Title => 'pravilo 50-30-20';

  @override
  String get strategy_503020Body =>
      'Preprost proračunski okvir: 50 % potreb, 30 % želja, 20 % naložb in ciljev.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Dodelitev sredstev (napredno)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Naučite se zgraditi alokacijo glede na cilj in obzorje, prilagoditi tveganje, korelacijo in ponovno uravnoteženje.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globalni ETF-ji in indeksi (napredno)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Spoznajte globalne indekse (npr. S&P 500), ETF-je in kako z disciplino povečati mednarodno izpostavljenost.';

  @override
  String get strategy_deepDive_taxesTitle => 'Davki in poročanje (napredno)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Razumeti temeljne davčne koncepte in kako voditi evidenco za varno poročanje o naložbah.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium vsebina. Aktivirajte temo Cyber/Grimm/Hive, da odklenete naložbo Deep Dive.\nVitrina';

  @override
  String get homeShowcaseTitle => '';

  @override
  String get homeShowcaseProfileSimTitle => 'Kviz o profilu tveganja';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Poiščite svoj profil vlagatelja v nekaj minutah.';

  @override
  String get homeShowcaseStrategiesTitle => 'Priporočene strategije';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Neposredne bližnjice za učenje in uporabo strategij.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Kvizi in strategije';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Hiter dostop do kviza o profilu tveganja in priporočenih strategij.';

  @override
  String get homeTourStepClassicTitle => 'Klasični način';

  @override
  String get homeTourStepClassicBody =>
      'Odpre prvotno ploščo aplikacije: transakcije, cilji, naložbe in nastavitve v znani postavitvi.';

  @override
  String get homeTourStepVitrineTitle => 'Razstavno območje';

  @override
  String get homeTourStepVitrineBody =>
      'Bližnjice za učenje in prakso: profil vlagatelja, strategije in središče Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Kviz o profilu';

  @override
  String get homeTourStepProfileBody =>
      'Odgovorite na vprašalnik, da odkrijete svoj profil tveganja in si ogledate usklajene predloge.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategije';

  @override
  String get homeTourStepStrategiesBody =>
      'Vsebina za organiziranje financ, disciplinirano vlaganje in izogibanje pogostim pastem.';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody =>
      'Hitri meni za profilni kviz in priporočene strategije.';

  @override
  String get homeTourStepPremiumTitle => 'Premium funkcije';

  @override
  String get homeTourStepPremiumBody =>
      'Samodejno mentorstvo, napredni grafikoni in mesečna poročila — na voljo z naročnino Premium.';

  @override
  String get homeTourStepMarketTitle => 'Posnetek trga';

  @override
  String get homeTourStepMarketBody =>
      'Tržni kontekst (Brazilija ali globalno) na podlagi vaše regije plus preračunana neto vrednost.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentorski kalkulator';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulirajte obrestne obresti, inflacijo in si oglejte grafikon premoženja; nato odpremo to orodje.';

  @override
  String get quizProfile_title => 'Kviz o profilu tveganja';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Vprašanje $current od $total';
  }

  @override
  String get quizProfile_badge => 'KVIZ PROFIL TVEGANJA';

  @override
  String get quizProfile_resultTitle => 'VAŠ PROFIL JE';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALNE NALOŽBE:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'RAZIŠČITE NALOŽBE';

  @override
  String get quizProfile_exit => 'IZHOD';

  @override
  String get quizKnowledge_title => 'Kviz znanja';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Vprašanje $current od $total';
  }
}

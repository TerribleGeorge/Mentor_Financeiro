// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Tasapaino';

  @override
  String get gastosDiarios => 'Päivittäiset kulut';

  @override
  String get confirmarTransacao => 'Vahvista tapahtuma';

  @override
  String get extrato => 'Lausunto';

  @override
  String get transferencias => 'Siirrot';

  @override
  String get investimentos => 'Investoinnit';

  @override
  String get configuracoes => 'Asetukset';

  @override
  String get perfil => 'Profiili';

  @override
  String get sair => 'Kirjaudu ulos';

  @override
  String get entrar => 'Kirjaudu sisään';

  @override
  String get cadastrar => 'Rekisteröidy';

  @override
  String get email => 'Sähköposti';

  @override
  String get senha => 'Salasana';

  @override
  String get nome => 'Nimi';

  @override
  String get cpf => 'ID-numero';

  @override
  String get telefone => 'Puhelin';

  @override
  String get continuar => 'Jatka';

  @override
  String get voltar => 'Takaosa';

  @override
  String get cancelar => 'Peruuta';

  @override
  String get salvar => 'Säästä';

  @override
  String get editar => 'Muokkaa';

  @override
  String get excluir => 'Poista';

  @override
  String get sucesso => 'Menestys';

  @override
  String get erro => 'Virhe';

  @override
  String get carregando => 'Ladataan...';

  @override
  String get semDados => 'Ei tietoja';

  @override
  String get tentarNovamente => 'Yritä uudelleen';

  @override
  String get relatorios => 'Reports';

  @override
  String get gastosPorCategoria => 'Kulut luokittain';

  @override
  String get ultimosSeteDias => 'Viimeiset 7 päivää';

  @override
  String get totalGasto => 'Kokonaiskulutus';

  @override
  String get transacoes => 'Tapahtumat';

  @override
  String get categoria => 'Luokka';

  @override
  String get data => 'Päivämäärä';

  @override
  String get valor => 'Arvo';

  @override
  String get descricao => 'Kuvaus';

  @override
  String get alimentacao => 'Ruoka';

  @override
  String get transporte => 'Kuljetus';

  @override
  String get lazer => 'Vapaa-aika';

  @override
  String get saude => 'Terveys';

  @override
  String get outros => 'Muut';

  @override
  String get notificacoes => 'Ilmoitukset';

  @override
  String get permissaoNotificacoes => 'Ilmoituslupa';

  @override
  String get ativarMonitoramento => 'Ota kulujen valvonta käyttöön';

  @override
  String get descricaoMonitoramento =>
      'Anna sovelluksen seurata automaattisesti pankkitapahtumiasi talouden järjestämiseksi.';

  @override
  String get idioma => 'Kieli';

  @override
  String get moeda => 'Valuutta';

  @override
  String get compararInvestimentos => 'Vertaile sijoituksia';

  @override
  String get descricaoLocalizacao =>
      'Vertaaksemme paikallisia sijoituksia (CDB/CDI) kansainvälisiin hintoihin, tarvitsemme sijaintisi.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Paikkalupa vaaditaan';

  @override
  String get rendaFixa => 'Korkotulo';

  @override
  String get rendaVariavel => 'Muuttuva tulo';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Osakkeet';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kryptovaluutat';

  @override
  String get rendimento => 'Palautus';

  @override
  String get rentabilidade => 'Kannattavuus';

  @override
  String get aplicar => 'Hae';

  @override
  String get resgatar => 'Lunasta';

  @override
  String get simular => 'Simuloi';

  @override
  String get metas => 'Maalit';

  @override
  String get estrategias => 'Strategiat';

  @override
  String get conhecimento => 'Tieto';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Lähetä viesti';

  @override
  String get digiteMensagem => 'Kirjoita viesti...';

  @override
  String get alertaGastos => 'Kulutusvaroitus';

  @override
  String alertaGastosMsg(int percent) {
    return 'Olet jo käyttänyt $percent % luottorajastasi.';
  }

  @override
  String get fechamentoFatura => 'Laskun sulkeminen';

  @override
  String get fechamentoFaturaMsg =>
      'Huomenna on sulkemispäivä. Hyvä aika arvioida kulut.';

  @override
  String get faturaVencendo => 'Laskun eräpäivä';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Lasku erääntyy $dias päivän kuluttua. Tarkista saldosi.';
  }

  @override
  String get regra30 => 'Vinkki: 30 %:n sääntö';

  @override
  String get regra30Msg =>
      'Pidä käyttö alle 30 % parantaaksesi luottopisteitäsi.';

  @override
  String get diaDeOuro => 'Kultainen päivä!';

  @override
  String get diaDeOuroMsg =>
      'Tämän päivän ostoksesi maksetaan vain 40 päivässä!';

  @override
  String get alertaJuros => 'Varoitus: Kiinnostus';

  @override
  String get alertaJurosMsg =>
      'Saldosi ei kata laskua. Vältä uusiutuvaa luottoa!';

  @override
  String get notaSaude => 'Taloudellinen terveys';

  @override
  String get notaExcelente => 'Loistavaa! Sinulla on hyvä taloudellinen kunto.';

  @override
  String get notaBom => 'Hyvä, mutta voi parantaa.';

  @override
  String get notaAtencao => 'Huomio kulutukseen.';

  @override
  String get notaRevisar => 'Tarkista taloutesi.';

  @override
  String get mentorInsightTitle => 'Mentorin opastus';

  @override
  String get mentorInsightLoading => 'Haetaan markkinatietoja…';

  @override
  String get mentorInsightError =>
      'Tietoja ei voitu ladata juuri nyt. Yritä hetken kuluttua uudelleen.';

  @override
  String get mentorInsightOffline =>
      'Olet offline-tilassa. Ota yhteyttä hakeaksesi lainauksia ja mentorin oivalluksia.';

  @override
  String get mentorAllocationDefensive =>
      'Kun otetaan huomioon nykyinen volatiliteetti, aseta pääoman säilyttäminen ja likviditeetti etusijalle ennen kuin haet tuottoa.';

  @override
  String get mentorAllocationBalanced =>
      'Tasapainoinen suoja ja kasvu: monipuolista ja käy uudelleen tavoitehorisonttiasi.';

  @override
  String get mentorAllocationOffensive =>
      'Profiilisi sallii enemmän riskejä: pysy kurina ja vältä voimakasta keskittymistä.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Tarkistetut symbolit: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automaattinen (kieli)';

  @override
  String get compoundCalculatorTitle => 'Mentorilaskin — Korkokorko';

  @override
  String get compoundCalculatorSubtitle =>
      'Simuloi lahjoituksia, nimellistä ja todellista voittoa (inflaation jälkeen) ja mentorin muistiinpanoja.';

  @override
  String get compoundInitialLabel => 'Ensimmäinen kertakorvaus';

  @override
  String get compoundMonthlyLabel => 'Kuukausimaksu';

  @override
  String get compoundRateLabel => 'Korko';

  @override
  String get compoundRateAnnual => 'vuodessa';

  @override
  String get compoundRateMonthly => 'kuukaudessa';

  @override
  String get compoundHorizonLabel => 'Aikahorisontti';

  @override
  String get compoundHorizonYears => 'vuotta';

  @override
  String get compoundHorizonMonths => 'kuukautta';

  @override
  String get compoundInflationLabel => 'Arvioitu inflaatio (% vuodessa)';

  @override
  String get compoundCalculate => 'Laske';

  @override
  String get compoundChartInvested => 'Investoitu yhteensä';

  @override
  String get compoundChartInterest => 'Ansaittu korko';

  @override
  String get compoundSummaryNominalEnd => 'Loppusaldo (nimellinen)';

  @override
  String get compoundSummaryRealGain => 'Todellinen voitto (ostovoima)';

  @override
  String get compoundMentorCardTitle => 'Mentorin neuvoja';

  @override
  String get compoundInvalidInput =>
      'Syötä kelvolliset arvot (horisontti > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentorisävy';

  @override
  String get userPersonaNovice => 'Aloittelija';

  @override
  String get userPersonaStrategist => 'Strategi';

  @override
  String get userPersonaRiskTaker => 'Riskinotto';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Avaa täydellinen mentorin näkemys';

  @override
  String get investFirstSteps_title => 'Ensimmäiset askeleet';

  @override
  String get investFirstSteps_brokerTitle => 'Valitse välittäjä';

  @override
  String get investFirstSteps_brokerBody =>
      'Etsi säänneltyjä, hyvämaineisia laitoksia. Vertaa maksuja, tuotteita ja luotettavuutta ennen tilin avaamista.';

  @override
  String get investFirstSteps_openAccountTitle => 'Avaa tilisi';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitaalinen käyttöönotto. Brasiliassa tarvitset yleensä CPF/RG:n ja joskus todisteen osoitteesta.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digitaalinen käyttöönotto vaihtelee maittain. Yleensä tarvitset henkilöllisyystodistuksen ja henkilöllisyyden/osoitteen vahvistuksen.';

  @override
  String get investFirstSteps_transferTitle => 'Siirrä varoja';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Lähetä rahaa PIX:n kautta tai pankkisiirrolla välittäjällesi. Saldo tulee sijoitettavaksi.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Siirrä varoja pankkisiirrolla tai paikallisilla maksutavoilla (riippuen maastasi). Saldo tulee sijoitettavaksi.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Tunne riskiprofiilisi';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Vastaa soveltuvuuskyselyyn. Ymmärrä, oletko konservatiivinen, maltillinen vai aggressiivinen.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Osta ensimmäinen omaisuus';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Aloita hätärahastolla (Tesouro Selic tai päivittäisen likviditeetin CDB). Monipuolista sitten vähitellen.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Aloita hätärahastolla (korkeatuottoinen käteinen, rahamarkkinarahastot tai lyhytaikaiset valtion joukkovelkakirjat). Monipuolista sitten vähitellen.';

  @override
  String get investFirstSteps_tipTitle => 'Mentorin vinkki:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Aloita pienestä, sijoita johdonmukaisesti äläkä yritä ajoittaa markkinoita. Aika on paras liittolaisesi.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Aloita pienestä, sijoita johdonmukaisesti äläkä yritä ajoittaa markkinoita. Aika on paras liittolaisesi.';

  @override
  String get investMenu_tesouroTitle => 'Brasilian valtionkassat';

  @override
  String get investMenu_cdbTitle => 'Pankin kiinteätuotto (CDB)';

  @override
  String get investMenu_etfsTitle => 'kansainväliset ETF:t';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeksi)';

  @override
  String get investMenu_stocksTitle => 'Osakkeet';

  @override
  String get investMenu_fundsTitle => 'Rahastot';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'kansainvälinen';

  @override
  String get investMenu_cryptoTitle => 'Krypto';

  @override
  String get investRegisterCta => 'Rekisteröi sijoitus';

  @override
  String investRegionHintBr(String country) {
    return 'Voimassa oleva maa: $country · Brasilian luettelo (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Voimassa maa: $country · Maailmanlaajuinen luettelo (ETF, NYSE/NASDAQ…). Automaattisesti säädetty laitteesi alueelta.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Keskeiset strategiat';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Hätärahasto';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Taloudellinen suojasi. Kattaa 6-12 kuukauden kulut. Priorisoi päivittäinen likviditeetti ja alhainen riski (esim. Tesouro Selic tai CDI-sidottu CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Taloudellinen suojasi. Kattaa 6-12 kuukauden kulut. Priorisoi päivittäinen likviditeetti ja alhainen riski (esim. rahamarkkinarahastot ja lyhytaikaiset valtion joukkovelkakirjat).';

  @override
  String get strategy_buyHoldTitle => 'Osta ja pidä';

  @override
  String get strategy_buyHoldBody =>
      'Osta laadukasta omaisuutta ja säilytä se pitkällä aikavälillä. Keskity kurinalaisuuteen, laatuun ja uudelleensijoittamiseen ajan myötä.';

  @override
  String get strategy_diversificationTitle => 'Monipuolisuus';

  @override
  String get strategy_diversificationBodyBr =>
      'Hajauttamalla pääomasi korkotuottoihin, osakkeisiin, ulkomaansijoituksiin ja kansainvälisiin omaisuuseriin vähentääksesi riskejä ja parantaaksesi riskikorjattua tuottoa.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Jaa pääomasi joukkovelkakirjalainoihin, osakkeisiin, REIT-rahastoihin ja kansainväliseen riskiin vähentääksesi riskejä ja parantaaksesi riskikorjattua tuottoa.';

  @override
  String get strategy_dcaTitle => 'Dollarin kustannusten keskiarvo (DCA)';

  @override
  String get strategy_dcaBody =>
      'Johdonmukaisuus voittaa nerouden. Joka kuukausi sijoittaminen on usein tehokkaampaa kuin yrittää valita täydellinen aloituskohta.';

  @override
  String get strategy_smartGoalsTitle => 'SMART maalit';

  @override
  String get strategy_smartGoalsBody =>
      'Tavoitteidesi tulee olla tarkkoja, mitattavissa olevia, saavutettavissa olevia, relevantteja ja määräaikaisia.';

  @override
  String get strategy_503020Title => '50-30-20 sääntö';

  @override
  String get strategy_503020Body =>
      'Yksinkertainen budjetointikehys: 50 % tarpeita, 30 % toiveita, 20 % investointeja ja tavoitteita.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Omaisuuden allokointi (edistynyt)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Opi rakentamaan allokaatio tavoitteen ja horisontin mukaan, säätämään riskiä, korrelaatiota ja tasapainottamista.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globaalit ETF:t ja indeksit (edistynyt)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Opi globaaleista indekseistä (esim. S&P 500), ETF:istä ja kansainvälisen näkyvyyden rakentamisesta kurinalaisesti.';

  @override
  String get strategy_deepDive_taxesTitle => 'Verot ja raportointi (edistynyt)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Ymmärrä tärkeimmät verokäsitteet ja kuinka pitää kirjaa sijoituksista raportoimiseksi turvallisesti.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium-sisältö. Aktivoi Cyber/Grimm/Hive-teema avataksesi sijoitus Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Showcase';

  @override
  String get homeShowcaseProfileSimTitle => 'Riskiprofiilikysely';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Löydä sijoittajaprofiilisi muutamassa minuutissa.';

  @override
  String get homeShowcaseStrategiesTitle => 'Suositellut strategiat';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Suorat pikakuvakkeet strategioiden oppimiseen ja soveltamiseen.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentori: Tietovisat ja strategiat';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Nopea pääsy riskiprofiilikyselyyn ja suositeltuihin strategioihin.';

  @override
  String get homeTourStepClassicTitle => 'Klassinen tila';

  @override
  String get homeTourStepClassicBody =>
      'Avaa alkuperäisen sovelluspaneelin: tapahtumat, tavoitteet, sijoitukset ja asetukset tutussa asettelussa.';

  @override
  String get homeTourStepVitrineTitle => 'Vitriinin alue';

  @override
  String get homeTourStepVitrineBody =>
      'Oikotiet oppimiseen ja harjoitteluun: sijoittajaprofiili, strategiat ja Mentor-keskus.';

  @override
  String get homeTourStepProfileTitle => 'Profiilitietovisa';

  @override
  String get homeTourStepProfileBody =>
      'Vastaa kyselyyn löytääksesi riskiprofiilisi ja nähdäksesi yhdenmukaiset ehdotukset.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategiat';

  @override
  String get homeTourStepStrategiesBody =>
      'Sisältö talouden järjestämiseen, kurinalaiseen sijoittamiseen ja yleisten sudenkuoppien välttämiseen.';

  @override
  String get homeTourStepHubTitle => 'Mentor-keskitin';

  @override
  String get homeTourStepHubBody =>
      'Pikavalikko profiilikyselyyn ja suositeltuihin strategioihin.';

  @override
  String get homeTourStepPremiumTitle => 'Premium-ominaisuudet';

  @override
  String get homeTourStepPremiumBody =>
      'Automaattinen mentorointi, edistyneet kaaviot ja kuukausiraportit – saatavilla Premium-tilauksella.';

  @override
  String get homeTourStepMarketTitle => 'Markkinoiden tilannekuva';

  @override
  String get homeTourStepMarketBody =>
      'Markkinakonteksti (Brasilia tai maailmanlaajuinen) alueesi ja muunnetun nettovarallisuuden perusteella.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentorilaskin';

  @override
  String get homeTourStepCalculatorBody =>
      'Simuloi korkokorkoa, inflaatiota ja katso varallisuuskaaviota; seuraavaksi avaamme tämän työkalun.';

  @override
  String get quizProfile_title => 'Riskiprofiilikysely';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Kysymys $current/$total';
  }

  @override
  String get quizProfile_badge => 'RISKIPROFIILIN KYSY';

  @override
  String get quizProfile_resultTitle => 'PROFIILISI ON';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALIT SIJOITUKSET:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'TUTKI SIJOITUKSIIN';

  @override
  String get quizProfile_exit => 'POISTU';

  @override
  String get quizKnowledge_title => 'Tietovisa';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Kysymys $current/$total';
  }
}

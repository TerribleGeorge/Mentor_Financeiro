// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get appTitle => 'Mentor Finansies';

  @override
  String get saldo => 'Balans';

  @override
  String get gastosDiarios => 'Daaglikse uitgawes';

  @override
  String get confirmarTransacao => 'Bevestig transaksie';

  @override
  String get extrato => 'Verklaring';

  @override
  String get transferencias => 'Oordragte';

  @override
  String get investimentos => 'Beleggings';

  @override
  String get configuracoes => 'Instellings';

  @override
  String get perfil => 'profiel';

  @override
  String get sair => 'Teken uit';

  @override
  String get entrar => 'Teken in';

  @override
  String get cadastrar => 'Registreer';

  @override
  String get email => 'E-pos';

  @override
  String get senha => 'Wagwoord';

  @override
  String get nome => 'Naam';

  @override
  String get cpf => 'ID-nommer';

  @override
  String get telefone => 'foon';

  @override
  String get continuar => 'Gaan voort';

  @override
  String get voltar => 'Terug';

  @override
  String get cancelar => 'Kanselleer';

  @override
  String get salvar => 'Stoor';

  @override
  String get editar => 'Wysig';

  @override
  String get excluir => 'Vee uit';

  @override
  String get sucesso => 'Sukses';

  @override
  String get erro => 'Fout';

  @override
  String get carregando => 'Laai tans...';

  @override
  String get semDados => 'Geen data';

  @override
  String get tentarNovamente => 'Probeer weer';

  @override
  String get relatorios => 'Verslae';

  @override
  String get gastosPorCategoria => 'Uitgawes volgens kategorie';

  @override
  String get ultimosSeteDias => 'Laaste 7 dae';

  @override
  String get totalGasto => 'Totale bestee';

  @override
  String get transacoes => 'Transaksies';

  @override
  String get categoria => 'Kategorie';

  @override
  String get data => 'Datum';

  @override
  String get valor => 'Waarde';

  @override
  String get descricao => 'Beskrywing';

  @override
  String get alimentacao => 'Kos';

  @override
  String get transporte => 'Vervoer';

  @override
  String get lazer => 'Ontspanning';

  @override
  String get saude => 'Gesondheid';

  @override
  String get outros => 'Ander';

  @override
  String get notificacoes => 'Kennisgewings';

  @override
  String get permissaoNotificacoes => 'Kennisgewing toestemming';

  @override
  String get ativarMonitoramento => 'Aktiveer uitgawemonitering';

  @override
  String get descricaoMonitoramento =>
      'Laat die toepassing toe om jou banktransaksies outomaties te monitor om jou finansies te organiseer.';

  @override
  String get idioma => 'Taal';

  @override
  String get moeda => 'Geldeenheid';

  @override
  String get compararInvestimentos => 'Vergelyk Beleggings';

  @override
  String get descricaoLocalizacao =>
      'Om plaaslike beleggings (CDB/CDI) met internasionale tariewe te vergelyk, het ons jou ligging nodig.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Liggingtoestemming vereis';

  @override
  String get rendaFixa => 'Vaste inkomste';

  @override
  String get rendaVariavel => 'Veranderlike Inkomste';

  @override
  String get tesouroDireto => 'Tesourie Direkte';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Aandele';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Kriptogeldeenhede';

  @override
  String get rendimento => 'Terugkeer';

  @override
  String get rentabilidade => 'Winsgewendheid';

  @override
  String get aplicar => 'Dien toe';

  @override
  String get resgatar => 'Verlos';

  @override
  String get simular => 'Simuleer';

  @override
  String get metas => 'Doelwitte';

  @override
  String get estrategias => 'Strategieë';

  @override
  String get conhecimento => 'Kennis';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Stuur boodskap';

  @override
  String get digiteMensagem => 'Tik \'n boodskap...';

  @override
  String get alertaGastos => 'Spendeerwaarskuwing';

  @override
  String alertaGastosMsg(int percent) {
    return 'Jy het reeds $percent% van jou kredietlimiet gebruik.';
  }

  @override
  String get fechamentoFatura => 'Faktuursluiting';

  @override
  String get fechamentoFaturaMsg =>
      'Môre is sluitingsdag. Goeie tyd om uitgawes te hersien.';

  @override
  String get faturaVencendo => 'faktuur verskuldig';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Faktuur betaalbaar oor $dias dag(e). Gaan jou balans na.';
  }

  @override
  String get regra30 => 'Wenk: 30% reël';

  @override
  String get regra30Msg =>
      'Hou gebruik onder 30% om jou krediettelling te verbeter.';

  @override
  String get diaDeOuro => 'Goue Dag!';

  @override
  String get diaDeOuroMsg =>
      'Jou aankope vandag sal eers oor 40 dae betaal word!';

  @override
  String get alertaJuros => 'Waarskuwing: Rente';

  @override
  String get alertaJurosMsg =>
      'Jou saldo dek nie die rekening nie. Vermy wentelkrediet!';

  @override
  String get notaSaude => 'Finansiële Gesondheid';

  @override
  String get notaExcelente => 'Uitstekend! Jy het goeie finansiële gesondheid.';

  @override
  String get notaBom => 'Goed, maar kan verbeter.';

  @override
  String get notaAtencao => 'Aandag aan besteding.';

  @override
  String get notaRevisar => 'Hersien jou finansies.';

  @override
  String get mentorInsightTitle => 'Mentor leiding';

  @override
  String get mentorInsightLoading => 'Haal tans markdata …';

  @override
  String get mentorInsightError =>
      'Kon nie data op die oomblik laai nie. Probeer binnekort weer.';

  @override
  String get mentorInsightOffline =>
      'Jy is vanlyn. Koppel om aanhalings en mentor-insigte te gaan haal.';

  @override
  String get mentorAllocationDefensive =>
      'Gegewe huidige wisselvalligheid, prioritiseer kapitaalbewaring en likiditeit voordat jy opbrengste najaag.';

  @override
  String get mentorAllocationBalanced =>
      'Balanseer beskerming en groei: diversifiseer en hersien jou doelhorison.';

  @override
  String get mentorAllocationOffensive =>
      'Jou profiel laat meer risiko toe: bly gedissiplineerd en vermy swaar konsentrasie.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Simbole nagegaan: $symbols';
  }

  @override
  String get currencyFollowLocale => 'outomaties (taal)';

  @override
  String get compoundCalculatorTitle =>
      'Mentor Sakrekenaar — Saamgestelde Rente';

  @override
  String get compoundCalculatorSubtitle =>
      'Simuleer bydraes, nominale vs reële wins (na inflasie), en mentornotas.';

  @override
  String get compoundInitialLabel => 'Aanvanklike enkelbedrag';

  @override
  String get compoundMonthlyLabel => 'Maandelikse bydrae';

  @override
  String get compoundRateLabel => 'Rentekoers';

  @override
  String get compoundRateAnnual => 'per jaar';

  @override
  String get compoundRateMonthly => 'per maand';

  @override
  String get compoundHorizonLabel => 'Tydhorison';

  @override
  String get compoundHorizonYears => 'jaar';

  @override
  String get compoundHorizonMonths => 'maande';

  @override
  String get compoundInflationLabel => 'Geskatte inflasie (% per jaar)';

  @override
  String get compoundCalculate => 'Bereken';

  @override
  String get compoundChartInvested => 'Totaal belê';

  @override
  String get compoundChartInterest => 'Rente verdien';

  @override
  String get compoundSummaryNominalEnd => 'Eindsaldo (nominaal)';

  @override
  String get compoundSummaryRealGain => 'Werklike wins (koopkrag)';

  @override
  String get compoundMentorCardTitle => 'Mentor advies';

  @override
  String get compoundInvalidInput => 'Voer geldige waardes in (horison > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor toon';

  @override
  String get userPersonaNovice => 'Beginner';

  @override
  String get userPersonaStrategist => 'Strateeg';

  @override
  String get userPersonaRiskTaker => 'Risikonemer';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Open volledige mentor-insig';

  @override
  String get investFirstSteps_title => 'Eerste stappe';

  @override
  String get investFirstSteps_brokerTitle => 'Kies \'n makelaar';

  @override
  String get investFirstSteps_brokerBody =>
      'Soek gereguleerde, betroubare instellings. Vergelyk fooie, produkte en betroubaarheid voordat u \'n rekening oopmaak.';

  @override
  String get investFirstSteps_openAccountTitle => 'Maak jou rekening oop';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitale aanboord. In Brasilië benodig jy gewoonlik CPF/RG en soms \'n bewys van adres.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digitale aanboord wissel volgens land. Tipies benodig jy \'n ID-dokument en identiteit-/adresverifikasie.';

  @override
  String get investFirstSteps_transferTitle => 'Oordrag fondse';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Stuur geld via PIX of bankoorplasing na jou makelaar. Die balans word beskikbaar om te belê.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Dra fondse oor via bankoorplasing of plaaslike betaalmetodes (hang af van jou land). Die balans word beskikbaar om te belê.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Ken jou risikoprofiel';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Beantwoord \'n geskiktheidsvraelys. Verstaan ​​​​of jy konserwatief, matig of aggressief is.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Koop jou eerste bate';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Begin met \'n noodfonds (Tesouro Selic of \'n daaglikse-likiditeit-CDB). Diversifiseer dan geleidelik.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Begin met \'n noodfonds (hoë-opbrengs kontant, geldmarkfondse of korttermyn-tesourie-effekte). Diversifiseer dan geleidelik.';

  @override
  String get investFirstSteps_tipTitle => 'Mentorwenk:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Begin klein, belê konsekwent en vermy om te probeer om die mark te tyd. Tyd is jou beste bondgenoot.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Begin klein, belê konsekwent en vermy om te probeer om die mark te tyd. Tyd is jou beste bondgenoot.';

  @override
  String get investMenu_tesouroTitle => 'Brasiliaanse tesourie';

  @override
  String get investMenu_cdbTitle => 'Bank vaste inkomste (CDB)';

  @override
  String get investMenu_etfsTitle => 'Internasionale ETF\'s';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'Aandele';

  @override
  String get investMenu_fundsTitle => 'Fondse';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Internasionaal';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Registreer belegging';

  @override
  String investRegionHintBr(String country) {
    return 'Effektiewe land: $country · Brasilië-katalogus (Tesouries, CDB, LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Effektiewe land: $country · Globale katalogus (ETF\'s, NYSE/NASDAQ…). Outomaties aangepas vanaf jou toestelstreek.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Noodsaaklike strategieë';

  @override
  String get strategy_sectionDeepDiveTitle => 'Diepduik (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Noodfonds';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Jou finansiële skild. Dek 6–12 maande se uitgawes. Prioritiseer daaglikse likiditeit en lae risiko (bv. Tesouro Selic of CDI-gekoppelde CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Jou finansiële skild. Dek 6–12 maande se uitgawes. Prioritiseer daaglikse likiditeit en lae risiko (bv. geldmarkfondse en korttermyn-tesourie-effekte).';

  @override
  String get strategy_buyHoldTitle => 'Koop & Hou';

  @override
  String get strategy_buyHoldBody =>
      'Koop kwaliteit bates en hou vir die lang termyn. Fokus op dissipline, kwaliteit en herbelegging oor tyd.';

  @override
  String get strategy_diversificationTitle => 'Diversifikasie';

  @override
  String get strategy_diversificationBodyBr =>
      'Versprei jou kapitaal oor vaste inkomste, aandele, FII\'s en internasionale bates om risiko te verminder en risiko-aangepaste opbrengste te verbeter.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Versprei jou kapitaal oor effekte, aandele, REIT\'s en internasionale blootstelling om risiko te verminder en risiko-aangepaste opbrengste te verbeter.';

  @override
  String get strategy_dcaTitle => 'Dollarkoste-gemiddelde (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konsekwentheid klop genie. Om elke maand te belê is dikwels meer effektief as om die perfekte toegangspunt te probeer kies.';

  @override
  String get strategy_smartGoalsTitle => 'SMART doelwitte';

  @override
  String get strategy_smartGoalsBody =>
      'Jou doelwitte moet spesifiek, meetbaar, haalbaar, relevant en tydgebonde wees.';

  @override
  String get strategy_503020Title => '50-30-20 reël';

  @override
  String get strategy_503020Body =>
      '\'n Eenvoudige begrotingsraamwerk: 50% behoeftes, 30% begeertes, 20% belegging en doelwitte.';

  @override
  String get strategy_deepDive_allocationTitle => 'Batetoewysing (gevorderd)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Leer hoe om \'n toekenning volgens doel en horison te bou, risiko, korrelasie en herbalansering aan te pas.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETF\'s en indekse (gevorderd)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Leer oor globale indekse (bv. S&P 500), ETF\'s en hoe om internasionale blootstelling met dissipline te bou.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Belasting en verslagdoening (gevorderd)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Verstaan kernbelastingkonsepte en hoe om rekords te hou om beleggings veilig aan te meld.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium inhoud. Aktiveer \'n Cyber/Grimm/Hive-tema om die belegging Deep Dive te ontsluit.';

  @override
  String get homeShowcaseTitle => 'vertoonkas';

  @override
  String get homeShowcaseProfileSimTitle => 'Risikoprofielvasvra';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Vind jou beleggersprofiel binne \'n paar minute.';

  @override
  String get homeShowcaseStrategiesTitle => 'Aanbevole strategieë';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Direkte kortpaaie om strategieë te leer en toe te pas.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Vasvrae en strategieë';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Vinnige toegang tot die risikoprofielvasvra en aanbevole strategieë.';

  @override
  String get homeTourStepClassicTitle => 'Klassieke modus';

  @override
  String get homeTourStepClassicBody =>
      'Maak die oorspronklike toepassingpaneel oop: transaksies, doelwitte, beleggings en instellings in die bekende uitleg.';

  @override
  String get homeTourStepVitrineTitle => 'Uitstalarea';

  @override
  String get homeTourStepVitrineBody =>
      'Kortpaaie om te leer en te oefen: beleggersprofiel, strategieë en die Mentor-spilpunt.';

  @override
  String get homeTourStepProfileTitle => 'Profiel vasvra';

  @override
  String get homeTourStepProfileBody =>
      'Beantwoord die vraelys om jou risikoprofiel te ontdek en belynde voorstelle te sien.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategieë';

  @override
  String get homeTourStepStrategiesBody =>
      'Inhoud om finansies te organiseer, met dissipline te belê en algemene slaggate te vermy.';

  @override
  String get homeTourStepHubTitle => 'Mentor-hub';

  @override
  String get homeTourStepHubBody =>
      'Vinnige spyskaart na die profielvasvra en aanbevole strategieë.';

  @override
  String get homeTourStepPremiumTitle => 'Premium kenmerke';

  @override
  String get homeTourStepPremiumBody =>
      'Outomatiese mentorskap, gevorderde kaarte en maandelikse verslae - beskikbaar met \'n Premium-intekening.';

  @override
  String get homeTourStepMarketTitle => 'Mark momentopname';

  @override
  String get homeTourStepMarketBody =>
      'Markkonteks (Brasilië of wêreldwyd) gebaseer op jou streek plus omgeskakelde netto waarde.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor sakrekenaar';

  @override
  String get homeTourStepCalculatorBody =>
      'Simuleer saamgestelde rente, inflasie en sien die welvaartgrafiek; volgende maak ons ​​hierdie instrument oop.';

  @override
  String get quizProfile_title => 'Risikoprofielvasvra';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Vraag $current van $total';
  }

  @override
  String get quizProfile_badge => 'RISIKOPROFIEL VAS';

  @override
  String get quizProfile_resultTitle => 'JOU PROFIEL IS';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALE BELEGGINGS:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'VERKEN BELEGGINGS';

  @override
  String get quizProfile_exit => 'UITGANG';

  @override
  String get quizKnowledge_title => 'Kennisvasvra';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Vraag $current van $total';
  }
}

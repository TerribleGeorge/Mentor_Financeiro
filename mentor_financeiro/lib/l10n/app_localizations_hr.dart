// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Mentor Financije';

  @override
  String get saldo => 'Stanje';

  @override
  String get gastosDiarios => 'Dnevni troškovi';

  @override
  String get confirmarTransacao => 'Potvrdite transakciju\nIzjava';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Prijenosi';

  @override
  String get investimentos => 'Ulaganja';

  @override
  String get configuracoes => 'Postavke\nProfil';

  @override
  String get perfil => '';

  @override
  String get sair => 'Odjava';

  @override
  String get entrar => 'Prijava';

  @override
  String get cadastrar => 'Registar';

  @override
  String get email => 'E-pošta';

  @override
  String get senha => 'Lozinka';

  @override
  String get nome => 'Ime\nID broj';

  @override
  String get cpf => '';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Nastavi';

  @override
  String get voltar => 'Natrag';

  @override
  String get cancelar => 'Otkaži';

  @override
  String get salvar => 'Spremi';

  @override
  String get editar => 'Uredi';

  @override
  String get excluir => 'Izbriši';

  @override
  String get sucesso => 'Uspjeh';

  @override
  String get erro => 'Greška';

  @override
  String get carregando => 'Učitavanje...';

  @override
  String get semDados => 'Nema podataka';

  @override
  String get tentarNovamente => 'Pokušajte ponovno';

  @override
  String get relatorios => 'Izvješća';

  @override
  String get gastosPorCategoria => 'Troškovi po kategoriji';

  @override
  String get ultimosSeteDias => 'Posljednjih 7 dana';

  @override
  String get totalGasto => 'Ukupno potrošeno';

  @override
  String get transacoes => 'Transakcije';

  @override
  String get categoria => 'Kategorija';

  @override
  String get data => 'Datum';

  @override
  String get valor => 'Vrijednost';

  @override
  String get descricao => 'Opis';

  @override
  String get alimentacao => 'Hrana';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Slobodno vrijeme';

  @override
  String get saude => 'Zdravlje';

  @override
  String get outros => 'Ostalo';

  @override
  String get notificacoes => 'Obavijesti';

  @override
  String get permissaoNotificacoes => 'Dopuštenje za obavijest';

  @override
  String get ativarMonitoramento => 'Omogući praćenje troškova';

  @override
  String get descricaoMonitoramento =>
      'Dopustite aplikaciji da automatski prati vaše bankovne transakcije kako bi organizirala vaše financije.';

  @override
  String get idioma => 'Jezik';

  @override
  String get moeda => 'Valuta';

  @override
  String get compararInvestimentos => 'Usporedite ulaganja';

  @override
  String get descricaoLocalizacao =>
      'Za usporedbu lokalnih ulaganja (CDB/CDI) s međunarodnim stopama, potrebna nam je vaša lokacija.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Potrebno dopuštenje za lokaciju';

  @override
  String get rendaFixa => 'Fiksni prihod';

  @override
  String get rendaVariavel => 'Promjenjivi prihod';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Dionice';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Kriptovalute';

  @override
  String get rendimento => 'Povratak';

  @override
  String get rentabilidade => 'Profitabilnost';

  @override
  String get aplicar => 'Primjena';

  @override
  String get resgatar => 'Iskupi';

  @override
  String get simular => 'Simulacija';

  @override
  String get metas => 'Ciljevi';

  @override
  String get estrategias => 'Strategije';

  @override
  String get conhecimento => 'Znanje';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Pošalji poruku';

  @override
  String get digiteMensagem => 'Upišite poruku...';

  @override
  String get alertaGastos => 'Upozorenje o potrošnji';

  @override
  String alertaGastosMsg(int percent) {
    return 'Već ste iskoristili $percent% svog kreditnog ograničenja.';
  }

  @override
  String get fechamentoFatura => 'Zatvaranje računa';

  @override
  String get fechamentoFaturaMsg =>
      'Sutra je dan zatvaranja. Odlično vrijeme za pregled troškova.';

  @override
  String get faturaVencendo => 'Dospjela faktura';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Faktura dospijeva za $dias dan(a). Provjerite stanje.';
  }

  @override
  String get regra30 => 'Savjet: pravilo 30%.';

  @override
  String get regra30Msg =>
      'Držite korištenje ispod 30% kako biste poboljšali svoj kreditni rezultat.';

  @override
  String get diaDeOuro => 'Zlatni dan!';

  @override
  String get diaDeOuroMsg =>
      'Vaše današnje kupovine bit će plaćene samo za 40 dana!';

  @override
  String get alertaJuros => 'Upozorenje: Kamata';

  @override
  String get alertaJurosMsg =>
      'Vaš saldo ne pokriva račun. Izbjegavajte revolving kredit!';

  @override
  String get notaSaude => 'Financijsko zdravlje';

  @override
  String get notaExcelente => 'Izvrsno! Imate odlično financijsko zdravlje.';

  @override
  String get notaBom => 'Dobro, ali može se poboljšati.';

  @override
  String get notaAtencao => 'Pozornost na potrošnju.';

  @override
  String get notaRevisar => 'Pregledajte svoje financije.';

  @override
  String get mentorInsightTitle => 'Vodstvo mentora';

  @override
  String get mentorInsightLoading => 'Dohvaćanje tržišnih podataka…';

  @override
  String get mentorInsightError =>
      'Trenutačno ne mogu učitati podatke. Pokušajte ponovo uskoro.';

  @override
  String get mentorInsightOffline =>
      'Izvan mreže ste. Povežite se kako biste dohvatili ponude i uvide mentora.';

  @override
  String get mentorAllocationDefensive =>
      'S obzirom na trenutnu volatilnost, dajte prednost očuvanju kapitala i likvidnosti prije jurnjave povrata.';

  @override
  String get mentorAllocationBalanced =>
      'Uravnotežite zaštitu i rast: diverzificirajte i ponovno posjetite svoj ciljni horizont.';

  @override
  String get mentorAllocationOffensive =>
      'Vaš profil dopušta više rizika: ostanite disciplinirani i izbjegavajte veliku koncentraciju.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Pregledani simboli: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatski (jezik)';

  @override
  String get compoundCalculatorTitle => 'Mentor Kalkulator — Složena kamata';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulirajte doprinose, nominalni u odnosu na stvarni dobitak (nakon inflacije) i bilješke mentora.';

  @override
  String get compoundInitialLabel => 'Početni paušalni iznos';

  @override
  String get compoundMonthlyLabel => 'Mjesečni doprinos';

  @override
  String get compoundRateLabel => 'Kamatna stopa';

  @override
  String get compoundRateAnnual => 'godišnje';

  @override
  String get compoundRateMonthly => 'mjesečno';

  @override
  String get compoundHorizonLabel => 'Vremenski horizont';

  @override
  String get compoundHorizonYears => 'godina';

  @override
  String get compoundHorizonMonths => 'mjeseci';

  @override
  String get compoundInflationLabel => 'Procijenjena inflacija (% godišnje)';

  @override
  String get compoundCalculate => 'Izračunaj';

  @override
  String get compoundChartInvested => 'Ukupno uloženo';

  @override
  String get compoundChartInterest => 'Zarađene kamate';

  @override
  String get compoundSummaryNominalEnd => 'Završno stanje (nominalno)';

  @override
  String get compoundSummaryRealGain => 'Stvarni dobitak (kupovna moć)';

  @override
  String get compoundMentorCardTitle => 'Savjet mentora';

  @override
  String get compoundInvalidInput =>
      'Unesite važeće vrijednosti (horizont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentorski ton';

  @override
  String get userPersonaNovice => 'Početnik';

  @override
  String get userPersonaStrategist => 'Strateg';

  @override
  String get userPersonaRiskTaker => 'Rizičan';

  @override
  String get userPersonaConservative => 'Štednja';

  @override
  String get compoundOpenFullInsight => 'Otvorite puni mentorski uvid';

  @override
  String get investFirstSteps_title => 'Prvi koraci';

  @override
  String get investFirstSteps_brokerTitle => 'Odaberite brokera';

  @override
  String get investFirstSteps_brokerBody =>
      'Potražite regulirane institucije s ugledom. Usporedite naknade, proizvode i pouzdanost prije otvaranja računa.';

  @override
  String get investFirstSteps_openAccountTitle => 'Otvorite svoj račun';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitalno uključivanje. U Brazilu vam obično treba CPF/RG i ponekad dokaz o adresi.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Digitalna integracija razlikuje se ovisno o zemlji. Obično vam je potreban identifikacijski dokument i potvrda identiteta/adrese.';

  @override
  String get investFirstSteps_transferTitle => 'Prijenos sredstava';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Pošaljite novac putem PIX-a ili bankovnim prijenosom svom brokeru. Ostatak postaje dostupan za ulaganje.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Prijenos sredstava bankovnim prijenosom ili lokalnim metodama plaćanja (ovisi o vašoj zemlji). Ostatak postaje dostupan za ulaganje.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Upoznajte svoj profil rizika';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Odgovorite na upitnik o prikladnosti. Shvatite jeste li konzervativni, umjereni ili agresivni.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Kupite svoju prvu imovinu';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Započnite s fondom za hitne slučajeve (Tesouro Selic ili CDB s dnevnom likvidnošću). Zatim postupno diverzificirajte.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Započnite s fondom za hitne slučajeve (gotovina visokog prinosa, fondovi tržišta novca ili kratkoročne državne obveznice). Zatim postupno diverzificirajte.';

  @override
  String get investFirstSteps_tipTitle => 'Savjet mentora:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Počnite s malim, ulažite dosljedno i izbjegavajte pokušaje tempiranja tržišta. Vrijeme je vaš najbolji saveznik.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Počnite s malim, ulažite dosljedno i izbjegavajte pokušaje tempiranja tržišta. Vrijeme je vaš najbolji saveznik.';

  @override
  String get investMenu_tesouroTitle => 'Brazilske riznice';

  @override
  String get investMenu_cdbTitle => 'Banka s fiksnim prihodom (CDB)';

  @override
  String get investMenu_etfsTitle => 'Međunarodni ETF-ovi';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'Dionice';

  @override
  String get investMenu_fundsTitle => 'Sredstva';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Međunarodni';

  @override
  String get investMenu_cryptoTitle => 'kripto';

  @override
  String get investRegisterCta => 'Registrirajte ulaganje';

  @override
  String investRegionHintBr(String country) {
    return 'Efektivna zemlja: $country · Brazilski katalog (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Efektivna država: $country · Globalni katalog (ETF-ovi, NYSE/NASDAQ…). Automatski prilagođeno iz regije vašeg uređaja.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Osnovne strategije';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Fond za hitne slučajeve';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Vaš financijski štit. Pokrijte troškove od 6 do 12 mjeseci. Dajte prioritet dnevnoj likvidnosti i niskom riziku (npr. Tesouro Selic ili CDB povezan s CDI-jem).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Vaš financijski štit. Pokrijte troškove od 6 do 12 mjeseci. Dajte prioritet dnevnoj likvidnosti i niskom riziku (npr. fondovi tržišta novca i kratkoročne državne obveznice).';

  @override
  String get strategy_buyHoldTitle => 'Kupi i drži';

  @override
  String get strategy_buyHoldBody =>
      'Kupite kvalitetnu imovinu i držite je dugoročno. Usredotočite se na disciplinu, kvalitetu i ponovno ulaganje tijekom vremena.';

  @override
  String get strategy_diversificationTitle => 'Diverzifikacija';

  @override
  String get strategy_diversificationBodyBr =>
      'Rasporedite svoj kapital na fiksne prihode, dionice, FII-je i međunarodnu imovinu kako biste smanjili rizik i poboljšali povrate prilagođene riziku.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Rasporedite svoj kapital na obveznice, dionice, REIT-ove i međunarodnu izloženost kako biste smanjili rizik i poboljšali povrate prilagođene riziku.';

  @override
  String get strategy_dcaTitle => 'Usrednjavanje troškova u dolarima (DCA)';

  @override
  String get strategy_dcaBody =>
      'Dosljednost pobjeđuje genijalnost. Ulaganje svakog mjeseca često je učinkovitije od pokušaja odabira savršene ulazne točke.';

  @override
  String get strategy_smartGoalsTitle => 'PAMETNI ciljevi';

  @override
  String get strategy_smartGoalsBody =>
      'Vaši ciljevi trebaju biti specifični, mjerljivi, ostvarivi, relevantni i vremenski ograničeni.';

  @override
  String get strategy_503020Title => 'pravilo 50-30-20';

  @override
  String get strategy_503020Body =>
      'Jednostavan proračunski okvir: 50% potreba, 30% želja, 20% ulaganja i ciljevi.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Raspodjela sredstava (napredno)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Naučite kako izgraditi raspodjelu prema cilju i horizontu, prilagođavajući rizik, korelaciju i rebalans.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globalni ETF-ovi i indeksi (napredno)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Saznajte više o globalnim indeksima (npr. S&P 500), ETF-ovima i kako disciplinom izgraditi međunarodnu izloženost.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Porezi i izvješćivanje (napredno)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Razumjeti osnovne porezne koncepte i kako voditi evidenciju za sigurno prijavljivanje ulaganja.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium sadržaj. Aktivirajte Cyber/Grimm/Hive temu za otključavanje ulaganja Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Vitrina';

  @override
  String get homeShowcaseProfileSimTitle => 'Kviz o profilu rizika';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Pronađite svoj profil investitora u nekoliko minuta.';

  @override
  String get homeShowcaseStrategiesTitle => 'Preporučene strategije';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Izravni prečaci za učenje i primjenu strategija.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Kvizovi i strategije';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Brzi pristup kvizu o profilu rizika i preporučenim strategijama.';

  @override
  String get homeTourStepClassicTitle => 'Klasični način rada';

  @override
  String get homeTourStepClassicBody =>
      'Otvara izvornu ploču aplikacije: transakcije, ciljevi, ulaganja i postavke u poznatom izgledu.';

  @override
  String get homeTourStepVitrineTitle => 'Prostor za izlaganje';

  @override
  String get homeTourStepVitrineBody =>
      'Prečaci za učenje i praksu: profil investitora, strategije i Mentor hub.';

  @override
  String get homeTourStepProfileTitle => 'Kviz o profilu';

  @override
  String get homeTourStepProfileBody =>
      'Odgovorite na upitnik kako biste otkrili svoj profil rizika i vidjeli usklađene prijedloge.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategije';

  @override
  String get homeTourStepStrategiesBody =>
      'Sadržaj za organiziranje financija, disciplinirano ulaganje i izbjegavanje uobičajenih zamki.';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody =>
      'Brzi izbornik za profilni kviz i preporučene strategije.';

  @override
  String get homeTourStepPremiumTitle => 'Premium značajke';

  @override
  String get homeTourStepPremiumBody =>
      'Automatsko mentorstvo, napredne karte i mjesečna izvješća — dostupno uz Premium pretplatu.';

  @override
  String get homeTourStepMarketTitle => 'Snimak tržišta';

  @override
  String get homeTourStepMarketBody =>
      'Tržišni kontekst (Brazil ili globalno) na temelju vaše regije plus preračunata neto vrijednost.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentorski kalkulator';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulirajte složene kamate, inflaciju i pogledajte grafikon bogatstva; zatim otvaramo ovaj alat.';

  @override
  String get quizProfile_title => 'Kviz o profilu rizika';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Pitanje $current od $total';
  }

  @override
  String get quizProfile_badge => 'KVIZ PROFIL RIZIKA';

  @override
  String get quizProfile_resultTitle => 'VAŠ PROFIL JE';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALNA ULAGANJA:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ISTRAŽITE ULAGANJA';

  @override
  String get quizProfile_exit => 'IZLAZ';

  @override
  String get quizKnowledge_title => 'Kviz znanja';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Pitanje $current od $total';
  }
}

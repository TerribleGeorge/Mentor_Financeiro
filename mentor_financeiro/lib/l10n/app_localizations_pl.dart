// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Mentor finansów';

  @override
  String get saldo => '';

  @override
  String get gastosDiarios => 'Dzienne wydatki';

  @override
  String get confirmarTransacao => 'Potwierdź transakcję\nOświadczenie';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Transfery';

  @override
  String get investimentos => 'Inwestycje';

  @override
  String get configuracoes => 'Ustawienia\nProfil';

  @override
  String get perfil => '';

  @override
  String get sair => 'Wyloguj się';

  @override
  String get entrar => 'Zaloguj się\nRejestr';

  @override
  String get cadastrar => '';

  @override
  String get email => 'E-mail';

  @override
  String get senha => 'Hasło';

  @override
  String get nome => 'Nazwa';

  @override
  String get cpf => 'Numer identyfikacyjny';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Kontynuuj';

  @override
  String get voltar => 'Tył';

  @override
  String get cancelar => 'Anuluj';

  @override
  String get salvar => 'Zapisz';

  @override
  String get editar => 'Edytuj';

  @override
  String get excluir => 'Usuń';

  @override
  String get sucesso => 'Sukces\nBłąd';

  @override
  String get erro => '';

  @override
  String get carregando => 'Ładowanie...';

  @override
  String get semDados => 'Brak danych';

  @override
  String get tentarNovamente => 'Spróbuj ponownie';

  @override
  String get relatorios => 'Raporty';

  @override
  String get gastosPorCategoria => 'Wydatki według kategorii';

  @override
  String get ultimosSeteDias => 'Ostatnie 7 dni';

  @override
  String get totalGasto => 'Całkowite wydatki';

  @override
  String get transacoes => 'Transakcje\nKategoria';

  @override
  String get categoria => '';

  @override
  String get data => 'Data';

  @override
  String get valor => 'Wartość';

  @override
  String get descricao => 'Opis';

  @override
  String get alimentacao => 'Jedzenie';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Wypoczynek';

  @override
  String get saude => 'Zdrowie';

  @override
  String get outros => 'Inne';

  @override
  String get notificacoes => 'Powiadomienia';

  @override
  String get permissaoNotificacoes => 'Zezwolenie na powiadomienie';

  @override
  String get ativarMonitoramento => 'Włącz monitorowanie wydatków';

  @override
  String get descricaoMonitoramento =>
      'Zezwól aplikacji na automatyczne monitorowanie transakcji bankowych w celu uporządkowania finansów.';

  @override
  String get idioma => 'Język';

  @override
  String get moeda => 'Waluta';

  @override
  String get compararInvestimentos => 'Porównaj inwestycje';

  @override
  String get descricaoLocalizacao =>
      'Aby porównać inwestycje lokalne (CDB/CDI) ze stawkami międzynarodowymi, potrzebujemy Twojej lokalizacji.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Wymagane pozwolenie na lokalizację';

  @override
  String get rendaFixa => 'Stały dochód';

  @override
  String get rendaVariavel => 'Dochód zmienny';

  @override
  String get tesouroDireto => 'Skarb Państwa';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Zapasy';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kryptowaluty';

  @override
  String get rendimento => 'Powrót';

  @override
  String get rentabilidade => 'Rentowność';

  @override
  String get aplicar => 'Zastosuj';

  @override
  String get resgatar => 'Wykorzystaj';

  @override
  String get simular => 'Symulacja';

  @override
  String get metas => 'Bramki';

  @override
  String get estrategias => '';

  @override
  String get conhecimento => 'Wiedza';

  @override
  String get chat => 'Czat';

  @override
  String get enviarMensagem => 'Wyślij wiadomość';

  @override
  String get digiteMensagem => 'Wpisz wiadomość...';

  @override
  String get alertaGastos => 'Alert dotyczący wydatków';

  @override
  String alertaGastosMsg(int percent) {
    return 'Wykorzystałeś już $percent% swojego limitu kredytowego.';
  }

  @override
  String get fechamentoFatura => 'Zamknięcie faktury';

  @override
  String get fechamentoFaturaMsg =>
      'Jutro dzień zamknięcia. Świetny czas na przegląd wydatków.';

  @override
  String get faturaVencendo => 'Termin płatności faktury';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Faktura płatna za $dias dni. Sprawdź saldo.\nSaldo';
  }

  @override
  String get regra30 => 'Wskazówka: Zasada 30%.';

  @override
  String get regra30Msg =>
      'Utrzymuj wykorzystanie poniżej 30%, aby poprawić swoją zdolność kredytową.';

  @override
  String get diaDeOuro => 'Złoty dzień!';

  @override
  String get diaDeOuroMsg =>
      'Twoje dzisiejsze zakupy zostaną opłacone dopiero za 40 dni!';

  @override
  String get alertaJuros => 'Ostrzeżenie: odsetki';

  @override
  String get alertaJurosMsg =>
      'Twoje saldo nie pokrywa rachunku. Unikaj kredytu odnawialnego!';

  @override
  String get notaSaude => 'Kondycja finansowa';

  @override
  String get notaExcelente => 'Doskonale! Masz świetną kondycję finansową.';

  @override
  String get notaBom => 'Dobrze, ale można ulepszyć.';

  @override
  String get notaAtencao => 'Uwaga na wydatki.';

  @override
  String get notaRevisar => 'Przejrzyj swoje finanse.';

  @override
  String get mentorInsightTitle => 'Wskazówki mentora';

  @override
  String get mentorInsightLoading => 'Pobieram dane rynkowe…';

  @override
  String get mentorInsightError =>
      'Nie można teraz załadować danych. Spróbuj ponownie wkrótce.';

  @override
  String get mentorInsightOffline =>
      'Jesteś offline. Połącz się, aby pobrać wyceny i spostrzeżenia mentorów.';

  @override
  String get mentorAllocationDefensive =>
      'Biorąc pod uwagę obecną zmienność, przed pogonią za zwrotami należy priorytetowo traktować ochronę kapitału i płynność.';

  @override
  String get mentorAllocationBalanced =>
      'Zrównoważ ochronę i rozwój: dywersyfikuj i wróć do horyzontu celów.';

  @override
  String get mentorAllocationOffensive =>
      'Twój profil pozwala na większe ryzyko: zachowaj dyscyplinę i unikaj nadmiernej koncentracji.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Przeglądane symbole: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatyczny (język)';

  @override
  String get compoundCalculatorTitle => 'Kalkulator mentora — procent składany';

  @override
  String get compoundCalculatorSubtitle =>
      'Symuluj wkłady, zysk nominalny i realny (po inflacji) oraz notatki mentora.';

  @override
  String get compoundInitialLabel => 'Ryczałt początkowy';

  @override
  String get compoundMonthlyLabel => 'Składka miesięczna';

  @override
  String get compoundRateLabel => 'Stopa procentowa';

  @override
  String get compoundRateAnnual => 'rocznie';

  @override
  String get compoundRateMonthly => 'miesięcznie';

  @override
  String get compoundHorizonLabel => 'Horyzont czasowy';

  @override
  String get compoundHorizonYears => 'lat';

  @override
  String get compoundHorizonMonths => 'miesięcy';

  @override
  String get compoundInflationLabel => 'Szacunkowa inflacja (% rocznie)';

  @override
  String get compoundCalculate => 'Oblicz';

  @override
  String get compoundChartInvested => 'Łącznie zainwestowano';

  @override
  String get compoundChartInterest => 'Odsetki naliczone';

  @override
  String get compoundSummaryNominalEnd => 'Bilans końcowy (nominalny)';

  @override
  String get compoundSummaryRealGain => 'Realny zysk (siła nabywcza)';

  @override
  String get compoundMentorCardTitle => 'Porady mentora';

  @override
  String get compoundInvalidInput =>
      'Podaj prawidłowe wartości (horyzont > 0).';

  @override
  String get userPersonaSectionTitle => 'Dźwięk mentora';

  @override
  String get userPersonaNovice => 'Początkujący';

  @override
  String get userPersonaStrategist => 'Strateg';

  @override
  String get userPersonaRiskTaker => 'Osoba podejmująca ryzyko';

  @override
  String get userPersonaConservative => 'Oszczędzacz';

  @override
  String get compoundOpenFullInsight => 'Otwórz pełny wgląd w mentora';

  @override
  String get investFirstSteps_title => 'Pierwsze kroki';

  @override
  String get investFirstSteps_brokerTitle => 'Wybierz brokera';

  @override
  String get investFirstSteps_brokerBody =>
      'Poszukaj regulowanych, renomowanych instytucji. Przed otwarciem konta porównaj opłaty, produkty i niezawodność.';

  @override
  String get investFirstSteps_openAccountTitle => 'Otwórz swoje konto';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Cyfrowe wdrożenie. W Brazylii zazwyczaj potrzebny jest numer CPF/RG, a czasami dowód adresu.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Cyfrowe wdrożenie różni się w zależności od kraju. Zazwyczaj potrzebny jest dokument tożsamości oraz weryfikacja tożsamości/adresu.';

  @override
  String get investFirstSteps_transferTitle => 'Transfer środków';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Wyślij pieniądze za pośrednictwem PIX lub przelewu bankowego do swojego brokera. Saldo staje się dostępne do inwestowania.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Przelej środki przelewem bankowym lub lokalnymi metodami płatności (w zależności od kraju). Saldo staje się dostępne do inwestowania.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Poznaj swój profil ryzyka';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Odpowiedz na kwestionariusz przydatności. Zrozum, czy jesteś konserwatywny, umiarkowany czy agresywny.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Kup swój pierwszy zasób';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Zacznij od funduszu awaryjnego (Tesouro Selic lub CDB z dzienną płynnością). Następnie dywersyfikuj stopniowo.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Zacznij od funduszu awaryjnego (gotówka o wysokiej stopie zwrotu, fundusze rynku pieniężnego lub krótkoterminowe obligacje skarbowe). Następnie dywersyfikuj stopniowo.';

  @override
  String get investFirstSteps_tipTitle => 'Wskazówka mentora:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Zacznij od czegoś małego, inwestuj konsekwentnie i unikaj prób wyczucia rynku. Czas jest Twoim najlepszym sprzymierzeńcem.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Zacznij od czegoś małego, inwestuj konsekwentnie i unikaj prób wyczucia rynku. Czas jest Twoim najlepszym sprzymierzeńcem.';

  @override
  String get investMenu_tesouroTitle => 'Brazylijskie skarby';

  @override
  String get investMenu_cdbTitle => 'Bank o stałym dochodzie (CDB)';

  @override
  String get investMenu_etfsTitle => 'Międzynarodowe fundusze ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'Zapasy';

  @override
  String get investMenu_fundsTitle => 'Fundusze';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REIT';

  @override
  String get investMenu_internationalTitle => 'Międzynarodowe';

  @override
  String get investMenu_cryptoTitle => 'Kryptowaluta';

  @override
  String get investRegisterCta => 'Zarejestruj inwestycję';

  @override
  String investRegionHintBr(String country) {
    return 'Obowiązujący kraj: $country · Katalog Brazylii (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Obowiązujący kraj: $country · Katalog globalny (ETF, NYSE/NASDAQ…). Automatycznie dostosowywane do regionu Twojego urządzenia.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Podstawowe strategie';

  @override
  String get strategy_sectionDeepDiveTitle => 'Głębokie nurkowanie (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Fundusz awaryjny';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Twoja tarcza finansowa. Pokryj wydatki na 6–12 miesięcy. Nadaj priorytet codziennej płynności i niskiemu ryzyku (np. Tesouro Selic lub CDB powiązany z CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Twoja tarcza finansowa. Pokryj wydatki na 6–12 miesięcy. Priorytetowo traktuj dzienną płynność i niskie ryzyko (np. fundusze rynku pieniężnego i krótkoterminowe obligacje skarbowe).';

  @override
  String get strategy_buyHoldTitle => 'Kup i trzymaj';

  @override
  String get strategy_buyHoldBody =>
      'Kupuj wysokiej jakości aktywa i trzymaj je długoterminowo. Skoncentruj się na dyscyplinie, jakości i reinwestycji w czasie.';

  @override
  String get strategy_diversificationTitle => 'Dywersyfikacja';

  @override
  String get strategy_diversificationBodyBr =>
      'Rozłóż swój kapitał na instrumenty o stałym dochodzie, akcje, FII i aktywa międzynarodowe, aby zmniejszyć ryzyko i poprawić zwroty skorygowane o ryzyko.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Rozłóż swój kapitał na obligacje, akcje, REIT i ekspozycję międzynarodową, aby zmniejszyć ryzyko i poprawić zwroty skorygowane o ryzyko.';

  @override
  String get strategy_dcaTitle => 'Uśrednianie kosztów w dolarach (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konsekwencja bije geniusz. Inwestowanie co miesiąc jest często bardziej skuteczne niż próba wybrania idealnego punktu wejścia.\nBramki';

  @override
  String get strategy_smartGoalsTitle => 'SMART';

  @override
  String get strategy_smartGoalsBody =>
      'Twoje cele powinny być konkretne, mierzalne, osiągalne, istotne i określone w czasie.\nReguła';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Proste ramy budżetowania: 50% potrzeb, 30% pragnień, 20% inwestycji i celów.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Alokacja aktywów (zaawansowane)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Dowiedz się, jak budować alokację według celu i horyzontu, korygując ryzyko, korelację i przywracając równowagę.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globalne ETF-y i indeksy (zaawansowane)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Dowiedz się o globalnych indeksach (np. S&P 500), funduszach ETF i o tym, jak zdyscyplinowane budować międzynarodową ekspozycję.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Podatki i raportowanie (zaawansowane)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Zapoznaj się z podstawowymi pojęciami podatkowymi i sposobami prowadzenia dokumentacji w celu bezpiecznego raportowania inwestycji.';

  @override
  String get strategy_premiumLockedBody =>
      'Treści premium. Aktywuj motyw Cyber/Grimm/Hive, aby odblokować inwestycję Deep Dive.\nPrezentacja';

  @override
  String get homeShowcaseTitle => '';

  @override
  String get homeShowcaseProfileSimTitle => 'Quiz dotyczący profilu ryzyka';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Znajdź swój profil inwestora w kilka minut.';

  @override
  String get homeShowcaseStrategiesTitle => 'Zalecane strategie';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Bezpośrednie skróty do nauki i stosowania strategii.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Quizy i strategie';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Szybki dostęp do quizu o profilu ryzyka i zalecanych strategii.';

  @override
  String get homeTourStepClassicTitle => 'Tryb klasyczny';

  @override
  String get homeTourStepClassicBody =>
      'Otwiera oryginalny panel aplikacji: transakcje, cele, inwestycje i ustawienia w znanym układzie.';

  @override
  String get homeTourStepVitrineTitle => 'Powierzchnia wystawowa';

  @override
  String get homeTourStepVitrineBody =>
      'Skróty do nauki i praktyki: profil inwestora, strategie i centrum Mentorów.';

  @override
  String get homeTourStepProfileTitle => 'Quiz profilowy';

  @override
  String get homeTourStepProfileBody =>
      'Odpowiedz na kwestionariusz, aby poznać swój profil ryzyka i zobaczyć dopasowane sugestie.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategie';

  @override
  String get homeTourStepStrategiesBody =>
      'Treść do organizowania finansów, inwestowania z dyscypliną i unikania typowych pułapek.';

  @override
  String get homeTourStepHubTitle => 'Hub mentorski';

  @override
  String get homeTourStepHubBody =>
      'Szybkie menu do quizu profilowego i zalecanych strategii.';

  @override
  String get homeTourStepPremiumTitle => 'Funkcje premium';

  @override
  String get homeTourStepPremiumBody =>
      'Automatyczny mentoring, zaawansowane wykresy i miesięczne raporty — dostępne w ramach subskrypcji Premium.';

  @override
  String get homeTourStepMarketTitle => 'Migawka rynku';

  @override
  String get homeTourStepMarketBody =>
      'Kontekst rynkowy (Brazylia lub świat) w oparciu o Twój region plus przeliczoną wartość netto.';

  @override
  String get homeTourStepCalculatorTitle => 'Kalkulator mentora';

  @override
  String get homeTourStepCalculatorBody =>
      'Symuluj odsetki składane, inflację i zobacz wykres bogactwa; następnie otwieramy to narzędzie.';

  @override
  String get quizProfile_title => 'Quiz dotyczący profilu ryzyka';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Pytanie $current z $total';
  }

  @override
  String get quizProfile_badge => 'PROFIL RYZYKA QUIZ';

  @override
  String get quizProfile_resultTitle => 'TWÓJ PROFIL TO';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALNE INWESTYCJE:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ODKRYJ INWESTYCJE';

  @override
  String get quizProfile_exit => 'WYJŚCIE';

  @override
  String get quizKnowledge_title => 'Quiz wiedzy';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Pytanie $current z $total';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Finanzmentor';

  @override
  String get saldo => 'Kontostand';

  @override
  String get gastosDiarios => 'Tägliche Ausgaben';

  @override
  String get confirmarTransacao => 'Transaktion bestätigen';

  @override
  String get extrato => 'Kontoauszug';

  @override
  String get transferencias => 'Überweisungen';

  @override
  String get investimentos => 'Investitionen';

  @override
  String get configuracoes => 'Einstellungen';

  @override
  String get perfil => 'Profil';

  @override
  String get sair => 'Abmelden';

  @override
  String get entrar => 'Anmelden';

  @override
  String get cadastrar => 'Registrieren';

  @override
  String get email => 'E-Mail';

  @override
  String get senha => 'Passwort';

  @override
  String get nome => 'Name';

  @override
  String get cpf => 'Ausweisnummer';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Weiter';

  @override
  String get voltar => 'Zurück';

  @override
  String get cancelar => 'Abbrechen';

  @override
  String get salvar => 'Speichern';

  @override
  String get editar => 'Bearbeiten';

  @override
  String get excluir => 'Löschen';

  @override
  String get sucesso => 'Erfolg';

  @override
  String get erro => 'Fehler';

  @override
  String get carregando => 'Wird geladen...';

  @override
  String get semDados => 'Keine Daten';

  @override
  String get tentarNovamente => 'Erneut versuchen';

  @override
  String get relatorios => 'Berichte';

  @override
  String get gastosPorCategoria => 'Ausgaben nach Kategorie';

  @override
  String get ultimosSeteDias => 'Letzte 7 Tage';

  @override
  String get totalGasto => 'Gesamtausgaben';

  @override
  String get transacoes => 'Transaktionen';

  @override
  String get categoria => 'Kategorie';

  @override
  String get data => 'Datum';

  @override
  String get valor => 'Betrag';

  @override
  String get descricao => 'Beschreibung';

  @override
  String get alimentacao => 'Lebensmittel';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Freizeit';

  @override
  String get saude => 'Gesundheit';

  @override
  String get outros => 'Sonstiges';

  @override
  String get notificacoes => 'Benachrichtigungen';

  @override
  String get permissaoNotificacoes => 'Benachrichtigungsberechtigung';

  @override
  String get ativarMonitoramento => 'Ausgabenüberwachung aktivieren';

  @override
  String get descricaoMonitoramento =>
      'Erlaube der App, deine Banktransaktionen automatisch zu überwachen, um deine Finanzen zu organisieren.';

  @override
  String get idioma => 'Sprache';

  @override
  String get moeda => 'Währung';

  @override
  String get compararInvestimentos => 'Investitionen vergleichen';

  @override
  String get descricaoLocalizacao =>
      'Um lokale Investitionen (CDB/CDI) mit internationalen Zinssätzen zu vergleichen, benötigen wir deinen Standort.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Standortberechtigung erforderlich';

  @override
  String get rendaFixa => 'Festverzinsliche Anlagen';

  @override
  String get rendaVariavel => 'Variable Anlagen';

  @override
  String get tesouroDireto => 'Direkte Staatsanleihen';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Aktien';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Kryptowährungen';

  @override
  String get rendimento => 'Ertrag';

  @override
  String get rentabilidade => 'Rendite';

  @override
  String get aplicar => 'Anwenden';

  @override
  String get resgatar => 'Einlösen';

  @override
  String get simular => 'Simulieren';

  @override
  String get metas => 'Ziele';

  @override
  String get estrategias => 'Strategien';

  @override
  String get conhecimento => 'Wissen';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Nachricht senden';

  @override
  String get digiteMensagem => 'Nachricht eingeben...';

  @override
  String get alertaGastos => 'Ausgabenwarnung';

  @override
  String alertaGastosMsg(int percent) {
    return 'Du hast bereits $percent% deines Kreditlimits genutzt.';
  }

  @override
  String get fechamentoFatura => 'Rechnungsabschluss';

  @override
  String get fechamentoFaturaMsg =>
      'Morgen ist der Abschluss. Ein guter Zeitpunkt, um deine Ausgaben zu prüfen.';

  @override
  String get faturaVencendo => 'Rechnung fällig';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Deine Rechnung ist in $dias Tag(en) fällig. Prüfe deinen Kontostand.';
  }

  @override
  String get regra30 => 'Tipp: 30%-Regel';

  @override
  String get regra30Msg =>
      'Halte die Nutzung unter 30%, um deinen Kredit-Score zu verbessern.';

  @override
  String get diaDeOuro => 'Goldener Tag!';

  @override
  String get diaDeOuroMsg =>
      'Deine heutigen Käufe werden erst in 40 Tagen bezahlt!';

  @override
  String get alertaJuros => 'Warnung: Zinsen';

  @override
  String get alertaJurosMsg =>
      'Dein Kontostand deckt die Rechnung nicht. Vermeide revolvierende Kredite!';

  @override
  String get notaSaude => 'Finanzielle Gesundheit';

  @override
  String get notaExcelente =>
      'Ausgezeichnet! Du hast eine sehr gute finanzielle Gesundheit.';

  @override
  String get notaBom => 'Gut, aber es kann noch besser werden.';

  @override
  String get notaAtencao => 'Achte auf deine Ausgaben.';

  @override
  String get notaRevisar => 'Überprüfe deine Finanzen.';

  @override
  String get mentorInsightTitle => 'Mentor-Empfehlung';

  @override
  String get mentorInsightLoading => 'Marktdaten werden abgerufen…';

  @override
  String get mentorInsightError =>
      'Daten konnten gerade nicht geladen werden. Versuche es gleich erneut.';

  @override
  String get mentorInsightOffline =>
      'Du bist offline. Verbinde dich, um Kurse und Mentor-Einblicke abzurufen.';

  @override
  String get mentorAllocationDefensive =>
      'Bei aktueller Volatilität solltest du Kapitalerhalt und Liquidität priorisieren, bevor du Rendite suchst.';

  @override
  String get mentorAllocationBalanced =>
      'Balance zwischen Schutz und Wachstum: diversifiziere und prüfe deinen Zeithorizont.';

  @override
  String get mentorAllocationOffensive =>
      'Dein Profil erlaubt mehr Risiko: bleibe diszipliniert und vermeide starke Konzentration.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Geprüfte Symbole: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automatisch (Sprache)';

  @override
  String get compoundCalculatorTitle => 'Mentor-Rechner — Zinseszins';

  @override
  String get compoundCalculatorSubtitle =>
      'Simuliere Einzahlungen, nominalen und realen Gewinn nach Inflation sowie Mentor-Hinweise.';

  @override
  String get compoundInitialLabel => 'Anfangsbetrag';

  @override
  String get compoundMonthlyLabel => 'Monatliche Einzahlung';

  @override
  String get compoundRateLabel => 'Zinssatz';

  @override
  String get compoundRateAnnual => 'pro Jahr';

  @override
  String get compoundRateMonthly => 'pro Monat';

  @override
  String get compoundHorizonLabel => 'Zeithorizont';

  @override
  String get compoundHorizonYears => 'Jahre';

  @override
  String get compoundHorizonMonths => 'Monate';

  @override
  String get compoundInflationLabel => 'Geschätzte Inflation (% pro Jahr)';

  @override
  String get compoundCalculate => 'Berechnen';

  @override
  String get compoundChartInvested => 'Insgesamt investiert';

  @override
  String get compoundChartInterest => 'Erwirtschaftete Zinsen';

  @override
  String get compoundSummaryNominalEnd => 'Endbetrag (nominal)';

  @override
  String get compoundSummaryRealGain => 'Realer Gewinn (Kaufkraft)';

  @override
  String get compoundMentorCardTitle => 'Mentor-Rat';

  @override
  String get compoundInvalidInput =>
      'Gib gültige Werte ein (Zeithorizont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor-Ton';

  @override
  String get userPersonaNovice => 'Einsteiger';

  @override
  String get userPersonaStrategist => 'Stratege';

  @override
  String get userPersonaRiskTaker => 'Risikofreudig';

  @override
  String get userPersonaConservative => 'Sparer';

  @override
  String get compoundOpenFullInsight => 'Vollständigen Mentor-Einblick öffnen';

  @override
  String get investFirstSteps_title => 'Erste Schritte';

  @override
  String get investFirstSteps_brokerTitle => 'Broker auswählen';

  @override
  String get investFirstSteps_brokerBody =>
      'Suche regulierte und seriöse Institute. Vergleiche Gebühren, Produkte und Zuverlässigkeit, bevor du ein Konto eröffnest.';

  @override
  String get investFirstSteps_openAccountTitle => 'Konto eröffnen';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitale Registrierung. In Brasilien brauchst du normalerweise CPF/RG und manchmal einen Adressnachweis.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Die digitale Registrierung unterscheidet sich je nach Land. Meist brauchst du ein Ausweisdokument und eine Identitäts-/Adressprüfung.';

  @override
  String get investFirstSteps_transferTitle => 'Geld überweisen';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Sende Geld per PIX oder Banküberweisung an deinen Broker. Das Guthaben steht dann zum Investieren bereit.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Überweise Geld per Banküberweisung oder lokalen Zahlungsmethoden, abhängig von deinem Land. Das Guthaben steht dann zum Investieren bereit.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Kenne dein Risikoprofil';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Beantworte einen Eignungsfragebogen. Verstehe, ob du konservativ, moderat oder aggressiv bist.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Kaufe deine erste Anlage';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Beginne mit einer Notfallreserve (Tesouro Selic oder CDB mit täglicher Liquidität). Danach schrittweise diversifizieren.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Beginne mit einer Notfallreserve (Tagesgeld, Geldmarktfonds oder kurzfristige Staatsanleihen). Danach schrittweise diversifizieren.';

  @override
  String get investFirstSteps_tipTitle => 'Mentor-Tipp:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Starte klein, investiere regelmäßig und versuche nicht, den Markt perfekt zu timen. Zeit ist dein bester Verbündeter.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Starte klein, investiere regelmäßig und versuche nicht, den Markt perfekt zu timen. Zeit ist dein bester Verbündeter.';

  @override
  String get investMenu_tesouroTitle => 'Brasilianische Staatsanleihen';

  @override
  String get investMenu_cdbTitle => 'Bank-Festzins (CDB)';

  @override
  String get investMenu_etfsTitle => 'Internationale ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (Index)';

  @override
  String get investMenu_stocksTitle => 'Aktien';

  @override
  String get investMenu_fundsTitle => 'Fonds';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Krypto';

  @override
  String get investRegisterCta => 'Investition registrieren';

  @override
  String investRegionHintBr(String country) {
    return 'Aktives Land: $country · Brasilien-Katalog (Staatsanleihen, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Aktives Land: $country · Globaler Katalog (ETFs, NYSE/NASDAQ…). Automatisch anhand deiner Geräteeinstellungen angepasst.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Wichtige Strategien';

  @override
  String get strategy_sectionDeepDiveTitle => 'Vertiefung (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Notfallreserve';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Dein finanzieller Schutzschild. Decke 6–12 Monate Ausgaben ab. Priorisiere tägliche Liquidität und niedriges Risiko, z. B. Tesouro Selic oder CDI-gebundene CDB.';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Dein finanzieller Schutzschild. Decke 6–12 Monate Ausgaben ab. Priorisiere tägliche Liquidität und niedriges Risiko, z. B. Geldmarktfonds und kurzfristige Staatsanleihen.';

  @override
  String get strategy_buyHoldTitle => 'Buy & Hold';

  @override
  String get strategy_buyHoldBody =>
      'Kaufe hochwertige Anlagen und halte sie langfristig. Fokus auf Disziplin, Qualität und Wiederanlage.';

  @override
  String get strategy_diversificationTitle => 'Diversifikation';

  @override
  String get strategy_diversificationBodyBr =>
      'Verteile dein Kapital auf Festzins, Aktien, FIIs und internationale Anlagen, um Risiko zu senken und risikobereinigte Renditen zu verbessern.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Verteile dein Kapital auf Anleihen, Aktien, REITs und internationale Anlagen, um Risiko zu senken und risikobereinigte Renditen zu verbessern.';

  @override
  String get strategy_dcaTitle => 'Durchschnittskosteneffekt (DCA)';

  @override
  String get strategy_dcaBody =>
      'Konstanz schlägt Genialität. Monatliches Investieren ist oft wirksamer als der Versuch, den perfekten Einstieg zu treffen.';

  @override
  String get strategy_smartGoalsTitle => 'SMART-Ziele';

  @override
  String get strategy_smartGoalsBody =>
      'Deine Ziele sollten spezifisch, messbar, erreichbar, relevant und terminiert sein.';

  @override
  String get strategy_503020Title => '50-30-20-Regel';

  @override
  String get strategy_503020Body =>
      'Ein einfaches Budgetmodell: 50% Bedarf, 30% Wünsche, 20% Investieren und Ziele.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Asset Allocation (fortgeschritten)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Lerne, wie du eine Allokation nach Ziel und Zeithorizont aufbaust und Risiko, Korrelation und Rebalancing anpasst.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globale ETFs und Indizes (fortgeschritten)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Lerne globale Indizes wie den S&P 500, ETFs und den disziplinierten Aufbau internationaler Anlagen kennen.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Steuern und Berichte (fortgeschritten)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Verstehe wichtige Steuerkonzepte und wie du Aufzeichnungen sicher für die Meldung deiner Investitionen führst.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium-Inhalt. Aktiviere ein Cyber/Grimm/Hive-Theme, um die Investment-Vertiefung freizuschalten.';

  @override
  String get homeShowcaseTitle => 'Vitrine';

  @override
  String get homeShowcaseProfileSimTitle => 'Risikoprofil-Quiz';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Finde dein Anlegerprofil in wenigen Minuten.';

  @override
  String get homeShowcaseStrategiesTitle => 'Empfohlene Strategien';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Direkte Abkürzungen zum Lernen und Anwenden von Strategien.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Quizze & Strategien';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Schneller Zugriff auf das Risikoprofil-Quiz und empfohlene Strategien.';

  @override
  String get homeTourStepClassicTitle => 'Klassischer Modus';

  @override
  String get homeTourStepClassicBody =>
      'Öffnet das ursprüngliche App-Panel: Transaktionen, Ziele, Investitionen und Einstellungen im vertrauten Layout.';

  @override
  String get homeTourStepVitrineTitle => 'Vitrinenbereich';

  @override
  String get homeTourStepVitrineBody =>
      'Abkürzungen zum Lernen und Üben: Anlegerprofil, Strategien und Mentor-Hub.';

  @override
  String get homeTourStepProfileTitle => 'Profil-Quiz';

  @override
  String get homeTourStepProfileBody =>
      'Beantworte den Fragebogen, um dein Risikoprofil zu entdecken und passende Vorschläge zu sehen.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategien';

  @override
  String get homeTourStepStrategiesBody =>
      'Inhalte, um Finanzen zu organisieren, diszipliniert zu investieren und häufige Fehler zu vermeiden.';

  @override
  String get homeTourStepHubTitle => 'Mentor-Hub';

  @override
  String get homeTourStepHubBody =>
      'Schnellmenü zum Profil-Quiz und zu empfohlenen Strategien.';

  @override
  String get homeTourStepPremiumTitle => 'Premium-Funktionen';

  @override
  String get homeTourStepPremiumBody =>
      'Automatische Mentoring-Hinweise, erweiterte Diagramme und Monatsberichte — verfügbar mit Premium-Abo.';

  @override
  String get homeTourStepMarketTitle => 'Marktüberblick';

  @override
  String get homeTourStepMarketBody =>
      'Marktkontext (Brasilien oder global) basierend auf deiner Region plus umgerechnetes Nettovermögen.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor-Rechner';

  @override
  String get homeTourStepCalculatorBody =>
      'Simuliere Zinseszins, Inflation und sieh die Vermögenskurve; als Nächstes öffnen wir dieses Werkzeug.';

  @override
  String get quizProfile_title => 'Risikoprofil-Quiz';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Frage $current von $total';
  }

  @override
  String get quizProfile_badge => 'RISIKOPROFIL-QUIZ';

  @override
  String get quizProfile_resultTitle => 'DEIN PROFIL IST';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEALE INVESTITIONEN:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'INVESTITIONEN ENTDECKEN';

  @override
  String get quizProfile_exit => 'BEENDEN';

  @override
  String get quizKnowledge_title => 'Wissensquiz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Frage $current von $total';
  }
}

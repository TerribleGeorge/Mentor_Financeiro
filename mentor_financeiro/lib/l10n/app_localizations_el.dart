// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Υπόλοιπο';

  @override
  String get gastosDiarios => 'Ημερήσια Έξοδα';

  @override
  String get confirmarTransacao => 'Επιβεβαίωση συναλλαγής\nΔήλωση';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Μεταγραφές';

  @override
  String get investimentos => 'Επενδύσεις';

  @override
  String get configuracoes => 'Ρυθμίσεις\nΠροφίλ';

  @override
  String get perfil => '';

  @override
  String get sair => 'Αποσύνδεση';

  @override
  String get entrar => 'Είσοδος';

  @override
  String get cadastrar => 'Εγγραφή';

  @override
  String get email => 'Email';

  @override
  String get senha => 'Κωδικός πρόσβασης';

  @override
  String get nome => 'Όνομα';

  @override
  String get cpf => 'Αριθμός Ταυτότητας';

  @override
  String get telefone => 'Τηλέφωνο';

  @override
  String get continuar => 'Συνέχεια';

  @override
  String get voltar => 'Πίσω';

  @override
  String get cancelar => 'Ακύρωση';

  @override
  String get salvar => 'Αποθήκευση';

  @override
  String get editar => 'Επεξεργασία';

  @override
  String get excluir => 'Διαγραφή';

  @override
  String get sucesso => 'Επιτυχία';

  @override
  String get erro => 'Σφάλμα';

  @override
  String get carregando => 'Φόρτωση...';

  @override
  String get semDados => 'Δεν υπάρχουν δεδομένα';

  @override
  String get tentarNovamente => 'Δοκιμάστε ξανά\nΑναφορές';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'Έξοδα ανά Κατηγορία';

  @override
  String get ultimosSeteDias => 'Τελευταίες 7 ημέρες';

  @override
  String get totalGasto => 'Σύνολο δαπανών';

  @override
  String get transacoes => 'Συναλλαγές\nΚατηγορία';

  @override
  String get categoria => '';

  @override
  String get data => 'Ημερομηνία';

  @override
  String get valor => 'Τιμή';

  @override
  String get descricao => 'Περιγραφή';

  @override
  String get alimentacao => 'Φαγητό';

  @override
  String get transporte => 'Μεταφορές';

  @override
  String get lazer => 'Αναψυχή';

  @override
  String get saude => 'Υγεία';

  @override
  String get outros => 'Άλλα';

  @override
  String get notificacoes => 'Ειδοποιήσεις';

  @override
  String get permissaoNotificacoes => 'Άδεια ειδοποίησης';

  @override
  String get ativarMonitoramento => 'Ενεργοποίηση παρακολούθησης δαπανών';

  @override
  String get descricaoMonitoramento =>
      'Επιτρέψτε στην εφαρμογή να παρακολουθεί αυτόματα τις τραπεζικές σας συναλλαγές για να οργανώσει τα οικονομικά σας.';

  @override
  String get idioma => 'Γλώσσα';

  @override
  String get moeda => 'Νόμισμα';

  @override
  String get compararInvestimentos => 'Συγκρίνετε Επενδύσεις';

  @override
  String get descricaoLocalizacao =>
      'Για να συγκρίνουμε τις τοπικές επενδύσεις (CDB/CDI) με τις διεθνείς τιμές, χρειαζόμαστε την τοποθεσία σας.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Απαιτείται άδεια τοποθεσίας';

  @override
  String get rendaFixa => 'Σταθερό Εισόδημα';

  @override
  String get rendaVariavel => 'Μεταβλητό εισόδημα';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Μετοχές';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Κρυπτονομίσματα';

  @override
  String get rendimento => 'Επιστροφή';

  @override
  String get rentabilidade => 'Κερδοφορία';

  @override
  String get aplicar => 'Αίτηση';

  @override
  String get resgatar => 'Εξαργύρωση';

  @override
  String get simular => 'Προσομοίωση';

  @override
  String get metas => 'Γκολ';

  @override
  String get estrategias => '';

  @override
  String get conhecimento => 'Γνώση';

  @override
  String get chat => 'Συνομιλία';

  @override
  String get enviarMensagem => 'Αποστολή μηνύματος';

  @override
  String get digiteMensagem => 'Πληκτρολογήστε ένα μήνυμα...';

  @override
  String get alertaGastos => 'Ειδοποίηση δαπανών';

  @override
  String alertaGastosMsg(int percent) {
    return 'Χρησιμοποιήσατε ήδη το $percent% του πιστωτικού σας ορίου.';
  }

  @override
  String get fechamentoFatura => 'Κλείσιμο Τιμολογίου';

  @override
  String get fechamentoFaturaMsg =>
      'Αύριο κλείνει. Καλή στιγμή για να αναθεωρήσετε τα έξοδα.';

  @override
  String get faturaVencendo => 'Οφειλόμενο τιμολόγιο';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Τιμολόγιο λήξης σε $dias ημέρες. Ελέγξτε το υπόλοιπό σας.';
  }

  @override
  String get regra30 => 'Συμβουλή: Κανόνας 30%.';

  @override
  String get regra30Msg =>
      'Διατηρήστε τη χρήση κάτω από το 30% για να βελτιώσετε το πιστωτικό σας σκορ.';

  @override
  String get diaDeOuro => 'Χρυσή Μέρα!';

  @override
  String get diaDeOuroMsg =>
      'Οι αγορές σας σήμερα θα πληρωθούν μόνο σε 40 ημέρες!';

  @override
  String get alertaJuros => 'Προειδοποίηση: Ενδιαφέρον';

  @override
  String get alertaJurosMsg =>
      'Το υπόλοιπό σας δεν καλύπτει τον λογαριασμό. Αποφύγετε την ανακυκλούμενη πίστωση!';

  @override
  String get notaSaude => 'Οικονομική υγεία';

  @override
  String get notaExcelente => 'Εξαιρετικό! Έχετε μεγάλη οικονομική υγεία.';

  @override
  String get notaBom => 'Καλό, αλλά μπορεί να βελτιωθεί.';

  @override
  String get notaAtencao => 'Προσοχή στις δαπάνες.';

  @override
  String get notaRevisar => 'Ελέγξτε τα οικονομικά σας.';

  @override
  String get mentorInsightTitle => 'Καθοδήγηση μέντορα';

  @override
  String get mentorInsightLoading => 'Ανάκτηση δεδομένων αγοράς…';

  @override
  String get mentorInsightError =>
      'Δεν ήταν δυνατή η φόρτωση δεδομένων αυτήν τη στιγμή. Προσπαθήστε ξανά σύντομα.';

  @override
  String get mentorInsightOffline =>
      'Είστε εκτός σύνδεσης. Συνδεθείτε για να λάβετε εισαγωγικά και insights Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Δεδομένης της τρέχουσας αστάθειας, δώστε προτεραιότητα στη διατήρηση κεφαλαίου και στη ρευστότητα πριν κυνηγήσετε τις αποδόσεις.';

  @override
  String get mentorAllocationBalanced =>
      'Ισορροπήστε προστασία και ανάπτυξη: διαφοροποιήστε και επανεξετάστε τον ορίζοντα των στόχων σας.';

  @override
  String get mentorAllocationOffensive =>
      'Το προφίλ σας επιτρέπει περισσότερους κινδύνους: παραμείνετε πειθαρχημένοι και αποφύγετε τη μεγάλη συγκέντρωση.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Σύμβολα που εξετάστηκαν: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Αυτόματο (γλώσσα)';

  @override
  String get compoundCalculatorTitle => 'Υπολογιστής Mentor — Σύνθετος τόκος';

  @override
  String get compoundCalculatorSubtitle =>
      'Προσομοίωση συνεισφορών, ονομαστικού έναντι πραγματικού κέρδους (μετά τον πληθωρισμό) και σημειώσεων καθοδηγητή.';

  @override
  String get compoundInitialLabel => 'Αρχικό εφάπαξ';

  @override
  String get compoundMonthlyLabel => 'Μηνιαία συνεισφορά';

  @override
  String get compoundRateLabel => 'Επιτόκιο';

  @override
  String get compoundRateAnnual => 'το χρόνο';

  @override
  String get compoundRateMonthly => 'το μήνα';

  @override
  String get compoundHorizonLabel => 'Χρονικός ορίζοντας';

  @override
  String get compoundHorizonYears => 'χρόνια';

  @override
  String get compoundHorizonMonths => 'μήνες';

  @override
  String get compoundInflationLabel => 'Εκτιμώμενος πληθωρισμός (% ανά έτος)';

  @override
  String get compoundCalculate => 'Υπολογίστε';

  @override
  String get compoundChartInvested => 'Σύνολο επενδύσεων';

  @override
  String get compoundChartInterest => 'Κερδισμένοι τόκοι';

  @override
  String get compoundSummaryNominalEnd => 'Τελικό υπόλοιπο (ονομαστικό)';

  @override
  String get compoundSummaryRealGain => 'Πραγματικό κέρδος (αγοραστική δύναμη)';

  @override
  String get compoundMentorCardTitle => 'Συμβουλές μέντορα';

  @override
  String get compoundInvalidInput =>
      'Εισαγάγετε έγκυρες τιμές (ορίζοντας > 0).';

  @override
  String get userPersonaSectionTitle => 'Ήχος μέντορα';

  @override
  String get userPersonaNovice => 'Αρχάριος';

  @override
  String get userPersonaStrategist => 'Στρατηγός';

  @override
  String get userPersonaRiskTaker => 'Ρίσκο';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Ανοίξτε την πλήρη εικόνα του μέντορα';

  @override
  String get investFirstSteps_title => 'Πρώτα βήματα';

  @override
  String get investFirstSteps_brokerTitle => 'Επιλέξτε μεσίτη';

  @override
  String get investFirstSteps_brokerBody =>
      'Αναζητήστε ελεγχόμενα, αξιόπιστα ιδρύματα. Συγκρίνετε χρεώσεις, προϊόντα και αξιοπιστία πριν ανοίξετε έναν λογαριασμό.';

  @override
  String get investFirstSteps_openAccountTitle => 'Ανοίξτε τον λογαριασμό σας';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Ψηφιακή ενσωμάτωση. Στη Βραζιλία, χρειάζεστε συνήθως CPF/RG και μερικές φορές απόδειξη διεύθυνσης.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Η ψηφιακή ενσωμάτωση διαφέρει ανάλογα με τη χώρα. Συνήθως χρειάζεστε ένα έγγραφο ταυτότητας και επαλήθευση ταυτότητας/διεύθυνσης.';

  @override
  String get investFirstSteps_transferTitle => 'Μεταφορά κεφαλαίων';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Στείλτε χρήματα μέσω PIX ή τραπεζικής μεταφοράς στον μεσίτη σας. Το υπόλοιπο διατίθεται για επένδυση.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Μεταφέρετε χρήματα μέσω τραπεζικής μεταφοράς ή τοπικών τρόπων πληρωμής (εξαρτάται από τη χώρα σας). Το υπόλοιπο διατίθεται για επένδυση.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Γνωρίστε το προφίλ κινδύνου σας';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Απαντήστε σε ένα ερωτηματολόγιο καταλληλότητας. Καταλάβετε αν είστε συντηρητικός, μέτριος ή επιθετικός.';

  @override
  String get investFirstSteps_firstAssetTitle =>
      'Αγοράστε το πρώτο σας περιουσιακό στοιχείο';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Ξεκινήστε με ένα ταμείο έκτακτης ανάγκης (Tesouro Selic ή CDB ημερήσιας ρευστότητας). Στη συνέχεια διαφοροποιήστε σταδιακά.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Ξεκινήστε με ένα ταμείο έκτακτης ανάγκης (μετρητά υψηλής απόδοσης, κεφάλαια χρηματαγοράς ή βραχυπρόθεσμα ομόλογα του Δημοσίου). Στη συνέχεια διαφοροποιήστε σταδιακά.\nΣυμβουλή για μέντορα';

  @override
  String get investFirstSteps_tipTitle => ':';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Ξεκινήστε από μικρά, επενδύστε με συνέπεια και αποφύγετε να προσπαθήσετε να χρονομετρήσετε την αγορά. Ο χρόνος είναι ο καλύτερος σύμμαχός σου.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Ξεκινήστε από μικρά, επενδύστε με συνέπεια και αποφύγετε να προσπαθήσετε να χρονομετρήσετε την αγορά. Ο χρόνος είναι ο καλύτερος σύμμαχός σου.';

  @override
  String get investMenu_tesouroTitle => 'βραζιλιάνικα ομόλογα';

  @override
  String get investMenu_cdbTitle => 'Τράπεζα σταθερού εισοδήματος (CDB)';

  @override
  String get investMenu_etfsTitle => 'Διεθνή ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (ευρετήριο)';

  @override
  String get investMenu_stocksTitle => 'Μετοχές';

  @override
  String get investMenu_fundsTitle => 'Κεφάλαια';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REIT';

  @override
  String get investMenu_internationalTitle => 'Διεθνές';

  @override
  String get investMenu_cryptoTitle => 'Κρυπτ';

  @override
  String get investRegisterCta => 'Καταχωρίστε την επένδυση';

  @override
  String investRegionHintBr(String country) {
    return 'Αποτελεσματική χώρα: $country · Κατάλογος Βραζιλίας (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Πραγματική χώρα: $country · Παγκόσμιος κατάλογος (ETF, NYSE/NASDAQ…). Προσαρμόζεται αυτόματα από την περιοχή της συσκευής σας.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Βασικές στρατηγικές';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Ταμείο έκτακτης ανάγκης';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Η οικονομική σας ασπίδα. Κάλυψη εξόδων 6–12 μηνών. Δώστε προτεραιότητα στην καθημερινή ρευστότητα και τον χαμηλό κίνδυνο (π.χ. Tesouro Selic ή CDB που συνδέεται με CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Η οικονομική σας ασπίδα. Κάλυψη εξόδων 6–12 μηνών. Δώστε προτεραιότητα στην καθημερινή ρευστότητα και τον χαμηλό κίνδυνο (π.χ. κεφάλαια χρηματαγοράς και βραχυπρόθεσμα ομόλογα του Δημοσίου).';

  @override
  String get strategy_buyHoldTitle => 'Αγορά και κράτημα';

  @override
  String get strategy_buyHoldBody =>
      'Αγοράστε ποιοτικά περιουσιακά στοιχεία και κρατήστε τα μακροπρόθεσμα. Επικεντρωθείτε στην πειθαρχία, την ποιότητα και την επανεπένδυση με την πάροδο του χρόνου.';

  @override
  String get strategy_diversificationTitle => 'Διαφοροποίηση';

  @override
  String get strategy_diversificationBodyBr =>
      'Διανείμετε το κεφάλαιό σας σε σταθερό εισόδημα, μετοχές, FII και διεθνή περιουσιακά στοιχεία για να μειώσετε τον κίνδυνο και να βελτιώσετε τις αποδόσεις προσαρμοσμένες στον κίνδυνο.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Διανείμετε το κεφάλαιό σας σε ομόλογα, μετοχές, REITs και διεθνή έκθεση για να μειώσετε τον κίνδυνο και να βελτιώσετε τις αποδόσεις προσαρμοσμένες στον κίνδυνο.';

  @override
  String get strategy_dcaTitle => 'Μέσος όρος κόστους δολαρίου (DCA)';

  @override
  String get strategy_dcaBody =>
      'Η συνέπεια ξεπερνά την ιδιοφυΐα. Η επένδυση κάθε μήνα είναι συχνά πιο αποτελεσματική από την προσπάθεια να επιλέξετε το τέλειο σημείο εισόδου.';

  @override
  String get strategy_smartGoalsTitle => 'SMART γκολ';

  @override
  String get strategy_smartGoalsBody =>
      'Οι στόχοι σας πρέπει να είναι συγκεκριμένοι, μετρήσιμοι, επιτεύξιμοι, σχετικοί και χρονικά περιορισμένοι.\nΚανόνας';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Ένα απλό πλαίσιο προϋπολογισμού: 50% ανάγκες, 30% επιθυμίες, 20% επενδύσεις και στόχοι.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Κατανομή περιουσιακών στοιχείων (σύνθετη)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Μάθετε πώς να δημιουργείτε μια κατανομή ανά στόχο και ορίζοντα, προσαρμόζοντας τον κίνδυνο, τη συσχέτιση και την επανεξισορρόπηση.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Παγκόσμια ETF και δείκτες (για προχωρημένους)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Μάθετε για τους παγκόσμιους δείκτες (π.χ. S&P 500), τα ETF και πώς να δημιουργήσετε διεθνή έκθεση με πειθαρχία.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Φόροι και αναφορές (προχωρημένες)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Κατανοήστε τις βασικές φορολογικές έννοιες και πώς να τηρείτε αρχεία για να αναφέρετε τις επενδύσεις με ασφάλεια.';

  @override
  String get strategy_premiumLockedBody =>
      'Περιεχόμενο premium. Ενεργοποιήστε ένα θέμα Cyber/Grimm/Hive για να ξεκλειδώσετε την επένδυση Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Βιτρίνα';

  @override
  String get homeShowcaseProfileSimTitle => 'Κουίζ προφίλ κινδύνου';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Βρείτε το προφίλ επενδυτή σας σε λίγα λεπτά.';

  @override
  String get homeShowcaseStrategiesTitle => 'Προτεινόμενες στρατηγικές';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Άμεσες συντομεύσεις για εκμάθηση και εφαρμογή στρατηγικών.';

  @override
  String get homeShowcaseMentorHubTitle => 'Μέντορας: Κουίζ & Στρατηγικές';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Γρήγορη πρόσβαση στο κουίζ προφίλ κινδύνου και στις προτεινόμενες στρατηγικές.';

  @override
  String get homeTourStepClassicTitle => 'Κλασική λειτουργία';

  @override
  String get homeTourStepClassicBody =>
      'Ανοίγει τον αρχικό πίνακα εφαρμογών: συναλλαγές, στόχοι, επενδύσεις και ρυθμίσεις στη γνωστή διάταξη.';

  @override
  String get homeTourStepVitrineTitle => 'Περιοχή βιτρίνας';

  @override
  String get homeTourStepVitrineBody =>
      'Συντομεύσεις για μάθηση και εξάσκηση: προφίλ επενδυτών, στρατηγικές και το κέντρο Mentor.\nΚουίζ για το προφίλ';

  @override
  String get homeTourStepProfileTitle => '';

  @override
  String get homeTourStepProfileBody =>
      'Απαντήστε στο ερωτηματολόγιο για να ανακαλύψετε το προφίλ κινδύνου σας και να δείτε ευθυγραμμισμένες προτάσεις.\nΣτρατηγικές';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Περιεχόμενο για οργάνωση οικονομικών, επενδύσεις με πειθαρχία και αποφυγή κοινών παγίδων.';

  @override
  String get homeTourStepHubTitle => 'Κόμβος μέντορα';

  @override
  String get homeTourStepHubBody =>
      'Γρήγορο μενού για το κουίζ προφίλ και προτεινόμενες στρατηγικές.';

  @override
  String get homeTourStepPremiumTitle => 'Premium χαρακτηριστικά';

  @override
  String get homeTourStepPremiumBody =>
      'Αυτόματη καθοδήγηση, προηγμένα γραφήματα και μηνιαίες αναφορές — διαθέσιμα με συνδρομή Premium.\nΣτιγμιότυπο αγοράς';

  @override
  String get homeTourStepMarketTitle => '';

  @override
  String get homeTourStepMarketBody =>
      'Πλαίσιο αγοράς (Βραζιλία ή παγκόσμιο) με βάση την περιοχή σας συν τη μετατροπή της καθαρής θέσης.';

  @override
  String get homeTourStepCalculatorTitle => 'Αριθμομηχανή Mentor';

  @override
  String get homeTourStepCalculatorBody =>
      'Προσομοίωση ανατοκισμού, πληθωρισμού και δείτε το διάγραμμα πλούτου. στη συνέχεια ανοίγουμε αυτό το εργαλείο.';

  @override
  String get quizProfile_title => 'Κουίζ προφίλ κινδύνου';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Ερώτηση $current από $total\nΚΟΥΙΖ';
  }

  @override
  String get quizProfile_badge => 'RISK PROFILE';

  @override
  String get quizProfile_resultTitle => 'ΤΟ ΠΡΟΦΙΛ ΣΑΣ ΕΙΝΑΙ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEAL ΕΠΕΝΔΥΣΕΙΣ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ΕΞΕΡΕΥΝΗΣΤΕ ΕΠΕΝΔΥΣΕΙΣ';

  @override
  String get quizProfile_exit => 'ΕΞΟΔΟΣ';

  @override
  String get quizKnowledge_title => 'Κουίζ γνώσεων';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Ερώτηση $current από $total';
  }
}

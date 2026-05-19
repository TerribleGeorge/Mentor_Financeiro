// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Solde';

  @override
  String get gastosDiarios => 'Dépenses quotidiennes';

  @override
  String get confirmarTransacao => 'Confirmer la transaction\nDéclaration';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Transferts';

  @override
  String get investimentos => 'Investissements';

  @override
  String get configuracoes => 'Paramètres\nProfil';

  @override
  String get perfil => '';

  @override
  String get sair => 'Déconnexion';

  @override
  String get entrar => 'Connexion';

  @override
  String get cadastrar => 'S\'inscrire';

  @override
  String get email => 'E-mail';

  @override
  String get senha => 'Mot de passe';

  @override
  String get nome => 'Nom';

  @override
  String get cpf => 'Numéro d’identification';

  @override
  String get telefone => 'Téléphone';

  @override
  String get continuar => 'Continuer';

  @override
  String get voltar => 'Retour';

  @override
  String get cancelar => 'Annuler';

  @override
  String get salvar => 'Enregistrer';

  @override
  String get editar => 'Modifier';

  @override
  String get excluir => 'Supprimer';

  @override
  String get sucesso => 'Succès\nErreur';

  @override
  String get erro => '';

  @override
  String get carregando => 'Chargement...';

  @override
  String get semDados => 'Aucune donnée';

  @override
  String get tentarNovamente => 'Réessayez';

  @override
  String get relatorios => 'Rapports';

  @override
  String get gastosPorCategoria => 'Dépenses par catégorie';

  @override
  String get ultimosSeteDias => '7 derniers jours';

  @override
  String get totalGasto => 'Total dépensé';

  @override
  String get transacoes => 'Transactions';

  @override
  String get categoria => 'Catégorie';

  @override
  String get data => 'Date';

  @override
  String get valor => 'Valeur';

  @override
  String get descricao => 'descriptif';

  @override
  String get alimentacao => 'Alimentation';

  @override
  String get transporte => 'Transports';

  @override
  String get lazer => 'Loisirs';

  @override
  String get saude => 'Santé';

  @override
  String get outros => 'Autres';

  @override
  String get notificacoes => 'Notifications';

  @override
  String get permissaoNotificacoes => 'Autorisation de notification';

  @override
  String get ativarMonitoramento => 'Activer le suivi des dépenses';

  @override
  String get descricaoMonitoramento =>
      'Autorisez l\'application à surveiller automatiquement vos transactions bancaires pour organiser vos finances.';

  @override
  String get idioma => 'Langue';

  @override
  String get moeda => 'Devise';

  @override
  String get compararInvestimentos => 'Comparer les investissements';

  @override
  String get descricaoLocalizacao =>
      'Pour comparer les investissements locaux (CDB/CDI) avec les tarifs internationaux, nous avons besoin de votre localisation.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Autorisation de localisation requise';

  @override
  String get rendaFixa => 'Revenu fixe';

  @override
  String get rendaVariavel => 'Revenu variable';

  @override
  String get tesouroDireto => 'Trésor Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Actions';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Crypto-monnaies';

  @override
  String get rendimento => 'Retour';

  @override
  String get rentabilidade => 'Rentabilité';

  @override
  String get aplicar => 'Appliquer';

  @override
  String get resgatar => 'Échanger';

  @override
  String get simular => 'Simuler';

  @override
  String get metas => 'Objectifs';

  @override
  String get estrategias => 'Stratégies';

  @override
  String get conhecimento => 'Connaissance\nBavarder';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Envoyer un message';

  @override
  String get digiteMensagem => 'Tapez un message...';

  @override
  String get alertaGastos => 'Alerte de dépenses';

  @override
  String alertaGastosMsg(int percent) {
    return 'Vous avez déjà utilisé $percent % de votre limite de crédit.';
  }

  @override
  String get fechamentoFatura => 'Clôture de facture';

  @override
  String get fechamentoFaturaMsg =>
      'Demain c\'est jour de fermeture. C’est le moment idéal pour revoir les dépenses.';

  @override
  String get faturaVencendo => 'Facture due';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Facture due dans $dias jour(s). Vérifiez votre solde.';
  }

  @override
  String get regra30 => 'Astuce : Règle des 30 %';

  @override
  String get regra30Msg =>
      'Maintenez l\'utilisation en dessous de 30 % pour améliorer votre pointage de crédit.';

  @override
  String get diaDeOuro => 'Journée d\'or !';

  @override
  String get diaDeOuroMsg =>
      'Vos achats d\'aujourd\'hui ne seront payés que dans 40 jours !';

  @override
  String get alertaJuros => 'Avertissement : Intérêt';

  @override
  String get alertaJurosMsg =>
      'Votre solde ne couvre pas la facture. Évitez le crédit renouvelable !';

  @override
  String get notaSaude => 'Santé financière';

  @override
  String get notaExcelente =>
      'Excellent ! Vous avez une excellente santé financière.';

  @override
  String get notaBom => 'Bon, mais peut s\'améliorer.';

  @override
  String get notaAtencao => 'Attention aux dépenses.';

  @override
  String get notaRevisar => 'Révisez vos finances.';

  @override
  String get mentorInsightTitle => 'Conseils du mentor';

  @override
  String get mentorInsightLoading => 'Récupération des données de marché…';

  @override
  String get mentorInsightError =>
      'Impossible de charger les données pour le moment. Réessayez sous peu.';

  @override
  String get mentorInsightOffline =>
      'Vous êtes hors ligne. Connectez-vous pour récupérer des devis et des informations sur le mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Compte tenu de la volatilité actuelle, donnez la priorité à la préservation du capital et à la liquidité avant de rechercher des rendements.';

  @override
  String get mentorAllocationBalanced =>
      'Équilibrez protection et croissance : diversifiez et revisitez votre horizon d\'objectifs.';

  @override
  String get mentorAllocationOffensive =>
      'Votre profil permet plus de risque : restez discipliné et évitez les fortes concentrations.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Symboles examinés : $symbols';
  }

  @override
  String get currencyFollowLocale =>
      'Automatique (langue)\nCalculatrice de mentor';

  @override
  String get compoundCalculatorTitle => '— Intérêts composés';

  @override
  String get compoundCalculatorSubtitle =>
      'Simulez les cotisations, le gain nominal par rapport au gain réel (après inflation) et les notes du mentor.';

  @override
  String get compoundInitialLabel => 'Montant forfaitaire initial';

  @override
  String get compoundMonthlyLabel => 'Cotisation mensuelle';

  @override
  String get compoundRateLabel => 'Taux d’intérêt';

  @override
  String get compoundRateAnnual => 'par an';

  @override
  String get compoundRateMonthly => 'par mois';

  @override
  String get compoundHorizonLabel => 'Horizon temporel';

  @override
  String get compoundHorizonYears => 'ans';

  @override
  String get compoundHorizonMonths => 'mois';

  @override
  String get compoundInflationLabel => 'Inflation estimée (% par an)';

  @override
  String get compoundCalculate => 'Calculer';

  @override
  String get compoundChartInvested => 'Total investi';

  @override
  String get compoundChartInterest => 'Intérêts gagnés';

  @override
  String get compoundSummaryNominalEnd => 'Solde final (nominal)';

  @override
  String get compoundSummaryRealGain => 'Gain réel (pouvoir d’achat)';

  @override
  String get compoundMentorCardTitle => 'Conseils du mentor';

  @override
  String get compoundInvalidInput =>
      'Entrez des valeurs valides (horizon > 0).';

  @override
  String get userPersonaSectionTitle => 'Tonalité mentor';

  @override
  String get userPersonaNovice => 'Débutant';

  @override
  String get userPersonaStrategist => 'Stratège';

  @override
  String get userPersonaRiskTaker => 'Prendre des risques';

  @override
  String get userPersonaConservative => 'Économiseur';

  @override
  String get compoundOpenFullInsight => 'Ouvrir un aperçu complet du mentor';

  @override
  String get investFirstSteps_title => 'Premiers pas';

  @override
  String get investFirstSteps_brokerTitle => 'Choisissez un courtier';

  @override
  String get investFirstSteps_brokerBody =>
      'Recherchez des institutions réglementées et réputées. Comparez les frais, les produits et la fiabilité avant d\'ouvrir un compte.';

  @override
  String get investFirstSteps_openAccountTitle => 'Ouvrez votre compte';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Intégration numérique. Au Brésil, vous avez généralement besoin d\'un CPF/RG et parfois d\'un justificatif de domicile.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'L\'intégration numérique varie selon les pays. En règle générale, vous avez besoin d’une pièce d’identité et d’une vérification d’identité/adresse.';

  @override
  String get investFirstSteps_transferTitle => 'Transférer des fonds';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Envoyez de l\'argent via PIX ou par virement bancaire à votre courtier. Le solde devient disponible pour investir.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Transférez des fonds par virement bancaire ou via des méthodes de paiement locales (dépend de votre pays). Le solde devient disponible pour investir.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Connaissez votre profil de risque';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Répondez à un questionnaire d\'aptitude. Comprenez si vous êtes conservateur, modéré ou agressif.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Achetez votre premier actif';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Commencez par un fonds d\'urgence (Tesouro Selic ou un CDB à liquidité quotidienne). Puis diversifiez-vous progressivement.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Commencez par un fonds d\'urgence (liquidités à haut rendement, fonds du marché monétaire ou bons du Trésor à court terme). Puis diversifiez-vous progressivement.';

  @override
  String get investFirstSteps_tipTitle => 'Conseil de mentor :';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Commencez petit, investissez de manière cohérente et évitez d’essayer de chronométrer le marché. Le temps est votre meilleur allié.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Commencez petit, investissez de manière cohérente et évitez d’essayer de chronométrer le marché. Le temps est votre meilleur allié.';

  @override
  String get investMenu_tesouroTitle => 'Trésors brésiliens';

  @override
  String get investMenu_cdbTitle =>
      'Banque à revenu fixe (CDB)\nFNB internationaux';

  @override
  String get investMenu_etfsTitle => '';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indice)';

  @override
  String get investMenu_stocksTitle => 'Actions\nFonds';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII\nFPI';

  @override
  String get investMenu_reitsTitle => '';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Cryptomonnaie';

  @override
  String get investRegisterCta => 'Enregistrer l\'investissement';

  @override
  String investRegionHintBr(String country) {
    return 'Pays effectif : $country · Catalogue Brésil (Trésor, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Pays effectif : $country · Catalogue mondial (ETF, NYSE/NASDAQ…). Ajusté automatiquement à partir de la région de votre appareil.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Stratégies essentielles';

  @override
  String get strategy_sectionDeepDiveTitle => 'Plongée profonde (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Fonds d\'urgence';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Votre bouclier financier. Couvrez 6 à 12 mois de dépenses. Donnez la priorité à la liquidité quotidienne et à un faible risque (par exemple, Tesouro Selic ou CDB lié au CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Votre bouclier financier. Couvrez 6 à 12 mois de dépenses. Donnez la priorité à la liquidité quotidienne et à un faible risque (par exemple, les fonds du marché monétaire et les bons du Trésor à court terme).';

  @override
  String get strategy_buyHoldTitle => 'Acheter et conserver';

  @override
  String get strategy_buyHoldBody =>
      'Achetez des actifs de qualité et conservez-les sur le long terme. Concentrez-vous sur la discipline, la qualité et le réinvestissement au fil du temps.';

  @override
  String get strategy_diversificationTitle => 'Diversification';

  @override
  String get strategy_diversificationBodyBr =>
      'Répartissez votre capital entre titres à revenu fixe, actions, FII et actifs internationaux pour réduire les risques et améliorer les rendements ajustés au risque.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Répartissez votre capital entre obligations, actions, REIT et exposition internationale pour réduire le risque et améliorer les rendements ajustés au risque.';

  @override
  String get strategy_dcaTitle =>
      'Calculs périodiques des coûts en dollars (DCA)';

  @override
  String get strategy_dcaBody =>
      'La cohérence bat le génie. Investir chaque mois est souvent plus efficace que d’essayer de choisir le point d’entrée idéal.';

  @override
  String get strategy_smartGoalsTitle => 'Objectifs SMART';

  @override
  String get strategy_smartGoalsBody =>
      'Vos objectifs doivent être spécifiques, mesurables, réalisables, pertinents et limités dans le temps.';

  @override
  String get strategy_503020Title => 'Règle 50-30-20';

  @override
  String get strategy_503020Body =>
      'Un cadre de budgétisation simple : 50 % de besoins, 30 % de désirs, 20 % d\'investissement et d\'objectifs.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Allocation d\'actifs (avancé)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Apprenez à construire une allocation par objectif et horizon, en ajustant le risque, la corrélation et le rééquilibrage.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETF et indices mondiaux (avancé)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Découvrez les indices mondiaux (par exemple, S&P 500), les ETF et comment créer une exposition internationale avec discipline.';

  @override
  String get strategy_deepDive_taxesTitle => 'Taxes et rapports (avancé)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Comprendre les concepts fiscaux de base et comment tenir des registres pour déclarer les investissements en toute sécurité.';

  @override
  String get strategy_premiumLockedBody =>
      'Contenu premium. Activez un thème Cyber/Grimm/Hive pour débloquer l\'investissement Deep Dive.\nVitrine';

  @override
  String get homeShowcaseTitle => '';

  @override
  String get homeShowcaseProfileSimTitle => 'Quiz sur le profil de risque';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Trouvez votre profil d\'investisseur en quelques minutes.';

  @override
  String get homeShowcaseStrategiesTitle => 'Stratégies recommandées';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Raccourcis directs pour apprendre et appliquer des stratégies.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor : Quiz et stratégies';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Accès rapide au quiz sur le profil de risque et aux stratégies recommandées.';

  @override
  String get homeTourStepClassicTitle => 'Mode classique';

  @override
  String get homeTourStepClassicBody =>
      'Ouvre le panneau d\'application d\'origine : transactions, objectifs, investissements et paramètres dans la présentation familière.';

  @override
  String get homeTourStepVitrineTitle => 'Espace vitrine';

  @override
  String get homeTourStepVitrineBody =>
      'Raccourcis pour apprendre et s\'entraîner : profil d\'investisseur, stratégies et hub Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Quiz de profil';

  @override
  String get homeTourStepProfileBody =>
      'Répondez au questionnaire pour découvrir votre profil de risque et voir des suggestions alignées.\nStratégies';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Contenu pour organiser ses finances, investir avec discipline et éviter les pièges courants.';

  @override
  String get homeTourStepHubTitle => 'Centre de mentorat';

  @override
  String get homeTourStepHubBody =>
      'Menu rapide vers le quiz de profil et les stratégies recommandées.';

  @override
  String get homeTourStepPremiumTitle => 'Fonctionnalités Premium';

  @override
  String get homeTourStepPremiumBody =>
      'Mentorat automatique, graphiques avancés et rapports mensuels — disponibles avec un abonnement Premium.';

  @override
  String get homeTourStepMarketTitle => 'Aperçu du marché';

  @override
  String get homeTourStepMarketBody =>
      'Contexte du marché (Brésil ou mondial) en fonction de votre région et de la valeur nette convertie.';

  @override
  String get homeTourStepCalculatorTitle => 'Calculatrice de mentor';

  @override
  String get homeTourStepCalculatorBody =>
      'Simulez les intérêts composés, l\'inflation et consultez le tableau de richesse ; Ensuite, nous ouvrons cet outil.';

  @override
  String get quizProfile_title => 'Quiz sur le profil de risque';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Question $current de $total\nQUIZ SUR LE PROFIL DE RISQUE';
  }

  @override
  String get quizProfile_badge => '';

  @override
  String get quizProfile_resultTitle => 'VOTRE PROFIL EST';

  @override
  String get quizProfile_idealInvestmentsTitle => 'INVESTISSEMENTS IDÉAUX :';

  @override
  String get quizProfile_exploreInvestmentsCta =>
      'EXPLOREZ LES INVESTISSEMENTS';

  @override
  String get quizProfile_exit => 'SORTIE';

  @override
  String get quizKnowledge_title => 'Quiz de connaissances';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Question $current de $total';
  }
}

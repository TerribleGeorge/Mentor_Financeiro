// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AppLocalizationsHy extends AppLocalizations {
  AppLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'մնացորդ';

  @override
  String get gastosDiarios => 'Օրական ծախսեր';

  @override
  String get confirmarTransacao => 'Հաստատեք գործարքը';

  @override
  String get extrato => 'հայտարարություն';

  @override
  String get transferencias => 'փոխանցումներ';

  @override
  String get investimentos => 'Ներդրումներ';

  @override
  String get configuracoes => 'Կարգավորումներ';

  @override
  String get perfil => 'Անձնագիր';

  @override
  String get sair => 'Դուրս գալ';

  @override
  String get entrar => 'Մուտք';

  @override
  String get cadastrar => 'Գրանցվել';

  @override
  String get email => 'Էլ';

  @override
  String get senha => 'Գաղտնաբառ';

  @override
  String get nome => 'Անուն';

  @override
  String get cpf => 'ID համարը';

  @override
  String get telefone => 'Հեռախոս';

  @override
  String get continuar => 'Շարունակել';

  @override
  String get voltar => 'Հետ';

  @override
  String get cancelar => 'Չեղարկել';

  @override
  String get salvar => 'Պահպանել';

  @override
  String get editar => 'Խմբագրել';

  @override
  String get excluir => 'Ջնջել';

  @override
  String get sucesso => 'Հաջողություն';

  @override
  String get erro => 'Սխալ';

  @override
  String get carregando => 'Բեռնվում է...';

  @override
  String get semDados => 'Տվյալներ չկան';

  @override
  String get tentarNovamente => 'Փորձեք նորից';

  @override
  String get relatorios => 'Հաշվետվություններ';

  @override
  String get gastosPorCategoria => 'Ծախսեր ըստ կատեգորիաների';

  @override
  String get ultimosSeteDias => 'Վերջին 7 օրը';

  @override
  String get totalGasto => 'Ընդհանուր ծախսված';

  @override
  String get transacoes => 'Գործարքներ';

  @override
  String get categoria => 'Կարգավիճակ';

  @override
  String get data => 'Ամսաթիվ';

  @override
  String get valor => 'Արժեք';

  @override
  String get descricao => 'Նկարագրություն';

  @override
  String get alimentacao => 'Սնունդ';

  @override
  String get transporte => 'Տրանսպորտ';

  @override
  String get lazer => 'Ժամանց';

  @override
  String get saude => 'Առողջություն';

  @override
  String get outros => 'Այլ';

  @override
  String get notificacoes => 'Ծանուցումներ';

  @override
  String get permissaoNotificacoes => 'Ծանուցման թույլտվություն';

  @override
  String get ativarMonitoramento => 'Միացնել ծախսերի մոնիտորինգը';

  @override
  String get descricaoMonitoramento =>
      'Թույլ տվեք հավելվածին ավտոմատ կերպով վերահսկել ձեր բանկային գործարքները՝ ձեր ֆինանսները կազմակերպելու համար:';

  @override
  String get idioma => 'Լեզու';

  @override
  String get moeda => 'Արժույթ';

  @override
  String get compararInvestimentos => 'Համեմատեք ներդրումները';

  @override
  String get descricaoLocalizacao =>
      'Տեղական ներդրումները (CDB/CDI) միջազգային դրույքաչափերի հետ համեմատելու համար մեզ անհրաժեշտ է ձեր գտնվելու վայրը:';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Տեղադրության թույլտվությունը պահանջվում է';

  @override
  String get rendaFixa => 'Հաստատուն եկամուտ';

  @override
  String get rendaVariavel => 'Փոփոխական եկամուտ';

  @override
  String get tesouroDireto => 'գանձապետական Ուղիղ';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Բաժնետոմսեր';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Կրիպտոարժույթներ';

  @override
  String get rendimento => 'Վերադարձ';

  @override
  String get rentabilidade => 'Շահութաբերություն';

  @override
  String get aplicar => 'Դիմել';

  @override
  String get resgatar => 'Փրկեք';

  @override
  String get simular => 'Մոդելավորում';

  @override
  String get metas => 'Գոլերը';

  @override
  String get estrategias => 'ռազմավարություններ';

  @override
  String get conhecimento => 'Գիտելիք';

  @override
  String get chat => 'Զրուցարան';

  @override
  String get enviarMensagem => 'Ուղարկել հաղորդագրություն';

  @override
  String get digiteMensagem => 'Մուտքագրեք հաղորդագրություն...';

  @override
  String get alertaGastos => 'Ծախսերի ծանուցում';

  @override
  String alertaGastosMsg(int percent) {
    return 'Դուք արդեն օգտագործել եք ձեր վարկային սահմանաչափի $percent%-ը:';
  }

  @override
  String get fechamentoFatura => 'հաշիվ-ապրանքագրի փակում';

  @override
  String get fechamentoFaturaMsg =>
      'Վաղը փակվում է։ Հիանալի ժամանակ է ծախսերը վերանայելու համար:';

  @override
  String get faturaVencendo => 'Վճարված հաշիվ-ապրանքագիր';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Հաշիվը պետք է վճարվի $dias օրից: Ստուգեք ձեր հաշվեկշիռը:';
  }

  @override
  String get regra30 => 'Հուշում. 30% կանոն';

  @override
  String get regra30Msg =>
      'Պահպանեք օգտագործումը 30%-ից ցածր՝ ձեր վարկային միավորը բարելավելու համար:';

  @override
  String get diaDeOuro => 'Ոսկե օր!';

  @override
  String get diaDeOuroMsg => 'Ձեր այսօրվա գնումները կվճարվեն միայն 40 օրից:';

  @override
  String get alertaJuros => 'Զգուշացում. հետաքրքրություն';

  @override
  String get alertaJurosMsg =>
      'Ձեր մնացորդը չի ծածկում հաշիվը: Խուսափեք շրջանառվող վարկից:';

  @override
  String get notaSaude => 'Ֆինանսական առողջություն';

  @override
  String get notaExcelente =>
      'Գերազանց! Դուք հիանալի ֆինանսական առողջություն ունեք:';

  @override
  String get notaBom => 'Լավ է, բայց կարող է բարելավվել:';

  @override
  String get notaAtencao => 'Ուշադրություն ծախսերին.';

  @override
  String get notaRevisar => 'Վերանայեք ձեր ֆինանսները:';

  @override
  String get mentorInsightTitle => 'Մենթորի ուղեցույց';

  @override
  String get mentorInsightLoading => 'Շուկայական տվյալների առբերում…';

  @override
  String get mentorInsightError =>
      'Չհաջողվեց բեռնել տվյալները: Շուտով նորից փորձեք:';

  @override
  String get mentorInsightOffline =>
      'Դուք անցանց եք: Միացեք գնանշումները և մենթորի պատկերացումները ստանալու համար:';

  @override
  String get mentorAllocationDefensive =>
      'Հաշվի առնելով ընթացիկ անկայունությունը, առաջնահերթություն տվեք կապիտալի պահպանմանը և իրացվելիությանը, նախքան շահութաբերությունը հետապնդելը:';

  @override
  String get mentorAllocationBalanced =>
      'Մնացորդի պաշտպանություն և աճ. դիվերսիֆիկացրեք և վերանայեք ձեր նպատակային հորիզոնը:';

  @override
  String get mentorAllocationOffensive =>
      'Ձեր պրոֆիլը թույլ է տալիս ավելի շատ ռիսկեր. մնացեք կարգապահ և խուսափեք մեծ կենտրոնացումից:';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Նշանները վերանայվել են՝ $symbols';
  }

  @override
  String get currencyFollowLocale => 'Ավտոմատ (լեզու)';

  @override
  String get compoundCalculatorTitle => 'Մենթորի հաշվիչ — Բարդ տոկոսադրույք';

  @override
  String get compoundCalculatorSubtitle =>
      'Մոդելավորել ներդրումները, անվանական ընդդեմ իրական շահույթը (գնաճից հետո) և մենթորի նշումները:';

  @override
  String get compoundInitialLabel => 'Սկզբնական միանվագ գումար';

  @override
  String get compoundMonthlyLabel => 'Ամսական ներդրում';

  @override
  String get compoundRateLabel => 'Տոկոսադրույք';

  @override
  String get compoundRateAnnual => 'տարեկան';

  @override
  String get compoundRateMonthly => 'ամսական';

  @override
  String get compoundHorizonLabel => 'Ժամանակային հորիզոն';

  @override
  String get compoundHorizonYears => 'տարի';

  @override
  String get compoundHorizonMonths => 'ամիս';

  @override
  String get compoundInflationLabel => 'Մոտավոր գնաճ (% տարեկան)';

  @override
  String get compoundCalculate => 'Հաշվել';

  @override
  String get compoundChartInvested => 'Ընդամենը ներդրված';

  @override
  String get compoundChartInterest => 'Ստացված տոկոսներ';

  @override
  String get compoundSummaryNominalEnd => 'Վերջնական մնացորդ (անվանական)';

  @override
  String get compoundSummaryRealGain => 'Իրական շահույթ (գնողունակություն)';

  @override
  String get compoundMentorCardTitle => 'Մենթորի խորհուրդ';

  @override
  String get compoundInvalidInput => 'Մուտքագրեք վավեր արժեքներ (հորիզոն > 0):';

  @override
  String get userPersonaSectionTitle => 'Մենթորի տոն';

  @override
  String get userPersonaNovice => 'Սկսնակ';

  @override
  String get userPersonaStrategist => 'ռազմավար';

  @override
  String get userPersonaRiskTaker => 'Ռիսկի ընդունող';

  @override
  String get userPersonaConservative => 'Խնայարար';

  @override
  String get compoundOpenFullInsight => 'Բացեք մենթորի ամբողջական պատկերացում';

  @override
  String get investFirstSteps_title => 'Առաջին քայլերը';

  @override
  String get investFirstSteps_brokerTitle => 'Ընտրեք միջնորդ';

  @override
  String get investFirstSteps_brokerBody =>
      'Փնտրեք կարգավորվող, հեղինակավոր հաստատություններ: Համեմատեք վճարները, ապրանքները և հուսալիությունը հաշիվ բացելուց առաջ:';

  @override
  String get investFirstSteps_openAccountTitle => 'Բացեք ձեր հաշիվը';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Թվային միացում: Բրազիլիայում ձեզ սովորաբար անհրաժեշտ է CPF/RG և երբեմն հասցեի ապացույց:';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Թվային մուտքը տարբերվում է ըստ երկրների: Սովորաբար ձեզ անհրաժեշտ է անձը հաստատող փաստաթուղթ և ինքնության/հասցեի հաստատում:';

  @override
  String get investFirstSteps_transferTitle => 'Փոխանցել միջոցներ';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Փող ուղարկեք PIX-ի կամ բանկային փոխանցման միջոցով ձեր բրոքերին: Մնացորդը հասանելի է դառնում ներդրումների համար:';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Փոխանցել միջոցներ բանկային փոխանցման կամ տեղական վճարման եղանակների միջոցով (կախված է ձեր երկրից): Մնացորդը հասանելի է դառնում ներդրումների համար:';

  @override
  String get investFirstSteps_riskProfileTitle => 'Իմացեք ձեր ռիսկի պրոֆիլը';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Պատասխանել համապատասխանության հարցաթերթիկին: Հասկացեք՝ պահպանողական եք, չափավոր, թե ագրեսիվ։';

  @override
  String get investFirstSteps_firstAssetTitle => 'Գնեք ձեր առաջին ակտիվը';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Սկսեք շտապ օգնության ֆոնդից (Tesouro Selic կամ օրական իրացվելիության CDB): Այնուհետև աստիճանաբար դիվերսիֆիկացրեք:';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Սկսեք շտապ օգնության ֆոնդից (բարձր եկամտաբերությամբ կանխիկ, դրամական շուկայի ֆոնդեր կամ կարճաժամկետ գանձապետական ​​պարտատոմսեր): Այնուհետև աստիճանաբար դիվերսիֆիկացրեք:';

  @override
  String get investFirstSteps_tipTitle => 'Մենթորի հուշում.';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Սկսեք փոքրից, հետևողականորեն ներդնեք և խուսափեք շուկայի ժամանակի հետ կապված փորձերից: Ժամանակը ձեր լավագույն դաշնակիցն է:';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Սկսեք փոքրից, հետևողականորեն ներդնեք և խուսափեք շուկայի ժամանակի հաշվարկից: Ժամանակը ձեր լավագույն դաշնակիցն է:';

  @override
  String get investMenu_tesouroTitle => 'Բրազիլիայի գանձապետարաններ';

  @override
  String get investMenu_cdbTitle => 'Բանկի ֆիքսված եկամուտ (CDB)';

  @override
  String get investMenu_etfsTitle => 'միջազգային ETF-ներ';

  @override
  String get investMenu_sp500Title => 'S&P 500 (ինդեքս)';

  @override
  String get investMenu_stocksTitle => 'բաժնետոմսեր';

  @override
  String get investMenu_fundsTitle => 'Միջոցներ';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Միջազգային';

  @override
  String get investMenu_cryptoTitle => 'Ծպտյալ';

  @override
  String get investRegisterCta => 'Գրանցեք ներդրումները';

  @override
  String investRegionHintBr(String country) {
    return 'Արդյունավետ երկիր՝ $country · Բրազիլիա կատալոգ (գանձապետական, CDB, LCA…):';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Արդյունավետ երկիր՝ $country · Համաշխարհային կատալոգ (ETFs, NYSE/NASDAQ…): Ավտոմատ կերպով կարգավորվում է ձեր սարքի տարածաշրջանից:';
  }

  @override
  String get strategy_sectionCoreTitle => 'Հիմնական ռազմավարություններ';

  @override
  String get strategy_sectionDeepDiveTitle => 'խորը սուզում (պրեմիում)';

  @override
  String get strategy_emergencyFundTitle => 'Արտակարգ ֆոնդ';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Ձեր ֆինանսական վահանը: 6–12 ամսվա ծախսերի ծածկում։ Առաջնահերթություն տվեք ամենօրյա իրացվելիությանը և ցածր ռիսկին (օրինակ՝ Tesouro Selic կամ CDI-ի հետ կապված CDB):';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Ձեր ֆինանսական վահանը: 6–12 ամսվա ծախսերի ծածկում։ Առաջնահերթություն տվեք ամենօրյա իրացվելիությանը և ցածր ռիսկին (օրինակ՝ դրամական շուկայի ֆոնդերը և կարճաժամկետ գանձապետական ​​պարտատոմսերը):';

  @override
  String get strategy_buyHoldTitle => 'Գնել և պահել';

  @override
  String get strategy_buyHoldBody =>
      'Գնեք որակյալ ակտիվներ և պահեք երկարաժամկետ: Կենտրոնացեք կարգապահության, որակի և ժամանակի ընթացքում վերաներդրումների վրա:';

  @override
  String get strategy_diversificationTitle => 'Դիվերսիֆիկացում';

  @override
  String get strategy_diversificationBodyBr =>
      'Տարածեք ձեր կապիտալը ֆիքսված եկամտի, բաժնետոմսերի, FII-ների և միջազգային ակտիվների վրա՝ նվազեցնելու ռիսկը և բարելավելու ռիսկի վրա ճշգրտված եկամտաբերությունը:';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Տարածեք ձեր կապիտալը պարտատոմսերի, բաժնետոմսերի, REIT-ների և միջազգային ազդեցության վրա՝ նվազեցնելու ռիսկը և բարելավելու ռիսկի վրա ճշգրտված եկամտաբերությունը:';

  @override
  String get strategy_dcaTitle => 'Դոլար-ծախսերի միջինացում (DCA)';

  @override
  String get strategy_dcaBody =>
      'Հետևողականությունը գերազանցում է հանճարին: Ամեն ամիս ներդրումներ կատարելը հաճախ ավելի արդյունավետ է, քան կատարյալ մուտքի կետ ընտրելը:';

  @override
  String get strategy_smartGoalsTitle => 'ՍՄԱՐԹ գոլեր';

  @override
  String get strategy_smartGoalsBody =>
      'Ձեր նպատակները պետք է լինեն կոնկրետ, չափելի, հասանելի, համապատասխան և ժամանակային:';

  @override
  String get strategy_503020Title => '50-30-20 կանոն';

  @override
  String get strategy_503020Body =>
      'Պարզ բյուջետային շրջանակ. 50% կարիքներ, 30% ցանկություններ, 20% ներդրումներ և նպատակներ:';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Ակտիվների բաշխում (ընդլայնված)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Իմացեք, թե ինչպես ստեղծել բաշխում ըստ նպատակների և հորիզոնների, կարգավորելով ռիսկը, հարաբերակցությունը և վերաբալանսը:';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Համաշխարհային ETF-ներ և ինդեքսներ (ընդլայնված)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Իմացեք գլոբալ ինդեքսների (օրինակ՝ S&P 500), ETF-ների և ինչպես կարգապահությամբ ստեղծել միջազգային ճանաչում:';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Հարկեր և հաշվետվություններ (ընդլայնված)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Հասկանալ հիմնական հարկային հայեցակարգերը և ինչպես պահել գրառումները՝ ներդրումներն ապահով կերպով զեկուցելու համար:';

  @override
  String get strategy_premiumLockedBody =>
      'Պրեմիում բովանդակություն: Ակտիվացրեք Cyber/Grimm/Hive թեման՝ ներդրումային Deep Dive-ը բացելու համար:';

  @override
  String get homeShowcaseTitle => 'Ցուցափեղկ';

  @override
  String get homeShowcaseProfileSimTitle => 'Ռիսկի պրոֆիլի վիկտորինան';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Գտեք ձեր ներդրողի պրոֆիլը մի քանի րոպեում:';

  @override
  String get homeShowcaseStrategiesTitle => 'Առաջարկվող ռազմավարություններ';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Ուղղակի դյուրանցումներ՝ ռազմավարություններ սովորելու և կիրառելու համար:';

  @override
  String get homeShowcaseMentorHubTitle =>
      'Մենթոր. Վիկտորինաներ և ռազմավարություններ';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Արագ մուտք դեպի ռիսկի պրոֆիլի վիկտորինան և առաջարկվող ռազմավարություններ:';

  @override
  String get homeTourStepClassicTitle => 'Դասական ռեժիմ';

  @override
  String get homeTourStepClassicBody =>
      'Բացում է հավելվածի սկզբնական վահանակը՝ գործարքներ, նպատակներ, ներդրումներ և կարգավորումներ ծանոթ դասավորությամբ:';

  @override
  String get homeTourStepVitrineTitle => 'Ցուցափեղկի տարածք';

  @override
  String get homeTourStepVitrineBody =>
      'Դյուրանցումներ սովորելու և պրակտիկայի համար. ներդրողի պրոֆիլը, ռազմավարությունները և Mentor հանգույցը:';

  @override
  String get homeTourStepProfileTitle => 'պրոֆիլի վիկտորինան';

  @override
  String get homeTourStepProfileBody =>
      'Պատասխանեք հարցաշարին՝ ձեր ռիսկի պրոֆիլը բացահայտելու և համահունչ առաջարկները տեսնելու համար:';

  @override
  String get homeTourStepStrategiesTitle => 'ռազմավարություններ';

  @override
  String get homeTourStepStrategiesBody =>
      'Բովանդակություն՝ ֆինանսները կազմակերպելու, կարգապահորեն ներդրումներ կատարելու և ընդհանուր թակարդներից խուսափելու համար:';

  @override
  String get homeTourStepHubTitle => 'Մենթոր հանգույց';

  @override
  String get homeTourStepHubBody =>
      'Պրոֆիլի վիկտորինայի արագ ընտրացանկ և առաջարկվող ռազմավարություններ:';

  @override
  String get homeTourStepPremiumTitle => 'Պրեմիում առանձնահատկություններ';

  @override
  String get homeTourStepPremiumBody =>
      'Ավտոմատ ուսուցում, առաջադեմ գծապատկերներ և ամսական հաշվետվություններ՝ հասանելի Պրեմիում բաժանորդագրությամբ:';

  @override
  String get homeTourStepMarketTitle => 'շուկայի լուսանկար';

  @override
  String get homeTourStepMarketBody =>
      'Շուկայի համատեքստը (Բրազիլիա կամ համաշխարհային)՝ հիմնված ձեր տարածաշրջանի վրա՝ գումարած փոխարկված զուտ արժեքի վրա:';

  @override
  String get homeTourStepCalculatorTitle => 'Մենթորի հաշվիչ';

  @override
  String get homeTourStepCalculatorBody =>
      'Մոդելավորել բարդ տոկոսները, գնաճը և տեսնել հարստության աղյուսակը. Հաջորդը մենք բացում ենք այս գործիքը:';

  @override
  String get quizProfile_title => 'Ռիսկի պրոֆիլի վիկտորինան';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Հարց $current $total-ից';
  }

  @override
  String get quizProfile_badge => 'ՌԻՍԿ ՊՐՈՖԻԼ ՎԻԿՏՈՐԻՆԱ';

  @override
  String get quizProfile_resultTitle => 'ՁԵՐ ՊՐՈՖԻԼՆ Է';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ԻԴԵԱԼ ՆԵՐԴՐՈՒՄՆԵՐ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'EXPLORE INVESTMENTS';

  @override
  String get quizProfile_exit => 'ԵԼՔ';

  @override
  String get quizKnowledge_title => 'Գիտելիքի վիկտորինան';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Հարց $current $total-ից';
  }
}

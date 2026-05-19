// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class AppLocalizationsIs extends AppLocalizations {
  AppLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Staða';

  @override
  String get gastosDiarios => 'Daglegur kostnaður';

  @override
  String get confirmarTransacao => 'Staðfestu færslu';

  @override
  String get extrato => 'Yfirlýsing';

  @override
  String get transferencias => 'millifærslur';

  @override
  String get investimentos => 'Fjárfestingar';

  @override
  String get configuracoes => 'Stillingar';

  @override
  String get perfil => 'prófíl';

  @override
  String get sair => 'Útskrá';

  @override
  String get entrar => 'Innskráning';

  @override
  String get cadastrar => 'Skráning';

  @override
  String get email => 'Tölvupóstur';

  @override
  String get senha => 'Lykilorð';

  @override
  String get nome => 'Nafn';

  @override
  String get cpf => 'kenninúmer';

  @override
  String get telefone => 'Sími';

  @override
  String get continuar => 'Halda áfram';

  @override
  String get voltar => 'Aftur';

  @override
  String get cancelar => 'Hætta við';

  @override
  String get salvar => 'Vista';

  @override
  String get editar => 'Breyta';

  @override
  String get excluir => 'Eyða';

  @override
  String get sucesso => 'Árangur';

  @override
  String get erro => 'Villa';

  @override
  String get carregando => 'Hleður...';

  @override
  String get semDados => 'Engin gögn';

  @override
  String get tentarNovamente => 'Reyndu aftur';

  @override
  String get relatorios => 'skýrslur';

  @override
  String get gastosPorCategoria => 'Útgjöld eftir flokkum';

  @override
  String get ultimosSeteDias => 'Síðustu 7 dagar';

  @override
  String get totalGasto => 'Heildareyðsla';

  @override
  String get transacoes => 'Viðskipti';

  @override
  String get categoria => 'Flokkur';

  @override
  String get data => 'Dagsetning';

  @override
  String get valor => 'Gildi';

  @override
  String get descricao => 'Lýsing';

  @override
  String get alimentacao => 'Matur';

  @override
  String get transporte => 'Flutningur';

  @override
  String get lazer => 'Tómstundir';

  @override
  String get saude => 'Heilsa';

  @override
  String get outros => 'Aðrir';

  @override
  String get notificacoes => 'Tilkynningar';

  @override
  String get permissaoNotificacoes => 'tilkynningaleyfi';

  @override
  String get ativarMonitoramento => 'Virkjaðu kostnaðareftirlit';

  @override
  String get descricaoMonitoramento =>
      'Leyfðu forritinu að fylgjast sjálfkrafa með bankaviðskiptum þínum til að skipuleggja fjármál þín.';

  @override
  String get idioma => 'Tungumál';

  @override
  String get moeda => 'Gjaldmiðill';

  @override
  String get compararInvestimentos => 'Bera saman fjárfestingar';

  @override
  String get descricaoLocalizacao =>
      'Til að bera staðbundnar fjárfestingar (CDB/CDI) saman við alþjóðleg verð þurfum við staðsetningu þína.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Staðsetningarleyfi krafist';

  @override
  String get rendaFixa => 'Fastar tekjur';

  @override
  String get rendaVariavel => 'Breytileg tekjur';

  @override
  String get tesouroDireto => 'ríkissjóðs beint';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'hlutabréf';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'dulritunargjaldmiðlar';

  @override
  String get rendimento => 'aftur';

  @override
  String get rentabilidade => 'Arðsemi';

  @override
  String get aplicar => 'Sækja um';

  @override
  String get resgatar => 'Innleysa';

  @override
  String get simular => 'Herma';

  @override
  String get metas => 'Markmið';

  @override
  String get estrategias => 'Aðferðir';

  @override
  String get conhecimento => 'Þekking';

  @override
  String get chat => 'Spjall';

  @override
  String get enviarMensagem => 'Senda skilaboð';

  @override
  String get digiteMensagem => 'Sláðu inn skilaboð...';

  @override
  String get alertaGastos => 'eyðsluviðvörun';

  @override
  String alertaGastosMsg(int percent) {
    return 'Þú notaðir nú þegar $percent% af lánahámarkinu þínu.';
  }

  @override
  String get fechamentoFatura => 'Lokun reiknings';

  @override
  String get fechamentoFaturaMsg =>
      'Á morgun er lokadagur. Frábær tími til að fara yfir útgjöld.';

  @override
  String get faturaVencendo => 'Reikningur á gjalddaga';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Reikningur á gjalddaga eftir $dias dag(a). Athugaðu jafnvægið.';
  }

  @override
  String get regra30 => 'Ábending: 30% regla';

  @override
  String get regra30Msg =>
      'Haltu notkun undir 30% til að bæta lánstraust þitt.';

  @override
  String get diaDeOuro => 'Gulldagur!';

  @override
  String get diaDeOuroMsg =>
      'Innkaupin þín í dag verða aðeins greidd eftir 40 daga!';

  @override
  String get alertaJuros => 'Viðvörun: Vextir';

  @override
  String get alertaJurosMsg =>
      'Inneignin þín nær ekki reikningnum. Forðastu snúningskredit!';

  @override
  String get notaSaude => 'Financial Health';

  @override
  String get notaExcelente => 'Frábært! Þú hefur mikla fjárhagslega heilsu.';

  @override
  String get notaBom => 'Gott, en getur bætt sig.';

  @override
  String get notaAtencao => 'Athygli á eyðslu.';

  @override
  String get notaRevisar => 'Farðu yfir fjármál þín.';

  @override
  String get mentorInsightTitle => 'Leiðsögn leiðbeinanda';

  @override
  String get mentorInsightLoading => 'Sækir markaðsgögn…';

  @override
  String get mentorInsightError =>
      'Gat ekki hlaðið gögnum núna. Reyndu aftur fljótlega.';

  @override
  String get mentorInsightOffline =>
      'Þú ert ekki tengdur. Tengstu til að sækja tilboð og innsýn í Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Miðað við núverandi sveiflur skaltu forgangsraða varðveislu fjármagns og lausafjár áður en þú eltir ávöxtun.';

  @override
  String get mentorAllocationBalanced =>
      'Jafnvægi verndar og vaxtar: auka fjölbreytni og endurskoða markmiðssjóndeildarhringinn þinn.';

  @override
  String get mentorAllocationOffensive =>
      'Prófíllinn þinn leyfir meiri áhættu: vertu agaður og forðastu mikla einbeitingu.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Tákn skoðuð: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Sjálfvirk (tungumál)';

  @override
  String get compoundCalculatorTitle => 'Mentor Reiknivél — Samsettir vextir';

  @override
  String get compoundCalculatorSubtitle =>
      'Herma eftir framlögum, nafnvirði á móti raunhagnaði (eftir verðbólgu) og skýringum leiðbeinenda.';

  @override
  String get compoundInitialLabel => 'Upphafleg eingreiðsla';

  @override
  String get compoundMonthlyLabel => 'Mánaðarlegt framlag';

  @override
  String get compoundRateLabel => 'Vextir';

  @override
  String get compoundRateAnnual => 'á ári';

  @override
  String get compoundRateMonthly => 'á mánuði';

  @override
  String get compoundHorizonLabel => 'Tímabil';

  @override
  String get compoundHorizonYears => 'árg';

  @override
  String get compoundHorizonMonths => 'mánuðir';

  @override
  String get compoundInflationLabel => 'Áætluð verðbólga (% á ári)';

  @override
  String get compoundCalculate => 'Reiknaðu';

  @override
  String get compoundChartInvested => 'Samtals fjárfest';

  @override
  String get compoundChartInterest => 'Vextir áunnin';

  @override
  String get compoundSummaryNominalEnd => 'Lokastaða (nafn)';

  @override
  String get compoundSummaryRealGain => 'Raunverulegur hagnaður (kaupmáttur)';

  @override
  String get compoundMentorCardTitle => 'Leiðbeinandi ráðgjöf';

  @override
  String get compoundInvalidInput =>
      'Sláðu inn gild gildi (sjóndeildarhringur > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor tónn';

  @override
  String get userPersonaNovice => 'Byrjandi';

  @override
  String get userPersonaStrategist => 'Strategist';

  @override
  String get userPersonaRiskTaker => 'Áhættumaður';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Opið fulla leiðbeinandainnsýn';

  @override
  String get investFirstSteps_title => 'Fyrstu skrefin';

  @override
  String get investFirstSteps_brokerTitle => 'Veldu miðlara';

  @override
  String get investFirstSteps_brokerBody =>
      'Leitaðu að eftirlitsskyldum, virtum stofnunum. Berðu saman gjöld, vörur og áreiðanleika áður en þú opnar reikning.';

  @override
  String get investFirstSteps_openAccountTitle => 'Opnaðu reikninginn þinn';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Stafræn um borð. Í Brasilíu þarftu venjulega CPF/RG og stundum sönnun á heimilisfangi.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Stafræn innritun er mismunandi eftir löndum. Venjulega þarftu auðkennisskjal og staðfestingu á auðkenni/heimilisfangi.';

  @override
  String get investFirstSteps_transferTitle => 'Flytja fé';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Sendu peninga með PIX eða millifærslu til miðlara þíns. Eftirstöðvarnar verða tiltækar til að fjárfesta.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Flyttu fé með millifærslu eða staðbundnum greiðslumáta (fer eftir þínu landi). Eftirstöðvarnar verða tiltækar til að fjárfesta.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Þekkja áhættusniðið þitt';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Svaraðu spurningalista um hæfi. Skildu hvort þú ert íhaldssamur, hófsamur eða árásargjarn.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Kauptu fyrstu eignina þína';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Byrjaðu með neyðarsjóð (Tesouro Selic eða daglegt lausafjár CDB). Síðan skaltu auka fjölbreytni smám saman.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Byrjaðu með neyðarsjóð (hávaxta reiðufé, peningamarkaðssjóði eða skammtíma ríkisskuldabréf). Síðan skaltu auka fjölbreytni smám saman.';

  @override
  String get investFirstSteps_tipTitle => 'Mentor ráð:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Byrjaðu smátt, fjárfestu stöðugt og forðastu að reyna að tímasetja markaðinn. Tíminn er besti bandamaður þinn.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Byrjaðu smátt, fjárfestu stöðugt og forðastu að reyna að tímasetja markaðinn. Tíminn er besti bandamaður þinn.';

  @override
  String get investMenu_tesouroTitle => 'Brasilísk ríkisskuldabréf';

  @override
  String get investMenu_cdbTitle => 'fastatekjur banka (CDB)';

  @override
  String get investMenu_etfsTitle => 'International ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (vísitala)';

  @override
  String get investMenu_stocksTitle => 'hlutabréf';

  @override
  String get investMenu_fundsTitle => 'sjóðir';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'International';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Skráðu fjárfestingu';

  @override
  String investRegionHintBr(String country) {
    return 'Virkt land: $country · Brasilía vörulisti (Ríkissjóðir, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Virkt land: $country · Alþjóðlegur vörulisti (ETF, NYSE/NASDAQ…). Sjálfkrafa stillt frá tækinu þínu.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Nauðsynlegar aðferðir';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Neyðarsjóður';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Fjárhagsskjöldurinn þinn. Taka til 6–12 mánaða útgjalda. Forgangsraða daglegri lausafjárstöðu og lítilli áhættu (t.d. Tesouro Selic eða CDI-tengd CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Fjárhagsskjöldurinn þinn. Taka til 6–12 mánaða útgjalda. Forgangsraða daglegri lausafjárstöðu og lítilli áhættu (t.d. peningamarkaðssjóðum og skammtímaskuldabréfum ríkissjóðs).';

  @override
  String get strategy_buyHoldTitle => 'Kaupa og halda';

  @override
  String get strategy_buyHoldBody =>
      'Kauptu gæðaeignir og haltu til langs tíma. Leggðu áherslu á aga, gæði og endurfjárfestingu með tímanum.';

  @override
  String get strategy_diversificationTitle => 'Fjölbreytni';

  @override
  String get strategy_diversificationBodyBr =>
      'Dreifðu fjármagni þínu yfir fastatekjur, hlutabréf, FIIs og alþjóðlegar eignir til að draga úr áhættu og bæta áhættuleiðrétta ávöxtun.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Dreifðu fjármagni þínu yfir skuldabréf, hlutabréf, REITs og alþjóðlega áhættu til að draga úr áhættu og bæta áhættuleiðrétta ávöxtun.';

  @override
  String get strategy_dcaTitle => 'Dollar-kostnaður meðaltal (DCA)';

  @override
  String get strategy_dcaBody =>
      'Samræmi slær snilld. Fjárfesting í hverjum mánuði er oft árangursríkari en að reyna að velja hinn fullkomna inngangspunkt.';

  @override
  String get strategy_smartGoalsTitle => 'SMART mörk';

  @override
  String get strategy_smartGoalsBody =>
      'Markmið þín ættu að vera sértæk, mælanleg, framkvæmanleg, viðeigandi og tímabundin.';

  @override
  String get strategy_503020Title => '50-30-20 regla';

  @override
  String get strategy_503020Body =>
      'Einfaldur fjárhagsáætlunarrammi: 50% þarfir, 30% óskir, 20% fjárfesting og markmið.';

  @override
  String get strategy_deepDive_allocationTitle => 'Eignaúthlutun (háþróuð)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Lærðu hvernig á að byggja upp úthlutun eftir markmiðum og sjóndeildarhring, aðlaga áhættu, fylgni og endurjafnvægi.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETFs og vísitölur (háþróaður)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Lærðu um alþjóðlegar vísitölur (t.d. S&P 500), ETFs og hvernig á að byggja upp alþjóðlega áhættu með aga.';

  @override
  String get strategy_deepDive_taxesTitle => 'Skattar og skýrslur (háþróaður)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Skilja helstu skattahugtök og hvernig á að halda skrár til að tilkynna fjárfestingar á öruggan hátt.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium efni. Virkjaðu Cyber/Grimm/Hive þema til að opna fjárfestinguna Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Sýningarskápur';

  @override
  String get homeShowcaseProfileSimTitle => 'Spurningakeppni um áhættupróf';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Finndu fjárfestaprófílinn þinn á nokkrum mínútum.';

  @override
  String get homeShowcaseStrategiesTitle => 'Ráðlagðar aðferðir';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Beinar flýtileiðir til að læra og beita aðferðum.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Skyndipróf og aðferðir';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Fljótur aðgangur að spurningakeppninni um áhættusnið og ráðlagðar aðferðir.';

  @override
  String get homeTourStepClassicTitle => 'Klassísk stilling';

  @override
  String get homeTourStepClassicBody =>
      'Opnar upprunalega app spjaldið: viðskipti, markmið, fjárfestingar og stillingar í kunnuglegu skipulagi.';

  @override
  String get homeTourStepVitrineTitle => 'Sýningarsvæði';

  @override
  String get homeTourStepVitrineBody =>
      'Flýtileiðir til að læra og æfa: fjárfestasnið, aðferðir og Mentor miðstöðin.';

  @override
  String get homeTourStepProfileTitle => 'prófílpróf';

  @override
  String get homeTourStepProfileBody =>
      'Svaraðu spurningalistanum til að uppgötva áhættusniðið þitt og sjá samræmdar tillögur.';

  @override
  String get homeTourStepStrategiesTitle => 'Aðferðir';

  @override
  String get homeTourStepStrategiesBody =>
      'Efni til að skipuleggja fjármál, fjárfesta með aga og forðast algengar gildrur.';

  @override
  String get homeTourStepHubTitle => 'Mentor miðstöð';

  @override
  String get homeTourStepHubBody =>
      'Flýtivalmynd fyrir prófílprófið og ráðlagðar aðferðir.';

  @override
  String get homeTourStepPremiumTitle => 'Premium eiginleikar';

  @override
  String get homeTourStepPremiumBody =>
      'Sjálfvirk leiðsögn, háþróuð töflur og mánaðarlegar skýrslur — fáanlegt með Premium áskrift.';

  @override
  String get homeTourStepMarketTitle => 'skyndimynd af markaði';

  @override
  String get homeTourStepMarketBody =>
      'Markaðssamhengi (Brasilía eða á heimsvísu) byggt á þínu svæði ásamt umreiknuðum nettóvirði.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor reiknivél';

  @override
  String get homeTourStepCalculatorBody =>
      'Herma saman vexti, verðbólgu og sjá auðmagnið; næst opnum við þetta tól.';

  @override
  String get quizProfile_title => 'Spurningakeppni um áhættupróf';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Spurning $current af $total';
  }

  @override
  String get quizProfile_badge => 'Áhættuprófíl Spurningakeppni';

  @override
  String get quizProfile_resultTitle => 'PRÓFÍL ÞINN ER';

  @override
  String get quizProfile_idealInvestmentsTitle => 'TILVALFJÁRFESTINGAR:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'KANNA FJÁRFESTINGAR';

  @override
  String get quizProfile_exit => 'EXIT';

  @override
  String get quizKnowledge_title => 'Þekkingarpróf';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Spurning $current af $total';
  }
}

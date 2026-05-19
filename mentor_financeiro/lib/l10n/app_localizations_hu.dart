// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Mentor Pénzügy';

  @override
  String get saldo => 'Mérleg';

  @override
  String get gastosDiarios => 'Napi költségek';

  @override
  String get confirmarTransacao => 'Tranzakció megerősítése';

  @override
  String get extrato => 'Nyilatkozat';

  @override
  String get transferencias => 'Átutalás';

  @override
  String get investimentos => 'Beruházások';

  @override
  String get configuracoes => 'Beállítások';

  @override
  String get perfil => 'Profil';

  @override
  String get sair => 'Kijelentkezés';

  @override
  String get entrar => 'Bejelentkezés';

  @override
  String get cadastrar => 'Regisztráció';

  @override
  String get email => 'E-mail';

  @override
  String get senha => 'Jelszó';

  @override
  String get nome => 'Név';

  @override
  String get cpf => 'azonosítószám';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Folytatás';

  @override
  String get voltar => 'Hát';

  @override
  String get cancelar => 'Mégsem';

  @override
  String get salvar => 'Mentés';

  @override
  String get editar => 'Szerk';

  @override
  String get excluir => 'Törlés';

  @override
  String get sucesso => 'Siker';

  @override
  String get erro => 'Hiba';

  @override
  String get carregando => 'Betöltés...';

  @override
  String get semDados => 'Nincs adat';

  @override
  String get tentarNovamente => 'Próbálja újra';

  @override
  String get relatorios => 'Jelentések';

  @override
  String get gastosPorCategoria => 'Költségek kategóriánként';

  @override
  String get ultimosSeteDias => 'Az elmúlt 7 nap';

  @override
  String get totalGasto => 'Teljes ráfordítás';

  @override
  String get transacoes => 'Tranzakciók';

  @override
  String get categoria => 'Kategória';

  @override
  String get data => 'Dátum';

  @override
  String get valor => 'Érték';

  @override
  String get descricao => 'Leírás';

  @override
  String get alimentacao => 'Élelmiszer';

  @override
  String get transporte => 'Közlekedés';

  @override
  String get lazer => 'Szabadidő';

  @override
  String get saude => 'Egészség';

  @override
  String get outros => 'Egyéb';

  @override
  String get notificacoes => 'Értesítések';

  @override
  String get permissaoNotificacoes => 'Értesítési engedély';

  @override
  String get ativarMonitoramento => 'Költségfigyelés engedélyezése';

  @override
  String get descricaoMonitoramento =>
      'Lehetővé teszi, hogy az alkalmazás automatikusan figyelje banki tranzakcióit pénzügyei megszervezése érdekében.';

  @override
  String get idioma => 'Nyelv';

  @override
  String get moeda => 'Pénznem';

  @override
  String get compararInvestimentos => 'Befektetések összehasonlítása';

  @override
  String get descricaoLocalizacao =>
      'A helyi befektetések (CDB/CDI) és a nemzetközi árfolyamok összehasonlításához szükségünk van az Ön tartózkodási helyére.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Helymeghatározási engedély szükséges';

  @override
  String get rendaFixa => 'Fix jövedelem';

  @override
  String get rendaVariavel => 'Változó jövedelem';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Készletek';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Kriptovaluták';

  @override
  String get rendimento => 'Vissza';

  @override
  String get rentabilidade => 'Nyereségesség';

  @override
  String get aplicar => 'Jelentkezni';

  @override
  String get resgatar => 'Beváltás';

  @override
  String get simular => 'Szimuláció';

  @override
  String get metas => 'Gólok';

  @override
  String get estrategias => 'Stratégiák';

  @override
  String get conhecimento => 'Tudás';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Üzenet küldése';

  @override
  String get digiteMensagem => 'Írjon be egy üzenetet...';

  @override
  String get alertaGastos => 'Költési figyelmeztetés';

  @override
  String alertaGastosMsg(int percent) {
    return 'Már felhasználta hitelkerete $percent%-át.';
  }

  @override
  String get fechamentoFatura => 'Számlazárás';

  @override
  String get fechamentoFaturaMsg =>
      'Holnap zárónap. Kiváló alkalom a kiadások áttekintésére.';

  @override
  String get faturaVencendo => 'Számla esedékessége';

  @override
  String faturaVencendoMsg(int dias) {
    return 'A számla esedékessége $dias napon belül. Ellenőrizze az egyenlegét.';
  }

  @override
  String get regra30 => 'Tipp: 30%-os szabály';

  @override
  String get regra30Msg =>
      'A felhasználást tartsa 30% alatt, hogy javítsa hitelpontszámát.';

  @override
  String get diaDeOuro => 'Arany nap!';

  @override
  String get diaDeOuroMsg =>
      'A mai vásárlásait csak 40 napon belül fizetjük ki!';

  @override
  String get alertaJuros => 'Figyelmeztetés: Érdeklődni';

  @override
  String get alertaJurosMsg =>
      'Egyenlege nem fedezi a számlát. Kerülje a rulírozó hitelt!';

  @override
  String get notaSaude => 'Pénzügyi egészség';

  @override
  String get notaExcelente => 'Kiváló! Jó anyagi egészséged van.';

  @override
  String get notaBom => 'Jó, de javítható.';

  @override
  String get notaAtencao => 'Figyelem a költekezésre.';

  @override
  String get notaRevisar => 'Tekintse át pénzügyeit.';

  @override
  String get mentorInsightTitle => 'Mentor irányítása';

  @override
  String get mentorInsightLoading => 'Piaci adatok lekérése…';

  @override
  String get mentorInsightError =>
      'Jelenleg nem sikerült betölteni az adatokat. Próbálja újra rövidesen.';

  @override
  String get mentorInsightOffline =>
      'Offline állapotban van. Csatlakozzon az idézetek és a mentori betekintések lekéréséhez.';

  @override
  String get mentorAllocationDefensive =>
      'Tekintettel a jelenlegi volatilitásra, helyezze előtérbe a tőkemegőrzést és a likviditást, mielőtt hozamra vágyna.';

  @override
  String get mentorAllocationBalanced =>
      'Egyensúlyi védelem és növekedés: diverzifikálja és keresse fel újra a célhorizontját.';

  @override
  String get mentorAllocationOffensive =>
      'Profilod nagyobb kockázatot tesz lehetővé: maradj fegyelmezett, és kerüld az erős koncentrációt.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Áttekintett szimbólumok: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automata (nyelv)';

  @override
  String get compoundCalculatorTitle => 'Mentorkalkulátor – kamatos kamat';

  @override
  String get compoundCalculatorSubtitle =>
      'Szimulálja a hozzájárulásokat, a nominális és a reálnyereséget (infláció után) és a mentorjegyzeteket.';

  @override
  String get compoundInitialLabel => 'Kezdeti átalányösszeg';

  @override
  String get compoundMonthlyLabel => 'Havi hozzájárulás';

  @override
  String get compoundRateLabel => 'Kamatláb';

  @override
  String get compoundRateAnnual => 'évente';

  @override
  String get compoundRateMonthly => 'havonta';

  @override
  String get compoundHorizonLabel => 'Időhorizont';

  @override
  String get compoundHorizonYears => 'év';

  @override
  String get compoundHorizonMonths => 'hónap';

  @override
  String get compoundInflationLabel => 'Becsült infláció (% évente)';

  @override
  String get compoundCalculate => 'Számítsa ki';

  @override
  String get compoundChartInvested => 'Összes befektetés';

  @override
  String get compoundChartInterest => 'Megkeresett kamat';

  @override
  String get compoundSummaryNominalEnd => 'Záróegyenleg (névleges)';

  @override
  String get compoundSummaryRealGain => 'Valós nyereség (vásárlóerő)';

  @override
  String get compoundMentorCardTitle => 'Mentor tanács';

  @override
  String get compoundInvalidInput =>
      'Adjon meg érvényes értékeket (horizont > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor hangnem';

  @override
  String get userPersonaNovice => 'Kezdő';

  @override
  String get userPersonaStrategist => 'Stratégia';

  @override
  String get userPersonaRiskTaker => 'Kockázatvállaló';

  @override
  String get userPersonaConservative => 'Megtakarító';

  @override
  String get compoundOpenFullInsight =>
      'Nyissa meg a teljes mentori betekintést';

  @override
  String get investFirstSteps_title => 'Első lépések';

  @override
  String get investFirstSteps_brokerTitle => 'Válasszon brókert';

  @override
  String get investFirstSteps_brokerBody =>
      'Keressen szabályozott, jó hírű intézményeket. Számlanyitás előtt hasonlítsa össze a díjakat, a termékeket és a megbízhatóságot.';

  @override
  String get investFirstSteps_openAccountTitle => 'Nyissa meg fiókját';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Digitális beépítés. Brazíliában általában CPF/RG-re és néha címigazolásra van szüksége.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'A digitális beépítés országonként eltérő. Általában személyazonosító okmányra és személyazonosság/cím igazolásra van szüksége.';

  @override
  String get investFirstSteps_transferTitle => 'Átutalás';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Küldjön pénzt PIX-en keresztül vagy banki átutalással brókerének. Az egyenleg elérhetővé válik befektetésre.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Átutalás banki átutalással vagy helyi fizetési módokkal (országtól függően). Az egyenleg elérhetővé válik befektetésre.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Ismerje kockázati profilját';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Válaszoljon egy alkalmassági kérdőívre. Értsd meg, hogy konzervatív, mérsékelt vagy agresszív vagy.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Vásárolja meg első eszközét';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Kezdje vészalappal (Tesouro Selic vagy napi likviditású CDB). Ezután fokozatosan diverzifikálja.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Kezdje vészalappal (magas hozamú készpénz, pénzpiaci alap vagy rövid lejáratú kincstári kötvény). Ezután fokozatosan diverzifikálja.';

  @override
  String get investFirstSteps_tipTitle => 'Mentor tipp:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Kezdje kicsiben, fektessen be következetesen, és ne próbálja időzíteni a piacot. Az idő a legjobb szövetségesed.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Kezdje kicsiben, fektessen be következetesen, és ne próbálja időzíteni a piacot. Az idő a legjobb szövetségesed.';

  @override
  String get investMenu_tesouroTitle => 'Brazil kincstárak';

  @override
  String get investMenu_cdbTitle => 'Banki fix kamatozású (CDB)';

  @override
  String get investMenu_etfsTitle => 'Nemzetközi ETF-ek';

  @override
  String get investMenu_sp500Title => 'S&P 500 (index)';

  @override
  String get investMenu_stocksTitle => 'Készletek';

  @override
  String get investMenu_fundsTitle => 'Alapok';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REIT';

  @override
  String get investMenu_internationalTitle => 'Nemzetközi';

  @override
  String get investMenu_cryptoTitle => 'Kripto';

  @override
  String get investRegisterCta => 'Regisztrálj befektetés';

  @override
  String investRegionHintBr(String country) {
    return 'Hatályos ország: $country · Brazília katalógus (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Hatályos ország: $country · Globális katalógus (ETF, NYSE/NASDAQ…). Automatikusan beállítva az eszköz régiójából.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Alapvető stratégiák';

  @override
  String get strategy_sectionDeepDiveTitle => 'mély merülés (prémium)';

  @override
  String get strategy_emergencyFundTitle => 'Sürgősségi alap';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Az Ön pénzügyi pajzsa. 6-12 havi kiadások fedezése. Részesítse előnyben a napi likviditást és az alacsony kockázatot (pl. Tesouro Selic vagy CDI-hez kötött CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Az Ön pénzügyi pajzsa. 6-12 havi kiadások fedezése. Részesítse előnyben a napi likviditást és az alacsony kockázatot (pl. pénzpiaci alapok és rövid lejáratú kincstári kötvények).';

  @override
  String get strategy_buyHoldTitle => 'Vásárlás és tartás';

  @override
  String get strategy_buyHoldBody =>
      'Vásároljon minőségi eszközöket, és tartsa hosszú távon. Fókuszáljon a fegyelemre, a minőségre és az idő múlásával történő újrabefektetésre.';

  @override
  String get strategy_diversificationTitle => 'Diverzifikáció';

  @override
  String get strategy_diversificationBodyBr =>
      'Ossza meg tőkéjét fix hozamú, részvények, FII-k és nemzetközi eszközök között a kockázat csökkentése és a kockázattal kiigazított hozamok javítása érdekében.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Ossza meg tőkéjét kötvények, részvények, REIT-ek és nemzetközi kitettségek között a kockázat csökkentése és a kockázattal korrigált hozamok javítása érdekében.';

  @override
  String get strategy_dcaTitle => 'Dollárköltség átlagolása (DCA)';

  @override
  String get strategy_dcaBody =>
      'A következetesség felülmúlja a zsenialitást. A havi befektetés gyakran hatékonyabb, mint a tökéletes belépési pont kiválasztása.';

  @override
  String get strategy_smartGoalsTitle => 'SMART gólok';

  @override
  String get strategy_smartGoalsBody =>
      'Céljainak konkrétnak, mérhetőnek, elérhetőnek, relevánsnak és időhöz kötöttnek kell lenniük.';

  @override
  String get strategy_503020Title => '50-30-20 szabály';

  @override
  String get strategy_503020Body =>
      'Egyszerű költségvetési keret: 50% szükségletek, 30% kívánságok, 20% befektetés és célok.';

  @override
  String get strategy_deepDive_allocationTitle => 'Eszközallokáció (speciális)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Ismerje meg, hogyan építhet fel cél és horizont szerinti elosztást, hogyan módosíthatja a kockázatot, a korrelációt és az egyensúlyt.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Globális ETF-ek és indexek (fejlett)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Ismerje meg a globális indexeket (pl. S&P 500), az ETF-eket, és hogyan építhet fegyelmezetten nemzetközi kitettséget.';

  @override
  String get strategy_deepDive_taxesTitle => 'Adók és jelentés (speciális)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Ismerje meg az alapvető adózási fogalmakat, és hogyan kell nyilvántartást vezetni a befektetések biztonságos jelentése érdekében.';

  @override
  String get strategy_premiumLockedBody =>
      'Prémium tartalom. Aktiváljon egy Cyber/Grimm/Hive témát a befektetési Deep Dive feloldásához.';

  @override
  String get homeShowcaseTitle => 'Vitrin';

  @override
  String get homeShowcaseProfileSimTitle => 'Kockázati profil kvíz';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Néhány perc alatt megtalálja befektetői profilját.';

  @override
  String get homeShowcaseStrategiesTitle => 'Ajánlott stratégiák';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Közvetlen parancsikonok a stratégiák megtanulásához és alkalmazásához.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Kvízek és stratégiák';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Gyors hozzáférés a kockázati profil kvízhez és az ajánlott stratégiákhoz.';

  @override
  String get homeTourStepClassicTitle => 'Klasszikus mód';

  @override
  String get homeTourStepClassicBody =>
      'Megnyitja az eredeti alkalmazáspanelt: tranzakciók, célok, befektetések és beállítások az ismerős elrendezésben.';

  @override
  String get homeTourStepVitrineTitle => 'Kirakat terület';

  @override
  String get homeTourStepVitrineBody =>
      'Parancsikonok a tanuláshoz és a gyakorláshoz: befektetői profil, stratégiák és a Mentor hub.';

  @override
  String get homeTourStepProfileTitle => 'Profil kvíz';

  @override
  String get homeTourStepProfileBody =>
      'Válaszoljon a kérdőívre, hogy megtudja kockázati profilját, és megtekinthesse az összehangolt javaslatokat.';

  @override
  String get homeTourStepStrategiesTitle => 'Stratégiák';

  @override
  String get homeTourStepStrategiesBody =>
      'Tartalom a pénzügyek megszervezéséhez, a fegyelmezett befektetéshez és a gyakori buktatók elkerüléséhez.';

  @override
  String get homeTourStepHubTitle => 'Mentor hub';

  @override
  String get homeTourStepHubBody =>
      'A profilkvíz gyorsmenüje és az ajánlott stratégiák.';

  @override
  String get homeTourStepPremiumTitle => 'Prémium funkciók';

  @override
  String get homeTourStepPremiumBody =>
      'Automatikus mentorálás, speciális diagramok és havi jelentések – Premium előfizetéssel elérhető.';

  @override
  String get homeTourStepMarketTitle => 'Piac pillanatképe';

  @override
  String get homeTourStepMarketBody =>
      'Piaci kontextus (Brazília vagy globális) az Ön régiója és az átváltott nettó vagyon alapján.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor kalkulátor';

  @override
  String get homeTourStepCalculatorBody =>
      'Simuláljon kamatos kamatot, inflációt és nézze meg a vagyondiagramot; ezután megnyitjuk ezt az eszközt.';

  @override
  String get quizProfile_title => 'Kockázati profil kvíz';

  @override
  String quizProfile_progress(int current, int total) {
    return '$total/$current. kérdés';
  }

  @override
  String get quizProfile_badge => 'KOCKÁZATPROFIL KVÍZ';

  @override
  String get quizProfile_resultTitle => 'A PROFIL AZ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'IDEÁLIS BEFEKTETÉSEK:';

  @override
  String get quizProfile_exploreInvestmentsCta =>
      'FEDEZZE FEL A BEFEKTETÉSEKET';

  @override
  String get quizProfile_exit => 'KILÉPÉS';

  @override
  String get quizKnowledge_title => 'Tudáskvíz';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '$total/$current. kérdés';
  }
}

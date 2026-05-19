// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get appTitle => 'Ментор санхүү';

  @override
  String get saldo => 'Үлдэгдэл';

  @override
  String get gastosDiarios => 'Өдөр тутмын зардал';

  @override
  String get confirmarTransacao => 'Гүйлгээг баталгаажуулна уу';

  @override
  String get extrato => 'мэдэгдэл';

  @override
  String get transferencias => 'шилжүүлэг';

  @override
  String get investimentos => 'Хөрөнгө оруулалт';

  @override
  String get configuracoes => 'Тохиргоо';

  @override
  String get perfil => 'профайл';

  @override
  String get sair => 'Гарах';

  @override
  String get entrar => 'Нэвтрэх';

  @override
  String get cadastrar => 'Бүртгүүлэх';

  @override
  String get email => 'Имэйл';

  @override
  String get senha => 'Нууц үг';

  @override
  String get nome => 'Нэр';

  @override
  String get cpf => 'ID дугаар';

  @override
  String get telefone => 'утас';

  @override
  String get continuar => 'Үргэлжлүүлэх';

  @override
  String get voltar => 'Буцах';

  @override
  String get cancelar => 'Цуцлах';

  @override
  String get salvar => 'Хадгалах';

  @override
  String get editar => 'Засварлах';

  @override
  String get excluir => 'Устгах';

  @override
  String get sucesso => 'Амжилт';

  @override
  String get erro => 'алдаа';

  @override
  String get carregando => 'Ачааж байна...';

  @override
  String get semDados => 'Өгөгдөл байхгүй';

  @override
  String get tentarNovamente => 'Дахин оролдоно уу';

  @override
  String get relatorios => 'тайлангууд';

  @override
  String get gastosPorCategoria => 'Ангилалаар зардал';

  @override
  String get ultimosSeteDias => 'Сүүлийн 7 хоног';

  @override
  String get totalGasto => 'Нийт зарцуулсан';

  @override
  String get transacoes => 'Гүйлгээ';

  @override
  String get categoria => 'ангилал';

  @override
  String get data => 'Огноо';

  @override
  String get valor => 'Утга';

  @override
  String get descricao => 'Тодорхойлолт';

  @override
  String get alimentacao => 'Хоол хүнс';

  @override
  String get transporte => 'Тээвэрлэлт';

  @override
  String get lazer => 'Чөлөөт цаг';

  @override
  String get saude => 'Эрүүл мэнд';

  @override
  String get outros => 'Бусад';

  @override
  String get notificacoes => 'мэдэгдлүүд';

  @override
  String get permissaoNotificacoes => 'мэдэгдлийн зөвшөөрөл';

  @override
  String get ativarMonitoramento => 'Зардлын хяналтыг идэвхжүүлнэ';

  @override
  String get descricaoMonitoramento =>
      'Санхүүгээ зохицуулахын тулд таны банкны гүйлгээг автоматаар хянахыг апп-д зөвшөөрнө үү.';

  @override
  String get idioma => 'хэл';

  @override
  String get moeda => 'Валют';

  @override
  String get compararInvestimentos => 'Хөрөнгө оруулалтыг харьцуулах';

  @override
  String get descricaoLocalizacao =>
      'Орон нутгийн хөрөнгө оруулалтыг (CDB/CDI) олон улсын ханштай харьцуулахын тулд бидэнд таны байршил хэрэгтэй.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Байршлын зөвшөөрөл шаардлагатай';

  @override
  String get rendaFixa => 'Тогтмол орлого';

  @override
  String get rendaVariavel => 'Хувьсах орлого';

  @override
  String get tesouroDireto => 'Төрийн сангийн шууд';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Хувьцаа';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Cryptocurrencies';

  @override
  String get rendimento => 'Буцах';

  @override
  String get rentabilidade => 'Ашигт ажиллагаа';

  @override
  String get aplicar => 'Өргөдөл гаргах';

  @override
  String get resgatar => 'эргүүлэн авах';

  @override
  String get simular => 'Загвар хийх';

  @override
  String get metas => 'Зорилго';

  @override
  String get estrategias => 'стратеги';

  @override
  String get conhecimento => 'Мэдлэг';

  @override
  String get chat => 'Чат';

  @override
  String get enviarMensagem => 'Зурвас илгээх';

  @override
  String get digiteMensagem => 'Зурвас бичнэ үү...';

  @override
  String get alertaGastos => 'Зардлын анхааруулга';

  @override
  String alertaGastosMsg(int percent) {
    return 'Та зээлийн хязгаарынхаа $percent%-ийг аль хэдийн ашигласан.';
  }

  @override
  String get fechamentoFatura => 'Нэхэмжлэхийг хаах';

  @override
  String get fechamentoFaturaMsg =>
      'Маргааш хаалтын өдөр. Зардлаа хянах сайхан цаг.';

  @override
  String get faturaVencendo => 'Нэхэмжлэхийн хугацаа дууссан';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Нэхэмжлэхийн хугацаа $dias өдрийн дотор. Үлдэгдэлээ шалгана уу.';
  }

  @override
  String get regra30 => 'Зөвлөгөө: 30% Дүрэм';

  @override
  String get regra30Msg =>
      'Зээлийн оноогоо сайжруулахын тулд хэрэглээгээ 30%-иас доош байлгаарай.';

  @override
  String get diaDeOuro => 'Алтан өдөр!';

  @override
  String get diaDeOuroMsg =>
      'Таны өнөөдрийн худалдан авалтын төлбөрийг зөвхөн 40 хоногийн дотор төлнө!';

  @override
  String get alertaJuros => 'Анхааруулга: Хүү';

  @override
  String get alertaJurosMsg =>
      'Таны үлдэгдэл төлбөрийг нөхөхгүй. Эргэлтийн зээлээс зайлсхий!';

  @override
  String get notaSaude => 'Санхүүгийн эрүүл мэнд';

  @override
  String get notaExcelente =>
      'Маш сайн! Таны санхүүгийн эрүүл мэнд маш сайн байна.';

  @override
  String get notaBom => 'Сайн, гэхдээ сайжруулах боломжтой.';

  @override
  String get notaAtencao => 'Зарцуулалтанд анхаар.';

  @override
  String get notaRevisar => 'Санхүүгээ шалгаарай.';

  @override
  String get mentorInsightTitle => 'Менторын удирдамж';

  @override
  String get mentorInsightLoading => 'Зах зээлийн мэдээллийг дуудаж байна...';

  @override
  String get mentorInsightError =>
      'Яг одоо өгөгдлийг ачаалж чадсангүй. Удахгүй дахин оролдоно уу.';

  @override
  String get mentorInsightOffline =>
      'Та офлайн байна. Үнийн санал болон Менторын ойлголтыг авахын тулд холбогдоно уу.';

  @override
  String get mentorAllocationDefensive =>
      'Одоогийн тогтворгүй байдлыг харгалзан өгөөжийг хөөхөөс өмнө хөрөнгийн хадгалалт болон хөрвөх чадварыг чухалчил.';

  @override
  String get mentorAllocationBalanced =>
      'Хамгаалалт ба өсөлтийг тэнцвэржүүлээрэй: зорилгоо төрөлжүүлж, эргэн харах.';

  @override
  String get mentorAllocationOffensive =>
      'Таны профайл илүү эрсдэлтэй байдаг: сахилга баттай байж, анхаарал төвлөрөхөөс зайлсхий.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Тэмдгийг хянасан: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Автомат (хэл)';

  @override
  String get compoundCalculatorTitle => 'Менторын тооцоолуур — Нийлмэл хүү';

  @override
  String get compoundCalculatorSubtitle =>
      'Шимтгэл, нэрлэсэн болон бодит ашиг (инфляцийн дараа) болон зөвлөгчийн тэмдэглэлийг дуурайлгана.';

  @override
  String get compoundInitialLabel => 'Анхны нэг удаагийн төлбөр';

  @override
  String get compoundMonthlyLabel => 'Сарын шимтгэл';

  @override
  String get compoundRateLabel => 'Зээлийн хүү\nЖилд';

  @override
  String get compoundRateAnnual => 'Сард';

  @override
  String get compoundRateMonthly => '';

  @override
  String get compoundHorizonLabel => 'Цагийн хязгаар';

  @override
  String get compoundHorizonYears => 'жил';

  @override
  String get compoundHorizonMonths => 'сар';

  @override
  String get compoundInflationLabel => 'Тооцоолсон инфляци (жилд %)';

  @override
  String get compoundCalculate => 'Тооцоолох';

  @override
  String get compoundChartInvested => 'Нийт хөрөнгө оруулсан';

  @override
  String get compoundChartInterest => 'Олсон хүү';

  @override
  String get compoundSummaryNominalEnd => 'Төгсгөлийн үлдэгдэл (нэрлэсэн)';

  @override
  String get compoundSummaryRealGain => 'Бодит ашиг (худалдан авах чадвар)';

  @override
  String get compoundMentorCardTitle => 'Менторын зөвлөгөө';

  @override
  String get compoundInvalidInput => 'Хүчинтэй утгыг оруулна уу (horizon > 0).';

  @override
  String get userPersonaSectionTitle => 'Менторын ая';

  @override
  String get userPersonaNovice => 'Эхлэгч';

  @override
  String get userPersonaStrategist => 'стратегич';

  @override
  String get userPersonaRiskTaker => 'Эрсдэл хүлээгч';

  @override
  String get userPersonaConservative => 'хэмнэгч';

  @override
  String get compoundOpenFullInsight => 'Бүрэн менторын ойлголтыг нээх';

  @override
  String get investFirstSteps_title => 'Эхний алхамууд';

  @override
  String get investFirstSteps_brokerTitle => 'Зуучлагчаа сонго';

  @override
  String get investFirstSteps_brokerBody =>
      'Зохицуулалттай, нэр хүндтэй байгууллагуудыг хайж олоорой. Данс нээхээсээ өмнө хураамж, бүтээгдэхүүн, найдвартай байдлыг харьцуул.';

  @override
  String get investFirstSteps_openAccountTitle => 'Дансаа нээнэ үү';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Дижитал залгалт. Бразилд танд ихэвчлэн CPF/RG, заримдаа хаягийн баталгаа хэрэгтэй болдог.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Дижитал холболт нь улс орон бүрт өөр өөр байдаг. Ер нь танд иргэний үнэмлэх, иргэний үнэмлэх/хаяг баталгаажуулалт хэрэгтэй.';

  @override
  String get investFirstSteps_transferTitle => 'Мөнгө шилжүүлэх';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Брокер руугаа PIX эсвэл банкны шилжүүлгээр мөнгө илгээнэ үү. Үлдэгдэл хөрөнгө оруулалт хийх боломжтой болно.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Банкны шилжүүлэг эсвэл орон нутгийн төлбөрийн хэрэгслээр мөнгө шилжүүлэх (танай улсаас хамаарна). Үлдэгдэл хөрөнгө оруулалт хийх боломжтой болно.';

  @override
  String get investFirstSteps_riskProfileTitle =>
      'Эрсдлийн профайлаа мэдэж аваарай';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Тохиромжтой байдлын асуулгад хариулна уу. Та консерватив, дунд зэрэг, эсвэл түрэмгий эсэхээ ойлгоорой.';

  @override
  String get investFirstSteps_firstAssetTitle =>
      'Эхний хөрөнгөө худалдаж аваарай';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Яаралтай тусламжийн сангаас (Tesouro Selic эсвэл өдөр тутмын хөрвөх чадвартай CDB) эхэл. Дараа нь аажмаар төрөлжүүлнэ.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Яаралтай тусламжийн сангаас (өндөр өгөөжтэй бэлэн мөнгө, мөнгөний зах зээлийн сан эсвэл төрийн сангийн богино хугацаат бонд) эхлээрэй. Дараа нь аажмаар төрөлжүүлнэ.';

  @override
  String get investFirstSteps_tipTitle => 'Менторын зөвлөгөө:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Бага хэмжээгээр эхэлж, тогтмол хөрөнгө оруулалт хийж, зах зээлээ цаг хугацаа алдахаас зайлсхий. Цаг хугацаа бол таны хамгийн сайн холбоотон юм.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Бага багаар эхэлж, тогтмол хөрөнгө оруулалт хийж, зах зээлд цаг хугацаа зарцуулахаас зайлсхий. Цаг хугацаа бол таны хамгийн сайн холбоотон юм.';

  @override
  String get investMenu_tesouroTitle => 'Бразилийн эрдэнэсийн сан';

  @override
  String get investMenu_cdbTitle => 'Банкны тогтмол орлого (CDB)';

  @override
  String get investMenu_etfsTitle => 'олон улсын ETFs';

  @override
  String get investMenu_sp500Title => 'S&P 500 (индекс)';

  @override
  String get investMenu_stocksTitle => 'Хувьцаа';

  @override
  String get investMenu_fundsTitle => 'Сангууд';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Олон улсын';

  @override
  String get investMenu_cryptoTitle => 'Crypto';

  @override
  String get investRegisterCta => 'Хөрөнгө оруулалтыг бүртгэх';

  @override
  String investRegionHintBr(String country) {
    return 'Үр дүнтэй улс: $country · Бразилийн каталог (Төрийн сан, CDB, LCA...).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Үр дүнтэй улс: $country · Глобал каталог (ETFs, NYSE/NASDAQ…). Таны төхөөрөмжийн бүсээс автоматаар тохируулсан.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Үндсэн стратеги';

  @override
  String get strategy_sectionDeepDiveTitle => 'Гүн шумбах (Дээд зэрэглэлийн)';

  @override
  String get strategy_emergencyFundTitle => 'Яаралтай тусламжийн сан';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Таны санхүүгийн бамбай. 6-12 сарын зардлыг нөхөх. Өдөр тутмын хөрвөх чадвар, эрсдэл багатай (жишээ нь, Tesouro Selic эсвэл CDI-холбогдсон CDB) тэргүүлэх ач холбогдол өгөх.';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Таны санхүүгийн бамбай. 6-12 сарын зардлыг нөхөх. Өдөр тутмын хөрвөх чадвар, эрсдэл багатай (жишээ нь, мөнгөний зах зээлийн сан, төрийн сангийн богино хугацаат бонд гэх мэт) давуу эрх олгох.';

  @override
  String get strategy_buyHoldTitle => 'Худалдан авах, барих';

  @override
  String get strategy_buyHoldBody =>
      'Чанартай хөрөнгө худалдаж аваад урт хугацаанд хадгал. Цаг хугацааны явцад сахилга бат, чанар, дахин хөрөнгө оруулалтад анхаарлаа хандуулаарай.';

  @override
  String get strategy_diversificationTitle => 'Төрөлжүүлэх';

  @override
  String get strategy_diversificationBodyBr =>
      'Эрсдэлийг бууруулж, эрсдэлд тохируулсан өгөөжийг сайжруулахын тулд хөрөнгөө тогтмол орлого, хувьцаа, FII болон олон улсын хөрөнгөд тараа.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Эрсдэлийг бууруулж, эрсдэлд тохируулсан өгөөжийг сайжруулахын тулд бонд, хувьцаа, REIT болон олон улсын эрсдэлд өөрийн хөрөнгөө хуваарилаарай.';

  @override
  String get strategy_dcaTitle => 'Долларын зардлын дундаж (DCA)';

  @override
  String get strategy_dcaBody =>
      'Тууштай байдал нь суут ухаантныг ялдаг. Сар бүр хөрөнгө оруулалт хийх нь төгс нэвтрэх цэгийг сонгохоос илүү үр дүнтэй байдаг.';

  @override
  String get strategy_smartGoalsTitle => 'SMART зорилтууд';

  @override
  String get strategy_smartGoalsBody =>
      'Таны зорилго тодорхой, хэмжигдэхүйц, хүрч болохуйц, хамааралтай, цаг хугацаатай байх ёстой.';

  @override
  String get strategy_503020Title => '50-30-20 дүрэм';

  @override
  String get strategy_503020Body =>
      'Төсөв боловсруулах энгийн бүтэц: 50% хэрэгцээ, 30% хүсэл, 20% хөрөнгө оруулалт, зорилго.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Хөрөнгийн хуваарилалт (дэвшилтэт)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Зорилго, хэтийн төлөвөөр хуваарилалтыг хэрхэн бий болгох, эрсдэл, хамаарал, тэнцвэрийг тохируулах талаар суралц.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Глобал ETF болон индексүүд (дэвшилтэт)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Глобал индексүүд (жишээ нь, S&P 500), ETF-ийн талаар болон олон улсын хэмжээнд хэрхэн танин мэдэхүйг сахилга баттай болгох талаар суралц.';

  @override
  String get strategy_deepDive_taxesTitle => 'Татвар ба тайлан (дэвшилтэт)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Татварын үндсэн ойлголтууд болон хөрөнгө оруулалтыг найдвартай тайлагнах бүртгэлийг хэрхэн хөтлөх талаар ойлгох.';

  @override
  String get strategy_premiumLockedBody =>
      'Дээд зэрэглэлийн контент. Хөрөнгө оруулалтын Deep Dive-ийн түгжээг нээхийн тулд Cyber/Grimm/Hive загварыг идэвхжүүл.';

  @override
  String get homeShowcaseTitle => 'үзэсгэлэн';

  @override
  String get homeShowcaseProfileSimTitle => 'Эрсдэлийн талаарх асуулт хариулт';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Хэдэн минутын дотор өөрийн хөрөнгө оруулагчийн профайлыг олоорой.';

  @override
  String get homeShowcaseStrategiesTitle => 'Санал болгож буй стратеги';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Стратегийг сурч, хэрэгжүүлэх шууд товчлолууд.';

  @override
  String get homeShowcaseMentorHubTitle => 'Ментор: Асуулт ба стратеги';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Эрсдлийн профайлын тест болон санал болгож буй стратегид хурдан нэвтрэх.';

  @override
  String get homeTourStepClassicTitle => 'Сонгодог горим';

  @override
  String get homeTourStepClassicBody =>
      'Анхны програмын самбарыг нээнэ: гүйлгээ, зорилго, хөрөнгө оруулалт болон танил байрлал дахь тохиргоо.';

  @override
  String get homeTourStepVitrineTitle => 'Үзүүлэнгийн талбай';

  @override
  String get homeTourStepVitrineBody =>
      'Сурах, дадлага хийх товчлолууд: хөрөнгө оруулагчийн танилцуулга, стратеги, Менторын төв.';

  @override
  String get homeTourStepProfileTitle => 'Хувийн асуулт хариулт';

  @override
  String get homeTourStepProfileBody =>
      'Асуулгад хариулж эрсдэлийн профайлаа олж мэдээд, нийцүүлсэн зөвлөмжүүдийг харна уу.';

  @override
  String get homeTourStepStrategiesTitle => 'стратеги';

  @override
  String get homeTourStepStrategiesBody =>
      'Санхүүгээ цэгцлэх, сахилга баттай хөрөнгө оруулалт хийх, нийтлэг бэрхшээлээс зайлсхийх контент.';

  @override
  String get homeTourStepHubTitle => 'Менторын төв';

  @override
  String get homeTourStepHubBody =>
      'Профайлын тест болон санал болгож буй стратегиудын шуурхай цэс.';

  @override
  String get homeTourStepPremiumTitle => 'Дээд зэрэглэлийн онцлог';

  @override
  String get homeTourStepPremiumBody =>
      'Автомат зааварчилгаа, дэвшилтэт графикууд болон сарын тайлангуудыг Дээд зэрэглэлийн захиалгаар авах боломжтой.';

  @override
  String get homeTourStepMarketTitle => 'Зах зээлийн агшин зураг';

  @override
  String get homeTourStepMarketBody =>
      'Танай бүс нутаг дээр суурилсан зах зээлийн нөхцөл байдал (Бразил эсвэл дэлхийн) болон хөрвүүлсэн цэвэр хөрөнгө.';

  @override
  String get homeTourStepCalculatorTitle => 'Менторын тооцоолуур';

  @override
  String get homeTourStepCalculatorBody =>
      'Нийлмэл хүү, инфляцийг дуурайж, баялгийн графикийг харах; Дараа нь бид энэ хэрэгслийг нээнэ.';

  @override
  String get quizProfile_title => 'Эрсдэлийн талаарх асуулт хариулт';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Асуулт $total-н $current';
  }

  @override
  String get quizProfile_badge => 'ЭРСДЛИЙН ТУРШИЙН ТУХАЙ АСУУЛГА';

  @override
  String get quizProfile_resultTitle => 'ТАНЫ профайл';

  @override
  String get quizProfile_idealInvestmentsTitle =>
      'хамгийн тохиромжтой хөрөнгө оруулалт:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ХӨРӨНГӨ ОРУУЛАЛТЫГ СУДАЛЦАХ';

  @override
  String get quizProfile_exit => 'ГАРАЛТ';

  @override
  String get quizKnowledge_title => 'Мэдлэгийн асуулт хариулт';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Асуулт $total-н $current';
  }
}

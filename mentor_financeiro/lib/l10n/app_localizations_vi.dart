// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Cố vấn tài chính\nCảnh báo chi tiêu';

  @override
  String get saldo => '';

  @override
  String get gastosDiarios => 'Chi phí hàng ngày';

  @override
  String get confirmarTransacao => 'Xác nhận giao dịch\nTuyên bố';

  @override
  String get extrato => 'Chuyển khoản';

  @override
  String get transferencias => 'Đầu tư';

  @override
  String get investimentos => 'Cài đặt';

  @override
  String get configuracoes => 'Hồ sơ';

  @override
  String get perfil => '';

  @override
  String get sair => 'Đăng xuất';

  @override
  String get entrar => 'Đăng nhập';

  @override
  String get cadastrar => 'Đăng ký';

  @override
  String get email => 'Mật khẩu';

  @override
  String get senha => 'Tên';

  @override
  String get nome => 'Số ID';

  @override
  String get cpf => 'Điện thoại';

  @override
  String get telefone => '';

  @override
  String get continuar => 'Tiếp tục';

  @override
  String get voltar => 'Quay lại';

  @override
  String get cancelar => 'Hủy bỏ';

  @override
  String get salvar => 'Lưu';

  @override
  String get editar => 'Chỉnh sửa';

  @override
  String get excluir => 'Xóa';

  @override
  String get sucesso => 'Thành công\nLỗi';

  @override
  String get erro => 'Đang tải...';

  @override
  String get carregando => 'Loading...';

  @override
  String get semDados => 'Không có dữ liệu';

  @override
  String get tentarNovamente => 'Thử lại\nBáo cáo';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'Chi phí theo danh mục';

  @override
  String get ultimosSeteDias => '7 ngày qua';

  @override
  String get totalGasto => 'Tổng chi tiêu\nGiao dịch';

  @override
  String get transacoes => 'Danh mục';

  @override
  String get categoria => '';

  @override
  String get data => 'Ngày\nGiá trị';

  @override
  String get valor => 'Mô tả';

  @override
  String get descricao => '';

  @override
  String get alimentacao => 'Thực phẩm';

  @override
  String get transporte => 'Vận Chuyển';

  @override
  String get lazer => 'Giải trí';

  @override
  String get saude => 'Sức khỏe';

  @override
  String get outros => 'Khác\nThông báo';

  @override
  String get notificacoes => 'Quyền thông báo';

  @override
  String get permissaoNotificacoes => '';

  @override
  String get ativarMonitoramento => 'Kích hoạt tính năng giám sát chi phí';

  @override
  String get descricaoMonitoramento =>
      'Cho phép ứng dụng tự động giám sát các giao dịch ngân hàng của bạn để sắp xếp tài chính của bạn.\nNgôn ngữ';

  @override
  String get idioma => '';

  @override
  String get moeda => 'Tiền tệ';

  @override
  String get compararInvestimentos => 'So sánh đầu tư';

  @override
  String get descricaoLocalizacao =>
      'Để so sánh đầu tư địa phương (CDB/CDI) với tỷ giá quốc tế, chúng tôi cần vị trí của bạn.\nYêu cầu quyền truy cập vị trí';

  @override
  String get permissaoLocalizacaoNecessaria => '';

  @override
  String get rendaFixa => 'Thu nhập cố định';

  @override
  String get rendaVariavel => 'Thu nhập biến đổi';

  @override
  String get tesouroDireto => 'Kho bạc trực tiếp';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA\nCổ phiếu';

  @override
  String get acoes => '';

  @override
  String get fiis => 'FII\nTiền điện tử';

  @override
  String get criptomoedas => '';

  @override
  String get rendimento => 'Trở lại';

  @override
  String get rentabilidade => 'Khả năng sinh lời';

  @override
  String get aplicar => 'Áp dụng';

  @override
  String get resgatar => 'Đổi thưởng';

  @override
  String get simular => 'Mô phỏng\nBàn thắng';

  @override
  String get metas => '';

  @override
  String get estrategias => 'Kiến thức';

  @override
  String get conhecimento => 'Trò chuyện';

  @override
  String get chat => '';

  @override
  String get enviarMensagem => 'Gửi tin nhắn';

  @override
  String get digiteMensagem => 'Nhập tin nhắn...\nMẹo';

  @override
  String get alertaGastos => '';

  @override
  String alertaGastosMsg(int percent) {
    return 'Bạn đã sử dụng $percent% hạn mức tín dụng của mình.';
  }

  @override
  String get fechamentoFatura => 'Chốt hóa đơn';

  @override
  String get fechamentoFaturaMsg =>
      'Ngày mai là ngày đóng cửa. Thời gian tuyệt vời để xem xét chi phí.';

  @override
  String get faturaVencendo => 'Hóa đơn đến hạn';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Hóa đơn sẽ đến hạn sau $dias ngày nữa. Kiểm tra số dư của bạn.\nSố dư';
  }

  @override
  String get regra30 => ': Quy tắc 30%';

  @override
  String get regra30Msg =>
      'Duy trì mức sử dụng dưới 30% để cải thiện Điểm tín dụng của bạn.';

  @override
  String get diaDeOuro => 'Ngày Vàng!';

  @override
  String get diaDeOuroMsg =>
      'Giao dịch mua hàng của bạn hôm nay sẽ chỉ được thanh toán sau 40 ngày!';

  @override
  String get alertaJuros => 'Cảnh báo: Lãi suất';

  @override
  String get alertaJurosMsg =>
      'Số dư của bạn không đủ để thanh toán hóa đơn. Tránh tín dụng quay vòng!';

  @override
  String get notaSaude => 'Sức khỏe tài chính';

  @override
  String get notaExcelente => 'Tuyệt vời! Bạn có sức khỏe tài chính tuyệt vời.';

  @override
  String get notaBom => 'Tốt, nhưng có thể cải thiện.';

  @override
  String get notaAtencao => 'Chú ý chi tiêu.';

  @override
  String get notaRevisar => 'Xem lại tài chính của bạn.';

  @override
  String get mentorInsightTitle => 'Hướng dẫn cố vấn';

  @override
  String get mentorInsightLoading => 'Đang tìm nạp dữ liệu thị trường…';

  @override
  String get mentorInsightError =>
      'Không thể tải dữ liệu ngay bây giờ. Hãy thử lại ngay.';

  @override
  String get mentorInsightOffline =>
      'Bạn đang ngoại tuyến. Kết nối để lấy báo giá và thông tin chi tiết về Người cố vấn.';

  @override
  String get mentorAllocationDefensive =>
      'Với sự biến động hiện tại, hãy ưu tiên bảo toàn vốn và tính thanh khoản trước khi theo đuổi lợi nhuận.';

  @override
  String get mentorAllocationBalanced =>
      'Bảo vệ cân bằng và tăng trưởng: đa dạng hóa và xem xét lại chân trời mục tiêu của bạn.';

  @override
  String get mentorAllocationOffensive =>
      'Hồ sơ của bạn cho phép gặp nhiều rủi ro hơn: giữ kỷ luật và tránh tập trung cao độ.\nCác biểu tượng';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'đã được đánh giá: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Tự động (ngôn ngữ)\nMáy tính cố vấn';

  @override
  String get compoundCalculatorTitle => '— Lãi kép';

  @override
  String get compoundCalculatorSubtitle =>
      'Mô phỏng các khoản đóng góp, lợi nhuận danh nghĩa và lợi nhuận thực tế (sau lạm phát) và ghi chú của người cố vấn.';

  @override
  String get compoundInitialLabel => 'Số tiền trả một lần ban đầu';

  @override
  String get compoundMonthlyLabel => 'Đóng góp hàng tháng';

  @override
  String get compoundRateLabel => 'Lãi suất';

  @override
  String get compoundRateAnnual => 'mỗi năm';

  @override
  String get compoundRateMonthly => 'mỗi tháng';

  @override
  String get compoundHorizonLabel => 'Chân trời thời gian';

  @override
  String get compoundHorizonYears => 'năm';

  @override
  String get compoundHorizonMonths => 'tháng';

  @override
  String get compoundInflationLabel => 'Lạm phát ước tính (% mỗi năm)';

  @override
  String get compoundCalculate => 'Tính toán';

  @override
  String get compoundChartInvested => 'Tổng vốn đầu tư';

  @override
  String get compoundChartInterest => 'Tiền lãi kiếm được';

  @override
  String get compoundSummaryNominalEnd => 'Số dư cuối kỳ (danh nghĩa)';

  @override
  String get compoundSummaryRealGain =>
      'Lợi nhuận thực tế (sức mua)\nLời khuyên của cố vấn';

  @override
  String get compoundMentorCardTitle => '';

  @override
  String get compoundInvalidInput =>
      'Nhập các giá trị hợp lệ (đường chân trời > 0).\nÂm thanh cố vấn';

  @override
  String get userPersonaSectionTitle => '';

  @override
  String get userPersonaNovice => 'Người mới bắt đầu\nNhà chiến lược';

  @override
  String get userPersonaStrategist => '';

  @override
  String get userPersonaRiskTaker => 'Chấp nhận rủi ro';

  @override
  String get userPersonaConservative => 'Tiết kiệm';

  @override
  String get compoundOpenFullInsight =>
      'Mở thông tin chi tiết đầy đủ về cố vấn';

  @override
  String get investFirstSteps_title => 'Những bước đầu tiên';

  @override
  String get investFirstSteps_brokerTitle => 'Chọn nhà môi giới';

  @override
  String get investFirstSteps_brokerBody =>
      'Tìm kiếm các tổ chức có uy tín, được quản lý. So sánh phí, sản phẩm và độ tin cậy trước khi mở tài khoản.';

  @override
  String get investFirstSteps_openAccountTitle =>
      'Mở tài khoản của bạn\nTích hợp kỹ thuật số';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      '. Ở Brazil, bạn thường cần CPF/RG và đôi khi là bằng chứng về địa chỉ.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Việc tích hợp kỹ thuật số thay đổi tùy theo quốc gia. Thông thường, bạn cần có tài liệu ID và xác minh danh tính/địa chỉ.';

  @override
  String get investFirstSteps_transferTitle => 'Chuyển tiền';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Gửi tiền qua PIX hoặc chuyển khoản ngân hàng cho nhà môi giới của bạn. Số dư có sẵn để đầu tư.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Chuyển tiền qua chuyển khoản ngân hàng hoặc phương thức thanh toán địa phương (tùy thuộc vào quốc gia của bạn). Số dư có sẵn để đầu tư.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Biết hồ sơ rủi ro của bạn';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Trả lời bảng câu hỏi về mức độ phù hợp. Hiểu xem bạn là người bảo thủ, ôn hòa hay hung hăng.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Mua tài sản đầu tiên của bạn';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Bắt đầu với quỹ khẩn cấp (Tesouro Selic hoặc CDB thanh khoản hàng ngày). Sau đó đa dạng hóa dần dần.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Bắt đầu với quỹ khẩn cấp (tiền mặt lãi suất cao, quỹ thị trường tiền tệ hoặc trái phiếu kho bạc ngắn hạn). Sau đó đa dạng hóa dần dần.\nLời khuyên của cố vấn';

  @override
  String get investFirstSteps_tipTitle => ':';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Hãy bắt đầu với số tiền nhỏ, đầu tư đều đặn và tránh cố gắng tính toán thời điểm thị trường. Thời gian là đồng minh tốt nhất của bạn.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Hãy bắt đầu với số tiền nhỏ, đầu tư đều đặn và tránh cố gắng tính toán thời điểm thị trường. Thời gian là đồng minh tốt nhất của bạn.';

  @override
  String get investMenu_tesouroTitle => 'Kho bạc Brazil';

  @override
  String get investMenu_cdbTitle => 'Thu nhập cố định của Ngân hàng (CDB)';

  @override
  String get investMenu_etfsTitle => 'ETF quốc tế';

  @override
  String get investMenu_sp500Title => 'S&P 500 (chỉ số)\nCổ phiếu';

  @override
  String get investMenu_stocksTitle => 'Quỹ';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII\nREIT';

  @override
  String get investMenu_reitsTitle => '';

  @override
  String get investMenu_internationalTitle => 'quốc tế\nTiền điện tử';

  @override
  String get investMenu_cryptoTitle => '';

  @override
  String get investRegisterCta => 'Đăng ký đầu tư';

  @override
  String investRegionHintBr(String country) {
    return 'Quốc gia hiệu quả: $country · Danh mục Brazil (Kho bạc, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Quốc gia hiệu quả: $country · Danh mục toàn cầu (ETF, NYSE/NASDAQ…). Tự động điều chỉnh từ khu vực thiết bị của bạn.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Chiến lược thiết yếu\nLặn sâu';

  @override
  String get strategy_sectionDeepDiveTitle => '(Cao cấp)\nQuỹ khẩn cấp';

  @override
  String get strategy_emergencyFundTitle => '';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Lá chắn tài chính của bạn. Chi trả chi phí từ 6–12 tháng. Ưu tiên thanh khoản hàng ngày và rủi ro thấp (ví dụ: Tesouro Selic hoặc CDB được liên kết với CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Lá chắn tài chính của bạn. Chi trả chi phí từ 6–12 tháng. Ưu tiên thanh khoản hàng ngày và rủi ro thấp (ví dụ: quỹ thị trường tiền tệ và trái phiếu kho bạc ngắn hạn).';

  @override
  String get strategy_buyHoldTitle => 'Mua và Giữ';

  @override
  String get strategy_buyHoldBody =>
      'Mua tài sản chất lượng và nắm giữ lâu dài. Tập trung vào kỷ luật, chất lượng và tái đầu tư theo thời gian.';

  @override
  String get strategy_diversificationTitle => 'Đa dạng hóa';

  @override
  String get strategy_diversificationBodyBr =>
      'Phân bổ vốn của bạn cho thu nhập cố định, cổ phiếu, FII và tài sản quốc tế để giảm rủi ro và cải thiện lợi nhuận được điều chỉnh theo rủi ro.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Phân bổ vốn của bạn vào trái phiếu, cổ phiếu, REIT và rủi ro quốc tế để giảm rủi ro và cải thiện lợi nhuận được điều chỉnh theo rủi ro.';

  @override
  String get strategy_dcaTitle => 'Tính trung bình chi phí bằng đô la (DCA)';

  @override
  String get strategy_dcaBody =>
      'Tính nhất quán đánh bại thiên tài. Đầu tư hàng tháng thường hiệu quả hơn việc cố gắng chọn điểm vào lệnh hoàn hảo.\nMục tiêu THÔNG MINH';

  @override
  String get strategy_smartGoalsTitle => '';

  @override
  String get strategy_smartGoalsBody =>
      'Mục tiêu của bạn phải cụ thể, đo lường được, có thể đạt được, phù hợp và có thời hạn.\nQuy tắc';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Một khuôn khổ lập ngân sách đơn giản: 50% nhu cầu, 30% mong muốn, 20% đầu tư và mục tiêu.';

  @override
  String get strategy_deepDive_allocationTitle => 'Phân bổ tài sản (nâng cao)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Tìm hiểu cách xây dựng phân bổ theo mục tiêu và tầm nhìn, điều chỉnh rủi ro, mối tương quan và tái cân bằng.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETF và chỉ số toàn cầu (nâng cao)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Tìm hiểu về các chỉ số toàn cầu (ví dụ: S&P 500), quỹ ETF và cách xây dựng khả năng tiếp cận quốc tế một cách kỷ luật.';

  @override
  String get strategy_deepDive_taxesTitle => 'Thuế và báo cáo (nâng cao)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Hiểu các khái niệm cốt lõi về thuế và cách lưu giữ hồ sơ để báo cáo khoản đầu tư một cách an toàn.';

  @override
  String get strategy_premiumLockedBody =>
      'Nội dung cao cấp. Kích hoạt chủ đề Cyber/Grimm/Hive để mở khóa khoản đầu tư Deep Dive.\nPhòng trưng bày';

  @override
  String get homeShowcaseTitle => '';

  @override
  String get homeShowcaseProfileSimTitle => 'Câu hỏi về hồ sơ rủi ro';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Tìm hồ sơ nhà đầu tư của bạn trong vài phút.';

  @override
  String get homeShowcaseStrategiesTitle => 'Chiến lược được đề xuất';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Phím tắt trực tiếp để tìm hiểu và áp dụng các chiến lược.\nNgười cố vấn';

  @override
  String get homeShowcaseMentorHubTitle => ': Câu đố & Chiến lược';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Truy cập nhanh vào bài kiểm tra hồ sơ rủi ro và các chiến lược được đề xuất.';

  @override
  String get homeTourStepClassicTitle => 'Chế độ cổ điển';

  @override
  String get homeTourStepClassicBody =>
      'Mở bảng ứng dụng gốc: giao dịch, mục tiêu, đầu tư và cài đặt theo bố cục quen thuộc.\nKhu vực trưng bày';

  @override
  String get homeTourStepVitrineTitle => '';

  @override
  String get homeTourStepVitrineBody =>
      'Các phím tắt để học và thực hành: hồ sơ nhà đầu tư, chiến lược và trung tâm Mentor.\nCâu đố hồ sơ';

  @override
  String get homeTourStepProfileTitle => '';

  @override
  String get homeTourStepProfileBody =>
      'Trả lời bảng câu hỏi để khám phá hồ sơ rủi ro của bạn và xem các đề xuất phù hợp.\nChiến lược';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Nội dung tổ chức tài chính, đầu tư có kỷ luật và tránh những cạm bẫy thường gặp.\nTrung tâm cố vấn';

  @override
  String get homeTourStepHubTitle => '';

  @override
  String get homeTourStepHubBody =>
      'Menu nhanh cho bài kiểm tra hồ sơ và các chiến lược được đề xuất.\nTính năng cao cấp của';

  @override
  String get homeTourStepPremiumTitle => '';

  @override
  String get homeTourStepPremiumBody =>
      'Tư vấn tự động, biểu đồ nâng cao và báo cáo hàng tháng — có sẵn khi đăng ký Premium.';

  @override
  String get homeTourStepMarketTitle => 'Ảnh chụp nhanh thị trường';

  @override
  String get homeTourStepMarketBody =>
      'Bối cảnh thị trường (Brazil hoặc toàn cầu) dựa trên khu vực của bạn cộng với giá trị ròng được chuyển đổi.\nMáy tính Mentor';

  @override
  String get homeTourStepCalculatorTitle => '';

  @override
  String get homeTourStepCalculatorBody =>
      'Mô phỏng lãi kép, lạm phát và xem biểu đồ tài sản; tiếp theo chúng ta mở công cụ này.\nCâu hỏi về hồ sơ rủi ro';

  @override
  String get quizProfile_title => '';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Câu hỏi $current của $total\nCÂU HỎI HỒ SƠ RỦI RO';
  }

  @override
  String get quizProfile_badge => '';

  @override
  String get quizProfile_resultTitle => 'HỒ SƠ CỦA BẠN LÀ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'KHOẢN ĐẦU TƯ LÝ TƯỞNG:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'KHÁM PHÁ ĐẦU TƯ';

  @override
  String get quizProfile_exit => 'LỐI THOÁT';

  @override
  String get quizKnowledge_title => 'Trắc nghiệm kiến thức';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Câu hỏi $current của $total';
  }
}

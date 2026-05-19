// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '멘토금융';

  @override
  String get saldo => '밸런스';

  @override
  String get gastosDiarios => '일일 비용';

  @override
  String get confirmarTransacao => '거래 확인';

  @override
  String get extrato => '성명서';

  @override
  String get transferencias => '환승';

  @override
  String get investimentos => '투자';

  @override
  String get configuracoes => '설정';

  @override
  String get perfil => '프로필';

  @override
  String get sair => '로그아웃';

  @override
  String get entrar => '로그인';

  @override
  String get cadastrar => '등록';

  @override
  String get email => '이메일';

  @override
  String get senha => '비밀번호';

  @override
  String get nome => '이름';

  @override
  String get cpf => 'ID 번호';

  @override
  String get telefone => '전화';

  @override
  String get continuar => '계속';

  @override
  String get voltar => '돌아가기';

  @override
  String get cancelar => '취소';

  @override
  String get salvar => '저장하기';

  @override
  String get editar => '편집';

  @override
  String get excluir => '삭제';

  @override
  String get sucesso => '성공';

  @override
  String get erro => '오류';

  @override
  String get carregando => '로드 중...';

  @override
  String get semDados => '데이터가 없습니다';

  @override
  String get tentarNovamente => '다시 시도해 보세요';

  @override
  String get relatorios => '보고서';

  @override
  String get gastosPorCategoria => '범주별 비용';

  @override
  String get ultimosSeteDias => '지난 7일';

  @override
  String get totalGasto => '총 지출';

  @override
  String get transacoes => '거래';

  @override
  String get categoria => '카테고리';

  @override
  String get data => '날짜';

  @override
  String get valor => '값';

  @override
  String get descricao => '설명';

  @override
  String get alimentacao => '음식';

  @override
  String get transporte => '운송';

  @override
  String get lazer => '레저';

  @override
  String get saude => '건강';

  @override
  String get outros => '기타';

  @override
  String get notificacoes => '알림';

  @override
  String get permissaoNotificacoes => '알림 권한';

  @override
  String get ativarMonitoramento => '비용 모니터링 활성화';

  @override
  String get descricaoMonitoramento =>
      '앱이 은행 거래를 자동으로 모니터링하여 재정을 정리할 수 있도록 허용합니다.';

  @override
  String get idioma => '언어';

  @override
  String get moeda => '통화';

  @override
  String get compararInvestimentos => '투자 비교';

  @override
  String get descricaoLocalizacao =>
      '국내 투자(CDB/CDI)를 국제 금리와 비교하려면 귀하의 위치가 필요합니다.';

  @override
  String get permissaoLocalizacaoNecessaria => '위치 권한 필요';

  @override
  String get rendaFixa => '고정수익';

  @override
  String get rendaVariavel => '가변소득';

  @override
  String get tesouroDireto => '재무부 직접';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => '주식';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => '암호화폐';

  @override
  String get rendimento => '반환';

  @override
  String get rentabilidade => '수익성';

  @override
  String get aplicar => '적용';

  @override
  String get resgatar => '상환';

  @override
  String get simular => '시뮬레이션';

  @override
  String get metas => '목표';

  @override
  String get estrategias => '전략';

  @override
  String get conhecimento => '지식';

  @override
  String get chat => '채팅';

  @override
  String get enviarMensagem => '메시지 보내기';

  @override
  String get digiteMensagem => '메시지를 입력하세요...';

  @override
  String get alertaGastos => '지출 경고';

  @override
  String alertaGastosMsg(int percent) {
    return '귀하는 이미 신용 한도의 $percent%를 사용했습니다.';
  }

  @override
  String get fechamentoFatura => '송장 마감';

  @override
  String get fechamentoFaturaMsg => '내일은 휴무입니다. 비용을 검토하기에 좋은 시간입니다.';

  @override
  String get faturaVencendo => '송장 기한';

  @override
  String faturaVencendoMsg(int dias) {
    return '송장 만기일은 $dias일입니다. 잔액을 확인하세요.';
  }

  @override
  String get regra30 => '팁: 30% 규칙';

  @override
  String get regra30Msg => '신용 점수를 높이려면 사용량을 30% 미만으로 유지하세요.';

  @override
  String get diaDeOuro => '골든데이!';

  @override
  String get diaDeOuroMsg => '오늘 구매하신 금액은 40일 후에만 지급됩니다!';

  @override
  String get alertaJuros => '경고: 이자';

  @override
  String get alertaJurosMsg => '잔액이 청구서를 충당하지 않습니다. 회전 신용을 피하십시오!';

  @override
  String get notaSaude => '재무 건전성';

  @override
  String get notaExcelente => '훌륭해요! 당신은 재정적으로 건강합니다.';

  @override
  String get notaBom => '좋지만 개선할 수 있습니다.';

  @override
  String get notaAtencao => '지출에 주의하세요.';

  @override
  String get notaRevisar => '재정 상태를 검토하세요.';

  @override
  String get mentorInsightTitle => '멘토 지도';

  @override
  String get mentorInsightLoading => '시장 데이터를 가져오는 중…';

  @override
  String get mentorInsightError => '지금은 데이터를 로드할 수 없습니다. 잠시 후 다시 시도하세요.';

  @override
  String get mentorInsightOffline => '오프라인 상태입니다. 견적과 멘토 인사이트를 가져오려면 연결하세요.';

  @override
  String get mentorAllocationDefensive =>
      '현재의 변동성을 고려하여 수익을 추구하기 전에 자본 보존과 유동성을 우선시하십시오.';

  @override
  String get mentorAllocationBalanced => '보호와 성장의 균형: 목표 범위를 다양화하고 재검토하세요.';

  @override
  String get mentorAllocationOffensive =>
      '귀하의 프로필은 더 많은 위험을 허용합니다. 규율을 유지하고 과도한 집중을 피하십시오.';

  @override
  String mentorInsightSymbols(String symbols) {
    return '검토된 기호: $symbols';
  }

  @override
  String get currencyFollowLocale => '자동(언어)';

  @override
  String get compoundCalculatorTitle => '멘토 계산기 — 복리';

  @override
  String get compoundCalculatorSubtitle =>
      '기여도, 명목 대 실질 이익(인플레이션 후) 및 멘토 메모를 시뮬레이션합니다.';

  @override
  String get compoundInitialLabel => '초기 일시불';

  @override
  String get compoundMonthlyLabel => '월 기여금';

  @override
  String get compoundRateLabel => '이자율\n연간';

  @override
  String get compoundRateAnnual => '월별';

  @override
  String get compoundRateMonthly => '';

  @override
  String get compoundHorizonLabel => '시간의 지평';

  @override
  String get compoundHorizonYears => '년';

  @override
  String get compoundHorizonMonths => '개월';

  @override
  String get compoundInflationLabel => '예상 인플레이션(연간 %)';

  @override
  String get compoundCalculate => '계산하다';

  @override
  String get compoundChartInvested => '총 투자액';

  @override
  String get compoundChartInterest => '이자수익';

  @override
  String get compoundSummaryNominalEnd => '기말잔액(명목)';

  @override
  String get compoundSummaryRealGain => '실질이득(구매력)';

  @override
  String get compoundMentorCardTitle => '멘토의 조언';

  @override
  String get compoundInvalidInput => '유효한 값을 입력하십시오(수평 > 0).';

  @override
  String get userPersonaSectionTitle => '멘토톤';

  @override
  String get userPersonaNovice => '초급';

  @override
  String get userPersonaStrategist => '전략가';

  @override
  String get userPersonaRiskTaker => '위험을 감수하는 사람';

  @override
  String get userPersonaConservative => '세이버';

  @override
  String get compoundOpenFullInsight => '전체 멘토 인사이트 공개';

  @override
  String get investFirstSteps_title => '첫 번째 단계';

  @override
  String get investFirstSteps_brokerTitle => '브로커를 선택하세요';

  @override
  String get investFirstSteps_brokerBody =>
      '규제되고 평판이 좋은 기관을 찾으십시오. 계좌를 개설하기 전에 수수료, 상품, 신뢰성을 비교해보세요.';

  @override
  String get investFirstSteps_openAccountTitle => '계정을 개설하세요';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      '디지털 온보딩. 브라질에서는 일반적으로 CPF/RG가 필요하며 경우에 따라 주소 증명이 필요합니다.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      '디지털 온보딩은 국가마다 다릅니다. 일반적으로 신분증과 신원/주소 확인이 필요합니다.';

  @override
  String get investFirstSteps_transferTitle => '자금 이체';

  @override
  String get investFirstSteps_transferBodyBr =>
      'PIX 또는 은행 송금을 통해 브로커에게 송금하세요. 잔액을 투자할 수 있게 됩니다.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      '은행 송금 또는 현지 결제 방법(국가에 따라 다름)을 통해 자금을 이체하세요. 잔액을 투자할 수 있게 됩니다.';

  @override
  String get investFirstSteps_riskProfileTitle => '위험 프로필을 파악하세요';

  @override
  String get investFirstSteps_riskProfileBody =>
      '적합성 설문지에 답하세요. 당신이 보수적인지, 온건한지, 공격적인지 이해하십시오.';

  @override
  String get investFirstSteps_firstAssetTitle => '첫 번째 자산 구매';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      '비상 자금(Tesouro Selic 또는 일일 유동성 CDB)으로 시작하세요. 그런 다음 점차적으로 다양화하십시오.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      '비상 자금(고수익 현금, 머니마켓 자금 또는 단기 국채)으로 시작하세요. 그런 다음 점차적으로 다양화하십시오.';

  @override
  String get investFirstSteps_tipTitle => '멘토 팁:';

  @override
  String get investFirstSteps_tipBodyBr =>
      '작게 시작하고 지속적으로 투자하며 시장 타이밍을 맞추려고 노력하지 마십시오. 시간은 최고의 동맹자입니다.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      '작게 시작하고 지속적으로 투자하며 시장 타이밍을 맞추려는 노력을 피하십시오. 시간은 최고의 동맹자입니다.';

  @override
  String get investMenu_tesouroTitle => '브라질 국채';

  @override
  String get investMenu_cdbTitle => '은행 채권(CDB)';

  @override
  String get investMenu_etfsTitle => '국제 ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (지수)';

  @override
  String get investMenu_stocksTitle => '주식';

  @override
  String get investMenu_fundsTitle => '자금';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => '리츠';

  @override
  String get investMenu_internationalTitle => '국제';

  @override
  String get investMenu_cryptoTitle => '암호화폐';

  @override
  String get investRegisterCta => '투자등록';

  @override
  String investRegionHintBr(String country) {
    return '적용 국가: $country · 브라질 카탈로그(국채, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return '적용 국가: $country · 글로벌 카탈로그(ETF, NYSE/NASDAQ…). 장치 지역에서 자동으로 조정됩니다.';
  }

  @override
  String get strategy_sectionCoreTitle => '필수 전략';

  @override
  String get strategy_sectionDeepDiveTitle => '심층 다이브(프리미엄)';

  @override
  String get strategy_emergencyFundTitle => '긴급자금';

  @override
  String get strategy_emergencyFundBodyBr =>
      '재정적 보호를 제공합니다. 6~12개월의 비용을 충당합니다. 일일 유동성과 낮은 위험을 우선시합니다(예: Tesouro Selic 또는 CDI 연결 CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      '재정적 보호를 제공합니다. 6~12개월의 비용을 충당합니다. 일일 유동성과 낮은 위험(예: 머니 마켓 펀드 및 단기 국채)을 우선시합니다.';

  @override
  String get strategy_buyHoldTitle => '매수 후 보유';

  @override
  String get strategy_buyHoldBody =>
      '우량 자산을 구매하고 장기적으로 보유하세요. 시간이 지남에 따라 규율, 품질 및 재투자에 중점을 둡니다.';

  @override
  String get strategy_diversificationTitle => '다양화';

  @override
  String get strategy_diversificationBodyBr =>
      '채권, 주식, FII 및 해외 자산에 자본을 분산시켜 위험을 줄이고 위험 조정 수익률을 높이세요.';

  @override
  String get strategy_diversificationBodyGlobal =>
      '채권, 주식, REIT 및 해외 노출에 자본을 분산시켜 위험을 줄이고 위험 조정 수익을 향상시키세요.';

  @override
  String get strategy_dcaTitle => '달러 비용 평균(DCA)';

  @override
  String get strategy_dcaBody =>
      '일관성이 천재성을 이긴다. 매달 투자하는 것이 완벽한 진입점을 선택하려고 노력하는 것보다 더 효과적인 경우가 많습니다.';

  @override
  String get strategy_smartGoalsTitle => '스마트 목표';

  @override
  String get strategy_smartGoalsBody =>
      '목표는 구체적이고, 측정 가능하고, 달성 가능하고, 관련성이 있고, 기한이 정해져 있어야 합니다.';

  @override
  String get strategy_503020Title => '50-30-20 규칙';

  @override
  String get strategy_503020Body => '간단한 예산 체계: 필요 50%, 원하는 30%, 투자 및 목표 20%.';

  @override
  String get strategy_deepDive_allocationTitle => '자산 배분(고급)';

  @override
  String get strategy_deepDive_allocationBody =>
      '목표와 기간별로 할당을 구축하고 위험을 조정하고 상관 관계를 조정하고 재조정하는 방법을 알아보세요.';

  @override
  String get strategy_deepDive_globalEtfsTitle => '글로벌 ETF 및 지수(고급)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      '글로벌 지수(예: S&P 500), ETF 및 규율을 통해 국제 노출을 구축하는 방법에 대해 알아보세요.';

  @override
  String get strategy_deepDive_taxesTitle => '세금 및 보고(고급)';

  @override
  String get strategy_deepDive_taxesBody =>
      '핵심 세금 개념과 투자를 안전하게 보고하기 위한 기록 보관 방법을 이해하세요.';

  @override
  String get strategy_premiumLockedBody =>
      '프리미엄 콘텐츠. Cyber/Grimm/Hive 테마를 활성화하여 투자 심층 분석을 잠금 해제하세요.';

  @override
  String get homeShowcaseTitle => '쇼케이스';

  @override
  String get homeShowcaseProfileSimTitle => '위험 프로필 퀴즈';

  @override
  String get homeShowcaseProfileSimSubtitle => '몇 분 안에 귀하의 투자자 프로필을 찾아보세요.';

  @override
  String get homeShowcaseStrategiesTitle => '추천 전략';

  @override
  String get homeShowcaseStrategiesSubtitle => '전략을 배우고 적용할 수 있는 직접적인 지름길입니다.';

  @override
  String get homeShowcaseMentorHubTitle => '멘토: 퀴즈 및 전략';

  @override
  String get homeShowcaseMentorHubSubtitle => '위험 프로필 퀴즈 및 권장 전략에 빠르게 액세스하세요.';

  @override
  String get homeTourStepClassicTitle => '클래식 모드';

  @override
  String get homeTourStepClassicBody =>
      '익숙한 레이아웃으로 거래, 목표, 투자 및 설정이 포함된 원래 앱 패널을 엽니다.';

  @override
  String get homeTourStepVitrineTitle => '쇼케이스 공간';

  @override
  String get homeTourStepVitrineBody =>
      '배우고 실천할 수 있는 지름길: 투자자 프로필, 전략 및 멘토 허브.';

  @override
  String get homeTourStepProfileTitle => '프로필 퀴즈';

  @override
  String get homeTourStepProfileBody =>
      '귀하의 위험 프로필을 알아보고 정렬된 제안을 보려면 설문지에 응답하십시오.';

  @override
  String get homeTourStepStrategiesTitle => '전략';

  @override
  String get homeTourStepStrategiesBody =>
      '재정을 정리하고 규율에 따라 투자하며 일반적인 함정을 피하는 콘텐츠입니다.';

  @override
  String get homeTourStepHubTitle => '멘토 허브';

  @override
  String get homeTourStepHubBody => '프로필 퀴즈와 추천 전략을 볼 수 있는 퀵 메뉴입니다.';

  @override
  String get homeTourStepPremiumTitle => '프리미엄 기능';

  @override
  String get homeTourStepPremiumBody =>
      '자동 멘토링, 고급 차트 및 월별 보고서는 프리미엄 구독으로 이용 가능합니다.';

  @override
  String get homeTourStepMarketTitle => '시장 현황';

  @override
  String get homeTourStepMarketBody =>
      '해당 지역과 환산 순자산을 기반으로 한 시장 상황(브라질 또는 글로벌)입니다.';

  @override
  String get homeTourStepCalculatorTitle => '멘토 계산기';

  @override
  String get homeTourStepCalculatorBody =>
      '복리, 인플레이션을 시뮬레이션하고 자산 차트를 확인하세요. 다음으로 이 도구를 엽니다.';

  @override
  String get quizProfile_title => '위험 프로필 퀴즈';

  @override
  String quizProfile_progress(int current, int total) {
    return '질문 $current/$total';
  }

  @override
  String get quizProfile_badge => '위험 프로필 퀴즈';

  @override
  String get quizProfile_resultTitle => '귀하의 프로필은 다음과 같습니다';

  @override
  String get quizProfile_idealInvestmentsTitle => '이상적인 투자:';

  @override
  String get quizProfile_exploreInvestmentsCta => '투자 살펴보기';

  @override
  String get quizProfile_exit => '종료';

  @override
  String get quizKnowledge_title => '지식퀴즈';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '질문 $current/$total';
  }
}

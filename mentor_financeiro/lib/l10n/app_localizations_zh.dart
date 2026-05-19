// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '导师财务';

  @override
  String get saldo => '平衡';

  @override
  String get gastosDiarios => '日常开支';

  @override
  String get confirmarTransacao => '确认交易';

  @override
  String get extrato => '声明';

  @override
  String get transferencias => '转账';

  @override
  String get investimentos => '投资';

  @override
  String get configuracoes => '设置';

  @override
  String get perfil => '简介';

  @override
  String get sair => '退出';

  @override
  String get entrar => '登录';

  @override
  String get cadastrar => '注册';

  @override
  String get email => '邮箱';

  @override
  String get senha => '密码';

  @override
  String get nome => '名称';

  @override
  String get cpf => '身份证号码';

  @override
  String get telefone => '电话';

  @override
  String get continuar => '继续';

  @override
  String get voltar => '返回';

  @override
  String get cancelar => '取消';

  @override
  String get salvar => '保存';

  @override
  String get editar => '编辑';

  @override
  String get excluir => '删除';

  @override
  String get sucesso => '成功';

  @override
  String get erro => '错误';

  @override
  String get carregando => '加载中...';

  @override
  String get semDados => '无数据';

  @override
  String get tentarNovamente => '再试一次';

  @override
  String get relatorios => '报告';

  @override
  String get gastosPorCategoria => '按类别列出的费用';

  @override
  String get ultimosSeteDias => '最近 7 天';

  @override
  String get totalGasto => '总花费';

  @override
  String get transacoes => '交易';

  @override
  String get categoria => '类别';

  @override
  String get data => '日期';

  @override
  String get valor => '值';

  @override
  String get descricao => '说明';

  @override
  String get alimentacao => '食品';

  @override
  String get transporte => '运输';

  @override
  String get lazer => '休闲';

  @override
  String get saude => '健康';

  @override
  String get outros => '其他';

  @override
  String get notificacoes => '通知';

  @override
  String get permissaoNotificacoes => '通知权限';

  @override
  String get ativarMonitoramento => '启用费用监控';

  @override
  String get descricaoMonitoramento => '允许应用程序自动监控您的银行交易以整理您的财务状况。';

  @override
  String get idioma => '语言';

  @override
  String get moeda => '货币';

  @override
  String get compararInvestimentos => '比较投资';

  @override
  String get descricaoLocalizacao => '要将本地投资 (CDB/CDI) 与国际利率进行比较，我们需要您的位置。';

  @override
  String get permissaoLocalizacaoNecessaria => '需要位置许可';

  @override
  String get rendaFixa => '固定收益';

  @override
  String get rendaVariavel => '可变收入';

  @override
  String get tesouroDireto => '财政部直接';

  @override
  String get cdb => '国开行';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => '库存';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => '加密货币';

  @override
  String get rendimento => '返回';

  @override
  String get rentabilidade => '盈利能力';

  @override
  String get aplicar => '申请';

  @override
  String get resgatar => '兑换';

  @override
  String get simular => '模拟';

  @override
  String get metas => '目标';

  @override
  String get estrategias => '策略';

  @override
  String get conhecimento => '知识';

  @override
  String get chat => '聊天';

  @override
  String get enviarMensagem => '发送信息';

  @override
  String get digiteMensagem => '输入一条消息...';

  @override
  String get alertaGastos => '消费提醒';

  @override
  String alertaGastosMsg(int percent) {
    return '您已使用信用额度的 $percent%。';
  }

  @override
  String get fechamentoFatura => '发票结账';

  @override
  String get fechamentoFaturaMsg => '明天休息日。审查费用的好时机。';

  @override
  String get faturaVencendo => '应付发票';

  @override
  String faturaVencendoMsg(int dias) {
    return '发票将于 $dias 天到期。检查您的余额。';
  }

  @override
  String get regra30 => '小费：30% 规则';

  @override
  String get regra30Msg => '将使用率保持在 30% 以下，以提高您的信用评分。';

  @override
  String get diaDeOuro => '黄金日！';

  @override
  String get diaDeOuroMsg => '您今天购买的商品将在 40 天内付款！';

  @override
  String get alertaJuros => '警告：利息';

  @override
  String get alertaJurosMsg => '您的余额不足以支付账单。避免循环信贷！';

  @override
  String get notaSaude => '财务健康';

  @override
  String get notaExcelente => '太棒了！您的财务状况良好。';

  @override
  String get notaBom => '很好，但可以改进。';

  @override
  String get notaAtencao => '注意消费。';

  @override
  String get notaRevisar => '检查您的财务状况。';

  @override
  String get mentorInsightTitle => '导师指导';

  @override
  String get mentorInsightLoading => '正在获取市场数据...';

  @override
  String get mentorInsightError => '现在无法加载数据。稍后再试。';

  @override
  String get mentorInsightOffline => '您已离线。连接以获取报价和导师见解。';

  @override
  String get mentorAllocationDefensive => '鉴于当前的波动性，在追求回报之前优先考虑资本保值和流动性。';

  @override
  String get mentorAllocationBalanced => '平衡保护和增长：多样化并重新审视您的目标范围。';

  @override
  String get mentorAllocationOffensive => '您的个人资料允许更大的风险：保持纪律并避免高度集中。';

  @override
  String mentorInsightSymbols(String symbols) {
    return '已审核符号：$symbols';
  }

  @override
  String get currencyFollowLocale => '自动（语言）';

  @override
  String get compoundCalculatorTitle => '导师计算器 — 复利';

  @override
  String get compoundCalculatorSubtitle => '模拟贡献、名义收益与实际收益（通货膨胀后）以及导师笔记。';

  @override
  String get compoundInitialLabel => '初始一次性付款';

  @override
  String get compoundMonthlyLabel => '每月供款';

  @override
  String get compoundRateLabel => '利率';

  @override
  String get compoundRateAnnual => '每年';

  @override
  String get compoundRateMonthly => '每月';

  @override
  String get compoundHorizonLabel => '时间范围';

  @override
  String get compoundHorizonYears => '年';

  @override
  String get compoundHorizonMonths => '个';

  @override
  String get compoundInflationLabel => '估计通货膨胀（每年百分比）';

  @override
  String get compoundCalculate => '计算';

  @override
  String get compoundChartInvested => '投资总额';

  @override
  String get compoundChartInterest => '利息所得';

  @override
  String get compoundSummaryNominalEnd => '期末余额（名义）';

  @override
  String get compoundSummaryRealGain => '实际增益（购买力）';

  @override
  String get compoundMentorCardTitle => '导师建议';

  @override
  String get compoundInvalidInput => '输入有效值（水平 > 0）。';

  @override
  String get userPersonaSectionTitle => '导师音';

  @override
  String get userPersonaNovice => '初学者';

  @override
  String get userPersonaStrategist => '策略师';

  @override
  String get userPersonaRiskTaker => '冒险者';

  @override
  String get userPersonaConservative => '节电器';

  @override
  String get compoundOpenFullInsight => '开启完整导师洞察';

  @override
  String get investFirstSteps_title => '第一步';

  @override
  String get investFirstSteps_brokerTitle => '选择经纪人';

  @override
  String get investFirstSteps_brokerBody => '寻找受监管、信誉良好的机构。在开户之前比较费用、产品和可靠性。';

  @override
  String get investFirstSteps_openAccountTitle => '开设您的帐户';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      '数字化入门。在巴西，您通常需要 CPF/RG，有时还需要地址证明。';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      '数字注册因国家/地区而异。通常您需要身份证件和身份/地址验证。';

  @override
  String get investFirstSteps_transferTitle => '转账';

  @override
  String get investFirstSteps_transferBodyBr => '通过 PIX 或银行转账向您的经纪人汇款。余额可用于投资。';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      '通过银行转账或本地付款方式（取决于您所在的国家/地区）转移资金。余额可用于投资。';

  @override
  String get investFirstSteps_riskProfileTitle => '了解您的风险状况';

  @override
  String get investFirstSteps_riskProfileBody => '回答适合性调查问卷。了解你是保守派、温和派还是激进派。';

  @override
  String get investFirstSteps_firstAssetTitle => '购买您的第一个资产';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      '从应急基金（Tesouro Selic 或每日流动性 CDB）开始。然后逐渐多元化。';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      '从应急基金开始（高收益现金、货币市场基金或短期国债）。然后逐渐多元化。';

  @override
  String get investFirstSteps_tipTitle => '导师提示：';

  @override
  String get investFirstSteps_tipBodyBr => '从小规模开始，持续投资，避免试图把握市场时机。时间是你最好的盟友。';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      '从小规模开始，持续投资，避免试图把握市场时机。时间是你最好的盟友。';

  @override
  String get investMenu_tesouroTitle => '巴西国债';

  @override
  String get investMenu_cdbTitle => '银行固定收益（国开行）';

  @override
  String get investMenu_etfsTitle => '国际 ETF';

  @override
  String get investMenu_sp500Title => '标准普尔 500 指数（指数）';

  @override
  String get investMenu_stocksTitle => '库存';

  @override
  String get investMenu_fundsTitle => '基金';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => '房地产投资信托基金';

  @override
  String get investMenu_internationalTitle => '国际';

  @override
  String get investMenu_cryptoTitle => '加密货币';

  @override
  String get investRegisterCta => '注册投资';

  @override
  String investRegionHintBr(String country) {
    return '生效国家：$country · 巴西目录（国债、CDB、LCA...）。';
  }

  @override
  String investRegionHintGlobal(String country) {
    return '生效国家/地区：$country · 全球目录（ETF、NYSE/NASDAQ...）。根据您的设备区域自动调整。';
  }

  @override
  String get strategy_sectionCoreTitle => '基本策略';

  @override
  String get strategy_sectionDeepDiveTitle => '深度潜水（高级）';

  @override
  String get strategy_emergencyFundTitle => '应急基金';

  @override
  String get strategy_emergencyFundBodyBr =>
      '您的财务盾牌。支付 6-12 个月的费用。优先考虑日常流动性和低风险（例如 Tesouro Selic 或 CDI 关联的 CDB）。';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      '您的财务盾牌。支付 6-12 个月的费用。优先考虑日常流动性和低风险（例如货币市场基金和短期国债）。';

  @override
  String get strategy_buyHoldTitle => '购买并持有';

  @override
  String get strategy_buyHoldBody => '购买优质资产并长期持有。随着时间的推移，重点关注纪律、质量和再投资。';

  @override
  String get strategy_diversificationTitle => '多元化';

  @override
  String get strategy_diversificationBodyBr =>
      '将您的资本分散到固定收益、股票、FII 和国际资产中，以降低风险并提高风险调整后的回报。';

  @override
  String get strategy_diversificationBodyGlobal =>
      '将您的资本分散到债券、股票、房地产投资信托基金和国际敞口中，以降低风险并提高风险调整后的回报。';

  @override
  String get strategy_dcaTitle => '平均成本法 (DCA)';

  @override
  String get strategy_dcaBody => '一致性胜过天才。每个月进行投资通常比试图选择完美的切入点更有效。';

  @override
  String get strategy_smartGoalsTitle => '智能目标';

  @override
  String get strategy_smartGoalsBody => '您的目标应该是具体的、可衡量的、可实现的、相关的且有时限的。';

  @override
  String get strategy_503020Title => '50-30-20规则';

  @override
  String get strategy_503020Body => '一个简单的预算框架：50% 的需求，30% 的想要，20% 的投资和目标。';

  @override
  String get strategy_deepDive_allocationTitle => '资产配置（高级）';

  @override
  String get strategy_deepDive_allocationBody => '了解如何按目标和期限构建分配、调整风险、相关性和再平衡。';

  @override
  String get strategy_deepDive_globalEtfsTitle => '全球 ETF 和指数（高级）';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      '了解全球指数（例如 S&P 500）、ETF，以及如何严格建立国际风险敞口。';

  @override
  String get strategy_deepDive_taxesTitle => '税收和报告（高级）';

  @override
  String get strategy_deepDive_taxesBody => '了解核心税务概念以及如何保存记录以安全地报告投资。';

  @override
  String get strategy_premiumLockedBody =>
      '优质内容。激活 Cyber​​/Grimm/Hive 主题以解锁投资 Deep Dive。';

  @override
  String get homeShowcaseTitle => '展示柜';

  @override
  String get homeShowcaseProfileSimTitle => '风险状况测验';

  @override
  String get homeShowcaseProfileSimSubtitle => '在几分钟内找到您的投资者资料。';

  @override
  String get homeShowcaseStrategiesTitle => '推荐策略';

  @override
  String get homeShowcaseStrategiesSubtitle => '学习和应用策略的直接捷径。';

  @override
  String get homeShowcaseMentorHubTitle => '导师：测验和策略';

  @override
  String get homeShowcaseMentorHubSubtitle => '快速访问风险状况测验和推荐策略。';

  @override
  String get homeTourStepClassicTitle => '经典模式';

  @override
  String get homeTourStepClassicBody => '打开原始应用程序面板：熟悉的布局中的交易、目标、投资和设置。';

  @override
  String get homeTourStepVitrineTitle => '展示区';

  @override
  String get homeTourStepVitrineBody => '学习和实践的捷径：投资者简介、策略和导师中心。';

  @override
  String get homeTourStepProfileTitle => '简介测验';

  @override
  String get homeTourStepProfileBody => '回答调查问卷以了解您的风险状况并查看一致的建议。';

  @override
  String get homeTourStepStrategiesTitle => '策略';

  @override
  String get homeTourStepStrategiesBody => '内容旨在组织财务、严格投资并避免常见陷阱。';

  @override
  String get homeTourStepHubTitle => '导师中心';

  @override
  String get homeTourStepHubBody => '个人资料测验和推荐策略的快速菜单。';

  @override
  String get homeTourStepPremiumTitle => '高级功能';

  @override
  String get homeTourStepPremiumBody => '自动指导、高级图表和月度报告 - 通过高级订阅即可获得。';

  @override
  String get homeTourStepMarketTitle => '市场快照';

  @override
  String get homeTourStepMarketBody => '基于您所在地区的市场背景（巴西或全球）加上换算后的净值。';

  @override
  String get homeTourStepCalculatorTitle => '导师计算器';

  @override
  String get homeTourStepCalculatorBody => '模拟复利、通货膨胀并查看财富图表；接下来我们打开这个工具。';

  @override
  String get quizProfile_title => '风险状况测验';

  @override
  String quizProfile_progress(int current, int total) {
    return '$total 的问题 $current';
  }

  @override
  String get quizProfile_badge => '风险概况测验';

  @override
  String get quizProfile_resultTitle => '您的个人资料是';

  @override
  String get quizProfile_idealInvestmentsTitle => '理想投资：';

  @override
  String get quizProfile_exploreInvestmentsCta => '探索投资';

  @override
  String get quizProfile_exit => '退出';

  @override
  String get quizKnowledge_title => '知识问答';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '$total 的问题 $current';
  }
}

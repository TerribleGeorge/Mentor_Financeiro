// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'メンター ファイナンス';

  @override
  String get saldo => 'バランス';

  @override
  String get gastosDiarios => '日常の出費';

  @override
  String get confirmarTransacao => '取引の確認';

  @override
  String get extrato => 'ステートメント';

  @override
  String get transferencias => '転送';

  @override
  String get investimentos => '投資';

  @override
  String get configuracoes => '設定';

  @override
  String get perfil => 'プロフィール';

  @override
  String get sair => 'ログアウト';

  @override
  String get entrar => 'ログイン';

  @override
  String get cadastrar => '登録';

  @override
  String get email => 'メール';

  @override
  String get senha => 'パスワード';

  @override
  String get nome => '名前';

  @override
  String get cpf => 'ID番号';

  @override
  String get telefone => '電話';

  @override
  String get continuar => '続きを読む';

  @override
  String get voltar => '戻る';

  @override
  String get cancelar => 'キャンセル';

  @override
  String get salvar => '保存';

  @override
  String get editar => '編集';

  @override
  String get excluir => '削除';

  @override
  String get sucesso => '成功';

  @override
  String get erro => 'エラー';

  @override
  String get carregando => '読み込み中...';

  @override
  String get semDados => 'データなし';

  @override
  String get tentarNovamente => 'もう一度試してください';

  @override
  String get relatorios => 'レポート';

  @override
  String get gastosPorCategoria => 'カテゴリ別経費';

  @override
  String get ultimosSeteDias => '過去 7 日間';

  @override
  String get totalGasto => '総支出額';

  @override
  String get transacoes => 'トランザクション';

  @override
  String get categoria => 'カテゴリー';

  @override
  String get data => '日付';

  @override
  String get valor => '値';

  @override
  String get descricao => '説明';

  @override
  String get alimentacao => '食品';

  @override
  String get transporte => '輸送';

  @override
  String get lazer => 'レジャー';

  @override
  String get saude => '健康';

  @override
  String get outros => 'その他';

  @override
  String get notificacoes => '通知';

  @override
  String get permissaoNotificacoes => '通知許可';

  @override
  String get ativarMonitoramento => '経費監視を有効にする';

  @override
  String get descricaoMonitoramento => 'アプリが銀行取引を自動的に監視して財務を整理できるようにします。';

  @override
  String get idioma => '言語';

  @override
  String get moeda => '通貨';

  @override
  String get compararInvestimentos => '投資の比較';

  @override
  String get descricaoLocalizacao => '国内投資 (CDB/CDI) と国際レートを比較するには、所在地が必要です。';

  @override
  String get permissaoLocalizacaoNecessaria => '位置許可が必要です';

  @override
  String get rendaFixa => '債券';

  @override
  String get rendaVariavel => '変動収入';

  @override
  String get tesouroDireto => '財務省ダイレクト';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => '在庫';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => '暗号通貨';

  @override
  String get rendimento => 'リターン';

  @override
  String get rentabilidade => '収益性';

  @override
  String get aplicar => '適用する';

  @override
  String get resgatar => '引き換え';

  @override
  String get simular => 'シミュレート';

  @override
  String get metas => 'の目標';

  @override
  String get estrategias => '戦略';

  @override
  String get conhecimento => '知識';

  @override
  String get chat => 'チャット';

  @override
  String get enviarMensagem => 'メッセージを送信';

  @override
  String get digiteMensagem => 'メッセージを入力してください...';

  @override
  String get alertaGastos => '支出アラート';

  @override
  String alertaGastosMsg(int percent) {
    return 'すでに利用限度額の $percent% を使用しています。';
  }

  @override
  String get fechamentoFatura => '請求書の締め切り';

  @override
  String get fechamentoFaturaMsg => '明日は定休日です。支出を見直す良い機会です。';

  @override
  String get faturaVencendo => '請求書の期限';

  @override
  String faturaVencendoMsg(int dias) {
    return '請求書の期限は $dias 日後です。残高を確認してください。';
  }

  @override
  String get regra30 => 'ヒント: 30% ルール';

  @override
  String get regra30Msg => 'クレジット スコアを向上させるには、使用量を 30% 未満に抑えてください。';

  @override
  String get diaDeOuro => 'ゴールデンデー！';

  @override
  String get diaDeOuroMsg => '本日のご購入は 40 日以内にお支払いいただけます。';

  @override
  String get alertaJuros => '警告: 興味あり';

  @override
  String get alertaJurosMsg => '残高が請求額をカバーしていません。リボ払いクレジットはやめましょう！';

  @override
  String get notaSaude => '財務の健全性';

  @override
  String get notaExcelente => '素晴らしい！あなたは経済的に非常に健全です。';

  @override
  String get notaBom => '良いですが、改善の余地があります。';

  @override
  String get notaAtencao => '出費に注意。';

  @override
  String get notaRevisar => '財務状況を見直してください。';

  @override
  String get mentorInsightTitle => 'メンター指導';

  @override
  String get mentorInsightLoading => '市場データを取得中…';

  @override
  String get mentorInsightError => '現在データをロードできませんでした。しばらくしてからもう一度お試しください。';

  @override
  String get mentorInsightOffline => 'オフラインです。接続して見積もりやメンターの洞察を取得します。';

  @override
  String get mentorAllocationDefensive =>
      '現在のボラティリティを考慮すると、利益を追求する前に資本の保全と流動性を優先してください。';

  @override
  String get mentorAllocationBalanced => '保護と成長のバランスを取る: 目標の範囲を多様化し、再検討します。';

  @override
  String get mentorAllocationOffensive =>
      'あなたのプロフィールではより多くのリスクが許容されます。規律を保ち、過度の集中を避けてください。';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'レビューされたシンボル: $symbols';
  }

  @override
  String get currencyFollowLocale => '自動 (言語)';

  @override
  String get compoundCalculatorTitle => 'メンター計算機 — 複利';

  @override
  String get compoundCalculatorSubtitle =>
      '拠出額、名目利益と実質利益 (インフレ後)、およびメンターのメモをシミュレートします。';

  @override
  String get compoundInitialLabel => '初回一時金';

  @override
  String get compoundMonthlyLabel => '毎月の拠出金';

  @override
  String get compoundRateLabel => '金利';

  @override
  String get compoundRateAnnual => '/年';

  @override
  String get compoundRateMonthly => '/月';

  @override
  String get compoundHorizonLabel => '時間軸';

  @override
  String get compoundHorizonYears => '年';

  @override
  String get compoundHorizonMonths => '月';

  @override
  String get compoundInflationLabel => '推定インフレ率 (%/年)';

  @override
  String get compoundCalculate => '計算する';

  @override
  String get compoundChartInvested => '投資総額';

  @override
  String get compoundChartInterest => '受取利息';

  @override
  String get compoundSummaryNominalEnd => '終了バランス(公称)';

  @override
  String get compoundSummaryRealGain => '実質利益（購買力）';

  @override
  String get compoundMentorCardTitle => 'メンターのアドバイス';

  @override
  String get compoundInvalidInput => '有効な値を入力します (水平線 > 0)。';

  @override
  String get userPersonaSectionTitle => 'メンタートーン';

  @override
  String get userPersonaNovice => '初心者';

  @override
  String get userPersonaStrategist => 'ストラテジスト';

  @override
  String get userPersonaRiskTaker => 'リスクテイカー';

  @override
  String get userPersonaConservative => 'セイバー';

  @override
  String get compoundOpenFullInsight => 'メンターの完全な洞察を開く';

  @override
  String get investFirstSteps_title => 'はじめの一歩';

  @override
  String get investFirstSteps_brokerTitle => 'ブローカーを選択してください';

  @override
  String get investFirstSteps_brokerBody =>
      '規制された信頼できる機関を探してください。口座開設前に手数料・商品・信頼性を比較しましょう。';

  @override
  String get investFirstSteps_openAccountTitle => 'アカウントを開く';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'デジタルオンボーディング。ブラジルでは通常、CPF/RG が必要ですが、場合によっては住所証明が必要です。';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'デジタル オンボーディングは国によって異なります。通常、身分証明書と身元/住所の確認が必要です。';

  @override
  String get investFirstSteps_transferTitle => '送金資金';

  @override
  String get investFirstSteps_transferBodyBr =>
      'PIX または銀行振込でブローカーに送金してください。残高は投資に利用できるようになります。';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      '銀行振込または現地の支払い方法 (お住まいの国によって異なります) で資金を送金します。残高は投資に利用できるようになります。';

  @override
  String get investFirstSteps_riskProfileTitle => '自分のリスクプロファイルを知る';

  @override
  String get investFirstSteps_riskProfileBody =>
      '適合アンケートにお答えください。自分が保守的か、穏健派か、攻撃的かを理解します。';

  @override
  String get investFirstSteps_firstAssetTitle => '最初のアセットを購入する';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      '緊急資金（Tesouro Selic または毎日の流動性 CDB）から始めます。その後、徐々に多様化していきます。';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      '緊急資金（高利回りの現金、マネーマーケットファンド、または短期国債）から始めましょう。その後、徐々に多様化していきます。';

  @override
  String get investFirstSteps_tipTitle => 'メンターのヒント:';

  @override
  String get investFirstSteps_tipBodyBr =>
      '少額から始めて、継続的に投資し、市場のタイミングを計ろうとするのは避けてください。時間はあなたの最良の味方です。';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      '少額から始めて、継続的に投資し、市場のタイミングを計ろうとするのは避けてください。時間はあなたの最良の味方です。';

  @override
  String get investMenu_tesouroTitle => 'ブラジル国債';

  @override
  String get investMenu_cdbTitle => '銀行債券 (CDB)';

  @override
  String get investMenu_etfsTitle => 'インターナショナル ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (指数)';

  @override
  String get investMenu_stocksTitle => '在庫';

  @override
  String get investMenu_fundsTitle => '資金';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REIT';

  @override
  String get investMenu_internationalTitle => 'インターナショナル';

  @override
  String get investMenu_cryptoTitle => '暗号通貨';

  @override
  String get investRegisterCta => '投資登録';

  @override
  String investRegionHintBr(String country) {
    return '有効国: $country · ブラジルのカタログ (国債、CDB、LCA…)。';
  }

  @override
  String investRegionHintGlobal(String country) {
    return '有効国: $country · グローバル カタログ (ETF、NYSE/NASDAQ…)。デバイスの地域から自動的に調整されます。';
  }

  @override
  String get strategy_sectionCoreTitle => '重要な戦略';

  @override
  String get strategy_sectionDeepDiveTitle => 'ディープダイブ (プレミアム)';

  @override
  String get strategy_emergencyFundTitle => '緊急資金';

  @override
  String get strategy_emergencyFundBodyBr =>
      'あなたの経済的な盾。 6 ～ 12 か月分の費用をカバーします。日々の流動性と低リスクを優先します (例: Tesouro Selic または CDI にリンクされた CDB)。';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'あなたの経済的な盾。 6 ～ 12 か月分の費用をカバーします。日々の流動性とリスクの低さを優先します (マネー マーケット ファンドや短期国債など)。';

  @override
  String get strategy_buyHoldTitle => 'バイ＆ホールド';

  @override
  String get strategy_buyHoldBody =>
      '高品質の資産を購入し、長期保有します。規律、品質、長期にわたる再投資に重点を置きます。';

  @override
  String get strategy_diversificationTitle => '多様化';

  @override
  String get strategy_diversificationBodyBr =>
      '資本を債券、株式、FII、国際資産に分散してリスクを軽減し、リスク調整後のリターンを向上させます。';

  @override
  String get strategy_diversificationBodyGlobal =>
      '資本を債券、株式、REIT、国際エクスポージャーに分散して、リスクを軽減し、リスク調整後のリターンを向上させます。';

  @override
  String get strategy_dcaTitle => 'ドルコスト平均法 (DCA)';

  @override
  String get strategy_dcaBody =>
      '一貫性は天才に勝る。多くの場合、完璧なエントリーポイントを選択しようとするよりも、毎月投資する方が効果的です。';

  @override
  String get strategy_smartGoalsTitle => 'スマートな目標';

  @override
  String get strategy_smartGoalsBody =>
      '目標は、具体的で、測定可能で、達成可能で、関連性があり、期限が定められたものである必要があります。';

  @override
  String get strategy_503020Title => '50-30-20 ルール';

  @override
  String get strategy_503020Body =>
      'シンプルな予算編成フレームワーク: 50% のニーズ、30% の要望、20% の投資と目標。';

  @override
  String get strategy_deepDive_allocationTitle => '資産配分 (上級)';

  @override
  String get strategy_deepDive_allocationBody =>
      '目標と期間別に配分を構築し、リスク、相関関係、リバランスを調整する方法を学びます。';

  @override
  String get strategy_deepDive_globalEtfsTitle => 'グローバル ETF とインデックス (上級)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      '世界的な指数 (S&P 500 など)、ETF、規律を持って国際エクスポージャーを構築する方法について学びます。';

  @override
  String get strategy_deepDive_taxesTitle => '税金とレポート (上級)';

  @override
  String get strategy_deepDive_taxesBody =>
      '税金の中核となる概念と、投資を安全に報告するための記録の保管方法を理解します。';

  @override
  String get strategy_premiumLockedBody =>
      'プレミアムコンテンツ。サイバー/グリム/ハイブ テーマをアクティブにして、投資の詳細をロック解除します。';

  @override
  String get homeShowcaseTitle => 'ショーケース';

  @override
  String get homeShowcaseProfileSimTitle => 'リスクプロファイルクイズ';

  @override
  String get homeShowcaseProfileSimSubtitle => '投資家のプロフィールを数分で見つけます。';

  @override
  String get homeShowcaseStrategiesTitle => '推奨戦略';

  @override
  String get homeShowcaseStrategiesSubtitle => '戦略を学び、適用するための直接のショートカット。';

  @override
  String get homeShowcaseMentorHubTitle => 'メンター: クイズと戦略';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'リスク プロファイルのクイズと推奨される戦略に簡単にアクセスできます。';

  @override
  String get homeTourStepClassicTitle => 'クラシックモード';

  @override
  String get homeTourStepClassicBody =>
      '元のアプリ パネルを開きます。トランザクション、目標、投資、設定が使い慣れたレイアウトで表示されます。';

  @override
  String get homeTourStepVitrineTitle => 'ショーケースエリア';

  @override
  String get homeTourStepVitrineBody => '学び、実践するための近道: 投資家のプロフィール、戦略、メンターハブ。';

  @override
  String get homeTourStepProfileTitle => 'プロフィールクイズ';

  @override
  String get homeTourStepProfileBody =>
      'アンケートに答えてリスク プロファイルを確認し、適切な提案を確認してください。';

  @override
  String get homeTourStepStrategiesTitle => '戦略';

  @override
  String get homeTourStepStrategiesBody =>
      '財務を整理し、規律を持って投資し、よくある落とし穴を回避するためのコンテンツ。';

  @override
  String get homeTourStepHubTitle => 'メンターハブ';

  @override
  String get homeTourStepHubBody => 'プロフィールクイズとおすすめ戦略へのクイックメニュー。';

  @override
  String get homeTourStepPremiumTitle => 'プレミアム機能';

  @override
  String get homeTourStepPremiumBody =>
      '自動メンタリング、高度なチャート、月次レポート - プレミアム サブスクリプションで利用可能。';

  @override
  String get homeTourStepMarketTitle => '市場スナップショット';

  @override
  String get homeTourStepMarketBody =>
      'お住まいの地域と換算された純資産に基づく市場コンテキスト (ブラジルまたは世界)。';

  @override
  String get homeTourStepCalculatorTitle => 'メンター電卓';

  @override
  String get homeTourStepCalculatorBody =>
      '複利、インフレをシミュレーションし、資産グラフを確認します。次にこのツールを開きます。';

  @override
  String get quizProfile_title => 'リスクプロファイルクイズ';

  @override
  String quizProfile_progress(int current, int total) {
    return '質問 $current/$total';
  }

  @override
  String get quizProfile_badge => 'リスクプロファイルクイズ';

  @override
  String get quizProfile_resultTitle => 'あなたのプロフィールは次のとおりです';

  @override
  String get quizProfile_idealInvestmentsTitle => '理想的な投資:';

  @override
  String get quizProfile_exploreInvestmentsCta => '投資を探索する';

  @override
  String get quizProfile_exit => '出口';

  @override
  String get quizKnowledge_title => '知識クイズ';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '質問 $current/$total';
  }
}

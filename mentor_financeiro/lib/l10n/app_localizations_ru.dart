// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Ментор Финансы';

  @override
  String get saldo => 'Баланс';

  @override
  String get gastosDiarios => 'Ежедневные расходы';

  @override
  String get confirmarTransacao => 'Подтвердить транзакцию\nЗаявление';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Трансферы';

  @override
  String get investimentos => 'Инвестиции';

  @override
  String get configuracoes => 'Настройки';

  @override
  String get perfil => 'Профиль';

  @override
  String get sair => 'Выйти';

  @override
  String get entrar => 'Войти';

  @override
  String get cadastrar => 'Регистрация';

  @override
  String get email => 'Электронная почта';

  @override
  String get senha => 'Пароль';

  @override
  String get nome => 'Имя';

  @override
  String get cpf => 'Идентификационный номер';

  @override
  String get telefone => 'Телефон';

  @override
  String get continuar => 'Продолжить';

  @override
  String get voltar => 'Назад';

  @override
  String get cancelar => 'Отмена';

  @override
  String get salvar => 'Сохранить';

  @override
  String get editar => 'Править';

  @override
  String get excluir => 'Удалить';

  @override
  String get sucesso => 'Успех\nОшибка';

  @override
  String get erro => '';

  @override
  String get carregando => 'Загрузка...';

  @override
  String get semDados => 'Нет данных';

  @override
  String get tentarNovamente => 'Попробуйте еще раз.';

  @override
  String get relatorios => 'Отчеты';

  @override
  String get gastosPorCategoria => 'Расходы по категориям';

  @override
  String get ultimosSeteDias => 'Последние 7 дней';

  @override
  String get totalGasto => 'Всего потрачено';

  @override
  String get transacoes => 'Транзакции';

  @override
  String get categoria => 'Категория';

  @override
  String get data => 'Дата';

  @override
  String get valor => 'Значение';

  @override
  String get descricao => 'Описание';

  @override
  String get alimentacao => 'Еда';

  @override
  String get transporte => 'Транспорт';

  @override
  String get lazer => 'Досуг';

  @override
  String get saude => 'Здоровье';

  @override
  String get outros => 'Другие';

  @override
  String get notificacoes => 'Уведомления';

  @override
  String get permissaoNotificacoes => 'Разрешение на уведомление';

  @override
  String get ativarMonitoramento => 'Включить мониторинг расходов';

  @override
  String get descricaoMonitoramento =>
      'Разрешите приложению автоматически отслеживать ваши банковские операции для организации ваших финансов.';

  @override
  String get idioma => 'Язык';

  @override
  String get moeda => 'Валюта';

  @override
  String get compararInvestimentos => 'Сравнить инвестиции';

  @override
  String get descricaoLocalizacao =>
      'Чтобы сравнить местные инвестиции (CDB/CDI) с международными ставками, нам нужно ваше местоположение.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Требуется разрешение на определение местоположения';

  @override
  String get rendaFixa => 'Фиксированный доход';

  @override
  String get rendaVariavel => 'Переменный доход';

  @override
  String get tesouroDireto => 'Казначейство Прямое';

  @override
  String get cdb => 'ЦКБ';

  @override
  String get lci => 'ЛКИ';

  @override
  String get lca => 'ДМС';

  @override
  String get acoes => 'Акции';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Криптовалюты';

  @override
  String get rendimento => 'Возврат';

  @override
  String get rentabilidade => 'Рентабельность';

  @override
  String get aplicar => 'Применить';

  @override
  String get resgatar => 'Погасить';

  @override
  String get simular => 'Имитировать';

  @override
  String get metas => 'Цели';

  @override
  String get estrategias => 'Стратегии';

  @override
  String get conhecimento => 'Знания';

  @override
  String get chat => 'Чат';

  @override
  String get enviarMensagem => 'Отправить сообщение';

  @override
  String get digiteMensagem => 'Введите сообщение...';

  @override
  String get alertaGastos => 'Оповещение о расходах';

  @override
  String alertaGastosMsg(int percent) {
    return 'Вы уже использовали $percent% своего кредитного лимита.';
  }

  @override
  String get fechamentoFatura => 'Закрытие счета';

  @override
  String get fechamentoFaturaMsg =>
      'Завтра закрытие. Прекрасное время для анализа расходов.';

  @override
  String get faturaVencendo => 'Счет-фактура к оплате';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Счет-фактура подлежит оплате через $dias дней. Проверьте свой баланс.';
  }

  @override
  String get regra30 => 'Совет: правило 30%';

  @override
  String get regra30Msg =>
      'Поддерживайте уровень использования ниже 30%, чтобы улучшить свой кредитный рейтинг.';

  @override
  String get diaDeOuro => 'Золотой день!';

  @override
  String get diaDeOuroMsg =>
      'Ваши сегодняшние покупки будут оплачены только через 40 дней!';

  @override
  String get alertaJuros => 'Внимание: проценты';

  @override
  String get alertaJurosMsg =>
      'Ваш баланс не покрывает счет. Избегайте возобновляемых кредитов!';

  @override
  String get notaSaude => 'Финансовое здоровье';

  @override
  String get notaExcelente => 'Отлично! У вас отличное финансовое здоровье.';

  @override
  String get notaBom => 'Хорошо, но можно улучшить.';

  @override
  String get notaAtencao => 'Внимание к расходам.';

  @override
  String get notaRevisar => 'Проанализируйте свои финансы.';

  @override
  String get mentorInsightTitle => 'Руководство наставника';

  @override
  String get mentorInsightLoading => 'Получение рыночных данных…';

  @override
  String get mentorInsightError =>
      'Не удалось загрузить данные прямо сейчас. Повторите попытку через некоторое время.';

  @override
  String get mentorInsightOffline =>
      'Вы не в сети. Подключитесь, чтобы получить цитаты и идеи Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Учитывая текущую волатильность, уделите приоритетное внимание сохранению капитала и ликвидности, прежде чем гоняться за прибылью.';

  @override
  String get mentorAllocationBalanced =>
      'Защита баланса и рост: диверсифицируйте и пересмотрите горизонт своих целей.';

  @override
  String get mentorAllocationOffensive =>
      'Ваш профиль допускает больший риск: сохраняйте дисциплину и избегайте чрезмерной концентрации.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Рассмотренные символы: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Автомат (язык)';

  @override
  String get compoundCalculatorTitle => 'Калькулятор Mentor — сложные проценты';

  @override
  String get compoundCalculatorSubtitle =>
      'Смоделируйте взносы, номинальную и реальную прибыль (после инфляции) и заметки наставника.';

  @override
  String get compoundInitialLabel => 'Первоначальная единовременная выплата';

  @override
  String get compoundMonthlyLabel => 'Ежемесячный взнос';

  @override
  String get compoundRateLabel => 'Процентная ставка';

  @override
  String get compoundRateAnnual => 'в год';

  @override
  String get compoundRateMonthly => 'в месяц';

  @override
  String get compoundHorizonLabel => 'Временной горизонт';

  @override
  String get compoundHorizonYears => 'лет';

  @override
  String get compoundHorizonMonths => 'месяцев';

  @override
  String get compoundInflationLabel => 'Расчетная инфляция (% в год)';

  @override
  String get compoundCalculate => 'Посчитать';

  @override
  String get compoundChartInvested => 'Общая сумма инвестиций';

  @override
  String get compoundChartInterest => 'Полученные проценты';

  @override
  String get compoundSummaryNominalEnd => 'Конечный баланс (номинальный)';

  @override
  String get compoundSummaryRealGain =>
      'Реальная прибыль (покупательная способность)';

  @override
  String get compoundMentorCardTitle => 'Совет наставника';

  @override
  String get compoundInvalidInput =>
      'Введите действительные значения (горизонт > 0).';

  @override
  String get userPersonaSectionTitle => 'Наставнический тон';

  @override
  String get userPersonaNovice => 'Новичок';

  @override
  String get userPersonaStrategist => 'Стратег';

  @override
  String get userPersonaRiskTaker => 'Рискованный человек';

  @override
  String get userPersonaConservative => 'Эконом';

  @override
  String get compoundOpenFullInsight =>
      'Открыть полную информацию для наставника';

  @override
  String get investFirstSteps_title => 'Первые шаги';

  @override
  String get investFirstSteps_brokerTitle => 'Выбрать брокера';

  @override
  String get investFirstSteps_brokerBody =>
      'Ищите регулируемые, авторитетные учреждения. Прежде чем открывать счет, сравните комиссии, продукты и надежность.';

  @override
  String get investFirstSteps_openAccountTitle => 'Откройте свой аккаунт';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Цифровая регистрация. В Бразилии вам обычно требуется CPF/RG, а иногда и подтверждение адреса.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Цифровая адаптация зависит от страны. Обычно вам нужен документ, удостоверяющий личность, и подтверждение личности/адреса.';

  @override
  String get investFirstSteps_transferTitle => 'Перевести средства';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Отправьте деньги через PIX или банковским переводом своему брокеру. Баланс становится доступным для инвестирования.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Переведите средства банковским переводом или местными способами оплаты (в зависимости от вашей страны). Баланс становится доступным для инвестирования.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Знайте свой профиль риска';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Ответьте на вопросник о пригодности. Поймите, являетесь ли вы консервативным, умеренным или агрессивным.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Купите свой первый актив';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Начните с резервного фонда (Tesouro Selic или CDB ежедневной ликвидности). Затем постепенно диверсифицируйте.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Начните с резервного фонда (высокодоходные денежные средства, фонды денежного рынка или краткосрочные казначейские облигации). Затем постепенно диверсифицируйте.';

  @override
  String get investFirstSteps_tipTitle => 'Совет наставника:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Начните с малого, инвестируйте последовательно и избегайте попыток рассчитать время на рынке. Время — ваш лучший союзник.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Начните с малого, инвестируйте последовательно и избегайте попыток рассчитать время на рынке. Время — ваш лучший союзник.';

  @override
  String get investMenu_tesouroTitle => 'Бразильские казначейские облигации';

  @override
  String get investMenu_cdbTitle => 'Банк с фиксированной доходностью (CDB)';

  @override
  String get investMenu_etfsTitle => 'Международные ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (индекс)';

  @override
  String get investMenu_stocksTitle => 'Акции';

  @override
  String get investMenu_fundsTitle => 'Фонды';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REIT';

  @override
  String get investMenu_internationalTitle => 'Международный';

  @override
  String get investMenu_cryptoTitle => 'Крипто';

  @override
  String get investRegisterCta => 'Зарегистрировать инвестиции';

  @override
  String investRegionHintBr(String country) {
    return 'Действующая страна: $country · Каталог Бразилии (казначейские облигации, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Действующая страна: $country · Глобальный каталог (ETF, NYSE/NASDAQ…). Автоматически настраивается в зависимости от региона вашего устройства.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Основные стратегии';

  @override
  String get strategy_sectionDeepDiveTitle => 'Подробное описание (Премиум)';

  @override
  String get strategy_emergencyFundTitle => 'Чрезвычайный фонд';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Ваш финансовый щит. Покройте расходы на 6–12 месяцев. Отдавайте приоритет ежедневной ликвидности и низкому риску (например, Tesouro Selic или CDB, связанному с CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Ваш финансовый щит. Покройте расходы на 6–12 месяцев. Отдавайте приоритет ежедневной ликвидности и низкому риску (например, фондам денежного рынка и краткосрочным казначейским облигациям).';

  @override
  String get strategy_buyHoldTitle => 'Купить и держать';

  @override
  String get strategy_buyHoldBody =>
      'Покупайте качественные активы и держите их на длительный срок. Сосредоточьтесь на дисциплине, качестве и реинвестировании с течением времени.';

  @override
  String get strategy_diversificationTitle => 'Диверсификация';

  @override
  String get strategy_diversificationBodyBr =>
      'Распределите свой капитал между фиксированным доходом, акциями, FII и международными активами, чтобы снизить риск и повысить доходность с поправкой на риск.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Распределите свой капитал между облигациями, акциями, REIT и международными инвестициями, чтобы снизить риск и повысить доходность с поправкой на риск.';

  @override
  String get strategy_dcaTitle => 'Усреднение долларовой стоимости (DCA)';

  @override
  String get strategy_dcaBody =>
      'Последовательность побеждает гений. Инвестирование каждый месяц зачастую более эффективно, чем попытка выбрать идеальную точку входа.';

  @override
  String get strategy_smartGoalsTitle => 'SMART-цели';

  @override
  String get strategy_smartGoalsBody =>
      'Ваши цели должны быть конкретными, измеримыми, достижимыми, актуальными и ограниченными во времени.';

  @override
  String get strategy_503020Title => 'правило 50-30-20';

  @override
  String get strategy_503020Body =>
      'Простая структура составления бюджета: 50 % потребностей, 30 % желаний, 20 % инвестиций и целей.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Распределение активов (дополнительно)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Узнайте, как строить распределение по цели и горизонту, корректируя риск, корреляцию и ребалансировку.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Глобальные ETF и индексы (расширенный уровень)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Узнайте о глобальных индексах (например, S&P 500), ETF и о том, как дисциплинированно обеспечить международную известность.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Налоги и отчетность (расширенный уровень)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Понимание основных налоговых концепций и способов ведения учета для безопасной отчетности об инвестициях.';

  @override
  String get strategy_premiumLockedBody =>
      'Премиум-контент. Активируйте тему «Кибер/Гримм/Улей», чтобы разблокировать инвестиционное «Глубокое погружение».';

  @override
  String get homeShowcaseTitle => 'Витрина';

  @override
  String get homeShowcaseProfileSimTitle => 'Тест на профиль риска';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Найдите свой профиль инвестора за несколько минут.';

  @override
  String get homeShowcaseStrategiesTitle => 'Рекомендуемые стратегии';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Прямые ярлыки для изучения и применения стратегий.';

  @override
  String get homeShowcaseMentorHubTitle => 'Наставник: викторины и стратегии';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Быстрый доступ к тесту профиля риска и рекомендуемым стратегиям.';

  @override
  String get homeTourStepClassicTitle => 'Классический режим';

  @override
  String get homeTourStepClassicBody =>
      'Открывает оригинальную панель приложения: транзакции, цели, инвестиции и настройки в привычном макете.';

  @override
  String get homeTourStepVitrineTitle => 'Витрина';

  @override
  String get homeTourStepVitrineBody =>
      'Ярлыки для обучения и практики: профиль инвестора, стратегии и центр наставников.';

  @override
  String get homeTourStepProfileTitle => 'Профильная викторина';

  @override
  String get homeTourStepProfileBody =>
      'Ответьте на вопросы анкеты, чтобы узнать свой профиль рисков и просмотреть соответствующие предложения.';

  @override
  String get homeTourStepStrategiesTitle => 'Стратегии';

  @override
  String get homeTourStepStrategiesBody =>
      'Контент для организации финансов, дисциплинированного инвестирования и предотвращения распространенных ошибок.';

  @override
  String get homeTourStepHubTitle => 'Центр наставника';

  @override
  String get homeTourStepHubBody =>
      'Быстрое меню для профильной викторины и рекомендуемых стратегий.';

  @override
  String get homeTourStepPremiumTitle => 'Премиум-функции';

  @override
  String get homeTourStepPremiumBody =>
      'Автоматическое наставничество, расширенные графики и ежемесячные отчеты — доступны при наличии Премиум-подписки.';

  @override
  String get homeTourStepMarketTitle => 'Снимок рынка';

  @override
  String get homeTourStepMarketBody =>
      'Рыночный контекст (Бразилия или глобальный) на основе вашего региона плюс конвертированный собственный капитал.';

  @override
  String get homeTourStepCalculatorTitle => 'Калькулятор Mentor';

  @override
  String get homeTourStepCalculatorBody =>
      'Моделируйте сложные проценты, инфляцию и просматривайте диаграмму благосостояния; Далее мы открываем этот инструмент.';

  @override
  String get quizProfile_title => 'Тест на профиль риска';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Вопрос $current из $total';
  }

  @override
  String get quizProfile_badge => 'ВИКТОРИНА ПО ПРОФИЛЮ РИСКА';

  @override
  String get quizProfile_resultTitle => 'ВАШ ПРОФИЛЬ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ИДЕАЛЬНЫЕ ИНВЕСТИЦИИ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ИЗУЧИТЕ ИНВЕСТИЦИИ';

  @override
  String get quizProfile_exit => 'ВЫХОД';

  @override
  String get quizKnowledge_title => 'Тест знаний';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Вопрос $current из $total';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Ментор Фінанси';

  @override
  String get saldo => 'Баланс';

  @override
  String get gastosDiarios => 'Щоденні витрати';

  @override
  String get confirmarTransacao => 'Підтвердити транзакцію\nЗаява';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Перекази';

  @override
  String get investimentos => 'Інвестиції\nНалаштування';

  @override
  String get configuracoes => '';

  @override
  String get perfil => 'Профіль';

  @override
  String get sair => 'Вийти';

  @override
  String get entrar => 'Логін';

  @override
  String get cadastrar => 'Реєстрація';

  @override
  String get email => 'Електронна пошта\nПароль';

  @override
  String get senha => '';

  @override
  String get nome => 'Назва\nІдентифікаційний номер';

  @override
  String get cpf => '';

  @override
  String get telefone => 'Телефон';

  @override
  String get continuar => 'Продовжити';

  @override
  String get voltar => 'Назад';

  @override
  String get cancelar => 'Скасувати';

  @override
  String get salvar => 'Зберегти';

  @override
  String get editar => 'Редагувати';

  @override
  String get excluir => 'Видалити';

  @override
  String get sucesso => 'Успіху\nПомилка';

  @override
  String get erro => '';

  @override
  String get carregando => 'Завантаження...';

  @override
  String get semDados => 'Немає даних';

  @override
  String get tentarNovamente => 'Спробуйте ще раз';

  @override
  String get relatorios => 'Звіти';

  @override
  String get gastosPorCategoria => 'Витрати за категоріями';

  @override
  String get ultimosSeteDias => 'Останні 7 днів';

  @override
  String get totalGasto => 'Загальна сума витрат\nОперації';

  @override
  String get transacoes => '';

  @override
  String get categoria => 'Категорія';

  @override
  String get data => 'Дата';

  @override
  String get valor => 'Значення';

  @override
  String get descricao => 'Опис';

  @override
  String get alimentacao => 'Харчування';

  @override
  String get transporte => 'Транспорт';

  @override
  String get lazer => 'Дозвілля';

  @override
  String get saude => 'Здоров\'я';

  @override
  String get outros => 'Інші\nСповіщення';

  @override
  String get notificacoes => 'Дозвіл на сповіщення';

  @override
  String get permissaoNotificacoes => '';

  @override
  String get ativarMonitoramento => 'Увімкнути моніторинг витрат';

  @override
  String get descricaoMonitoramento =>
      'Дозвольте програмі автоматично відстежувати ваші банківські операції, щоб упорядковувати ваші фінанси.';

  @override
  String get idioma => 'Мова';

  @override
  String get moeda => 'Валюта';

  @override
  String get compararInvestimentos => 'Порівняти інвестиції';

  @override
  String get descricaoLocalizacao =>
      'Щоб порівняти місцеві інвестиції (CDB/CDI) із міжнародними ставками, нам потрібно ваше місцезнаходження.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Потрібен дозвіл на місцезнаходження';

  @override
  String get rendaFixa => 'Фіксований дохід';

  @override
  String get rendaVariavel => 'Змінний дохід';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Акції';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Криптовалюти';

  @override
  String get rendimento => 'Повернення';

  @override
  String get rentabilidade => 'Рентабельність';

  @override
  String get aplicar => 'Застосувати';

  @override
  String get resgatar => 'Викупити';

  @override
  String get simular => 'Симулювати';

  @override
  String get metas => 'Голи';

  @override
  String get estrategias => 'Стратегії';

  @override
  String get conhecimento => 'Знання';

  @override
  String get chat => 'Чат';

  @override
  String get enviarMensagem => 'Надіслати повідомлення';

  @override
  String get digiteMensagem => 'Введіть повідомлення...';

  @override
  String get alertaGastos => 'Сповіщення про витрати';

  @override
  String alertaGastosMsg(int percent) {
    return 'Ви вже використали $percent% свого кредитного ліміту.';
  }

  @override
  String get fechamentoFatura => 'Закриття рахунку';

  @override
  String get fechamentoFaturaMsg =>
      'Завтра закривається. Чудовий час для огляду витрат.';

  @override
  String get faturaVencendo => 'Рахунок до оплати';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Рахунок підлягає оплаті через $dias дн. Перевірте свій баланс.';
  }

  @override
  String get regra30 => 'Порада: правило 30%.';

  @override
  String get regra30Msg =>
      'Зберігайте використання нижче 30%, щоб покращити свій кредитний рейтинг.';

  @override
  String get diaDeOuro => 'Золотий день!';

  @override
  String get diaDeOuroMsg =>
      'Ваші покупки сьогодні будуть оплачені лише через 40 днів!';

  @override
  String get alertaJuros => 'Попередження: інтерес';

  @override
  String get alertaJurosMsg =>
      'Ваш баланс не покриває рахунок. Уникайте поновлюваного кредиту!';

  @override
  String get notaSaude => 'Фінансове здоров\'я';

  @override
  String get notaExcelente => 'Відмінно! У вас відмінне фінансове здоров\'я.';

  @override
  String get notaBom => 'Добре, але можна покращити.';

  @override
  String get notaAtencao => 'Увага до витрат.';

  @override
  String get notaRevisar => 'Перегляньте свої фінанси.';

  @override
  String get mentorInsightTitle => 'Керівництво наставника';

  @override
  String get mentorInsightLoading => 'Отримання ринкових даних…';

  @override
  String get mentorInsightError =>
      'Не вдалося завантажити дані прямо зараз. Повторіть спробу незабаром.';

  @override
  String get mentorInsightOffline =>
      'Ви поза мережею. Підключіться, щоб отримати пропозиції та статистику Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'З огляду на поточну нестабільність, віддайте пріоритет збереженню капіталу та ліквідності, перш ніж шукати прибуток.';

  @override
  String get mentorAllocationBalanced =>
      'Збалансуйте захист і зростання: урізноманітніть і перегляньте горизонт своїх цілей.';

  @override
  String get mentorAllocationOffensive =>
      'Ваш профіль дозволяє більше ризикувати: залишайтеся дисциплінованими та уникайте сильної концентрації.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Переглянуті символи: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Автоматичний (мова)';

  @override
  String get compoundCalculatorTitle => 'Mentor Calculator — Складні відсотки';

  @override
  String get compoundCalculatorSubtitle =>
      'Імітація внесків, номінального проти реального прибутку (після інфляції) і примітки наставника.';

  @override
  String get compoundInitialLabel => 'Початкова одноразова сума';

  @override
  String get compoundMonthlyLabel => 'Щомісячний внесок';

  @override
  String get compoundRateLabel => 'Процентна ставка';

  @override
  String get compoundRateAnnual => 'на рік';

  @override
  String get compoundRateMonthly => 'на місяць';

  @override
  String get compoundHorizonLabel => 'Часовий горизонт';

  @override
  String get compoundHorizonYears => 'років';

  @override
  String get compoundHorizonMonths => 'місяців';

  @override
  String get compoundInflationLabel => 'Очікувана інфляція (% на рік)';

  @override
  String get compoundCalculate => 'Обчислити';

  @override
  String get compoundChartInvested => 'Всього інвестовано';

  @override
  String get compoundChartInterest => 'Отримані відсотки';

  @override
  String get compoundSummaryNominalEnd => 'Кінцевий баланс (номінальний)';

  @override
  String get compoundSummaryRealGain =>
      'Реальний приріст (купівельна спроможність)';

  @override
  String get compoundMentorCardTitle => 'Поради наставника';

  @override
  String get compoundInvalidInput => 'Введіть дійсні значення (горизонт > 0).';

  @override
  String get userPersonaSectionTitle => 'Ментор тон';

  @override
  String get userPersonaNovice => 'Початківець';

  @override
  String get userPersonaStrategist => 'Стратег';

  @override
  String get userPersonaRiskTaker => 'Ризикувальник';

  @override
  String get userPersonaConservative => 'Заставка';

  @override
  String get compoundOpenFullInsight =>
      'Відкрийте повну інформацію про наставника';

  @override
  String get investFirstSteps_title => 'Перші кроки';

  @override
  String get investFirstSteps_brokerTitle => 'Виберіть брокера';

  @override
  String get investFirstSteps_brokerBody =>
      'Шукайте регульовані установи з авторитетом. Порівняйте комісії, продукти та надійність перед відкриттям рахунку.';

  @override
  String get investFirstSteps_openAccountTitle => 'Відкрийте свій рахунок';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Цифрова адаптація. У Бразилії зазвичай потрібен CPF/RG, а іноді й підтвердження адреси.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Цифрова адаптація залежить від країни. Зазвичай вам потрібен документ, що посвідчує особу, і підтвердження особи/адреси.';

  @override
  String get investFirstSteps_transferTitle => 'Переказ коштів';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Надішліть гроші через PIX або банківський переказ своєму брокеру. Залишок стає доступним для інвестування.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Переказуйте кошти банківським переказом або місцевими способами оплати (залежить від вашої країни). Залишок стає доступним для інвестування.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Знайте свій профіль ризику';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Дайте відповіді на анкету щодо придатності. Зрозумійте, чи ви консервативний, поміркований чи агресивний.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Купіть свій перший актив';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Почніть із надзвичайного фонду (Tesouro Selic або CDB щоденної ліквідності). Потім поступово урізноманітнюйте.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Почніть із надзвичайного фонду (високоприбуткова готівка, фонди грошового ринку або короткострокові казначейські облігації). Потім поступово урізноманітнюйте.';

  @override
  String get investFirstSteps_tipTitle => 'Порада наставника:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Почніть з малого, постійно інвестуйте та уникайте спроб визначати час на ринку. Час - ваш найкращий союзник.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Почніть з малого, постійно інвестуйте та уникайте спроб визначати час на ринку. Час - ваш найкращий союзник.';

  @override
  String get investMenu_tesouroTitle => 'Казначейські зобов\'язання Бразилії';

  @override
  String get investMenu_cdbTitle => 'Банк з фіксованим доходом (CDB)';

  @override
  String get investMenu_etfsTitle => 'Міжнародні ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (індекс)\nАкції';

  @override
  String get investMenu_stocksTitle => '';

  @override
  String get investMenu_fundsTitle => 'Кошти';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Міжнародний';

  @override
  String get investMenu_cryptoTitle => 'Крипто';

  @override
  String get investRegisterCta => 'Зареєструвати інвестиції';

  @override
  String investRegionHintBr(String country) {
    return 'Ефективна країна: $country · Каталог Бразилії (казначейства, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Ефективна країна: $country · Глобальний каталог (ETF, NYSE/NASDAQ…). Автоматично регулюється залежно від регіону вашого пристрою.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Основні стратегії';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (преміум)';

  @override
  String get strategy_emergencyFundTitle => 'Надзвичайний фонд';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Ваш фінансовий щит. Покрити витрати на 6–12 місяців. Надайте пріоритет щоденній ліквідності та низькому ризику (наприклад, Tesouro Selic або CDB, пов’язаний із CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Ваш фінансовий щит. Покрити витрати на 6–12 місяців. Надайте пріоритет щоденній ліквідності та низькому ризику (наприклад, фонди грошового ринку та короткострокові казначейські облігації).';

  @override
  String get strategy_buyHoldTitle => 'Купуйте та тримайте';

  @override
  String get strategy_buyHoldBody =>
      'Купуйте якісні активи та тримайте їх на тривалий термін. Зосередьтеся на дисципліні, якості та реінвестуванні з часом.';

  @override
  String get strategy_diversificationTitle => 'Диверсифікація';

  @override
  String get strategy_diversificationBodyBr =>
      'Розподіліть свій капітал між цінними паперами з фіксованим доходом, акціями, FII та міжнародними активами, щоб зменшити ризик і підвищити прибутковість із поправкою на ризик.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Розподіліть свій капітал між облігаціями, акціями, інвестиційними фондами REIT і міжнародною експозицією, щоб зменшити ризик і підвищити прибутковість із поправкою на ризик.';

  @override
  String get strategy_dcaTitle => 'Доларове усереднення вартості (DCA)';

  @override
  String get strategy_dcaBody =>
      'Послідовність перемагає генія. Інвестування щомісяця часто ефективніше, ніж спроби вибрати ідеальну точку входу.';

  @override
  String get strategy_smartGoalsTitle => 'SMART цілі';

  @override
  String get strategy_smartGoalsBody =>
      'Ваші цілі мають бути конкретними, вимірними, досяжними, актуальними та обмеженими у часі.\nПравило';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Проста структура бюджету: 50% потреб, 30% бажань, 20% інвестицій і цілей.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Розподіл активів (розширений)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Дізнайтеся, як побудувати розподіл за цілями та горизонтами, коригуючи ризик, кореляцію та перебалансування.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Глобальні ETF та індекси (розширений)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Дізнайтеся про глобальні індекси (наприклад, S&P 500), ETF і про те, як дисципліновано досягти міжнародної експозиції.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Податки та звітність (розширений)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Зрозумійте основні податкові концепції та те, як вести облік, щоб безпечно звітувати про інвестиції.';

  @override
  String get strategy_premiumLockedBody =>
      'Преміум-вміст. Активуйте тему Cyber/Grimm/Hive, щоб розблокувати інвестиційний Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Вітрина';

  @override
  String get homeShowcaseProfileSimTitle => 'Тест про профіль ризику';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Знайдіть свій профіль інвестора за кілька хвилин.';

  @override
  String get homeShowcaseStrategiesTitle => 'Рекомендовані стратегії';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Прямі ярлики для вивчення та застосування стратегій.';

  @override
  String get homeShowcaseMentorHubTitle => 'Наставник: тести та стратегії';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Швидкий доступ до вікторини профілю ризику та рекомендованих стратегій.';

  @override
  String get homeTourStepClassicTitle => 'Класичний режим';

  @override
  String get homeTourStepClassicBody =>
      'Відкриває оригінальну панель програми: транзакції, цілі, інвестиції та налаштування у звичному макеті.';

  @override
  String get homeTourStepVitrineTitle => 'Зона вітрини';

  @override
  String get homeTourStepVitrineBody =>
      'Швидкі шляхи для вивчення та практики: профіль інвестора, стратегії та центр Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Профільний тест';

  @override
  String get homeTourStepProfileBody =>
      'Дайте відповіді на анкету, щоб дізнатися свій профіль ризику та переглянути узгоджені пропозиції.\nСтратегії';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Вміст для організації фінансів, дисциплінованого інвестування та уникнення типових пасток.';

  @override
  String get homeTourStepHubTitle => 'Ментор хаб';

  @override
  String get homeTourStepHubBody =>
      'Швидке меню вікторини профілю та рекомендованих стратегій.\nФункції преміум-класу';

  @override
  String get homeTourStepPremiumTitle => '';

  @override
  String get homeTourStepPremiumBody =>
      'Автоматичне наставництво, розширені діаграми та щомісячні звіти — доступні з підпискою Premium.';

  @override
  String get homeTourStepMarketTitle => 'Знімок ринку';

  @override
  String get homeTourStepMarketBody =>
      'Контекст ринку (Бразилія чи глобальний) на основі вашого регіону плюс конвертована чиста вартість.';

  @override
  String get homeTourStepCalculatorTitle => 'Калькулятор Mentor';

  @override
  String get homeTourStepCalculatorBody =>
      'Симулювати складні відсотки, інфляцію та переглянути діаграму багатства; далі ми відкриваємо цей інструмент.';

  @override
  String get quizProfile_title => 'Тест про профіль ризику';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Питання $current з $total';
  }

  @override
  String get quizProfile_badge => 'ВІКТОРИНА ПРОФІЛЬ РИЗИКУ';

  @override
  String get quizProfile_resultTitle => 'ВАШ ПРОФІЛЬ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ІДЕАЛЬНІ ІНВЕСТИЦІЇ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ДІЗНАТИСЯ ІНВЕСТИЦІЙ';

  @override
  String get quizProfile_exit => 'ВИХІД';

  @override
  String get quizKnowledge_title => 'Тест на знання';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Питання $current з $total';
  }
}

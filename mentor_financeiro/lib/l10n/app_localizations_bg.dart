// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Ментор Финанси';

  @override
  String get saldo => 'Баланс';

  @override
  String get gastosDiarios => 'Ежедневни разходи';

  @override
  String get confirmarTransacao => 'Потвърдете транзакцията\nИзявление';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Трансфери';

  @override
  String get investimentos => 'Инвестиции';

  @override
  String get configuracoes => 'Настройки';

  @override
  String get perfil => 'Профил';

  @override
  String get sair => 'Изход';

  @override
  String get entrar => 'Вход';

  @override
  String get cadastrar => 'Регистрирайте се';

  @override
  String get email => 'Имейл';

  @override
  String get senha => 'Парола';

  @override
  String get nome => 'Име';

  @override
  String get cpf => 'ID номер';

  @override
  String get telefone => 'Телефон';

  @override
  String get continuar => 'Продължи';

  @override
  String get voltar => 'Гръб';

  @override
  String get cancelar => 'Отказ';

  @override
  String get salvar => 'Запази';

  @override
  String get editar => 'Редактиране';

  @override
  String get excluir => 'Изтриване';

  @override
  String get sucesso => 'Успех';

  @override
  String get erro => 'Грешка';

  @override
  String get carregando => 'Зареждане...';

  @override
  String get semDados => 'Няма данни';

  @override
  String get tentarNovamente => 'Опитайте отново';

  @override
  String get relatorios => 'Доклади';

  @override
  String get gastosPorCategoria => 'Разходи по категории';

  @override
  String get ultimosSeteDias => 'Последните 7 дни';

  @override
  String get totalGasto => 'Общо изразходвани';

  @override
  String get transacoes => 'транзакции';

  @override
  String get categoria => 'Категория';

  @override
  String get data => 'Дата';

  @override
  String get valor => 'Стойност';

  @override
  String get descricao => 'Описание';

  @override
  String get alimentacao => 'Храна';

  @override
  String get transporte => 'Транспорт';

  @override
  String get lazer => 'Свободно време';

  @override
  String get saude => 'Здраве';

  @override
  String get outros => 'Други';

  @override
  String get notificacoes => 'Известия';

  @override
  String get permissaoNotificacoes => 'Разрешение за уведомяване';

  @override
  String get ativarMonitoramento => 'Активиране на наблюдението на разходите';

  @override
  String get descricaoMonitoramento =>
      'Позволете на приложението автоматично да следи вашите банкови транзакции, за да организира вашите финанси.';

  @override
  String get idioma => 'Език';

  @override
  String get moeda => 'Валута';

  @override
  String get compararInvestimentos => 'Сравнете инвестициите';

  @override
  String get descricaoLocalizacao =>
      'За да сравним местните инвестиции (CDB/CDI) с международните курсове, имаме нужда от вашето местоположение.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Изисква се разрешение за местоположение';

  @override
  String get rendaFixa => 'Фиксиран доход';

  @override
  String get rendaVariavel => 'Променлив доход';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Акции';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Криптовалути';

  @override
  String get rendimento => 'Връщане';

  @override
  String get rentabilidade => 'Рентабилност';

  @override
  String get aplicar => 'Нанесете';

  @override
  String get resgatar => 'Осребряване';

  @override
  String get simular => 'Симулиране';

  @override
  String get metas => 'Цели';

  @override
  String get estrategias => 'Стратегии';

  @override
  String get conhecimento => 'Знание';

  @override
  String get chat => 'Чат';

  @override
  String get enviarMensagem => 'Изпратете съобщение';

  @override
  String get digiteMensagem => 'Въведете съобщение...';

  @override
  String get alertaGastos => 'Сигнал за разходи';

  @override
  String alertaGastosMsg(int percent) {
    return 'Вече сте използвали $percent% от кредитния си лимит.';
  }

  @override
  String get fechamentoFatura => 'Приключване на фактура';

  @override
  String get fechamentoFaturaMsg =>
      'Утре приключва. Чудесно време за преглед на разходите.';

  @override
  String get faturaVencendo => 'Дължима фактура';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Фактурата се дължи след $dias ден(а). Проверете баланса си.';
  }

  @override
  String get regra30 => 'Съвет: Правило за 30%.';

  @override
  String get regra30Msg =>
      'Поддържайте използването под 30%, за да подобрите кредитния си рейтинг.';

  @override
  String get diaDeOuro => 'Златен ден!';

  @override
  String get diaDeOuroMsg =>
      'Вашите покупки днес ще бъдат платени само след 40 дни!';

  @override
  String get alertaJuros => 'Предупреждение: Лихва';

  @override
  String get alertaJurosMsg =>
      'Вашият баланс не покрива сметката. Избягвайте револвиращия кредит!';

  @override
  String get notaSaude => 'Финансово здраве';

  @override
  String get notaExcelente => 'Отлично! Имате страхотно финансово здраве.';

  @override
  String get notaBom => 'Добре, но може да се подобри.';

  @override
  String get notaAtencao => 'Внимание към харченето.';

  @override
  String get notaRevisar => 'Прегледайте финансите си.';

  @override
  String get mentorInsightTitle => 'Насоки за ментор';

  @override
  String get mentorInsightLoading => 'Извличане на пазарни данни...';

  @override
  String get mentorInsightError =>
      'Не може да се заредят данни в момента. Опитайте отново след малко.';

  @override
  String get mentorInsightOffline =>
      'Вие сте офлайн. Свържете се, за да извлечете оферти и информация от Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Предвид текущата нестабилност, дайте приоритет на запазването на капитала и ликвидността, преди да преследвате възвръщаемост.';

  @override
  String get mentorAllocationBalanced =>
      'Балансирайте защитата и растежа: разнообразете и преразгледайте своя целеви хоризонт.';

  @override
  String get mentorAllocationOffensive =>
      'Вашият профил позволява повече риск: останете дисциплинирани и избягвайте силната концентрация.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Прегледани символи: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Автоматично (език)';

  @override
  String get compoundCalculatorTitle => 'Менторски калкулатор — Сложна лихва';

  @override
  String get compoundCalculatorSubtitle =>
      'Симулирайте вноски, номинална срещу реална печалба (след инфлацията) и бележки на ментора.';

  @override
  String get compoundInitialLabel => 'Първоначална еднократна сума';

  @override
  String get compoundMonthlyLabel => 'Месечна вноска';

  @override
  String get compoundRateLabel => 'Лихвен процент';

  @override
  String get compoundRateAnnual => 'на година';

  @override
  String get compoundRateMonthly => 'на месец';

  @override
  String get compoundHorizonLabel => 'Времеви хоризонт';

  @override
  String get compoundHorizonYears => 'години';

  @override
  String get compoundHorizonMonths => 'месеца';

  @override
  String get compoundInflationLabel => 'Прогнозна инфлация (% на година)';

  @override
  String get compoundCalculate => 'Изчисли';

  @override
  String get compoundChartInvested => 'Общо инвестирано';

  @override
  String get compoundChartInterest => 'Спечелени лихви';

  @override
  String get compoundSummaryNominalEnd => 'Краен баланс (номинален)';

  @override
  String get compoundSummaryRealGain =>
      'Реална печалба (покупателна способност)';

  @override
  String get compoundMentorCardTitle => 'Менторски съвет';

  @override
  String get compoundInvalidInput =>
      'Въведете валидни стойности (хоризонт > 0).';

  @override
  String get userPersonaSectionTitle => 'Менторски тон';

  @override
  String get userPersonaNovice => 'Начинаещ';

  @override
  String get userPersonaStrategist => 'Стратег';

  @override
  String get userPersonaRiskTaker => 'Поемащ риск';

  @override
  String get userPersonaConservative => 'Спестяване';

  @override
  String get compoundOpenFullInsight =>
      'Отворете пълната информация за ментора';

  @override
  String get investFirstSteps_title => 'Първи стъпки';

  @override
  String get investFirstSteps_brokerTitle => 'Изберете брокер';

  @override
  String get investFirstSteps_brokerBody =>
      'Търсете регулирани институции с добра репутация. Сравнете таксите, продуктите и надеждността, преди да отворите акаунт.';

  @override
  String get investFirstSteps_openAccountTitle => 'Отворете своя акаунт';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Цифрово включване. В Бразилия обикновено се нуждаете от CPF/RG и понякога доказателство за адрес.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Цифровото включване варира според държавата. Обикновено се нуждаете от документ за самоличност и удостоверяване на самоличност/адрес.';

  @override
  String get investFirstSteps_transferTitle => 'Прехвърляне на средства';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Изпратете пари чрез PIX или банков превод на вашия брокер. Остатъкът става достъпен за инвестиране.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Прехвърлете средства чрез банков превод или местни методи на плащане (зависи от вашата държава). Остатъкът става достъпен за инвестиране.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Познайте своя рисков профил';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Отговорете на въпросник за пригодност. Разберете дали сте консервативен, умерен или агресивен.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Купете първия си актив';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Започнете с спешен фонд (Tesouro Selic или CDB с дневна ликвидност). След това разнообразете постепенно.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Започнете със спешен фонд (парични средства с висока доходност, фондове на паричния пазар или краткосрочни съкровищни ​​облигации). След това разнообразете постепенно.';

  @override
  String get investFirstSteps_tipTitle => 'Съвет на ментор:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Започнете с малко, инвестирайте последователно и избягвайте да се опитвате да определяте времето на пазара. Времето е най-добрият ви съюзник.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Започнете с малко, инвестирайте последователно и избягвайте да се опитвате да определяте времето на пазара. Времето е най-добрият ви съюзник.';

  @override
  String get investMenu_tesouroTitle => 'бразилски ценни книжа';

  @override
  String get investMenu_cdbTitle => 'Банка с фиксиран доход (CDB)';

  @override
  String get investMenu_etfsTitle => 'Международни ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (индекс)';

  @override
  String get investMenu_stocksTitle => 'Акции';

  @override
  String get investMenu_fundsTitle => 'Средства';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REIT';

  @override
  String get investMenu_internationalTitle => 'Международен';

  @override
  String get investMenu_cryptoTitle => 'Крипто';

  @override
  String get investRegisterCta => 'Регистрирайте инвестиция';

  @override
  String investRegionHintBr(String country) {
    return 'Ефективна държава: $country · Бразилия каталог (Treasuries, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Ефективна държава: $country · Глобален каталог (ETF, NYSE/NASDAQ…). Автоматично коригирано от региона на вашето устройство.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Основни стратегии';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (премиум)';

  @override
  String get strategy_emergencyFundTitle => 'Авариен фонд';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Вашият финансов щит. Покрийте разходите за 6–12 месеца. Дайте приоритет на ежедневната ликвидност и ниския риск (напр. Tesouro Selic или CDB, свързан с CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Вашият финансов щит. Покрийте разходите за 6–12 месеца. Дайте приоритет на ежедневната ликвидност и ниския риск (напр. фондове на паричния пазар и краткосрочни съкровищни ​​облигации).';

  @override
  String get strategy_buyHoldTitle => 'Купете и задръжте';

  @override
  String get strategy_buyHoldBody =>
      'Купувайте качествени активи и ги дръжте в дългосрочен план. Съсредоточете се върху дисциплината, качеството и реинвестирането във времето.';

  @override
  String get strategy_diversificationTitle => 'Диверсификация';

  @override
  String get strategy_diversificationBodyBr =>
      'Разпределете капитала си между инструменти с фиксиран доход, акции, FII и международни активи, за да намалите риска и да подобрите възвръщаемостта, коригирана спрямо риска.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Разпределете капитала си между облигации, акции, АДСИЦ и международна експозиция, за да намалите риска и да подобрите възвръщаемостта, коригирана спрямо риска.';

  @override
  String get strategy_dcaTitle => 'Осредняване на разходите в долари (DCA)';

  @override
  String get strategy_dcaBody =>
      'Консистенцията побеждава гения. Инвестирането всеки месец често е по-ефективно, отколкото да се опитвате да изберете перфектната входна точка.';

  @override
  String get strategy_smartGoalsTitle => 'SMART цели';

  @override
  String get strategy_smartGoalsBody =>
      'Вашите цели трябва да са конкретни, измерими, постижими, подходящи и ограничени във времето.\nПравило';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Проста бюджетна рамка: 50% нужди, 30% желания, 20% инвестиции и цели.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Разпределение на активи (разширено)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Научете как да изградите разпределение по цел и хоризонт, като коригирате риска, корелацията и повторното балансиране.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Глобални ETF и индекси (разширени)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Научете за глобалните индекси (напр. S&P 500), ETF и как да изградите международна експозиция с дисциплина.';

  @override
  String get strategy_deepDive_taxesTitle => 'Данъци и отчитане (разширено)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Разберете основните данъчни концепции и как да поддържате записи, за да отчитате безопасно инвестициите.';

  @override
  String get strategy_premiumLockedBody =>
      'Премиум съдържание. Активирайте тема Cyber/Grimm/Hive, за да отключите инвестицията Deep Dive.';

  @override
  String get homeShowcaseTitle => 'Витрина';

  @override
  String get homeShowcaseProfileSimTitle => 'Тест за рисков профил';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Намерете своя инвеститорски профил за няколко минути.';

  @override
  String get homeShowcaseStrategiesTitle => 'Препоръчителни стратегии';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Директни преки пътища за изучаване и прилагане на стратегии.';

  @override
  String get homeShowcaseMentorHubTitle => 'Ментор: Тестове и стратегии';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Бърз достъп до теста за профила на риска и препоръчителните стратегии.';

  @override
  String get homeTourStepClassicTitle => 'Класически режим';

  @override
  String get homeTourStepClassicBody =>
      'Отваря оригиналния панел на приложението: транзакции, цели, инвестиции и настройки в познатото оформление.';

  @override
  String get homeTourStepVitrineTitle => 'Витрина';

  @override
  String get homeTourStepVitrineBody =>
      'Преки пътища за учене и практикуване: профил на инвеститора, стратегии и център Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Тест за профил';

  @override
  String get homeTourStepProfileBody =>
      'Отговорете на въпросника, за да откриете своя рисков профил и да видите съгласувани предложения.';

  @override
  String get homeTourStepStrategiesTitle => 'Стратегии';

  @override
  String get homeTourStepStrategiesBody =>
      'Съдържание за организиране на финанси, инвестиране с дисциплина и избягване на често срещани капани.';

  @override
  String get homeTourStepHubTitle => 'Ментор хъб';

  @override
  String get homeTourStepHubBody =>
      'Бързо меню към теста на профила и препоръчани стратегии.';

  @override
  String get homeTourStepPremiumTitle => 'Премиум функции';

  @override
  String get homeTourStepPremiumBody =>
      'Автоматично наставничество, разширени диаграми и месечни отчети — налични с абонамент Premium.';

  @override
  String get homeTourStepMarketTitle => 'Пазарна снимка';

  @override
  String get homeTourStepMarketBody =>
      'Пазарен контекст (Бразилия или глобален) въз основа на вашия регион плюс конвертирана нетна стойност.';

  @override
  String get homeTourStepCalculatorTitle => 'Менторски калкулатор';

  @override
  String get homeTourStepCalculatorBody =>
      'Симулирайте сложна лихва, инфлация и вижте диаграмата на богатството; след това отваряме този инструмент.';

  @override
  String get quizProfile_title => 'Тест за рисков профил';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Въпрос $current от $total';
  }

  @override
  String get quizProfile_badge => 'ТЕСТ ЗА РИСКОВ ПРОФИЛ';

  @override
  String get quizProfile_resultTitle => 'ВАШИЯТ ПРОФИЛ Е';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ИДЕАЛНИ ИНВЕСТИЦИИ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'РАЗГЛЕДАЙТЕ ИНВЕСТИЦИИТЕ';

  @override
  String get quizProfile_exit => 'ИЗХОД';

  @override
  String get quizKnowledge_title => 'Тест за знания';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Въпрос $current от $total';
  }
}

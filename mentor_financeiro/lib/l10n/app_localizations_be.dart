// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AppLocalizationsBe extends AppLocalizations {
  AppLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get appTitle => 'Фінансавы настаўнік\nАбвестка аб выдатках';

  @override
  String get saldo => 'Баланс';

  @override
  String get gastosDiarios => 'Штодзённыя выдаткі';

  @override
  String get confirmarTransacao => 'Пацвердзіце транзакцыю\nЗаява';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'Пераклады';

  @override
  String get investimentos => 'Інвестыцыі\nНалады';

  @override
  String get configuracoes => 'Профіль';

  @override
  String get perfil => '';

  @override
  String get sair => 'Выйсці';

  @override
  String get entrar => 'Уваход';

  @override
  String get cadastrar => 'Рэгістрацыя';

  @override
  String get email => 'Электронная пошта\nПароль';

  @override
  String get senha => '';

  @override
  String get nome => 'Назва\nІдэнтыфікацыйны нумар';

  @override
  String get cpf => 'Тэлефон';

  @override
  String get telefone => '';

  @override
  String get continuar => 'Працягнуць';

  @override
  String get voltar => 'Назад';

  @override
  String get cancelar => 'Адмена';

  @override
  String get salvar => 'Захаваць';

  @override
  String get editar => 'Рэдагаваць';

  @override
  String get excluir => 'Выдаліць';

  @override
  String get sucesso => 'Поспех\nПамылка';

  @override
  String get erro => '';

  @override
  String get carregando => 'Загрузка...';

  @override
  String get semDados => 'Даных няма';

  @override
  String get tentarNovamente => 'Паспрабуйце яшчэ раз\nСправаздачы';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'Выдаткі па катэгорыях';

  @override
  String get ultimosSeteDias => 'Апошнія 7 дзён';

  @override
  String get totalGasto => 'Усяго выдаткавана\nЗдзелкі';

  @override
  String get transacoes => 'Катэгорыя';

  @override
  String get categoria => '';

  @override
  String get data => 'Дата';

  @override
  String get valor => 'Значэнне';

  @override
  String get descricao => 'Апісанне';

  @override
  String get alimentacao => 'Ежа';

  @override
  String get transporte => 'Транспарт';

  @override
  String get lazer => 'Вольны час';

  @override
  String get saude => 'Здароўе';

  @override
  String get outros => 'Іншыя\nАпавяшчэнні';

  @override
  String get notificacoes => 'Дазвол на апавяшчэнне';

  @override
  String get permissaoNotificacoes => '';

  @override
  String get ativarMonitoramento => 'Уключыць маніторынг выдаткаў';

  @override
  String get descricaoMonitoramento =>
      'Дазвольце праграме аўтаматычна кантраляваць вашы банкаўскія транзакцыі, каб упарадкаваць вашы фінансы.';

  @override
  String get idioma => 'Мова\nВалюта';

  @override
  String get moeda => '';

  @override
  String get compararInvestimentos => 'Параўнайце інвестыцыі';

  @override
  String get descricaoLocalizacao =>
      'Каб параўнаць мясцовыя інвестыцыі (CDB/CDI) з міжнароднымі стаўкамі, нам патрэбна ваша месцазнаходжанне.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Патрабуецца дазвол на размяшчэнне';

  @override
  String get rendaFixa => 'з фіксаваным прыбыткам';

  @override
  String get rendaVariavel => 'Пераменны даход';

  @override
  String get tesouroDireto => 'Казначэйства Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA\nАкцыі';

  @override
  String get acoes => '';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'Крыптавалюты';

  @override
  String get rendimento => 'Вяртанне';

  @override
  String get rentabilidade => 'Рэнтабельнасць';

  @override
  String get aplicar => 'Ужыць';

  @override
  String get resgatar => 'Выкупіць';

  @override
  String get simular => 'Сімуляваць';

  @override
  String get metas => 'Галы';

  @override
  String get estrategias => 'Стратэгіі';

  @override
  String get conhecimento => 'Веды';

  @override
  String get chat => 'Чат';

  @override
  String get enviarMensagem => 'Адправіць паведамленне';

  @override
  String get digiteMensagem => 'Увядзіце паведамленне...';

  @override
  String get alertaGastos => '';

  @override
  String alertaGastosMsg(int percent) {
    return 'Вы ўжо выкарысталі $percent% свайго крэдытнага ліміту.';
  }

  @override
  String get fechamentoFatura => 'Закрыццё рахунка-фактуры';

  @override
  String get fechamentoFaturaMsg =>
      'Заўтра дзень закрыцця. Выдатны час для агляду выдаткаў.';

  @override
  String get faturaVencendo => 'Рахунак-фактура да аплаты';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Рахунак-фактура павінен быць выстаўлены праз $dias дзён. Праверце свой баланс.';
  }

  @override
  String get regra30 => 'Савет: правіла 30%.';

  @override
  String get regra30Msg =>
      'Падтрымлівайце выкарыстанне ніжэй за 30%, каб палепшыць свой крэдытны рэйтынг.';

  @override
  String get diaDeOuro => 'Залаты дзень!';

  @override
  String get diaDeOuroMsg =>
      'Вашы сённяшнія пакупкі будуць аплачаны толькі праз 40 дзён!';

  @override
  String get alertaJuros => 'Папярэджанне: працэнты';

  @override
  String get alertaJurosMsg =>
      'Ваш баланс не пакрывае рахунак. Пазбягайце аднаўляльнага крэдыту!';

  @override
  String get notaSaude => 'Фінансавае здароўе';

  @override
  String get notaExcelente => 'Выдатна! У вас выдатнае фінансавае здароўе.';

  @override
  String get notaBom => 'Добра, але можна палепшыць.';

  @override
  String get notaAtencao => 'Увага да выдаткаў.';

  @override
  String get notaRevisar => 'Праглядзіце свае фінансы.';

  @override
  String get mentorInsightTitle => 'Кіраўніцтва настаўніка';

  @override
  String get mentorInsightLoading => 'Атрыманне рынкавых даных…';

  @override
  String get mentorInsightError =>
      'Не ўдалося загрузіць дадзеныя прама цяпер. Паўтарыце спробу ў бліжэйшы час.';

  @override
  String get mentorInsightOffline =>
      'Вы па-за сеткай. Падключыцеся, каб атрымаць цытаты і разуменне Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Улічваючы бягучую валацільнасць, аддайце перавагу захаванню капіталу і ліквіднасці, перш чым шукаць прыбытак.';

  @override
  String get mentorAllocationBalanced =>
      'Збалансуйце абарону і рост: разнастайце і перагледзьце гарызонт сваёй мэты.';

  @override
  String get mentorAllocationOffensive =>
      'Ваш профіль дазваляе больш рызыкі: захоўвайце дысцыпліну і пазбягайце моцнай канцэнтрацыі.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Разгледжаны сімвалы: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Аўтаматычна (мова)';

  @override
  String get compoundCalculatorTitle =>
      'Mentor Calculator — Складаныя працэнты';

  @override
  String get compoundCalculatorSubtitle =>
      'Мадэлюйце ўзносы, намінальны супраць рэальнага прыбытку (пасля інфляцыі) і нататкі настаўніка.';

  @override
  String get compoundInitialLabel => 'Першапачатковая аднаразовая выплата';

  @override
  String get compoundMonthlyLabel => 'Штомесячны ўзнос';

  @override
  String get compoundRateLabel => 'Працэнтная стаўка';

  @override
  String get compoundRateAnnual => 'у год';

  @override
  String get compoundRateMonthly => 'у месяц';

  @override
  String get compoundHorizonLabel => 'Гарызонт часу';

  @override
  String get compoundHorizonYears => 'гадоў';

  @override
  String get compoundHorizonMonths => 'месяцаў';

  @override
  String get compoundInflationLabel => 'Разліковая інфляцыя (% у год)';

  @override
  String get compoundCalculate => 'Вылічыць';

  @override
  String get compoundChartInvested => 'Агульная сума інвестыцый';

  @override
  String get compoundChartInterest => 'Атрыманыя працэнты';

  @override
  String get compoundSummaryNominalEnd => 'Канчатковы баланс (намінальны)';

  @override
  String get compoundSummaryRealGain =>
      'Рэальны прырост (пакупніцкая здольнасць)';

  @override
  String get compoundMentorCardTitle => 'Парады настаўніка';

  @override
  String get compoundInvalidInput =>
      'Увядзіце сапраўдныя значэнні (гарызонт > 0).';

  @override
  String get userPersonaSectionTitle => 'Мелодыя настаўніка';

  @override
  String get userPersonaNovice => 'Пачатковец';

  @override
  String get userPersonaStrategist => 'Стратэг';

  @override
  String get userPersonaRiskTaker => 'Рызыкоўны\nЗастаўка';

  @override
  String get userPersonaConservative => '';

  @override
  String get compoundOpenFullInsight => 'Адкрыйце поўнае разуменне настаўніка';

  @override
  String get investFirstSteps_title => 'Першыя крокі';

  @override
  String get investFirstSteps_brokerTitle => 'Выберыце брокера';

  @override
  String get investFirstSteps_brokerBody =>
      'Шукайце рэгламентаваныя ўстановы з аўтарытэтам. Параўнайце зборы, прадукты і надзейнасць перад адкрыццём рахунку.';

  @override
  String get investFirstSteps_openAccountTitle => 'Адкрыйце свой рахунак';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Лічбавая адаптацыя. У Бразіліі вам звычайна патрэбны CPF/RG, а часам і доказ адрасу.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Лічбавая адаптацыя залежыць ад краіны. Звычайна вам патрэбны дакумент, які сведчыць асобу, і пацвярджэнне асобы/адраса.';

  @override
  String get investFirstSteps_transferTitle => 'Перавесці сродкі';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Адпраўляйце грошы свайму брокеру праз PIX або банкаўскім перакладам. Баланс становіцца даступным для інвеставання.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Перавядзіце сродкі з дапамогай банкаўскага пераводу або мясцовых спосабаў аплаты (залежыць ад вашай краіны). Баланс становіцца даступным для інвеставання.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Ведайце свой профіль рызыкі';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Адкажыце на анкету прыдатнасці. Зразумейце, кансерватыўны вы, умераны або агрэсіўны.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Купіце свой першы актыў';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Пачніце з надзвычайнага фонду (Tesouro Selic або CDB штодзённай ліквіднасці). Затым разнастайце паступова.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Пачніце з надзвычайнага фонду (высокапрыбытковыя наяўныя грошы, фонды грашовага рынку або кароткатэрміновыя казначэйскія аблігацыі). Затым разнастайце паступова.';

  @override
  String get investFirstSteps_tipTitle => 'Парада настаўніка:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Пачніце з малога, паслядоўна інвестуйце і не спрабуйце вызначыць час на рынку. Час - ваш лепшы саюзнік.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Пачніце з малога, паслядоўна інвестуйце і не спрабуйце засяродзіць рынак. Час - ваш лепшы саюзнік.';

  @override
  String get investMenu_tesouroTitle => 'Казначэйскія аблігацыі Бразіліі';

  @override
  String get investMenu_cdbTitle => 'Банк з фіксаваным прыбыткам (CDB)';

  @override
  String get investMenu_etfsTitle => 'Міжнародныя ETF';

  @override
  String get investMenu_sp500Title => 'S&P 500 (індэкс)\nАкцыі';

  @override
  String get investMenu_stocksTitle => 'Сродкі';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Міжнар';

  @override
  String get investMenu_cryptoTitle => 'Крыпта';

  @override
  String get investRegisterCta => 'Зарэгістраваць інвестыцыі';

  @override
  String investRegionHintBr(String country) {
    return 'Эфектыўная краіна: $country · Каталог Бразіліі (казначэйства, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Эфектыўная краіна: $country · Глабальны каталог (ETF, NYSE/NASDAQ…). Аўтаматычна наладжваецца ў залежнасці ад рэгіёна прылады.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Асноўныя стратэгіі';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Прэміум)';

  @override
  String get strategy_emergencyFundTitle => 'Надзвычайны фонд';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Ваш фінансавы шчыт. Пакрыйце выдаткі на 6–12 месяцаў. Аддавайце прыярытэт штодзённай ліквіднасці і нізкай рызыцы (напрыклад, Tesouro Selic або CDB, звязаны з CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Ваш фінансавы шчыт. Пакрыйце выдаткі на 6–12 месяцаў. Аддавайце прыярытэт штодзённай ліквіднасці і нізкай рызыцы (напрыклад, фонды грашовага рынку і кароткатэрміновыя казначэйскія аблігацыі).';

  @override
  String get strategy_buyHoldTitle => 'Купляйце і ўтрымлівайце';

  @override
  String get strategy_buyHoldBody =>
      'Купляйце якасныя актывы і захоўвайце іх на доўгі тэрмін. Засяродзьцеся на дысцыпліне, якасці і рэінвеставанні з часам.';

  @override
  String get strategy_diversificationTitle => 'Дыверсіфікацыя';

  @override
  String get strategy_diversificationBodyBr =>
      'Размяркуйце свой капітал на інструменты з фіксаваным прыбыткам, акцыі, FII і міжнародныя актывы, каб знізіць рызыку і палепшыць даходнасць з улікам рызыкі.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Размяркуйце свой капітал паміж аблігацыямі, акцыямі, REITs і міжнароднай экспазіцыяй, каб знізіць рызыку і палепшыць даходнасць з папраўкай на рызыку.';

  @override
  String get strategy_dcaTitle => 'Асерадненне кошту ў доларах (DCA)';

  @override
  String get strategy_dcaBody =>
      'Паслядоўнасць перамагае генія. Інвестыцыі кожны месяц часта больш эфектыўныя, чым спроба выбраць ідэальную кропку ўваходу.';

  @override
  String get strategy_smartGoalsTitle => 'SMART мэты';

  @override
  String get strategy_smartGoalsBody =>
      'Вашы мэты павінны быць канкрэтнымі, вымернымі, дасягальнымі, актуальнымі і абмежаванымі па часе.\nПравіла';

  @override
  String get strategy_503020Title => '50-30-20';

  @override
  String get strategy_503020Body =>
      'Простая структура бюджэту: 50% патрэбаў, 30% жаданняў, 20% інвестыцый і мэтаў.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Размеркаванне актываў (пашыранае)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Даведайцеся, як будаваць размеркаванне па мэтах і гарызонтах, карэктуючы рызыку, карэляцыю і рэбалансіроўку.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Глабальныя ETF і індэксы (прасунуты)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Даведайцеся пра глабальныя індэксы (напрыклад, S&P 500), ETF і пра тое, як з дысцыплінай пабудаваць міжнародную экспазіцыю.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Падаткі і справаздачнасць (пашыраны)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Зразумець асноўныя паняцці падаткаабкладання і як весці ўлік, каб бяспечна паведамляць аб інвестыцыях.';

  @override
  String get strategy_premiumLockedBody =>
      'Прэміум-кантэнт. Актывуйце тэму Cyber/Grimm/Hive, каб разблакіраваць інвестыцыю Deep Dive.\nВітрына';

  @override
  String get homeShowcaseTitle => '';

  @override
  String get homeShowcaseProfileSimTitle => 'Тэст профілю рызыкі';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Знайдзіце свой профіль інвестара за некалькі хвілін.';

  @override
  String get homeShowcaseStrategiesTitle => 'Рэкамендуемыя стратэгіі';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Прамыя цэтлікі для вывучэння і прымянення стратэгій.';

  @override
  String get homeShowcaseMentorHubTitle => 'Настаўнік: віктарыны і стратэгіі';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Хуткі доступ да віктарыны профілю рызыкі і рэкамендаваных стратэгій.';

  @override
  String get homeTourStepClassicTitle => 'Класічны рэжым';

  @override
  String get homeTourStepClassicBody =>
      'Адкрывае зыходную панэль праграмы: транзакцыі, мэты, інвестыцыі і налады ў звыклай кампаноўцы.';

  @override
  String get homeTourStepVitrineTitle => 'Зона вітрыны';

  @override
  String get homeTourStepVitrineBody =>
      'Ярлыкі для вывучэння і практыкі: профіль інвестара, стратэгіі і цэнтр Mentor.';

  @override
  String get homeTourStepProfileTitle => 'Профільны тэст';

  @override
  String get homeTourStepProfileBody =>
      'Адкажыце на анкету, каб выявіць свой профіль рызыкі і ўбачыць узгодненыя прапановы.\nСтратэгіі';

  @override
  String get homeTourStepStrategiesTitle => '';

  @override
  String get homeTourStepStrategiesBody =>
      'Кантэнт для арганізацыі фінансаў, дысцыплінаванага інвеставання і пазбягання звычайных падводных камянёў.';

  @override
  String get homeTourStepHubTitle => 'Ментарскі цэнтр';

  @override
  String get homeTourStepHubBody =>
      'Хуткае меню віктарыны профілю і рэкамендаваных стратэгій.\nФункцыі прэміум-класа';

  @override
  String get homeTourStepPremiumTitle => '';

  @override
  String get homeTourStepPremiumBody =>
      'Аўтаматычнае настаўніцтва, пашыраныя дыяграмы і штомесячныя справаздачы — даступныя з падпіскай Premium.';

  @override
  String get homeTourStepMarketTitle => 'Здымак рынку';

  @override
  String get homeTourStepMarketBody =>
      'Рыначны кантэкст (Бразілія ці глабальны) на аснове вашага рэгіёна плюс канвертаваны чысты кошт.';

  @override
  String get homeTourStepCalculatorTitle => 'Калькулятар Mentor';

  @override
  String get homeTourStepCalculatorBody =>
      'Змадэлюйце складаныя працэнты, інфляцыю і праглядзіце дыяграму дабрабыту; далей мы адкрываем гэты інструмент.';

  @override
  String get quizProfile_title => 'Тэст профілю рызыкі';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Пытанне $current з $total';
  }

  @override
  String get quizProfile_badge => 'ВІКТАРЫНА ПРОФІЛЬ РЫЗЫКІ';

  @override
  String get quizProfile_resultTitle => 'ВАШ ПРОФІЛЬ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'ІДЕАЛЬНЫЯ ІНВЕСТЫЦЫІ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'ДАСЛЕДУЙЦЕ ІНВЕСТЫЦЫІ';

  @override
  String get quizProfile_exit => 'ВЫХОД';

  @override
  String get quizKnowledge_title => 'Віктарына ведаў';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Пытанне $current з $total';
  }
}

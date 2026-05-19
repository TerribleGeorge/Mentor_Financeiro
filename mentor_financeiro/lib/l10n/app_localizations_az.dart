// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appTitle => 'Mentor Maliyyə';

  @override
  String get saldo => 'Balans';

  @override
  String get gastosDiarios => 'Gündəlik Xərclər';

  @override
  String get confirmarTransacao => 'Əməliyyatı Təsdiqləyin';

  @override
  String get extrato => 'Bəyanat';

  @override
  String get transferencias => 'Transferlər';

  @override
  String get investimentos => 'İnvestisiyalar';

  @override
  String get configuracoes => 'Parametrlər';

  @override
  String get perfil => 'Profili';

  @override
  String get sair => 'Çıxış';

  @override
  String get entrar => 'Giriş';

  @override
  String get cadastrar => 'Qeydiyyatdan Keçin';

  @override
  String get email => 'E-poçt';

  @override
  String get senha => 'Şifrə';

  @override
  String get nome => 'Adı';

  @override
  String get cpf => 'ID nömrəsi';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Davam edin';

  @override
  String get voltar => 'Geri';

  @override
  String get cancelar => 'Ləğv et';

  @override
  String get salvar => 'Saxla';

  @override
  String get editar => 'Redaktə edin';

  @override
  String get excluir => 'Sil';

  @override
  String get sucesso => 'Uğur';

  @override
  String get erro => 'Xətası';

  @override
  String get carregando => 'Yüklənir...';

  @override
  String get semDados => 'Məlumat yoxdur';

  @override
  String get tentarNovamente => 'Yenidən cəhd edin';

  @override
  String get relatorios => 'Hesabatları';

  @override
  String get gastosPorCategoria => 'Kateqoriyaya görə xərclər';

  @override
  String get ultimosSeteDias => 'Son 7 Gün';

  @override
  String get totalGasto => 'Ümumi xərclənmiş';

  @override
  String get transacoes => 'Əməliyyatlar';

  @override
  String get categoria => 'Kateqoriya';

  @override
  String get data => 'Tarix';

  @override
  String get valor => 'Dəyər';

  @override
  String get descricao => 'Təsviri';

  @override
  String get alimentacao => 'Qida';

  @override
  String get transporte => 'Nəqliyyat';

  @override
  String get lazer => 'İstirahət';

  @override
  String get saude => 'Sağlamlıq';

  @override
  String get outros => 'Digərləri';

  @override
  String get notificacoes => 'Bildirişlər';

  @override
  String get permissaoNotificacoes => 'Bildiriş İcazəsi';

  @override
  String get ativarMonitoramento => 'Xərclərin monitorinqini aktivləşdirin';

  @override
  String get descricaoMonitoramento =>
      'Proqrama maliyyənizi təşkil etmək üçün bank əməliyyatlarınıza avtomatik nəzarət etməyə icazə verin.';

  @override
  String get idioma => 'Dili';

  @override
  String get moeda => 'Valyuta';

  @override
  String get compararInvestimentos => 'İnvestisiyaları müqayisə edin';

  @override
  String get descricaoLocalizacao =>
      'Yerli investisiyaları (CDB/CDI) beynəlxalq tariflərlə müqayisə etmək üçün bizə məkanınız lazımdır.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Məkan İcazəsi Tələb olunur';

  @override
  String get rendaFixa => 'Sabit Gəlir';

  @override
  String get rendaVariavel => 'Dəyişən Gəlir';

  @override
  String get tesouroDireto => 'Xəzinədarlıq Birbaşa';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Səhmlər';

  @override
  String get fiis => 'FII-lər';

  @override
  String get criptomoedas => 'Kriptovalyutalar';

  @override
  String get rendimento => 'Qayıdış';

  @override
  String get rentabilidade => 'Mənfəətlilik';

  @override
  String get aplicar => 'Müraciət edin';

  @override
  String get resgatar => 'Geri alın';

  @override
  String get simular => 'Simulyasiya edin';

  @override
  String get metas => 'Məqsədlər';

  @override
  String get estrategias => 'Strategiyaları';

  @override
  String get conhecimento => 'Bilik';

  @override
  String get chat => 'Söhbət';

  @override
  String get enviarMensagem => 'Mesaj göndər';

  @override
  String get digiteMensagem => 'Mesaj yazın...';

  @override
  String get alertaGastos => 'Xərcləmə Xəbərdarlığı';

  @override
  String alertaGastosMsg(int percent) {
    return 'Artıq kredit limitinizin $percent%-ni istifadə etmisiniz.';
  }

  @override
  String get fechamentoFatura => 'Fakturanın Bağlanması';

  @override
  String get fechamentoFaturaMsg =>
      'Sabah bağlanış günüdür. Xərcləri nəzərdən keçirmək üçün əla vaxtdır.';

  @override
  String get faturaVencendo => 'Fakturanın ödənilməsi vaxtıdır';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Faktura $dias günə ödənilməlidir. Balansınızı yoxlayın.';
  }

  @override
  String get regra30 => 'İpucu: 30% Qayda';

  @override
  String get regra30Msg =>
      'Kredit Hesabınızı yaxşılaşdırmaq üçün istifadəni 30%-dən aşağı saxlayın.';

  @override
  String get diaDeOuro => 'Qızıl Gün!';

  @override
  String get diaDeOuroMsg =>
      'Bugünkü alışlarınız yalnız 40 gün ərzində ödəniləcək!';

  @override
  String get alertaJuros => 'Xəbərdarlıq: Maraq';

  @override
  String get alertaJurosMsg =>
      'Balansınız hesabı əhatə etmir. Dəyişən kreditdən çəkinin!';

  @override
  String get notaSaude => 'Maliyyə Sağlamlığı';

  @override
  String get notaExcelente => 'Əla! Böyük maliyyə sağlamlığınız var.';

  @override
  String get notaBom => 'Yaxşı, lakin inkişaf edə bilər.';

  @override
  String get notaAtencao => 'Xərclərə diqqət.';

  @override
  String get notaRevisar => 'Maliyyə vəziyyətinizi nəzərdən keçirin.';

  @override
  String get mentorInsightTitle => 'Mentor rəhbərliyi';

  @override
  String get mentorInsightLoading => 'Bazar məlumatları əldə edilir...';

  @override
  String get mentorInsightError =>
      'Hazırda datanı yükləmək mümkün deyil. Qısa müddətdə yenidən cəhd edin.';

  @override
  String get mentorInsightOffline =>
      'Siz oflaynsınız. Sitatları və Mentor fikirlərini əldə etmək üçün qoşulun.';

  @override
  String get mentorAllocationDefensive =>
      'Cari dəyişkənliyi nəzərə alaraq, gəlirləri təqib etməzdən əvvəl kapitalın qorunmasına və likvidliyə üstünlük verin.';

  @override
  String get mentorAllocationBalanced =>
      'Balansın qorunması və böyüməsi: məqsəd üfüqünüzü şaxələndirin və yenidən nəzərdən keçirin.';

  @override
  String get mentorAllocationOffensive =>
      'Profiliniz daha çox riskə yol verir: intizamlı olun və ağır konsentrasiyadan qaçın.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Simvollar nəzərdən keçirilib: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Avtomatik (dil)';

  @override
  String get compoundCalculatorTitle => 'Mentor Kalkulyator — Mürəkkəb Faiz';

  @override
  String get compoundCalculatorSubtitle =>
      'Töhfələri, nominal və real qazancı (inflyasiyadan sonra) və mentor qeydlərini simulyasiya edin.';

  @override
  String get compoundInitialLabel => 'İlkin birdəfəlik ödəniş';

  @override
  String get compoundMonthlyLabel => 'Aylıq töhfə';

  @override
  String get compoundRateLabel => 'Faiz dərəcəsi\nİllik';

  @override
  String get compoundRateAnnual => 'Ayda';

  @override
  String get compoundRateMonthly => '';

  @override
  String get compoundHorizonLabel => 'Zaman üfüqü';

  @override
  String get compoundHorizonYears => 'illər';

  @override
  String get compoundHorizonMonths => 'ay';

  @override
  String get compoundInflationLabel => 'Təxmini inflyasiya (illik%)';

  @override
  String get compoundCalculate => 'Hesablayın';

  @override
  String get compoundChartInvested => 'Ümumi sərmayə qoyuldu';

  @override
  String get compoundChartInterest => 'Qazanılan faiz';

  @override
  String get compoundSummaryNominalEnd => 'Son balans (nominal)';

  @override
  String get compoundSummaryRealGain => 'Real qazanc (alıcılıq qabiliyyəti)';

  @override
  String get compoundMentorCardTitle => 'Mentor məsləhəti';

  @override
  String get compoundInvalidInput => 'Etibarlı dəyərlər daxil edin (üfüq > 0).';

  @override
  String get userPersonaSectionTitle => 'Mentor tonu';

  @override
  String get userPersonaNovice => 'Başlanğıc';

  @override
  String get userPersonaStrategist => 'Strateq';

  @override
  String get userPersonaRiskTaker => 'Risk götürən';

  @override
  String get userPersonaConservative => 'Saver';

  @override
  String get compoundOpenFullInsight => 'Tam mentor anlayışını açın';

  @override
  String get investFirstSteps_title => 'İlk addımlar';

  @override
  String get investFirstSteps_brokerTitle => 'Broker seçin';

  @override
  String get investFirstSteps_brokerBody =>
      'Tənzimlənən, nüfuzlu qurumları axtarın. Hesab açmadan əvvəl ödənişləri, məhsulları və etibarlılığı müqayisə edin.';

  @override
  String get investFirstSteps_openAccountTitle => 'Hesabınızı açın';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Rəqəmsal giriş. Braziliyada sizə adətən CPF/RG və bəzən ünvan sübutu lazımdır.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Rəqəmsal qoşulma ölkəyə görə dəyişir. Adətən sizə şəxsiyyət vəsiqəsi və şəxsiyyət/ünvan yoxlanışı lazımdır.';

  @override
  String get investFirstSteps_transferTitle => 'Pul köçürmə';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Brokerinizə PIX və ya bank köçürməsi ilə pul göndərin. Balans investisiya üçün əlçatan olur.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Bank köçürməsi və ya yerli ödəniş üsulları ilə pul köçürün (ölkənizdən asılıdır). Balans investisiya üçün əlçatan olur.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Risk profilinizi bilin';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Uyğunluq sorğusuna cavab verin. Mühafizəkar, mülayim və ya aqressiv olduğunuzu anlayın.';

  @override
  String get investFirstSteps_firstAssetTitle => 'İlk aktivinizi alın';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Təcili yardım fondu ilə başlayın (Tesouro Selic və ya gündəlik likvidlik CDB). Sonra tədricən diversifikasiya edin.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Təcili yardım fondu ilə başlayın (yüksək gəlirli nağd pul, pul bazarı fondları və ya qısamüddətli xəzinədarlıq istiqrazları). Sonra tədricən diversifikasiya edin.';

  @override
  String get investFirstSteps_tipTitle => 'Mentor ipucu:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Kiçik başlayın, ardıcıl olaraq sərmayə qoyun və bazara vaxt ayırmağa çalışmayın. Zaman sizin ən yaxşı müttəfiqinizdir.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Kiçik başlayın, ardıcıl olaraq sərmayə qoyun və bazara vaxt ayırmağa çalışmayın. Zaman sizin ən yaxşı müttəfiqinizdir.';

  @override
  String get investMenu_tesouroTitle => 'Braziliya Xəzinələri';

  @override
  String get investMenu_cdbTitle => 'Bank sabit gəliri (CDB)';

  @override
  String get investMenu_etfsTitle => 'Beynəlxalq ETF-lər';

  @override
  String get investMenu_sp500Title => 'S&P 500 (indeks)';

  @override
  String get investMenu_stocksTitle => 'Səhmlər';

  @override
  String get investMenu_fundsTitle => 'Fondları';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'GYO-lar';

  @override
  String get investMenu_internationalTitle => 'Beynəlxalq';

  @override
  String get investMenu_cryptoTitle => 'Kripto';

  @override
  String get investRegisterCta => 'İnvestisiyanı qeyd edin';

  @override
  String investRegionHintBr(String country) {
    return 'Effektiv ölkə: $country · Braziliya kataloqu (Xəzinədarlıqlar, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Effektiv ölkə: $country · Qlobal kataloq (ETFs, NYSE/NASDAQ…). Cihazınızın bölgəsindən avtomatik tənzimlənir.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Əsas strategiyalar';

  @override
  String get strategy_sectionDeepDiveTitle => 'Dərin Dalış (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Təcili yardım fondu';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Sizin maliyyə qalxanınız. 6-12 aylıq xərcləri əhatə edin. Gündəlik likvidliyə və aşağı riskə üstünlük verin (məsələn, Tesouro Selic və ya CDI ilə əlaqəli CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Sizin maliyyə qalxanınız. 6-12 aylıq xərcləri əhatə edin. Gündəlik likvidliyə və aşağı riskə üstünlük verin (məsələn, pul bazarı fondları və qısamüddətli xəzinə istiqrazları).';

  @override
  String get strategy_buyHoldTitle => 'Al və saxla';

  @override
  String get strategy_buyHoldBody =>
      'Keyfiyyətli aktivlər alın və uzun müddətə saxlayın. Zamanla nizam-intizam, keyfiyyət və yenidən investisiyaya diqqət yetirin.';

  @override
  String get strategy_diversificationTitle => 'Diversifikasiya';

  @override
  String get strategy_diversificationBodyBr =>
      'Riski azaltmaq və riskə uyğunlaşdırılmış gəlirləri yaxşılaşdırmaq üçün kapitalınızı sabit gəlir, səhmlər, FII-lər və beynəlxalq aktivlər arasında yaydırın.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Riski azaltmaq və riskə uyğunlaşdırılmış gəlirləri yaxşılaşdırmaq üçün kapitalınızı istiqrazlar, səhmlər, REIT-lər və beynəlxalq risklər arasında yayın.';

  @override
  String get strategy_dcaTitle => 'Dolların orta dəyəri (DCA)';

  @override
  String get strategy_dcaBody =>
      'Ardıcıllıq dahidən üstündür. Hər ay investisiya qoymaq çox vaxt mükəmməl giriş nöqtəsini seçməyə çalışmaqdan daha təsirli olur.';

  @override
  String get strategy_smartGoalsTitle => 'SMART məqsədləri';

  @override
  String get strategy_smartGoalsBody =>
      'Məqsədləriniz spesifik, ölçülə bilən, əldə edilə bilən, müvafiq və vaxta bağlı olmalıdır.';

  @override
  String get strategy_503020Title => '50-30-20 qaydası';

  @override
  String get strategy_503020Body =>
      'Sadə büdcə çərçivəsi: 50% ehtiyaclar, 30% istəklər, 20% investisiya və məqsədlər.';

  @override
  String get strategy_deepDive_allocationTitle => 'Aktiv bölgüsü (qabaqcıl)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Məqsəd və üfüq üzrə bölgü qurmağı, riski, korrelyasiyanı və balanslaşdırmanı tənzimləməyi öyrənin.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Qlobal ETF-lər və indekslər (qabaqcıl)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Qlobal indekslər (məsələn, S&P 500), ETF-lər və nizam-intizamla beynəlxalq məruz qalma üsulları haqqında məlumat əldə edin.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Vergilər və hesabatlar (qabaqcıl)';

  @override
  String get strategy_deepDive_taxesBody =>
      'İnvestisiyaları təhlükəsiz şəkildə bildirmək üçün əsas vergi anlayışlarını və qeydlərin necə aparılacağını anlayın.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium məzmun. İnvestisiya Deep Dive-i açmaq üçün Cyber/Grimm/Hive temasını aktivləşdirin.';

  @override
  String get homeShowcaseTitle => 'Vitrini';

  @override
  String get homeShowcaseProfileSimTitle => 'Risk profili testi';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Bir neçə dəqiqə ərzində investor profilinizi tapın.';

  @override
  String get homeShowcaseStrategiesTitle => 'Tövsiyə olunan strategiyalar';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Strategiyaları öyrənmək və tətbiq etmək üçün birbaşa qısa yollar.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Testlər və Strategiyalar';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Risk profili testinə və tövsiyə olunan strategiyalara sürətli çıxış.';

  @override
  String get homeTourStepClassicTitle => 'Klassik rejim';

  @override
  String get homeTourStepClassicBody =>
      'Orijinal proqram panelini açır: tanış planda əməliyyatlar, məqsədlər, investisiyalar və parametrlər.';

  @override
  String get homeTourStepVitrineTitle => 'Vitrin sahəsi';

  @override
  String get homeTourStepVitrineBody =>
      'Öyrənmək və təcrübə etmək üçün qısa yollar: investor profili, strategiyalar və Mentor mərkəzi.';

  @override
  String get homeTourStepProfileTitle => 'Profil testi';

  @override
  String get homeTourStepProfileBody =>
      'Risk profilinizi tapmaq və uyğunlaşdırılmış təkliflərə baxmaq üçün sorğuya cavab verin.';

  @override
  String get homeTourStepStrategiesTitle => 'Strategiyaları';

  @override
  String get homeTourStepStrategiesBody =>
      'Maliyyəni təşkil etmək, nizam-intizamla investisiya etmək və ümumi tələlərdən qaçmaq üçün məzmun.';

  @override
  String get homeTourStepHubTitle => 'Mentor mərkəzi';

  @override
  String get homeTourStepHubBody =>
      'Profil sorğusuna və tövsiyə olunan strategiyalara sürətli menyu.';

  @override
  String get homeTourStepPremiumTitle => 'Premium xüsusiyyətləri';

  @override
  String get homeTourStepPremiumBody =>
      'Avtomatik mentorluq, qabaqcıl qrafiklər və aylıq hesabatlar — Premium abunə ilə mövcuddur.';

  @override
  String get homeTourStepMarketTitle => 'Market snapshot';

  @override
  String get homeTourStepMarketBody =>
      'Regionunuza əsaslanan bazar konteksti (Braziliya və ya qlobal) üstəgəl çevrilmiş xalis dəyər.';

  @override
  String get homeTourStepCalculatorTitle => 'Mentor kalkulyatoru';

  @override
  String get homeTourStepCalculatorBody =>
      'Mürəkkəb faiz, inflyasiya simulyasiya edin və sərvət cədvəlinə baxın; sonra bu aləti açırıq.';

  @override
  String get quizProfile_title => 'Risk profili testi';

  @override
  String quizProfile_progress(int current, int total) {
    return '$total sualından $current sualı';
  }

  @override
  String get quizProfile_badge => 'RİSK PROFİLİ QUİZİ';

  @override
  String get quizProfile_resultTitle => 'SİZİN PROFİLİNİZDİR';

  @override
  String get quizProfile_idealInvestmentsTitle => 'İDEAL İNVESTİSİYA:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'İNVESTİSİYALARI KEŞFEDİN';

  @override
  String get quizProfile_exit => 'ÇIXIŞ';

  @override
  String get quizKnowledge_title => 'Bilik testi';

  @override
  String quizKnowledge_progress(int current, int total) {
    return '$total sualından $current sualı';
  }
}

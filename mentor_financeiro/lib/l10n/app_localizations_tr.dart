// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Mentor Finans';

  @override
  String get saldo => 'Dengesi';

  @override
  String get gastosDiarios => 'Günlük Giderler';

  @override
  String get confirmarTransacao => 'İşlemi Onayla';

  @override
  String get extrato => 'Beyanı';

  @override
  String get transferencias => 'Transferler';

  @override
  String get investimentos => 'Yatırımlar';

  @override
  String get configuracoes => 'Ayarları';

  @override
  String get perfil => 'Profili';

  @override
  String get sair => 'Oturumu Kapat';

  @override
  String get entrar => 'Giriş';

  @override
  String get cadastrar => 'Kayıt Ol';

  @override
  String get email => 'E-posta';

  @override
  String get senha => 'Şifre';

  @override
  String get nome => 'Adı';

  @override
  String get cpf => 'Kimlik Numarası';

  @override
  String get telefone => 'Telefon';

  @override
  String get continuar => 'Devam Et';

  @override
  String get voltar => 'Geri';

  @override
  String get cancelar => 'İptal';

  @override
  String get salvar => 'Kaydet';

  @override
  String get editar => 'Düzenle';

  @override
  String get excluir => 'Sil';

  @override
  String get sucesso => 'Başarılı';

  @override
  String get erro => 'Hatası';

  @override
  String get carregando => 'Yükleniyor...';

  @override
  String get semDados => 'Veri yok';

  @override
  String get tentarNovamente => 'Tekrar deneyin';

  @override
  String get relatorios => 'Raporları';

  @override
  String get gastosPorCategoria => 'Kategoriye Göre Giderler';

  @override
  String get ultimosSeteDias => 'Son 7 Gün';

  @override
  String get totalGasto => 'Harcanan Toplam';

  @override
  String get transacoes => 'İşlemleri';

  @override
  String get categoria => 'Kategorisi';

  @override
  String get data => 'Tarih';

  @override
  String get valor => 'Değeri';

  @override
  String get descricao => 'Açıklama';

  @override
  String get alimentacao => 'Gıda';

  @override
  String get transporte => 'Taşıma';

  @override
  String get lazer => 'Eğlence';

  @override
  String get saude => 'Sağlık';

  @override
  String get outros => 'Diğerleri';

  @override
  String get notificacoes => 'Bildirimler';

  @override
  String get permissaoNotificacoes => 'Bildirim İzni';

  @override
  String get ativarMonitoramento => 'Gider İzlemeyi Etkinleştir';

  @override
  String get descricaoMonitoramento =>
      'Mali durumunuzu düzenlemek için uygulamanın banka işlemlerinizi otomatik olarak izlemesine izin verin.';

  @override
  String get idioma => 'Dil';

  @override
  String get moeda => 'Para Birimi';

  @override
  String get compararInvestimentos => 'Yatırımları Karşılaştırın';

  @override
  String get descricaoLocalizacao =>
      'Yerel yatırımları (CDB/CDI) uluslararası oranlarla karşılaştırmak için konumunuza ihtiyacımız var.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Konum İzni Gerekli';

  @override
  String get rendaFixa => 'Sabit Gelir';

  @override
  String get rendaVariavel => 'Değişken Gelir';

  @override
  String get tesouroDireto => 'Hazine Direkt';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Hisse Senetleri';

  @override
  String get fiis => 'FII\'ler';

  @override
  String get criptomoedas => 'Kripto para birimleri';

  @override
  String get rendimento => 'Dönüş';

  @override
  String get rentabilidade => 'Karlılık';

  @override
  String get aplicar => 'Uygula';

  @override
  String get resgatar => 'Kullan';

  @override
  String get simular => 'Simülasyonu';

  @override
  String get metas => 'Goller';

  @override
  String get estrategias => 'Stratejileri';

  @override
  String get conhecimento => 'Bilgi';

  @override
  String get chat => 'Sohbet';

  @override
  String get enviarMensagem => 'Mesaj gönder';

  @override
  String get digiteMensagem => 'Bir mesaj yazın...';

  @override
  String get alertaGastos => 'Harcama Uyarısı';

  @override
  String alertaGastosMsg(int percent) {
    return 'Zaten kredi limitinizin %$percent kadarını kullandınız.';
  }

  @override
  String get fechamentoFatura => 'Fatura Kapatma';

  @override
  String get fechamentoFaturaMsg =>
      'Yarın kapanış günü. Harcamaları gözden geçirmek için harika bir zaman.';

  @override
  String get faturaVencendo => 'Vadesi Gelen Fatura';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Faturanın ödemesi $dias gün içinde yapılacak. Bakiyenizi kontrol edin.';
  }

  @override
  String get regra30 => 'İpucu: %30 Kuralı';

  @override
  String get regra30Msg =>
      'Kredi Puanınızı artırmak için kullanımı %30\'un altında tutun.';

  @override
  String get diaDeOuro => 'Altın Gün!';

  @override
  String get diaDeOuroMsg =>
      'Bugünkü alışverişlerinizin ödemesi yalnızca 40 gün içinde yapılacaktır!';

  @override
  String get alertaJuros => 'Uyarı: Faiz';

  @override
  String get alertaJurosMsg =>
      'Bakiyeniz faturayı karşılamıyor. Döner krediden kaçının!';

  @override
  String get notaSaude => 'Finansal Sağlık';

  @override
  String get notaExcelente => 'Mükemmel! Mali sağlığınız çok iyi.';

  @override
  String get notaBom => 'İyi ama geliştirilebilir.';

  @override
  String get notaAtencao => 'Harcamaya dikkat.';

  @override
  String get notaRevisar => 'Mali durumunuzu gözden geçirin.';

  @override
  String get mentorInsightTitle => 'Mentor rehberliği';

  @override
  String get mentorInsightLoading => 'Piyasa verileri getiriliyor…';

  @override
  String get mentorInsightError =>
      'Veriler şu anda yüklenemiyor. Kısa süre sonra tekrar deneyin.';

  @override
  String get mentorInsightOffline =>
      'Çevrimdışısınız. Teklifleri ve Mentor içgörülerini almak için bağlanın.';

  @override
  String get mentorAllocationDefensive =>
      'Mevcut oynaklık göz önüne alındığında, getiri peşinde koşmadan önce sermayenin korunmasına ve likiditeye öncelik verin.';

  @override
  String get mentorAllocationBalanced =>
      'Koruma ve büyümeyi dengeleyin: Hedef ufkunuzu çeşitlendirin ve yeniden gözden geçirin.';

  @override
  String get mentorAllocationOffensive =>
      'Profiliniz daha fazla riske izin veriyor: disiplinli kalın ve aşırı konsantrasyondan kaçının.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'İncelenen semboller: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Otomatik (dil)';

  @override
  String get compoundCalculatorTitle => 'Mentor Hesap Makinesi — Bileşik Faiz';

  @override
  String get compoundCalculatorSubtitle =>
      'Katkıları, nominal ve gerçek kazancı (enflasyondan sonra) ve mentor notlarını simüle edin.';

  @override
  String get compoundInitialLabel => 'İlk toplu ödeme';

  @override
  String get compoundMonthlyLabel => 'Aylık katkı';

  @override
  String get compoundRateLabel => 'Faiz oranı\nYıllık';

  @override
  String get compoundRateAnnual => 'Aylık';

  @override
  String get compoundRateMonthly => '';

  @override
  String get compoundHorizonLabel => 'Zaman ufku';

  @override
  String get compoundHorizonYears => 'yıl';

  @override
  String get compoundHorizonMonths => 'ay';

  @override
  String get compoundInflationLabel => 'Tahmini enflasyon (yıllık yüzde)';

  @override
  String get compoundCalculate => 'Hesapla';

  @override
  String get compoundChartInvested => 'Toplam yatırım';

  @override
  String get compoundChartInterest => 'Kazanılan faiz';

  @override
  String get compoundSummaryNominalEnd => 'Bitiş bakiyesi (nominal)';

  @override
  String get compoundSummaryRealGain => 'Gerçek kazanç (satın alma gücü)';

  @override
  String get compoundMentorCardTitle => 'Akıl hocası tavsiyesi';

  @override
  String get compoundInvalidInput => 'Geçerli değerleri girin (ufuk > 0).';

  @override
  String get userPersonaSectionTitle => 'Akıl hocası tonu';

  @override
  String get userPersonaNovice => 'Başlangıç Seviyesi';

  @override
  String get userPersonaStrategist => 'Stratejist';

  @override
  String get userPersonaRiskTaker => 'Risk alan kişi';

  @override
  String get userPersonaConservative => 'Tasarrufu';

  @override
  String get compoundOpenFullInsight => 'Mentorun tam içgörüsünü açın';

  @override
  String get investFirstSteps_title => 'İlk adımlar';

  @override
  String get investFirstSteps_brokerTitle => 'Bir komisyoncu seçin';

  @override
  String get investFirstSteps_brokerBody =>
      'Düzenlenmiş, saygın kurumları arayın. Hesap açmadan önce ücretleri, ürünleri ve güvenilirliği karşılaştırın.';

  @override
  String get investFirstSteps_openAccountTitle => 'Hesabınızı açın';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Dijital katılım. Brezilya\'da genellikle CPF/RG\'ye ve bazen de adres kanıtına ihtiyacınız vardır.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'Dijital katılım ülkeye göre değişir. Genellikle bir kimlik belgesine ve kimlik/adres doğrulamasına ihtiyacınız vardır.';

  @override
  String get investFirstSteps_transferTitle => 'Transfer fonları';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Brokerinize PIX veya banka havalesi yoluyla para gönderin. Bakiye yatırım yapmaya uygun hale gelir.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Banka havalesi veya yerel ödeme yöntemleri yoluyla para aktarın (ülkenize bağlıdır). Bakiye yatırım yapmaya uygun hale gelir.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Risk profilinizi öğrenin';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Uygunluk anketini yanıtlayın. Muhafazakar mı, ılımlı mı yoksa saldırgan mı olduğunuzu anlayın.';

  @override
  String get investFirstSteps_firstAssetTitle => 'İlk varlığınızı satın alın';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Bir acil durum fonu (Tesouro Selic veya günlük likidite CDB\'si) ile başlayın. Daha sonra yavaş yavaş çeşitlendirin.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Bir acil durum fonuyla başlayın (yüksek getirili nakit, para piyasası fonları veya kısa vadeli Hazine tahvilleri). Daha sonra yavaş yavaş çeşitlendirin.';

  @override
  String get investFirstSteps_tipTitle => 'Akıl hocası ipucu:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Küçük başlayın, tutarlı bir şekilde yatırım yapın ve piyasayı zamanlamaya çalışmaktan kaçının. Zaman en iyi müttefikinizdir.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Küçük başlayın, tutarlı bir şekilde yatırım yapın ve piyasaya zaman ayırmaya çalışmaktan kaçının. Zaman en iyi müttefikinizdir.';

  @override
  String get investMenu_tesouroTitle => 'Brezilya Hazineleri';

  @override
  String get investMenu_cdbTitle => 'Banka sabit geliri (CDB)';

  @override
  String get investMenu_etfsTitle => 'Uluslararası ETF\'ler';

  @override
  String get investMenu_sp500Title => 'S&P 500 (endeks)';

  @override
  String get investMenu_stocksTitle => 'Hisse Senetleri';

  @override
  String get investMenu_fundsTitle => 'Fonları';

  @override
  String get investMenu_fiisTitle => 'FII\'ler';

  @override
  String get investMenu_reitsTitle => 'GYO\'lar';

  @override
  String get investMenu_internationalTitle => 'Uluslararası';

  @override
  String get investMenu_cryptoTitle => 'Kripto';

  @override
  String get investRegisterCta => 'Yatırımı kaydedin';

  @override
  String investRegionHintBr(String country) {
    return 'Geçerli ülke: $country · Brezilya kataloğu (Hazine, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'Geçerli ülke: $country · Küresel katalog (ETF\'ler, NYSE/NASDAQ…). Cihazınızın bulunduğu bölgeden otomatik olarak ayarlanır.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Temel stratejiler';

  @override
  String get strategy_sectionDeepDiveTitle =>
      'Derinlemesine İnceleme (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Acil durum fonu';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Finansal kalkanınız. 6-12 aylık masrafları karşılayın. Günlük likiditeye ve düşük riske öncelik verin (örneğin Tesouro Selic veya CDI bağlantılı CDB).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Finansal kalkanınız. 6-12 aylık masrafları karşılayın. Günlük likiditeye ve düşük riske (örneğin para piyasası fonları ve kısa vadeli Hazine tahvilleri) öncelik verin.';

  @override
  String get strategy_buyHoldTitle => 'Al ve Tut';

  @override
  String get strategy_buyHoldBody =>
      'Kaliteli varlıkları satın alın ve uzun vadede elde tutun. Disiplin, kalite ve zaman içinde yeniden yatırıma odaklanın.';

  @override
  String get strategy_diversificationTitle => 'Çeşitlendirme';

  @override
  String get strategy_diversificationBodyBr =>
      'Riski azaltmak ve riske göre ayarlanmış getirileri artırmak için sermayenizi sabit gelir, hisse senetleri, FII\'ler ve uluslararası varlıklara dağıtın.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Riski azaltmak ve riske göre ayarlanmış getirileri artırmak için sermayenizi tahvillere, hisse senetlerine, GYO\'lara ve uluslararası risklere dağıtın.';

  @override
  String get strategy_dcaTitle => 'Dolar-maliyet ortalaması (DCA)';

  @override
  String get strategy_dcaBody =>
      'Tutarlılık dehayı yener. Her ay yatırım yapmak genellikle mükemmel giriş noktasını seçmeye çalışmaktan daha etkilidir.';

  @override
  String get strategy_smartGoalsTitle => 'AKILLI hedefler';

  @override
  String get strategy_smartGoalsBody =>
      'Hedefleriniz spesifik, ölçülebilir, ulaşılabilir, alakalı ve zamana bağlı olmalıdır.';

  @override
  String get strategy_503020Title => '50-30-20 kuralı';

  @override
  String get strategy_503020Body =>
      'Basit bir bütçeleme çerçevesi: %50 ihtiyaçlar, %30 istekler, %20 yatırım ve hedefler.';

  @override
  String get strategy_deepDive_allocationTitle => 'Varlık tahsisi (gelişmiş)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Riski, korelasyonu ve yeniden dengelemeyi ayarlayarak hedefe ve ufka göre tahsisat oluşturmayı öğrenin.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETF\'ler ve endeksler (gelişmiş)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Küresel endeksler (ör. S&P 500), ETF\'ler ve disiplinle uluslararası görünürlüğün nasıl oluşturulacağı hakkında bilgi edinin.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Vergiler ve raporlama (ileri düzey)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Temel vergi kavramlarını ve yatırımları güvenli bir şekilde raporlamak için kayıtların nasıl tutulacağını anlayın.';

  @override
  String get strategy_premiumLockedBody =>
      'Premium içerik. Yatırım Deep Dive\'ın kilidini açmak için bir Cyber/Grimm/Hive temasını etkinleştirin.';

  @override
  String get homeShowcaseTitle => 'Vitrin';

  @override
  String get homeShowcaseProfileSimTitle => 'Risk profili testi';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Yatırımcı profilinizi birkaç dakika içinde bulun.';

  @override
  String get homeShowcaseStrategiesTitle => 'Önerilen stratejiler';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Stratejileri öğrenmek ve uygulamak için doğrudan kısayollar.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Sınavlar ve Stratejiler';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Risk profili testine ve önerilen stratejilere hızlı erişim.';

  @override
  String get homeTourStepClassicTitle => 'Klasik mod';

  @override
  String get homeTourStepClassicBody =>
      'Orijinal uygulama panelini açar: tanıdık düzende işlemler, hedefler, yatırımlar ve ayarlar.';

  @override
  String get homeTourStepVitrineTitle => 'Vitrin alanı';

  @override
  String get homeTourStepVitrineBody =>
      'Öğrenmek ve pratik yapmak için kısayollar: yatırımcı profili, stratejiler ve Mentor merkezi.';

  @override
  String get homeTourStepProfileTitle => 'Profil testi';

  @override
  String get homeTourStepProfileBody =>
      'Risk profilinizi keşfetmek ve uyumlu önerileri görmek için anketi yanıtlayın.';

  @override
  String get homeTourStepStrategiesTitle => 'Stratejileri';

  @override
  String get homeTourStepStrategiesBody =>
      'Finansmanı organize etmek, disiplinle yatırım yapmak ve sık karşılaşılan tuzaklardan kaçınmak için içerik.';

  @override
  String get homeTourStepHubTitle => 'Akıl hocası merkezi';

  @override
  String get homeTourStepHubBody =>
      'Profil testine ve önerilen stratejilere hızlı menü.';

  @override
  String get homeTourStepPremiumTitle => 'Premium özellikler';

  @override
  String get homeTourStepPremiumBody =>
      'Otomatik mentorluk, gelişmiş grafikler ve aylık raporlar — Premium abonelikle kullanılabilir.';

  @override
  String get homeTourStepMarketTitle => 'Pazar anlık görüntüsü';

  @override
  String get homeTourStepMarketBody =>
      'Bölgenize ve dönüştürülen net değere bağlı olarak piyasa bağlamı (Brezilya veya küresel).';

  @override
  String get homeTourStepCalculatorTitle => 'Akıl hocası hesaplayıcısı';

  @override
  String get homeTourStepCalculatorBody =>
      'Bileşik faizi, enflasyonu simüle edin ve servet tablosunu görün; daha sonra bu aracı açıyoruz.';

  @override
  String get quizProfile_title => 'Risk profili testi';

  @override
  String quizProfile_progress(int current, int total) {
    return '$total sorusundan $current sorusu';
  }

  @override
  String get quizProfile_badge => 'RİSK PROFİLİ SINAV';

  @override
  String get quizProfile_resultTitle => 'PROFİLİNİZ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'İDEAL YATIRIMLAR:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'YATIRIMLARI KEŞFEDİN';

  @override
  String get quizProfile_exit => 'ÇIKIŞ';

  @override
  String get quizKnowledge_title => 'Bilgi testi';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Soru $current / $total';
  }
}

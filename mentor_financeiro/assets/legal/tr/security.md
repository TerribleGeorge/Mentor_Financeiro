# Güvenlik - Mentor Financeiro

**Son güncelleme:** 19 Mayıs 2026

Bu sayfada Mentor Financeiro güvenlik uygulamaları basit bir dille açıklanmaktadır. Gizlilik Politikasını ve Kullanım Koşullarını tamamlar.

## 1. Güvenlik Taahhüdü

Mentor Financeiro, banka hesabına doğrudan erişim istemeden, banka şifresi istemeden ve banka, komisyoncu veya ödeme yöntemi olarak işlev görmeden finansal organizasyona yardımcı olmak için geliştirildi.

Uygulama sizin tarafınızdan girilen veya isteğe bağlı özelliklerle tanımlanan finansal verileri depolayabilir; bu nedenle güvenliği ürünün merkezi bir parçası olarak ele alıyoruz.

## 2. Uygulama ne yapmaz?

- Banka şifresi, kart veya dijital cüzdan istemez.
- Banka hesabınıza erişmez.
- Para taşımaz.
- Adınıza ödeme, Pix, transfer veya yatırım yapmaz.
- Kart güvenlik kodu istemez.
- OTP banka kodunu istemez.
- Kişisel verilerinizi satmaz.

## 3. Kullanılan teknik önlemler

Kullanılan kaynağa bağlı olarak uygulama şunları kullanabilir:

- Firebase Authentication ile giriş yapın.
- Cloud Firestore kimliği doğrulanmış kullanıcıyla ilişkili verileri içerir.
- Kullanıcının kendi verilerine erişimi kısıtlamaya yönelik güvenlik kuralları.
- Kullanılan SDK'lar ve hizmetler tarafından şifrelenen iletişim.
- Firebase Crashlytics teknik arızaları tespit etmek ve sorunları düzeltmek için.
- Android izinleri yalnızca uygulama özellikleriyle ilgili olduğunda talep edildi.
- Tercihler, tema, önbellek ve cihaz verileri için yerel depolama.

## 4. Bildirim İzleme

Bildirim izleme isteğe bağlıdır ve Android üzerinde manuel aktivasyon gerektirir.

Etkinleştirildiğinde uygulama, harcamaları, satın almaları, ödemeleri, abonelikleri ve transferleri tanımak için desteklenen bildirimleri okuyabilir. Amaç, giderleri kaydederken manuel çalışmayı azaltmaktır.

Riskleri azaltmak için:

- Uygulama sizi ayarlara yönlendirmeden önce izin nedenini size bildirir.
- Erişim herhangi bir zamanda Android ayarlarından iptal edilebilir.
- Filtre, kişisel konuşmaları değil, uyumlu finansal olayları arar.
- Uygulama OTP kodlarını, şifrelerini, güvenlik kodlarını ve kimlik doğrulama mesajlarını yok saymaya çalışır.
- Uygulama bu özelliği bankalara, kartlara veya dijital cüzdanlara erişmek için kullanmaz.

Öyle olsa bile bildirimler hassas veriler içerebilir. Bu özelliği yalnızca bu tür işlemeyi kabul ediyorsanız kullanın.

## 5. Hassas izinler

Uygulama şunları isteyebilir:

- **İnternet:** Firebase, Google Play, API'lere ve çevrimiçi kaynaklara bağlantı.
- **Bildirimler:** uygulamanın kendisinden uyarı gönderme.
- **Konum:** İzin verildiği takdirde içeriğin veya karşılaştırmaların ülkeye/bölgeye uyarlanması.
- **Android bildirimlerine erişim:** uyumlu bildirimlerden harcamaların isteğe bağlı olarak tanımlanması.
- **Uygulama içi satın alımlar:** Google Play tarafından Premium aboneliği.

Bu izinleri Android ayarlarından kontrol edersiniz.

## 6. Güvenlikteki rolünüz

Verilerinizi korumak için:

- Cihazda ekran kilidini kullanın.
- Hesabınızı paylaşmayın.
- Uygulamayı ve Android'yi güncel tutun.
- Artık kullanmak istemediğiniz izinleri iptal edin.
- Karar vermeden önce otomatik olarak tanımlanan işlemleri kontrol edin.
- Uygulamada kalmasını istemediğiniz bilgileri kaydetmeyin.
- Yenilemek istemediğinizde abonelikleri doğrudan Google Play adresinden iptal edin.

## 7. Sınırlamalar

Hiçbir uygulama, sunucu, işletim sistemi veya bulut hizmeti %100 güvenli değildir. Alınan önlemlere rağmen arızalar, kullanılamama, senkronizasyon hataları, erişim kaybı, üçüncü taraf sorunları veya harici kötüye kullanım girişimleri meydana gelebilir.

Mentor Financeiro riskleri makul ölçüde azaltmayı amaçlamaktadır ancak temel finansal bilgilerin kopyalarını veya kendi kontrollerini saklamanız gerekir.

## 8. Olaylar ve iletişim

Tuhaf davranışlar, uygunsuz erişim, yanlış veriler, şüpheli güvenlik ihlali veya hassas izinlerle ilgili sorun fark ederseniz lütfen aşağıdaki adresle iletişime geçin:

**george.guimares@gmail.com**

Mümkünse şunları ekleyin:

- Cihaz modeli.
- Android sürümü.
- Uygulama sürümü.
- Sorunun açıklaması.
- Şifreleri, kodları veya aşırı verileri açığa vurmadan ekran görüntüleri.

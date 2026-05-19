# Təhlükəsizlik - Mentor Financeiro

**Son yenilənmə:** 19 may 2026-cı il

Bu səhifə Mentor Financeiro təhlükəsizlik təcrübələrini sadə dildə izah edir. O, Məxfilik Siyasətini və İstifadə Şərtlərini tamamlayır.

## 1. Təhlükəsizlik Öhdəliyi

Mentor Financeiro bank hesabına birbaşa giriş tələb etmədən, bank parolunu tələb etmədən və bank, broker və ya ödəniş üsulu kimi fəaliyyət göstərmədən maliyyə təşkilatına kömək etmək üçün hazırlanmışdır.

Tətbiq sizin daxil etdiyiniz və ya əlavə funksiyalarla müəyyən edilmiş maliyyə məlumatlarını saxlaya bilər, buna görə də biz təhlükəsizliyi məhsulun mərkəzi hissəsi kimi qəbul edirik.

## 2. Proqramın nə etmədiyi

- O, bank parolu, kart və ya rəqəmsal pul kisəsi tələb etmir.
- Bank hesabınıza daxil deyil.
- Pul köçürmür.
- Sizin adınıza ödənişlər, Pix, köçürmələr və ya investisiyalar etmir.
- Kartın təhlükəsizlik kodunu tələb etmir.
- OTP bank kodunu tələb etmir.
- Şəxsi məlumatlarınızı satmır.

## 3. İstifadə olunan texniki tədbirlər

İstifadə olunan mənbədən asılı olaraq proqram aşağıdakılardan istifadə edə bilər:

- Firebase Authentication ilə daxil olun.
- Cloud Firestore təsdiqlənmiş istifadəçi ilə əlaqəli məlumatlarla.
- İstifadəçinin öz məlumatlarına girişi məhdudlaşdırmaq üçün təhlükəsizlik qaydaları.
- SDK-lar və istifadə edilən xidmətlər tərəfindən şifrələnmiş rabitə.
- Firebase Crashlytics texniki nasazlıqları müəyyən etmək və problemləri düzəltmək üçün.
- Android icazələr yalnız proqram funksiyaları ilə əlaqəli olduqda tələb olunur.
- Tercihlər, mövzu, keş və cihaz məlumatları üçün yerli yaddaş.

## 4. Bildirişlərin monitorinqi

Bildiriş monitorinqi isteğe bağlıdır və Android üzərində əl ilə aktivləşdirmə tələb olunur.

Aktiv olduqda, tətbiq xərcləri, alışları, ödənişləri, abunəlikləri və köçürmələri tanımaq üçün dəstəklənən bildirişləri oxuya bilər. Məqsəd xərcləri qeyd edərkən əl işlərini azaltmaqdır.

Riskləri azaltmaq üçün:

- Tətbiq sizi parametrlərə yönləndirməzdən əvvəl icazənin səbəbi barədə məlumat verir.
- Giriş istənilən vaxt Android parametrlərində ləğv edilə bilər.
- Filtr şəxsi söhbətləri deyil, uyğun maliyyə hadisələrini axtarır.
- Tətbiq OTP kodları, parollar, təhlükəsizlik kodları və autentifikasiya mesajlarına məhəl qoymağa çalışır.
- Tətbiq banklara, kartlara və ya rəqəmsal pul kisələrinə daxil olmaq üçün bu funksiyadan istifadə etmir.

Bununla belə, bildirişlərdə həssas məlumatlar ola bilər. Bu funksiyadan yalnız bu cür emalla razılaşdığınız halda istifadə edin.

## 5. Həssas icazələr

Tətbiq tələb edə bilər:

- **İnternet:** Firebase, Google Play, API-lərə və onlayn resurslara qoşulma.
- **Bildirişlər:** proqramın özündən xəbərdarlıqların göndərilməsi.
- **Yer:** icazə verildikdə məzmunun ölkəyə/regiona uyğunlaşdırılması və ya müqayisəsi.
- **Android bildirişlərinə giriş:** Uyğun bildirişlərdən xərclərin isteğe bağlı müəyyən edilməsi.
- **Tətbiqdaxili satınalmalar:** Google Play tərəfindən Premium abunəliyi.

Siz bu icazələrə Android parametrlərində nəzarət edirsiniz.

## 6. Təhlükəsizlikdə sizin payınız

Məlumatlarınızı qorumaq üçün:

- Cihazınızda ekran kilidindən istifadə edin.
- Hesabınızı paylaşmayın.
- Tətbiqi və Android yeniləməsini saxlayın.
- Artıq istifadə etmək istəmədiyiniz icazələri ləğv edin.
- Qərar qəbul etməzdən əvvəl avtomatik müəyyən edilmiş əməliyyatları yoxlayın.
- Tətbiqdə saxlamaq istəmədiyiniz məlumatları qeyd etməyin.
- Yeniləmək istəmədiyiniz zaman abunələri birbaşa Google Play ünvanında ləğv edin.

## 7. Məhdudiyyətlər

Heç bir proqram, server, əməliyyat sistemi və ya bulud xidməti 100% təhlükəsiz deyil. Qəbul edilmiş tədbirlərə baxmayaraq, uğursuzluqlar, əlçatmazlıq, sinxronizasiya xətaları, girişin itirilməsi, üçüncü tərəf problemləri və ya xarici sui-istifadə cəhdləri baş verə bilər.

Mentor Financeiro riskləri əsaslı şəkildə azaltmağa çalışır, lakin siz əsas maliyyə məlumatlarının surətlərini və ya öz nəzarətinizi saxlamalısınız.

## 8. Hadisələr və əlaqə

Qəribə davranış, düzgün olmayan giriş, yanlış məlumat, şübhəli təhlükəsizlik pozuntusu və ya həssas icazələrlə bağlı problem görsəniz, lütfən əlaqə saxlayın:

**george.guimares@gmail.com**

Mümkünsə, daxil edin:

- Cihaz modeli.
- Android versiyası.
- Proqram versiyası.
- Problemin təsviri.
- Parolları, kodları və ya həddindən artıq məlumatları ifşa etmədən ekran görüntüləri.

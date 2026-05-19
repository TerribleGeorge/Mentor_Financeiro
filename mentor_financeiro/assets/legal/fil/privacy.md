# Patakaran sa Privacy - Mentor Financeiro

**Huling na-update:** Mayo 19, 2026

**Aplikasyon:** Mentor Financeiro

**Package Android:** `com.georgeguimares.mentorfinanceiro`

**Patakaran na na-publish sa:** https://terriblegeorge.github.io/Mentor_Financeiro/

Malinaw na ipinapaliwanag ng Patakaran sa Privacy na ito kung anong data ang maaaring i-access, kolektahin, gamitin, iimbak, ibahagi at protektahan ni Mentor Financeiro. Ito ay isinulat upang ipakita ang kasalukuyang pagpapatakbo ng application at dapat basahin kasabay ng pahina ng Mga Tuntunin ng Paggamit at Seguridad.

Ang Mentor Financeiro ay isang aplikasyon para sa organisasyong pampinansyal, edukasyon sa pananalapi, mga layunin, mga talaan ng gastos, mga graph, mga ulat, nilalaman ng pamumuhunan at mga opsyonal na feature ng subscription sa Premium. Ang aplikasyon ay hindi isang bangko, broker, institusyong pinansyal, rehistradong tagapayo sa pamumuhunan, kompanya ng seguro o paraan ng pagbabayad.

## 1. Sino ang may pananagutan

Ang Mentor Financeiro ay inaalok ng developer na responsable sa pag-publish ng application sa Google Play.

Upang gamitin ang mga karapatan na nauugnay sa iyong data, magtanong o humiling ng pagtanggal, makipag-ugnayan sa amin sa pamamagitan ng email:

**george.guimares@gmail.com**

## 2. Buod sa simpleng wika

- Tinutulungan ka ng app na ayusin ang mga gastos, layunin, limitasyon, kasaysayan ng pananalapi, pamumuhunan at nilalamang pang-edukasyon.
- Upang gumamit ng ilang partikular na feature, maaari kang mag-log in gamit ang email/password, Google account, Apple account o incognito mode, sa pamamagitan ng Firebase Authentication.
- Ang data sa pananalapi na iyong ibibigay, tulad ng mga gastos, layunin, limitasyon, profile at mga kagustuhan, ay maaaring i-save sa Firebase/Cloud Firestore para sa pag-synchronize at pagpapatakbo ng account.
- Gumagamit ang app ng mga serbisyo ng Google/Firebase para sa pag-login, database, push notification, analytics at fault diagnosis.
- Maaaring gumamit ang app ng Google AdMob upang magpakita ng mga ad.
- Ang Premium ay pinoproseso ng Google Play Billing sa loob mismo ng app.
- Opsyonal ang lokasyon at ginagamit lang kapag pinahintulutan mo ito, halimbawa para iakma ang mga paghahambing sa pamumuhunan sa bansa o lokal na konteksto.
- Ang tampok na pagsubaybay sa notification ay opsyonal. Kung ie-enable mo ang access sa notification sa Android, mababasa ng app ang pamagat at text ng mga sinusuportahang notification para matukoy ang mga pagbili, pagbabayad, at paglilipat at gawin itong mga financial record. Hindi ina-access ng app ang iyong bank account at hindi humihingi ng password.
- Ang mga larawang pinili mo para sa pag-personalize ay maaaring maiimbak nang lokal sa device.
- Maaari kang humiling ng pagtanggal ng account at data sa pamamagitan ng email na nakasaad sa patakarang ito.

## 3. Data na maaari naming iproseso

Depende sa kung paano mo ginagamit ang application, maaari naming iproseso ang mga sumusunod na kategorya ng data.

### 3.1 Data ng account at pagkakakilanlan

- Pangalan na ibinigay sa pagpaparehistro.
- Email.
- Firebase (UID) identifier ng user.
- Ginamit ang paraan ng pag-login.
- Larawan sa profile, kapag ibinigay ng provider ng pag-login.
- Premium status ng subscription na nauugnay sa profile.
- Teknikal na data na kinakailangan upang mapanatili ang session at i-synchronize ang impormasyon.

### 3.2 Data sa pananalapi na ipinasok mo

- Mga gastos, gastos, kita, kategorya, kasaysayan ng pananalapi at mga transaksyon.
- Mga layunin, limitasyon, pagpaplano, pangarap at kagustuhan sa pananalapi.
- Impormasyong ginamit sa mga graph, ulat, pagsusuri at awtomatikong pag-mentoring sa loob ng app.
- Profile ng mamumuhunan, mga layunin at sagot na ibinigay sa mga talatanungan o mga screen ng pagpaplano.

Maaaring maging sensitibo ang data na ito sa praktikal na kahulugan, dahil ipinapakita nito ang mga aspeto ng iyong buhay pinansyal. Samakatuwid, dapat ka lamang magrehistro ng impormasyon na nais mong panatilihin sa application.

### 3.3 Data ng subscription at pagbili

- Binili na produkto, katayuan ng subscription, panahon, pag-renew, pagpapanumbalik ng pagbili at mga teknikal na pagkakakilanlan na kinakailangan upang kumpirmahin ang Premium.
- Ang mga pagbili, pagkansela, pag-renew, refund at pagsingil ay pinoproseso ng Google Play, alinsunod sa mga panuntunan ng Google account at store.

Ang app ay hindi nangongolekta o nag-iimbak ng mga numero ng card, mga code ng seguridad ng card o mga detalye ng pagbabayad sa bangko.

### 3.4 Data ng paggamit, diagnostic at performance- Mga kaganapan sa paggamit at pakikipag-ugnayan sa app, halimbawa mga screen na na-access, mga mapagkukunang ginamit at nakumpleto ang mga daloy.
- Pinagsama-sama o teknikal na data upang maunawaan ang katatagan, pagganap at pagpapabuti ng produkto.
- Mga ulat ng pagkakamali at diagnostic ng Firebase Crashlytics, kapag naaangkop, kabilang ang teknikal na impormasyon ng device, bersyon ng app, operating system, mga log ng error at identifier ng user kapag na-configure.

### 3.5 Data ng push notification

Kung papayagan mo ang mga notification mula sa app, maaari naming pangasiwaan ang:

- Firebase Cloud Messaging token (FCM).
- Mga kagustuhang nauugnay sa pagtanggap ng mga abiso.
- Mga paksa o mga segment na kinakailangan para sa pagpapadala ng mga komunikasyon mula sa mismong application.

Makokontrol mo kung pinapayagan ang mga notification sa mga setting ng Android.

### 3.6 Nabasa ang data ng notification sa Android

Ang pagsubaybay sa notification ay isang opsyonal na tampok. Gumagana lang ito kung manu-mano mong pinagana ang pag-access sa notification sa mga setting ng Android.

Kapag pinagana, matatanggap ng app ang pamagat, text, pangalan ng package ng source app, oras, at teknikal na metadata mula sa mga notification na ipinapakita sa iyong device. Ang layunin ay tukuyin ang mga abiso na tugma sa mga gastos, pagbili, pagbabayad, subscription at paglilipat upang makabuo ng mga rekord sa pananalapi.

Mahahalagang hakbang ng tampok na ito:

- Hindi ina-access ng app ang iyong bank account.
- Ang app ay hindi nagla-log in sa mga bangko, card o digital wallet.
- Ang app ay hindi humihingi ng password sa bangko.
- Naglalapat ang app ng mga filter upang maiwasan ang pagkuha ng mga code ng seguridad, OTP, mga password at mga mensahe sa pagpapatunay.
- Ang pokus ng filter ay upang matukoy ang mga katugmang pagbili, pagbabayad, paglilipat na ipinadala at mga paggalaw sa pananalapi.
- Maaari mong i-disable ang feature sa app o bawiin ang pahintulot sa mga setting ng Android.

Kahit na may mga filter, maaaring maglaman ang mga notification ng sensitibong impormasyon. I-enable lang ang feature na ito kung naiintindihan at tinatanggap mo ang ganitong uri ng pagproseso.

### 3.7 Lokasyon

Maaaring humiling ang app ng tinatayang o tumpak na lokasyon, ayon sa pahintulot na ibinigay ng Android, upang iakma ang mga paghahambing, nilalaman o konteksto ng pamumuhunan sa bansa/rehiyon.

Hindi kailangan ang lokasyon para sa lahat ng feature. Kung tatanggihan mo ang pahintulot, maaaring limitado ang ilang paghahambing o pagpapasadya.

### 3.8 Mga lokal na larawan at file

Kapag pumili ka ng isang imahe upang biswal na i-customize ang app, maaari itong i-store nang lokal sa device. Maliban kung partikular na ipinatupad sa hinaharap, ang mga larawan sa pag-personalize na ito ay hindi ipinapadala sa aming mga server.

### 3.9 Advertising

Maaaring magpakita ang app ng mga ad sa pamamagitan ng Google AdMob. Maaaring iproseso ng Google ang mga identifier ng device, data ng paggamit, teknikal na impormasyon at signal ng advertising alinsunod sa sariling mga patakaran ng Google at mga setting ng ad ng user.

### 3.10 Data mula sa mga external na API ng merkado

Maaaring kumonsulta ang app sa mga panlabas na API para sa mga exchange rate, quote, indeks o impormasyon sa merkado. Ang mga query na ito ay karaniwang may kasamang mga parameter gaya ng currency, asset, bansa o simbolo na hinahanap. Hindi kinakailangang ipadala ang iyong nakarehistrong personal na data sa pananalapi upang makuha ang impormasyong ito.

## 4. Para saan namin ginagamit ang data

Ginagamit namin ang data upang:

- Lumikha at panatilihin ang iyong account.
- I-sync ang mga gastos, layunin, kagustuhan, kasaysayan at mga setting.
- Ipakita ang mga dashboard, graph, ulat, limitasyon at personalized na nilalaman.
- Payagan ang mga pagbili, pagpapanumbalik at pagpapatunay ng Premium.
- Magpadala ng mga notification mula sa app mismo, kapag pinapayagan.
- Iproseso ang suportadong pampinansyal na mga abiso, kung pinagana mo ang tampok na ito.
- Iangkop ang nilalaman ng pamumuhunan sa lokal na konteksto, kapag pinahintulutan ang localization.
- Pagbutihin ang katatagan, pagganap, seguridad at karanasan sa aplikasyon.
- Sumunod sa mga legal na obligasyon, tumugon sa mga kahilingan at maiwasan ang pang-aabuso.
- Ipakita ang mga advertisement kung saan naaangkop.

## 5. Mga legal na batayan

Kapag nalalapat ang LGPD, ang pagpoproseso ay maaaring umasa sa isa o higit pang mga legal na batayan, kabilang ang:- Pagpapatupad ng kontrata o mga paunang pamamaraan, upang maihatid ang mga mapagkukunan ng aplikasyon.
- Pahintulot, para sa mga opsyonal na pahintulot gaya ng lokasyon, push notification at access sa Android notification.
- Lehitimong interes, para sa kaligtasan, pagsusuri, pagpapabuti ng produkto, pag-iwas sa pang-aabuso at proporsyonal na istatistika.
- Pagsunod sa mga legal o regulasyong obligasyon, kung kinakailangan.
- Regular na paggamit ng mga karapatan, sa administratibo, hudisyal o extrajudicial na paglilitis.

Maaari mong bawiin ang mga opsyonal na pahintulot sa mga setting ng app o operating system, ngunit maaari nitong limitahan ang functionality.

## 6. Pagbabahagi sa mga ikatlong partido

Hindi namin ibinebenta ang iyong personal na data.

Maaari naming ibahagi o payagan ang pagproseso ng data ng mga provider na kinakailangan para sa pagpapatakbo ng app, kabilang ang:

- **Google Firebase**: Firebase Authentication, Cloud Firestore, Firebase Cloud Messaging, Firebase Analytics at Firebase Crashlytics.
- **Google Sign-In / Apple Sign-In**: login sa pamamagitan ng third-party na account, kapag pinili mo.
- **Google Play Billing**: pagproseso ng mga subscription, pagbili, pagkansela, pagpapanumbalik at status ng Premium.
- **Google AdMob**: pagpapakita at pagsukat ng mga ad.
- **Market, foreign exchange o quotation API**: konsultasyon ng pampubliko o market financial information na ginamit sa app.
- **Android system services**: mga pahintulot, notification at mapagkukunan ng device.

Ang mga third party na ito ay maaaring magproseso ng data alinsunod sa kanilang sariling mga tuntunin, patakaran at setting.

## 7. International transfer

Ang mga serbisyo tulad ng Firebase, Google Play, AdMob at iba pang mga provider ay maaaring magproseso ng data sa mga server na matatagpuan sa labas ng Brazil. Sa pamamagitan ng paggamit ng app, kinikilala mo na maaaring mangyari ang internasyonal na pagpoproseso na ito, napapailalim sa naaangkop na mga panuntunan sa proteksyon ng data at mga tuntunin ng mga provider.

## 8. Pagpapanatili

Pinapanatili namin ang data hangga't kinakailangan upang maihatid ang aplikasyon, matupad ang mga layuning inilarawan sa patakarang ito, sumunod sa mga legal na obligasyon, lutasin ang mga hindi pagkakaunawaan, maiwasan ang panloloko at mapanatili ang seguridad.

Sa pangkalahatan:

- Ang data ng account at data ng pananalapi sa cloud ay mananatili hangga't umiiral ang account o hanggang sa isang wastong kahilingan sa pagtanggal.
- Maaaring manatili ang lokal na data sa device hanggang sa burahin mo, i-clear ang data ng app, o i-uninstall ang app.
- Maaaring panatilihin ang diagnostic data, analytics at mga log para sa mga panahong tinukoy ng mga provider.
- Maaaring manatili ang impormasyon sa pagbili sa Google Play ayon sa mga patakaran sa buwis, komersyal at tindahan.
- Maaaring itago ang anonymized o pinagsama-samang data nang hindi ka nakikilala.

## 9. Seguridad

Gumagamit kami ng mga makatwirang teknikal at pang-organisasyong hakbang upang protektahan ang data, kabilang ang:

- Pagpapatunay ni Firebase.
- I-access ang mga panuntunan sa database upang limitahan ang data sa kaukulang user.
- Komunikasyon na naka-encrypt ng mga SDK at API na ginamit.
- Paggamit ng Android na mga pahintulot lamang kapag nauugnay sa mga mapagkukunan ng app.
- Mga filter kapag sinusubaybayan ang mga abiso upang maiwasan ang mga code ng seguridad, OTP, mga password at mga mensahe sa pagpapatunay.
- Fault diagnosis upang itama ang mga error at pagbutihin ang katatagan.

Walang sistema na 100% secure. Dapat mo ring protektahan ang iyong device, gumamit ng lock ng screen, panatilihin ang malakas na password, iwasang ibahagi ang iyong account at i-update ang app kapag may inilabas na bagong bersyon.

## 10. Ang iyong mga kontrol

Maaari mong:

- I-edit o tanggalin ang impormasyon sa loob ng app, kapag umiiral ang function na ito.
- Huwag paganahin ang mga push notification sa Android na mga setting.
- Bawiin ang lokasyon sa mga setting ng Android.
- Bawiin ang access sa mga notification sa mga setting ng Android.
- Kanselahin o pamahalaan ang subscription sa pamamagitan ng Google Play.
- I-clear ang data ng lokal na app o i-uninstall ang app.
- Humiling ng access, pagwawasto o pagtanggal sa pamamagitan ng contact email.

## 11. Pagtanggal ng account at data

Upang humiling ng pagtanggal ng account at data:1. Magpadala ng email sa **george.guimares@gmail.com**.
2. Gamitin ang paksa **"Pagtanggal ng Data - Mentor Financeiro"** o **"LGPD - Mentor Financeiro"**.
3. Ipasok ang email ng account, paraan ng pag-login o iba pang identifier na tumutulong na mahanap ang profile.
4. Ipahiwatig kung gusto mo ng kabuuang pagtanggal ng data ng account/cloud o pagtanggal ng mga partikular na kategorya, kapag posible sa teknikal.

Maaari kaming humiling ng kumpirmasyon ng pagkakakilanlan upang maiwasan ang mga hindi nararapat na pagtanggal.

Ang mga sumusunod ay maaaring ibukod o i-unlink, kung naaangkop:

- Profile ng user at mga dokumento sa Cloud Firestore.
- Paggastos, layunin, kagustuhan, kasaysayan ng pananalapi at mga setting na naka-save sa cloud.
- FCM token na nauugnay sa profile, kapag inimbak.
- Account sa Firebase Authentication, kapag hiniling ang kabuuan at naaangkop na teknikal na pagtanggal.

Maaari silang manatili nang mas matagal:

- Anonymize o pinagsama-samang data.
- Mga rekord na kinakailangan para sa legal na pagsunod, pag-iwas sa pandaraya, seguridad o pagtatanggol sa mga karapatan.
- Kasaysayan ng mga pagbili, pagbabayad at subscription na pinananatili ng Google Play.
- Direktang naproseso ang data ng mga third-party na provider alinsunod sa kanilang mga patakaran.

Susubukan naming tumugon sa mga wastong kahilingan sa loob ng 30 araw ng negosyo, maliban kung kumplikado, legal na obligasyon o kailangan para sa karagdagang pag-verify.

## 12. Mga karapatan ng may hawak

Alinsunod sa naaangkop na batas, maaari kang humiling ng:

- Pagkumpirma ng pagkakaroon ng paggamot.
- Access sa data.
- Pagwawasto ng hindi kumpleto, hindi tumpak o hindi napapanahong data.
- Anonymization, pagharang o pagtanggal ng hindi kailangan, labis o hindi sumusunod na data.
- Impormasyon tungkol sa pagbabahagi.
- Pagbawi ng pahintulot.
- Pagtanggal ng data na naproseso batay sa pahintulot, kapag naaangkop.
- Portability, kapag kinokontrol at teknikal na posible.
- Pagsusuri ng mga awtomatikong desisyon, kapag naaangkop.

Upang gamitin ang mga karapatang ito, magpadala ng email sa **george.guimares@gmail.com**.

## 13. Mga bata at kabataan

Ang aplikasyon ay hindi naglalayong sa mga batang wala pang 13 taong gulang. Kung nauunawaan ng isang legal na tagapag-alaga na ang isang bata ay nagbigay ng data sa app, dapat silang makipag-ugnayan sa amin upang masuri namin ang pagtanggal.

## 14. Mga pagbabago sa patakarang ito

Maaari naming i-update ang Patakaran sa Privacy na ito upang ipakita ang mga pagbabago sa app, provider, legal na kinakailangan o Google Play na mga panuntunan. Ang petsa sa itaas ay nagpapahiwatig ng kasalukuyang bersyon. Maaaring ipaalam ang mga nauugnay na pagbabago sa loob ng app, sa na-publish na page o sa iba pang makatwirang paraan.

## 15. Makipag-ugnayan

**Aplikasyon:** Mentor Financeiro

**Email:** george.guimares@gmail.com

**Patakaran na na-publish sa:** https://terriblegeorge.github.io/Mentor_Financeiro/

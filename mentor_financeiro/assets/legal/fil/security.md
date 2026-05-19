# Seguridad - Mentor Financeiro

**Huling na-update:** Mayo 19, 2026

Ipinapaliwanag ng page na ito ang Mentor Financeiro na mga kasanayan sa seguridad sa tuwirang wika. Kinukumpleto nito ang Patakaran sa Privacy at Mga Tuntunin ng Paggamit.

## 1. Pangako sa Seguridad

Ang Mentor Financeiro ay binuo upang tumulong sa organisasyong pampinansyal nang hindi humihingi ng direktang access sa bank account, nang hindi humihiling ng password sa bangko at hindi gumagana bilang isang bangko, broker o paraan ng pagbabayad.

Maaaring mag-imbak ang app ng data sa pananalapi na ipinasok mo o natukoy ng mga opsyonal na feature, kaya naman tinatrato namin ang seguridad bilang isang sentral na bahagi ng produkto.

## 2. Ano ang hindi ginagawa ng app

- Hindi ito humihingi ng password sa bangko, card o digital wallet.
- Hindi ina-access ang iyong bank account.
- Hindi gumagalaw ng pera.
- Hindi ito nagsasagawa ng mga pagbabayad, Pix, paglilipat o pamumuhunan sa iyong pangalan.
- Hindi humihiling ng code ng seguridad ng card.
- Hindi humihiling ng bank code OTP.
- Hindi nagbebenta ng iyong personal na data.

## 3. Ginamit ang mga teknikal na hakbang

Depende sa resource na ginamit, magagamit ng app ang:

- Mag-log in ni Firebase Authentication.
- Cloud Firestore na may data na nauugnay sa na-authenticate na user.
- Mga panuntunan sa seguridad upang paghigpitan ang pag-access sa sariling data ng user.
- Komunikasyon na naka-encrypt ng mga SDK at serbisyong ginagamit.
- Firebase Crashlytics upang matukoy ang mga teknikal na pagkakamali at iwasto ang mga problema.
- Android na mga pahintulot ay hiniling lamang kapag nauugnay sa mga feature ng app.
- Lokal na storage para sa mga kagustuhan, tema, cache at data ng device.

## 4. Pagsubaybay sa Abiso

Ang pagsubaybay sa notification ay opsyonal at nangangailangan ng manu-manong pag-activate sa Android.

Kapag naka-enable, mababasa ng app ang mga sinusuportahang notification para makilala ang paggastos, pagbili, pagbabayad, subscription, at paglilipat. Ang layunin ay bawasan ang manu-manong trabaho kapag nagre-record ng mga gastos.

Upang mabawasan ang mga panganib:

- Ipinapaalam sa iyo ng app ang dahilan ng pahintulot bago ka idirekta sa mga setting.
- Maaaring bawiin ang access anumang oras sa mga setting ng Android.
- Ang filter ay naghahanap ng mga katugmang kaganapan sa pananalapi, hindi mga personal na pag-uusap.
- Sinusubukan ng app na huwag pansinin ang OTP code, password, security code, at mga mensahe sa pagpapatunay.
- Hindi ginagamit ng app ang feature na ito para ma-access ang mga bangko, card o digital wallet.

Gayunpaman, ang mga notification ay maaaring maglaman ng sensitibong data. Gamitin lang ang feature na ito kung sumasang-ayon ka sa ganitong uri ng pagproseso.

## 5. Mga sensitibong pahintulot

Maaaring humiling ang app ng:

- **Internet:** koneksyon sa Firebase, Google Play, mga API at online na mapagkukunan.
- **Mga Notification:** pagpapadala ng mga alerto mula sa app mismo.
- **Lokasyon:** adaptasyon ng nilalaman o paghahambing sa bansa/rehiyon, kapag pinahintulutan.
- **Access sa Android notification:** opsyonal na pagkakakilanlan ng mga gastos mula sa mga katugmang notification.
- **Mga in-app na pagbili:** Premium subscription ng Google Play.

Kinokontrol mo ang mga pahintulot na ito sa mga setting ng Android.

## 6. Ang iyong bahagi sa seguridad

Para protektahan ang iyong data:

- Gamitin ang lock ng screen sa iyong device.
- Huwag ibahagi ang iyong account.
- Panatilihing na-update ang app at Android.
- Bawiin ang mga pahintulot na hindi mo na gustong gamitin.
- Suriin ang mga awtomatikong natukoy na transaksyon bago gumawa ng mga desisyon.
- Huwag magrehistro ng impormasyon na hindi mo gustong itago sa application.
- Direktang kanselahin ang mga subscription sa Google Play kapag ayaw mong mag-renew.

## 7. Mga Limitasyon

Walang application, server, operating system o cloud service na 100% secure. Sa kabila ng mga hakbang na pinagtibay, ang mga pagkabigo, hindi available, mga error sa pag-synchronize, pagkawala ng access, mga problema sa third-party o panlabas na pagtatangka sa pang-aabuso ay maaaring mangyari.

Ang Mentor Financeiro ay naglalayong bawasan ang mga panganib sa makatwirang paraan, ngunit dapat kang magpanatili ng mga kopya o sariling kontrol ng mahahalagang impormasyon sa pananalapi.

## 8. Mga insidente at contact

Kung may napansin kang kakaibang gawi, hindi tamang pag-access, maling data, pinaghihinalaang paglabag sa seguridad o problema sa mga sensitibong pahintulot, mangyaring makipag-ugnayan sa:

**george.guimares@gmail.com**

Isama, kung maaari:

- Modelo ng device.
- Android na bersyon.
- Bersyon ng app.
- Paglalarawan ng problema.
- Mga screenshot nang hindi inilalantad ang mga password, code o labis na data.

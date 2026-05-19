# Dasar Privasi - Mentor Financeiro

**Terakhir dikemas kini:** 19 Mei 2026

**Permohonan:** Mentor Financeiro

**Pakej Android:** `com.georgeguimares.mentorfinanceiro`

**Dasar diterbitkan pada:** https://terriblegeorge.github.io/Mentor_Financeiro/

Dasar Privasi ini menerangkan dengan jelas data yang Mentor Financeiro boleh akses, kumpul, gunakan, simpan, kongsi dan lindungi. Ia ditulis untuk menggambarkan operasi semasa aplikasi dan harus dibaca bersama dengan halaman Syarat Penggunaan dan Keselamatan.

Mentor Financeiro ialah aplikasi untuk organisasi kewangan, pendidikan kewangan, matlamat, rekod perbelanjaan, graf, laporan, kandungan pelaburan dan ciri langganan Premium pilihan. Permohonan itu bukan bank, broker, institusi kewangan, penasihat pelaburan berdaftar, syarikat insurans atau kaedah pembayaran.

## 1. Siapa yang bertanggungjawab

Mentor Financeiro ditawarkan oleh pembangun yang bertanggungjawab untuk menerbitkan aplikasi pada Google Play.

Untuk melaksanakan hak yang berkaitan dengan data anda, bertanya soalan atau meminta pemadaman, hubungi kami melalui e-mel:

**george.guimares@gmail.com**

## 2. Ringkasan dalam bahasa mudah

- Aplikasi ini membantu anda mengatur perbelanjaan, matlamat, had, sejarah kewangan, pelaburan dan kandungan pendidikan.
- Untuk menggunakan ciri tertentu, anda boleh log masuk dengan e-mel/kata laluan, akaun Google, akaun Apple atau mod inkognito, melalui Firebase Authentication.
- Data kewangan yang anda berikan, seperti perbelanjaan, matlamat, had, profil dan keutamaan, boleh disimpan dalam Firebase/Cloud Firestore untuk penyegerakan dan operasi akaun.
- Apl menggunakan perkhidmatan Google/Firebase untuk log masuk, pangkalan data, pemberitahuan tolak, analitik dan diagnosis kesalahan.
- Apl mungkin menggunakan Google AdMob untuk memaparkan iklan.
- Premium diproses oleh Google Play Billing dalam apl itu sendiri.
- Lokasi adalah pilihan dan digunakan hanya apabila anda membenarkannya, contohnya untuk menyesuaikan perbandingan pelaburan dengan negara atau konteks tempatan.
- Ciri pemantauan pemberitahuan adalah pilihan. Jika anda mendayakan akses pemberitahuan pada Android, apl itu boleh membaca tajuk dan teks pemberitahuan yang disokong untuk mengenal pasti pembelian, pembayaran dan pemindahan serta mengubahnya menjadi rekod kewangan. Aplikasi ini tidak mengakses akaun bank anda dan tidak meminta kata laluan.
- Imej yang anda pilih untuk diperibadikan boleh disimpan secara setempat pada peranti.
- Anda boleh meminta pemadaman akaun dan data melalui e-mel yang dinyatakan dalam dasar ini.

## 3. Data yang mungkin kami proses

Bergantung pada cara anda menggunakan aplikasi, kami mungkin memproses kategori data berikut.

### 3.1 Data akaun dan pengenalan

- Nama disediakan dalam pendaftaran.
- E-mel.
- Firebase (UID) pengecam pengguna.
- Kaedah log masuk digunakan.
- Foto profil, apabila disediakan oleh pembekal log masuk.
- Premium status langganan yang dikaitkan dengan profil.
- Data teknikal yang diperlukan untuk mengekalkan sesi dan menyegerakkan maklumat.

### 3.2 Data kewangan yang anda masukkan

- Perbelanjaan, perbelanjaan, pendapatan, kategori, sejarah kewangan dan urus niaga.
- Matlamat, had, perancangan, impian kewangan dan keutamaan.
- Maklumat yang digunakan dalam graf, laporan, analisis dan bimbingan automatik dalam apl.
- Profil pelabur, objektif dan jawapan yang disediakan dalam soal selidik atau skrin perancangan.

Data ini boleh menjadi sensitif dalam erti kata yang praktikal, kerana ia mendedahkan aspek kehidupan kewangan anda. Oleh itu, anda hanya perlu mendaftar maklumat yang anda ingin simpan dalam aplikasi.

### 3.3 Data langganan dan pembelian

- Produk yang dibeli, status langganan, tempoh, pembaharuan, pemulihan pembelian dan pengecam teknikal diperlukan untuk mengesahkan Premium.
- Pembelian, pembatalan, pembaharuan, bayaran balik dan caj diproses oleh Google Play, mengikut peraturan akaun dan kedai Google.

Apl ini tidak mengumpul atau menyimpan nombor kad, kod keselamatan kad atau butiran pembayaran bank.

### 3.4 Data penggunaan, diagnostik dan prestasi- Peristiwa penggunaan dan interaksi dalam apl, contohnya skrin diakses, sumber digunakan dan aliran selesai.
- Data agregat atau teknikal untuk memahami kestabilan, prestasi dan peningkatan produk.
- Laporan kerosakan dan diagnostik oleh Firebase Crashlytics, apabila berkenaan, termasuk maklumat teknikal peranti, versi apl, sistem pengendalian, log ralat dan pengecam pengguna apabila dikonfigurasikan.

### 3.5 Data pemberitahuan tolak

Jika anda membenarkan pemberitahuan daripada apl, kami boleh mengendalikan:

- Firebase Cloud Messaging token (FCM).
- Keutamaan yang berkaitan dengan menerima pemberitahuan.
- Topik atau segmen yang diperlukan untuk menghantar komunikasi daripada aplikasi itu sendiri.

Anda boleh mengawal sama ada pemberitahuan dibenarkan dalam tetapan Android.

### 3.6 Data pemberitahuan dibaca dalam Android

Pemantauan pemberitahuan adalah ciri pilihan. Ia hanya berfungsi jika anda mendayakan akses pemberitahuan secara manual dalam tetapan Android.

Apabila didayakan, apl boleh menerima tajuk, teks, nama pakej apl sumber, masa dan metadata teknikal daripada pemberitahuan yang dipaparkan pada peranti anda. Objektifnya adalah untuk mengenal pasti pemberitahuan yang serasi dengan perbelanjaan, pembelian, pembayaran, langganan dan pemindahan untuk menjana rekod kewangan.

Langkah penting ciri ini:

- Aplikasi ini tidak mengakses akaun bank anda.
- Aplikasi ini tidak log masuk ke bank, kad atau dompet digital.
- Aplikasi ini tidak meminta kata laluan bank.
- Apl menggunakan penapis untuk mengelak daripada menangkap kod keselamatan, OTP, kata laluan dan mesej pengesahan.
- Fokus penapis adalah untuk mengenal pasti pembelian yang serasi, pembayaran, pemindahan dihantar dan pergerakan kewangan.
- Anda boleh melumpuhkan ciri dalam apl atau membatalkan kebenaran dalam tetapan Android.

Walaupun dengan penapis, pemberitahuan boleh mengandungi maklumat sensitif. Hanya dayakan ciri ini jika anda memahami dan menerima jenis pemprosesan ini.

### 3.7 Lokasi

Apl boleh meminta lokasi anggaran atau tepat, mengikut kebenaran yang diberikan oleh Android, untuk menyesuaikan perbandingan, kandungan atau konteks pelaburan kepada negara/rantau.

Lokasi tidak diperlukan untuk semua ciri. Jika anda menafikan kebenaran, beberapa perbandingan atau penyesuaian mungkin terhad.

### 3.8 Imej dan fail tempatan

Apabila anda memilih imej untuk menyesuaikan apl secara visual, ia boleh disimpan secara setempat pada peranti. Melainkan dilaksanakan secara khusus pada masa hadapan, imej pemperibadian ini tidak dihantar ke pelayan kami.

### 3.9 Pengiklanan

Apl ini mungkin memaparkan iklan melalui Google AdMob. Google boleh memproses pengecam peranti, data penggunaan, maklumat teknikal dan isyarat pengiklanan mengikut dasar Google sendiri dan tetapan iklan pengguna.

### 3.10 Data daripada API pasaran luaran

Aplikasi ini boleh merujuk API luaran untuk kadar pertukaran, sebut harga, indeks atau maklumat pasaran. Pertanyaan ini biasanya melibatkan parameter seperti mata wang, aset, negara atau simbol yang sedang dicari. Ia tidak perlu menghantar data kewangan peribadi berdaftar anda untuk mendapatkan maklumat ini.

## 4. Untuk apa kami menggunakan data

Kami menggunakan data untuk:

- Buat dan kekalkan akaun anda.
- Segerakkan perbelanjaan, matlamat, pilihan, sejarah dan tetapan.
- Paparkan papan pemuka, graf, laporan, had dan kandungan yang diperibadikan.
- Benarkan pembelian, pemulihan dan pengesahan Premium.
- Hantar pemberitahuan daripada apl itu sendiri, apabila dibenarkan.
- Proses pemberitahuan kewangan yang disokong, jika anda mendayakan ciri ini.
- Sesuaikan kandungan pelaburan dengan konteks setempat, apabila penyetempatan dibenarkan.
- Meningkatkan kestabilan, prestasi, keselamatan dan pengalaman aplikasi.
- Mematuhi kewajipan undang-undang, bertindak balas terhadap permintaan dan mencegah penyalahgunaan.
- Paparkan iklan jika berkenaan.

## 5. Asas undang-undang

Apabila LGPD terpakai, pemprosesan mungkin bergantung pada satu atau lebih asas undang-undang, termasuk:- Pelaksanaan kontrak atau prosedur awal, untuk menyampaikan sumber permohonan.
- Persetujuan, untuk kebenaran pilihan seperti lokasi, pemberitahuan tolak dan akses kepada pemberitahuan Android.
- Kepentingan yang sah, untuk keselamatan, diagnosis, penambahbaikan produk, pencegahan penyalahgunaan dan statistik berkadar.
- Pematuhan terhadap kewajipan undang-undang atau kawal selia, apabila perlu.
- Penggunaan hak secara tetap, dalam prosiding pentadbiran, kehakiman atau luar kehakiman.

Anda boleh membatalkan persetujuan pilihan dalam tetapan apl atau sistem pengendalian, tetapi ini mungkin mengehadkan kefungsian.

## 6. Berkongsi dengan pihak ketiga

Kami tidak menjual data peribadi anda.

Kami mungkin berkongsi atau membenarkan pemprosesan data oleh pembekal yang diperlukan untuk pengendalian apl, termasuk:

- **Google Firebase**: Firebase Authentication, Cloud Firestore, Firebase Cloud Messaging, Firebase Analytics dan Firebase Crashlytics.
- **Log Masuk Google / Log Masuk Apple**: log masuk melalui akaun pihak ketiga, apabila dipilih oleh anda.
- **Google Play Billing**: pemprosesan langganan, pembelian, pembatalan, pemulihan dan status Premium.
- **Google AdMob**: paparan dan pengukuran iklan.
- **API pasaran, pertukaran asing atau sebut harga**: perundingan maklumat kewangan awam atau pasaran yang digunakan dalam apl.
- **Android perkhidmatan sistem**: kebenaran, pemberitahuan dan sumber peranti.

Pihak ketiga ini boleh memproses data mengikut terma, dasar dan tetapan mereka sendiri.

## 7. Pemindahan antarabangsa

Perkhidmatan seperti Firebase, Google Play, AdMob dan pembekal lain boleh memproses data pada pelayan yang terletak di luar Brazil. Dengan menggunakan apl, anda mengakui bahawa pemprosesan antarabangsa ini mungkin berlaku, tertakluk pada peraturan perlindungan data yang berkenaan dan syarat penyedia.

## 8. Pengekalan

Kami menyimpan data selama yang diperlukan untuk menghantar permohonan, memenuhi tujuan yang diterangkan dalam dasar ini, mematuhi kewajipan undang-undang, menyelesaikan pertikaian, mencegah penipuan dan mengekalkan keselamatan.

Secara umum:

- Data akaun dan data kewangan dalam awan kekal selagi akaun itu wujud atau sehingga permintaan pemadaman yang sah.
- Data setempat mungkin kekal pada peranti sehingga anda memadam, mengosongkan data apl atau menyahpasang apl.
- Data diagnostik, analitik dan log boleh disimpan untuk tempoh yang ditentukan oleh pembekal.
- Maklumat pembelian mungkin kekal dalam Google Play mengikut peraturan cukai, komersial dan kedai.
- Data awanama atau agregat mungkin disimpan tanpa mengenal pasti anda.

## 9. Keselamatan

Kami menggunakan langkah teknikal dan organisasi yang munasabah untuk melindungi data, termasuk:

- Pengesahan oleh Firebase.
- Peraturan akses dalam pangkalan data untuk mengehadkan data kepada pengguna yang sepadan.
- Komunikasi yang disulitkan oleh SDK dan API yang digunakan.
- Penggunaan kebenaran Android hanya apabila berkaitan dengan sumber apl.
- Tapis apabila memantau pemberitahuan untuk mengelakkan kod keselamatan, OTP, kata laluan dan mesej pengesahan.
- Diagnosis kerosakan untuk membetulkan ralat dan meningkatkan kestabilan.

Tiada sistem yang 100% selamat. Anda juga harus melindungi peranti anda, menggunakan kunci skrin, menyimpan kata laluan yang kukuh, elakkan berkongsi akaun anda dan mengemas kini apl apabila versi baharu dikeluarkan.

## 10. Kawalan anda

Anda boleh:

- Edit atau padam maklumat dalam apl, apabila fungsi ini wujud.
- Lumpuhkan pemberitahuan tolak dalam tetapan Android.
- Batalkan lokasi dalam tetapan Android.
- Batalkan akses kepada pemberitahuan dalam tetapan Android.
- Batalkan atau uruskan langganan melalui Google Play.
- Kosongkan data apl tempatan atau nyahpasang apl.
- Minta akses, pembetulan atau pemadaman melalui e-mel hubungan.

## 11. Pemadaman akaun dan data

Untuk meminta pemadaman akaun dan data:1. Hantar e-mel kepada **george.guimares@gmail.com**.
2. Gunakan subjek **"Pemadaman Data - Mentor Financeiro"** atau **"LGPD - Mentor Financeiro"**.
3. Masukkan e-mel akaun, kaedah log masuk atau pengecam lain yang membantu mencari profil.
4. Nyatakan sama ada anda mahukan pemadaman total bagi data akaun/awan atau pemadaman kategori tertentu, apabila mungkin secara teknikal.

Kami mungkin meminta pengesahan identiti untuk mengelakkan pemadaman yang tidak wajar.

Perkara berikut mungkin dikecualikan atau dinyahpautkan, mengikut kesesuaian:

- Profil pengguna dan dokumen dalam Cloud Firestore.
- Perbelanjaan, matlamat, pilihan, sejarah kewangan dan tetapan yang disimpan dalam awan.
- Token FCM dikaitkan dengan profil, apabila disimpan.
- Akaun dalam Firebase Authentication, apabila pemadaman jumlah dan terpakai secara teknikal diminta.

Mereka boleh tinggal lebih lama:

- Data awanama atau agregat.
- Rekod yang diperlukan untuk pematuhan undang-undang, pencegahan penipuan, keselamatan atau pembelaan hak.
- Sejarah pembelian, pembayaran dan langganan yang dikekalkan oleh Google Play.
- Data diproses secara langsung oleh pembekal pihak ketiga mengikut dasar mereka.

Kami akan berusaha untuk membalas permintaan yang sah dalam masa 30 hari perniagaan, melainkan rumit, kewajipan undang-undang atau memerlukan pengesahan tambahan.

## 12. Hak pemegang

Tertakluk kepada undang-undang yang terpakai, anda boleh meminta:

- Pengesahan kewujudan rawatan.
- Akses kepada data.
- Pembetulan data yang tidak lengkap, tidak tepat atau lapuk.
- Anonimasi, menyekat atau memadamkan data yang tidak perlu, berlebihan atau tidak patuh.
- Maklumat tentang perkongsian.
- Pembatalan persetujuan.
- Pemadaman data yang diproses berdasarkan persetujuan, apabila berkenaan.
- Mudah alih, apabila dikawal dan secara teknikal mungkin.
- Semakan keputusan automatik, apabila berkenaan.

Untuk melaksanakan hak ini, hantar e-mel kepada **george.guimares@gmail.com**.

## 13. Kanak-kanak dan remaja

Permohonan tidak ditujukan kepada kanak-kanak di bawah umur 13 tahun. Jika penjaga yang sah memahami bahawa kanak-kanak telah memberikan data kepada apl, mereka harus menghubungi kami supaya kami boleh menilai pemadaman itu.

## 14. Perubahan kepada dasar ini

Kami mungkin mengemas kini Dasar Privasi ini untuk mencerminkan perubahan pada apl, pembekal, keperluan undang-undang atau peraturan Google Play. Tarikh di bahagian atas menunjukkan versi semasa. Perubahan yang berkaitan boleh disampaikan dalam apl, pada halaman yang diterbitkan atau melalui cara lain yang munasabah.

## 15. Hubungi

**Permohonan:** Mentor Financeiro

**E-mel:** george.guimares@gmail.com

**Dasar diterbitkan pada:** https://terriblegeorge.github.io/Mentor_Financeiro/

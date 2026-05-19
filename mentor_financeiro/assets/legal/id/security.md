# Keamanan - Mentor Financeiro

**Terakhir diperbarui:** 19 Mei 2026

Halaman ini menjelaskan praktik keamanan Mentor Financeiro dalam bahasa yang lugas. Ini melengkapi Kebijakan Privasi dan Ketentuan Penggunaan.

## 1. Komitmen Keamanan

Mentor Financeiro dikembangkan untuk membantu organisasi keuangan tanpa meminta akses langsung ke rekening bank, tanpa meminta kata sandi bank dan tanpa berfungsi sebagai bank, broker atau metode pembayaran.

Aplikasi ini dapat menyimpan data keuangan yang Anda masukkan atau diidentifikasi dengan fitur opsional, itulah sebabnya kami memperlakukan keamanan sebagai bagian utama dari produk.

## 2. Apa yang tidak dilakukan aplikasi

- Tidak meminta kata sandi bank, kartu atau dompet digital.
- Tidak mengakses rekening bank Anda.
- Tidak memindahkan uang.
- Tidak melakukan pembayaran, Pix, transfer atau investasi atas nama Anda.
- Tidak meminta kode keamanan kartu.
- Tidak meminta kode bank OTP.
- Tidak menjual data pribadi Anda.

## 3. Tindakan teknis yang digunakan

Bergantung pada sumber daya yang digunakan, aplikasi dapat menggunakan:

- Masuk oleh Firebase Authentication.
- Cloud Firestore dengan data yang terkait dengan pengguna yang diautentikasi.
- Aturan keamanan untuk membatasi akses ke data milik pengguna.
- Komunikasi dienkripsi oleh SDK dan layanan yang digunakan.
- Firebase Crashlytics untuk mengidentifikasi kesalahan teknis dan memperbaiki masalah.
- Izin Android hanya diminta jika terkait dengan fitur aplikasi.
- Penyimpanan lokal untuk preferensi, tema, cache, dan data perangkat.

## 4. Pemantauan Notifikasi

Pemantauan notifikasi bersifat opsional dan memerlukan aktivasi manual di Android.

Saat diaktifkan, aplikasi dapat membaca notifikasi yang didukung untuk mengenali pengeluaran, pembelian, pembayaran, langganan, dan transfer. Tujuannya adalah untuk mengurangi pekerjaan manual saat mencatat pengeluaran.

Untuk mengurangi risiko:

- Aplikasi ini memberi tahu Anda alasan izin sebelum mengarahkan Anda ke pengaturan.
- Akses dapat dicabut kapan saja di pengaturan Android.
- Filter mencari peristiwa keuangan yang kompatibel, bukan percakapan pribadi.
- Aplikasi mencoba mengabaikan kode OTP, kata sandi, kode keamanan, dan pesan otentikasi.
- Aplikasi tidak menggunakan fitur ini untuk mengakses bank, kartu, atau dompet digital.

Meski begitu, notifikasi mungkin berisi data sensitif. Gunakan fitur ini hanya jika Anda menyetujui jenis pemrosesan ini.

## 5. Izin sensitif

Aplikasi mungkin meminta:

- **Internet:** koneksi ke Firebase, Google Play, API, dan sumber daya online.
- **Pemberitahuan:** mengirimkan peringatan dari aplikasi itu sendiri.
- **Lokasi:** adaptasi konten atau perbandingan dengan negara/wilayah, jika diizinkan.
- **Akses ke notifikasi Android:** identifikasi biaya opsional dari notifikasi yang kompatibel.
- **Pembelian dalam aplikasi:** Premium berlangganan oleh Google Play.

Anda mengontrol izin ini di pengaturan Android.

## 6. Peran Anda dalam keamanan

Untuk melindungi data Anda:

- Gunakan kunci layar pada perangkat.
- Jangan bagikan akun Anda.
- Selalu perbarui aplikasi dan Android.
- Cabut izin yang tidak ingin Anda gunakan lagi.
- Periksa transaksi yang diidentifikasi secara otomatis sebelum mengambil keputusan.
- Jangan mendaftarkan informasi yang tidak ingin Anda simpan di aplikasi.
- Batalkan langganan langsung di Google Play jika Anda tidak ingin memperbarui.

## 7. Keterbatasan

Tidak ada aplikasi, server, sistem operasi, atau layanan cloud yang 100% aman. Terlepas dari tindakan yang diambil, kegagalan, ketidaktersediaan, kesalahan sinkronisasi, kehilangan akses, masalah pihak ketiga, atau upaya penyalahgunaan dari pihak luar dapat terjadi.

Mentor Financeiro berupaya mengurangi risiko secara wajar, namun Anda harus menyimpan salinan atau memiliki kendali atas informasi keuangan penting.

## 8. Insiden dan kontak

Jika Anda melihat perilaku aneh, akses yang tidak tepat, data yang salah, dugaan pelanggaran keamanan, atau masalah dengan izin sensitif, silakan hubungi:

**george.guimares@gmail.com**

Sertakan, jika memungkinkan:

- Model perangkat.
- Versi Android.
- Versi aplikasi.
- Deskripsi masalahnya.
- Tangkapan layar tanpa memaparkan kata sandi, kode, atau data berlebihan.

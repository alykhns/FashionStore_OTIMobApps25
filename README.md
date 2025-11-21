# FashionStore_OTIMobApps25
**Dibuat oleh:** Aliya Khairun Nisa (KOMA 24) 

Aplikasi E-Commerce Fashion berbasis Mobile yang dibuat menggunakan Flutter untuk penugasan Open Recruitment OmahTI 2025 Divisi Mobile Apps. Aplikasi ini mencakup implementasi autentikasi pengguna, manajemen state, dan antarmuka yang responsif.

## Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **State Management:** [GetX](https://pub.dev/packages/get) (untuk navigasi & reactive state)
* **Local Storage:** GetStorage (untuk menyimpan status login & tema)
* **UI Components:** Google Fonts, Custom Widgets

## Fitur Utama

1.  **Authentication Flow:** Login, Register, dan Lupa Password
2.  **Onboarding Screen:** Pengenalan untuk pengguna baru.
3.  **Persistent Login:** User tetap login meskipun aplikasi ditutup (menggunakan GetStorage).
4.  **Dark/Light Mode:** Dukungan tema gelap dan terang yang responsif.
5.  **Form Validation:** Validasi input email dan password secara real-time.

---

## Slicing UI & Panduan Pengguna (Documentation)

### 1. Splash Screen
Halaman pertama yang muncul saat aplikasi dibuka.
* **Fungsi:** Memuat dependensi dan mengecek status login pengguna (apakah pengguna baru, sudah login, atau belum login).
* **Elemen UI:** Animasi logo dan teks "FASHION STORE" dengan latar belakang gradien.
* **Alur:** Otomatis pindah ke *Onboarding* atau *Login* atau *Main Screen* setelah 2.5 detik.

### 2. Onboarding Screen
Panduan awal untuk pengguna baru.
* **Fungsi:** Menjelaskan value proposition aplikasi (Discover Trends, Quality Products, Easy Shopping).
* **Elemen UI:**
     * `PageView`: Untuk menggeser slide informasi.
    * `Indikator Halaman`: Titik-titik di bawah yang menunjukkan posisi slide aktif.
    * Tombol "Skip": Langsung menuju halaman Login.
    * Tombol "Next/Get Started": Pindah ke slide berikutnya atau masuk ke aplikasi.

### 3. Sign In (Halaman Masuk)
Halaman untuk pengguna yang sudah memiliki akun.
* **Elemen UI:**
    * `CustomTextField`: Input Email dan Password dengan ikon.
    * `Toggle Visibility`: Ikon mata untuk melihat/menyembunyikan password.
    * `Forgot Password`: Link untuk reset password.
* **Validasi:** Mengecek format email dan memastikan field tidak kosong sebelum memanggil fungsi `AuthController.login()`.

### 4. Sign Up (Halaman Daftar)
Halaman pendaftaran akun baru.
* **Elemen UI:** Form input Nama Lengkap, Email, Password, dan Konfirmasi Password.
* **Logic:** Memastikan "Password" dan "Confirm Password" cocok sebelum memproses pendaftaran. Jika sukses, data akan dikirim ke Firebase.

### 5. Forgot Password
Fitur pemulihan akun.
* **Fungsi:** Mengirimkan link reset password ke email pengguna.
* **Elemen UI:** Input email tunggal dan tombol "Send Reset Link".
* **Feedback:** Menampilkan dialog sukses ("Check Your Email") setelah tombol ditekan.

### 6. Responsiveness & Theme
Aplikasi menyesuaikan tampilan berdasarkan preferensi sistem atau pengaturan pengguna (Dark Mode / Light Mode). Warna teks dan background akan berubah otomatis untuk kenyamanan mata.

---

## Installation
1.  **Clone Repository:**
    ```bash
    git clone [https://github.com/alykhns/FashionStore_OTIMobApps25.git](https://github.com/alykhns/FashionStore_OTIMobApps25.git)
    ```
2.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Setup Firebase:**
    Pastikan konfigurasi `google-services.json` (Android) sudah terpasang dengan benar di folder `android/app/`.
4.  **Run App:**
    ```bash
    flutter run
    ```

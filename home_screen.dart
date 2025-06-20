import 'package:flutter/material.dart';

/// Kelas [HomeScreen] adalah layar awal aplikasi.
class HomeScreen extends StatelessWidget {
  final Key? key;

  /// Constructor untuk membuat [HomeScreen].
  HomeScreen({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna latar belakang layar adalah putih
      appBar: _buildAppBar(), // Memanggil fungsi untuk membuat AppBar
      body: _buildBody(context), // Memanggil fungsi untuk membuat isi layar
    );
  }

  /// Fungsi untuk membangun AppBar dengan desain khusus.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false, // Menghilangkan tombol kembali default
      flexibleSpace: Container(
        width: double.infinity, // Memastikan lebar kontainer sesuai lebar layar
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Memberikan padding pada kontainer
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)], // Warna gradasi
            begin: Alignment.topRight, // Gradasi dimulai dari pojok kanan atas
            end: Alignment.bottomLeft, // Gradasi berakhir di pojok kiri bawah
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft, // Teks berada di sisi kiri bawah kontainer
          child: Text(
            'Quiz True or False', // Judul pada AppBar
            style: TextStyle(
              fontFamily: 'Poppins', // Menggunakan font Poppins
              fontSize: 20, // Ukuran teks
              color: Colors.white, // Warna teks adalah putih
              fontWeight: FontWeight.bold, // Teks dicetak tebal
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent, // Latar belakang transparan
      elevation: 0, // Menghilangkan bayangan pada AppBar
    );
  }

  /// Fungsi untuk membangun isi layar.
  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0), // Memberikan padding di sekitar isi layar
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Elemen-elemen berada di tengah secara vertikal
        crossAxisAlignment: CrossAxisAlignment.center, // Elemen-elemen berada di tengah secara horizontal
        children: [
          _buildMainContent(), // Memanggil fungsi untuk membuat kontainer utama
          SizedBox(height: 24), // Memberikan jarak antar elemen
          _buildStartButton(context), // Memanggil fungsi untuk membuat tombol "Start Quiz"
        ],
      ),
    );
  }

  /// Fungsi untuk membuat kontainer utama dengan teks utama.
  Widget _buildMainContent() {
    return Container(
      width: double.infinity, // Kontainer memiliki lebar penuh
      height: 220, // Tinggi kontainer adalah 220
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)], // Warna gradasi
          begin: Alignment.topRight, // Gradasi dimulai dari pojok kanan atas
          end: Alignment.bottomLeft, // Gradasi berakhir di pojok kiri bawah
        ),
        borderRadius: BorderRadius.circular(10), // Membuat sudut kontainer melengkung
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Warna bayangan hitam dengan opacity 20%
            blurRadius: 10, // Radius blur pada bayangan
            offset: Offset(0, 4), // Posisi bayangan
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0), // Memberikan padding di dalam kontainer
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Elemen berada di tengah secara vertikal
          crossAxisAlignment: CrossAxisAlignment.center, // Elemen berada di tengah secara horizontal
          children: [
            Text(
              'Ready to Test Your Knowledge?', // Teks utama
              textAlign: TextAlign.center, // Teks di tengah secara horizontal
              style: TextStyle(
                fontFamily: 'Poppins', // Menggunakan font Poppins
                fontSize: 24, // Ukuran teks
                color: Colors.white, // Warna teks putih
                fontWeight: FontWeight.bold, // Teks dicetak tebal
              ),
            ),
            SizedBox(height: 16), // Memberikan jarak antar elemen
            Text(
              'Challenge yourself with our quiz and see how much you know!', // Deskripsi tambahan
              textAlign: TextAlign.center, // Teks di tengah secara horizontal
              style: TextStyle(
                fontFamily: 'Inter', // Menggunakan font Inter
                fontSize: 16, // Ukuran teks
                color: Color(0xFFF1F4F8), // Warna teks abu-abu terang
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Fungsi untuk membuat tombol "Start Quiz".
  Widget _buildStartButton(BuildContext context) {
    return Container(
      width: double.infinity, // Lebar tombol sama dengan lebar kontainer
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/quiz'); // Navigasi ke layar quiz
        },
        icon: Icon(
          Icons.play_arrow_rounded, // Ikon panah untuk mulai quiz
          color: Color(0xFF4B39EF), // Warna ikon
        ),
        label: Text(
          'Start Quiz', // Teks pada tombol
          style: TextStyle(
            fontFamily: 'Inter Tight', // Menggunakan font Inter Tight
            color: Color(0xFF4B39EF), // Warna teks adalah biru
            fontSize: 18, // Ukuran teks
            fontWeight: FontWeight.w600, // Teks dengan ketebalan medium
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Padding pada tombol
          backgroundColor: Colors.white, // Warna latar belakang tombol adalah putih
          elevation: 2, // Memberikan bayangan pada tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Membuat sudut tombol melengkung
          ),
        ),
      ),
    );
  }
}
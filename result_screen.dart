import 'package:flutter/material.dart';

// Class untuk menampilkan layar hasil kuis
class ResultScreen extends StatelessWidget {
  final Key? key;

  // Konstruktor dengan parameter opsional 'key'
  ResultScreen({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil argumen dari route yang dipassing saat navigasi
    final Map<String, dynamic> args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    // Mengambil data hasil kuis dari argumen
    final int correct = args['correct'];   // Jumlah jawaban benar
    final int incorrect = args['incorrect']; // Jumlah jawaban salah
    final int total = args['total'];     // Total pertanyaan kuis

    // Membuat struktur tampilan layar hasil kuis
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Result', // Menampilkan judul layar "Your Result"
          style: TextStyle(
            color: Colors.white, // Warna teks putih
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Tombol kembali dengan ikon panah putih
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)], // Gradien latar belakang AppBar
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // Latar belakang konten berwarna putih
        child: Padding(
          padding: const EdgeInsets.all(24.0), // Padding di seluruh sisi layar
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container untuk menampilkan hasil kuis
                Container(
                  width: double.infinity, // Lebar kontainer penuh
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85), // Warna dengan opasitas
                    borderRadius: BorderRadius.circular(16), // Membuat sudut kontainer melengkung
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Bayangan untuk kontainer
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(24), // Padding dalam kontainer
                  child: Column(
                    children: [
                      // Teks judul "Quiz Results"
                      Text(
                        'Quiz Results',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 16), // Spasi antara judul dan hasil kuis
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Kolom untuk menampilkan jumlah jawaban benar
                          _buildResultColumn(
                            context,
                            icon: Icons.check_circle_rounded,
                            value: correct.toString(), // Menampilkan jumlah jawaban benar
                            label: 'Correct',
                            iconColor: Colors.green,
                            bgColor: Colors.green.withOpacity(0.2),
                          ),
                          // Kolom untuk menampilkan jumlah jawaban salah
                          _buildResultColumn(
                            context,
                            icon: Icons.cancel_rounded,
                            value: incorrect.toString(), // Menampilkan jumlah jawaban salah
                            label: 'Incorrect',
                            iconColor: Colors.red,
                            bgColor: Colors.red.withOpacity(0.2),
                          ),
                        ],
                      ),
                      SizedBox(height: 16), // Spasi antara hasil dan progress bar

                      // Progress bar untuk menampilkan persentase jawaban benar
                      _buildProgressBar(context, correct / total),

                      SizedBox(height: 8), // Spasi antara progress bar dan total pertanyaan
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Questions', // Label "Total Questions"
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          // Menampilkan total pertanyaan
                          Text(
                            total.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24), // Spasi sebelum tombol
                // Tombol untuk kembali ke halaman utama
                Container(
                  width: double.infinity, // Tombol memenuhi lebar kontainer
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16), // Padding di dalam tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Sudut tombol melengkung
                      ),
                      backgroundColor: Color(0xFFE20F00), // Warna latar belakang tombol
                    ),
                    onPressed: () {
                      // Navigasi ke halaman utama
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text(
                      'Back to Home', // Teks di dalam tombol
                      style: TextStyle(fontSize: 18, color: Colors.white), // Warna teks putih
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun kolom hasil benar/salah
  Widget _buildResultColumn(
      BuildContext context, {
        required IconData icon, // Ikon yang ditampilkan
        required String value, // Nilai yang akan ditampilkan (benar/salah)
        required String label, // Label untuk kolom (Correct/Incorrect)
        required Color iconColor, // Warna ikon
        required Color bgColor, // Warna latar belakang ikon
      }) {
    return Column(
      children: [
        // Container untuk ikon bulat
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: bgColor, // Warna latar belakang kontainer ikon
            borderRadius: BorderRadius.circular(30), // Membuat kontainer ikon berbentuk bulat
          ),
          child: Icon(icon, size: 32, color: iconColor), // Ikon di dalam kontainer
        ),
        SizedBox(height: 8), // Spasi antara ikon dan nilai
        // Menampilkan nilai (jumlah benar/salah)
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        // Menampilkan label (Correct/Incorrect)
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // Fungsi untuk membuat progress bar
  Widget _buildProgressBar(BuildContext context, double progress) {
    return Container(
      width: double.infinity, // Lebar progress bar penuh
      height: 8, // Tinggi progress bar
      decoration: BoxDecoration(
        color: Color(0xFFE0E3E7), // Warna latar belakang progress bar
        borderRadius: BorderRadius.circular(4), // Membuat sudut progress bar melengkung
      ),
      // Menampilkan progress berdasarkan persentase
      child: FractionallySizedBox(
        widthFactor: progress, // Panjang progress bar sesuai dengan persentase
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF39D2C0), // Warna progress bar
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

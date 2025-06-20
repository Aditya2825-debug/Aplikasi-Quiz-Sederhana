import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget utama untuk layar Quiz.
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0; // Indeks soal saat ini
  int correctAnswers = 0; // Jumlah jawaban benar
  int incorrectAnswers = 0; // Jumlah jawaban salah

  // Daftar pertanyaan dan jawaban
  final List<Map<String, dynamic>> questions = [
    {'question': 'Algoritma adalah langkah-langkah atau prosedur yang terstruktur untuk menyelesaikan masalah.', 'answer': true},
    {'question': 'HTML adalah bahasa pemrograman.', 'answer': false},
    {'question': 'TCP/IP adalah model referensi utama yang digunakan dalam jaringan komputer.', 'answer': true},
    {'question': 'Python adalah bahasa pemrograman yang dikompilasi (compiled language).', 'answer': false},
    {'question': 'Machine learning adalah bagian dari kecerdasan buatan yang memungkinkan komputer belajar dari data.', 'answer': true},
    {'question': 'HTTP digunakan untuk mentransfer file secara aman melalui internet.', 'answer': false},
    {'question': 'Database relasional menggunakan SQL untuk mengelola data.', 'answer': true},
    {'question': 'RAM digunakan untuk penyimpanan data secara permanen.', 'answer': false},
    {'question': 'Firewall digunakan untuk melindungi jaringan dari akses yang tidak sah.', 'answer': true},
    {'question': 'IP address versi 4 (IPv4) menggunakan alamat 128-bit.', 'answer': false},
    {'question': 'Kompresi data dapat mengurangi ukuran file tanpa mengurangi kualitasnya (lossless compression).', 'answer': true},
    {'question': 'Phishing adalah teknik enkripsi data untuk keamanan komunikasi.', 'answer': false},
    {'question': 'Cloud computing memungkinkan akses ke sumber daya komputasi melalui internet.', 'answer': true},
    {'question': 'Algoritma Bubble Sort adalah metode pencarian data dalam array.', 'answer': false},
    {'question': 'Open-source software memungkinkan pengguna untuk melihat dan memodifikasi kode sumbernya.', 'answer': true},
  ];

  /// Fungsi untuk memproses jawaban pengguna.
  void answerQuestion(bool userAnswer) {
    if (questions[currentQuestionIndex]['answer'] == userAnswer) {
      correctAnswers++; // Menambah jawaban benar
    } else {
      incorrectAnswers++; // Menambah jawaban salah
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++; // Melanjutkan ke pertanyaan berikutnya
      });
    } else {
      _navigateToResult(); // Navigasi ke layar hasil
    }
  }

  /// Navigasi ke layar hasil.
  void _navigateToResult() {
    Navigator.pushReplacementNamed(context, '/result', arguments: {
      'correct': correctAnswers,
      'incorrect': incorrectAnswers,
      'total': questions.length,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Warna latar belakang layar
      appBar: _buildAppBar(), // Membuat AppBar
      body: _buildBody(), // Membuat isi layar
    );
  }

  /// Fungsi untuk membangun AppBar.
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Quiz', // Judul aplikasi
        style: GoogleFonts.inter(
          color: Colors.white, // Warna teks
          fontWeight: FontWeight.bold, // Teks dicetak tebal
          fontSize: 21, // Ukuran teks
        ),
      ),
      backgroundColor: Colors.transparent, // Transparan untuk gradien
      elevation: 0, // Menghilangkan bayangan
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Ikon kembali
        onPressed: () {
          Navigator.pop(context); // Navigasi kembali
        },
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)], // Warna gradasi
            begin: Alignment.topRight, // Gradasi mulai dari kanan atas
            end: Alignment.bottomLeft, // Berakhir di kiri bawah
          ),
        ),
      ),
    );
  }

  /// Fungsi untuk membangun isi layar.
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Memberikan padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Mengisi lebar penuh
        children: [
          _buildProgressBar(), // Menampilkan progress bar
          SizedBox(height: 14), // Spasi antar elemen
          _buildQuestionContainer(), // Menampilkan pertanyaan
          SizedBox(height: 44), // Spasi antar elemen
          _buildAnswerButton(true), // Tombol untuk jawaban True
          SizedBox(height: 16), // Spasi antar tombol
          _buildAnswerButton(false), // Tombol untuk jawaban False
        ],
      ),
    );
  }

  /// Fungsi untuk membangun progress bar.
  Widget _buildProgressBar() {
    return LinearProgressIndicator(
      value: (currentQuestionIndex + 1) / questions.length, // Nilai progress
      backgroundColor: Colors.grey[300], // Warna latar belakang progress bar
      color: Colors.blueAccent, // Warna progress
    );
  }

  /// Fungsi untuk membangun kontainer pertanyaan.
  Widget _buildQuestionContainer() {
    return Container(
      padding: const EdgeInsets.all(56), // Memberikan padding pada kontainer
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)], // Warna gradasi
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(10), // Membuat sudut melengkung
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Bayangan dengan opacity
            spreadRadius: 3, // Radius penyebaran
            blurRadius: 8, // Radius blur
            offset: Offset(0, 3), // Posisi bayangan
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Question ${currentQuestionIndex + 1}/${questions.length}', // Indikator soal
            style: GoogleFonts.inter(
              fontSize: 15, // Ukuran teks
              fontWeight: FontWeight.w500, // Berat font
              color: Colors.white, // Warna teks
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8), // Jarak antar elemen
          Text(
            questions[currentQuestionIndex]['question'], // Pertanyaan
            style: GoogleFonts.inter(
              fontSize: 24, // Ukuran teks
              fontWeight: FontWeight.w600, // Berat font
              color: Colors.white, // Warna teks
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Fungsi untuk membangun tombol jawaban.
  Widget _buildAnswerButton(bool answer) {
    return ElevatedButton(
      onPressed: () => answerQuestion(answer), // Memproses jawaban
      style: ElevatedButton.styleFrom(
        backgroundColor: answer ? Colors.green[500] : Colors.red[600], // Warna tombol
        padding: EdgeInsets.symmetric(vertical: 21), // Padding tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Sudut melengkung
        ),
      ),
      child: Text(
        answer ? 'True' : 'False', // Teks tombol
        style: GoogleFonts.inter(
          fontSize: 18, // Ukuran teks
          fontWeight: FontWeight.w500, // Berat font
          color: Colors.white, // Warna teks
        ),
      ),
    );
  }
}
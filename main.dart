import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';
import 'result_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  final Key? key;

  QuizApp({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz True or False',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/quiz': (context) => QuizScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}

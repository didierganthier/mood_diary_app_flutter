import 'package:flutter/material.dart';
import 'package:mood_diary_app_flutter/screens/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Diary App',
      home: StartPage(),
    );
  }
}

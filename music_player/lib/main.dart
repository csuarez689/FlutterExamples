import 'package:flutter/material.dart';
import 'package:music_player/src/pages/main_page.dart';
import 'package:music_player/src/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: miTema,
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      home: MainPage(),
    );
  }
}

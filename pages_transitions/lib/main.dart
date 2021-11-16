import 'package:flutter/material.dart';
import 'package:pages_transitions/src/pages/page_one.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pages Transitions',
      home: PageOne(),
    );
  }
}

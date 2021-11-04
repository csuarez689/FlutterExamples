import 'package:disenos2/src/challenges/cuadrado_animado_page.dart';
import 'package:disenos2/src/pages/animaciones_page.dart';
import 'package:disenos2/src/pages/circular_graphs_page.dart';
import 'package:disenos2/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HeadersPage(),
      home: CircularGraphPage(),
    );
  }
}

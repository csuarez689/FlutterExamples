import 'package:disenos2/src/challenges/cuadrado_animado_page.dart';
import 'package:disenos2/src/pages/animaciones_page.dart';
import 'package:disenos2/src/pages/circular_graphs_page.dart';
import 'package:disenos2/src/pages/emergency_page.dart';
import 'package:disenos2/src/pages/headers_page.dart';
import 'package:disenos2/src/pages/pinterest_page.dart';
import 'package:disenos2/src/pages/slideshow_page.dart';
import 'package:disenos2/src/pages/slivers_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        disabledColor: Colors.pink.shade100,
      ),
      // home: HeadersPage(),
      // home:CircularGraphPage(),
      // home: SlideshowPage(),
      // home: CuadradoAnimadoPage(),
      // home: AnimacionesPage(),
      // home: PinterestPage(),
      // home: EmergencyPage(),
      home: SliversPage(),
    );
  }
}

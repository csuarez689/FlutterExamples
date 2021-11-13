import 'package:disenos2/src/challenges/cuadrado_animado_page.dart';
import 'package:disenos2/src/pages/animaciones_page.dart';
import 'package:disenos2/src/pages/circular_graphs_page.dart';
import 'package:disenos2/src/pages/emergency_page.dart';
import 'package:disenos2/src/pages/headers_page.dart';
import 'package:disenos2/src/pages/launcher_page.dart';
import 'package:disenos2/src/pages/pinterest_page.dart';
import 'package:disenos2/src/pages/slideshow_page.dart';
import 'package:disenos2/src/pages/slivers_page.dart';
import 'package:disenos2/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger(2),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: Provider.of<ThemeChanger>(context).currentTheme,

      // home: HeadersPage(),
      // home:CircularGraphPage(),
      // home: SlideshowPage(),
      // home: CuadradoAnimadoPage(),
      // home: AnimacionesPage(),
      // home: PinterestPage(),
      // home: EmergencyPage(),
      // home: SliversPage(),
      home: LauncherPage(),
    );
  }
}

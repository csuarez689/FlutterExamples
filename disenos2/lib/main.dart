import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:disenos2/src/theme/theme_changer.dart';
import 'package:disenos2/src/models/layout_model.dart';

import 'package:disenos2/src/pages/launcher_page.dart';
import 'package:disenos2/src/pages/launcher_tablet_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger(2)),
        ChangeNotifierProvider(create: (_) => LayoutModel())
      ],
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
      home: OrientationBuilder(
        builder: (context, Orientation orientation) {
          final size = MediaQuery.of(context).size;
          return size.width > 500 ? LauncherTabletPage() : LauncherPage();
        },
      ),
    );
  }
}

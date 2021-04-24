import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:peliculas/src/pages/error_page.dart';
import 'package:peliculas/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('es', 'ES')],
      title: 'Peliculas',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (BuildContext context) => ErrorPage()),
    );
  }
}

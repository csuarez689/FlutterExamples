import 'package:disenos/src/pages/error_page.dart';
import 'package:disenos/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
      title: 'Diseños',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      initialRoute: 'niceMenu',
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (BuildContext context) => ErrorPage()),
    );
  }
}

import 'package:disenos/src/pages/error_page.dart';
import 'package:disenos/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      initialRoute: 'basicDesign',
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (BuildContext context) => ErrorPage()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrapp/src/pages/error_page.dart';
import 'package:qrapp/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR App',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (BuildContext context) => ErrorPage()),
      theme: ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}

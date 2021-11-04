import 'package:flutter/material.dart';
import 'package:push_otifications/src/pages/home_page.dart';
import 'package:push_otifications/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Notifications',
      routes: getApplicationRoutes(),
      initialRoute: HomePage.routeName,
    );
  }
}

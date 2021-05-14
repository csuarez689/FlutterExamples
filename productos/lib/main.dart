import 'package:bloc_forms_validation/blocs/provider.dart';
import 'package:bloc_forms_validation/pages/home_page.dart';
import 'package:bloc_forms_validation/routes/custom_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.deepPurple, accentColor: Colors.blue[900]),
        debugShowCheckedModeBanner: false,
        title: 'Forms Validations',
        routes: getApplicationRoutes(),
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                )),
        initialRoute: HomePage.routeName,
      ),
    );
  }
}

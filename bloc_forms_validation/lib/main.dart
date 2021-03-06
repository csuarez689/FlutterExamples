import 'package:bloc_forms_validation/blocs/provider.dart';
import 'package:bloc_forms_validation/pages/login_page.dart';
import 'package:bloc_forms_validation/routes/custom_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.deepPurple, accentColor: Colors.blue[800]),
        debugShowCheckedModeBanner: false,
        title: 'Forms Validations',
        onGenerateRoute: CustomRouter.generateRoute,
        initialRoute: LoginPage.routeName,
      ),
    );
  }
}

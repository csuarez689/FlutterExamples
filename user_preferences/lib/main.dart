import 'package:flutter/material.dart';
import 'package:user_preferences/pages/home_page.dart';
import 'package:user_preferences/routes/custom_router.dart';
import 'package:user_preferences/shared_preferences/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPreferences();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.teal, primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      title: 'Preferencias de Usuario',
      initialRoute: prefs.lastPage,
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}

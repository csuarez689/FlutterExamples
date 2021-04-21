import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('es', 'ES')],
      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('Upss ha ocurrido un error!'),
          ),
        ),
      ),
    );
  }
}

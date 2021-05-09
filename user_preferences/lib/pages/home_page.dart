import 'package:flutter/material.dart';
import 'package:user_preferences/shared_preferences/user_preferences.dart';
import 'package:user_preferences/widgets/sidebar_menu.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Preferencias de Usuario'),
        backgroundColor: prefs.secondaryColor
            ? Theme.of(context).accentColor
            : Theme.of(context).primaryColor,
      ),
      drawer: SidebarMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${prefs.secondaryColor}'),
          Divider(),
          Text('Genero:${prefs.genero}'),
          Divider(),
          Text('Nombre:${prefs.nombre}'),
          Divider()
        ],
      ),
    );
  }
}

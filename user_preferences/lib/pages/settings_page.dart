import 'package:flutter/material.dart';
import 'package:user_preferences/shared_preferences/user_preferences.dart';
import 'package:user_preferences/widgets/sidebar_menu.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _genero;
  String _nombre;
  TextEditingController _nameFieldController;
  final UserPreferences prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    prefs.lastPage = SettingsPage.routeName;
    _genero = prefs.genero;
    _nombre = prefs.nombre;
    _secondaryColor = prefs.secondaryColor;
    _nameFieldController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ajustes'),
          backgroundColor: prefs.secondaryColor
              ? Theme.of(context).accentColor
              : Theme.of(context).primaryColor,
        ),
        drawer: SidebarMenu(),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            Container(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              title: Text('Color secundario'),
              onChanged: (value) => setState(() {
                _secondaryColor = value;
                prefs.secondaryColor = value;
              }),
            ),
            RadioListTile(
                value: 1,
                groupValue: _genero,
                title: Text('Masculino'),
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: 2,
                groupValue: _genero,
                title: Text('Femenino'),
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _nameFieldController,
                decoration: InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre del usuario'),
                onChanged: (value) => setState(() => prefs.nombre = value),
              ),
            )
          ],
        ));
  }

  void _setSelectedRadio(int value) {
    prefs.genero = value;
    setState(() => _genero = value);
  }
}

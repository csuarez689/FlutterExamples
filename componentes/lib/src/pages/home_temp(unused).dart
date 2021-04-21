import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final _options = [
    'Uno',
    'Dos',
    'Tres',
    'Cuatro',
    'Cinco',
    'Seis',
    'Siete',
    'Ocho',
    'Nueve',
    'Diez'
  ];

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _shortMakeItems(),
      ),
    );
  }

  // ignore: unused_element
  List<Widget> _makeItems() {
    List<Widget> items = [];

    for (var option in _options) {
      final tempWidget = ListTile(
        title: Text(option),
      );
      items..add(tempWidget)..add(Divider());
    }

    return items;
  }

  List<Widget> _shortMakeItems() => _options
      .map(
        (option) => Column(
          children: [
            ListTile(
              title: Text(option + '!'),
              subtitle: Text('Esta es la opcion ' + option.toLowerCase()),
              leading: Icon(Icons.ac_unit),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            Divider()
          ],
        ),
      )
      .toList();
}

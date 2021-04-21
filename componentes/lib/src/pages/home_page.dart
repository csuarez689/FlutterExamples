import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _makeList(),
    );
  }

  Widget _makeList() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) =>
          ListView(
        children: _makeItemsList(context, snapshot.data),
      ),
    );
  }

  List<Widget> _makeItemsList(BuildContext context, List<dynamic> options) =>
      options
          .map(
            (item) => Column(
              children: [
                ListTile(
                  title: Text(item['texto']),
                  leading: getIcon(iconName: item['icon']),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.blue),
                  onTap: () => Navigator.pushNamed((context), item['ruta']),
                ),
                Divider()
              ],
            ),
          )
          .toList();
}

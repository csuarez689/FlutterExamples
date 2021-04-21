import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider();

  Future<List<dynamic>> loadData() async {
    final data = await rootBundle.loadString('resources/data/menu_opts.json');
    Map dataMap = json.decode(data);
    options = dataMap['rutas'];
    return options;
  }
}

final menuProvider = new _MenuProvider();

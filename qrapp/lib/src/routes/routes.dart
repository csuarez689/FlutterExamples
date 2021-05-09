import 'package:flutter/material.dart';

import 'package:qrapp/src/pages/map_page.dart';
import '../pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      '/': (context) => HomePage(),
      'map': (context) => MapPage(),
    };

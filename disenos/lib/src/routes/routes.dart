import 'package:disenos/src/pages/basic_design_page.dart';
import 'package:disenos/src/pages/scroll_design_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      'basicDesign': (context) => BasicDesignPage(),
      'scrollDesign': (context) => ScrollDesignPage(),
    };

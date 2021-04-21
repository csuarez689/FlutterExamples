import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/inputs_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      '/': (context) => HomePage(),
      'alert': (context) => AlertPage(),
      'avatar': (context) => AvatarPage(),
      'card': (context) => CardPage(),
      'animated': (context) => AnimatedContainerPage(),
      'inputs': (context) => InputsPage(),
      'slider': (context) => SliderPage(),
    };

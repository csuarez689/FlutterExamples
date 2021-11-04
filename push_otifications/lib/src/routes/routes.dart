import 'package:flutter/material.dart';
import 'package:push_otifications/src/pages/home_page.dart';
import 'package:push_otifications/src/pages/message_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      HomePage.routeName: (context) => HomePage(),
      MessagePage.routeName: (context) => MessagePage(),
    };

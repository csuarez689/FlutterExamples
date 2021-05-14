import 'package:bloc_forms_validation/pages/home_page.dart';
import 'package:bloc_forms_validation/pages/login_page.dart';
import 'package:bloc_forms_validation/pages/product_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      HomePage.routeName: (context) => HomePage(),
      ProductPage.routeName: (context) => ProductPage(),
      LoginPage.routeName: (context) => LoginPage(),
    };

import 'package:bloc_forms_validation/blocs/login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();

  Provider({Key key, @required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()?.loginBloc;
  }
}

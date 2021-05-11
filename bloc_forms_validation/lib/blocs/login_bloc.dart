import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:bloc_forms_validation/blocs/validators.dart';

class LoginBloc with LoginValidators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<bool> get validFormStream =>
      CombineLatestStream([emailStream, passwordStream], (e) => true);

  //recuperar los datos del strema

  Stream<String> get emailStream => _emailController.stream.transform(vEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(vPassword);

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

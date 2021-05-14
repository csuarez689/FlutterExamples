import 'dart:async';

class LoginValidators {
  final vPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) => (password.length >= 6)
          ? sink.add(password)
          : sink.addError('Ingrese más de 6 caracteres'));

  final vEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(email)
        ? sink.add(email)
        : sink.addError('Correo electrónico invalido');
  });
}

import 'dart:convert';

import 'package:formvalidation/src/preferences/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  final _prefs = new PreferenciasUsuario();
  final _apiKey = 'AIzaSyDz4-5m4pB46MUpl6HDlKeMFM-BwOqZ1gw';

  Future<Map<String, dynamic>> registrarUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_apiKey',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      final error = _mapError(decodedResp['error']['errors'][0]['message']);
      return {'ok': false, 'mensaje': error};
    }
  }

  Future<Map<String, dynamic>> loginUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apiKey',
        body: json.encode(authData));
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      final error = _mapError(decodedResp['error']['errors'][0]['message']);
      return {'ok': false, 'mensaje': error};
    }
  }

  String _mapError(String error) {
    const tooManyAttemsError =
        'TOO_MANY_ATTEMPTS_TRY_LATER : Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.';
    switch (error) {
      case 'EMAIL_NOT_FOUND':
        return 'El email no se encuentra registrado';
      case 'INVALID_PASSWORD':
        return 'Contraseña incorrecta';
      case 'EMAIL_EXISTS':
        return 'El correo ya se encuentra registrado';
      case tooManyAttemsError:
        return 'Has superado el numero de intentos. Prueba mas tarde';
      default:
        return 'Upss. Ha ocurrido un error!!';
    }
  }
}

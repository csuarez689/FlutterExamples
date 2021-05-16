import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instance =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instance;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //getters y setters

  get token => _prefs.getString('token') ?? '';
  set token(String value) {
    _prefs.setString('token', value);
    print(value);
  }

  get ultimaPagina => _prefs.getString('ultimaPagina') ?? 'login';
  set ultimaPagina(String value) => _prefs.setString('ultimaPagina', value);
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/pages/home_page.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  SharedPreferences _prefs;

  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GENERO
  get genero => _prefs.getInt('genero') ?? 1;
  set genero(int value) => _prefs.setInt('genero', value);

  //NOMBRE
  get nombre => _prefs.getString('nombre') ?? '';
  set nombre(String value) => _prefs.setString('nombre', value);

  //COLOR SECUNDARIO
  get secondaryColor => _prefs.getBool('secondaryColor') ?? false;
  set secondaryColor(bool value) => _prefs.setBool('secondaryColor', value);

  //ULTIMA PAGINA
  get lastPage => _prefs.getString('lastPage') ?? HomePage.routeName;
  set lastPage(String value) => _prefs.setString('lastPage', value);
}

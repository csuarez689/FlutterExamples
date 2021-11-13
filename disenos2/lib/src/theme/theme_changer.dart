import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // dark theme
        _currentTheme = _dTheme;
        _darkTheme = true;
        _customTheme = false;
        break;
      case 2: //custom theme
        _currentTheme = _cTheme;
        _customTheme = true;
        _darkTheme = false;
        break;
      default: //ligth theme
        _currentTheme = _lTheme;
        _darkTheme = false;
        _customTheme = false;
    }
  }

  bool _darkTheme = false;
  bool _customTheme = false;
  late ThemeData _currentTheme;

  //Themes /////////////////////////////////////////////////////////////////////////
  final ThemeData _cTheme = ThemeData.dark().copyWith(
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Color(0xff16202B),
    disabledColor: Colors.white30.withOpacity(0.4),
    colorScheme: ColorScheme.dark(
      secondary: Color(0xff48A0EB),
    ),
  );
  final ThemeData _lTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(secondary: Colors.pink),
  );
  final ThemeData _dTheme = ThemeData.dark();
/////////////////////////////////////////////////////////////////////////////////////////

  bool get darkTheme => _darkTheme;

  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    _currentTheme = _darkTheme ? _dTheme : _lTheme;
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;
    _currentTheme = _customTheme ? _cTheme : _lTheme;
    notifyListeners();
  }
}

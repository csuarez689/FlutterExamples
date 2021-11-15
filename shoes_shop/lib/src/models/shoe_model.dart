import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImg = "negro";
  double _size = 9.0;

  String get assetImg => _assetImg;

  double get size => _size;

  set size(double value) {
    _size = value;
    notifyListeners();
  }

  set assetImg(String value) {
    _assetImg = value;
    notifyListeners();
  }
}

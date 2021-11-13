import 'package:disenos2/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}

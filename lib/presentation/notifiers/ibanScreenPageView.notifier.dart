import 'package:flutter/material.dart';

class IBANPageViewProvider with ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  PageController get pageController => _pageController;

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ConceptHomeScreenNotifier with ChangeNotifier {

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  bool _isRequestAccepted = false;

  bool _isRequestDenied = false;

  bool get isRequestAccepted => _isRequestAccepted;

  bool get isRequestDenied => _isRequestDenied;

  int get currentPageIndex => _currentPageIndex;

  PageController get pageController => _pageController;

  void setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  void setRequestAccepted(bool status) {
    _isRequestAccepted = status;
    notifyListeners();
  }

  void setRequestDenied(bool status) {
    _isRequestDenied = status;
    notifyListeners();
  }

}

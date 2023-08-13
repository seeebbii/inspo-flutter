import 'package:flutter/material.dart';

import '../../domain/models/concept/concept_request_checkbox.dart';

class ConceptHomeScreenNotifier with ChangeNotifier {
  List<ConceptRequestCheckbox> checkboxes = List.generate(8,
        (index) => ConceptRequestCheckbox(isChecked: false, label: 'Checkbox $index'),
  );

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  bool _isRequestAccepted = false;

  bool _isRequestDenied = false;

  bool _isDelivery = false;

  bool _isInStore = false;

  DateTime? _date;

  DateTime? _time;

  bool get isRequestAccepted => _isRequestAccepted;

  bool get isRequestDenied => _isRequestDenied;

  int get currentPageIndex => _currentPageIndex;

  bool get isDelivery => _isDelivery;

  bool get isInStore => _isInStore;

  DateTime? get date => _date;

  DateTime? get time => _time;


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

  void toggleCheckbox(int index) {
    checkboxes[index].isChecked = !checkboxes[index].isChecked;
    notifyListeners();
  }

  void setDelivery(bool state) {
    _isDelivery = state;
    notifyListeners();
  }

  void setInStore(bool state) {
    _isInStore = state;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  void setTime(DateTime time) {
    _time = time;
    notifyListeners();
  }

}

import 'package:flutter/material.dart';

class ConceptHomeMainScreenProvider with ChangeNotifier {
  bool _isPaymentDialogVisible = false;

  int _creditCardSelected = 0;

  bool get isPaymentDialogVisible => _isPaymentDialogVisible;

  int get creditCardSelected => _creditCardSelected;

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;


  void setDialogVisible(bool visibility) {
    _isPaymentDialogVisible = visibility;
    notifyListeners();
  }

  void setCreditCardSelected(int creditCardSelected) {
    _creditCardSelected = creditCardSelected;
    notifyListeners();
  }
}

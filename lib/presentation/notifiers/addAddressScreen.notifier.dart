import 'package:flutter/material.dart';

class AddAddressScreenNotifier with ChangeNotifier {

  int _addressType = 0;

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _nameOfAddressController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();


  TextEditingController get areaController => _areaController;
  TextEditingController get blockController => _blockController;
  TextEditingController get streetController => _streetController;
  TextEditingController get houseNumberController => _houseNumberController;
  TextEditingController get nameOfAddressController => _nameOfAddressController;
  TextEditingController get contactNumberController => _contactNumberController;
  int get addressType => _addressType;



  void setAddressType(int type) {
    _addressType = type;
    notifyListeners();
  }
}

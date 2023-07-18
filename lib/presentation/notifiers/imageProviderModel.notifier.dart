import 'dart:html';

import 'package:flutter/cupertino.dart';

class ImageProviderModel extends ChangeNotifier {
  File? _imageFile;

  File? get imageFile => _imageFile;

  void setImageFile(File? file) {
    _imageFile = file;
    notifyListeners();
  }
}
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileHandler {
  // open camera and return image file
  static Future<File?> pickImageFromCamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    return image?.path != null ? File(image!.path) : null;
  }

  // open gallery and return image file
  static Future<File?> pickImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return image?.path != null ? File(image!.path) : null;
  }

  // open gallery and return video file
  static Future<File?> pickVideoFromGallery() async {
    XFile? video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    return video?.path != null ? File(video!.path) : null;
  }
}

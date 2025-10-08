import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static Future<File?> pickFromGallery() async {
    final x = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (x == null) return null;
    return File(x.path);
  }

  static Future<File?> pickFromCamera() async {
    final x = await ImagePicker().pickImage(source: ImageSource.camera);
    if (x == null) return null;
    return File(x.path);
  }
}

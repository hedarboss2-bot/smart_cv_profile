import 'package:image_picker/image_picker.dart';

class ImageService {
  static final ImagePicker _picker = ImagePicker();

  static Future<String?> pickFromGallery() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    return image?.path;
  }

  static Future<String?> pickFromCamera() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    return image?.path;
  }
}
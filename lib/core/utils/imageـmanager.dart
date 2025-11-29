import 'dart:io';
import 'package:dio/dio.dart';

class ImageManager {
  static const String cloudName = "dis16571k"; // ضع Cloud Name الخاص بك
  static const String uploadPreset = "my_unsigned_preset"; // Preset غير موقّع (Unsigned)

  /// رفع صورة إلى Cloudinary
  static Future<String?> uploadImage(File file) async {
    final url = "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
      "upload_preset": uploadPreset,
    });

    try {
      final response = await Dio().post(url, data: formData);

      if (response.statusCode == 200) {
        // Cloudinary ترجع الرابط النهائي للصورة
        return response.data["secure_url"];
      } else {
        print("Upload failed: ${response.statusCode} - ${response.data}");
      }
    } catch (e) {
      print("Upload error: $e");
    }

    return null;
  }
}

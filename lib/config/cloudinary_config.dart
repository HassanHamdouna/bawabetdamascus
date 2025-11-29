import 'package:cloudinary_url_gen/cloudinary.dart';

class CloudinaryConfig {
  static late Cloudinary cloudinary;

  static void initialize() {
    cloudinary = Cloudinary.fromStringUrl(
        'cloudinary://969145546431855:YOUR_API_SECRET@dis16571k',
    );

    cloudinary.config.urlConfig.secure = true;
  }
}

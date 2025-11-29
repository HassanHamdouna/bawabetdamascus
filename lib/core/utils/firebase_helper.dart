import 'package:bawabetdamascus/data/models/fb_response.dart';

mixin FirebaseHelper {
  FbResponse get successfullyResponse =>
      FbResponse(message: 'Operation completed successfully',status: true);

  FbResponse get errorResponse =>
      FbResponse(message: 'Operation failed', status: false);
}

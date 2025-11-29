import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/menu_item.dart';
import '../models/fb_response.dart';
import '../../core/utils/firebase_helper.dart';

class MyMenuController with FirebaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = "MenuItems";

  Future<FbResponse> create(MenuItem item) async {
    try {
      await _firestore.collection(collectionName).add(item.toMap());
      return successfullyResponse;
    } catch (e) {
      return errorResponse;
    }
  }

  Future<FbResponse> update(MenuItem item) async {
    if (item.id == null) return errorResponse;
    try {
      await _firestore.collection(collectionName).doc(item.id).update(item.toMap());
      return successfullyResponse;
    } catch (e) {
      return errorResponse;
    }
  }

  Future<FbResponse> delete(String id) async {
    try {
      await _firestore.collection(collectionName).doc(id).delete();
      return successfullyResponse;
    } catch (e) {
      return errorResponse;
    }
  }

  Stream<List<MenuItem>> read() {
    return _firestore.collection(collectionName)
        .orderBy("name")
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => MenuItem.fromMap(doc.data(), doc.id))
        .toList());
  }

  Stream<List<MenuItem>> searchByCategory(String categoryName) {
    return _firestore.collection(collectionName)
        .where("category", isEqualTo: categoryName)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => MenuItem.fromMap(doc.data(), doc.id))
        .toList());
  }
}

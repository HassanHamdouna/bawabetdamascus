import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/fb_response.dart';
import '../../core/utils/firebase_helper.dart';

class UserController with FirebaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = "Users";

  // إنشاء مستخدم جديد
  Future<FbResponse> create(UserModel user) async {
    try {
      await _firestore.collection(collectionName).add(user.toMap());
      return successfullyResponse;
    } catch (e) {
      return errorResponse;
    }
  }

  // تعديل مستخدم موجود
  Future<FbResponse> update(UserModel user) async {
    if (user.id == null) return errorResponse;
    try {
      await _firestore.collection(collectionName).doc(user.id).update(user.toMap());
      return successfullyResponse;
    } catch (e) {
      return errorResponse;
    }
  }

  // حذف مستخدم
  Future<FbResponse> delete(String id) async {
    try {
      await _firestore.collection(collectionName).doc(id).delete();
      return successfullyResponse;
    } catch (e) {
      return errorResponse;
    }
  }

  // قراءة جميع المستخدمين
  Stream<List<UserModel>> read() {
    return _firestore.collection(collectionName)
        .orderBy("name")
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => UserModel.fromMap(doc.data(), doc.id))
        .toList());
  }

  // قراءة المستخدمين حسب الدور (array-contains للـ roles)
  Stream<List<UserModel>> readByRole(String role) {
    return _firestore.collection(collectionName)
        .where("roles", arrayContains: role)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => UserModel.fromMap(doc.data(), doc.id))
        .toList());
  }
}

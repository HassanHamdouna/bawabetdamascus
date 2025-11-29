import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = "Categories";

  Stream<List<Category>> readCategories() {
    return _firestore.collection(collectionName).snapshots().map(
            (snapshot) => snapshot.docs
            .map((doc) => Category.fromMap(doc.data(), docId: doc.id))
            .toList());
  }

  Future<void> addCategory(Category category) async {
    await _firestore.collection(collectionName).add(category.toMap());
  }

  Future<void> updateCategory(String docId, Category category) async {
    final docRef = _firestore.collection(collectionName).doc(docId);
    final oldData = await docRef.get();
    final oldName = oldData['name'];

    await docRef.update(category.toMap());

    // تحديث كل MenuItems المرتبطة بالفئة القديمة
    await _updateMenuItemsCategory(oldName, category.name);
  }

  Future<void> _updateMenuItemsCategory(String oldName, String newName) async {
    final menuItemsSnapshot = await _firestore
        .collection('MenuItems')
        .where('category', isEqualTo: oldName)
        .get();

    for (var doc in menuItemsSnapshot.docs) {
      await doc.reference.update({'category': newName});
    }
  }
}

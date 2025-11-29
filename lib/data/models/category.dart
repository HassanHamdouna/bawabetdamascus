class Category {
  int? id;
  String? docId;
  String name;
  String? imageUrl;

  Category({
    this.id,
    this.docId,
    required this.name,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map, {String? docId}) {
    return Category(
      id: map['id'],
      docId: docId,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'],
    );
  }
}

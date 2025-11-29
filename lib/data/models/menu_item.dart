class MenuItem {
  String? id;
  String name;
  String description;
  String category;
  double price;
  String? itemNumber;
  String? expireDate;
  String? prepTime;
  String? notes;
  bool available;
  String? imageUrl; // هذا هو الرابط على الإنترنت

  MenuItem({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    this.itemNumber,
    this.expireDate,
    this.prepTime,
    this.notes,
    this.available = true,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'number': itemNumber,
      'expireDate': expireDate,
      'prepTime': prepTime,
      'notes': notes,
      'available': available,
      'imageUrl': imageUrl,
    };
  }

  factory MenuItem.fromMap(Map<String, dynamic> map, [String? id]) {
    return MenuItem(
      id: id,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      itemNumber: map['number'],
      expireDate: map['expireDate'],
      prepTime: map['prepTime'],
      notes: map['notes'],
      available: map['available'] ?? true,
      imageUrl: map['imageUrl'],
    );
  }
}

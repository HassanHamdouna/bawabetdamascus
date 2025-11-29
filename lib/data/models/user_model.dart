class UserModel {
  String? id;  // docId من Firestore
  String name;
  String phone;
  String nationality;
  String birthdate;

  String salary;
  String contractType;
  String startDate;
  String endDate;
  String hours;

  String deductions;
  String lastDeduction;
  String deductionReason;

  String suppliesReceived;
  String suppliesDelivered;
  String suppliesDate;

  String notes;
  String password;
  String? image;

  List<String> roles;   // يمكن أن يحتوي على عدة أدوار: admin, waiter, accountant, owner, stock, kitchen
  String place;         // restaurant / kitchen / storage / management
  bool usesApp;

  UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.nationality,
    required this.birthdate,
    required this.salary,
    required this.contractType,
    required this.startDate,
    required this.endDate,
    required this.hours,
    required this.deductions,
    required this.lastDeduction,
    required this.deductionReason,
    required this.suppliesReceived,
    required this.suppliesDelivered,
    required this.suppliesDate,
    required this.notes,
    required this.password,
    required this.roles,
    required this.place,
    required this.usesApp,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phone": phone,
      "nationality": nationality,
      "birthdate": birthdate,

      "salary": salary,
      "contractType": contractType,
      "startDate": startDate,
      "endDate": endDate,
      "hours": hours,

      "deductions": deductions,
      "lastDeduction": lastDeduction,
      "deductionReason": deductionReason,

      "suppliesReceived": suppliesReceived,
      "suppliesDelivered": suppliesDelivered,
      "suppliesDate": suppliesDate,

      "notes": notes,
      "password": password,

      "roles": roles,
      "place": place,
      "usesApp": usesApp,

      "image": image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String docId) {
    return UserModel(
      id: docId,  // docId من Firestore
      name: map["name"] ?? "",
      phone: map["phone"] ?? "",
      nationality: map["nationality"] ?? "",
      birthdate: map["birthdate"] ?? "",

      salary: map["salary"] ?? "",
      contractType: map["contractType"] ?? "",
      startDate: map["startDate"] ?? "",
      endDate: map["endDate"] ?? "",
      hours: map["hours"] ?? "",

      deductions: map["deductions"] ?? "",
      lastDeduction: map["lastDeduction"] ?? "",
      deductionReason: map["deductionReason"] ?? "",

      suppliesReceived: map["suppliesReceived"] ?? "",
      suppliesDelivered: map["suppliesDelivered"] ?? "",
      suppliesDate: map["suppliesDate"] ?? "",

      notes: map["notes"] ?? "",
      password: map["password"] ?? "",

      roles: List<String>.from(map["roles"] ?? []),
      place: map["place"] ?? "",
      usesApp: map["usesApp"] ?? false,

      image: map["image"],
    );
  }
}

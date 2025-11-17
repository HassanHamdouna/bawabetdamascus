import 'dart:io';
import 'package:flutter/material.dart';

enum UserRole { admin, waiter, accountant, owner, stock, kitchen }
enum WorkPlace { restaurant, kitchen, storage, management }

class AddEditUserScreen extends StatefulWidget {
  final Map<String, dynamic>? user; // موجود إذا تعديل

  const AddEditUserScreen({super.key, this.user});

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  // ---------- Controllers ----------
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController contractTypeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController deductionsController = TextEditingController();
  final TextEditingController lastDeductionController = TextEditingController();
  final TextEditingController deductionReasonController = TextEditingController();
  final TextEditingController suppliesReceivedController = TextEditingController();
  final TextEditingController suppliesDeliveredController = TextEditingController();
  final TextEditingController suppliesDateController = TextEditingController();

  // ---------- Dropdowns ----------
  UserRole? selectedRole;
  WorkPlace? selectedPlace;
  bool usesApp = false;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      final u = widget.user!;
      nameController.text = u['name'] ?? '';
      phoneController.text = u['phone'] ?? '';
      nationalityController.text = u['nationality'] ?? '';
      birthDateController.text = u['birthdate'] ?? '';
      salaryController.text = u['salary'] ?? '';
      notesController.text = u['notes'] ?? '';
      passwordController.text = u['password'] ?? '';
      contractTypeController.text = u['contractType'] ?? '';
      startDateController.text = u['startDate'] ?? '';
      endDateController.text = u['endDate'] ?? '';
      hoursController.text = u['hours'] ?? '';
      deductionsController.text = u['deductions'] ?? '';
      lastDeductionController.text = u['lastDeduction'] ?? '';
      deductionReasonController.text = u['deductionReason'] ?? '';
      suppliesReceivedController.text = u['suppliesReceived'] ?? '';
      suppliesDeliveredController.text = u['suppliesDelivered'] ?? '';
      suppliesDateController.text = u['suppliesDate'] ?? '';
      selectedRole = u['role'];
      selectedPlace = u['place'];
      usesApp = u['usesApp'] ?? false;
      imagePath = u['image'];
    }
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget buildTextField(TextEditingController controller, String label,
      {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    // final picker = ImagePicker();
    // final picked = await picker.pickImage(source: ImageSource.gallery);
    // if (picked != null) {
    //   setState(() => imagePath = picked.path);
    // }
  }

  void saveUser() {
    final data = {
      "name": nameController.text,
      "phone": phoneController.text,
      "nationality": nationalityController.text,
      "birthdate": birthDateController.text,
      "salary": salaryController.text,
      "notes": notesController.text,
      "password": passwordController.text,
      "contractType": contractTypeController.text,
      "startDate": startDateController.text,
      "endDate": endDateController.text,
      "hours": hoursController.text,
      "deductions": deductionsController.text,
      "lastDeduction": lastDeductionController.text,
      "deductionReason": deductionReasonController.text,
      "suppliesReceived": suppliesReceivedController.text,
      "suppliesDelivered": suppliesDeliveredController.text,
      "suppliesDate": suppliesDateController.text,
      "role": selectedRole,
      "place": selectedPlace,
      "usesApp": usesApp,
      "image": imagePath,
    };

    // هنا تضيف كود حفظ البيانات في Firestore
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user != null ? "تعديل مستخدم" : "إضافة مستخدم"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle("البيانات الأساسية"),
            GestureDetector(
              onTap: pickImage,
              child: Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: imagePath != null ? FileImage(File(imagePath!)) : null,
                  child: imagePath == null ? const Icon(Icons.camera_alt, size: 40) : null,
                ),
              ),
            ),
            const SizedBox(height: 12),
            buildTextField(nameController, "الاسم الكامل"),
            buildTextField(phoneController, "رقم الهاتف"),
            buildTextField(nationalityController, "الجنسية"),
            buildTextField(birthDateController, "تاريخ الميلاد"),

            buildSectionTitle("بيانات العمل"),
            buildTextField(salaryController, "الراتب", inputType: TextInputType.number),
            buildTextField(contractTypeController, "نوع العقد"),
            buildTextField(startDateController, "بداية الخدمة"),
            buildTextField(endDateController, "نهاية الخدمة"),
            buildTextField(hoursController, "الساعات"),
            DropdownButtonFormField<UserRole>(
              value: selectedRole,
              decoration: const InputDecoration(labelText: "الدور في النظام", border: OutlineInputBorder()),
              items: UserRole.values.map((r) => DropdownMenuItem(value: r, child: Text(r.name))).toList(),
              onChanged: (v) => setState(() => selectedRole = v),
            ),
            DropdownButtonFormField<WorkPlace>(
              value: selectedPlace,
              decoration: const InputDecoration(labelText: "مكان العمل", border: OutlineInputBorder()),
              items: WorkPlace.values.map((p) => DropdownMenuItem(value: p, child: Text(p.name))).toList(),
              onChanged: (v) => setState(() => selectedPlace = v),
            ),

            buildSectionTitle("الخصومات والسحوبات"),
            buildTextField(deductionsController, "مجموع السحوبات"),
            buildTextField(lastDeductionController, "آخر خصم"),
            buildTextField(deductionReasonController, "سبب الخصم"),

            buildSectionTitle("المستلزمات"),
            buildTextField(suppliesReceivedController, "استلم"),
            buildTextField(suppliesDeliveredController, "تسليم"),
            buildTextField(suppliesDateController, "تاريخ"),

            buildSectionTitle("إعدادات النظام"),
            buildTextField(passwordController, "كلمة المرور"),
            SwitchListTile(
              title: const Text("هل يستخدم التطبيق؟"),
              value: usesApp,
              onChanged: (v) => setState(() => usesApp = v),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveUser,
                child: Text(widget.user != null ? "حفظ التعديلات" : "إضافة مستخدم"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

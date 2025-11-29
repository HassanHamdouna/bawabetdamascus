import 'dart:io';
import 'package:bawabetdamascus/core/utils/image%D9%80manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bawabetdamascus/data/controllers/user_controller.dart';
import 'package:bawabetdamascus/data/models/user_model.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';

class AddEditUserScreen extends StatefulWidget {
  final UserModel? user;

  const AddEditUserScreen({super.key, this.user});

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  final picker = ImagePicker();
  final userController = UserController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
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
  final TextEditingController notesController = TextEditingController();

  bool usesApp = false;
  String? imagePath;

  // Roles
  final List<String> allRoles = [
    'admin', 'owner', 'manager','systemManagers', 'waiter', 'accountant', 'kitchen', 'stock', 'delivery', 'employee'
  ];
  final Set<String> selectedRoles = {};

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      final u = widget.user!;
      nameController.text = u.name;
      phoneController.text = u.phone;
      passwordController.text = u.password;
      placeController.text = u.place;
      nationalityController.text = u.nationality;
      birthdateController.text = u.birthdate;
      salaryController.text = u.salary;
      contractTypeController.text = u.contractType;
      startDateController.text = u.startDate;
      endDateController.text = u.endDate;
      hoursController.text = u.hours;
      deductionsController.text = u.deductions;
      lastDeductionController.text = u.lastDeduction;
      deductionReasonController.text = u.deductionReason;
      suppliesReceivedController.text = u.suppliesReceived;
      suppliesDeliveredController.text = u.suppliesDelivered;
      suppliesDateController.text = u.suppliesDate;
      notesController.text = u.notes;
      usesApp = u.usesApp;
      imagePath = u.image;
      selectedRoles.addAll(u.roles ?? []);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final isEdit = widget.user != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? lang.edit_user : lang.add_user)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey.shade300,
                child: imagePath != null
                    ? (imagePath!.startsWith("http")
                    ? Image.network(imagePath!, fit: BoxFit.cover)
                    : Image.file(File(imagePath!), fit: BoxFit.cover))
                    : const Icon(Icons.person, size: 100),
              ),
            ),
            const SizedBox(height: 20),
            buildTextField(lang.name, nameController),
            buildTextField(lang.phone, phoneController),
            buildTextField(lang.password, passwordController),
            buildTextField(lang.place, placeController),
            buildTextField("Nationality", nationalityController),
            buildTextField("Birthdate", birthdateController),
            buildTextField("Salary", salaryController),
            buildTextField("Contract Type", contractTypeController),
            buildTextField("Start Date", startDateController),
            buildTextField("End Date", endDateController),
            buildTextField("Hours", hoursController),
            buildTextField("Deductions", deductionsController),
            buildTextField("Last Deduction", lastDeductionController),
            buildTextField("Deduction Reason", deductionReasonController),
            buildTextField("Supplies Received", suppliesReceivedController),
            buildTextField("Supplies Delivered", suppliesDeliveredController),
            buildTextField("Supplies Date", suppliesDateController),
            buildTextField("Notes", notesController),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(lang.role, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: allRoles.map((role) {
                final isSelected = selectedRoles.contains(role);
                return FilterChip(
                  label: Text(role),
                  selected: isSelected,
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        selectedRoles.add(role);
                      } else {
                        selectedRoles.remove(role);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 20),
            SwitchListTile(
              title: Text(lang.uses_app),
              value: usesApp,
              onChanged: (val) => setState(() => usesApp = val),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveUser,
                child: Text(isEdit ? lang.save_changes : lang.add_user),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }

  Future<void> pickImage() async {
    final XFile? picked =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picked != null) setState(() => imagePath = picked.path);
  }

  Future<void> saveUser() async {
    String? uploadedUrl = imagePath;
    if (uploadedUrl != null && !uploadedUrl.startsWith("http")) {
      uploadedUrl = await ImageManager.uploadImage(File(uploadedUrl));
    }

    final user = UserModel(
      id: widget.user?.id,
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      place: placeController.text.trim(),
      usesApp: usesApp,
      image: uploadedUrl,
      roles: selectedRoles.toList(),

      // جميع الحقول المطلوبة تم تعبئتها هنا
      nationality: nationalityController.text.trim(),
      birthdate: birthdateController.text.trim(),
      salary: salaryController.text.trim(),
      contractType: contractTypeController.text.trim(),
      startDate: startDateController.text.trim(),
      endDate: endDateController.text.trim(),
      hours: hoursController.text.trim(),
      deductions: deductionsController.text.trim(),
      lastDeduction: lastDeductionController.text.trim(),
      deductionReason: deductionReasonController.text.trim(),
      suppliesReceived: suppliesReceivedController.text.trim(),
      suppliesDelivered: suppliesDeliveredController.text.trim(),
      suppliesDate: suppliesDateController.text.trim(),
      notes: notesController.text.trim(),
    );

    if (widget.user == null) {
      await userController.create(user);
    } else {
      await userController.update(user);
    }

    Navigator.pop(context);
  }
}

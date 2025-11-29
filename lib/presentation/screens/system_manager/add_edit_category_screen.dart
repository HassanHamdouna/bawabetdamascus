import 'dart:io';
import 'package:bawabetdamascus/core/utils/image%D9%80manager.dart';
import 'package:bawabetdamascus/data/controllers/category_controller.dart';
import 'package:bawabetdamascus/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';

class AddEditCategoryScreen extends StatefulWidget {
  final Category? category;
  const AddEditCategoryScreen({super.key, this.category});

  @override
  State<AddEditCategoryScreen> createState() => _AddEditCategoryScreenState();
}

class _AddEditCategoryScreenState extends State<AddEditCategoryScreen> {
  final TextEditingController nameController = TextEditingController();
  String? imagePath;
  final ImagePicker picker = ImagePicker();
  final CategoryController categoryController = CategoryController();

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      nameController.text = widget.category!.name;
      imagePath = widget.category!.imageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final isEdit = widget.category != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? lang.edit_category : lang.add_category,
        ),
      ),
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
                    ? (imagePath!.startsWith('http')
                    ? Image.network(imagePath!, fit: BoxFit.cover)
                    : Image.file(File(imagePath!), fit: BoxFit.cover))
                    : const Icon(Icons.image, size: 100),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: lang.category_name,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveCategory,
                child: Text(
                  isEdit ? lang.save_category_changes : lang.add_category,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() => imagePath = pickedFile.path);
    }
  }

  Future<void> saveCategory() async {
    String? uploadedUrl = imagePath;

    // إذا الصورة جديدة → ارفعها
    if (imagePath != null && !imagePath!.startsWith('http')) {
      uploadedUrl = await ImageManager.uploadImage(File(imagePath!));
    }

    final category = Category(
      id: widget.category?.id,
      docId: widget.category?.docId,
      name: nameController.text.trim(),
      imageUrl: uploadedUrl,
    );

    if (widget.category == null) {
      await categoryController.addCategory(category);
    } else {
      await categoryController.updateCategory(
        widget.category!.docId!,
        category,
      );
    }

    Navigator.pop(context);
  }
}

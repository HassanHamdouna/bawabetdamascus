import 'dart:io';
import 'package:bawabetdamascus/core/utils/image%D9%80manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bawabetdamascus/data/controllers/my_menu_controller.dart';
import 'package:bawabetdamascus/data/controllers/category_controller.dart';
import 'package:bawabetdamascus/data/models/menu_item.dart';
import 'package:bawabetdamascus/data/models/category.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';

class AddEditMenuItemScreen extends StatefulWidget {
  final MenuItem? item;

  const AddEditMenuItemScreen({super.key, this.item});

  @override
  State<AddEditMenuItemScreen> createState() => _AddEditMenuItemScreenState();
}

class _AddEditMenuItemScreenState extends State<AddEditMenuItemScreen> {
  final TextEditingController itemNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController prepTimeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  bool isAvailable = true;
  String? imagePath;
  String? selectedCategory;

  final MyMenuController menuController = MyMenuController();
  final CategoryController categoryController = CategoryController();
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    if (widget.item != null) {
      final i = widget.item!;
      nameController.text = i.name;
      descriptionController.text = i.description;
      itemNumberController.text = i.itemNumber ?? '';
      priceController.text = i.price.toString();
      prepTimeController.text = i.prepTime ?? '';
      notesController.text = i.notes ?? '';
      isAvailable = i.available;
      imagePath = i.imageUrl;
      selectedCategory = i.category;
    }
  }

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (picked != null) {
      setState(() => imagePath = picked.path);
    }
  }

  Future<void> saveItem() async {
    final lang = AppLocalizations.of(context)!;

    String? uploadedUrl = imagePath;

    if (imagePath != null && !imagePath!.startsWith('http')) {
      uploadedUrl = await ImageManager.uploadImage(File(imagePath!));
    }

    if (selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(lang.select_category_warning)),
      );
      return;
    }

    final newItem = MenuItem(
      id: widget.item?.id,
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      category: selectedCategory!,
      price: double.tryParse(priceController.text) ?? 0,
      itemNumber: itemNumberController.text.trim(),
      prepTime: prepTimeController.text.trim(),
      notes: notesController.text.trim(),
      available: isAvailable,
      imageUrl: uploadedUrl,
    );

    try {
      if (widget.item == null) {
        await menuController.create(newItem);
      } else {
        await menuController.update(newItem);
      }

      Navigator.pop(context);

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${lang.error_saving_item}: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final isEdit = widget.item != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? lang.edit_item : lang.add_item),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ----------------- صورة الصنف -----------------
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

            // ----------------- اسم الصنف -----------------
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: lang.item_name,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // ----------------- وصف الصنف -----------------
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: lang.item_description,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // ----------------- رقم الصنف -----------------
            TextField(
              controller: itemNumberController,
              decoration: InputDecoration(
                labelText: lang.item_number,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // ----------------- السعر -----------------
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: lang.item_price,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // ----------------- وقت التجهيز -----------------
            TextField(
              controller: prepTimeController,
              decoration: InputDecoration(
                labelText: lang.prep_time,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // ----------------- اختيار الفئة -----------------
            StreamBuilder<List<Category>>(
              stream: categoryController.readCategories(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();

                final categories = snapshot.data!;

                return DropdownButtonFormField<String>(
                  value: selectedCategory,
                  decoration: InputDecoration(
                    labelText: lang.choose_category,
                    border: const OutlineInputBorder(),
                  ),
                  items: categories
                      .map((c) => DropdownMenuItem(
                    value: c.name,
                    child: Text(c.name),
                  ))
                      .toList(),
                  onChanged: (v) => setState(() => selectedCategory = v),
                );
              },
            ),

            const SizedBox(height: 20),

            // ----------------- حالة التوفر -----------------
            SwitchListTile(
              title: Text(lang.available),
              value: isAvailable,
              onChanged: (v) => setState(() => isAvailable = v),
            ),

            const SizedBox(height: 20),

            // ----------------- ملاحظات -----------------
            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: lang.item_notes,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // ----------------- زر الحفظ -----------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveItem,
                child: Text(
                  isEdit ? lang.save_item_changes : lang.add_item,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

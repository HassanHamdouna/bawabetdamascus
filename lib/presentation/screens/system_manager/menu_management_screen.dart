import 'dart:io';

import 'package:bawabetdamascus/data/controllers/category_controller.dart';
import 'package:bawabetdamascus/data/controllers/my_menu_controller.dart';
import 'package:bawabetdamascus/data/models/menu_item.dart';
import 'package:bawabetdamascus/data/models/category.dart';
import 'package:bawabetdamascus/presentation/screens/system_manager/add_edit_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';

class MenuManagementScreen extends StatefulWidget {
  const MenuManagementScreen({super.key});

  @override
  State<MenuManagementScreen> createState() => _MenuManagementScreenState();
}

class _MenuManagementScreenState extends State<MenuManagementScreen> {
  final MyMenuController menuController = MyMenuController();
  final CategoryController categoryController = CategoryController();

  String selectedCategory = "All";
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.menu_management),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'add_item') {
                Navigator.pushNamed(
                  context,
                  "/add_edit_menu_item_screen",
                  arguments: null,
                ).then((_) => setState(() {}));
              } else if (value == 'add_category') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddEditCategoryScreen(),
                  ),
                ).then((_) => setState(() {}));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'add_item',
                child: Text(lang.add_item),
              ),
              PopupMenuItem<String>(
                value: 'add_category',
                child: Text(lang.add_category),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // حقل البحث
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: lang.search_item_hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
            SizedBox(height: 12.h),

            // قائمة الفئات مع تعديل عند الضغط
            StreamBuilder<List<Category>>(
              stream: categoryController.readCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final categories = snapshot.data ?? [];

                if (categories.isEmpty) {
                  return Center(child: Text(lang.no_categories));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lang.categories,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return ListTile(
                          leading: category.imageUrl != null
                              ? Image.network(category.imageUrl!,
                              width: 50, height: 50, fit: BoxFit.cover)
                              : const Icon(Icons.category),
                          title: Text(category.name),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    AddEditCategoryScreen(category: category),
                              ),
                            ).then((_) => setState(() {}));
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 12.h),

            // قائمة الوجبات
            Expanded(
              child: StreamBuilder<List<MenuItem>>(
                stream: selectedCategory == "All"
                    ? menuController.read()
                    : menuController.searchByCategory(selectedCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(lang.updating_error));
                  }

                  var items = snapshot.data ?? [];

                  // تصفية البحث محلياً
                  final query = searchController.text.toLowerCase();
                  if (query.isNotEmpty) {
                    items = items
                        .where((item) => item.name.toLowerCase().contains(query))
                        .toList();
                  }

                  if (items.isEmpty) {
                    return Center(
                      child: Text(
                        lang.no_items,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/add_edit_menu_item_screen",
                            arguments: item,
                          ).then((_) => setState(() {}));
                        },
                        child: Card(
                          color: Colors.grey.shade900,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                item.imageUrl != null && item.imageUrl!.isNotEmpty
                                    ? (item.imageUrl!.startsWith('http')
                                    ? Image.network(
                                  item.imageUrl!,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                )
                                    : Image.file(
                                  File(item.imageUrl!),
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ))
                                    : const Icon(Icons.fastfood,
                                    size: 120, color: Colors.white70),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            item.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: item.available
                                                  ? Colors.green
                                                  : Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              item.available
                                                  ? lang.available
                                                  : lang.not_available,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item.description,
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white70),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(Icons.timer_outlined,
                                              size: 18, color: Colors.amber),
                                          Text(
                                            "${item.prepTime ?? 0} دقيقة",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(width: 12),
                                          const Icon(Icons.monetization_on,
                                              size: 18, color: Colors.amber),
                                          Text(
                                            "${item.price.toStringAsFixed(2)} دت",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            icon: Icon(
                                              item.available
                                                  ? Icons.toggle_on
                                                  : Icons.toggle_off,
                                              color: item.available
                                                  ? Colors.green
                                                  : Colors.grey,
                                              size: 36,
                                            ),
                                            onPressed: () async {
                                              try {
                                                item.available = !item.available;
                                                await menuController.update(item);
                                                setState(() {});
                                              } catch (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          "حدث خطأ أثناء التحديث")),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

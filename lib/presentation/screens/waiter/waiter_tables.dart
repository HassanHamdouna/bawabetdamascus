import 'package:bawabetdamascus/core/constants/app_colors.dart';
import 'package:bawabetdamascus/core/constants/app_text_styles.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';
import 'package:bawabetdamascus/presentation/widgets/waiter/waiter_app_bar.dart';
import 'package:bawabetdamascus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/waiter/category_item.dart';
import '../../widgets/waiter/meal_item.dart';

enum OrderType { table, takeaway, delivery }

class WaiterTables extends StatefulWidget {
  const WaiterTables({super.key});

  @override
  State<WaiterTables> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<WaiterTables> {
  int selectedCategoryIndex = 0;
  int cartCount = 0;

  OrderType selectedOrderType = OrderType.table;

  final List<Map<String, String>> categories = [
    {"title": "الوجبات", "icon": "assets/icon/foreground.png"},
    {"title": "الوجبات عائلية", "icon": "assets/icon/foreground.png"},
    {"title": "سندويشات", "icon": "assets/icon/foreground.png"},
    {"title": "معجنات", "icon": "assets/icon/foreground.png"},
    {"title": "سلطات", "icon": "assets/icon/foreground.png"},
    {"title": "مقبلات", "icon": "assets/icon/foreground.png"},
  ];

  final List<Map<String, dynamic>> meals = [
    {
      "title": "وجبة دجاج مشوي على الفحم",
      "description":
      "( نصف دجاج مشوى على الفحم / رز عادي / سلايط / فريت / بطاطا مقلية / حمص / كريم ثوم / هريسة / خبز )",
      "image": "assets/images/pala.png",
      "inTime": 15,
      "outTime": 20,
      "price": 27.0,
      "category": "الوجبات"
    },
    {
      "title": "وجبة لحم مشوي",
      "description": "( نص لحم مشوي / رز / سلطة / بطاطا )",
      "image": "assets/images/pala.png",
      "inTime": 15,
      "outTime": 20,
      "price": 35.0,
      "category": "الوجبات"
    },
    {
      "title": "سندويش شاورما دجاج",
      "description": "( خبز / شاورما دجاج / صوص / خضار )",
      "image": "assets/images/pala.png",
      "inTime": 15,
      "outTime": 20,
      "price": 12.0,
      "category": "سندويشات"
    },
    {
      "title": "سلطة فتوش",
      "description": "( خس / طماطم / خيار / خبز محمص / صوص فتوش )",
      "image": "assets/images/pala.png",
      "inTime": 15,
      "outTime": 20,
      "price": 8.0,
      "category": "سلطات"
    },
    {
      "title": "مقبلات مشكّلة",
      "description": "( حمص / متبل / ورق عنب / كبة )",
      "image": "assets/images/pala.png",
      "inTime": 8,
      "outTime": 15,
      "price": 15.0,
      "category": "مقبلات"
    },
  ];

  List<Map<String, dynamic>> cartItems = [];

  final TextEditingController tableNumberController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerPhoneController = TextEditingController();
  final TextEditingController noteController = TextEditingController(); // ملاحظة


  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    final filteredMeals = meals
        .where((meal) =>
    meal["category"] == categories[selectedCategoryIndex]["title"])
        .toList();

    return Scaffold(
      appBar: WaiterAppBar(
        waiterName: "حسن المصري",
        waiterImage: "assets/images/user_pers.png",
        cartCount: cartCount,
        CountAllCart: cartCount,
        onShowTables: () {
          Navigator.pushNamed(context, AppRoutes.waiterTablesListScreen);
        },
        onCartTap: () {
          Navigator.pushNamed(context, AppRoutes.cartScreen);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الترحيب
            Card(
              color: AppColors.darkCard,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lang.welcome, style: AppTextStyles.headlineMedium),
                        Text(lang.restaurant_management,
                            style: AppTextStyles.bodySmall),
                        SizedBox(height: 10.sp),
                        Row(
                          children: [
                            const Icon(Icons.timer_outlined,
                                color: AppColors.accent, size: 20),
                            Text(lang.time, style: AppTextStyles.bodySmall),
                            SizedBox(width: 2.sp),
                            Text("22:51", style: AppTextStyles.bodySmall),
                            SizedBox(width: 10.sp),
                            const Icon(Icons.date_range,
                                color: AppColors.accent, size: 20),
                            Text(lang.day, style: AppTextStyles.bodySmall),
                            SizedBox(width: 2.sp),
                            Text("11:01:2025", style: AppTextStyles.bodySmall),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/icon/foreground.png",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // اختيار نوع الطلب
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: OrderType.values.map((type) {
                String label = "";
                switch (type) {
                  case OrderType.table:
                    label = "طاولة";
                    break;
                  case OrderType.takeaway:
                    label = "استلام";
                    break;
                  case OrderType.delivery:
                    label = "توصيل";
                    break;
                }
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOrderType = type;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.amber),
                        ),
                        child: selectedOrderType == type
                            ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                            : null,
                      ),
                      const SizedBox(width: 6),
                      Text(label, style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 10),

            // بيانات الطاولة والزبون تظهر فقط إذا نوع الطلب طاولة
            Column(
              children: [
                if (selectedOrderType == OrderType.table) ...[
                  TextField(
                    controller: tableNumberController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      hintText: "رقم الطاولة",
                      prefixIcon: const Icon(Icons.table_restaurant, color: Colors.amber),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                // اسم الزبون يظهر دائمًا
                TextField(
                  controller: customerNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    hintText: "اسم الزبون",
                    prefixIcon: const Icon(Icons.person, color: Colors.amber),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 10),

                if (selectedOrderType == OrderType.takeaway) ...[
                  TextField(
                    controller: customerPhoneController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      hintText: "اسم المستلم",
                      prefixIcon: const Icon(Icons.person_outline, color: Colors.amber),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                if (selectedOrderType == OrderType.delivery) ...[
                  TextField(
                    controller: customerPhoneController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      hintText: "اسم الشخص الذي يوصل",
                      prefixIcon: const Icon(Icons.person_outline, color: Colors.amber),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      hintText: "رقم الهاتف",
                      prefixIcon: const Icon(Icons.phone, color: Colors.amber),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      hintText: "عنوان التوصيل",
                      prefixIcon: const Icon(Icons.location_on, color: Colors.amber),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 10),

            // أنواع الفئات
            Text("انواع", style: AppTextStyles.highlight),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  final cat = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CategoryItem(
                      title: cat["title"]!,
                      iconPath: cat["icon"]!,
                      isSelected: selectedCategoryIndex == index,
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 10),
            Text(lang.restaurant_management, style: AppTextStyles.highlight),

            // قائمة الوجبات
            Expanded(
              child: ListView.builder(
                itemCount: filteredMeals.length,
                itemBuilder: (context, index) {
                  final meal = filteredMeals[index];
                  return MealItem(
                    title: meal["title"],
                    description: meal["description"],
                    image: meal["image"],
                    inTime: meal["inTime"],
                    outTime: meal["outTime"],
                    price: meal["price"],
                    onTap: ()  {
                      _showMealBottomSheet(meal);
                    },
                    onAdd: (note) {
                      setState(() {
                        cartItems.add({...meal, "note": note});
                        cartCount++;
                      });
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
  void _showMealBottomSheet(Map<String, dynamic> meal) {
    noteController.clear();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) =>
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom,
                top: 20,
                left: 20,
                right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(meal["title"],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(meal["description"],
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 10),
                TextField(
                  controller: noteController,
                  decoration: InputDecoration(
                    hintText: "ملاحظة (اختياري)",
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cartCount++;
                            cartItems.add({
                              ...meal,
                              "note": noteController.text,
                            });
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("أضف للسلة"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
    );
  }

}

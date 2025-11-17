import 'package:bawabetdamascus/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/custom_appbar.dart';

enum OrderType { table, takeaway, delivery }

class CartScreen extends StatefulWidget {

  const CartScreen({super.key,});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Controllers
  final TextEditingController tableNumberController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerPhoneController = TextEditingController();
  final TextEditingController deliveryAddressController = TextEditingController();

  // عناصر السلة
  List<Map<String, dynamic>> cartItems = [
    {
      "title": "وجبة دجاج",
      "description": "نصف دجاج مشوي مع رز وسلطة",
      "inTime": 15,
      "outTime": 20,
      "price": 25.0,
      "quantity": 1,
      "image": "assets/images/pala.png",
    },
    {
      "title": "سلطة فتوش",
      "description": "خس، طماطم، خيار، صوص فتوش",
      "inTime": 5,
      "outTime": 8,
      "price": 8.0,
      "quantity": 2,
      "image": "assets/images/pala.png",
    },
    {
      "title": "سندويش شاورما",
      "description": "خبز مع شاورما دجاج وخضار",
      "inTime": 10,
      "outTime": 12,
      "price": 12.0,
      "quantity": 1,
      "image": "assets/images/pala.png",
    },
  ];

  OrderType selectedOrderType = OrderType.table;

  @override
  Widget build(BuildContext context) {
    double subTotal = cartItems.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"]));

    return Scaffold(
        appBar: CustomAppBar(
          title: "سلة التسوق الخاصة بي",
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // عنوان ملخص الطلب
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Text("ملخص الطلب", style: AppTextStyles.highlight),
                    Spacer(),
                    Text("اضافة عنصر", style: AppTextStyles.highlight),
                  ],
                ),
              ),


              const SizedBox(height: 10),

              const SizedBox(height: 10),

              // قائمة السلة
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    color: Colors.grey.shade900,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          if (item["image"] != null)
                            Image.asset(item["image"], width: 80, height: 80, fit: BoxFit.cover),
                          if (item["image"] != null) const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item["title"], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                const SizedBox(height: 4),
                                Text(item["description"], style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                const SizedBox(height: 4),
                                Text("الوقت: ${item["inTime"]}-${item["outTime"]} دقيقة | السعر: ${item["price"]} د.ت",
                                    style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                Row(
                                  children: [
                                    Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.add, color: Colors.green),
                                      onPressed: () {
                                        setState(() {
                                          item["quantity"]++;
                                        });
                                      },
                                    ),
                                    Text("${item["quantity"]}", style: const TextStyle(color: Colors.white)),
                                    IconButton(
                                      icon: const Icon(Icons.remove, color: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          if (item["quantity"] > 1) {
                                            item["quantity"]--;
                                          } else {
                                            cartItems.removeAt(index);
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                cartItems.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.grey.shade900,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ---- اسم المطعم ----
                      Text(
                        "مشاوي بوابة دمشق",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        "الزهراء",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 10),

                      // ---- NOTE ----
                      Text(
                        "NOTE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // ---- معلومات الطاولة ----
                      Row(
                        children: const [
                          Text(" طاولة : 1100",
                              style: TextStyle(color: Colors.white70, fontSize: 16)),
                          Spacer(),
                          Text("14/10/2025",
                              style: TextStyle(color: Colors.white70, fontSize: 16)),
                          Spacer(),
                          Text("18:32",
                              style: TextStyle(color: Colors.white70, fontSize: 16)),
                        ],
                      ),

                      SizedBox(height: 10),

                      // ---- النادل ----
                      Row(
                        children: const [
                          Text(" 2 ",
                              style: TextStyle(color: Colors.white70, fontSize: 16)),
                          SizedBox(width: 6),
                          Text("حسن مصري",
                              style: TextStyle(color: Colors.white70, fontSize: 14)),
                        ],
                      ),

                      SizedBox(height: 10),

                      // ---- عناوين الجدول ----
                      Row(
                        children: const [
                          Text("العدد",
                              style: TextStyle(color: Colors.white70, fontSize: 14)),
                          SizedBox(width: 20),
                          Text("الصنف",
                              style: TextStyle(color: Colors.white70, fontSize: 14)),
                          Spacer(),
                          Text("المجموع",
                              style: TextStyle(color: Colors.white70, fontSize: 14)),
                        ],
                      ),

                      SizedBox(height: 6),
                      Divider(color: Colors.white24),

                      // ---- عناصر السلة (السعر يتحرك حسب الكمية) ----
                      ...cartItems.map((item) {
                        double lineTotal = item["quantity"] * item["price"]; // ← حساب السعر الديناميكي

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              // العدد
                              SizedBox(width: 5.w),
                              Text(
                                item["quantity"].toString(),
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              SizedBox(width: 30.w),

                              // اسم الصنف
                              Text(
                                item["title"],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              Spacer(),

                              // المجموع الفرعي = الكمية × السعر
                              Text(
                                "${lineTotal.toStringAsFixed(2)} د.ت",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),

                      SizedBox(height: 8),
                      Divider(color: Colors.white),

                      // ---- المجموع الكلي ----
                      Row(
                        children: [
                          SizedBox(width: 10.w),
                          const Text(
                            "المجموع الكلي",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${subTotal.toStringAsFixed(2)} د.ت",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),const SizedBox(height: 10),              // زر تمرير الطلب
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text("تمرير الطلب"),
              ),
            ],
          ),
        )
    );
  }
}
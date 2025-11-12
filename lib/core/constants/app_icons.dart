import 'package:flutter/material.dart';

/// 🧭 جميع الأيقونات الموحدة في تطبيق بوابة دمشق.
/// الفكرة: بدل ما تكتب Icons.home في كل مكان، تكتب AppIcons.home
/// بحيث يسهل تعديلها لاحقًا أو تبديلها بـ SVG مثلاً.

class AppIcons {
  // 🏠 أيقونات التنقل الرئيسية
  static const IconData home = Icons.home_rounded;
  static const IconData menu = Icons.restaurant_menu_rounded;
  static const IconData orders = Icons.receipt_long_rounded;
  static const IconData favorites = Icons.favorite_rounded;
  static const IconData profile = Icons.person_rounded;
  static const IconData settings = Icons.settings_rounded;

  // 🛒 أيقونات الطلبات والعربة
  static const IconData cart = Icons.shopping_cart_rounded;
  static const IconData add = Icons.add_circle_rounded;
  static const IconData remove = Icons.remove_circle_outline;
  static const IconData check = Icons.check_circle_rounded;
  static const IconData delete = Icons.delete_rounded;

  // 💬 أيقونات التواصل والمساعدة
  static const IconData phone = Icons.phone_rounded;
  // static const IconData whatsapp = Icons.whatsapp; // لو تضيف flutter_iconly أو font_awesome
  static const IconData message = Icons.message_rounded;
  static const IconData email = Icons.email_rounded;
  static const IconData location = Icons.location_on_rounded;

  // 🌙 أيقونات الحالة
  static const IconData darkMode = Icons.dark_mode_rounded;
  static const IconData lightMode = Icons.light_mode_rounded;
  static const IconData language = Icons.language_rounded;
  static const IconData logout = Icons.logout_rounded;

  // 🔍 أيقونات البحث والإجراءات
  static const IconData search = Icons.search_rounded;
  static const IconData filter = Icons.filter_list_rounded;
  static const IconData edit = Icons.edit_rounded;
  static const IconData camera = Icons.camera_alt_rounded;
  static const IconData upload = Icons.upload_rounded;

  // 📦 أيقونات الأصناف والمطعم
  static const IconData shawarma = Icons.lunch_dining_rounded;
  static const IconData kebab = Icons.set_meal_rounded;
  static const IconData dessert = Icons.cake_rounded;
  static const IconData drink = Icons.local_drink_rounded;
  static const IconData offer = Icons.local_offer_rounded;

  // ⚙️ أخرى
  static const IconData info = Icons.info_rounded;
  static const IconData back = Icons.arrow_back_ios_new_rounded;
  static const IconData forward = Icons.arrow_forward_ios_rounded;
}

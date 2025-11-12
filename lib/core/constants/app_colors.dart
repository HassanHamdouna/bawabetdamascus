import 'package:flutter/material.dart';

/// 🎨 ألوان موحدة لتطبيق بوابة دمشق
/// استخدمها في جميع أنحاء التطبيق بدل كتابة ألوان ثابتة في كل مكان

class AppColors {
  // 🎯 الألوان الأساسية
  static const Color primary = Color(0xFFD4AF37); // الذهبي الفاخر
  static const Color secondary = Color(0xFFB58900); // ذهبي أغمق قليلاً
  static const Color accent = Color(0xFFE0C066); // لون لمسات

  // ⚪ ألوان الخلفيات
  static const Color backgroundLight = Color(0xFFF9F9F9);
  static const Color backgroundDark = Color(0xFF121212);

  // 🧱 ألوان البطاقات والعناصر
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // 🖤 ألوان النصوص
  static const Color textLight = Colors.black87;
  static const Color textDark = Colors.white;

  // 🧭 ألوان التفاعل
  static const Color success = Color(0xFF4CAF50); // أخضر
  static const Color warning = Color(0xFFFFC107); // أصفر
  static const Color error = Color(0xFFE53935);   // أحمر

  // 🧊 ألوان محايدة
  static const Color grey = Colors.grey;
  static const Color divider = Color(0xFFE0E0E0);

  // 🌙 ألوان الوضع الليلي
  static const Color darkCard = Color(0xFF1F1F1F);
  static const Color darkContainer = Color(0xFF2C2C2C);

  // ✨ ألوان إضافية حسب الحاجة
  static const Color transparent = Colors.transparent;
}

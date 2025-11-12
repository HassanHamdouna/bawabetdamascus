import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

/// 🖋️ يحتوي على جميع أنماط النصوص الموحدة لتطبيق بوابة دمشق.
/// الهدف: توحيد شكل النصوص في جميع الصفحات، بحيث يسهل تعديلها لاحقًا.

class AppTextStyles {
  // 📌 عناوين كبيرة (مثل اسم القسم أو الشاشة)
  static TextStyle headlineLarge = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
    // color: AppColors.primaryText,
    height: 1.3,
  );

  // 📌 عناوين متوسطة
  static TextStyle headlineMedium = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    // color: AppColors.primaryText,
  );

  // 📌 عناوين صغيرة
  static TextStyle headlineSmall = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    // color: AppColors.primaryText,
  );

  // 📋 نصوص عادية (مثل وصف المنتج أو المحتوى)
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    // color: AppColors.secondaryText,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    // color: AppColors.secondaryText,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    // color: AppColors.secondaryText,
  );

  // 💬 نصوص مميزة (مثل السعر أو العروض)
  static TextStyle highlight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  // ⚙️ نصوص داخل الأزرار
  static TextStyle buttonText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // 🗒️ نصوص خافتة (ملاحظات أو توجيهات)
  static TextStyle hint = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    // color: AppColors.hintText,
  );

  // 💡 للغة العربية يمكن لاحقًا تغيير الخط هنا
  static void setArabicFontFamily() {
    headlineLarge = headlineLarge.copyWith(fontFamily: 'Cairo');
    headlineMedium = headlineMedium.copyWith(fontFamily: 'Cairo');
    headlineSmall = headlineSmall.copyWith(fontFamily: 'Cairo');
    bodyLarge = bodyLarge.copyWith(fontFamily: 'Cairo');
    bodyMedium = bodyMedium.copyWith(fontFamily: 'Cairo');
    bodySmall = bodySmall.copyWith(fontFamily: 'Cairo');
    highlight = highlight.copyWith(fontFamily: 'Cairo');
    buttonText = buttonText.copyWith(fontFamily: 'Cairo');
    hint = hint.copyWith(fontFamily: 'Cairo');
  }
}

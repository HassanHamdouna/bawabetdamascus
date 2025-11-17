import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle headlineLarge = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
    height: 1.3,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static TextStyle headlineSmall = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );
  static TextStyle bodySmall2 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );

  static TextStyle highlight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle buttonText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle hint = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );

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

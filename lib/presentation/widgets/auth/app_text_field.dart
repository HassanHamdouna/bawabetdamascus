import 'package:bawabetdamascus/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hint,
    required this.keyboardType,
    required this.controller,
    this.focusedBorderColor = Colors.grey,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  final String hint;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Color focusedBorderColor;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: GoogleFonts.cairo(
        fontSize: 13.sp,
        color: isDark ? AppColors.textDark : AppColors.textLight,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hint,
        hintStyle: GoogleFonts.cairo(
          fontSize: 13.sp,
          color: isDark ? Colors.grey[400] : Colors.grey[600],
        ),
        hintMaxLines: 1,
        prefixIcon: Icon(prefixIcon, color: isDark ? AppColors.textDark : AppColors.textLight),
        suffixIcon: suffixIcon,
        enabledBorder: buildOutlineInputBorder(isDark),
        focusedBorder: buildOutlineInputBorder(isDark, color: focusedBorderColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(bool isDark, {Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: color),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bawabetdamascus/core/constants/app_colors.dart';
import 'package:bawabetdamascus/core/constants/app_text_styles.dart';

class RoleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        splashColor: Colors.cyanAccent.withOpacity(0.3),
        child: Card(
          color: AppColors.backgroundDark,
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: [
                Icon(icon, color: AppColors.error, size: 50.sp),
                SizedBox(height: 10.sp),
                Text(title, textAlign: TextAlign.center, style: AppTextStyles.bodyLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

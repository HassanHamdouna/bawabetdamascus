import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/theme_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;

  const CustomAppBar({
    Key? key,
    this.title,
    this.showBackButton = false,
    this.actions,
    this.leading,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      leadingWidth: 80,
      backgroundColor: backgroundColor ?? AppColors.primary,
      elevation: 3,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: AppTextStyles.headlineLarge.copyWith(
          color: themeProvider.isDark ? AppColors.textDark : AppColors.textLight,
        ),
      ),
      leading: leading ??
          (showBackButton
              ? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          )
              : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

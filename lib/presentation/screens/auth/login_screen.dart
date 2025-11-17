import 'package:bawabetdamascus/core/constants/app_colors.dart';
import 'package:bawabetdamascus/core/constants/app_text_styles.dart';
import 'package:bawabetdamascus/core/utils/snackbar_helper.dart';
import 'package:bawabetdamascus/domain/providers/theme_provider.dart';
import 'package:bawabetdamascus/domain/providers/language_provider.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';
import 'package:bawabetdamascus/presentation/widgets/app_text_field.dart';
import 'package:bawabetdamascus/presentation/widgets/custom_appbar.dart';
import 'package:bawabetdamascus/presentation/widgets/language_bottom_sheet.dart';
import 'package:bawabetdamascus/presentation/widgets/role_card.dart';
import 'package:bawabetdamascus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _passwordTextController;
  bool _obscure = true;
  bool _showRoles = false;
  String _enteredPassword = '';

  final Map<String, List<String>> passwordRoles = {
    '1': ['accountant', 'manager', 'system_managers', 'owner', 'stock', 'waiter', 'kitchen'],
    'manager123': ['manager', 'stock', 'waiter', 'kitchen'],
    'accountant123': ['accountant'],
    'waiter123': ['waiter'],
    'kitchen123': ['kitchen'],
  };

  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    super.dispose();
  }

  bool hasRole(String role) {
    return passwordRoles[_enteredPassword]?.contains(role) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: Icon(themeProvider.isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              color: AppColors.grey, size: 35),
          onPressed: () => themeProvider.toggleTheme(),
        ),
        actions: [
          IconButton(
            onPressed: () => showLanguageBottomSheet(context),
            icon: const Icon(Icons.language, color: AppColors.grey, size: 35),
          ),
          const SizedBox(width: 20),
        ],
        title: lang.title,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: AppColors.darkCard,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lang.welcome, style: AppTextStyles.headlineMedium),
                        Text(lang.restaurant_management, style: AppTextStyles.bodySmall),
                        SizedBox(height: 10.sp),
                        Row(
                          children: [
                            const Icon(Icons.timer_outlined, color: AppColors.accent, size: 20.0),
                            Text(lang.time, style: AppTextStyles.bodySmall),
                            SizedBox(width: 2.sp),
                            Text("22:51 ", style: AppTextStyles.bodySmall),
                            SizedBox(width: 10.sp),
                            const Icon(Icons.date_range, color: AppColors.accent, size: 20.0),
                            Text(lang.day, style: AppTextStyles.bodySmall),
                            SizedBox(width: 2.sp),
                            Text("11:01:2025 ", style: AppTextStyles.bodySmall),
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
            const SizedBox(height: 20),
            AppTextField(
              hint: lang.login,
              prefixIcon: Icons.lock,
              obscureText: _obscure,
              keyboardType: TextInputType.text,
              controller: _passwordTextController,
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscure = !_obscure),
                icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    size: 30, color: AppColors.grey),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: performLogin,
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 40)),
              child: Text(lang.login, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14.sp)),
            ),
            const SizedBox(height: 20),
            if (_showRoles)
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        if (hasRole('accountant'))
                          RoleCard(title: lang.accountant, icon: Icons.account_balance, onTap: () {}),
                        if (hasRole('manager'))
                          RoleCard(title: lang.manager, icon: Icons.manage_accounts_rounded, onTap: () {}),
                      ],
                    ),
                    Row(
                      children: [
                        if (hasRole('system_managers'))
                          RoleCard(title: lang.system_managers, icon: Icons.system_security_update_good, onTap: () {
                            Navigator.pushReplacementNamed(context, AppRoutes.userManagementScreen);
                          }),
                        if (hasRole('owner'))
                          RoleCard(title: lang.owner, icon: Icons.supervised_user_circle, onTap: () {}),
                      ],
                    ),
                    Row(
                      children: [
                        if (hasRole('stock'))
                          RoleCard(title: lang.stock, icon: Icons.stadium_rounded, onTap: () {}),
                        if (hasRole('waiter'))
                          RoleCard(title: lang.waiter, icon: Icons.waving_hand, onTap: () {
                            Navigator.pushReplacementNamed(context, AppRoutes.waiterTables);
                          }),
                        if (hasRole('kitchen'))
                          RoleCard(title: lang.kitchen, icon: Icons.soup_kitchen_sharp, onTap: () {}),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void performLogin() {
    final password = _passwordTextController.text.trim();
    ScaffoldMessenger.of(context).clearSnackBars();

    if (password.isEmpty) {
      SnackBarHelper.showError(context, 'Please enter required data!');
      return;
    }

    if (passwordRoles.containsKey(password)) {
      setState(() {
        _enteredPassword = password;
        _showRoles = true;
      });
      _passwordTextController.clear();
    } else {
      setState(() {
        _showRoles = false;
      });
      _passwordTextController.clear();
      SnackBarHelper.showError(context, 'Invalid password!');
    }
  }
}

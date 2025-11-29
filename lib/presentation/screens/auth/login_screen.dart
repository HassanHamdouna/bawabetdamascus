import 'package:bawabetdamascus/core/constants/app_colors.dart';
import 'package:bawabetdamascus/core/constants/app_text_styles.dart';
import 'package:bawabetdamascus/core/utils/snackbar_helper.dart';
import 'package:bawabetdamascus/data/controllers/user_controller.dart';
import 'package:bawabetdamascus/domain/providers/theme_provider.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';
import 'package:bawabetdamascus/presentation/widgets/auth/app_text_field.dart';
import 'package:bawabetdamascus/presentation/widgets/auth/custom_appbar.dart';
import 'package:bawabetdamascus/presentation/widgets/auth/language_bottom_sheet.dart';
import 'package:bawabetdamascus/presentation/widgets/auth/role_card.dart';
import 'package:bawabetdamascus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _passwordController;
  final UserController userController = UserController();

  bool _obscure = true;
  bool _showRoles = false;
  String? _enteredPassword;
  List<String> _userRoles = [];
  String? _userName; // اسم المستخدم بعد تسجيل الدخول

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void performLogin() async {
    final password = _passwordController.text.trim();
    ScaffoldMessenger.of(context).clearSnackBars();

    if (password.isEmpty) {
      SnackBarHelper.showError(context, 'Please enter password!');
      return;
    }

    try {
      final usersSnapshot = await userController.read().first;
      final user = usersSnapshot.firstWhere(
            (u) => u.password == password,
      );

      if (user == null) {
        SnackBarHelper.showError(context, 'Invalid password!');
        return;
      }

      setState(() {
        _enteredPassword = password;
        _userRoles = user.roles ?? [];
        _userName = user.name; // حفظ اسم المستخدم
        _showRoles = true;
      });

      _passwordController.clear();
    } catch (e) {
      SnackBarHelper.showError(context, 'Error fetching users!');
    }
  }

  bool hasRole(String role) {
    return _userRoles.contains(role);
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm').format(now);
  }

  String getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final lang = AppLocalizations.of(context)!;


    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: Icon(
            themeProvider.isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            color: AppColors.grey,
            size: 35,
          ),
          onPressed: () => themeProvider.toggleTheme(),
        ),        actions: [
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
            // بطاقة الترحيب مع الوقت والتاريخ الحالي
            Card(
              color: AppColors.darkCard,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                           lang.welcome,
                          style: AppTextStyles.headlineMedium,
                        ),
                        Text(
                          _userName != null ? '$_userName' : "",
                          style: AppTextStyles.bodySmall,
                        ),
                        SizedBox(height: 10.sp),
                        Row(
                          children: [
                            const Icon(Icons.timer_outlined, color: AppColors.accent, size: 20.0),
                            SizedBox(width: 2.sp),
                            Text(getCurrentTime(), style: AppTextStyles.bodySmall),
                            SizedBox(width: 10.sp),
                            const Icon(Icons.date_range, color: AppColors.accent, size: 20.0),
                            SizedBox(width: 2.sp),
                            Text(getCurrentDate(), style: AppTextStyles.bodySmall),
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

            // حقل كلمة المرور
            AppTextField(
              hint: lang.login,
              prefixIcon: Icons.lock,
              obscureText: _obscure,
              keyboardType: TextInputType.text,
              controller: _passwordController,
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscure = !_obscure),
                icon: Icon(
                  _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  size: 30,
                  color: AppColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // زر تسجيل الدخول
            ElevatedButton(
              onPressed: performLogin,
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 40)),
              child: Text(
                lang.login,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14.sp),
              ),
            ),
            const SizedBox(height: 20),

            // عرض الأدوار المتاحة بعد تسجيل الدخول
            if (_showRoles)
              Expanded(
                child: ListView(
                  children: [
                    if (hasRole('accountant'))
                      RoleCard(title: lang.accountant, icon: Icons.account_balance, onTap: () {}),
                    if (hasRole('manager'))
                      RoleCard(title: lang.manager, icon: Icons.manage_accounts_rounded, onTap: () {}),
                    if (hasRole('systemManagers'))
                      RoleCard(
                        title: lang.system_managers,
                        icon: Icons.system_security_update_good,
                        onTap: () {
                          Navigator.pushReplacementNamed(context, AppRoutes.systemManagementScreen);
                        },
                      ),
                    if (hasRole('owner'))
                      RoleCard(title: lang.owner, icon: Icons.supervised_user_circle, onTap: () {}),
                    if (hasRole('stock'))
                      RoleCard(title: lang.stock, icon: Icons.stadium_rounded, onTap: () {}),
                    if (hasRole('waiter'))
                      RoleCard(
                        title: lang.waiter,
                        icon: Icons.waving_hand,
                        onTap: () {
                          Navigator.pushReplacementNamed(context, AppRoutes.waiterTables);
                        },
                      ),
                    if (hasRole('kitchen'))
                      RoleCard(title: lang.kitchen, icon: Icons.soup_kitchen_sharp, onTap: () {}),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:bawabetdamascus/data/models/menu_item.dart';
import 'package:bawabetdamascus/presentation/screens/system_manager/add_edit_category_screen.dart';
import 'package:bawabetdamascus/presentation/screens/system_manager/add_edit_menu_item_screen.dart';
import 'package:bawabetdamascus/presentation/screens/system_manager/add_edit_user_screen.dart';
import 'package:bawabetdamascus/presentation/screens/system_manager/menu_management_screen.dart';
import 'package:bawabetdamascus/presentation/screens/system_manager/system_manager_scree.dart';
import 'package:bawabetdamascus/presentation/screens/system_manager/user_management_screen.dart';
import 'package:bawabetdamascus/presentation/screens/waiter/waiter_tables_list_screen.dart';
import 'package:flutter/material.dart';

// 📦 استيراد الشاشات
import 'package:bawabetdamascus/presentation/screens/launch/launch_screen.dart';
import 'package:bawabetdamascus/presentation/screens/auth/login_screen.dart';
import 'package:bawabetdamascus/presentation/screens/waiter/waiter_tables.dart';
import 'package:bawabetdamascus/presentation/screens/waiter/cart_screen.dart';

/// 🔹 هذا الملف مسؤول عن تعريف جميع المسارات (Routes) في التطبيق
/// حتى يسهل إدارتها في مكان واحد فقط

class AppRoutes {
  // 🧭 تعريف الأسماء الثابتة لكل Route
  static const String launch = '/launch_screen';
  static const String login = '/login_screen';
  static const String managerDashboard = '/manager_dashboard';
  static const String waiterTables = '/waiter_tables';
  static const String cartScreen = '/cart_screen';
  static const String waiterTablesListScreen = '/waiter_tables_list_screen';
  static const String userManagementScreen = '/user_management_screen';
  static const String addEditUserScreen = '/add_edit_user_screen';
  static const String menuManagementScreen = '/menu_management_screen';
  static const String systemManagementScreen = '/system_management_screen';
  static const String addEditMenuItemScreen = '/add_edit_menu_item_screen';
  static const String addEditCategoryScreen = '/add_edit_category_screen';


  /// 🗺️ تعريف خريطة المسارات التي يستخدمها MaterialApp
  static Map<String, WidgetBuilder> get routes {
    return {
      launch: (context) => const LaunchScreen(),
      login: (context) => const LoginScreen(),
      waiterTables: (context) => const WaiterTables(),
      cartScreen: (context) => const CartScreen(),
      waiterTablesListScreen: (context) => const WaiterTablesListScreen(waiterId: "حسن المصري",),
      userManagementScreen: (context) => const UserManagementScreen(),
      addEditUserScreen: (context) => const AddEditUserScreen(),
      menuManagementScreen: (context) => const MenuManagementScreen(),
      systemManagementScreen: (context) => const SystemManagerScreen(),
      addEditCategoryScreen: (context) => const AddEditCategoryScreen(),
      "/add_edit_menu_item_screen": (context) {
        final item = ModalRoute.of(context)!.settings.arguments as MenuItem?;
        return AddEditMenuItemScreen(item: item);
      },
    };
  }
}

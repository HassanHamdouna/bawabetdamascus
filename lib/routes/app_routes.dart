import 'package:flutter/material.dart';

// 📦 استيراد الشاشات
import 'package:bawabetdamascus/presentation/screens/launch/launch_screen.dart';
import 'package:bawabetdamascus/presentation/screens/auth/login_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/auth/register_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/system_manager/dashboard_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/waiter/tables_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/kitchen/kitchen_orders_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/accountant/cashier_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/manager/settings_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/owner/reports_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/warehouse/stock_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/system_manager/products_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/system_manager/categories_screen.dart';
// import 'package:bawabetdamascus/presentation/screens/system_manager/users_screen.dart';

/// 🔹 هذا الملف مسؤول عن تعريف جميع المسارات (Routes) في التطبيق
/// حتى يسهل إدارتها في مكان واحد فقط

class AppRoutes {
  // 🧭 تعريف الأسماء الثابتة لكل Route
  static const String launch = '/launch_screen';
  static const String login = '/login_screen';
  static const String register = '/register_screen';
  static const String managerDashboard = '/manager_dashboard';
  static const String waiterTables = '/waiter_tables';
  static const String kitchenOrders = '/kitchen_orders';
  static const String cashier = '/cashier_screen';
  static const String settings = '/settings_screen';
  static const String reports = '/reports_screen';
  static const String stock = '/stock_screen';
  static const String products = '/products_screen';
  static const String categories = '/categories_screen';
  static const String users = '/users_screen';

  /// 🗺️ تعريف خريطة المسارات التي يستخدمها MaterialApp
  static Map<String, WidgetBuilder> get routes {
    return {
      launch: (context) => const LaunchScreen(),
      login: (context) => const LoginScreen(),
      // register: (context) => const RegisterScreen(),
      // managerDashboard: (context) => const DashboardScreen(),
      // waiterTables: (context) => const TablesScreen(),
      // kitchenOrders: (context) => const KitchenOrdersScreen(),
      // cashier: (context) => const CashierScreen(),
      // settings: (context) => const SettingsScreen(),
      // reports: (context) => const ReportsScreen(),
      // stock: (context) => const StockScreen(),
      // products: (context) => const ProductsScreen(),
      // categories: (context) => const CategoriesScreen(),
      // users: (context) => const UsersScreen(),
    };
  }
}

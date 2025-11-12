/// 🖼️ يحتوي على جميع مسارات الصور والأيقونات الثابتة المستخدمة في التطبيق.
/// الهدف: تسهيل إدارة الصور وتحديثها في مكان واحد فقط.
library;

class AppImages {
  // 📌 المسار العام لمجلد الصور داخل المشروع
  static const String _basePath = 'assets/images';
  static const String _iconsPath = 'assets/icons';
  static const String _logosPath = 'assets/logos';

  // 🏷️ صور عامة للتطبيق
  static const String splashBackground = '$_basePath/background.png';
  static const String logoApp = '$_basePath/logo_rem.png';
  static const String loginBackground = '$_basePath/login_bg.png';
  static const String homeBackground = '$_basePath/home_bg.png';
  static const String placeholder = '$_basePath/placeholder.png';
  static const String notFound = '$_basePath/not_found.png';

  // 🍽️ صور تخص المطعم
  static const String restaurantLogo = '$_logosPath/logo.png';
  static const String menuHeader = '$_basePath/menu_header.png';
  static const String chef = '$_basePath/chef.png';
  static const String waiter = '$_basePath/waiter.png';
  static const String kitchen = '$_basePath/kitchen.png';

  // 🍔 صور أنواع الأطعمة (لصفحة المنيو)
  static const String appetizers = '$_basePath/menu/appetizers.png';
  static const String coldAppetizers = '$_basePath/menu/cold_appetizers.png';
  static const String hotAppetizers = '$_basePath/menu/hot_appetizers.png';
  static const String salads = '$_basePath/menu/salads.png';
  static const String familyMeals = '$_basePath/menu/family_meals.png';
  static const String riceMeals = '$_basePath/menu/rice_meals.png';
  static const String kabsaMeals = '$_basePath/menu/kabsa_meals.png';

  // 💳 صور طرق الدفع
  static const String visa = '$_iconsPath/visa.png';
  static const String masterCard = '$_iconsPath/mastercard.png';
  static const String cash = '$_iconsPath/cash.png';

  // ⚙️ أيقونات عامة
  static const String settings = '$_iconsPath/settings.png';
  static const String profile = '$_iconsPath/profile.png';
  static const String language = '$_iconsPath/language.png';
  static const String theme = '$_iconsPath/theme.png';
}

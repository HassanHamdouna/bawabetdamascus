/// 🔧 يحتوي على وظائف مساعدة عامة في التطبيق
library;

class Helpers {
  /// تحقق إن النص غير فارغ
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// تحقق إن القائمة غير فارغة
  static bool isListNotEmpty(List? list) {
    return list != null && list.isNotEmpty;
  }

  /// اختصار لطباعة debug
  static void debugPrint(String message) {
    // يمكنك إضافة وقت أو سياق معين هنا
    // print("[DEBUG] $message");
    print(message);
  }

  /// اقتطاع نص طويل وإضافة "..." في النهاية
  static String truncate(String text, {int maxLength = 50}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// تحويل أي قيمة إلى نص مع معالجة null
  static String toStringSafe(dynamic value) {
    return value?.toString() ?? '';
  }
}

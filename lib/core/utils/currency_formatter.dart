import 'package:intl/intl.dart';

/// 💰 تنسيق العملات (دينار، دولار، يورو...)

class CurrencyFormatter {
  /// عرض الرقم مع الفاصلة والأرقام العشرية
  static String format(double value, {String locale = 'ar', String symbol = 'د.ت'}) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 2,
    );
    return formatter.format(value);
  }

  /// تحويل نص إلى رقم (double)
  static double parse(String value) {
    return double.tryParse(value.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
  }
}

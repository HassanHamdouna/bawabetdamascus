import 'package:intl/intl.dart';

/// 📅 تنسيق وعرض التواريخ

class DateFormatter {
  /// تحويل تاريخ إلى صيغة dd/MM/yyyy
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  /// تحويل تاريخ إلى صيغة yyyy-MM-dd
  static String formatDateIso(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  /// تحويل الوقت فقط hh:mm
  static String formatTime(DateTime date) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }

  /// تحويل التاريخ والوقت معًا
  static String formatDateTime(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(date);
  }

  /// تحويل نص إلى تاريخ
  static DateTime parseDate(String dateStr, {String pattern = 'yyyy-MM-dd'}) {
    final DateFormat formatter = DateFormat(pattern);
    return formatter.parse(dateStr);
  }
}

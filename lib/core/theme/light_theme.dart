import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getLightTheme() {
  const Color primaryColor = Color(0xFFd4af37); // الذهبي الأساسي
  const Color secondaryColor = Color(0xFFb58900);
  const Color backgroundColor = Color(0xFFF9F9F9);
  const Color surfaceColor = Colors.white;
  const Color textColor = Colors.black87;
  const Color errorColor = Colors.redAccent;

  return ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    canvasColor: surfaceColor,
    cardColor: surfaceColor,
    hintColor: Colors.grey[600],
    // errorColor: errorColor,
    useMaterial3: true,

    textTheme: GoogleFonts.cairoTextTheme().apply(
      bodyColor: textColor,
      displayColor: textColor,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: surfaceColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade100,
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor, width: 1.5),
      ),
    ),

    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.black,
    ),

    dividerTheme: const DividerThemeData(
      color: Colors.black12,
      thickness: 1,
      space: 16,
    ),

    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      error: errorColor,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
    ),
  );
}

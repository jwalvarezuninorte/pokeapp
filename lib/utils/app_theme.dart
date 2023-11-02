import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryLight = Color(0xFFFAFAFA);
  static const Color primary = Color.fromARGB(255, 223, 124, 19);
  static const Color primaryDak = Color(0xff242424);
  static const Color secondary = Color.fromARGB(255, 241, 245, 25);

  // Padding, margin, etc
  static const double padding = 20;
  static const double radius = 12;

  // TextTheme
  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primaryDak,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryDak,
  );

  static TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: primaryDak.withOpacity(0.4),
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: AppTheme.primaryLight,
    appBarTheme: const AppBarTheme(
      color: Colors.black87,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white60,
        size: 20,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppTheme.primary,
      size: 20,
    ),
    primaryIconTheme: const IconThemeData(
      color: AppTheme.primary,
      size: 200,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: AppTheme.primary,
        minimumSize: const Size(double.infinity, 60),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radius),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppTheme.padding),
      filled: true,
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.3),
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      prefixIconColor: Colors.white.withOpacity(0.4),
      fillColor: Colors.white.withOpacity(0.2),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.radius / 2),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.radius / 2),
        borderSide: BorderSide.none,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.primary,
        backgroundColor: AppTheme.primary.withOpacity(0.1),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // Text theme properties
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        color: AppTheme.primaryDak,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        color: AppTheme.primaryDak,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: const TextStyle(
        color: AppTheme.primaryDak,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: const TextStyle(
        color: AppTheme.primaryDak,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: const TextStyle(
        color: AppTheme.primaryDak,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: const TextStyle(
        color: AppTheme.primaryDak,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        color: AppTheme.primaryDak,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: const TextStyle(
        color: AppTheme.primaryDak,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryDak.withOpacity(0.6),
      ),
    ),
  );
}

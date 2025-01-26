import 'package:flutter/material.dart';

class AppColors {
  static final Color background = Colors.grey[100]!;
  static const Color primary = Color(0xFF1F35FF);
  static final Color secondary = Colors.blue.withOpacity(0.1);

  static const Color light = Colors.white;

  static const Color primaryText = Colors.black;
  static const Color secondaryText = Colors.grey;
  static const Color lightText = Colors.white;
}

class AppTheme {
  static final ThemeData lightTheme = generateTheme(
    backgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    primaryTextColor: AppColors.primaryText,
  );

  static ThemeData generateTheme({
    required Color backgroundColor,
    required Color primaryColor,
    required Color primaryTextColor,
  }) {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: primaryTextColor,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: backgroundColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      ),
      iconTheme: IconThemeData(color: primaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: backgroundColor, // Non-elevated buttons
        textTheme: ButtonTextTheme.primary,
      ),
      cardTheme: CardTheme(
        color: backgroundColor,
        elevation: 2,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: backgroundColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(primaryColor),
        checkColor: WidgetStateProperty.all(backgroundColor),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(primaryColor),
        trackColor: WidgetStateProperty.all(primaryColor.withOpacity(0.5)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(primaryColor),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: primaryTextColor,
        ),
        displayMedium: TextStyle(
          color: primaryTextColor,
        ),
        displaySmall: TextStyle(
          color: primaryTextColor,
        ),
        headlineLarge: TextStyle(
          color: primaryTextColor,
        ),
        headlineMedium: TextStyle(
          color: primaryTextColor,
        ),
        headlineSmall: TextStyle(
          color: primaryTextColor,
        ),
        titleLarge: TextStyle(
          color: primaryTextColor,
        ),
        titleMedium: TextStyle(
          color: primaryTextColor,
        ),
        titleSmall: TextStyle(
          color: primaryTextColor,
        ),
        bodyLarge: TextStyle(
          color: primaryTextColor,
        ),
        bodyMedium: TextStyle(
          color: primaryTextColor,
        ),
        bodySmall: TextStyle(
          color: primaryTextColor,
        ),
        labelLarge: TextStyle(
          color: primaryTextColor,
        ),
        labelMedium: TextStyle(
          color: primaryTextColor,
        ),
        labelSmall: TextStyle(
          color: primaryTextColor,
        ),
      ),
    );
  }
}

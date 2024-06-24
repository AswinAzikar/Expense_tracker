import 'package:flutter/material.dart';

class AppColors {
  static const Color green = Color.fromARGB(126, 165, 223, 5);
  static const Color darkBackground = Color.fromARGB(255, 18, 18, 18);
  static const Color darkText = Colors.white;
  static const Color black = Colors.black;
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.green,
    hintColor: AppColors.black,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      buttonColor: AppColors.black,
      // textTheme: ButtonTextTheme.primary,
      disabledColor: Colors.grey,
      highlightColor: AppColors.green.withOpacity(0.2),
      splashColor: AppColors.green.withOpacity(0.2),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.green,
      onPrimary: AppColors.darkText,
      secondary: AppColors.black,
      onSecondary: AppColors.darkText,
      surface: AppColors.darkBackground,
      onSurface: AppColors.darkText,
      onError: AppColors.darkText,
      error: AppColors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.darkText,
        backgroundColor: AppColors.green, // text color
        elevation: 5, // elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // rounded corners
        ),
      ),
    ),
  );
}

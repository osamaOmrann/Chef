import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary
    ),
    textTheme: TextTheme(
      displayLarge: boldStyle(color: AppColors.black),
      displayMedium: regularStyle()
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      hintStyle: boldStyle(color: AppColors.grey, fontSize: 16)
    )
  );
}
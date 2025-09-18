import 'package:flutter/material.dart';

class AppTheme {
  static Color kTertiary(BuildContext context) =>
      ColorScheme.of(context).tertiary;

  static TextStyle kTitleLarge(BuildContext context) =>
      TextTheme.of(context).titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 2,
      );

  static TextStyle get kTextStyle => const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kLabelStyle(BuildContext context) => TextStyle(
    color: kTertiary(context),
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  );

  static ThemeData themeData(BuildContext context) => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    appBarTheme: AppBarThemeData(
      centerTitle: true,
      titleTextStyle: kTitleLarge(context).copyWith(letterSpacing: 1),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        textStyle: kTitleLarge(context),
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
        backgroundColor: kTertiary(context),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
    ),
  );
}

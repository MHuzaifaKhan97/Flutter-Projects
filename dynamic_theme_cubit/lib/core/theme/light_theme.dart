import 'package:dynamic_theme_cubit/core/constants/colors.dart';
import 'package:dynamic_theme_cubit/core/constants/styles.dart';
import 'package:flutter/material.dart';

ThemeData lightAppTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: primaryColor,
  primaryColorLight: primaryLightColor,
  indicatorColor: primaryLightColor,
  secondaryHeaderColor: const Color(0xFF4794FF),
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  shadowColor: Colors.grey[300],
  hintColor: const Color(0xFF25282D),
  cardColor: Colors.white,
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xFF334257)),
    titleSmall: const TextStyle(color: Color(0xFF25282D)),
    displayMedium:
        const TextStyle(color: Color(0xFFE84D4F), fontWeight: FontWeight.bold)
            .copyWith(fontSize: 10),
    displaySmall: const TextStyle(color: Color(0xFF25282D)),
  ),
  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(color: black),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFFF8F9FA))),
  appBarTheme: appbarThemeLight,
  sliderTheme: sliderTheme,
  scaffoldBackgroundColor: white,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFdcb247),
    secondary: Color(0xFFEBEBEB),
  )
      .copyWith(background: const Color(0xFFF8F9FA))
      .copyWith(error: const Color(0xFFE84D4F)),
);

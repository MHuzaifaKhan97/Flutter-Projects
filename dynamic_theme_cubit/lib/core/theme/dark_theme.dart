import 'package:dynamic_theme_cubit/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkAppTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: primaryColor,
    primaryColorLight: primaryLightColor,
    indicatorColor: primaryLightColor,
    secondaryHeaderColor: const Color(0xFFbfdeff),
    disabledColor: const Color(0xffa2a7ad),
    brightness: Brightness.dark,
    hintColor: const Color(0xFFe4e8ef),
    shadowColor: Colors.black.withOpacity(0.4),
    cardColor: const Color(0xFF212326),
    textTheme: TextTheme(
      titleLarge: const TextStyle(color: Color(0xFF8e9fb9)),
      titleSmall: const TextStyle(color: Color(0xFFe4e8ef)),
      displayMedium: const TextStyle(
              color: Color(0xFFe4e8ef), fontWeight: FontWeight.normal)
          .copyWith(fontSize: 22),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: const Color(0xFFcda335))),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0x4D334257)),
    colorScheme: const ColorScheme.dark(
            primary: Color(0xFFcda335), secondary: Color(0xFFcda335))
        .copyWith(background: const Color(0xFF000000))
        .copyWith(error: const Color(0xFFdd3135)));

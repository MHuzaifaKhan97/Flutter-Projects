import 'package:dynamic_theme_cubit/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const appbarThemeLight = AppBarTheme(
  elevation: 0.0,
  backgroundColor: white,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
);
const appbarThemeDark = AppBarTheme(
  elevation: 0.0,
  backgroundColor: blackBg,
  systemOverlayStyle: SystemUiOverlayStyle.light,
);

const sliderTheme = SliderThemeData(
  showValueIndicator: ShowValueIndicator.always,
  rangeValueIndicatorShape: RectangularRangeSliderValueIndicatorShape(),
  valueIndicatorColor: white,
  valueIndicatorTextStyle: TextStyle(color: black),
);

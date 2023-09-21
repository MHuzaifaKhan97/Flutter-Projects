import 'package:dynamic_theme_cubit/data/services/app_preferences.dart';
import 'package:dynamic_theme_cubit/data/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(super.initialState);

  final prefs = getIt<AppPrefrences>();

  changeTheme(bool val) {
    if (prefs.isDark()) {
      prefs.saveThemeMode(false);
      emit(ThemeMode.light);
    } else {
      prefs.saveThemeMode(true);
      emit(ThemeMode.dark);
    }
  }
}

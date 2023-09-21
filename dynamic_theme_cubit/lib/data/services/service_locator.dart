import 'package:dynamic_theme_cubit/data/logic/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences.dart';

final getIt = GetIt.instance;

setupLocator() async {
  Stopwatch stopwatch = Stopwatch()..start();

  await initSetup();

  developer.log('Locator setup took ${stopwatch.elapsedMilliseconds} ms');
  stopwatch.stop();
}

initSetup() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppPrefrences>(() => AppPrefrencesImpl(prefs));

  final isDark = getIt<AppPrefrences>().isDark();
  if (!GetIt.I.isRegistered<ThemeCubit>()) {
    getIt.registerLazySingleton<ThemeCubit>(
        () => ThemeCubit(isDark ? ThemeMode.dark : ThemeMode.light));
  }
}

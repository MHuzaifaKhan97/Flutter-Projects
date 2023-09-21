import 'package:dynamic_theme_cubit/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPrefrences {
  Future<void> saveThemeMode(bool isDark);
  bool isDark();
}

class AppPrefrencesImpl extends AppPrefrences {
  final SharedPreferences _prefs;
  AppPrefrencesImpl(this._prefs);
  @override
  bool isDark() {
    return _prefs.getBool(AppConstants.darkTheme) ?? false;
  }

  @override
  Future<void> saveThemeMode(bool isDark) async {
    await _prefs.setBool(AppConstants.darkTheme, isDark);
  }
}

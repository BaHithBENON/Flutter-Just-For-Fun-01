import 'package:get_storage/get_storage.dart';

import '../variables/enums.dart';

class ThemeConfig {
  static var themeData = GetStorage('Theme');
  static AppThemeMode getActualThemeMode() {
    themeData.writeIfNull('theme_mode', AppThemeMode.Light.value);
    if (themeData.read('theme_mode') == AppThemeMode.Light.value) {
      return AppThemeMode.Light;
    } else {
      return AppThemeMode.Dark;
    }
  }

  static void changeMode(AppThemeMode mode) {
    themeData.write('theme_mode', mode.value);
  }
}

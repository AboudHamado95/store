
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/config/themes/themes.dart';

import '../../core/constants/xo_constants.dart';

class ThemeCacheHelper {
  Future<void> cacheThemeIndex(int themeIndex) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("THEME_INDEX", themeIndex);
  }

  Future<int> getCachedThemeIndex() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedThemeIndex = sharedPreferences.getInt("THEME_INDEX") ??
          StoreConstants.appDefaultTheme;
    return cachedThemeIndex;
  }

  Future<ThemeType> getSelectedThemeType() async {
    int selectedValue = await getCachedThemeIndex();
    if (selectedValue == 1) {
      return ThemeType.xoDark;
    } else {
      return ThemeType.xoLight; // set your default value here
    }
  }
}

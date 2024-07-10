import 'package:shared_preferences/shared_preferences.dart';
class FontSizeCacheHelper {
  Future<void> cacheFontSizeIndex(int themeIndex) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("FONT_SIZE_INDEX", themeIndex);
  }
  Future<int> getCachedFontSizeIndex() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedFontSizeIndex = sharedPreferences.getInt("FONT_SIZE_INDEX");
    if (cachedFontSizeIndex != null) {
      return cachedFontSizeIndex;
    } else {
      return 1;
    }
  }
}
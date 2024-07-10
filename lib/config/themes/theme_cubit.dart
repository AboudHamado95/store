
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:store_app/config/themes/theme_cacher_helper.dart';
import 'package:store_app/config/themes/themes.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  AppTheme globalAppTheme = appThemeData[ThemeType.xoLight]!;
  ThemeType themeType = ThemeType.xoLight;

  Future<void> getCurrentTheme() async {
    final themeIndex = await ThemeCacheHelper().getCachedThemeIndex();
    themeType =
        ThemeType.values.firstWhere((appTheme) => appTheme.index == themeIndex);
    globalAppTheme = appThemeData[themeType]!;
    emit(ThemeLoadedState(
        theme: appThemeData[themeType]!.themeData,
        globalAppTheme: globalAppTheme));
  }

  Future<void> themeChanged({required ThemeType themeType}) async {
    final themeIndex = themeType.index;
    await ThemeCacheHelper().cacheThemeIndex(themeIndex);
    globalAppTheme = appThemeData[themeType]!;
    this.themeType = themeType;
    emit(ThemeLoadedState(
        theme: appThemeData[themeType]!.themeData,
        globalAppTheme: globalAppTheme));
  }

}

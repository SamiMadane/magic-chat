import 'package:flutter/material.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';

class ThemeService {
  static const _keyTheme = 'app_theme'; // 'light', 'dark', 'system'

  Future<String> getAppTheme() async {
    final theme = await SharedPrefHelper.getString(_keyTheme);
    return theme.isEmpty ? 'system' : theme;
  }

  Future<void> setAppTheme(String theme) async {
    await SharedPrefHelper.setData(_keyTheme, theme);
  }

  Future<ThemeMode> getThemeMode() async {
    final theme = await getAppTheme();
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}

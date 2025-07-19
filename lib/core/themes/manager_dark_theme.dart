import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/resourses/manager_text_theme_dark.dart';

ThemeData managerDarkThemeData() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: ColorsManager.primaryColor,
    surface: ColorsManager.backgroundDark,
    onSurfaceVariant: ColorsManager.whiteInDark,
    brightness: Brightness.dark,
  );
  return ThemeData.from(
    colorScheme: colorScheme,
    textTheme: ManagerTextThemeDark(),
  ).copyWith(
    scaffoldBackgroundColor: ColorsManager.backgroundDark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: ColorsManager.backgroundDark,
      foregroundColor: ColorsManager.whiteInDark,
      titleTextStyle: getBoldTextStyle(
        fontSize: FontSizeManager.s16,
        color: ColorsManager.whiteInDark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

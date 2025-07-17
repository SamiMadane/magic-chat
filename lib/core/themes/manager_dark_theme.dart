import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/resourses/manager_text_theme_dark.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primaryColor,
      brightness: Brightness.dark,
    ),
    textTheme: ManagerTextThemeDark(),
  ).copyWith(
    scaffoldBackgroundColor: ColorsManager.backgroundDark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: ColorsManager.cardDark,
      foregroundColor: ColorsManager.textDark,
      titleTextStyle: getBoldTextStyle(
        fontSize: FontSizeManager.s16,
        color: ColorsManager.textDark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/manager_text_theme_light.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

ThemeData managerLightThemeData() {
  return ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primaryColor,
      brightness: Brightness.light,
    ),
    textTheme: ManagerTextThemeLight(),
  ).copyWith(
    scaffoldBackgroundColor: ColorsManager.backgroundLight,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.white,
      foregroundColor: ColorsManager.primaryColor,
      elevation: 0,
      titleTextStyle: getBoldTextStyle(
        fontSize: FontSizeManager.s16,
        color: ColorsManager.primaryColor,
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

import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/manager_text_theme_light.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

ThemeData managerLightThemeData() {
  final colorScheme = ColorScheme.fromSeed(
  seedColor: ColorsManager.primaryColor,
  surface: ColorsManager.backgroundLight,
  onSurfaceVariant: ColorsManager.moreGray,
  brightness: Brightness.light,
);
  return ThemeData.from(
    colorScheme: colorScheme,
    
    textTheme: ManagerTextThemeLight(),
  ).copyWith(
    scaffoldBackgroundColor: ColorsManager.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.backgroundLight,
      foregroundColor: colorScheme.primary,
      elevation: 0,
      titleTextStyle: getBoldTextStyle(
        fontSize: FontSizeManager.s16,
        color: colorScheme.primary,
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

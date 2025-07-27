import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/custom_shadows.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/manager_text_theme_light.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
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
    cardColor: ColorsManager.cardLight,
    cardTheme: CardThemeData(
      color: ColorsManager.cardLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusManager.r12),
        // لا حاجة لإضافة border في light
      ),
      elevation: 3,
      shadowColor: ColorsManager.shadowColorLight,
    ),
    extensions: <ThemeExtension<dynamic>>[
      CustomShadows(
        bottomNavShadow: [
          BoxShadow(
            color: ColorsManager.shadowColorLight,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
    ],
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
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

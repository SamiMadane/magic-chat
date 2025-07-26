import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/custom_shadows.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
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
    cardColor: ColorsManager.cardDark,
    cardTheme: CardThemeData(
      color: ColorsManager.cardDark,
      elevation: 3,
      shadowColor: ColorsManager.shadowColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusManager.r12),
        side: BorderSide(color: ColorsManager.moreGray.withOpacity(0.15)),
      ),
    ),
     extensions: <ThemeExtension<dynamic>>[
      CustomShadows(
        bottomNavShadow: [
          BoxShadow(
            color: ColorsManager.shadowColorDark,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
    ],
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
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

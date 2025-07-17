import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

TextTheme ManagerTextThemeLight() {
  return TextTheme(
    displayLarge: getBoldTextStyle(
      fontSize: FontSizeManager.s24,
      color: ColorsManager.textLight,
    ), // للعناوين الرئيسية
    displayMedium: getBoldTextStyle(
      fontSize: FontSizeManager.s20,
      color: ColorsManager.textLight,
    ),
    displaySmall: getSemiBoldTextStyle(
      fontSize: FontSizeManager.s18,
      color: ColorsManager.textLight,
    ),
    headlineMedium: getMediumTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.textLight,
    ),
    headlineSmall: getRegularTextStyle(
      fontSize: FontSizeManager.s14,
      color: ColorsManager.textLight,
    ),
    titleMedium: getMediumTextStyle(
      fontSize: FontSizeManager.s14,
      color: ColorsManager.textLight,
    ),
    bodyLarge: getRegularTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.textLight,
    ),
    bodyMedium: getRegularTextStyle(
      fontSize: FontSizeManager.s14,
      color: ColorsManager.textLight,
    ),
    labelLarge: getMediumTextStyle(
      fontSize: FontSizeManager.s12,
      color: ColorsManager.textLight,
    ), // للأزرار أو التسميات الصغيرة
  );
}

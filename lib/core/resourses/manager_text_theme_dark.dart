import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

TextTheme ManagerTextThemeDark() {
  return TextTheme(
    displayMedium: getMediumTextStyle(
      fontSize: FontSizeManager.s20,
      color: ColorsManager.textDark,
    ),
    displaySmall: getBoldTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.textDark,
    ),
    headlineMedium: getMediumTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.textDark,
    ),
    headlineSmall: getRegularTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.textDark,
    ),
    titleMedium: getMediumTextStyle(
      fontSize: FontSizeManager.s14,
      color: ColorsManager.textDark,
    ),
    bodyLarge: getRegularTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.textDark,
    ),
  );
}

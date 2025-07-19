import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/colors_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

TextTheme ManagerTextThemeDark() {
  return TextTheme(
    displayMedium: getMediumTextStyle(
      fontSize: FontSizeManager.s20,
      color: ColorsManager.whiteInDark,
    ),
    displaySmall: getBoldTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.whiteInDark,
    ),
    headlineMedium: getMediumTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.whiteInDark,
    ),
    headlineSmall: getRegularTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.whiteInDark,
    ),
    titleMedium: getMediumTextStyle(
      fontSize: FontSizeManager.s14,
      color: ColorsManager.whiteInDark,
    ),
    bodyLarge: getRegularTextStyle(
      fontSize: FontSizeManager.s16,
      color: ColorsManager.whiteInDark,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/assets_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

class LogoHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const LogoHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetsManager.appIcon,
          height: HeightManager.h140,
          width: WidthManager.w140,
        ),
        SizedBox(height: HeightManager.h24),
        Text(
          title,
          style: getBoldTextStyle(
            fontSize: FontSizeManager.s16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: HeightManager.h8),
        Text(
          subtitle,
          style: getMediumTextStyle(
            fontSize: FontSizeManager.s14,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

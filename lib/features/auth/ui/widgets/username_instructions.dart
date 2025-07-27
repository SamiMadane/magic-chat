import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

class UsernameInstructions extends StatelessWidget {
  const UsernameInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text('auth.user_name.username_instructions'.tr(),
            style: getBoldTextStyle(
              fontSize: FontSizeManager.s16,
              color: theme.colorScheme.primary,
            )),
        SizedBox(height: HeightManager.h8),
        Text(
          'auth.user_name.username_instructions_description'.tr(),
          style: getMediumTextStyle(
            fontSize: FontSizeManager.s14,
            color: theme.colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

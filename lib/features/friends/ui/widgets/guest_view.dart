import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/widgets/custom_button.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/core/helpers/extensions.dart';

class GuestView extends StatelessWidget {
  final ColorScheme colorScheme;

  const GuestView({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: WidthManager.w32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة القفل مع خلفية دائرية مع ظل خفيف
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.primary.withOpacity(0.1),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              padding: EdgeInsets.all(24),
              child: Icon(
                Icons.lock_outline,
                size: 96,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: HeightManager.h30),
            Text(
              'friends.guest.lockTitle'.tr(),
              style: getBoldTextStyle(
                fontSize: FontSizeManager.s22,
                color: colorScheme.onSurface,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: HeightManager.h12),
            Text(
              'friends.guest.lockSubtitle'.tr(),
              textAlign: TextAlign.center,
              style: getRegularTextStyle(
                fontSize: FontSizeManager.s16,
                color: colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
            SizedBox(height: HeightManager.h36),
            CustomButton(
              label:'friends.guest.loginButton'.tr(),
              onPressed: () => context.pushNamed(Routes.phoneInputScreen),
              type: ButtonType.elevated,
              icon: Icons.login,
              textStyle: getMediumTextStyle(
                fontSize: FontSizeManager.s16,
                color: colorScheme.onPrimary,
              ),
              padding: EdgeInsets.symmetric(vertical: HeightManager.h16),
              
            ),
          ],
        ),
      ),
    );
  }
}

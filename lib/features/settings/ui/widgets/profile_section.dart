import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/core/widgets/profile_avatar.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';
import 'package:magicchat/core/widgets/custom_button.dart';

class ProfileSection extends StatelessWidget {
  final bool isLoggedIn;
  final UserModel? user;

  const ProfileSection({
    super.key,
    required this.isLoggedIn,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ProfileAvatar(
          imageUrl: user?.imageUrl,
          username: user?.username ?? 'settings.guest'.tr(),
          radius: RadiusManager.r50,
        ),
        SizedBox(height: HeightManager.h12),
        Text(
          isLoggedIn ? user!.username : 'settings.guest'.tr(),
          style: getSemiBoldTextStyle(
            fontSize: FontSizeManager.s15,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: HeightManager.h4),
        if (isLoggedIn)
          Text(
            user!.phone,
            style: getMediumTextStyle(
              fontSize: FontSizeManager.s12,
              color: theme.colorScheme.onSurface,
            ),
          ),
        SizedBox(height: HeightManager.h12),
        CustomButton(
          type: ButtonType.outlined,
          icon: isLoggedIn ? Icons.edit : Icons.login,
          label:
              isLoggedIn ? 'settings.edit_profile'.tr() : 'settings.login'.tr(),
          onPressed: () {
            context.pushNamed(
              isLoggedIn ? Routes.editProfileScreen : Routes.phoneInputScreen,
              arguments:
                  isLoggedIn ? {'isLoggedIn': isLoggedIn, 'user': user} : null,
            );
          },
          textStyle: getMediumTextStyle(
            fontSize: FontSizeManager.s13,
            color: Theme.of(context).colorScheme.primary,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/home/data/model/user_model.dart';

class ProfileSection extends StatelessWidget {
  final bool isLoggedIn;
  final UserModel? user;

  const ProfileSection({
    super.key,
    required this.isLoggedIn,
    this.user,
  });

  static const String defaultImage = 'https://cdn-icons-png.flaticon.com/512/149/149071.png';

  String get _profileImageUrl {
    if (isLoggedIn && user?.imageUrl?.isNotEmpty == true) {
      return user!.imageUrl!;
    }
    return defaultImage;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        CircleAvatar(
          radius: RadiusManager.r50,
          backgroundImage: NetworkImage(_profileImageUrl),
        ),
        SizedBox(height: HeightManager.h12),
        Text(
          isLoggedIn ? user!.username : 'Guest',
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
        OutlinedButton.icon(
          onPressed: () {
            context.pushNamed(
              isLoggedIn ? Routes.settingsScreen : Routes.phoneInputScreen,
              arguments: isLoggedIn ? {'isLoggedIn': isLoggedIn, 'user': user} : null,
            );
          },
          icon: Icon(isLoggedIn ? Icons.person : Icons.login),
          label: Text(
            isLoggedIn ? 'settings.profile'.tr() : 'settings.login'.tr(),
            style: getMediumTextStyle(
              fontSize: FontSizeManager.s13,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

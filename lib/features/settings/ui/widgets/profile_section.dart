import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/custom_shimmer_theme.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';
import 'package:magicchat/core/widgets/custom_button.dart';
import 'package:shimmer/shimmer.dart';

class ProfileSection extends StatelessWidget {
  final bool isLoggedIn;
  final UserModel? user;

  const ProfileSection({
    super.key,
    required this.isLoggedIn,
    this.user,
  });

  static const String defaultImage =
      'https://cdn-icons-png.flaticon.com/512/149/149071.png';

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
          backgroundColor: theme.colorScheme.surface,
          backgroundImage: null, // نحذف NetworkImage
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: _profileImageUrl,
              width: RadiusManager.r50 * 2,
              height: RadiusManager.r50 * 2,
              fit: BoxFit.cover,
              placeholder: (context, url) => _buildShimmerLoading(context),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
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

Widget _buildShimmerLoading(BuildContext context) {
  final shimmerTheme = Theme.of(context).extension<CustomShimmerTheme>()!;

  return Shimmer.fromColors(
    baseColor: shimmerTheme.baseColor,
    highlightColor: shimmerTheme.highlightColor,
    child: CircleAvatar(
      radius: RadiusManager.r50,
      backgroundColor: shimmerTheme.baseColor,
    ),
  );
}

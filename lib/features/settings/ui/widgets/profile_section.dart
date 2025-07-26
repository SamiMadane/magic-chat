import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/features/home/data/model/user_model.dart';

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
    final defaultImage = 'https://cdn-icons-png.flaticon.com/512/149/149071.png';

    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.primary,
          backgroundImage: NetworkImage(
            isLoggedIn && user?.imageUrl != null && user!.imageUrl!.isNotEmpty
                ? user!.imageUrl!
                : defaultImage,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          isLoggedIn ? user?.username ?? 'User' : 'Guest',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        if (isLoggedIn)
          Text(
            user?.phone ?? '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () {
            // navigate to login or profile
          },
          icon: Icon(isLoggedIn ? Icons.person : Icons.login),
          label: Text(
            isLoggedIn ? 'settings.profile'.tr() : 'settings.login'.tr(),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileSection extends StatelessWidget {
  final bool isLoggedIn;
  const ProfileSection({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.primary,
           backgroundImage: isLoggedIn
              ? NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png')
              : NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),
        ),
        const SizedBox(height: 12),
        Text(
          isLoggedIn ? 'Sami Al-Madani' : 'Guest',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        if (isLoggedIn)
          Text('+123456789', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () {
            // navigate to login or profile
          },
          icon: Icon(isLoggedIn ? Icons.person : Icons.login),
          label: Text(isLoggedIn ? 'settings.profile'.tr() : 'settings.login'.tr()),
        ),
      ],
    );
  }
}

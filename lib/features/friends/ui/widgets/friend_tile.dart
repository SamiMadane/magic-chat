import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/widgets/custom_button.dart';
import 'package:magicchat/core/widgets/profile_avatar.dart'; // استورد الودجت
import 'package:magicchat/features/friends/data/model/friends_contact_model.dart';

class FriendTile extends StatelessWidget {
  final FriendsContactModel friend;
  final VoidCallback onAction;

  const FriendTile({
    super.key,
    required this.friend,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileAvatar(
        imageUrl: friend.imageUrl,
        username: friend.username,
        radius: RadiusManager.r26,
      ),
      title: Text(friend.username),
      subtitle: Text(friend.phone ?? ''),
      trailing: CustomButton(
        label: friend.isAppUser ? 'friends.chat'.tr() : 'friends.invite'.tr(),
        onPressed: onAction,
      ),
    );
  }
}

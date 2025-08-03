import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';
import 'package:easy_localization/easy_localization.dart';

class LoggedInView extends StatelessWidget {
  final List<UserModel> friends;
  final ColorScheme colorScheme;

  const LoggedInView({
    super.key,
    required this.friends,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: friends.isEmpty
            ? Center(
                child: Text(
                  'friends.loggedInView.no_conversations'.tr(),
                  textAlign: TextAlign.center,
                  style: getMediumTextStyle(
                    fontSize: FontSizeManager.s16,
                    color: colorScheme.onSurface.withOpacity(0.7),
                    height: 1.4,
                  ),
                ),
              )
            : ListView.separated(
                itemCount: friends.length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: HeightManager.h12),
                itemBuilder: (context, index) {
                  final friend = friends[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(friend.imageUrl ?? ''),
                      backgroundColor: colorScheme.surface,
                    ),
                    title: Text(
                      friend.username,
                      style: getMediumTextStyle(
                        fontSize: FontSizeManager.s16,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      'friends.loggedInView.tap_to_chat'.tr(),
                      style: getRegularTextStyle(
                        fontSize: FontSizeManager.s12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    onTap: () {
                      // TODO: Navigate to chat screen with `friend`
                    },
                  );
                },
              ),
      ),
    );
  }
}

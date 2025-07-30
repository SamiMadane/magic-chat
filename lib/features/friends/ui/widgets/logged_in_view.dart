import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';

class LoggedInView extends StatelessWidget {
  final UserModel? user;
  final ColorScheme colorScheme;

  const LoggedInView({
    super.key,
    required this.user,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, ${user?.username ?? ''} 👋',
            style: getBoldTextStyle(
              fontSize: FontSizeManager.s20,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: HeightManager.h8),
          Text(
            'Here are your friends using the app. Start chatting now!',
            style: getRegularTextStyle(
              fontSize: FontSizeManager.s14,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: HeightManager.h24),
          Expanded(
            child: Center(
              child: Text(
                'Friends list will appear here...',
                style: getMediumTextStyle(
                  fontSize: FontSizeManager.s14,
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

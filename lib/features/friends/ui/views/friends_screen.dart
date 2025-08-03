import 'package:flutter/material.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/routes/routes.dart';

import 'package:magicchat/features/friends/ui/widgets/guest_view.dart';
import 'package:magicchat/features/friends/ui/widgets/logged_in_view.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';

class FriendsScreen extends StatelessWidget {
  final bool isLoggedIn;
  final UserModel? user;

  const FriendsScreen({
    super.key,
    required this.isLoggedIn,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: isLoggedIn
          ? LoggedInView(
              colorScheme: colorScheme,
              friends: [],
            )
          : GuestView(colorScheme: colorScheme),
      floatingActionButton: isLoggedIn
          ? ClipOval(
              child: FloatingActionButton(
                onPressed: () {
                  context.pushNamed(Routes.findFriendScreen);
                },
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                child: Icon(
                  Icons.person_search,
                  size: FontSizeManager.s26,
                ),
              ),
            )
          : null,
    );
  }
}

import 'package:flutter/material.dart';

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
              user: user,
            )
          : GuestView(colorScheme: colorScheme),
    );
  }
}

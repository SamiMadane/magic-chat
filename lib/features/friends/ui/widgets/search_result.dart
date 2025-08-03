import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/service/invite_service.dart';
import 'package:magicchat/features/friends/data/model/friends_contact_model.dart';
import 'package:magicchat/features/friends/logic/cubit/friends_cubit.dart';
import 'package:magicchat/features/friends/logic/cubit/friends_state.dart';
import 'package:magicchat/features/friends/ui/widgets/friend_tile.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<FriendsCubit, FriendsState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
            child: Text(
              'friends.search.enter_number'.tr(),
              style: getRegularTextStyle(
                fontSize: FontSizeManager.s14,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (friends) => _buildResultsList(context, friends),
          error: (message) => Center(child: Text('$message')),
        );
      },
    );
  }

  Widget _buildResultsList(
      BuildContext context, List<FriendsContactModel> friends) {
    final appUsers = friends.where((f) => f.isAppUser).toList();
    final nonAppUsers = friends.where((f) => !f.isAppUser).toList();

    return ListView(
      children: [
        if (appUsers.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              'friends.search.app_users'.tr(), // جهات الاتصال في ماجيك شات
              style: getMediumTextStyle(
                fontSize: FontSizeManager.s16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          ...appUsers.map((friend) => FriendTile(
                friend: friend,
                onAction: () {
                  // TODO: افتح المحادثة
                },
              )),
        ],
        if (nonAppUsers.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              'friends.search.invite_to_app'.tr(), // دعوة لاستخدام ماجيك شات
              style: getMediumTextStyle(
                fontSize: FontSizeManager.s16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          ...nonAppUsers.map((friend) => FriendTile(
                friend: friend,
                onAction: () {
                  context.read<FriendsCubit>().inviteFriend(friend.phone!);
                },
              )),
        ],
      ],
    );
  }
}

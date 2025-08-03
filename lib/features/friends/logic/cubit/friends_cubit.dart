import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/service/invite_service.dart';
import 'package:magicchat/features/friends/data/repo/friends_repo.dart';
import 'package:magicchat/features/friends/logic/cubit/friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  final FriendsRepository friendsRepository;

  FriendsCubit(this.friendsRepository) : super(FriendsState.initial());

  void resetSearch() {
    emit(const FriendsState.initial());
  }

  Future<void> loadContacts() async {
    emit(FriendsLoading());

    try {
      final result = await friendsRepository.getContactsWithAppStatus();
      result.when(
        success: (contacts) => emit(FriendsSucess(contacts)),
        failure: (error) {
          print('error is $error');
          return emit(FriendsError(error));
        },
      );
    } catch (e) {
      print('error : $e');
      emit(FriendsError(e.toString()));
    }
  }

  Future<void> searchFriendByPhone(String phone) async {
    emit(FriendsLoading());

    try {
      final result = await friendsRepository.searchUserByPhone(phone);

      result.when(
        success: (users) {
          if (users.isNotEmpty) {
            emit(FriendsSucess(users));
          } else {
            emit(const FriendsError('No users found'));
          }
        },
        failure: (error) => emit(FriendsError(error)),
      );
    } catch (e) {
      emit(FriendsError(e.toString()));
    }
  }

  Future<void> inviteFriend(String phoneNumber) async {
  try {
    await InviteService.sendInviteSms(phoneNumber);
  } catch (e) {
    print('Error sending invite SMS: $e');
  }
}
}

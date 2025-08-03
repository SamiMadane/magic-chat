import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:magicchat/features/friends/data/model/friends_contact_model.dart';
part 'friends_state.freezed.dart';

@freezed
class FriendsState with _$FriendsState {
  const factory FriendsState.initial() = _FriendsInitial;

  const factory FriendsState.loading() = FriendsLoading;

  const factory FriendsState.success(List<FriendsContactModel> friends) =
      FriendsSucess;

  const factory FriendsState.error(String message) = FriendsError;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';

part 'edit_profile_state.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _ProfileInitial;
  const factory EditProfileState.loading() = ProfileLoading;
  const factory EditProfileState.success(UserModel user) = ProfileSuccess;
  const factory EditProfileState.error(String message) = ProfileError;
  const factory EditProfileState.updateSuccess() = UpdateSuccess;
}

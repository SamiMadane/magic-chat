import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';
part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _SettingsInitial;
  const factory SettingsState.loading() = SettingsLoading;
  const factory SettingsState.success({
    required UserModel? user,
    required String theme,
    required String locale,
  }) = SettingsSuccess;
  const factory SettingsState.error(String error) = SettingsError;
}

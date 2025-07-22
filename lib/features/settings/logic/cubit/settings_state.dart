
import 'package:freezed_annotation/freezed_annotation.dart';
part 'settings_state.freezed.dart';


@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _SettingsInitial;
    const factory SettingsState.settingsLoading() = SettingsLoading;
  const factory SettingsState.settingsSuccess({required String theme,required String locale}) =
      SettingsSuccess;
  const factory SettingsState.settingsError(String error) = SettingsError;
}

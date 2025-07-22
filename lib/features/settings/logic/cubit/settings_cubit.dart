import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/core/service/theme_service.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_state.dart';


class SettingsCubit extends Cubit<SettingsState> {
  final ThemeService _themeService;

  SettingsCubit(this._themeService) : super(SettingsState.initial());

  Future<void> loadSettings() async {
  emit(SettingsLoading());
  try {
    final theme = await _themeService.getAppTheme();
    final locale = await SharedPrefHelper.getLocale();
    print('Loaded theme: $theme, locale: $locale');
    emit(SettingsSuccess(theme: theme, locale: locale));
  } catch (e) {
    print('Error loading settings: $e');
    emit(SettingsError('Failed to load settings'));
  }
}

 Future<void> changeTheme(String theme) async {
  final currentState = state;
  final currentTheme = currentState is SettingsSuccess ? currentState.theme : null;
  
  if (theme != currentTheme) {
    await _themeService.setAppTheme(theme);
    final locale = await SharedPrefHelper.getLocale();
    print('Theme changed to $theme');
    emit(SettingsSuccess(theme: theme, locale: locale));
  } else {
    print('Theme did not change, skipping emit');
  }
}


  Future<void> changeLocale(String localeCode, BuildContext context) async {
    await SharedPrefHelper.setLocale(localeCode);
    await context.setLocale(Locale(localeCode));
    final theme = await _themeService.getAppTheme();
    emit(SettingsSuccess(theme: theme, locale: localeCode));
  }
}

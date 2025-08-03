import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/core/service/theme_service.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_state.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';
import 'package:magicchat/features/user/data/repo/user_repo.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final ThemeService _themeService;
  final UserRepository userRepository;

  SettingsCubit(this._themeService, this.userRepository)
      : super(const SettingsState.initial());

  /// دالة لتحميل كل البيانات معاً (ثيم، لغة، بيانات المستخدم)
  Future<void> loadAll() async {
    emit(const SettingsState.loading());

    try {
      final theme = await _themeService.getAppTheme();
      final locale = await SharedPrefHelper.getLocale();

      // تحقق أولًا إذا كان هناك رقم محفوظ، إذا لا، نعتبره Guest
      final phone = await SharedPrefHelper.getString('user_phone');
      // ignore: unnecessary_null_comparison
      if (phone.isEmpty || phone == null) {
        emit(SettingsState.success(user: null, theme: theme, locale: locale));
        return;
      }

      final userResult = await userRepository.getUserDataByPhone().first;

      UserModel? user;
      String? error;

      userResult.when(
        success: (u) => user = u,
        failure: (e) => error = e,
      );

      if (error != null) {
        emit(SettingsState.error(error!));
        return;
      }

      emit(SettingsState.success(user: user, theme: theme, locale: locale));
    } catch (e) {
      emit(SettingsState.error('errors.unexpected'.tr()));
    }
  }

  Future<void> changeTheme(String theme) async {
    final currentState = state;
    if (currentState is SettingsSuccess && theme == currentState.theme) {
      return; // لا تغيير
    }

    await _themeService.setAppTheme(theme);
    final locale = await SharedPrefHelper.getLocale();

    UserModel? currentUser;
    if (state is SettingsSuccess) {
      currentUser = (state as SettingsSuccess).user;
    }

    emit(
        SettingsState.success(user: currentUser, theme: theme, locale: locale));
  }

  Future<void> changeLocale(String localeCode, BuildContext context) async {
    await SharedPrefHelper.setLocale(localeCode);
    await context.setLocale(Locale(localeCode));
    final theme = await _themeService.getAppTheme();

    UserModel? currentUser;
    if (state is SettingsSuccess) {
      currentUser = (state as SettingsSuccess).user;
    }

    emit(SettingsState.success(
        user: currentUser, theme: theme, locale: localeCode));
  }
}

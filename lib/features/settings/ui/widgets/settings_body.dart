import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';
import 'package:magicchat/features/settings/ui/widgets/language_setting_tile.dart';
import 'package:magicchat/features/settings/ui/widgets/profile_section.dart';
import 'package:magicchat/features/settings/ui/widgets/settings_group.dart';
import 'package:magicchat/features/settings/ui/widgets/theme_setting_tile.dart';
class SettingsBody extends StatelessWidget {
  final bool isLoggedIn;
  final UserModel? user;
  final String theme;
  final String locale;

  const SettingsBody({
    super.key,
    required this.isLoggedIn,
    required this.user,
    required this.theme,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        ProfileSection(isLoggedIn: isLoggedIn, user: user),
        SizedBox(height: HeightManager.h30),
        SettingsGroup(
          title: 'settings.general'.tr(),
          children: [
            ThemeSettingTile(currentTheme: theme),
            LanguageSettingTile(currentLocale: locale),
          ],
        ),
        if (isLoggedIn)
          SettingsGroup(
            title: 'settings.account'.tr(),
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text('settings.logout'.tr()),
                onTap: () {
                  context.read<AuthCubit>().logout().then((_) {
                    context.pushReplacementNamed(Routes.homeScreen);
                  });
                },
              ),
            ],
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/home/data/model/user_model.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_state.dart';
import 'package:magicchat/features/settings/ui/widgets/language_setting_tile.dart';
import 'package:magicchat/features/settings/ui/widgets/profile_section.dart';
import 'package:magicchat/features/settings/ui/widgets/settings_group.dart';
import 'package:magicchat/features/settings/ui/widgets/theme_setting_tile.dart';

class SettingsScreen extends StatefulWidget {
  final bool isLoggedIn;
  final UserModel? user;

  const SettingsScreen({
    super.key,
    required this.isLoggedIn,
    required this.user,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    isLoggedIn = widget.isLoggedIn;
    context.read<SettingsCubit>().loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    final _ = context.locale;
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr()),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SettingsError) {
            return Center(child: Text(state.error));
          }

          if (state is SettingsSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                ProfileSection(isLoggedIn: isLoggedIn, user: widget.user),
                const SizedBox(height: 30),
                SettingsGroup(
                  title: 'settings.general'.tr(),
                  children: [
                    ThemeSettingTile(currentTheme: state.theme),
                    LanguageSettingTile(currentLocale: state.locale),
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
                            context.pushReplacementNamed(
                              Routes.homeScreen,
                            );
                          });
                        },
                      ),
                    ],
                  ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

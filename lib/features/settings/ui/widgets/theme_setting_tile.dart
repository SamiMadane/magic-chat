import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';

class ThemeSettingTile extends StatelessWidget {
  final String currentTheme;
  const ThemeSettingTile({super.key, required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();

    return ListTile(
      leading: const Icon(Icons.brightness_6),
      title: Text('settings.theme_mode'.tr()),
      trailing: SizedBox(
        width: WidthManager.w100,
        child: DropdownButtonFormField2<String>(
          value: currentTheme,
          isExpanded: true,
          dropdownStyleData: DropdownStyleData(
            width: WidthManager.w100,
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            border: InputBorder.none,
          ),
          items: [
            DropdownMenuItem(
                value: 'light', child: Text('settings.theme.light'.tr())),
            DropdownMenuItem(
                value: 'dark', child: Text('settings.theme.dark'.tr())),
            DropdownMenuItem(
                value: 'system', child: Text('settings.theme.system'.tr())),
          ],
          onChanged: (value) {
            if (value != null) {
              cubit.changeTheme(value);
            }
          },
        ),
      ),
    );
  }
}

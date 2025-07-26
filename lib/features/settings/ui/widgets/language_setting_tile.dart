import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';

class LanguageSettingTile extends StatelessWidget {
  final String currentLocale;
  const LanguageSettingTile({super.key, required this.currentLocale});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();

    return ListTile(
      leading: const Icon(Icons.language),
      title: Text('settings.language'.tr()),
      trailing: SizedBox(
        width: WidthManager.w100,
        child: DropdownButtonFormField2<String>(
          value: currentLocale,
          isExpanded: true,
          dropdownStyleData: DropdownStyleData(
            width: WidthManager.w100,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: WidthManager.w8),
            border: InputBorder.none,
          ),
          items: const [
            DropdownMenuItem(value: 'en', child: Text('English')),
            DropdownMenuItem(value: 'ar', child: Text('العربية')),
          ],
          onChanged: (value) {
            if (value != null) {
              cubit.changeLocale(value, context);
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
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
      trailing: DropdownButton<String>(
        value: currentLocale,
        underline: const SizedBox(),
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
    );
  }
}

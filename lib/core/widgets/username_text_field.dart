import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/helpers/app_regex.dart';

class UsernameTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoValidate;

  const UsernameTextField({
    super.key,
    required this.controller,
    required this.autoValidate,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'auth.user_name.label_username'.tr(),
        prefixIcon: const Icon(Icons.person),
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return 'auth.user_name.username_required'.tr();
        }
        if (trimmedValue.length < 3) {
          return 'auth.user_name.username_too_short'.tr(args: ['3']);
        }
        if (!AppRegex.isUsernameValid(trimmedValue)) {
          return 'auth.user_name.username_invalid'.tr();
        }
        return null;
      },
    );
  }
}

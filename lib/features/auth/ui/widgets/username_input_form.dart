import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/helpers/app_regex.dart';

class UsernameInputForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final bool autoValidate;

  const UsernameInputForm({
    super.key,
    required this.formKey,
    required this.controller,
    required this.autoValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode:
          autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'auth.user_name.label_username'.tr(),
          prefixIcon: const Icon(Icons.person),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
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
      ),
    );
  }
}

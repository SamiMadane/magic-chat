import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeInput extends StatelessWidget {
  final String sentOtpCode;
  final void Function(String) onCompleted;

  const OtpCodeInput({
    super.key,
    required this.sentOtpCode,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PinCodeTextField(
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      autoFocus: true,
      cursorColor: theme.colorScheme.primary,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 50,
        fieldWidth: 45,
        activeFillColor: Colors.white,
        inactiveColor: Colors.grey,
        selectedColor: theme.colorScheme.primary,
      ),
      onChanged: (_) {},
      onCompleted: (value) {
        if (value.trim() != sentOtpCode) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('auth.error_incorrect_otp'.tr()),
              backgroundColor: Colors.redAccent,
            ),
          );
          return;
        }
        onCompleted(value);
      },
    );
  }
}

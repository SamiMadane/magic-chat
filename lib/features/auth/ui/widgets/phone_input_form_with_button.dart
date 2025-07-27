import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/widgets/custom_button.dart';

class PhoneInputFormWithButton extends StatefulWidget {
  final Function(String fullPhoneNumber) onValidSubmit;

  const PhoneInputFormWithButton({super.key, required this.onValidSubmit});

  @override
  State<PhoneInputFormWithButton> createState() =>
      _PhoneInputFormWithButtonState();
}

class _PhoneInputFormWithButtonState extends State<PhoneInputFormWithButton> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String countryCode = '+970';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: IntlPhoneField(
            initialCountryCode: 'PS',
            decoration:  InputDecoration(
              labelText: 'auth.phone_input.label_phone_number'.tr(),
              border: OutlineInputBorder(),
            ),
            onChanged: (phone) {
              setState(() {
                countryCode = phone.countryCode;
                phoneNumber = phone.number.trim();
              });
            },
            validator: (phone) {
              if (phone == null || phone.number.trim().isEmpty) {
                return 'auth.phone_input.validation_enter_phone'.tr();
              }
              return null;
            },
          ),
        ),
        SizedBox(height: HeightManager.h30),
        SizedBox(
          width: double.infinity,
          height: HeightManager.h44,
          child: CustomButton(
            label: 'auth.phone_input.button_send_otp'.tr(),
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) {
                setState(() => _autoValidate = true);
                return;
              }
              final fullPhone = '$countryCode$phoneNumber';
              widget.onValidSubmit(fullPhone);
            },
            type: ButtonType.elevated,
            textStyle: TextStyle(
              fontSize: FontSizeManager.s18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

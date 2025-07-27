import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/core/widgets/custom_status_dialog.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_state.dart';
import 'package:magicchat/features/auth/ui/widgets/logo_header.dart';
import 'package:magicchat/features/auth/ui/widgets/phone_input_form_with_button.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('auth.enter_phone'.tr())),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OtpSent) {
            Navigator.of(context).pushNamed(
              Routes.otpVerificationScreen,
              arguments: {
                'phoneNumber': state.phoneNumber,
                'sentOtpCode': state.verificationId,
              },
            );
          } else if (state is AlreadyLoggedIn) {
            showDialog(
              context: context,
              builder: (_) => CustomStatusDialog(
                title: 'auth.error_title_already_logged_in'.tr(),
                message: 'auth.error_msg_already_logged_in'.tr(),
                onConfirm: () {
                  context.pop();
                },
                statusType: DialogStatusType.error,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: WidthManager.w20,vertical: HeightManager.h100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LogoHeader(title: 'auth.logo_header.phone_input_title'.tr(), subtitle: 'auth.logo_header.phone_input_subtitle'.tr(),),
              SizedBox(height: HeightManager.h30),
              PhoneInputFormWithButton(
                onValidSubmit: (fullPhone) {
                  final authCubit = context.read<AuthCubit>();
                  authCubit.setPhoneNumber(fullPhone);
                  authCubit.sendOtp();
                },
              ),
              SizedBox(height: HeightManager.h20),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) => state.maybeWhen(
                  loading: () => const CircularProgressIndicator(),
                  authError: (message) => Text(
                    message,
                    style: const TextStyle(color: Colors.red),
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
